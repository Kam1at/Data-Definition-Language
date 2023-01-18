--Задание 1
-- Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

--Добавить в таблицу после создания колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name varchar;

--Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

--Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME birthday TO birth_date;

--Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

--Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date)
VALUES ('Harry', 'Potter', '1990-02-02');
INSERT INTO student (first_name, last_name, birth_date)
VALUES ('Harry2', 'Potter2', '1990-03-03');
INSERT INTO student (first_name, last_name, birth_date)
VALUES ('Harry3', 'Potter3', '1990-04-04');

--Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;

--Задание 2
--Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products ADD CONSTRAINT chk_products_unit_price CHECK (unit_price > 0);

--Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products ADD CONSTRAINT chk_products_discontinued CHECK (discontinued IN (0, 1));

--Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
SELECT * INTO discontinued_products
FROM products
WHERE discontinued = 1;

--Удалить из products товары, снятые с продажи (discontinued = 1)
SET session_replication_role = 'replica';
DELETE FROM products
WHERE discontinued = 1
SET session_replication_role = 'origin';