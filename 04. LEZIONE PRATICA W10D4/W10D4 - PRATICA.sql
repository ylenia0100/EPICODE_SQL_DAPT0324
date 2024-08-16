/*1.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria 
(DimProduct, DimProductSubcategory).*/
-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
select
dimproduct.EnglishProductName,
dimproductsubcategory.EnglishProductSubcategoryName
from dimproduct
inner join dimproductsubcategory 
on dimproduct.ProductSubcategoryKey=dimproductsubcategory.ProductSubcategoryKey;

/*2.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e 
la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory).*/
-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;
select
dimproduct.EnglishProductName,
dimproductcategory.EnglishProductCategoryName,
dimproductsubcategory.EnglishProductSubcategoryName
from dimproduct
inner join dimproductsubcategory 
on dimproduct.ProductSubcategoryKey=dimproductsubcategory.ProductSubcategoryKey
inner join dimproductcategory
on dimproductcategory.ProductCategoryKey=dimproductsubcategory.ProductCategoryKey;

/*3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales).*/
select distinct
dimproduct.ProductKey,
dimproduct.EnglishProductName
-- factresellersales.SalesOrderNumber
from
dimproduct
inner join
factresellersales
on dimproduct.ProductKey = factresellersales.ProductKey;

/*4.Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti 
cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).*/
select * from dimproduct
where dimproduct.ProductKey not in (select ProductKey from factresellersales)
and FinishedGoodsFlag=1;

/*5.Esponi l’elenco delle transazioni di vendita (FactResellerSales) 
indicando anche il nome del prodotto venduto (DimProduct)*/
select 
factresellersales.SalesOrderNumber,
factresellersales.SalesOrderLineNumber,
dimproduct.EnglishProductName,
factresellersales.OrderDate,
factresellersales.OrderQuantity,
factresellersales.ShipDate,
factresellersales.UnitPrice,
factresellersales.TotalProductCost
from factresellersales
inner join dimproduct
on factresellersales.ProductKey=dimproduct.ProductKey
order by factresellersales.SalesOrderNumber , factresellersales.SalesOrderLineNumber , 
dimproduct.EnglishProductName, factresellersales.OrderDate;

/*6.Esponi l’elenco delle transazioni di vendita indicando 
la categoria di appartenenza di ciascun prodotto venduto.*/
select 
dimproduct.EnglishProductName, 
dimproductcategory.EnglishProductCategoryName,
dimproductsubcategory.EnglishProductSubcategoryName,
factresellersales.SalesOrderNumber,
factresellersales.SalesOrderLineNumber,
factresellersales.OrderDate,
factresellersales.OrderQuantity,
factresellersales.ShipDate,
factresellersales.TotalProductCost
from factresellersales
join dimproduct
join dimproductcategory
join dimproductsubcategory
where factresellersales.ProductKey=dimproduct.ProductKey
and dimproduct.ProductSubcategoryKey=dimproductsubcategory.ProductSubcategoryKey
and dimproductcategory.ProductCategoryKey=dimproductsubcategory.ProductCategoryKey;

/*7.Esplora la tabella DimReseller.*/
select * from dimreseller;

/*8.Esponi in output l’elenco dei reseller indicando, per ciascun reseller, 
anche la sua area geografica.*/
select
dimreseller.ResellerName,
dimreseller.ResellerKey,
dimgeography.City,
dimgeography.StateProvinceName,
dimgeography.EnglishCountryRegionName,
dimsalesterritory.SalesTerritoryCountry,
dimsalesterritory.SalesTerritoryRegion
from
dimreseller
inner join
dimgeography 
on
dimreseller.GeographyKey=dimgeography.GeographyKey
inner join
dimsalesterritory
on
dimgeography.SalesTerritoryKey=dimsalesterritory.SalesTerritoryKey;

/*9-Esponi l’elenco delle transazioni di vendita. 
Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, 
UnitPrice, Quantity, TotalProductCost. 
Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, 
il nome del reseller e l’area geografica.*/
SELECT 
    factresellersales.SalesOrderNumber,
    factresellersales.SalesOrderLineNumber,
    factresellersales.OrderDate,
    factresellersales.UnitPrice,
    factresellersales.OrderQuantity,
    factresellersales.TotalProductCost,
    dimproduct.EnglishProductName,
    dimproductcategory.EnglishProductCategoryName,
    dimreseller.ResellerName,
    dimsalesterritory.SalesTerritoryCountry,
    dimgeography.EnglishCountryRegionName,
    dimgeography.StateProvinceCode,
    dimgeography.StateProvinceName,
    dimgeography.City
FROM factresellersales
JOIN dimproduct
JOIN dimproductcategory
JOIN dimproductsubcategory
JOIN dimreseller
JOIN dimsalesterritory
JOIN dimgeography
WHERE
    factresellersales.ProductKey = dimproduct.ProductKey
        AND dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        AND dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey
        AND factresellersales.ResellerKey = dimreseller.ResellerKey
        AND dimsalesterritory.SalesTerritoryKey = factresellersales.SalesTerritoryKey
        AND dimgeography.GeographyKey = dimreseller.GeographyKey;
