# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\EDUNOVA\frizsalon.sql

drop database if exists frizs;
create database frizs;
use frizs;

create table salonzaulj(
    sifra int not null primary key auto_increment,
    djelatnici int,
    korisnik int,
    usluga int,
    cijenausl int,
    naziv varchar(50),
    lokacija varchar(50),
    radnovr varchar(50),
    vlasnik varchar(50)

);

create table djelatnici(
    sifra int not null primary key auto_increment,
    korisnik int, 
    osoba int,
    iban varchar(20),
    usluga int

);

create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int,
    termin varchar(50)
);

create table usluga(
    sifra int not null primary key auto_increment,
    pedikura varchar(50),
    manikura varchar(50),
    sminkanje varchar(50),
    cijena int
);

create table cijenausl(
    sifra int not null primary key auto_increment,
    cijenasisanje int,
    cijenamanikura int,
    cijenapedikura int
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib int
);

alter table salonzaulj add foreign key (djelatnici) references djelatnici(sifra); 
alter table salonzaulj add foreign key (korisnik) references korisnik(sifra);
alter table salonzaulj add foreign key (usluga) references usluga(sifra);
alter table salonzaulj add foreign key (cijenausl) references cijenausl(sifra);

alter table djelatnici add foreign key (korisnik) references korisnik(sifra);
alter table djelatnici add foreign key (usluga) references usluga(sifra);
alter table djelatnici add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);







