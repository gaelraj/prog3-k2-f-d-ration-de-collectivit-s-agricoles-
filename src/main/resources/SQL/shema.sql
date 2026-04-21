-- 1. Types énumérés

CREATE TYPE genre_membre AS ENUM ('F', 'M');

CREATE TYPE type_poste AS ENUM (
    'PRESIDENT',
    'PRESIDENT_ADJOINT',
    'TRESORIER',
    'SECRETAIRE',
    'MEMBRE_CONFIRME',
    'MEMBRE_JUNIOR'
);

CREATE TYPE type_cotisation AS ENUM ('MENSUELLE', 'ANNUELLE', 'PONCTUELLE');

CREATE TYPE mode_paiement AS ENUM ('ESPECE', 'VIREMENT', 'MOBILE_MONEY');

CREATE TYPE type_compte AS ENUM ('CAISSE', 'BANCAIRE', 'MOBILE_MONEY');

CREATE TYPE type_activite AS ENUM ('AG_MENSUELLE', 'FORMATION_JUNIOR', 'EXCEPTIONNELLE');

CREATE TYPE cible_activite AS ENUM ('TOUS', 'JUNIORS', 'SPECIFIQUE');

-- Collectivité
CREATE TABLE collectivite (
                              id                      SERIAL PRIMARY KEY,
                              numero_unique           VARCHAR(50) NOT NULL UNIQUE,
                              nom                     VARCHAR(100) NOT NULL UNIQUE,
                              specialite_agricole     VARCHAR(100) NOT NULL,
                              ville                   VARCHAR(100) NOT NULL,
                              date_creation           DATE NOT NULL,
                              autorisation_federation BOOLEAN NOT NULL DEFAULT FALSE
);

-- Membre
CREATE TABLE membre (
                        id             SERIAL PRIMARY KEY,
                        nom            VARCHAR(100) NOT NULL,
                        prenom         VARCHAR(100) NOT NULL,
                        date_naissance DATE NOT NULL,
                        genre          genre_membre NOT NULL,
                        adresse        TEXT NOT NULL,
                        metier         VARCHAR(100) NOT NULL,
                        telephone      VARCHAR(20) NOT NULL,
                        email          VARCHAR(150) NOT NULL UNIQUE,
                        date_adhesion  DATE NOT NULL DEFAULT CURRENT_DATE,
                        actif          BOOLEAN NOT NULL DEFAULT TRUE
);

-- Poste (référentiel)
CREATE TABLE poste (
                       id      SERIAL PRIMARY KEY,
                       libelle type_poste NOT NULL UNIQUE
);

INSERT INTO poste (libelle) VALUES
                                ('PRESIDENT'),
                                ('PRESIDENT_ADJOINT'),
                                ('TRESORIER'),
                                ('SECRETAIRE'),
                                ('MEMBRE_CONFIRME'),
                                ('MEMBRE_JUNIOR')
    ON CONFLICT (libelle) DO NOTHING;

-- Adhésion d'un membre à une collectivité
CREATE TABLE adhesion (
                          id               SERIAL PRIMARY KEY,
                          membre_id        INTEGER NOT NULL REFERENCES membre(id) ON DELETE CASCADE,
                          collectivite_id  INTEGER NOT NULL REFERENCES collectivite(id) ON DELETE CASCADE,
                          poste_id         INTEGER NOT NULL REFERENCES poste(id),
                          date_debut       DATE NOT NULL DEFAULT CURRENT_DATE,
                          date_fin         DATE,
                          est_actif        BOOLEAN NOT NULL DEFAULT TRUE,
                          UNIQUE (membre_id, collectivite_id, date_debut)
);

-- Mandat (postes spécifiques dans une collectivité ou fédération)
CREATE TABLE mandat (
                        id                 SERIAL PRIMARY KEY,
                        adhesion_id        INTEGER NOT NULL REFERENCES adhesion(id) ON DELETE CASCADE,
                        annee              INTEGER NOT NULL CHECK (annee >= 2000),
                        poste_specifique   type_poste NOT NULL CHECK (
                            poste_specifique IN ('PRESIDENT', 'PRESIDENT_ADJOINT', 'TRESORIER', 'SECRETAIRE')
                            ),
                        est_federation     BOOLEAN NOT NULL DEFAULT FALSE,
                        UNIQUE (adhesion_id, annee, poste_specifique, est_federation)
);

