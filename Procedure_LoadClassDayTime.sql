USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[loadClassDayTime]    Script Date: 11/29/2022 9:34:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/28/2022
-- Description:	Load ClassDayTime Table
-- =============================================
ALTER PROCEDURE [project3].[loadClassDayTime]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO Schedule.ClassDayTime
	(
		ClassDay,
		ClassTime,
		UserAuthorizationKey
	)
	SELECT DISTINCT
		rt.[Day],
		rt.[Time],
		@UserAuthorizationKey
	FROM Uploadfile.RevisedTable AS rt
    
    DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM Schedule.ClassDayTime

	PRINT 'Loaded ClassDayTime Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load ClassDayTime Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
