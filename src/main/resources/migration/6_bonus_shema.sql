-- ============================================================
-- BONUS E/F - ACTIVITÉS ET PRÉSENCES
-- Version corrigée selon les données de test
-- ============================================================

drop table if exists activity_member_attendance;
drop table if exists collectivity_activity_occupation;
drop table if exists collectivity_activity;

create table if not exists collectivity_activity
(
    id                         varchar primary key,
    collectivity_id             varchar references collectivity(id),
    label                      varchar not null,
    activity_type               varchar not null,
    executive_date              date,
    recurrence_week_ordinal     integer,
    recurrence_day_of_week      varchar
);

create table if not exists collectivity_activity_occupation
(
    id                  varchar primary key,
    activity_id          varchar references collectivity_activity(id),
    member_occupation    varchar not null
);

create table if not exists activity_member_attendance
(
    id                  varchar primary key,
    activity_id          varchar references collectivity_activity(id),
    member_id            varchar references "member"(id),
    attendance_status    varchar not null,
    activity_date        date not null,

    constraint unique_activity_member_attendance unique (activity_id, member_id, activity_date)
);