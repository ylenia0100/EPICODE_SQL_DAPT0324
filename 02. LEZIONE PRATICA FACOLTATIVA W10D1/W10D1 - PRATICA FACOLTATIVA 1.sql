-- W10D1 PRATICAFACOLTATIVA 1,
-- CREARE DATABASE PER LA GESTIONE DEGLI STORE DEI VIDEOGIOCHI E POPOLARE LE TABELLE,

-- creare database w10d1_esf1,
create schema w10d1_esf1;
use w10d1_esf1;

-- creare tabella Store,
CREATE TABLE Store (
    CodiceStore INT PRIMARY KEY,
    IndirizzoFisico VARCHAR(100),
    NumeroTelefono VARCHAR(100)
);

-- creazione tabella Impiegato,
CREATE TABLE Impiegato (
    CodiceFiscale VARCHAR(16) PRIMARY KEY,
    Nome VARCHAR(100),
    TitoloStudio VARCHAR(100),
    Recapito VARCHAR(100)
);

-- creazione tabella Servizio_Impiegato,
CREATE TABLE Servizio_Impiegato (
    CodiceFiscale VARCHAR(16),
    CodiceStore INT,
    Data_Inizio DATE,
    Data_Fine DATE,
    Carica VARCHAR(100),
    FOREIGN KEY (CodiceFiscale)
        REFERENCES Impiegato (CodiceFiscale),
    FOREIGN KEY (CodiceStore)
        REFERENCES Store (CodiceStore)
);

-- creazione tabella Videogioco,
CREATE TABLE Videogioco (
    Titolo VARCHAR(100),
    Sviluppatore VARCHAR(100),
    AnnoDistribuzione INT,
    Prezzo DECIMAL(4 , 2 ),
    Genere VARCHAR(100),
    Remakedi VARCHAR(100)
);

-- popolamento tabella Store,
insert into Store (CodiceStore, IndirizzoFisico, NumeroTelefono) values
(1, 'Via Roma 123, Milano', '+39 02 1234567'),
(2, 'Corso Italia 456, Roma', '+39 06 7654321'),
(3, 'Piazza San Marco 789, Venezia', '+39 041 9876543'),
(4, 'Viale degli Ulivi 234, Napoli', '+39 081 3456789'),
(5, 'Via Torino 567, Torino', '+39 011 8765432'),
(6, 'Corso Vittorio Emanuele 890,Firenze ', '+39 055 2345678'),
(7, 'Piazza del Duomo 123, Bologna', '+39 051 8765432'),
(8, 'Via Garibaldi 456, Genova', '+39 010 2345678'),
(9, 'Lungarno Mediceo 789, Pisa', '+39 050 8765432'),
(10, 'Corso Cavour 101, Palermo', '+39 091 2345678');

select * from store;

-- popolamento tabella Impiegato,
insert into Impiegato (CodiceFiscale, Nome, TitoloStudio, Recapito) values
('ABC12345XYZ67890', 'Mario Rossi', 'Laurea in Economia', 'mario.rossi@email.com'),
('DEF67890XYZ12345', 'Anna Verdi' , 'Diploma di Ragioneria', 'anna.verdi@email.com'),
('GHI12345XYZ67890', 'Luigi Bianchi', 'Laurea in Informatica', 'luigi.bianchi@email.com'),
('JKL67890XYZ12345', 'Laura Neri', 'Laurea in Lingue', 'laura.neri@email.com'),
('MNO12345XYZ67890', 'Andrea Moretti', 'Diploma di Geometra', 'andrea.moretti@email.com'),
('PQR67890XYZ12345', 'Giulia Ferrara', 'Laurea in Psicologia', 'giulia.ferrara@email.com'),
('STU12345XYZ67890', 'Marco Esposito', 'Diploma di Elettronica', 'marco.esposito@email.com'),
('VWX67890XYZ12345', 'Sara Romano', 'Laurea in Giurisprudenza', 'sara.romano@email.com'),
('YZA12345XYZ67890', 'Roberto De Luca', 'Diploma di Informatica', 'roberto.deluca@email.com'),
('BCD67890XYZ12345', 'Elena Santoro', 'Laurea in Lettere', 'elena.santoro@email.com');

select * from impiegato;

-- popolamento tabella Servizio_Impiegato,
insert into Servizio_Impiegato (CodiceFiscale, CodiceStore, Data_Inizio, Data_Fine, Carica) values
('ABC12345XYZ67890', '1', '2023-01-01', '2024-12-31', 'Cassiere'),
('DEF67890XYZ12345', '2', '2023-02-01', '2024-11-30', 'Commesso'),
('GHI12345XYZ67890','3', '2023-03-01', '2024-10-30', 'Magazziniere'),
('JKL67890XYZ12345','4', '2023-04-01', '2024-09-30', 'Addetto alle vendite'),
('MNO12345XYZ67890', '5','2023-05-01','2024-08-30', 'Addetto alle pulizie'),
('PQR67890XYZ12345', '6', '2023-06-01', '2024-07-30', 'Commesso'),
('STU12345XYZ67890', '7', '2023-07-01','2024-06-30', 'Commesso'),
('VWX67890XYZ12345', '8', '2023-08-01','2024-05-30', 'Cassiere'),
('YZA12345XYZ67890', '9', '2023-09-01', '2024-04-30', 'Cassiere'),
('BCD67890XYZ12345', '10', '2023-10-01', '2024-03-30', 'Cassiere');  

select * from servizio_impiegato;

-- popolamento tabella Videogioco,
insert into Videogioco (Titolo, Sviluppatore, AnnoDistribuzione, Prezzo, Genere, Remakedi) values
('Fifa 2023','EA Sports', 2023 ,'49.99','Calcio', 'null'),
('Assassin s Creed: Valhalla','Ubisoft', 2020,'59.99','Action', 'null'),
('Super Mario Odyssey', 'Nintendo', 2017, '39.99', 'Platform', 'null'),
('The Last of Us Part II','Naughty Dog', 2020, '69.99', 'Action', 'null'),
('Cyberpunk 2077','CD Projekt Red', 2020, '49.99', 'RPG', 'null'),
('Animal Crossing: New Horizons', 'Nintendo', 2020, '54.99', 'Simulation', 'null'),
('Call of Duty: Warzone', 'Infinity Ward', 2020, '0.00', 'FPS', 'null'),
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 2017, '59.99', 'Action-Adventure', 'null'),
('Fortnite', 'Epic Games', 2017, '0.00', 'Battle Royale', 'null'),
('Red Dead Redemption 2', 'Rockstar Games', 2018, '39.99', 'Action-Adventure', 'null');

select *from videogioco;

