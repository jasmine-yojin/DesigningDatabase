USE [QueensClassSchedule]
GO

/****** Object:  Table [Ground].[Room]    Script Date: 11/29/2022 9:45:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Ground].[Room](
	[roomId] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[buildingId] [UDT].[SurrogateKey] NOT NULL,
	[roomNum] [UDT].[RoomNum] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Ground].[Room] ADD  CONSTRAINT [DF_Room_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Ground].[Room] ADD  CONSTRAINT [DF_Room_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Ground].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Building] FOREIGN KEY([buildingId])
REFERENCES [Ground].[Building] ([BuildingId])
GO

ALTER TABLE [Ground].[Room] CHECK CONSTRAINT [FK_Room_Building]
GO

ALTER TABLE [Ground].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Ground].[Room] CHECK CONSTRAINT [FK_Room_UserAuthorization]
GO


