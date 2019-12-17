
	declare @SYSDBNAME CHAR(80)
	if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SY00100]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	 select top 1 @SYSDBNAME = DBNAME from SY00100
	else
	 set @SYSDBNAME = 'DYNAMICS'

	--PRINT @SYSDBNAME 
	----------------------------------------------------------------------------------------------------------------------------------------------------
	if OBJECT_ID('dbo.synonymMESSAGES') is not null
		DROP SYNONYM dbo.synonymMESSAGES;
		
	EXEC ('create synonym dbo.synonymMESSAGES for ' +  @SYSDBNAME+'..MESSAGES;');

	IF (@@Error = 0) PRINT 'Creación exitosa del synonym: synonymMESSAGES'
	ELSE PRINT 'Error en la creación del synonym: synonymMESSAGES'
	----------------------------------------------------------------------------------------------------------------------------------------------------
	if OBJECT_ID('dbo.synonymAccountSegments') is not null
		DROP SYNONYM dbo.synonymAccountSegments;
	
	EXEC ('create synonym dbo.synonymAccountSegments for ' +  @SYSDBNAME+'..SY00302;');
	
	IF (@@Error = 0) PRINT 'Creación exitosa del synonym: synonymAccountSegments'
	ELSE PRINT 'Error en la creación del synonym: synonymAccountSegments'

	----------------------------------------------------------------------------------------------------------------------------------------------------
	--stored procedure
	if OBJECT_ID('dbo.synonymSpSmGetMsgString') is not null
		DROP SYNONYM dbo.synonymSpSmGetMsgString;
	
	EXEC ('create synonym dbo.synonymSpSmGetMsgString for ' +  @SYSDBNAME+'.dbo.smGetMsgString;');
	
	IF (@@Error = 0) PRINT 'Creación exitosa del synonym: synonymSpSmGetMsgString'
	ELSE PRINT 'Error en la creación del synonym: synonymSpSmGetMsgString'


	GO


-----------------------------------------------------------------------------

--DECLARE 		@l_cTrxSrc          varchar(255), 	@l_nSQL_Error_State int
--exec  DBO.synonymSpSmGetMsgString 15575, 'PER10', @l_cTrxSrc output, @l_nSQL_Error_State output
--SELECT @l_cTrxSrc, @l_nSQL_Error_State

