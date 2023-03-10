USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [FinalProject].[DropForeignKeys]    Script Date: 12/3/2022 11:21:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/26/22
-- Description:	Drop Foreign Keys
-- =============================================
ALTER PROCEDURE [FinalProject].[DropForeignKeys]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	--INSTRUCTOR TABLE
    ALTER TABLE HR.Instructor
		DROP CONSTRAINT FK_Instructor_UserAuthorization

	-- DEPARTMENT TABLE
	ALTER TABLE HR.Department
		DROP CONSTRAINT FK_Department_UserAuthorization
	-- DEPTINSTRUCTOR TABLE
	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_UserAuthorization
	
	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_Department

	ALTER TABLE hr.departmentInstructor
		DROP CONSTRAINT FK_DepartmentInstructor_Instructor

	-- COURSE TABLE
	ALTER TABLE Enrollment.Course
		DROP CONSTRAINT FK_Course_UserAuthorization

	ALTER TABLE Enrollment.Course
		DROP CONSTRAINT FK_Course_Department
	--BUILDING TABLE
	ALTER TABLE Ground.Building
		DROP CONSTRAINT FK_Building_UserAuthorization
	--ROOM TABLE
	ALTER TABLE Ground.Room
		DROP CONSTRAINT FK_Room_Building

	ALTER TABLE Ground.Room
		DROP CONSTRAINT FK_Room_UserAuthorization

	--ClassDayTime table
	ALTER TABLE Schedule.ClassDayTime
		DROP CONSTRAINT FK_ClassDayTime_UserAuthorization
	--InstructionMode table
	ALTER TABLE Schedule.InstructionMode
		DROP CONSTRAINT FK_InstructionMode_UserAuthorization 

	--Class Table
	
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_ClassDayTime
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Course
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_InstructionMode
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Instructor
	ALTER TABLE Enrollment.Class
		DROP CONSTRAINT FK_Class_Room

	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT = 0
	
	EXEC [Process].[usp_TrackWorkFlow] N'Load Departments',@rowcount,@starttime,@endtime,@UserAuthorizationKey

	PRINT 'Dropped All Foreign Keys'
END
