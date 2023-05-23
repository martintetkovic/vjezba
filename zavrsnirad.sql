# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\EDUNOVA\dagada\zavrsnirad.sql

drop database if exists zavrsnirad;
create database zavrsnirad;
use zavrsnirad;

create table aplzavjezbanje(
    vjezbe int,
    treneri int, 
    prehrana varchar(50),
    video varchar(50) 
);

create table treneri(
    sifra int not null primary key auto_increment,
    kontakt char, 
    strucnaspremna varchar(50),
    korisnik int
);

create table korisnik(
    sifra int not null primary key auto_increment,
    username varchar(50),
     tezina int, 
    visina int,
    godine int,
    spol varchar(50),
    dodatnipodatci int
);

create table dodatnipodatci(
    sifra int not null primary key auto_increment, 
    tezina int, 
    visina int,
    godine int,
    spol varchar(50)
);


create table vjezbe(
    sifra int not null primary key auto_increment,
    bodyweight varchar(50),
    zeljenirezultati varchar(20),
    weightlifting varchar(50)
);

alter table aplzavjezbanje add foreign key (vjezbe) references vjezbe(sifra);
alter table aplzavjezbanje add foreign key (treneri) references treneri(sifra);

alter table treneri add foreign key (korisnik) references korisnik(sifra);

alter table korisnik add foreign key (dodatnipodatci) references dodatnipodatci(sifra);


 



