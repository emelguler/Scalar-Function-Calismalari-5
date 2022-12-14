USE [Okul]


--Girilen iki degerin belirli sartlar altında ortalamasının harf notu karsiligini veren fonksiyon:

ALTER FUNCTION [dbo].[fn_Harf_Bilgisi2]
(

    @vize INT,
    @final INT
	
)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @harfbilgisi NVARCHAR(10),
            @Ortalama INT
   SET @Ortalama = @vize * 0.4 + @final * 0.6;
    IF @ortalama between 50 and 60 set @harfbilgisi='DD'
	IF @ortalama between 61 and 70 set @harfbilgisi='CC' 
	IF @ortalama between 71 and 80 set @harfbilgisi='CB'
	IF @ortalama between 81 and 90 set @harfbilgisi='BB'
	IF @ortalama between 91 and 100 set @harfbilgisi='AA'
	IF(@ortalama <50) set @harfbilgisi='FF'
	RETURN   @harfbilgisi
END;






--Calistiralim:
select dbo.fn_Harf_Bilgisi2(65,95)






--where clause kontrolü:
select c.vize,c.final,c.ortalama,(case when c.ortalama between 91 and 100 then  'AA'
	        when c.Ortalama between 81 and 90  then  'BB'
			when c.Ortalama between 71 and 80  then  'CB'
			when c.Ortalama between 61 and 70  then  'CC'
			when c.ortalama between 50 and 60  then  'DD'
	   else 'FF' end )AS HARFNOTU from (select  ood.Vize as vize,ood.Final as final, 
(ood.vize*0.4+ood.Final*0.6) as ortalama from dbo.OgrenciOgretmenDers as ood)c
where c.Vize=65
and c.Final=95
