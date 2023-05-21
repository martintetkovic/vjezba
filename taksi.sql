# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\EDUNOVA\taksi.sql

drop database if exists taksisl;
create database taksisl;
use taksisl;

create table vozila(
    sifra int not null primary key auto_increment,
    vozac int,
    naziv varchar(40),
    regoznake varchar(10)
);

create table vozac(
     sifra int not null primary key auto_increment,
    osoba int, 
    iban varchar(20)
);

create table putnik(
     sifra int not null primary key auto_increment,
     destinacija int,
    osoba int
);

create table cijena(
     sifra int not null primary key auto_increment,
    destinacija int
);

create table destinacija( 
    sifra int not null primary key auto_increment,
    adresa varchar(50)
);

create table osoba( 
    sifra int not null primary key auto_increment,
    ime varchar(20),
    prezime varchar(20),
    oib int
);

alter table vozila add foreign key (vozac) references vozac(sifra);

alter table vozac add foreign key (osoba) references osoba(sifra);

alter table putnik add foreign key (osoba) references osoba(sifra);
alter table putnik add foreign key (destinacija) references destinacija(sifra);

alter table cijena add foreign key (destinacija) references destinacija(sifra);