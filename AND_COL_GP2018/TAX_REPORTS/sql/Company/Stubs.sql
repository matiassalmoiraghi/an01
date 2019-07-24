/*Count : 16 */
 
set DATEFORMAT ymd 
GO 
 
/*Begin_nsaIF_UP_MSTR_Nit_I*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_UP_MSTR_Nit_I') and type = 'P')
 drop proc .nsaIF_UP_MSTR_Nit_I
 
go
Create procedure nsaIF_UP_MSTR_Nit_I as
 return
go
/*End_nsaIF_UP_MSTR_Nit_I*/
/*Begin_nsaIF_Validar_Tabla_Nit*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Validar_Tabla_Nit') and type = 'P')
 drop proc .nsaIF_Validar_Tabla_Nit
 
go
Create procedure nsaIF_Validar_Tabla_Nit as
 return
go
/*End_nsaIF_Validar_Tabla_Nit*/
/*Begin_trptIF1001AddRecord*/
if exists (select * from dbo.sysobjects where id = Object_id('.trptIF1001AddRecord') and type = 'P')
 drop proc .trptIF1001AddRecord
 
go
Create procedure trptIF1001AddRecord as
 return
go
/*End_trptIF1001AddRecord*/
/*Begin_ProcessAllHistYears*/
if exists (select * from dbo.sysobjects where id = Object_id('.ProcessAllHistYears') and type = 'P')
 drop proc .ProcessAllHistYears
 
go
Create procedure ProcessAllHistYears as
 return
go
/*End_ProcessAllHistYears*/
/*Begin_ProcessAllOpenYears*/
if exists (select * from dbo.sysobjects where id = Object_id('.ProcessAllOpenYears') and type = 'P')
 drop proc .ProcessAllOpenYears
 
go
Create procedure ProcessAllOpenYears as
 return
go
/*End_ProcessAllOpenYears*/
/*Begin_nsaIF_GL00060*/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nsaIF_GL00060]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) AND
exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nsaIF_GL00070]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) AND
 exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[nsaIF_GL00080]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
Begin

	DECLARE @CNT1	INT
	DECLARE @CNT2	INT
	DECLARE @CNT3	INT
	SELECT @CNT1=COUNT(1) FROM nsaIF_GL00060
	SELECT @CNT2=COUNT(1) FROM nsaIF_GL00070
	SELECT @CNT3=COUNT(1) FROM nsaIF_GL00080 

	IF @CNT1 = 0 AND @CNT2 = 0 AND @CNT3 = 0  
	Begin
		
		INSERT INTO nsaIF_GL00060(nsaIF_Base, ACTNUMST1, nsaIF_Destination, ACTNUMST2,
		ACTINDX, ACTNUMST3, CHANGED) SELECT ACTINDX, '' , ACTINDX , '' , ACTINDX, '' , 1 FROM nsaIF_GL00100 GROUP BY ACTINDX
	
		UPDATE nsaIF_GL00060
		SET ACTNUMST1= GL00105.ACTNUMST
		FROM  GL00105
		WHERE nsaIF_GL00060.nsaIF_Base = GL00105.ACTINDX
	
		UPDATE nsaIF_GL00060
		SET ACTNUMST2= GL00105.ACTNUMST
		FROM  GL00105
		WHERE nsaIF_GL00060.nsaIF_Destination = GL00105.ACTINDX
	
		UPDATE nsaIF_GL00060
		SET ACTNUMST3 = GL00105.ACTNUMST
		FROM  GL00105
		WHERE nsaIF_GL00060.ACTINDX = GL00105.ACTINDX

		INSERT INTO nsaIF_GL00070
		SELECT ACTINDX ,'',ACTINDX ,'','',nsaIF_Code ,nsaIF_Vr1_Reporte, nsaIF_Vr1_Movimiento, Propiedad ,nsaIF_Naturaleza,
		 nsaIF_MM ,nsaIF_CI ,nsaIF_Tax_Type ,nsaIF_Man_Tercero ,nsaIF_CTA_RETEN, nsaIF_Cost_Deduction FROM nsaIF_GL00100
	
	
		UPDATE nsaIF_GL00070
		SET ACTNUMST1= GL00105.ACTNUMST
		FROM  GL00105
		WHERE nsaIF_GL00070.nsaIF_Base = GL00105.ACTINDX
	
	
		UPDATE nsaIF_GL00070
		SET ACTNUMST2= GL00105.ACTNUMST
		FROM  GL00105
		WHERE nsaIF_GL00070.nsaIF_Destination = GL00105.ACTINDX
	
		UPDATE nsaIF_GL00070
		SET ACTNUMST3= rtrim(cast(ACTNUMST1 as varchar)) + rtrim(cast(ACTNUMST2 as varchar))

		INSERT INTO nsaIF_GL00080
		SELECT ACTINDX ,'',ACTINDX ,'','',ACTINDX ,nsaIF_Code, 1, 0 ,0 FROM nsaIF_GL00100
	
		UPDATE nsaIF_GL00080 SET ACTNUMST1= GL00105.ACTNUMST
		FROM  GL00105 WHERE nsaIF_GL00080.nsaIF_Base = GL00105.ACTINDX
	
		UPDATE nsaIF_GL00080 SET ACTNUMST2= GL00105.ACTNUMST
		FROM  GL00105 WHERE nsaIF_GL00080.nsaIF_Destination = GL00105.ACTINDX
	
		UPDATE nsaIF_GL00080 SET ACTNUMST3= GL00105.ACTNUMST
		FROM  GL00105 WHERE nsaIF_GL00080.ACTINDX = GL00105.ACTINDX
	
	End

