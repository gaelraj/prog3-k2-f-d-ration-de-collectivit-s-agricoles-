-- =====================================================
-- INSERTION DES DONNÉES - FÉDÉRATION DE COLLECTIVITÉS AGRICOLES
-- VERSION CORRIGÉE (payment_method_type utilise 'MOBILE_MONEY' au lieu de 'MOBILE_BANKING')
-- =====================================================

-- =====================================================
-- 1. COLLECTIVITÉS
-- =====================================================

INSERT INTO collectivity (id, number, name, location, agricultural_specialty, creation_date, authorization_status, annual_contribution_amount) VALUES
                                                                                                                                                   (1, '1', 'Mpanorina', 'Ambatondrazaka', 'Riziculture', '2026-01-01', true, 100000),
                                                                                                                                                   (2, '2', 'Dobo voalohany', 'Ambatondrazaka', 'Pisciculture', '2026-01-01', true, 100000),
                                                                                                                                                   (3, '3', 'Tantely mamy', 'Brickaville', 'Apiculture', '2026-01-01', true, 50000);

-- =====================================================
-- 2. MEMBRES
-- =====================================================

INSERT INTO member (id, first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
                                                                                                          (1, 'Prénom membre 1', 'Nom membre 1', '1980-02-01', 'MALE', 'Lot II V M Ambatondrazaka', 'Riziculteur', '0341234567', 'member.1@fed-agri.mg'),
                                                                                                          (2, 'Prénom membre 2', 'Nom membre 2', '1982-03-05', 'MALE', 'Lot II F Ambatondrazaka', 'Agriculteur', '0321234567', 'member.2@fed-agri.mg'),
                                                                                                          (3, 'Prénom membre 3', 'Nom membre 3', '1992-03-10', 'MALE', 'Lot II J Ambatondrazaka', 'Collecteur', '0331234567', 'member.3@fed-agri.mg'),
                                                                                                          (4, 'Prénom membre 4', 'Nom membre 4', '1988-05-22', 'FEMALE', 'Lot A K 50 Ambatondrazaka', 'Distributeur', '0381234567', 'member.4@fed-agri.mg'),
                                                                                                          (5, 'Prénom membre 5', 'Nom membre 5', '1999-08-21', 'MALE', 'Lot UV 80 Ambatondrazaka', 'Riziculteur', '0373434567', 'member.5@fed-agri.mg'),
                                                                                                          (6, 'Prénom membre 6', 'Nom membre 6', '1998-08-22', 'FEMALE', 'Lot UV 6 Ambatondrazaka', 'Riziculteur', '0372234567', 'member.6@fed-agri.mg'),
                                                                                                          (7, 'Prénom membre 7', 'Nom membre 7', '1998-01-31', 'MALE', 'Lot UV 7 Ambatondrazaka', 'Riziculteur', '0374234567', 'member.7@fed-agri.mg'),
                                                                                                          (8, 'Prénom membre 8', 'Nom membre 8', '1975-08-20', 'MALE', 'Lot UV 8 Ambatondrazaka', 'Riziculteur', '0370234567', 'member.8@fed-agri.mg'),
                                                                                                          (9, 'Prénom membre 9', 'Nom membre 9', '1988-01-02', 'MALE', 'Lot 33 J Antsirabe', 'Apiculteur', '034034567', 'member.9@fed-agri.mg'),
                                                                                                          (10, 'Prénom membre 10', 'Nom membre 10', '1982-03-05', 'MALE', 'Lot 2 J Antsirabe', 'Agriculteur', '0338634567', 'member.10@fed-agri.mg'),
                                                                                                          (11, 'Prénom membre 11', 'Nom membre 11', '1992-03-12', 'MALE', 'Lot 8 KM Antsirabe', 'Collecteur', '0338234567', 'member.11@fed-agri.mg'),
                                                                                                          (12, 'Prénom membre 12', 'Nom membre 12', '1988-05-10', 'FEMALE', 'Lot A K 50 Antsirabe', 'Distributeur', '0382334567', 'member.12@fed-agri.mg'),
                                                                                                          (13, 'Prénom membre 13', 'Nom membre 13', '1999-08-11', 'MALE', 'Lot UV 80 Antsirabe', 'Apiculteur', '0373365567', 'member.13@fed-agri.mg'),
                                                                                                          (14, 'Prénom membre 14', 'Nom membre 14', '1998-08-09', 'FEMALE', 'Lot UV 6 Antsirabe', 'Apiculteur', '0378234567', 'member.14@fed-agri.mg'),
                                                                                                          (15, 'Prénom membre 15', 'Nom membre 15', '1998-01-13', 'MALE', 'Lot UV 7 Antsirabe', 'Apiculteur', '0374914567', 'member.15@fed-agri.mg'),
                                                                                                          (16, 'Prénom membre 16', 'Nom membre 16', '1975-08-02', 'MALE', 'Lot UV 8 Antsirabe', 'Apiculteur', '0370634567', 'member.16@fed-agri.mg');

-- =====================================================
-- 3. MEMBERSHIPS
-- =====================================================

INSERT INTO membership (member_id, collectivity_id, membership_date, rank, is_active, admission_fee_paid, membership_dues_paid) VALUES
                                                                                                                                    (1, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (2, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (3, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (4, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (5, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (6, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (7, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (8, 1, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (1, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (2, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (3, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (4, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (5, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (6, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (7, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (8, 2, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (9, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (10, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (11, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (12, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (13, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (14, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (15, 3, '2026-01-01', 'CONFIRMED', true, true, true),
                                                                                                                                    (16, 3, '2026-01-01', 'CONFIRMED', true, true, true);

-- =====================================================
-- 4. MANDATES (POSTES)
-- =====================================================

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 1 AND m.collectivity_id = 1 AND p.name = 'PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 2 AND m.collectivity_id = 1 AND p.name = 'VICE_PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 3 AND m.collectivity_id = 1 AND p.name = 'SECRETARY';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 4 AND m.collectivity_id = 1 AND p.name = 'TREASURER';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 5 AND m.collectivity_id = 2 AND p.name = 'PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 6 AND m.collectivity_id = 2 AND p.name = 'VICE_PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 7 AND m.collectivity_id = 2 AND p.name = 'SECRETARY';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 8 AND m.collectivity_id = 2 AND p.name = 'TREASURER';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 9 AND m.collectivity_id = 3 AND p.name = 'PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 10 AND m.collectivity_id = 3 AND p.name = 'VICE_PRESIDENT';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 11 AND m.collectivity_id = 3 AND p.name = 'SECRETARY';

INSERT INTO mandate (membership_id, position_id, start_date, end_date, mandate_count)
SELECT m.id, p.id, '2026-01-01', '2026-12-31', 1
FROM membership m, position p
WHERE m.member_id = 12 AND m.collectivity_id = 3 AND p.name = 'TREASURER';

-- =====================================================
-- 5. SPONSORSHIP RELATIONS (PARRAINAGES)
-- =====================================================

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 3 AND m1.collectivity_id = 1 AND m2.member_id = 1 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 3 AND m1.collectivity_id = 1 AND m2.member_id = 2 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 4 AND m1.collectivity_id = 1 AND m2.member_id = 1 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 4 AND m1.collectivity_id = 1 AND m2.member_id = 2 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 5 AND m1.collectivity_id = 1 AND m2.member_id = 1 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 5 AND m1.collectivity_id = 1 AND m2.member_id = 2 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 6 AND m1.collectivity_id = 1 AND m2.member_id = 1 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 6 AND m1.collectivity_id = 1 AND m2.member_id = 2 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 7 AND m1.collectivity_id = 1 AND m2.member_id = 1 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 7 AND m1.collectivity_id = 1 AND m2.member_id = 2 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 8 AND m1.collectivity_id = 1 AND m2.member_id = 6 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 8 AND m1.collectivity_id = 1 AND m2.member_id = 7 AND m2.collectivity_id = 1;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 11 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 11 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 12 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 12 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 13 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 13 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 14 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'ami'
FROM membership m1, membership m2
WHERE m1.member_id = 14 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 15 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'collegue'
FROM membership m1, membership m2
WHERE m1.member_id = 15 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 16 AND m1.collectivity_id = 3 AND m2.member_id = 9 AND m2.collectivity_id = 3;

INSERT INTO sponsorship_relation (membership_id, sponsor_membership_id, relationship_nature)
SELECT m1.id, m2.id, 'famille'
FROM membership m1, membership m2
WHERE m1.member_id = 16 AND m1.collectivity_id = 3 AND m2.member_id = 10 AND m2.collectivity_id = 3;

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

INSERT INTO account (collectivity_id, account_type, holder_name, mobile_service, phone_number, bank_name, account_number) VALUES
                                                                                                                              (1, 'CASH', '-', NULL, NULL, NULL, NULL),
                                                                                                                              (1, 'MOBILE_MONEY', 'Mpanorina', 'ORANGE_MONEY', '0370489612', NULL, NULL),
                                                                                                                              (2, 'CASH', '-', NULL, NULL, NULL, NULL),
                                                                                                                              (2, 'MOBILE_MONEY', 'Dobo voalohany', 'ORANGE_MONEY', '0320489612', NULL, NULL),
                                                                                                                              (3, 'CASH', '-', NULL, NULL, NULL, NULL);

-- =====================================================
-- 9. TRANSACTIONS
-- =====================================================

INSERT INTO transaction (collectivity_id, member_id, amount, payment_date, payment_mode, description) VALUES
                                                                                                          (1, 1, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 2, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 3, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 4, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 5, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 6, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 7, 60000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (1, 8, 90000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 1, 60000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 2, 90000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 3, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 4, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 5, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 6, 100000, '2026-01-01', 'CASH', 'Paiement cotisation annuelle'),
                                                                                                          (2, 7, 40000, '2026-01-01', 'MOBILE_MONEY', 'Paiement cotisation annuelle'),
                                                                                                          (2, 8, 60000, '2026-01-01', 'MOBILE_MONEY', 'Paiement cotisation annuelle');

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