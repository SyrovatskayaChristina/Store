USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[MostPopularProduct]    Script Date: Вс 03.05.20 23:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[MostPopularProduct] AS
BEGIN
select ct.Name,
(select top 1 concat(p.ProductName,' - ' ,p.Brand,' - ', p.Model) as Goods
from dbo.Product p
join dbo.OrderList ol on p.Id=ol.ProductId
join dbo.[Order] o on ol.OrderId=o.Id
join dbo.Category c on c.Id=p.CategoryId
where o.CityId=ct.Id
group by p.Model,p.Brand,p.ProductName
order by sum (ol.Quantity)DESC) as [MostPopularProduct]
From dbo.City ct
end