End
GO
/*End_nsaIF_GL00060*/
/*Begin_nsaIF_Update_Table*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Update_Table') and type = 'P')
 drop proc .nsaIF_Update_Table
 
go
Create procedure nsaIF_Update_Table as
 return
go
/*End_nsaIF_Update_Table*/
/*Begin_ProcessCertificadosHistY*/
if exists (select * from dbo.sysobjects where id = Object_id('.ProcessCertificadosHistY') and type = 'P')
 drop proc .ProcessCertificadosHistY
 
go
Create procedure ProcessCertificadosHistY as
 return
go
/*End_ProcessCertificadosHistY*/
/*Begin_ProcessCertificadosOpenY*/
if exists (select * from dbo.sysobjects where id = Object_id('.ProcessCertificadosOpenY') and type = 'P')
 drop proc .ProcessCertificadosOpenY
 
go
Create procedure ProcessCertificadosOpenY as
 return
go
/*End_ProcessCertificadosOpenY*/
/*Begin_nsaIF_UpdateVendorID*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_UpdateVendorID') and type = 'P')
 drop proc .nsaIF_UpdateVendorID
 
go
Create procedure nsaIF_UpdateVendorID as
 return
go
/*End_nsaIF_UpdateVendorID*/
/*Begin_nsaIF_Cuenta_NIT_Detallado*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Cuenta_NIT_Detallado') and type = 'P')
 drop proc .nsaIF_Cuenta_NIT_Detallado
 
go
Create procedure nsaIF_Cuenta_NIT_Detallado as
 return
go
/*End_nsaIF_Cuenta_NIT_Detallado*/
/*Begin_nsaIF_Cuenta_NIT_Detallado_HIST*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Cuenta_NIT_Detallado_HIST') and type = 'P')
 drop proc .nsaIF_Cuenta_NIT_Detallado_HIST
 
go
Create procedure nsaIF_Cuenta_NIT_Detallado_HIST as
 return
go
/*End_nsaIF_Cuenta_NIT_Detallado_HIST*/
/*Begin_nsaIF_Cuenta_NIT_Resumen*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Cuenta_NIT_Resumen') and type = 'P')
 drop proc .nsaIF_Cuenta_NIT_Resumen
 
go
Create procedure nsaIF_Cuenta_NIT_Resumen as
 return
go
/*End_nsaIF_Cuenta_NIT_Resumen*/
/*Begin_nsaIF_Cuenta_Tercero_Detallado*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Cuenta_Tercero_Detallado') and type = 'P')
 drop proc .nsaIF_Cuenta_Tercero_Detallado
 
go
Create procedure nsaIF_Cuenta_Tercero_Detallado as
 return
go
/*End_nsaIF_Cuenta_Tercero_Detallado*/
/*Begin_nsaIF_Cuenta_Tercero_Detallado_Hist*/
if exists (select * from dbo.sysobjects where id = Object_id('.nsaIF_Cuenta_Tercero_Detallado_Hist') and type = 'P')
 drop proc .nsaIF_Cuenta_Tercero_Detallado_Hist
 
go
Create procedure nsaIF_Cuenta_Tercero_Detallado_Hist as
 return
go
/*End_nsaIF_Cuenta_Tercero_Detallado_Hist*/
/*Begin_Generacion_de_Archivos_Format1007*/
if exists (select * from dbo.sysobjects where id = Object_id('.Generacion_de_Archivos_Format1007') and type = 'P')
 drop proc .Generacion_de_Archivos_Format1007
 
go
Create procedure Generacion_de_Archivos_Format1007 as
 return
go
/*End_Generacion_de_Archivos_Format1007*/