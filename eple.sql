CREATE TABLE kunde (
  kundeid serial primary key,
  fornavn text not null,
  etternavn text not null,
  adresse text not null,
  epost text not null,
  tlf text not null,
  kjonn text
);

CREATE bruker

CREATE TABLE ordre (
  ordreid serial primary key,
  ordredato text not null,
  betalt text default 'false' check (
    betalt = 'true'
    or betalt = 'false'
  ),
  kundeid int references kunde (kundeid)
);

CREATE TABLE eksemplar (
  eksemplarid serial primary key,
  tilstand text,
  ordreid int references ordre (ordreid),
  produktid int references produkt (produktid)
);

CREATE TABLE produkt (
  produktid serial primary key,
  vare text not null,
  utgivelse date
);
