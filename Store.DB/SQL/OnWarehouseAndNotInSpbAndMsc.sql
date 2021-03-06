USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[OnWarehouseAndNotInSpbAndMsc1]    Script Date: Вс 03.05.20 23:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[OnWarehouseAndNotInSpbAndMsc1] AS
BEGIN
select ps.Id, ps.ProductName,p.Id,
concat(ps.Brand, '' , ps.Model) as Product
from dbo.Product ps
join Product_Storege p on ps.Id=p.ProductId
join City c on p.CityId=c.Id
where c.Id=6 and ProductId not in(
select p.ProductId
from dbo.Product_Storege
where p.CityId in (1,2))
end