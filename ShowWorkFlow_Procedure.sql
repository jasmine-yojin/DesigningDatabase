USE [QueensClassSchedule]
GO

/****** Object:  StoredProcedure [Process].[usp_ShowWorkFlowSteps]    Script Date: 11/21/2022 10:07:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Philip Charles
-- Create date: 11/21/2022
-- Description:	Show Work Flow Steps
-- ============================================= 
CREATE PROCEDURE [Process].[usp_ShowWorkFlowSteps]
	@UserAuthorizationKey [UDT].[SurrogateKey]
	
AS
BEGIN
	SET NOCOUNT ON;
	
Select *
FROM [Process].[WorkflowSteps];


END
GO

