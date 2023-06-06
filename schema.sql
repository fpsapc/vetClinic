/* Database schema to keep the structure of entire database. */

CREATE TABLE ANIMALS(
   ID INT PRIMARY KEY NOT NULL,
   NAME TEXT NOT NULL,
   DATE_OF_BIRTH DATE NOT NULL,
   ESCAPE_ATTEMPTS INT NOT NULL,
   NEUTERED BOOLEAN,
   WEIGHT_KG DECIMAL,
   SPECIES VARCHAR(255)
);
