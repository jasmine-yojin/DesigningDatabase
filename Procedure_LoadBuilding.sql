USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[loadBuilding]    Script Date: 11/29/2022 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/27/2022
-- Description:	Load Building Table
-- =============================================
ALTER PROCEDURE [project3].[loadBuilding]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO Ground.building
	(
		abbreviation,
		buildingName,
		userAuthorizationKey

	)
	SELECT DISTINCT
		rt.BuildingAcronym,
		buildingName = CASE
			WHEN rt.BuildingAcronym = 'AR' THEN 'AR-no building'
			when rt.BuildingAcronym ='AE' then 'Alumni Hall'
			when rt.BuildingAcronym = 'DM' then 'Campbell Dome'
			when rt.BuildingAcronym = 'CA' then 'Colden Auditorium'
			when rt.BuildingAcronym = 'CH' then 'Colwin Hall'
			when rt.BuildingAcronym = 'C1' then 'Continuing Ed 1'
			when rt.BuildingAcronym =  'C2' then 'Continuing Ed 2'
			when rt.BuildingAcronym = 'CD' then 'CD-no building'
			when rt.BuildingAcronym = 'DY' then 'Delany Hall'
			when rt.BuildingAcronym = 'DH' then 'Dining Hall'
			when rt.BuildingAcronym = 'FG' then 'FitzGerald Gym'
			when rt.BuildingAcronym = 'FH' then 'Frese Hall'
			when rt.BuildingAcronym = 'GB' then 'G Building'
			when rt.BuildingAcronym = 'GC' then 'Gertz Center'
			when rt.BuildingAcronym = 'GT' then 'Goldstein Theatre'
			when rt.BuildingAcronym = 'HH' then 'Honors Hall'
			when rt.BuildingAcronym = 'IB' then 'I Building'
			when rt.BuildingAcronym = 'JH' then 'Jefferson Hall'
			when rt.BuildingAcronym = 'KY' then 'Kiely Hall'
			when rt.BuildingAcronym = 'KG' then 'King Hall'
			when rt.BuildingAcronym = 'KS' then 'Kissena Hall'
			when rt.BuildingAcronym = 'KP' then 'Klapper Hall'
			when rt.BuildingAcronym = 'MU' then 'Music Building'
			when rt.BuildingAcronym = 'PH' then 'Powdermaker Hall'
			when rt.BuildingAcronym = 'QH' then 'Queens Hall'
			when rt.BuildingAcronym = 'RA' then 'Rathaus Hall'
			when rt.BuildingAcronym = 'RZ' then 'Razran Hall'
			when rt.BuildingAcronym = 'RE' then 'Remsen Hall'
			when rt.BuildingAcronym = 'RO' then 'Rosenthal Library'
			when rt.BuildingAcronym = 'SB' then 'Science Building'
			when rt.BuildingAcronym = 'SU' then 'Student Union'
			when rt.BuildingAcronym = 'SA' then 'Summit Apartments'
			when rt.BuildingAcronym = 'TBA' then 'To be Announced'
			ELSE 'Unknown'
		END         
		,@UserAuthorizationKey

	FROM Uploadfile.RevisedTable AS rt
    
	
	
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM Ground.Building AS b

	PRINT 'Loaded Building Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load Building Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
