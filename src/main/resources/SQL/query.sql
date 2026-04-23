INSERT INTO member (first_name, last_name, birth_date, gender, address, profession, phone, email) VALUES
                                                                                                      ('Jean', 'Rakoto', '1990-01-01', 'MALE', '123 Rue Andoharanofotsy', 'Agriculteur', '0321234561', 'jean.rakoto@email.com'),
                                                                                                      ('Marie', 'Rabe', '1992-05-15', 'FEMALE', '456 Rue Ambohimanarina', 'Agricultrice', '0321234562', 'marie.rabe@email.com'),
                                                                                                      ('Pierre', 'Andry', '1988-03-10', 'MALE', '789 Rue Andravoahangy', 'Eleveur', '0321234563', 'pierre.andry@email.com'),
                                                                                                      ('Julie', 'Rasoa', '1995-07-20', 'FEMALE', '321 Rue Ankadimbahoaka', 'Maraîcher', '0321234564', 'julie.rasoa@email.com'),
                                                                                                      ('Paul', 'Randria', '1985-11-25', 'MALE', '654 Rue Ambohitsorohitra', 'Pisciculteur', '0321234565', 'paul.randria@email.com'),
                                                                                                      ('Sophie', 'Ranaivo', '1993-09-12', 'FEMALE', '987 Rue Anosy', 'Avicultrice', '0321234566', 'sophie.ranaivo@email.com'),
                                                                                                      ('Thomas', 'Ravelo', '1980-04-18', 'MALE', '147 Rue Isotry', 'Agriculteur', '0321234567', 'thomas.ravelo@email.com'),
                                                                                                      ('Lucie', 'Razafy', '1991-12-05', 'FEMALE', '258 Rue Mahamasina', 'Horticultrice', '0321234568', 'lucie.razafy@email.com'),
                                                                                                      ('David', 'Randrian', '1987-06-30', 'MALE', '369 Rue Faravohitra', 'Apiculteur', '0321234569', 'david.randrian@email.com'),
                                                                                                      ('Emma', 'Rakotozafy', '1994-02-14', 'FEMALE', '741 Rue Ambondrona', 'Rizicultrice', '0321234570', 'emma.rakotozafy@email.com');


select * from member;
ALTER TABLE collectivity ALTER COLUMN agricultural_specialty DROP NOT NULL;


SELECT * FROM collectivity;
SELECT * FROM member;
SELECT * FROM membership;
SELECT * FROM position;
SELECT * FROM mandate;
SELECT * FROM sponsorship_relation;
SELECT * FROM contribution;


