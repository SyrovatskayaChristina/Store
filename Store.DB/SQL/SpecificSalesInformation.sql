USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[SpecificSalesInformation]    Script Date: Вс 03.05.20 19:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SpecificSalesInformation] 

@dateFrom DateTime2,
@dateTo DateTime2
as
BEGIN
select 
o.Id,
c.Id,c.Name,

sum(p.Price*ol.Quantity) TotalCost,
sum(ol.Quantity) as TotalQuantity,
p.Id,p.ProductName,p.Model,p.Brand
from dbo.OrderList ol

join dbo.Product p on ol.ProductId=p.Id
join dbo.Category cat on cat.Id=p.CategoryId

join dbo.[Order] o on ol.OrderId=o.Id
join dbo.City c on o.CityId=c.Id
where ("OrderDate" between @dateFrom and @dateTo)
group by c.Name, p.SubCategoryId,c.Name, p.Model, p.Brand,p.ProductName,o.Id,c.Id,p.Id;
end