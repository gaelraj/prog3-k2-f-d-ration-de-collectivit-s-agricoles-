

-- ============================================================
-- 1. ACTIVITÉS DES COLLECTIVITÉS
-- ============================================================

INSERT INTO collectivity_activity (
    id,
    collectivity_id,
    label,
    activity_type,
    executive_date,
    recurrence_week_ordinal,
    recurrence_day_of_week
)
VALUES
    -- Collectivité 1
    ('act-1', 'col-1', 'AG1', 'MEETING', NULL, 1, 'SA'),
    ('act-2', 'col-1', 'Formation de base', 'TRAINING', NULL, 2, 'SU'),

    -- Collectivité 2
    ('act-3', 'col-2', 'AG2', 'MEETING', NULL, 1, 'SU'),
    ('act-4', 'col-2', 'Formation de base', 'TRAINING', NULL, 3, 'SU'),
    ('act-5', 'col-2', 'Perfectionnement', 'PUNCTUAL', '2026-04-30', NULL, NULL),

    -- Collectivité 3
    ('act-6', 'col-3', 'AG3', 'MEETING', NULL, 1, 'FR'),
    ('act-7', 'col-3', 'Formation de base', 'TRAINING', NULL, 4, 'WE')
    ON CONFLICT (id) DO UPDATE SET
    collectivity_id = EXCLUDED.collectivity_id,
                            label = EXCLUDED.label,
                            activity_type = EXCLUDED.activity_type,
                            executive_date = EXCLUDED.executive_date,
                            recurrence_week_ordinal = EXCLUDED.recurrence_week_ordinal,
                            recurrence_day_of_week = EXCLUDED.recurrence_day_of_week;


-- ============================================================
-- 2. OCCUPATIONS CONCERNÉES PAR LES ACTIVITÉS
-- ============================================================

INSERT INTO collectivity_activity_occupation (
    id,
    activity_id,
    member_occupation
)
VALUES
    -- act-1 AG1 : tous les membres de la collectivité 1
    ('cao-act1-junior', 'act-1', 'JUNIOR'),
    ('cao-act1-senior', 'act-1', 'SENIOR'),
    ('cao-act1-secretary', 'act-1', 'SECRETARY'),
    ('cao-act1-treasurer', 'act-1', 'TREASURER'),
    ('cao-act1-vice-president', 'act-1', 'VICE_PRESIDENT'),
    ('cao-act1-president', 'act-1', 'PRESIDENT'),

    -- act-2 Formation de base : juniors uniquement
    ('cao-act2-junior', 'act-2', 'JUNIOR'),

    -- act-3 AG2 : tous les membres de la collectivité 2
    ('cao-act3-junior', 'act-3', 'JUNIOR'),
    ('cao-act3-senior', 'act-3', 'SENIOR'),
    ('cao-act3-secretary', 'act-3', 'SECRETARY'),
    ('cao-act3-treasurer', 'act-3', 'TREASURER'),
    ('cao-act3-vice-president', 'act-3', 'VICE_PRESIDENT'),
    ('cao-act3-president', 'act-3', 'PRESIDENT'),

    -- act-4 Formation de base : juniors uniquement
    ('cao-act4-junior', 'act-4', 'JUNIOR'),

    -- act-5 Perfectionnement : seniors uniquement
    ('cao-act5-senior', 'act-5', 'SENIOR'),

    -- act-6 AG3 : tous les membres de la collectivité 3
    ('cao-act6-junior', 'act-6', 'JUNIOR'),
    ('cao-act6-senior', 'act-6', 'SENIOR'),
    ('cao-act6-secretary', 'act-6', 'SECRETARY'),
    ('cao-act6-treasurer', 'act-6', 'TREASURER'),
    ('cao-act6-vice-president', 'act-6', 'VICE_PRESIDENT'),
    ('cao-act6-president', 'act-6', 'PRESIDENT'),

    -- act-7 Formation de base : juniors uniquement
    ('cao-act7-junior', 'act-7', 'JUNIOR')
    ON CONFLICT (id) DO NOTHING;


-- ============================================================
-- 3. PRÉSENCES - COLLECTIVITÉ 1 - AG1 - MARS 2026
-- Date : 2026-03-07
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act1-C1M1-20260307', 'act-1', 'C1-M1', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M2-20260307', 'act-1', 'C1-M2', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M3-20260307', 'act-1', 'C1-M3', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M4-20260307', 'act-1', 'C1-M4', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M5-20260307', 'act-1', 'C1-M5', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M6-20260307', 'act-1', 'C1-M6', 'ATTENDED', '2026-03-07'),
    ('att-act1-C1M7-20260307', 'act-1', 'C1-M7', 'MISSING',  '2026-03-07'),
    ('att-act1-C1M8-20260307', 'act-1', 'C1-M8', 'MISSING',  '2026-03-07')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 4. PRÉSENCES - COLLECTIVITÉ 1 - AG1 - AVRIL 2026
-- Date : 2026-04-04
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act1-C1M1-20260404', 'act-1', 'C1-M1', 'ATTENDED', '2026-04-04'),
    ('att-act1-C1M2-20260404', 'act-1', 'C1-M2', 'ATTENDED', '2026-04-04'),
    ('att-act1-C1M3-20260404', 'act-1', 'C1-M3', 'MISSING',  '2026-04-04'),
    ('att-act1-C1M4-20260404', 'act-1', 'C1-M4', 'MISSING',  '2026-04-04'),
    ('att-act1-C1M5-20260404', 'act-1', 'C1-M5', 'ATTENDED', '2026-04-04'),
    ('att-act1-C1M6-20260404', 'act-1', 'C1-M6', 'ATTENDED', '2026-04-04'),
    ('att-act1-C1M7-20260404', 'act-1', 'C1-M7', 'ATTENDED', '2026-04-04'),
    ('att-act1-C1M8-20260404', 'act-1', 'C1-M8', 'ATTENDED', '2026-04-04')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 5. PRÉSENCES - COLLECTIVITÉ 2 - AG2 - MARS 2026
