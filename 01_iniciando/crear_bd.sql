CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
    [create_option] ...

create_option: [DEFAULT] {
    CHARACTER SET [=] charset_name
  | COLLATE [=] collation_name
  | ENCRYPTION [=] {'Y' | 'N'}
}

CREATE DATABASE IF NOT EXISTS test_jugos;

use test_jugos
USE world;

SELECT * FROM city ORDER BY Population DESC;
SELECT * FROM country;
SELECT * FROM countrylanguage;
CREATE DATABASE foro_hub;