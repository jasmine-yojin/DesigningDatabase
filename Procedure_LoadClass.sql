USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [FinalProject].[LoadClass]    Script Date: 12/3/2022 11:40:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/29/2022
-- Description:	Load Class Table
-- =============================================
ALTER PROCEDURE [FinalProject].[LoadClass]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

    INSERT INTO Enrollment.Class
(
    CourseId,
    InstructorNum,
    ModeOfInstructionId,
    ClassTimeId,
    RoomId,
    UserAuthorizationKey,
    ClassCode,
    ClassSection,
    MaxEnrollment,
    Enrollment
)
SELECT DISTINCT 
    c.CourseId,    -- CourseId - SurrogateKey
    i.InstructorNum,    -- InstructorNum - SurrogateKey
    im.ModeOfInstructionID,    -- ModeOfInstructionId - SurrogateKey
    cdt.ClassTimeID,    -- ClassTimeId - SurrogateKey
    r.roomId,    -- RoomId - SurrogateKey
    3,    -- UserAuthorizationKey - SurrogateKey
    rt.ClassCode,    -- ClassCode - ClassCode
    rt.ClassSec,    -- ClassSection - ClassSection
    CAST (rt.limit AS INT),    -- MaxEnrollment - MaxEnrollment
    CAST (rt.Enrolled AS INT)     -- Enrollment - Enrollment
FROM Uploadfile.RevisedTable AS rt 
	INNER JOIN	Enrollment.Course AS c
		ON c.CourseCode = rt.CourseCode AND
           c.CourseHour = rt.CourseHour AND 
		   c.CourseCredit = rt.CourseCredit
	INNER JOIN HR.Department AS d
		ON d.departmentId = c.DepartmentId AND
		   d.DepartmentCode = rt.DepartmentAcronym
	INNER JOIN HR.Instructor AS i
		ON i.FirstName = rt.InstructorFirstName AND
           i.LastName = rt.InstructorLastName
	INNER JOIN Schedule.InstructionMode AS im
		ON im.ModeOfInstruction = rt.[Mode of Instruction]
	INNER JOIN Schedule.ClassDayTime AS cdt
		ON cdt.ClassDay = rt.[Day] AND
          cdt.ClassTime = rt.[Time]
	INNER JOIN Ground.Room AS r
		ON r.roomNum = rt.room
	INNER JOIN Ground.Building AS b
		ON b.BuildingId = r.buildingId AND
           b.abbreviation = rt.BuildingAcronym
	
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT 
	SELECT @rowcount = COUNT(*) FROM Enrollment.Class
	PRINT 'Loaded Class Table'


    EXEC [Process].[usp_TrackWorkFlow] N'Load Class Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
