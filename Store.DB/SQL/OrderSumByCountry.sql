USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[OrderSumByCountry]    Script Date: Вс 03.05.20 23:33:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[OrderSumByCountry] AS
BEGIN
select [0] as 'SalesMadeInRF', [1] as 'SalesMadeAbroad'
from(
Select 
sum(p.Price*ol.Quantity) SumPrice,
c.IsForeign s
from dbo.[Order] o
join dbo.OrderList ol on ol.OrderId=o.Id
join dbo.Product p on ol.ProductId=p.Id
join dbo.City c on o.CityId=c.Id
group by c.IsForeign) f
pivot
(
AVG (SumPrice)
for f.s in ([0],[1]) 
)AS pvt
END