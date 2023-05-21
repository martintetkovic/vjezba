# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\EDUNOVA\salon.sql

drop database if exists salon;
create database salon;
use salon;
create table frizerskisalon(
    sifra int not null primary key auto_increment,
    vlasnik int,
	naziv varchar(50),
	radnovrijeme decimal(5,5),
	lokacija varchar(50),
	kontakt int, 
	datumosnivanja varchar(50)
);
create table djelatnik(
    sifra int not null primary key auto_increment,
    korisnik int,
	osoba int,
	iban varchar(50)
	
);

create table osoba(
    sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib char(50)
);

create table korisnik(
    sifra int not null primary key auto_increment,
	osoba int,
	spol varchar(50),
	kontakt int

);

create table usluga(
    sifra int not null primary key auto_increment,
    djelatnik int,
    korisnik int,
	sisanje decimal(3,2),
	bojanje decimal(3,2),
	brijanje decimal(3,2),
	pranjekose decimal(3,2),
	cijenadjeca decimal(3,2),
	cijenaodrasli decimal(3,2),
	rezervacija datetime
);
create table vlasnik(
    sifra int not null primary key auto_increment,
	osoba int,
	email varchar(50),
	telefon int,
	iban varchar(50),
	djelatnik int,
	korisnik int
);


alter table frizerskisalon add foreign key (vlasnik) references vlasnik(sifra);

alter table vlasnik add foreign key (djelatnik) references djelatnik(sifra);
alter table vlasnik add foreign key (korisnik) references korisnik(sifra);
alter table vlasnik add foreign key (osoba) references osoba(sifra);

alter table usluga add foreign key (korisnik) references korisnik(sifra);
alter table usluga add foreign key (djelatnik) references djelatnik(sifra);

alter table djelatnik add foreign key (korisnik) references korisnik(sifra);
alter table djelatnik add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);

