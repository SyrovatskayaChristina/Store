USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[EndedProducts]    Script Date: Вс 03.05.20 18:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EndedProducts]
as
begin
select p.Id,
p.ProductName
from dbo.Product p
inner join dbo.OrderList ol on ol.ProductId=p.Id
left join dbo.Product_Storege ps on ps.ProductId=p.Id
where (ps.Id is null and ol.ProductId is not null) or ps.Quantity=0
group by p.Id,p.ProductName, ps.Id,ps.ProductId,ol.Id
end