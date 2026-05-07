do
$$
    begin
        if not exists(select from pg_type where typname = 'activity_status') then
            create type activity_status as enum ('ACTIVE', 'INACTIVE');
        end if;
    end
$$;

do
$$
    begin
        if not exists(select from pg_type where typname = 'frequency') then
            create type frequency as enum ('WEEKLY', 'MONTHLY', 'ANNUALLY', 'PUNCTUALLY');
        end if;
    end
$$;

do
$$
    begin
        if not exists(select from pg_type where typname = 'payment_mode') then
            create type payment_mode as enum ('CASH', 'MOBILE_BANKING', 'BANK_TRANSFER');
        end if;
    end
$$;

do
$$
    begin
        if not exists(select from pg_type where typname = 'account_type') then
            create type account_type as enum ('CASH', 'MOBILE_BANKING', 'BANK');
        end if;
    end
$$;

do
$$
    begin
        if not exists(select from pg_type where typname = 'mobile_banking_service') then
            create type mobile_banking_service as enum ('AIRTEL_MONEY', 'MVOLA', 'ORANGE_MONEY');
        end if;
    end
$$;

do
$$
    begin
        if not exists(select from pg_type where typname = 'bank') then
            create type bank as enum ('BRED', 'MCB', 'BMOI', 'BOA', 'BGFI', 'AFG', 'ACCES_BAQUE', 'BAOBAB', 'SIPEM');
        end if;
    end
$$;

create table if not exists membership_fee
(
    id              varchar primary key,
    collectivity_id varchar references collectivity(id),
    label           varchar,
    status          activity_status default 'ACTIVE',
    frequency       frequency,
    eligible_from   date,
    amount          numeric(10, 2)
);

create table if not exists financial_account
(
    id                     varchar primary key,
    collectivity_id         varchar references collectivity(id),
    account_type            account_type,
    amount                  numeric(10, 2) default 0,
    holder_name             varchar,
    mobile_banking_service  mobile_banking_service,
    mobile_number           varchar,
    bank_name               bank,
    bank_code               varchar,
    bank_branch_code        varchar,
    bank_account_number     varchar,
    bank_account_key        varchar
);

create table if not exists member_payment
(
    id                      varchar primary key,
    member_id               varchar references member(id),
    collectivity_id          varchar references collectivity(id),
    membership_fee_id        varchar references membership_fee(id),
    account_credited_id      varchar references financial_account(id),
    amount                  numeric(10, 2),
    payment_mode            payment_mode,
    creation_date           date
);

create table if not exists collectivity_transaction
(
    id                      varchar primary key,
    collectivity_id          varchar references collectivity(id),
    member_debited_id        varchar references member(id),
    account_credited_id      varchar references financial_account(id),
    amount                  numeric(10, 2),
    payment_mode            payment_mode,
    creation_date           date
);

alter table collectivity_member
    add column if not exists adhesion_date date default current_date;