-- Création d'un utilisateur dédié (optionnel)
CREATE USER federation_user WITH PASSWORD 'change_me_in_production';

-- Création de la base de données
CREATE DATABASE federation_agricole

-- Attribution des privilèges sur le schéma public
GRANT ALL PRIVILEGES ON SCHEMA public TO federation_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO federation_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO federation_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO federation_user;