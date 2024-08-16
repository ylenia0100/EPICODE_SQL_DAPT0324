-- W10D1 PRATICA FACOLTATIVA 2,
-- CREARE DATABASE E TABELLE,

-- creare database w10d1_esf2,
create schema w10d1_esf2;
use w10d1_esf2;

-- creare tabella Prodotti,
CREATE TABLE Prodotti (
    IDProdotto INT PRIMARY KEY,
    NomeProdotto VARCHAR(100),
    Prezzo DECIMAL(10 , 2 )
);

-- creare tabella Clienti,
CREATE TABLE Clienti (
    IDCliente INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(100)
);

-- creare tabella Ordini,
CREATE TABLE Ordini (
    IDOrdine INT PRIMARY KEY,
    IDProdotto INT,
    IDCliente INT,
    Quantità INT,
    FOREIGN KEY (IDProdotto)
        REFERENCES Prodotti (IDProdotto),
    FOREIGN KEY (IDCliente)
        REFERENCES Clienti (IDCliente)
);

-- popolamento della tabella Prodotti,
 INSERT INTO Prodotti VALUES
 (1, 'Tablet', 300.00)
 , (2, 'Mouse', 20.00)
 , (3, 'Tastiera', 25.00)
 , (4, 'Monitor', 180.00)
 , (5, 'HHD', 90.00)
 , (6, 'SSD', 200.00)
 , (7, 'RAM', 100.00)
 , (8, 'Router', 80.00)
 , (9, 'Webcam', 45.00)
 , (10, 'GPU', 1250.00)
 , (11, 'Trackpad', 500.00)
 , (12, 'Techmagazine', 5.00)
 , (13, 'Martech', 50.00);
 
 select * from Prodotti;
 
 -- popolamento tabella Ordini, manca l'IDCliente,
 INSERT INTO Ordini (IDOrdine, IDProdotto, Quantità) VALUES
 (1, 2, 10)
 , (2, 6, 2)
 , (3, 5, 3)
 , (4, 1, 1)
 , (5, 9, 1)
 , (6, 4, 2)
 , (7, 11, 6)
 , (8, 10, 2)
 , (9, 3, 3)
 , (10, 3, 1)
 , (11, 2, 1);
 
 select * from Ordini;
 
  -- popolamento tabella Clienti, 
 INSERT INTO Clienti (IDCliente, Nome, Email) VALUES
 (1, 'Antonio', NULL)
 ,(2, 'Battista', 'battista@mailmail.it')
 ,(3, 'Maria', 'maria@posta.it')
 ,(4, 'Franca', 'franca@lettere.it')
 ,(5, 'Ettore', NULL)
 ,(6, 'Arianna', 'arianna@posta.it')
 ,(7, 'Piero', 'piero@lavoro.it');
 
 select * from Clienti;