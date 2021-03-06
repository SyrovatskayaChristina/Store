USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[AddManyOrders]    Script Date: Вс 03.05.20 23:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[AddManyOrders]
as
begin


declare @counter int,
		@OrderDate DateTime2,
		@CityId int,
		@OrderId bigint,
		@ProductId bigint,
		@Quantity int,
		@Price money,
		@OrderListCounter bigint;

set @counter = 0;

while @counter < 50000
begin 


set @OrderDate = (select dateadd(day, rand(checksum(newid()))*(1+datediff(day, '2012-01-01', '2020-04-26')), '2012-01-01')) 
set @CityId = (select top 1 [id] from dbo.City  order by newid())


insert into [dbo].[Order]
           ([OrderDate]
           ,[CityId])
values
           (@OrderDate,
		   @CityId)
		  
		  set @OrderListCounter=(select (ROUND(1+(RAND(CHECKSUM(NEWID()))*5),0)) )
		   set @OrderId= SCOPE_IDENTITY()

 while @OrderListCounter>0

 begin
 set @Price = (select (ROUND(1000+(RAND(CHECKSUM(NEWID()))*49900),0)) )
 set @Quantity=(select (ROUND(1+(RAND(CHECKSUM(NEWID()))*100),0)) )
 set @ProductId=(select (ROUND(200000+(RAND(CHECKSUM(NEWID()))*2000000),0)) )

 insert into [dbo].OrderList
           ([ProductId]
           ,[OrderId]
           ,[Quantity]
		   ,[Price])
values
           (@ProductId,
		   @OrderId,
		   @Quantity,
		   @Price)
set @OrderListCounter -= 1
end;
set @counter = @counter + 1
end;


end

--exec [dbo].[AddManyOrders]