-- =====================================================
-- INSERTION DES COLLECTIVITÉS
-- =====================================================

INSERT INTO collectivity (code, number, name, location, agricultural_specialty, creation_date, authorization_status, annual_contribution_amount) VALUES
                                                                                                                                                     ('col-1', '1', 'Mpanorina', 'Ambatondrazaka', 'Riziculture', '2026-01-01', true, 100000),
                                                                                                                                                     ('col-2', '2', 'Dobo voalohany', 'Ambatondrazaka', 'Pisciculture', '2026-01-01', true, 100000),
                                                                                                                                                     ('col-3', '3', 'Tantely mamy', 'Brickaville', 'Apiculture', '2026-01-01', true, 50000);


-- =====================================================
-- INSERTION DES MEMBRES (16 membres)
-- =====================================================

INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
-- Membres 1 à 8 (pour collectivités 1 et 2)
('Nom membre 1', 'Prénom membre 1', '1980-02-01', 'MALE', 'Lot II V M Ambatondrazaka', 'Riziculteur', '0341234567', 'member.1@fed-agri.mg'),
('Nom membre 2', 'Prénom membre 2', '1982-03-05', 'MALE', 'Lot II F Ambatondrazaka', 'Agriculteur', '0321234567', 'member.2@fed-agri.mg'),
('Nom membre 3', 'Prénom membre 3', '1992-03-10', 'MALE', 'Lot II J Ambatondrazaka', 'Collecteur', '0331234567', 'member.3@fed-agri.mg'),
('Nom membre 4', 'Prénom membre 4', '1988-05-22', 'FEMALE', 'Lot A K 50 Ambatondrazaka', 'Distributeur', '0381234567', 'member.4@fed-agri.mg'),
('Nom membre 5', 'Prénom membre 5', '1999-08-21', 'MALE', 'Lot UV 80 Ambatondrazaka', 'Riziculteur', '0373434567', 'member.5@fed-agri.mg'),
('Nom membre 6', 'Prénom membre 6', '1998-08-22', 'FEMALE', 'Lot UV 6 Ambatondrazaka', 'Riziculteur', '0372234567', 'member.6@fed-agri.mg'),
('Nom membre 7', 'Prénom membre 7', '1998-01-31', 'MALE', 'Lot UV 7 Ambatondrazaka', 'Riziculteur', '0374234567', 'member.7@fed-agri.mg'),
('Nom membre 8', 'Prénom membre 8', '1975-08-20', 'MALE', 'Lot UV 8 Ambatondrazaka', 'Riziculteur', '0370234567', 'member.8@fed-agri.mg'),

-- Membres 9 à 16 (pour collectivité 3)
('Nom membre 9', 'Prénom membre 9', '1988-01-02', 'MALE', 'Lot 33 J Antsirabe', 'Apiculteur', '034034567', 'member.9@fed-agri.mg'),
('Nom membre 10', 'Prénom membre 10', '1982-03-05', 'MALE', 'Lot 2 J Antsirabe', 'Agriculteur', '0338634567', 'member.10@fed-agri.mg'),
('Nom membre 11', 'Prénom membre 11', '1992-03-12', 'MALE', 'Lot 8 KM Antsirabe', 'Collecteur', '0338234567', 'member.11@fed-agri.mg'),
('Nom membre 12', 'Prénom membre 12', '1988-05-10', 'FEMALE', 'Lot A K 50 Antsirabe', 'Distributeur', '0382334567', 'member.12@fed-agri.mg'),
('Nom membre 13', 'Prénom membre 13', '1999-08-11', 'MALE', 'Lot UV 80 Antsirabe', 'Apiculteur', '0373365567', 'member.13@fed-agri.mg'),
('Nom membre 14', 'Prénom membre 14', '1998-08-09', 'FEMALE', 'Lot UV 6 Antsirabe', 'Apiculteur', '0378234567', 'member.14@fed-agri.mg'),
('Nom membre 15', 'Prénom membre 15', '1998-01-13', 'MALE', 'Lot UV 7 Antsirabe', 'Apiculteur', '0374914567', 'member.15@fed-agri.mg'),
('Nom membre 16', 'Prénom membre 16', '1975-08-02', 'MALE', 'Lot UV 8 Antsirabe', 'Apiculteur', '0370634567', 'member.16@fed-agri.mg');

