print '%Add db consts%'
go

insert into [Language]([LanguageID],[Name],[LanguageCode])
select 1,'Deutsch','de-AT'
union all
select 2,'Ungarisch',NULL
union all
select 3,'Tschechisch',NULL
union all
select 4,'Slowakisch',NULL
union all
select 5,'Kroatisch',NULL
union all
select 6,'Slowenisch',NULL
union all
select 7,'Rumänisch',NULL
union all
select 8,'Bulgarisch',NULL
go

insert into dbProperties (AustriaCountryID, BusinessValuesBegin,DefaultLanguageID)
values (1,'20031229',1)
go
   
-- add default Worlds
insert into [dbo].[vwWorld]
           ([WorldID],[ExSystemID],[WorldTypeID],[Import],[LanguageID],[Name])
     values
           (101,5555,1,0,1 ,'Administration')
go
insert into [dbo].[vwWorld]
           ([WorldID],[ExSystemID],[WorldTypeID],[Import],[LanguageID],[Name])
     values
           (102,5556,2,0,1 ,'Kassa')
go   