USE [SQL-HW]
GO
/****** Object:  StoredProcedure [dbo].[FindCategoryMoreThen5Goods]    Script Date: Вс 03.05.20 23:31:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[FindCategoryMoreThen5Goods] AS
begin
select  c.Name,
count (1) AS CountProduct
from dbo.Category c
join dbo.Product p on c.Id=p.CategoryId
group by  c.Name
having count(1)>=2
end
 