-- =====================================================
-- INSERTION DES MEMBERSHIPS (liaison membre-collectivité)
-- =====================================================

-- Collectivité 1 (col-1)
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active, admission_fee_paid, membership_dues_paid) VALUES
                                                                                                                                          ('C1-M1', 1, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M2', 2, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M3', 3, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M4', 4, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M5', 5, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M6', 6, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M7', 7, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C1-M8', 8, 1, '2026-01-01', 'CONFIRMED', true, true, true);

-- Collectivité 2 (col-2)
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active, admission_fee_paid, membership_dues_paid) VALUES
                                                                                                                                          ('C2-M1', 1, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M2', 2, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M3', 3, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M4', 4, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M5', 5, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M6', 6, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M7', 7, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C2-M8', 8, 2, '2026-01-01', 'CONFIRMED', true, true, true);

-- Collectivité 3 (col-3)
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active, admission_fee_paid, membership_dues_paid) VALUES
                                                                                                                                          ('C3-M1', 9, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M2', 10, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M3', 11, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M4', 12, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M5', 13, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M6', 14, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M7', 15, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                          ('C3-M8', 16, 3, '2026-01-01', 'CONFIRMED', true, true, true);


-- =====================================================
-- INSERTION DES MANDATS (postes spécifiques)
-- =====================================================

-- Collectivité 1
-- President: C1-M1
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C1-M1' AND p.name = 'PRESIDENT';

-- Vice President: C1-M2
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C1-M2' AND p.name = 'VICE_PRESIDENT';

-- Secretary: C1-M3
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C1-M3' AND p.name = 'SECRETARY';

-- Treasurer: C1-M4
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C1-M4' AND p.name = 'TREASURER';

-- Collectivité 2
-- President: C2-M5
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C2-M5' AND p.name = 'PRESIDENT';

-- Vice President: C2-M6
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C2-M6' AND p.name = 'VICE_PRESIDENT';

-- Secretary: C2-M7
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C2-M7' AND p.name = 'SECRETARY';

-- Treasurer: C2-M8
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C2-M8' AND p.name = 'TREASURER';

-- Collectivité 3
-- President: C3-M1
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C3-M1' AND p.name = 'PRESIDENT';

-- Vice President: C3-M2
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C3-M2' AND p.name = 'VICE_PRESIDENT';

-- Secretary: C3-M3
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C3-M3' AND p.name = 'SECRETARY';

-- Treasurer: C3-M4
INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT ms.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership ms, position p
WHERE ms.code = 'C3-M4' AND p.name = 'TREASURER';

-- =====================================================
-- INSERTION DES SPONSORSHIP RELATIONS (parrainages)
-- =====================================================

-- Collectivité 1
-- C1-M3 parrainé par C1-M1 et C1-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C1-M3';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C1-M3';

-- C1-M4 parrainé par C1-M1 et C1-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C1-M4';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C1-M4';

-- C1-M5 parrainé par C1-M1 et C1-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'famille'
FROM membership ms
WHERE ms.code = 'C1-M5';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'famille'
FROM membership ms
WHERE ms.code = 'C1-M5';

-- C1-M6 parrainé par C1-M1 et C1-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C1-M6';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C1-M6';

-- C1-M7 parrainé par C1-M1 et C1-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C1-M7';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C1-M7';

-- C1-M8 parrainé par C1-M6 et C1-M7
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M6'), 'famille'
FROM membership ms
WHERE ms.code = 'C1-M8';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M7'), 'famille'
FROM membership ms
WHERE ms.code = 'C1-M8';

-- Collectivité 2
-- C2-M3 parrainé par C2-M1 et C2-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C2-M3';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C2-M3';

-- C2-M4 parrainé par C2-M1 et C2-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C2-M4';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C2-M4';

-- C2-M5 parrainé par C2-M1 et C2-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'famille'
FROM membership ms
WHERE ms.code = 'C2-M5';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'famille'
FROM membership ms
WHERE ms.code = 'C2-M5';

-- C2-M6 parrainé par C2-M1 et C2-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C2-M6';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C2-M6';

-- C2-M7 parrainé par C2-M1 et C2-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C2-M7';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C2-M7';

-- C2-M8 parrainé par C2-M6 et C2-M7
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M6'), 'famille'
FROM membership ms
WHERE ms.code = 'C2-M8';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M7'), 'famille'
FROM membership ms
WHERE ms.code = 'C2-M8';

-- Collectivité 3

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M1';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M1';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M2';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M2';

-- C3-M3 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M3';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M3';

-- C3-M4 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C3-M4';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C3-M4';

-- C3-M5 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'famille'
FROM membership ms
WHERE ms.code = 'C3-M5';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'famille'
FROM membership ms
WHERE ms.code = 'C3-M5';

-- C3-M6 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M6';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'ami'
FROM membership ms
WHERE ms.code = 'C3-M6';

-- C3-M7 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'collegue'
FROM membership ms
WHERE ms.code = 'C3-M7';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'collegue'
FROM membership ms
WHERE ms.code = 'C3-M7';

-- C3-M8 parrainé par C3-M1 et C3-M2
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'famille'
FROM membership ms
WHERE ms.code = 'C3-M8';

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'famille'
FROM membership ms
WHERE ms.code = 'C3-M8';

INSERT INTO account (code, collectivity_id, account_type, holder_name, mobile_service, phone_number, initial_amount) VALUES
                                                                                                                         ('C1-A-CASH', 1, 'CASH', '-', NULL, NULL, 0),
                                                                                                                         ('C1-A-MOBILE-1', 1, 'ORANGE_MONEY', 'Mpanorina', 'ORANGE_MONEY', '0370489612', 0),
                                                                                                                         ('C2-A-CASH', 2, 'CASH', '-', NULL, NULL, 0),
                                                                                                                         ('C2-A-MOBILE-1', 2, 'ORANGE_MONEY', 'Dobo voalohany', 'ORANGE_MONEY', '0320489612', 0),
                                                                                                                         ('C3-A-CASH', 3, 'CASH', '-', NULL, NULL, 0);

INSERT INTO account (code, collectivity_id, account_type, holder_name, bank_name, account_number, bank_code, branch_code, account_key, mobile_service, phone_number, initial_amount) VALUES
                                                                                                                                                                                         ('C3-A-BANK-1', 3, 'BANK', 'Koto', 'BMOI', '1234567890', '00004', '00001', '12', NULL, NULL, 0),
                                                                                                                                                                                         ('C3-A-BANK-2', 3, 'BANK', 'Naivo', 'BRED', '4567890123', '00008', '00003', '58', NULL, NULL, 0),
                                                                                                                                                                                         ('C3-A-MOBILE-1', 3, 'MVOLA', 'Kolo', NULL, NULL, NULL, NULL, NULL, 'MVOLA', '0341889612', 0);


INSERT INTO membership_fee (code, collectivity_id, label, status, frequency, eligible_from, amount) VALUES
                                                                                                        ('cot-1', 1, 'Cotisation annuelle', 'ACTIVE', 'ANNUALLY', '2026-01-01', 200000),
                                                                                                        ('cot-2', 1, 'Famangiana', 'ACTIVE', 'PUNCTUALLY', '2026-04-30', 20000);

INSERT INTO membership_fee (code, collectivity_id, label, status, frequency, eligible_from, amount) VALUES
                                                                                                        ('cot-3', 2, 'Cotisation annuelle', 'ACTIVE', 'ANNUALLY', '2026-01-01', 200000),
                                                                                                        ('cot-4', 2, 'Cotisation 2025', 'INACTIVE', 'ANNUALLY', '2025-01-01', 100000);

INSERT INTO membership_fee (code, collectivity_id, label, status, frequency, eligible_from, amount) VALUES
    ('cot-5', 3, 'Cotisation mensuelle', 'ACTIVE', 'MONTHLY', '2026-04-01', 25000);

-- =====================================================
-- PAIEMENTS (contribution) ET TRANSACTIONS (transaction)
-- Collectivité 1
-- =====================================================

-- 1. C1-M1
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M1';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, m.id, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, member m, account a
WHERE c.code = 'col-1' AND m.id = 1 AND a.code = 'C1-A-CASH';

-- 2. C1-M2
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M2';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 2, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-CASH';

-- 3. C1-M3
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M3';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 3, 200000, '2026-01-01', 'MOBILE_MONEY', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-MOBILE-1';

-- 4. C1-M4
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M4';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 4, 200000, '2026-01-01', 'MOBILE_MONEY', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-MOBILE-1';

-- 5. C1-M5
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 150000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M5';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 5, 150000, '2026-01-01', 'MOBILE_MONEY', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-MOBILE-1';

-- 6. C1-M6
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 100000, '2026-05-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M6';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 6, 100000, '2026-05-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-CASH';

-- 7. C1-M7
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 60000, '2026-05-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M7';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 7, 60000, '2026-05-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-CASH';

-- 8. C1-M8
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 90000, '2026-05-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C1-M8';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 8, 90000, '2026-05-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-1' AND a.code = 'C1-A-CASH';


-- =====================================================
-- PAIEMENTS (contribution) ET TRANSACTIONS (transaction)
-- Collectivité 2
-- =====================================================

-- 1. C1-M1
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 120000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M1';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, m.id, 120000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, member m, account a
WHERE c.code = 'col-2' AND m.id = 1 AND a.code = 'C2-A-CASH';

-- 2. C1-M2
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 180000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M2';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 2, 180000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-CASH';

-- 3. C1-M3
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M3';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 3, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-CASH';

-- 4. C1-M4
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M4';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 4, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-CASH';

-- 5. C1-M5
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M5';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 5, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-CASH';

-- 6. C1-M6
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 200000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M6';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 6, 200000, '2026-01-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-CASH';

-- 7. C1-M7
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 80000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M7';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 7, 80000, '2026-01-01', 'MOBILE_MONEY', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-MOBILE-1';

-- 8. C1-M8
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 120000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C2-M8';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 8, 120000, '2026-01-01', 'MOBILE_MONEY', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-2' AND a.code = 'C2-A-MOBILE-1';

-- =====================================================
-- PAIEMENTS (contribution) ET TRANSACTIONS (transaction)
-- Collectivité 3
-- =====================================================

-- 1. C3-M1 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M1';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, m.id, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, member m, account a
WHERE c.code = 'col-3' AND m.id = 9 AND a.code = 'C3-A-BANK-1';

-- 2. C3-M2 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M2';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 10, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-1';

-- 3. C3-M3 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M3';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 11, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-1';

-- 4. C3-M4 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M4';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 12, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-1';

-- 5. C3-M5 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M5';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 13, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-2';

-- 6. C3-M6 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M6';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 14, 25000, '2026-04-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-2';

-- 7. C3-M7 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M7';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 15, 25000, '2026-04-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-CASH';

-- 8. C3-M8 - Avril
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-04-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M8';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 16, 25000, '2026-04-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-CASH';

-- 9. C3-M1 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M1';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 9, 25000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-1';

-- 10. C3-M2 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M2';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 10, 25000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-1';

-- 11. C3-M3 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 15000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M3';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 11, 15000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-MOBILE-1';

-- 12. C3-M4 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 15000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M4';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 12, 15000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-MOBILE-1';

-- 13. C3-M5 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 20000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M5';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 13, 20000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-2';

-- 14. C3-M6 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 25000, '2026-05-01', 'BANK_TRANSFER', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M6';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 14, 25000, '2026-05-01', 'BANK_TRANSFER', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-BANK-2';

-- 15. C3-M7 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 5000, '2026-05-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M7';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 15, 5000, '2026-05-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-CASH';

-- 16. C3-M8 - Mai
INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type)
SELECT ms.id, 5000, '2026-05-01', 'CASH', 'MEMBERSHIP_DUES'
FROM membership ms WHERE ms.code = 'C3-M8';

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT c.id, 16, 5000, '2026-05-01', 'CASH', a.id, 'Paiement cotisation'
FROM collectivity c, account a
WHERE c.code = 'col-3' AND a.code = 'C3-A-CASH';

