USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [FinalProject].[AddForeignKeys]    Script Date: 12/3/2022 11:22:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/28/2022
-- Description:	Add Foreign Keys
-- =============================================
ALTER PROCEDURE [FinalProject].[AddForeignKeys]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	--BUILDING TABLE
	ALTER TABLE Ground.Building
		ADD CONSTRAINT FK_Building_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

	--ROOM TABLE
	ALTER TABLE Ground.Room
		ADD CONSTRAINT FK_Room_Building
			FOREIGN KEY (buildingId) REFERENCES Ground.Building (BuildingId)

	ALTER TABLE Ground.Room
		ADD CONSTRAINT FK_Room_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

	--INSTRUCTOR TABLE
	ALTER TABLE HR.Instructor
		ADD CONSTRAINT FK_Instructor_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

	--DEPTINSTRUCTOR TABLE
	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_Instructor
			FOREIGN KEY (InstructorNum) REFERENCES HR.Instructor (InstructorNum)

	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_Department
			FOREIGN KEY (DepartmentID) REFERENCES HR.Department (departmentId)

	ALTER TABLE HR.DepartmentInstructor
		ADD CONSTRAINT FK_DepartmentInstructor_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)

			

	--DEPARTMENT TABLE
	ALTER TABLE HR.Department
		ADD CONSTRAINT FK_Department_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)
	
	--COURSE TABLE
	ALTER TABLE Enrollment.Course
		ADD CONSTRAINT FK_Course_Department
			FOREIGN KEY (DepartmentId) REFERENCES HR.Department (departmentId) 

	ALTER TABLE Enrollment.Course
		ADD CONSTRAINT FK_Course_UserAuthorization
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey)
	--CLASSDAYTIME TABLE
	ALTER TABLE Schedule.ClassDayTime
		ADD CONSTRAINT FK_ClassDayTime_UserAuthorization 
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization (UserAuthorizationKey) 

	--INSTRUCTION MODE TABLE
	ALTER TABLE Schedule.InstructionMode
		ADD CONSTRAINT FK_InstructionMode_UserAuthorization 
			FOREIGN KEY (UserAuthorizationKey) REFERENCES DbSecurity.UserAuthorization(UserAuthorizationKey)

	--CLASS TABLE
	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Course
			FOREIGN KEY (CourseId) REFERENCES Enrollment.Course (CourseId)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Instructor 
	 		FOREIGN KEY (InstructorNum) REFERENCES HR.Instructor (InstructorNum)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_InstructionMode
		 	FOREIGN KEY (ModeOfInstructionID) REFERENCES Schedule.InstructionMode (ModeOfInstructionID)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_ClassDayTime 
	 		FOREIGN KEY (ClassTimeId) REFERENCES Schedule.ClassDayTime (ClassTimeID)

	ALTER TABLE Enrollment.Class
		ADD CONSTRAINT FK_Class_Room
			FOREIGN KEY (RoomId) REFERENCES Ground.Room (roomId)	
	

	
	
	
	
	
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT = 0

	PRINT 'Added Foreign Keys'


    EXEC [Process].[usp_TrackWorkFlow] N'Add Foreign Keys',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
