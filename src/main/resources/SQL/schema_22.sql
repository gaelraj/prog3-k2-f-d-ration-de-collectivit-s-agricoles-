-- =====================================================
-- ENUM TYPES
-- =====================================================

CREATE TYPE gender_type AS ENUM ('MALE', 'FEMALE');

CREATE TYPE member_rank_type AS ENUM ('JUNIOR', 'CONFIRMED');

CREATE TYPE position_type AS ENUM ('PRESIDENT', 'VICE_PRESIDENT', 'TREASURER', 'SECRETARY');

CREATE TYPE payment_method_type AS ENUM ('CASH', 'BANK_TRANSFER', 'MOBILE_MONEY');

CREATE TYPE contribution_type_type AS ENUM ('REGISTRATION_FEE', 'MEMBERSHIP_DUES', 'ONE_TIME');

-- =====================================================
-- TABLE: collectivity
-- =====================================================
CREATE TABLE collectivity (
                              id SERIAL PRIMARY KEY,
                              number VARCHAR(50) UNIQUE NOT NULL,
                              name VARCHAR(255) UNIQUE NOT NULL,
                              city VARCHAR(255) NOT NULL,
                              agricultural_specialty VARCHAR(255) NOT NULL,
                              creation_date DATE NOT NULL DEFAULT CURRENT_DATE,
                              authorization_status BOOLEAN NOT NULL DEFAULT FALSE,
                              annual_contribution_amount DECIMAL(15,2) NOT NULL DEFAULT 0
);

-- =====================================================
-- TABLE: member
-- =====================================================
CREATE TABLE member (
                        id SERIAL PRIMARY KEY,
                        first_name VARCHAR(255) NOT NULL,
                        last_name VARCHAR(255) NOT NULL,
                        birth_date DATE NOT NULL,
                        gender gender_type NOT NULL,
                        address TEXT NOT NULL,
                        occupation VARCHAR(255) NOT NULL,
                        phone VARCHAR(20) NOT NULL,
                        email VARCHAR(255) UNIQUE NOT NULL
);

-- =====================================================
-- TABLE: membership
-- =====================================================
CREATE TABLE membership (
                            id SERIAL PRIMARY KEY,
                            member_id INT NOT NULL REFERENCES member(id),
                            collectivity_id INT NOT NULL REFERENCES collectivity(id),
                            membership_date DATE NOT NULL DEFAULT CURRENT_DATE,
                            rank member_rank_type NOT NULL DEFAULT 'JUNIOR',
                            is_active BOOLEAN DEFAULT TRUE,
                            admission_fee_paid BOOLEAN DEFAULT FALSE,
                            membership_dues_paid BOOLEAN DEFAULT FALSE,
                            UNIQUE(member_id, collectivity_id)
);

-- =====================================================
-- TABLE: sponsorship_relation (N parrains)
-- =====================================================
CREATE TABLE sponsorship_relation (
                                      id SERIAL PRIMARY KEY,
                                      membership_id INT NOT NULL REFERENCES membership(id),
                                      sponsor_membership_id INT NOT NULL REFERENCES membership(id),
                                      relationship_nature VARCHAR(255) NOT NULL
);

-- =====================================================
-- TABLE: position
-- =====================================================
CREATE TABLE position (
                          id SERIAL PRIMARY KEY,
                          name position_type UNIQUE NOT NULL
);

INSERT INTO position (name) VALUES
                                ('PRESIDENT'),
                                ('VICE_PRESIDENT'),
                                ('TREASURER'),
                                ('SECRETARY');

-- =====================================================
-- TABLE: mandate
-- =====================================================
CREATE TABLE mandate (
                         id SERIAL PRIMARY KEY,
                         membership_id INT NOT NULL REFERENCES membership(id),
                         position_id INT NOT NULL REFERENCES position(id),
                         start_date DATE NOT NULL DEFAULT CURRENT_DATE,
                         end_date DATE NOT NULL DEFAULT (CURRENT_DATE + INTERVAL '1 year'),
                         mandate_count INT DEFAULT 1
);

-- =====================================================
-- TABLE: contribution
-- =====================================================
CREATE TABLE contribution (
                              id SERIAL PRIMARY KEY,
                              membership_id INT NOT NULL REFERENCES membership(id),
                              amount DECIMAL(15,2) NOT NULL,
                              payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
                              payment_method payment_method_type NOT NULL,
                              type contribution_type_type NOT NULL,
                              percentage_to_federation DECIMAL(5,2) DEFAULT 0
);