-- Direction de la fédération (mandat de 2 ans)
CREATE TABLE direction_federation (
                                      id              SERIAL PRIMARY KEY,
                                      membre_id       INTEGER NOT NULL REFERENCES membre(id),
                                      poste_id        INTEGER NOT NULL REFERENCES poste(id) CHECK (
                                          poste_id IN (SELECT id FROM poste WHERE libelle IN ('PRESIDENT','PRESIDENT_ADJOINT','TRESORIER','SECRETAIRE'))
                                          ),
                                      date_debut      DATE NOT NULL,
                                      date_fin        DATE NOT NULL,
                                      CHECK (date_fin > date_debut),
                                      CHECK (date_fin - date_debut >= INTERVAL '2 years')
    );

-- Parrainage
CREATE TABLE parrainage (
                            id                    SERIAL PRIMARY KEY,
                            parrain_id            INTEGER NOT NULL REFERENCES membre(id),
                            filleul_id            INTEGER REFERENCES membre(id), -- null avant admission
                            candidat_externe_info JSONB,
                            nature_relation       VARCHAR(50) NOT NULL,
                            collectivite_cible_id INTEGER NOT NULL REFERENCES collectivite(id),
                            date_parrainage       DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Définition des cotisations par collectivité
CREATE TABLE cotisation_definition (
                                       id               SERIAL PRIMARY KEY,
                                       collectivite_id  INTEGER NOT NULL REFERENCES collectivite(id) ON DELETE CASCADE,
                                       libelle          VARCHAR(100) NOT NULL,
                                       type_cotisation  type_cotisation NOT NULL,
                                       montant          DECIMAL(12,2) NOT NULL CHECK (montant >= 0),
                                       obligatoire      BOOLEAN NOT NULL DEFAULT FALSE
);

-- Paiements (frais d'adhésion ou cotisations)
CREATE TABLE paiement (
                          id                     SERIAL PRIMARY KEY,
                          membre_id              INTEGER NOT NULL REFERENCES membre(id),
                          cotisation_definition_id INTEGER REFERENCES cotisation_definition(id),
                          montant                DECIMAL(12,2) NOT NULL CHECK (montant >= 0),
                          date_paiement          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          mode_paiement          mode_paiement NOT NULL,
                          reference_transaction  VARCHAR(100),
                          est_frais_adhesion     BOOLEAN NOT NULL DEFAULT FALSE,
                          CONSTRAINT frais_ou_cotisation CHECK (
                              (est_frais_adhesion = TRUE AND cotisation_definition_id IS NULL) OR
                              (est_frais_adhesion = FALSE AND cotisation_definition_id IS NOT NULL)
                              )
);

-- Comptes financiers (collectivité ou fédération)
CREATE TABLE compte (
                        id                SERIAL PRIMARY KEY,
                        type_compte       type_compte NOT NULL,
                        titulaire         VARCHAR(150) NOT NULL,
                        banque            VARCHAR(50) CHECK (
                            type_compte != 'BANCAIRE' OR banque IS NOT NULL
),
    numero_compte     VARCHAR(23) CHECK (
        type_compte != 'BANCAIRE' OR (numero_compte ~ '^[0-9]{23}$')
    ),
    service_mobile    VARCHAR(50) CHECK (
        type_compte != 'MOBILE_MONEY' OR service_mobile IS NOT NULL
    ),
    numero_telephone  VARCHAR(20) CHECK (
        type_compte != 'MOBILE_MONEY' OR numero_telephone IS NOT NULL
    ),
    collectivite_id   INTEGER REFERENCES collectivite(id) ON DELETE CASCADE,
    est_federation    BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT unique_caisse_par_entite UNIQUE (collectivite_id, type_compte, est_federation)
        DEFERRABLE INITIALLY DEFERRED
);

-- Solde des comptes
CREATE TABLE solde_compte (
                              id          SERIAL PRIMARY KEY,
                              compte_id   INTEGER NOT NULL REFERENCES compte(id) ON DELETE CASCADE,
                              date_solde  DATE NOT NULL,
                              solde       DECIMAL(15,2) NOT NULL DEFAULT 0,
                              UNIQUE (compte_id, date_solde)
);

-- Activités
CREATE TABLE activite (
                          id               SERIAL PRIMARY KEY,
                          type_activite    type_activite NOT NULL,
                          titre            VARCHAR(200) NOT NULL,
                          description      TEXT,
                          date_activite    DATE NOT NULL,
                          heure_debut      TIME,
                          obligatoire      BOOLEAN NOT NULL DEFAULT FALSE,
                          cible            cible_activite NOT NULL DEFAULT 'TOUS',
                          collectivite_id  INTEGER REFERENCES collectivite(id) ON DELETE CASCADE,
                          est_federation   BOOLEAN NOT NULL DEFAULT FALSE,
                          CHECK (
                              (est_federation = TRUE AND collectivite_id IS NULL) OR
                              (est_federation = FALSE AND collectivite_id IS NOT NULL)
                              )
);

-- Présences aux activités
CREATE TABLE presence (
                          id           SERIAL PRIMARY KEY,
                          activite_id  INTEGER NOT NULL REFERENCES activite(id) ON DELETE CASCADE,
                          membre_id    INTEGER NOT NULL REFERENCES membre(id),
                          present      BOOLEAN NOT NULL DEFAULT FALSE,
                          excuse       BOOLEAN NOT NULL DEFAULT FALSE,
                          motif_excuse TEXT,
                          UNIQUE (activite_id, membre_id)
);

-- Statistiques mensuelles de collectivité
CREATE TABLE statistique_collectivite_mensuelle (
                                                    id                     SERIAL PRIMARY KEY,
                                                    collectivite_id        INTEGER NOT NULL REFERENCES collectivite(id) ON DELETE CASCADE,
                                                    mois                   DATE NOT NULL, -- premier jour du mois
                                                    taux_assiduite_global  DECIMAL(5,2) CHECK (taux_assiduite_global BETWEEN 0 AND 100),
                                                    nombre_membres_actifs  INTEGER NOT NULL CHECK (nombre_membres_actifs >= 0),
                                                    UNIQUE (collectivite_id, mois)
);

-- Statistiques mensuelles de la fédération
CREATE TABLE statistique_federation_mensuelle (
                                                  id                                 SERIAL PRIMARY KEY,
                                                  mois                               DATE NOT NULL,
                                                  collectivite_id                    INTEGER NOT NULL REFERENCES collectivite(id) ON DELETE CASCADE,
                                                  taux_assiduite                     DECIMAL(5,2) CHECK (taux_assiduite BETWEEN 0 AND 100),
                                                  pourcentage_membres_a_jour_cotis   DECIMAL(5,2) CHECK (pourcentage_membres_a_jour_cotis BETWEEN 0 AND 100),
                                                  nombre_nouveaux_adherents          INTEGER NOT NULL CHECK (nombre_nouveaux_adherents >= 0),
                                                  UNIQUE (mois, collectivite_id)
);

-- 3. Index pour les performances

CREATE INDEX idx_adhesion_membre ON adhesion(membre_id);
CREATE INDEX idx_adhesion_collectivite ON adhesion(collectivite_id);
CREATE INDEX idx_mandat_adhesion ON mandat(adhesion_id);
CREATE INDEX idx_parrainage_parrain ON parrainage(parrain_id);
CREATE INDEX idx_parrainage_filleul ON parrainage(filleul_id);
CREATE INDEX idx_cotisation_collectivite ON cotisation_definition(collectivite_id);
CREATE INDEX idx_paiement_membre ON paiement(membre_id);
CREATE INDEX idx_compte_collectivite ON compte(collectivite_id);
CREATE INDEX idx_solde_compte ON solde_compte(compte_id);
CREATE INDEX idx_activite_collectivite ON activite(collectivite_id);
CREATE INDEX idx_presence_activite ON presence(activite_id);
CREATE INDEX idx_presence_membre ON presence(membre_id);
CREATE INDEX idx_stat_collectivite_mois ON statistique_collectivite_mensuelle(collectivite_id, mois);
CREATE INDEX idx_stat_federation_mois ON statistique_federation_mensuelle(mois);

COMMENT ON TABLE collectivite IS 'Collectivités agricoles locales';
COMMENT ON TABLE membre IS 'Membres individuels de la fédération';
COMMENT ON TABLE adhesion IS 'Lien entre un membre et une collectivité avec son poste';
COMMENT ON TABLE mandat IS 'Mandats annuels pour les postes spécifiques';
COMMENT ON TABLE direction_federation IS 'Direction de la fédération (mandat 2 ans)';
COMMENT ON TABLE parrainage IS 'Parrainage des nouveaux candidats';
COMMENT ON TABLE cotisation_definition IS 'Types de cotisations définies par collectivité';
COMMENT ON TABLE paiement IS 'Paiements effectués par les membres';
COMMENT ON TABLE compte IS 'Comptes financiers des collectivités et de la fédération';
COMMENT ON TABLE solde_compte IS 'Historique des soldes de comptes';
COMMENT ON TABLE activite IS 'Activités organisées par les collectivités ou la fédération';
COMMENT ON TABLE presence IS 'Présences aux activités';
COMMENT ON TABLE statistique_collectivite_mensuelle IS 'Rapport mensuel remonté par le président';
COMMENT ON TABLE statistique_federation_mensuelle IS 'Rapport consolidé par la fédération';