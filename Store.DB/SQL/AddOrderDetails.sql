USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[AddOrderDetails]    Script Date: Вс 03.05.20 23:31:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[AddOrderDetails]
@orderId bigint,
@productId bigint,
@quantity int,
@price money
as
begin
insert into dbo.[OrderList](OrderId, ProductId, Quantity,Price)
values ( @orderId,@productId,@quantity,@price)
select SCOPE_IDENTITY()
end
