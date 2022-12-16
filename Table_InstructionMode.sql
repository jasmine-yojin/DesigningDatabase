USE [QueensClassSchedule]
GO

/****** Object:  Table [Schedule].[InstructionMode]    Script Date: 11/29/2022 9:43:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Schedule].[InstructionMode](
	[ModeOfInstructionID] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[ModeOfInstruction] [UDT].[ModeOfInstruction] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_InstructionMode] PRIMARY KEY CLUSTERED 
(
	[ModeOfInstructionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Schedule].[InstructionMode] ADD  CONSTRAINT [DF_InstructionMode_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Schedule].[InstructionMode] ADD  CONSTRAINT [DF__InstructionMode_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Schedule].[InstructionMode]  WITH CHECK ADD  CONSTRAINT [FK_InstructionMode_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Schedule].[InstructionMode] CHECK CONSTRAINT [FK_InstructionMode_UserAuthorization]
GO


