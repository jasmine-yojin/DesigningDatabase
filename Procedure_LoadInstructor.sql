USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[LoadInstructor]    Script Date: 11/29/2022 9:38:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/26/2022
-- Description:	Load Instructor Table
-- =============================================
ALTER PROCEDURE [project3].[LoadInstructor] 
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO hr.Instructor
		(
			FirstName,
			LastName,
			UserAuthorizationKey
  
		)
	SELECT DISTINCT
		rt.InstructorFirstName,
		rt.InstructorLastName,
		@UserAuthorizationKey	
    
	FROM Uploadfile.RevisedTable AS rt

    DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM [HR].[Instructor]

	PRINT 'Loaded Instructor Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load Instructors',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
