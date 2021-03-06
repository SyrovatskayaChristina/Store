USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[AddManyProducts1]    Script Date: Вс 03.05.20 23:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc  [dbo].[AddManyProducts1]
as
begin

create table #RandomProductsNames
(id int,
 [name] nvarchar(50))

create table #RandomBrand
(id int,
 [name] nvarchar(50))

 create table #RandomModel
(id int,
 [name] nvarchar(50))


insert into #RandomProductsNames
(id, [name])
select 1,'Весы' union
select 2,'Чайник' union
select 3,'Холодильник' union
select 4,'Фен' union
select 5,'Телевизор' union
select 6,'Монитор' union
select 7,'Игровая приставка' union
select 8,'Бинокль' union
select 9,'Фотоаппарат' union
select 10,'Компьютерная мышь'union
select 11,'Клавиатура' union
select 12,'Смартфон' union
select 13,'Утюг' union
select 14,'Духовая печь' union
select 15,'Варочная панель' union
select 16,'Пылесос' union
select 17,'Радиатор' union
select 18,'Планшет' union
select 19,'Видеокамера' union
select 20,'Кофеварка'


 insert into #RandomBrand
(id, [name])
select 1,'Scarlett' union
select 2,'Tefal' union
select 3,'Polaris' union
select 4,'Bork' union
select 5,'Huawei' union
select 6,'Bosch' union
select 7,'Maxwell' union
select 8,'Supra' union
select 9,'Vitek' union
select 10,'DeLonghi' union
select 11,'Gorenje' union
select 12,'Midea' union
select 13,'Miele' union
select 11,'Philips' union
select 12,'Redmond' union
select 13,'Apple' union
select 14,'Samsung' union
select 15,'Dell' union
select 16,'LG' union
select 17,'Philips' union
select 18,'Redmond' union
select 19,'Philips' union
select 20,'Redmond' 

declare @counter int,
		@CityCounter int,
		@Model nvarchar(50),
		@ProductName nvarchar(50),
		@Brand nvarchar(50),
		@CategoryId int,
		@SubCategoryId int,
		@Price money,
		@ProductId bigint,
		@CityId int,
		@Quantity int;

set @counter = 0;

while @counter < 50000
begin 

set @ProductName = (select top 1 [Name]
from #RandomProductsNames
order by newid()
);
set @Brand = (select top 1 [Name]
from #RandomBrand
order by newid()
);
set @Model = (select CONVERT (nvarchar(50), LEFT (newid(),20)))
set @CategoryId = (select top 1 [id] from dbo.Category where ParentId is null  order by newid())
set @SubCategoryId = (select top 1 [id] from dbo.Category where ParentId is not null order by newid())
set @Price = (select (ROUND(1000+(RAND(CHECKSUM(NEWID()))*49900),0)) )

set @CityCounter = (Select (ROUND(1+(Rand (CHECKSUM(NEWID()))*5),0)))

insert into [dbo].[Product]
           ([ProductName]
           ,[Brand]
           ,[Model]
		   ,[CategoryId]
		   ,[SubCategoryId]
		   ,[Price])
values
           (@ProductName,
		   @Brand,
		   @Model,
		   @CategoryId,
		   @SubcategoryId,
		   @Price)

set @ProductId= SCOPE_IDENTITY()

while @CityCounter>0
begin 
set @CityId=(select (ROUND(1+(Rand(CHECKSUM(NEWID()))*5),0)))
set @Quantity=(select (ROUND(1+(RAND(CHECKSUM(NEWID()))*100),0)) )

if  @CityId != 6

insert into [dbo].Product_Storege
           ([ProductId]
           ,[CityId]
           ,[Quantity])
values
           (@ProductId,
		   @CityId,
		   @Quantity)
set @CityCounter = @CityCounter - 1
end;
set @counter = @counter + 1
end;

end

--exec [dbo].[AddManyProducts1]