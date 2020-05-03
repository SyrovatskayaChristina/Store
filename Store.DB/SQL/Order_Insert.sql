USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[Order_Insert]    Script Date: Вс 03.05.20 23:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[Order_Insert]
@cityId int
as
begin
insert into dbo.[Order](OrderDate, CityId)
values (getdate(), @cityId)
select SCOPE_IDENTITY()
end

