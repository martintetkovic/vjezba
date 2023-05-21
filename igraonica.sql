# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\EDUNOVA\igraonica.sql
drop database if exists igraonica;
create database igraonica;
use igraonica;

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    imeroditelja varchar(50),
    prezime varchar(50),
    telefonroditelj varchar(20)
);

create table dijeteposjeta(
    dijete int,
    posjeta int

);

create table posjeta(
    sifra int not null primary key auto_increment,
    djelatnik int,
    datumvrijemeposjeta datetime, 
    datumvrijemeodlaska datetime, 
    napomena varchar(50),
    djelatnik_sifra int

);

create table djelatnik(
    sifra int not null primary key auto_increment,
    iban varchar(50),
    ime varchar(45),
    oib varchar(45),
    prezime varchar(45),
    radnomjesto varchar(45)
);

create table uslugaposjeta(
    usluga int, 
    posjeta int

);

create table usluga(
    sifra int not null primary key auto_increment,
    cijena int, 
    jedinicamjere varchar(45),
    kolicina int, 
    naziv varchar(45)
);

create table operater(
    sifra int not null primary key auto_increment,
    email varchar(45),
    ime varchar(45),
    lozinka varchar(45),
    oib varchar(45),
    prezime varchar(45)
);

alter table dijeteposjeta add foreign key (dijete) references dijete(sifra);
alter table dijeteposjeta add foreign key (posjeta) references posjeta(sifra);

alter table posjeta add foreign key (djelatnik) references djelatnik(sifra);

alter table uslugaposjeta add foreign key (posjeta) references posjeta(sifra);
alter table uslugaposjeta add foreign key (usluga) references usluga(sifra);











