SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [FinalProject].LoadQueensClassSchedule 
	@UserAuthorizationKey [UDT].[SurrogateKey]
	
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	TRUNCATE TABLE Process.WorkflowSteps
	
	EXEC FinalProject.DropForeignKeys @UserAuthorizationKey
	EXEC FinalProject.TruncateTable @UserAuthorizationKey
	EXEC [FinalProject].[LoadDepartments] @UserAuthorizationKey
	EXEC [FinalProject].[LoadInstructor] @UserAuthorizationKey
	EXEC [FinalProject].[LoadInstructionMode] @UserAuthorizationKey	
	EXEC [FinalProject].[loadBuilding] @UserAuthorizationKey
	EXEC [FinalProject].[loadRoom] @UserAuthorizationKey
	EXEC [FinalProject].[loadClassDayTime] @UserAuthorizationKey
	EXEC [FinalProject].[loadCourse] @UserAuthorizationKey
	EXEC [FinalProject].[LoadClass]	@UserAuthorizationKey

	EXEC FinalProject.AddForeignKeys @UserAuthorizationKey
	
	
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT = 0

	PRINT 'Loaded QueensClassSchedule Database'
	
    EXEC [Process].[usp_TrackWorkFlow] N'Load QueensClassSchedule Database',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
GO
