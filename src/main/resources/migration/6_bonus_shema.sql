create table if not exists collectivity_activity
(
    id varchar primary key,
    collectivity_id varchar references collectivity(id),
    label varchar,
    activity_type varchar,
    executive_date date,
    recurrence_week_ordinal integer,
    recurrence_day_of_week varchar
);

create table if not exists collectivity_activity_occupation
(
    id varchar primary key,
    activity_id varchar references collectivity_activity(id),
    member_occupation varchar
    );

create table if not exists activity_member_attendance
(
    id varchar primary key,
    activity_id varchar references collectivity_activity(id),
    member_id varchar references member(id),
    attendance_status varchar,
    unique(activity_id, member_id)
);