-- Mettre à jour la date d'adhésion des anciens membres
UPDATE membership SET membership_date = '2026-01-01' WHERE collectivity_id IN (1, 2, 3);

-- =====================================================
-- NOUVEAUX MEMBRES - Collectivité 1
-- =====================================================

-- Insertion des nouveaux membres (4 membres)
INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
                                                                                                      ('Nouveau1', 'Membre1', '1990-01-01', 'MALE', 'Adresse 1', 'Profession 1', '0310000001', 'new1.col1@email.com'),
                                                                                                      ('Nouveau2', 'Membre2', '1991-02-02', 'FEMALE', 'Adresse 2', 'Profession 2', '0310000002', 'new2.col1@email.com'),
                                                                                                      ('Nouveau3', 'Membre3', '1992-03-03', 'MALE', 'Adresse 3', 'Profession 3', '0310000003', 'new3.col1@email.com'),
                                                                                                      ('Nouveau4', 'Membre4', '1993-04-04', 'FEMALE', 'Adresse 4', 'Profession 4', '0310000004', 'new4.col1@email.com');

-- Membership pour collectivité 1
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active) VALUES
                                                                                                ('C1-M9', (SELECT id FROM member WHERE email = 'new1.col1@email.com'), 1, '2026-04-01', 'JUNIOR', true),
                                                                                                ('C1-M10', (SELECT id FROM member WHERE email = 'new2.col1@email.com'), 1, '2026-04-01', 'JUNIOR', true),
                                                                                                ('C1-M11', (SELECT id FROM member WHERE email = 'new3.col1@email.com'), 1, '2026-05-01', 'JUNIOR', true),
                                                                                                ('C1-M12', (SELECT id FROM member WHERE email = 'new4.col1@email.com'), 1, '2026-06-01', 'JUNIOR', true);

