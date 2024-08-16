-- W10D1 - PRATICA,
-- Interrogare e filtrare le tabelle,
-- Connettiti al db aziendale o esegui il restore del db,
-- Esplora la tabelle dei prodotti (DimProduct),
SELECT * FROM AdventureWorksDW.dimproduct;

-- Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, 
-- ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag. 
-- Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName as nomeprodottoininglese,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct;

/* Partendo dalla query scritta nel passaggio precedente, 
-- esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1*/

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct
WHERE FinishedGoodsFlag=1;

-- esempio di come applicare più filtri, utilizzando connettore logico AND,
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct
WHERE FinishedGoodsFlag=1
AND Color='Red'
AND ProductKey>230;

-- esempio per filtrare e ordinare in modo crescente in base astarndardcost utilizzare ORDER BY (in modo decrescente desc),
 SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct
WHERE FinishedGoodsFlag=1
AND Color='Red'
AND ProductKey>230
order by StandardCost;

/*Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey)
 comincia con FR oppure BK.Il result set deve contenere il codice prodotto (ProductKey), 
 il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).*/
SELECT 
    ProductKey,
    ModelName,
    EnglishProductName,
    StandardCost,
    ListPrice,
    ProductAlternateKey
FROM
    dimproduct
WHERE ProductAlternateKey like 'FR%'
or ProductAlternateKey like 'BK%';

/*Arricchisci il risultato della query scritta nel passaggio precedente 
del Markup applicato dall’azienda (ListPrice - StandardCost)*/

SELECT 
    ProductKey,
    ModelName,
    EnglishProductName,
    StandardCost,
    ListPrice,
    ProductAlternateKey,
    ListPrice-StandardCost as Markup
FROM
    dimproduct
WHERE ProductAlternateKey like 'FR%'
or ProductAlternateKey like 'BK%';

/* Scrivi un’altra query al fine di esporre l’elenco dei prodotti finiti il cui prezzo di listino 
è compreso tra 1000 e 2000.*/
 SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag,
    ListPrice
FROM
    dimproduct
WHERE FinishedGoodsFlag=1
and ListPrice between 1000 and 2000
order by ListPrice desc;

/*Esplora la tabella degli impiegati aziendali (DimEmployee)*/
select * from dimemployee;

/*Esponi, interrogando la tabella degli impiegati aziendali, l’elenco dei soli agenti. 
Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.*/
select * from dimemployee
where SalesPersonFlag=1;

/*Interroga la tabella delle vendite (FactResellerSales). 
Esponi in output l’elenco delle transazioni registrate a partire dal 1 gennaio 2020 
dei soli codici prodotto: 597, 598, 477, 214. 
Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).*/
select * from factresellersales;
select * from factresellersales
where OrderDate > '2019-12-31';

-- riduzione campi e calcolo transazione,
select SalesOrderNumber, OrderDate, ShipDate, SalesAmount, TotalProductCost, ProductKey,
SalesAmount-TotalProductCost as 'Profit'
from factresellersales
where OrderDate >'2019-12-31'
and ProductKey in (597, 598, 477, 214);
