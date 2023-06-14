CREATE TABLE "owners"(
    "id" SERIAL NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
CREATE INDEX "owners_email_index" ON
    "owners"("email");
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id" SERIAL NOT NULL,
    "animal_id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "visit_date" DATE NOT NULL
);
CREATE INDEX "visits_animal_id_index" ON
    "visits"("animal_id");
CREATE INDEX "visits_vet_id_index" ON
    "visits"("vet_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_animal_id_unique" UNIQUE("animal_id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_unique" UNIQUE("vet_id");
CREATE TABLE "species"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "vet_id" SERIAL NOT NULL,
    "species_id" INTEGER NOT NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vet_id");
ALTER TABLE
    "specializations" ADD PRIMARY KEY("species_id");
CREATE TABLE "animals"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species_id" BIGINT NOT NULL,
    "owner_id" BIGINT NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_unique" UNIQUE("species_id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_unique" UNIQUE("owner_id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "owners"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_animal_id_foreign" FOREIGN KEY("animal_id") REFERENCES "animals"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");