-- Parrainages pour les 4 nouveaux membres (par C1-M1 et C1-M2)
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms WHERE ms.code IN ('C1-M9', 'C1-M10', 'C1-M11', 'C1-M12');

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms WHERE ms.code IN ('C1-M9', 'C1-M10', 'C1-M11', 'C1-M12');

-- =====================================================
-- NOUVEAUX MEMBRES - Collectivité 2
-- =====================================================

-- Insertion des nouveaux membres (3 membres)
INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
                                                                                                      ('Nouveau5', 'Membre5', '1994-05-05', 'MALE', 'Adresse 5', 'Profession 5', '0320000005', 'new5.col2@email.com'),
                                                                                                      ('Nouveau6', 'Membre6', '1995-06-06', 'FEMALE', 'Adresse 6', 'Profession 6', '0320000006', 'new6.col2@email.com'),
                                                                                                      ('Nouveau7', 'Membre7', '1996-07-07', 'MALE', 'Adresse 7', 'Profession 7', '0320000007', 'new7.col2@email.com');

-- Membership pour collectivité 2
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active) VALUES
                                                                                                ('C2-M9', (SELECT id FROM member WHERE email = 'new5.col2@email.com'), 2, '2026-03-01', 'JUNIOR', true),
                                                                                                ('C2-M10', (SELECT id FROM member WHERE email = 'new6.col2@email.com'), 2, '2026-03-01', 'JUNIOR', true),
                                                                                                ('C2-M11', (SELECT id FROM member WHERE email = 'new7.col2@email.com'), 2, '2026-03-01', 'JUNIOR', true);

