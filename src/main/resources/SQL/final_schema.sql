CREATE TABLE activity (
                          id VARCHAR(50) PRIMARY KEY,
                          collectivity_id INT NOT NULL REFERENCES collectivity(id),
                          label VARCHAR(255) NOT NULL,
                          type VARCHAR(50) NOT NULL,
                          occupation_concerned TEXT,
                          executive_date DATE,
                          recurrence_day_of_month VARCHAR(100)
);

CREATE TABLE attendance (
                            activity_id VARCHAR(50) NOT NULL REFERENCES activity(id),
                            member_id VARCHAR(50) NOT NULL,
                            member_name VARCHAR(255) NOT NULL,
                            status VARCHAR(20) NOT NULL,
                            activity_date DATE NOT NULL
);