USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Process].[usp_TrackWorkFlow]    Script Date: 11/21/2022 10:08:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Philip Charles
-- Create date: 11/21/2022
-- Description:	Track Work Flow
-- =============================================
CREATE PROCEDURE [Process].[usp_TrackWorkFlow]
      @WorkFlowDescription [UDT].[WFSDescription]
	, @WorkFlowStepTableRowCount [UDT].[WFSRowCount]
	, @StartTime [UDT].[StartTime]
	, @EndTime [UDT].[EndTime] 
	, @UserAuthorizationKey [UDT].[SurrogateKey]
	
AS
BEGIN
	SET NOCOUNT ON;
	

	INSERT INTO Process.WorkflowSteps (
		 WorkFlowStepDescription
		,WorkFlowStepTableRowCount
		,StartingDateTime 
		,EndingDateTime 
		,UserAuthorizationKey 
		)
	VALUES (
		 @WorkFlowDescription
		,@WorkFlowStepTableRowCount
		,@StartTime 
		,@EndTime 
		,@UserAuthorizationKey 
		)

END
GO