-- Parrainages pour les 3 nouveaux membres (par C1-M1 et C1-M2)
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M1'), 'ami'
FROM membership ms WHERE ms.code IN ('C2-M9', 'C2-M10', 'C2-M11');

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C1-M2'), 'ami'
FROM membership ms WHERE ms.code IN ('C2-M9', 'C2-M10', 'C2-M11');

-- =====================================================
-- NOUVEAUX MEMBRES - Collectivité 3
-- =====================================================

-- Insertion des nouveaux membres (6 membres)
INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
                                                                                                      ('Nouveau8', 'Membre8', '1997-08-08', 'MALE', 'Adresse 8', 'Profession 8', '0330000008', 'new8.col3@email.com'),
                                                                                                      ('Nouveau9', 'Membre9', '1998-09-09', 'FEMALE', 'Adresse 9', 'Profession 9', '0330000009', 'new9.col3@email.com'),
                                                                                                      ('Nouveau10', 'Membre10', '1999-10-10', 'MALE', 'Adresse 10', 'Profession 10', '0330000010', 'new10.col3@email.com'),
                                                                                                      ('Nouveau11', 'Membre11', '2000-11-11', 'FEMALE', 'Adresse 11', 'Profession 11', '0330000011', 'new11.col3@email.com'),
                                                                                                      ('Nouveau12', 'Membre12', '2001-12-12', 'MALE', 'Adresse 12', 'Profession 12', '0330000012', 'new12.col3@email.com'),
                                                                                                      ('Nouveau13', 'Membre13', '2002-01-13', 'FEMALE', 'Adresse 13', 'Profession 13', '0330000013', 'new13.col3@email.com');

