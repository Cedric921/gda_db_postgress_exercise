DROP DATABASE IF EXISTS gouniv;
CREATE DATABASE gouniv;
​
\c gouniv;
​
CREATE TABLE staff (
  staff_no SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  region VARCHAR(100) NOT NULL
);
​
CREATE TABLE course (
  course_code SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  credit INT DEFAULT 0,
  quota INT DEFAULT 0,
  staff_no INT REFERENCES staff (staff_no)
);
​
CREATE TABLE student (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  registered BOOL DEFAULT FALSE,
  region VARCHAR(100) DEFAULT 'INCONNUE',
  staff_no INT REFERENCES staff (staff_no)
);
​
CREATE TABLE enrollment (
  student_id INT REFERENCES student (student_id),
  course_code INT REFERENCES course (course_code),
  date_enrolled DATE DEFAULT current_date,
  final_grade INT DEFAULT 0,
  PRIMARY KEY (student_id, course_code)
);
​
CREATE TABLE assignment (
  assignment_no SERIAL,
  student_id INT REFERENCES student (student_id),
  course_code INT REFERENCES course (course_code),
  grade INT DEFAULT 0,
  PRIMARY KEY(assignment_no, student_id, course_code)
);
​
​
CREATE USER admin;
CREATE USER doyen;
CREATE USER assistant;
​
ALTER USER admin PASSWORD 'gouniv';
ALTER USER doyen PASSWORD 'gouni';
ALTER USER assistant PASSWORD 'gouniv';
​
​
ALTER DATABASE gouniv OWNER TO admin;
ALTER DATABASE gouniv OWNER TO admin;
ALTER TABLE staff OWNER TO admin;
ALTER TABLE course OWNER TO admin;
ALTER TABLE student OWNER TO admin;
ALTER TABLE enrollment OWNER TO admin;
ALTER TABLE assignment OWNER TO admin;
​
REVOKE ALL PRIVILEGES ON DATABASE gouniv FROM PUBLIC;
​
GRANT CONNECT ON DATABASE gouniv TO assistant,doyen;
GRANT ALL PRIVILEGES ON TABLE course,student TO doyen;
GRANT SELECT ON TABLE staff TO doyen;
GRANT SELECT ON TABLE course,student TO assistant;
​
INSERT INTO staff(name, region) VALUES
  ('Cedric karungu', 'Av kesheni'),
  ('Alexandre Notor', 'Av de la mission'),
  ('Golla Gloire', 'Av Kinshasa'),
  ('Arick Ndekocode', 'Av Maï Moto'),
  ('Mugisho Alame', 'Av du lac');
​
INSERT INTO course(title, credit, quota, staff_no) VALUES
  ('Analyse Infinitésimale', 8, 15, 3),
  ('Mécanique Rationnelle', 5, 15, 5),
  ('Instrument de mesure', 3, 15, 5),
  ('Expression Orale et Écrite', 4, 15, 4),
  ('Probabilité et Statistique', 4, 15, 1);
​
INSERT INTO student(name, region, staff_no) VALUES
  ('Jethron kashira', 'Av du lac', 4),
  ('Doddy matabaro', 'Av de la mission', 1),
  ('Josue Makuta', 'Av Kinshasa', 3),
  ('Shako Kinyamba', 'Av Maï Moto', 5),
  ('Alex', 'Av Kinshasa', 4);
​
INSERT INTO enrollment(student_id, course_code, final_grade) VALUES
  (1, 2, 2),
  (2, 4, 4),
  (3, 5, 4),
  (4, 4, 2),
  (5, 3, 1);
​
INSERT INTO assignment(student_id, course_code, grade) VALUES
  (1, 2, 1),
  (2, 4, 3),
  (3, 5, 4),
  (4, 4, 1),
  (5, 3, 1)
