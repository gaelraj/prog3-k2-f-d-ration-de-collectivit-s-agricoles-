-- ============================================================
-- DONNÉES DE TEST - ÉVALUATION JEUDI 6 MAI 2026
-- À exécuter après :
-- 1) les trois collectivités
-- 2) les membres des trois collectivités
-- 3) les comptes financiers de base
-- ============================================================


-- ============================================================
-- 0. Mettre une date d'adhésion aux anciens membres
-- ============================================================

UPDATE collectivity_member
SET adhesion_date = '2026-01-01'
WHERE adhesion_date IS NULL;


-- ============================================================
-- 1. COMPTES FINANCIERS DE BASE DES 3 COLLECTIVITÉS
-- ============================================================

INSERT INTO financial_account (
    id,
    collectivity_id,
    account_type,
    amount,
    holder_name,
    mobile_banking_service,
    mobile_number,
    bank_name,
    bank_code,
    bank_branch_code,
    bank_account_number,
    bank_account_key
)
VALUES
    ('C1-A-CASH', 'col-1', 'CASH', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('C1-A-MOBILE-1', 'col-1', 'MOBILE_BANKING', 0, 'Mpanorina', 'ORANGE_MONEY', '0370489612', NULL, NULL, NULL, NULL, NULL),

    ('C2-A-CASH', 'col-2', 'CASH', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    ('C2-A-MOBILE-1', 'col-2', 'MOBILE_BANKING', 0, 'Dobo voalohany', 'ORANGE_MONEY', '0320489612', NULL, NULL, NULL, NULL, NULL),

    ('C3-A-CASH', 'col-3', 'CASH', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 2. NOUVEAUX COMPTES FINANCIERS DE LA COLLECTIVITÉ 3
-- ============================================================

INSERT INTO financial_account (
    id,
    collectivity_id,
    account_type,
    amount,
    holder_name,
    mobile_banking_service,
    mobile_number,
    bank_name,
    bank_code,
    bank_branch_code,
    bank_account_number,
    bank_account_key
)
VALUES
    ('C3-A-BANK-1', 'col-3', 'BANK', 0, 'Koto', NULL, NULL, 'BMOI', '00004', '00001', '1234567890', '12'),
    ('C3-A-BANK-2', 'col-3', 'BANK', 0, 'Naivo', NULL, NULL, 'BRED', '00008', '00003', '4567890123', '58'),
    ('C3-A-MOBILE-1', 'col-3', 'MOBILE_BANKING', 0, 'Kolo', 'MVOLA', '0341889612', NULL, NULL, NULL, NULL, NULL)
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 3. COTISATIONS DES 3 COLLECTIVITÉS
-- ============================================================

INSERT INTO membership_fee (
    id,
    collectivity_id,
    label,
    status,
    frequency,
    eligible_from,
    amount
)
VALUES
    -- Collectivité 1
    ('cot-1', 'col-1', 'Cotisation annuelle', 'ACTIVE', 'ANNUALLY', '2026-01-01', 200000),
    ('cot-2', 'col-1', 'Famangiana', 'ACTIVE', 'PUNCTUALLY', '2026-04-30', 20000),

    -- Collectivité 2
    ('cot-3', 'col-2', 'Cotisation annuelle', 'ACTIVE', 'ANNUALLY', '2026-01-01', 200000),
    ('cot-4', 'col-2', 'Cotisation 2025', 'INACTIVE', 'ANNUALLY', '2025-01-01', 100000),

    -- Collectivité 3
    ('cot-5', 'col-3', 'Cotisation mensuelle', 'ACTIVE', 'MONTHLY', '2026-04-01', 25000)
ON CONFLICT (id) DO UPDATE SET
                               collectivity_id = EXCLUDED.collectivity_id,
                               label = EXCLUDED.label,
                               status = EXCLUDED.status,
                               frequency = EXCLUDED.frequency,
                               eligible_from = EXCLUDED.eligible_from,
                               amount = EXCLUDED.amount;


-- ============================================================
-- 4. PAIEMENTS - COLLECTIVITÉ 1
-- ============================================================

INSERT INTO member_payment (
    id,
    member_id,
    collectivity_id,
    membership_fee_id,
    account_credited_id,
    amount,
    payment_mode,
    creation_date
)
VALUES
    ('pay-col1-C1M1-20260101', 'C1-M1', 'col-1', 'cot-1', 'C1-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col1-C1M2-20260101', 'C1-M2', 'col-1', 'cot-1', 'C1-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col1-C1M3-20260101', 'C1-M3', 'col-1', 'cot-1', 'C1-A-MOBILE-1', 200000, 'MOBILE_BANKING', '2026-01-01'),
    ('pay-col1-C1M4-20260101', 'C1-M4', 'col-1', 'cot-1', 'C1-A-MOBILE-1', 200000, 'MOBILE_BANKING', '2026-01-01'),
    ('pay-col1-C1M5-20260101', 'C1-M5', 'col-1', 'cot-1', 'C1-A-MOBILE-1', 150000, 'MOBILE_BANKING', '2026-01-01'),
    ('pay-col1-C1M6-20260501', 'C1-M6', 'col-1', 'cot-1', 'C1-A-CASH', 100000, 'CASH', '2026-05-01'),
    ('pay-col1-C1M7-20260501', 'C1-M7', 'col-1', 'cot-1', 'C1-A-CASH', 60000, 'CASH', '2026-05-01'),
    ('pay-col1-C1M8-20260501', 'C1-M8', 'col-1', 'cot-1', 'C1-A-CASH', 90000, 'CASH', '2026-05-01')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 5. PAIEMENTS - COLLECTIVITÉ 2
-- ============================================================

INSERT INTO member_payment (
    id,
    member_id,
    collectivity_id,
    membership_fee_id,
    account_credited_id,
    amount,
    payment_mode,
    creation_date
)
VALUES
    ('pay-col2-C1M1-20260101', 'C1-M1', 'col-2', 'cot-3', 'C2-A-CASH', 120000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M2-20260101', 'C1-M2', 'col-2', 'cot-3', 'C2-A-CASH', 180000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M3-20260101', 'C1-M3', 'col-2', 'cot-3', 'C2-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M4-20260101', 'C1-M4', 'col-2', 'cot-3', 'C2-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M5-20260101', 'C1-M5', 'col-2', 'cot-3', 'C2-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M6-20260101', 'C1-M6', 'col-2', 'cot-3', 'C2-A-CASH', 200000, 'CASH', '2026-01-01'),
    ('pay-col2-C1M7-20260101', 'C1-M7', 'col-2', 'cot-3', 'C2-A-MOBILE-1', 80000, 'MOBILE_BANKING', '2026-01-01'),
    ('pay-col2-C1M8-20260101', 'C1-M8', 'col-2', 'cot-3', 'C2-A-MOBILE-1', 120000, 'MOBILE_BANKING', '2026-01-01')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 6. PAIEMENTS - COLLECTIVITÉ 3
-- ============================================================

INSERT INTO member_payment (
    id,
    member_id,
    collectivity_id,
    membership_fee_id,
    account_credited_id,
    amount,
    payment_mode,
    creation_date
)
VALUES
    -- Paiements du 01/04/2026
    ('pay-col3-C3M1-20260401', 'C3-M1', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M2-20260401', 'C3-M2', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M3-20260401', 'C3-M3', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M4-20260401', 'C3-M4', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M5-20260401', 'C3-M5', 'col-3', 'cot-5', 'C3-A-BANK-2', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M6-20260401', 'C3-M6', 'col-3', 'cot-5', 'C3-A-BANK-2', 25000, 'BANK_TRANSFER', '2026-04-01'),
    ('pay-col3-C3M7-20260401', 'C3-M7', 'col-3', 'cot-5', 'C3-A-CASH', 25000, 'CASH', '2026-04-01'),
    ('pay-col3-C3M8-20260401', 'C3-M8', 'col-3', 'cot-5', 'C3-A-CASH', 25000, 'CASH', '2026-04-01'),

    -- Paiements du 01/05/2026
    ('pay-col3-C3M1-20260501', 'C3-M1', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M2-20260501', 'C3-M2', 'col-3', 'cot-5', 'C3-A-BANK-1', 25000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M3-20260501', 'C3-M3', 'col-3', 'cot-5', 'C3-A-MOBILE-1', 15000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M4-20260501', 'C3-M4', 'col-3', 'cot-5', 'C3-A-MOBILE-1', 15000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M5-20260501', 'C3-M5', 'col-3', 'cot-5', 'C3-A-BANK-2', 20000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M6-20260501', 'C3-M6', 'col-3', 'cot-5', 'C3-A-BANK-2', 25000, 'BANK_TRANSFER', '2026-05-01'),
    ('pay-col3-C3M7-20260501', 'C3-M7', 'col-3', 'cot-5', 'C3-A-CASH', 5000, 'CASH', '2026-05-01'),
    ('pay-col3-C3M8-20260501', 'C3-M8', 'col-3', 'cot-5', 'C3-A-CASH', 5000, 'CASH', '2026-05-01')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 7. TRANSACTIONS CORRESPONDANTES AUX PAIEMENTS
-- ============================================================
-- Le sujet dit que seules les données de paiement sont données,
-- mais il faut ajouter les transactions correspondantes.

INSERT INTO collectivity_transaction (
    id,
    collectivity_id,
    member_debited_id,
    account_credited_id,
    amount,
    payment_mode,
    creation_date
)
SELECT
    'tr-' || mp.id,
    mp.collectivity_id,
    mp.member_id,
    mp.account_credited_id,
    mp.amount,
    mp.payment_mode,
    mp.creation_date
FROM member_payment mp
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 8. NOUVEAUX MEMBRES ADHÉRENTS - COLLECTIVITÉ 1
-- ============================================================

INSERT INTO "member" (
    id,
    first_name,
    last_name,
    birth_date,
    gender,
    address,
    profession,
    phone_number,
    email,
    occupation,
    registration_fee_paid,
    membership_dues_paid
)
VALUES
    ('C1-N1', 'Nouveau prénom 1', 'Nouveau nom 1', '2000-01-01', 'MALE', 'Adresse C1 N1', 'Agriculteur', '0340000001', 'c1.n1@fed-agri.mg', 'JUNIOR', true, false),
    ('C1-N2', 'Nouveau prénom 2', 'Nouveau nom 2', '2000-01-02', 'FEMALE', 'Adresse C1 N2', 'Agriculteur', '0340000002', 'c1.n2@fed-agri.mg', 'JUNIOR', true, false),
    ('C1-N3', 'Nouveau prénom 3', 'Nouveau nom 3', '2000-01-03', 'MALE', 'Adresse C1 N3', 'Agriculteur', '0340000003', 'c1.n3@fed-agri.mg', 'JUNIOR', true, false),
    ('C1-N4', 'Nouveau prénom 4', 'Nouveau nom 4', '2000-01-04', 'FEMALE', 'Adresse C1 N4', 'Agriculteur', '0340000004', 'c1.n4@fed-agri.mg', 'JUNIOR', true, false)
ON CONFLICT (id) DO NOTHING;

INSERT INTO collectivity_member (id, member_id, collectivity_id, adhesion_date)
VALUES
    ('cm-col1-C1N1', 'C1-N1', 'col-1', '2026-04-01'),
    ('cm-col1-C1N2', 'C1-N2', 'col-1', '2026-04-01'),
    ('cm-col1-C1N3', 'C1-N3', 'col-1', '2026-05-01'),
    ('cm-col1-C1N4', 'C1-N4', 'col-1', '2026-06-01')
ON CONFLICT (id) DO NOTHING;

INSERT INTO member_referee (id, member_refereed_id, member_referee_id)
VALUES
    ('mr-C1N1-C1M1', 'C1-N1', 'C1-M1'),
    ('mr-C1N1-C1M2', 'C1-N1', 'C1-M2'),
    ('mr-C1N2-C1M1', 'C1-N2', 'C1-M1'),
    ('mr-C1N2-C1M2', 'C1-N2', 'C1-M2'),
    ('mr-C1N3-C1M1', 'C1-N3', 'C1-M1'),
    ('mr-C1N3-C1M2', 'C1-N3', 'C1-M2'),
    ('mr-C1N4-C1M1', 'C1-N4', 'C1-M1'),
    ('mr-C1N4-C1M2', 'C1-N4', 'C1-M2')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 9. NOUVEAUX MEMBRES ADHÉRENTS - COLLECTIVITÉ 2
-- ============================================================

INSERT INTO "member" (
    id,
    first_name,
    last_name,
    birth_date,
    gender,
    address,
    profession,
    phone_number,
    email,
    occupation,
    registration_fee_paid,
    membership_dues_paid
)
VALUES
    ('C2-N1', 'Nouveau prénom 5', 'Nouveau nom 5', '2001-01-01', 'MALE', 'Adresse C2 N1', 'Agriculteur', '0340000005', 'c2.n1@fed-agri.mg', 'JUNIOR', true, false),
    ('C2-N2', 'Nouveau prénom 6', 'Nouveau nom 6', '2001-01-02', 'FEMALE', 'Adresse C2 N2', 'Agriculteur', '0340000006', 'c2.n2@fed-agri.mg', 'JUNIOR', true, false),
    ('C2-N3', 'Nouveau prénom 7', 'Nouveau nom 7', '2001-01-03', 'MALE', 'Adresse C2 N3', 'Agriculteur', '0340000007', 'c2.n3@fed-agri.mg', 'JUNIOR', true, false)
ON CONFLICT (id) DO NOTHING;

INSERT INTO collectivity_member (id, member_id, collectivity_id, adhesion_date)
VALUES
    ('cm-col2-C2N1', 'C2-N1', 'col-2', '2026-03-01'),
    ('cm-col2-C2N2', 'C2-N2', 'col-2', '2026-03-01'),
    ('cm-col2-C2N3', 'C2-N3', 'col-2', '2026-03-01')
ON CONFLICT (id) DO NOTHING;

INSERT INTO member_referee (id, member_refereed_id, member_referee_id)
VALUES
    ('mr-C2N1-C1M1', 'C2-N1', 'C1-M1'),
    ('mr-C2N1-C1M2', 'C2-N1', 'C1-M2'),
    ('mr-C2N2-C1M1', 'C2-N2', 'C1-M1'),
    ('mr-C2N2-C1M2', 'C2-N2', 'C1-M2'),
    ('mr-C2N3-C1M1', 'C2-N3', 'C1-M1'),
    ('mr-C2N3-C1M2', 'C2-N3', 'C1-M2')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 10. NOUVEAUX MEMBRES ADHÉRENTS - COLLECTIVITÉ 3
-- ============================================================

INSERT INTO "member" (
    id,
    first_name,
    last_name,
    birth_date,
    gender,
    address,
    profession,
    phone_number,
    email,
    occupation,
    registration_fee_paid,
    membership_dues_paid
)
VALUES
    ('C3-N1', 'Nouveau prénom 8', 'Nouveau nom 8', '2002-01-01', 'MALE', 'Adresse C3 N1', 'Apiculteur', '0340000008', 'c3.n1@fed-agri.mg', 'JUNIOR', true, false),
    ('C3-N2', 'Nouveau prénom 9', 'Nouveau nom 9', '2002-01-02', 'FEMALE', 'Adresse C3 N2', 'Apiculteur', '0340000009', 'c3.n2@fed-agri.mg', 'JUNIOR', true, false),
    ('C3-N3', 'Nouveau prénom 10', 'Nouveau nom 10', '2002-01-03', 'MALE', 'Adresse C3 N3', 'Apiculteur', '0340000010', 'c3.n3@fed-agri.mg', 'JUNIOR', true, false),
    ('C3-N4', 'Nouveau prénom 11', 'Nouveau nom 11', '2002-01-04', 'FEMALE', 'Adresse C3 N4', 'Apiculteur', '0340000011', 'c3.n4@fed-agri.mg', 'JUNIOR', true, false),
    ('C3-N5', 'Nouveau prénom 12', 'Nouveau nom 12', '2002-01-05', 'MALE', 'Adresse C3 N5', 'Apiculteur', '0340000012', 'c3.n5@fed-agri.mg', 'JUNIOR', true, false),
    ('C3-N6', 'Nouveau prénom 13', 'Nouveau nom 13', '2002-01-06', 'FEMALE', 'Adresse C3 N6', 'Apiculteur', '0340000013', 'c3.n6@fed-agri.mg', 'JUNIOR', true, false)
ON CONFLICT (id) DO NOTHING;

INSERT INTO collectivity_member (id, member_id, collectivity_id, adhesion_date)
VALUES
    ('cm-col3-C3N1', 'C3-N1', 'col-3', '2026-01-01'),
    ('cm-col3-C3N2', 'C3-N2', 'col-3', '2026-02-01'),
    ('cm-col3-C3N3', 'C3-N3', 'col-3', '2026-02-01'),
    ('cm-col3-C3N4', 'C3-N4', 'col-3', '2026-03-01'),
    ('cm-col3-C3N5', 'C3-N5', 'col-3', '2026-03-01'),
    ('cm-col3-C3N6', 'C3-N6', 'col-3', '2026-03-01')
ON CONFLICT (id) DO NOTHING;

INSERT INTO member_referee (id, member_refereed_id, member_referee_id)
VALUES
    ('mr-C3N1-C3M1', 'C3-N1', 'C3-M1'),
    ('mr-C3N1-C3M2', 'C3-N1', 'C3-M2'),
    ('mr-C3N2-C3M1', 'C3-N2', 'C3-M1'),
    ('mr-C3N2-C3M2', 'C3-N2', 'C3-M2'),
    ('mr-C3N3-C3M1', 'C3-N3', 'C3-M1'),
    ('mr-C3N3-C3M2', 'C3-N3', 'C3-M2'),
    ('mr-C3N4-C3M1', 'C3-N4', 'C3-M1'),
    ('mr-C3N4-C3M2', 'C3-N4', 'C3-M2'),
    ('mr-C3N5-C3M1', 'C3-N5', 'C3-M1'),
    ('mr-C3N5-C3M2', 'C3-N5', 'C3-M2'),
    ('mr-C3N6-C3M1', 'C3-N6', 'C3-M1'),
    ('mr-C3N6-C3M2', 'C3-N6', 'C3-M2')
ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 11. MISE À JOUR DES SOLDES DES COMPTES
-- ============================================================
-- Comme les paiements créditent les comptes, on met à jour le solde
-- à partir des paiements enregistrés.

UPDATE financial_account fa
SET amount = payment_total.total_amount
FROM (
         SELECT
             account_credited_id,
             SUM(amount) AS total_amount
         FROM member_payment
         GROUP BY account_credited_id
     ) payment_total
WHERE fa.id = payment_total.account_credited_id;