-- Membership pour collectivité 3
INSERT INTO membership (code, member_id, collectivity_id, membership_date, rank, is_active) VALUES
                                                                                                ('C3-M9', (SELECT id FROM member WHERE email = 'new8.col3@email.com'), 3, '2026-01-01', 'JUNIOR', true),
                                                                                                ('C3-M10', (SELECT id FROM member WHERE email = 'new9.col3@email.com'), 3, '2026-02-01', 'JUNIOR', true),
                                                                                                ('C3-M11', (SELECT id FROM member WHERE email = 'new10.col3@email.com'), 3, '2026-02-01', 'JUNIOR', true),
                                                                                                ('C3-M12', (SELECT id FROM member WHERE email = 'new11.col3@email.com'), 3, '2026-03-01', 'JUNIOR', true),
                                                                                                ('C3-M13', (SELECT id FROM member WHERE email = 'new12.col3@email.com'), 3, '2026-03-01', 'JUNIOR', true),
                                                                                                ('C3-M14', (SELECT id FROM member WHERE email = 'new13.col3@email.com'), 3, '2026-03-01', 'JUNIOR', true);

-- Parrainages pour les 6 nouveaux membres (par C3-M1 et C3-M2)
INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M1'), 'ami'
FROM membership ms WHERE ms.code IN ('C3-M9', 'C3-M10', 'C3-M11', 'C3-M12', 'C3-M13', 'C3-M14');

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT ms.id, (SELECT id FROM membership WHERE code = 'C3-M2'), 'ami'
FROM membership ms WHERE ms.code IN ('C3-M9', 'C3-M10', 'C3-M11', 'C3-M12', 'C3-M13', 'C3-M14');