USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[OrderWithOrderList_GetById]    Script Date: Вс 03.05.20 23:33:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[OrderWithOrderList_GetById] 
	@Id bigint
as
begin
	select	
		o.Id,
		o.OrderDate,
		c.Id,
		c.Name,
		ol.Id,
		ol.OrderId,
		ol.ProductId,
		ol.Quantity,
		ol.Price,
		p.Id,
		p.Brand,
		p.Model,
		p.ProductName

	from dbo.[Order] o
	join dbo.OrderList ol on ol.OrderId = o.Id
	join dbo.City c on o.CityId = c.Id
	join dbo.Product p on ol.ProductId=p.Id
	where o.Id = @Id
end