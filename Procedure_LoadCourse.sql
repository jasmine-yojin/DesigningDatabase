USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [FinalProject].[loadCourse]    Script Date: 12/3/2022 11:40:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/27/2022
-- Description:	Load Course Table
-- =============================================
ALTER PROCEDURE [FinalProject].[loadCourse]
	@UserAuthorizationKey [UDT].[SurrogateKey]

AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Enrollment.Course
	(
		DepartmentId,
		CourseCode,
		courseDescription,
		CourseHour,
		CourseCredit,
		UserAuthorizationKey
    
	)
	SELECT DISTINCT
		d.DepartmentId,
		rt.CourseCode,
		rt.Description,
		rt.CourseHour,
		rt.CourseCredit,
		@UserAuthorizationKey
	FROM Uploadfile.RevisedTable AS rt
		INNER JOIN HR.Department AS d
			ON d.DepartmentCode = rt.DepartmentAcronym

	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM Enrollment.Course

	PRINT 'Loaded Course Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load Course Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END