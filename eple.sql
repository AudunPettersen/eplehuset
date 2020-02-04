create role eple password '123'; 
alter role eple with login;          
create database eple owner eple;     


DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS vare cascade;
DROP TABLE IF EXISTS bestilling cascade;
DROP TABLE IF EXISTS linje cascade;
DROP TABLE IF EXISTS kategori cascade;
DROP TABLE IF EXISTS users cascade;



CREATE TABLE users (
    userid SERIAL PRIMARY KEY,
    username text unique not null,
    role text default 'user',
    password text not null
); 


CREATE TABLE kunde (
  kundeid SERIAL PRIMARY KEY,
  fornavn text NOT NULL,
  etternavn text NOT NULL,
  adresse text,
  epost text,
  tlf text,
  kjonn text,
  userid int unique not null
);


CREATE TABLE  vare  (
   vareid  SERIAL PRIMARY KEY,
   varenavn  text unique NOT NULL,
   pris int default 0,
   bilde text,
   kategoriid int not null
);


CREATE TABLE  bestilling  (
   bestillingid  SERIAL PRIMARY KEY,
   dato  date NOT NULL,
   kundeid int NOT NULL
);


CREATE TABLE  linje  (
   linjeid  SERIAL PRIMARY KEY,
   antall  int DEFAULT 1,
   vareid  int NOT NULL,
   bestillingid  int NOT NULL
);

CREATE TABLE kategori (
kategoriid SERIAL PRIMARY KEY,
kategorinavn text unique NOT NULL
);



ALTER TABLE  bestilling  ADD FOREIGN KEY ( kundeid ) REFERENCES  kunde  ( kundeid );
ALTER TABLE  linje  ADD FOREIGN KEY ( bestillingid ) REFERENCES  bestilling  ( bestillingid );
ALTER TABLE  linje  ADD FOREIGN KEY ( vareid ) REFERENCES  vare  ( vareid );
ALTER TABLE  kunde  ADD FOREIGN KEY ( userid ) REFERENCES  users  ( userid );
ALTER TABLE  vare ADD FOREIGN KEY ( kategoriid ) REFERENCES kategori (kategoriid);



alter table bestilling owner to eple;
alter table vare owner to eple;
alter table kunde owner to eple;
alter table linje owner to eple;
alter table users owner to eple;
alter table kategori owner to eple;

grant insert, delete, update, select on vare, kategori, linje, bestilling to public