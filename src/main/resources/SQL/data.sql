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

-- =====================================================
-- 6. MEMBERSHIP FEES (COTISATIONS DÉFINIES)
-- =====================================================

INSERT INTO membership_fee (collectivity_id, eligible_from, frequency, amount, label, status) VALUES
                                                                                                  (1, '2026-01-01', 'ANNUALLY', 100000, 'Cotisation annuelle', 'ACTIVE'),
                                                                                                  (2, '2026-01-01', 'ANNUALLY', 100000, 'Cotisation annuelle', 'ACTIVE'),
                                                                                                  (3, '2026-01-01', 'ANNUALLY', 50000, 'Cotisation annuelle', 'ACTIVE');

-- =====================================================
-- 7. CONTRIBUTIONS (PAIEMENTS DES MEMBRES)
-- =====================================================

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 100000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.collectivity_id = 1 AND m.member_id IN (1,2,3,4,5,6);

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 60000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 7 AND m.collectivity_id = 1;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 90000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 8 AND m.collectivity_id = 1;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 60000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 1 AND m.collectivity_id = 2;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 90000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 2 AND m.collectivity_id = 2;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 100000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.collectivity_id = 2 AND m.member_id IN (3,4,5,6);

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 40000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 7 AND m.collectivity_id = 2;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 60000, '2026-01-01', 'MOBILE_MONEY', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.member_id = 8 AND m.collectivity_id = 2;

INSERT INTO contribution (membership_id, amount, payment_date, payment_method, type, percentage_to_federation)
SELECT m.id, 50000, '2026-01-01', 'CASH', 'MEMBERSHIP_DUES', 10
FROM membership m WHERE m.collectivity_id = 3;

-- =====================================================
-- 8. ACCOUNTS (COMPTES FINANCIERS)
-- =====================================================

INSERT INTO account (code, collectivity_id, account_type, holder_name, mobile_service, phone_number, initial_amount) VALUES
                                                                                                                         ('C1-A-CASH', 1, 'CASH', '-', NULL, NULL, 0),
                                                                                                                         ('C1-A-MOBILE-1', 1, 'ORANGE_MONEY', 'Mpanorina', 'ORANGE_MONEY', '0370489612', 0),
                                                                                                                         ('C2-A-CASH', 2, 'CASH', '-', NULL, NULL, 0),
                                                                                                                         ('C2-A-MOBILE-1', 2, 'ORANGE_MONEY', 'Dobo voalohany', 'ORANGE_MONEY', '0320489612', 0),
                                                                                                                         ('C3-A-CASH', 3, 'CASH', '-', NULL, NULL, 0);

-- =====================================================
-- 9. TRANSACTIONS
-- =====================================================

-- Insertion des transactions pour la collectivité 1
INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT
    c.id,
    m.id,
    t.amount,
    t.payment_date::date,
    t.payment_mode,
    acc.id,
    t.description
FROM (VALUES
          ('col-1', 'C1-M1', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M2', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M3', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M4', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M5', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M6', 100000, '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M7', 60000,  '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle'),
          ('col-1', 'C1-M8', 90000,  '2026-01-01', 'CASH', 'C1-A-CASH', 'Paiement cotisation annuelle')
     ) AS t(collectivity_code, member_code, amount, payment_date, payment_mode, account_code, description)
         JOIN collectivity c ON c.code = t.collectivity_code
         JOIN member m ON m.id = (SELECT member_id FROM membership WHERE code = t.member_code)
         JOIN account acc ON acc.code = t.account_code;

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, account_id, description)
SELECT
    c.id,
    m.id,
    t.amount,
    t.payment_date::date,
    t.payment_mode,
    acc.id,
    t.description
FROM (VALUES
          ('col-2', 'C2-M1', 60000,  '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M2', 90000,  '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M3', 100000, '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M4', 100000, '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M5', 100000, '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M6', 100000, '2026-01-01', 'CASH',         'C2-A-CASH',     'Paiement cotisation annuelle'),
          ('col-2', 'C2-M7', 40000,  '2026-01-01', 'MOBILE_MONEY', 'C2-A-MOBILE-1', 'Paiement cotisation annuelle'),
          ('col-2', 'C2-M8', 60000,  '2026-01-01', 'MOBILE_MONEY', 'C2-A-MOBILE-1', 'Paiement cotisation annuelle')
     ) AS t(collectivity_code, member_code, amount, payment_date, payment_mode, account_code, description)
         JOIN collectivity c ON c.code = t.collectivity_code
         JOIN member m ON m.id = (SELECT member_id FROM membership WHERE code = t.member_code)
         JOIN account acc ON acc.code = t.account_code;
-- =====================================================
-- 10. ACCOUNT BALANCES (SOLDES DES COMPTES)
-- =====================================================

-- Collectivité 1 - Compte CASH
INSERT INTO account_balance (account_id, balance_date, balance)
SELECT a.id, '2026-01-01', COALESCE((
                                        SELECT SUM(amount) FROM transaction t
                                        WHERE t.collectivity_id = a.collectivity_id
                                          AND t.payment_date <= '2026-01-01'
                                    ), 0)
FROM account a
WHERE a.collectivity_id = 1 AND a.account_type = 'CASH';

-- Collectivité 1 - Compte MOBILE_MONEY
INSERT INTO account_balance (account_id, balance_date, balance)
SELECT a.id, '2026-01-01', COALESCE((
                                        SELECT SUM(amount) FROM transaction t
                                        WHERE t.collectivity_id = a.collectivity_id
                                          AND t.payment_date <= '2026-01-01'
                                          AND t.payment_mode = 'MOBILE_MONEY'
                                    ), 0)
FROM account a
WHERE a.collectivity_id = 1 AND a.account_type = 'MOBILE_MONEY';

-- Collectivité 2 - Compte CASH
INSERT INTO account_balance (account_id, balance_date, balance)
SELECT a.id, '2026-01-01', COALESCE((
                                        SELECT SUM(amount) FROM transaction t
                                        WHERE t.collectivity_id = a.collectivity_id
                                          AND t.payment_date <= '2026-01-01'
                                          AND t.payment_mode = 'CASH'
                                    ), 0)
FROM account a
WHERE a.collectivity_id = 2 AND a.account_type = 'CASH';

-- Collectivité 2 - Compte MOBILE_MONEY
INSERT INTO account_balance (account_id, balance_date, balance)
SELECT a.id, '2026-01-01', COALESCE((
                                        SELECT SUM(amount) FROM transaction t
                                        WHERE t.collectivity_id = a.collectivity_id
                                          AND t.payment_date <= '2026-01-01'
                                          AND t.payment_mode = 'MOBILE_MONEY'
                                    ), 0)
FROM account a
WHERE a.collectivity_id = 2 AND a.account_type = 'MOBILE_MONEY';

-- Collectivité 3 - Compte CASH
INSERT INTO account_balance (account_id, balance_date, balance)
SELECT a.id, '2026-01-01', COALESCE((
                                        SELECT SUM(amount) FROM transaction t
                                        WHERE t.collectivity_id = a.collectivity_id
                                          AND t.payment_date <= '2026-01-01'
                                    ), 0)
FROM account a
WHERE a.collectivity_id = 3 AND a.account_type = 'CASH';