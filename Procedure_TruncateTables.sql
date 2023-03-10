USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [FinalProject].[TruncateTable]    Script Date: 12/3/2022 12:13:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 12/3/2022
-- Description:	Truncate Tables
-- =============================================
ALTER PROCEDURE [FinalProject].[TruncateTable] 
@UserAuthorizationKey [UDT].[SurrogateKey]

AS
BEGIN

	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

    TRUNCATE TABLE Enrollment.Class
    TRUNCATE TABLE [Enrollment].[Course]
    TRUNCATE TABLE Schedule.InstructionMode
    TRUNCATE TABLE [Schedule].[ClassDayTime]
    TRUNCATE TABLE [HR].[DepartmentInstructor]
    TRUNCATE TABLE [HR].[Department]
    TRUNCATE TABLE [HR].[Instructor]
    TRUNCATE TABLE [Ground].[Room]
    TRUNCATE TABLE [Ground].[Building]

	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT = 0

	PRINT 'Trucated Tables'


    EXEC [Process].[usp_TrackWorkFlow] N'Truncate Tables',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
