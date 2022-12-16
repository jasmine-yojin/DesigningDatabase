USE [QueensClassSchedule]
GO

/****** Object:  Table [Enrollment].[Course]    Script Date: 12/3/2022 11:42:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Enrollment].[Course](
	[CourseId] [UDT].[SurrogateKey] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [UDT].[SurrogateKey] NOT NULL,
	[CourseCode] [UDT].[CourseCode] NOT NULL,
	[courseDescription] [UDT].[CourseDescription] NOT NULL,
	[CourseCredit] [UDT].[CourseCredit] NOT NULL,
	[UserAuthorizationKey] [UDT].[SurrogateKey] NOT NULL,
	[DateAdded] [UDT].[DateAdded] NOT NULL,
	[dateOfLastUpdate] [UDT].[DateOfLastUpdate] NOT NULL,
	[CourseHour] [UDT].[CourseHour] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Enrollment].[Course] ADD  CONSTRAINT [DF_Course_DateAdded]  DEFAULT (SYSDATETIME()) FOR [DateAdded]
GO

ALTER TABLE [Enrollment].[Course] ADD  CONSTRAINT [DF_Course_DateOfLastUpdate]  DEFAULT (SYSDATETIME()) FOR [dateOfLastUpdate]
GO

ALTER TABLE [Enrollment].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [HR].[Department] ([departmentId])
GO

ALTER TABLE [Enrollment].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO

ALTER TABLE [Enrollment].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_UserAuthorization] FOREIGN KEY([UserAuthorizationKey])
REFERENCES [DbSecurity].[UserAuthorization] ([UserAuthorizationKey])
GO

ALTER TABLE [Enrollment].[Course] CHECK CONSTRAINT [FK_Course_UserAuthorization]
GO


