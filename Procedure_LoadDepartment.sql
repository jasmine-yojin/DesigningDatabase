USE [QueensClassSchedule]
GO
/****** Object:  StoredProcedure [project3].[LoadDepartments]    Script Date: 11/29/2022 9:35:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jasmine Kim
-- Create date: 11/25/22
-- Description:	Insert Departments into department table
-- =============================================

ALTER PROCEDURE [project3].[LoadDepartments]
	@UserAuthorizationKey [UDT].[SurrogateKey]
AS
BEGIN
DECLARE @starttime AS DATETIME2(7) = SYSDATETIME()
	SET NOCOUNT ON;

	
INSERT INTO HR.Department
	(
		UserAuthorizationKey,
		DepartmentCode,
		DepartmentName
	)

	SELECT DISTINCT
		@UserAuthorizationKey,
		rt.DepartmentAcronym,
		DepartmentName = CASE 
	 		WHEN rt.DepartmentAcronym = 'ACCT' THEN N'Accounting & Information Systems'
			WHEN rt.DepartmentAcronym = 'AFST' THEN N'African Studies'
			WHEN rt.DepartmentAcronym = 'AMST' THEN N'American Studies'
			WHEN rt.DepartmentAcronym = 'ANTH' THEN N'Anthropology'
			WHEN rt.DepartmentAcronym = 'ARAB' THEN N'Arabic, Islamic, and Middle Eastern Studies'
			WHEN rt.DepartmentAcronym = 'ARTH' THEN N'Anthropology'
			WHEN rt.DepartmentAcronym = 'ARTS' THEN N'Art Studio'
			WHEN rt.DepartmentAcronym = 'ASTR' THEN N'Astronomy'
			WHEN rt.DepartmentAcronym = 'BALA' THEN N'Business and Liberal Arts'
			WHEN rt.DepartmentAcronym = 'BIOCH' THEN N'Biochemistry'
			WHEN rt.DepartmentAcronym = 'BIOL' THEN N'Biology'
			WHEN rt.DepartmentAcronym = 'BUS' THEN N'Business'
			WHEN rt.DepartmentAcronym = 'CERT' THEN N'Accounting & Information Systems'
			WHEN rt.DepartmentAcronym = 'CESL' THEN N'College English as a Second Language'
			WHEN rt.DepartmentAcronym = 'CHEM' THEN N'Chemistry'
			WHEN rt.DepartmentAcronym = 'CHIN' THEN N'Chinese'
			WHEN rt.DepartmentAcronym = 'CLAS' THEN N'Classics'
			WHEN rt.DepartmentAcronym = 'CMAL' THEN N'Cultural Studies'
			WHEN rt.DepartmentAcronym = 'CMLIT' THEN N'Comparative Literature'
			WHEN rt.DepartmentAcronym = 'CO-OP' THEN N'Cooperative Education & Internships'
			WHEN rt.DepartmentAcronym = 'CSCI' THEN N'Computer Science'
			WHEN rt.DepartmentAcronym = 'CUNBA' THEN N'CUNY BA'
			WHEN rt.DepartmentAcronym = 'DANCE' THEN N'Dance'
			WHEN rt.DepartmentAcronym = 'DRAM' THEN N'Drama, Theatre & Dance'
			WHEN rt.DepartmentAcronym = 'EAST' THEN N'East Asian Studies'
			WHEN rt.DepartmentAcronym = 'ECON' THEN N'Economics'
			WHEN rt.DepartmentAcronym = 'ECPCE' THEN N'School Counseling'
			WHEN rt.DepartmentAcronym = 'ECPEL' THEN N'School Leadership'
			WHEN rt.DepartmentAcronym = 'ECPSE' THEN N'Foundations of Special Education'
			WHEN rt.DepartmentAcronym = 'ECPSP' THEN N'School Psychology'
			WHEN rt.DepartmentAcronym = 'EECE' THEN N'NYS Initial Certification in Childhood Education'
			WHEN rt.DepartmentAcronym = 'ENGL' THEN N'English'
			WHEN rt.DepartmentAcronym = 'ENSCI' THEN N'Environmental Science'
			WHEN rt.DepartmentAcronym = 'EURO' THEN N'European Language and Literature'
			WHEN rt.DepartmentAcronym = 'FNES' THEN N'Family, Nutrition & Exercise Sciences'
			WHEN rt.DepartmentAcronym = 'FREN' THEN N'French'
			WHEN rt.DepartmentAcronym = 'GEOL' THEN N'Geology'
			WHEN rt.DepartmentAcronym = 'GERM' THEN N'German'
			WHEN rt.DepartmentAcronym = 'GREEK' THEN N'Greek'
			WHEN rt.DepartmentAcronym = 'GRKMD' THEN N'Modern Greek'
			WHEN rt.DepartmentAcronym = 'GRKST' THEN N'Greek Studies'
			WHEN rt.DepartmentAcronym = 'HEBRW' THEN N'Courses in Hebrew'
			WHEN rt.DepartmentAcronym = 'HIST' THEN N'History'
			WHEN rt.DepartmentAcronym = 'HMNS' THEN N'Honors in the Mathematical & Natural Sciences'
			WHEN rt.DepartmentAcronym = 'HNRS' THEN N'Honors in the Liberal Arts'
			WHEN rt.DepartmentAcronym = 'HSS' THEN N'Honors in Social Sciences'
			WHEN rt.DepartmentAcronym = 'HTH' THEN N'Honors in the Humanities'
			WHEN rt.DepartmentAcronym = 'IRST' THEN N'Irish Studies'
			WHEN rt.DepartmentAcronym = 'ITAL' THEN N'Italian'
			WHEN rt.DepartmentAcronym = 'JAZZ' THEN N'Jazz'
			WHEN rt.DepartmentAcronym = 'JEWST' THEN N'Jewish Studies'
			WHEN rt.DepartmentAcronym = 'JOURN' THEN N'Journalism'
			WHEN rt.DepartmentAcronym = 'JPNS' THEN N'Japanese'
			WHEN rt.DepartmentAcronym = 'KOR' THEN N'Korean'
			WHEN rt.DepartmentAcronym = 'LABST' THEN N'Labor Studies'
			WHEN rt.DepartmentAcronym = 'LATIN' THEN N'Latin'
			WHEN rt.DepartmentAcronym = 'LBLST' THEN N'Library and Information Studies'
			WHEN rt.DepartmentAcronym = 'LBSCI' THEN N'Libary Science'
			WHEN rt.DepartmentAcronym = 'LCD' THEN N'Linguistics & Communication'
			WHEN rt.DepartmentAcronym = 'LIBR' THEN N'Library'
			WHEN rt.DepartmentAcronym = 'MAM' THEN N'Maintenance Matriculation'
			WHEN rt.DepartmentAcronym = 'MATH' THEN N'Mathematics'
			WHEN rt.DepartmentAcronym = 'MEDST' THEN N'Media Studies'
			WHEN rt.DepartmentAcronym = 'MES' THEN N'Middle Eastern Studies'
			WHEN rt.DepartmentAcronym = 'MUSIC' THEN N'The Aaron Copland School of Music'
			WHEN rt.DepartmentAcronym = 'PERM' THEN N'Permit to Cuny College'
			WHEN rt.DepartmentAcronym = 'PHIL' THEN N'Philosophy'
			WHEN rt.DepartmentAcronym = 'PHYS' THEN N'Physics'
			WHEN rt.DepartmentAcronym = 'PORT' THEN N'Portuguese'
			WHEN rt.DepartmentAcronym = 'PSCI' THEN N'Political Science'
			WHEN rt.DepartmentAcronym = 'PSYCH' THEN N'Psychology'
			WHEN rt.DepartmentAcronym = 'RLGST' THEN N'Regligious Studies'
			WHEN rt.DepartmentAcronym = 'RM' THEN N'Risk Management'
			WHEN rt.DepartmentAcronym = 'RUSS' THEN N'Russian'
			WHEN rt.DepartmentAcronym = 'SEEK' THEN N'Special Programs'
			WHEN rt.DepartmentAcronym = 'SEYS' THEN N'Secondary Education & Youth Services'
			WHEN rt.DepartmentAcronym = 'SEYSL' THEN N'Secondary Education: Literacy Education'
			WHEN rt.DepartmentAcronym = 'SOC' THEN N'Sociology'
			WHEN rt.DepartmentAcronym = 'SPAN' THEN N'Spanish'
			WHEN rt.DepartmentAcronym = 'SPST' THEN N'Interdisciplinary and Special Studies'
			WHEN rt.DepartmentAcronym = 'STABD' THEN N'Accounting & Information Systems'
			WHEN rt.DepartmentAcronym = 'STPER' THEN N'Student Personnel'
			WHEN rt.DepartmentAcronym = 'URBST' THEN N'Urban Studies'
			WHEN rt.DepartmentAcronym = 'WGS' THEN N'Women and Gender Studies'
			ELSE 'Unknown Department'
	 	END
	FROM Uploadfile.RevisedTable AS rt
			
			DECLARE @endtime AS DATETIME2(7) = SYSDATETIME()
			DECLARE @rowcount AS INT
			SELECT @rowcount = COUNT(*) FROM [HR].[Department]

       EXEC [Process].[usp_TrackWorkFlow] N'Load Departments',@rowcount,@starttime,@endtime,@UserAuthorizationKey
END
