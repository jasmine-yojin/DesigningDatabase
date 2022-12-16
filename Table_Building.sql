USE [QueensClassSchedule]
GO

/****** Object:  Table [Ground].[Building]    Script Date: 11/29/2022 9:45:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ground].[Building](
	[BuildingId] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[abbreviation] [UDT].[Abbreviation] NOT NULL,
	[BuildingName] [UDT].[BuildingName] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Ground].[Building] ADD  CONSTRAINT [DF_Building_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Ground].[Building] ADD  CONSTRAINT [DF_Building_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Ground].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Ground].[Building] CHECK CONSTRAINT [FK_Building_UserAuthorization]
GO

ALTER TABLE [Ground].[Building]  WITH CHECK ADD  CONSTRAINT [CK_Building] CHECK  ((LEN([Abbreviation])<=(10) AND LEN([BuildingName])<=(20)))
GO

ALTER TABLE [Ground].[Building] CHECK CONSTRAINT [CK_Building]
GO


