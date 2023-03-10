USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[loadRoom]    Script Date: 11/29/2022 9:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/27/2022
-- Description:	Load Room Table
-- =============================================
ALTER PROCEDURE [project3].[loadRoom] 
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO Ground.Room
	(
		buildingId,
		roomNum,
		UserAuthorizationKey
	)
	SELECT DISTINCT
		b.buildingId,
		rt.Room,
		@UserAuthorizationKey	
	FROM Uploadfile.RevisedTable AS rt
		INNER JOIN Ground.Building AS b
			ON b.abbreviation = rt.BuildingAcronym
    
    DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM Ground.[Room] 

	PRINT 'Loaded DeptInstructor Room Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load Room Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