-- Date : 2026-03-08
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act3-C1M1-20260308', 'act-3', 'C1-M1', 'ATTENDED', '2026-03-08'),
    ('att-act3-C1M2-20260308', 'act-3', 'C1-M2', 'ATTENDED', '2026-03-08'),
    ('att-act3-C1M3-20260308', 'act-3', 'C1-M3', 'MISSING',  '2026-03-08'),
    ('att-act3-C1M4-20260308', 'act-3', 'C1-M4', 'MISSING',  '2026-03-08'),
    ('att-act3-C1M5-20260308', 'act-3', 'C1-M5', 'ATTENDED', '2026-03-08'),
    ('att-act3-C1M6-20260308', 'act-3', 'C1-M6', 'ATTENDED', '2026-03-08'),
    ('att-act3-C1M7-20260308', 'act-3', 'C1-M7', 'ATTENDED', '2026-03-08'),
    ('att-act3-C1M8-20260308', 'act-3', 'C1-M8', 'ATTENDED', '2026-03-08')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 6. PRÉSENCES - COLLECTIVITÉ 2 - AG2 - AVRIL 2026
-- Date : 2026-04-05
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act3-C1M1-20260405', 'act-3', 'C1-M1', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M2-20260405', 'act-3', 'C1-M2', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M3-20260405', 'act-3', 'C1-M3', 'MISSING',  '2026-04-05'),
    ('att-act3-C1M4-20260405', 'act-3', 'C1-M4', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M5-20260405', 'act-3', 'C1-M5', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M6-20260405', 'act-3', 'C1-M6', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M7-20260405', 'act-3', 'C1-M7', 'ATTENDED', '2026-04-05'),
    ('att-act3-C1M8-20260405', 'act-3', 'C1-M8', 'MISSING',  '2026-04-05')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 7. PRÉSENCES - COLLECTIVITÉ 2 - PERFECTIONNEMENT
-- Date : 2026-04-30
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act5-C1M1-20260430', 'act-5', 'C1-M1', 'ATTENDED',  '2026-04-30'),
    ('att-act5-C1M2-20260430', 'act-5', 'C1-M2', 'ATTENDED',  '2026-04-30'),
    ('att-act5-C1M3-20260430', 'act-5', 'C1-M3', 'ATTENDED',  '2026-04-30'),
    ('att-act5-C1M4-20260430', 'act-5', 'C1-M4', 'MISSING',   '2026-04-30'),
    ('att-act5-C1M5-20260430', 'act-5', 'C1-M5', 'UNDEFINED', '2026-04-30'),
    ('att-act5-C1M6-20260430', 'act-5', 'C1-M6', 'UNDEFINED', '2026-04-30'),
    ('att-act5-C1M7-20260430', 'act-5', 'C1-M7', 'UNDEFINED', '2026-04-30'),
    ('att-act5-C1M8-20260430', 'act-5', 'C1-M8', 'UNDEFINED', '2026-04-30')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 8. PRÉSENCES - COLLECTIVITÉ 3 - AG3 - MARS 2026
-- Date : 2026-03-06
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act6-C3M1-20260306', 'act-6', 'C3-M1', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M2-20260306', 'act-6', 'C3-M2', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M3-20260306', 'act-6', 'C3-M3', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M4-20260306', 'act-6', 'C3-M4', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M5-20260306', 'act-6', 'C3-M5', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M6-20260306', 'act-6', 'C3-M6', 'ATTENDED', '2026-03-06'),
    ('att-act6-C3M7-20260306', 'act-6', 'C3-M7', 'MISSING',  '2026-03-06'),
    ('att-act6-C3M8-20260306', 'act-6', 'C3-M8', 'MISSING',  '2026-03-06')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;


-- ============================================================
-- 9. PRÉSENCES - COLLECTIVITÉ 3 - AG3 - AVRIL 2026
-- Date : 2026-04-03
-- Avec C1-M1 comme membre extérieur présent
-- ============================================================

INSERT INTO activity_member_attendance (
    id,
    activity_id,
    member_id,
    attendance_status,
    activity_date
)
VALUES
    ('att-act6-C3M1-20260403', 'act-6', 'C3-M1', 'ATTENDED', '2026-04-03'),
    ('att-act6-C3M2-20260403', 'act-6', 'C3-M2', 'ATTENDED', '2026-04-03'),
    ('att-act6-C3M3-20260403', 'act-6', 'C3-M3', 'MISSING',  '2026-04-03'),
    ('att-act6-C3M4-20260403', 'act-6', 'C3-M4', 'MISSING',  '2026-04-03'),
    ('att-act6-C3M5-20260403', 'act-6', 'C3-M5', 'ATTENDED', '2026-04-03'),
    ('att-act6-C3M6-20260403', 'act-6', 'C3-M6', 'ATTENDED', '2026-04-03'),
    ('att-act6-C3M7-20260403', 'act-6', 'C3-M7', 'MISSING',  '2026-04-03'),
    ('att-act6-C3M8-20260403', 'act-6', 'C3-M8', 'ATTENDED', '2026-04-03'),

    -- membre extérieur à la collectivité 3 mais présent à l'activité
    ('att-act6-C1M1-20260403', 'act-6', 'C1-M1', 'ATTENDED', '2026-04-03')
    ON CONFLICT (activity_id, member_id, activity_date) DO UPDATE SET
    attendance_status = EXCLUDED.attendance_status;