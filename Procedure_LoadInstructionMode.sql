USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[LoadInstructionMode]    Script Date: 11/29/2022 9:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/28/2022
-- Description:	Load InstructionMode Table
-- =============================================
ALTER PROCEDURE [project3].[LoadInstructionMode] 
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
	DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	INSERT INTO Schedule.InstructionMode
	(
		modeOfInstruction,
		UserAuthorizationKey
	)
	SELECT DISTINCT 
		rt.[Mode of Instruction],
		@UserAuthorizationKey
	FROM Uploadfile.RevisedTable AS rt

    -- Insert statements for procedure here
	DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
	DECLARE @rowcount AS INT
	SELECT @rowcount = COUNT(*) FROM Schedule.InstructionMode

	PRINT 'Loaded InstructionMode Table'

    EXEC [Process].[usp_TrackWorkFlow] N'Load InstructionMode Table',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
