USE [master]
GO
/****** Object:  Database [Laquev_timesheet_management]    Script Date: 11/1/2014 7:20:11 PM ******/
CREATE DATABASE [Laquev_timesheet_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Laquev_timesheet_managementt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Laquev_timesheet_managementt.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Laquev_timesheet_managementt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Laquev_timesheet_managementt_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Laquev_timesheet_management] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Laquev_timesheet_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Laquev_timesheet_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Laquev_timesheet_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Laquev_timesheet_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Laquev_timesheet_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Laquev_timesheet_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Laquev_timesheet_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET RECOVERY FULL 
GO
ALTER DATABASE [Laquev_timesheet_management] SET  MULTI_USER 
GO
ALTER DATABASE [Laquev_timesheet_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Laquev_timesheet_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Laquev_timesheet_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Laquev_timesheet_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Laquev_timesheet_management', N'ON'
GO
USE [Laquev_timesheet_management]
GO
/****** Object:  StoredProcedure [dbo].[efficiency]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[efficiency]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@Currentmonth date 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, MONTH(SYSDATETIME()) AS Month, COUNT(*) 
                         AS Total_worked_days, SUM(tblTime_Record_1.Total_per_day) AS Worked_hours_per_day, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day, 
                         COUNT(*) * dbo.tblStaff_info.Hrs_per_day AS deserved, SUM(tblTime_Record_1.Total_per_day) / (COUNT(*) * dbo.tblStaff_info.Hrs_per_day) AS Efficiency, 
                         dbo.tblStaff_info.Del_status
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record AS tblTime_Record_1 ON dbo.tblStaff_info.Staff_id = tblTime_Record_1.Staff_id INNER JOIN
                         dbo.tblJob_Title ON dbo.tblStaff_info.Jop_id = dbo.tblJob_Title.Job_id
WHERE        (MONTH(tblTime_Record_1.Date) = MONTH(@Currentmonth)) AND (tblTime_Record_1.Day_status = 'Normal')
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day, 
                         dbo.tblStaff_info.Del_status
ORDER BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Profession
END

GO
/****** Object:  StoredProcedure [dbo].[efficiency1]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[efficiency1]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@Currentmonth date 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, format(SYSDATETIME(),'MMMM yyyy') AS Month, COUNT(*) 
                         AS Total_worked_days,ROUND ( SUM(tblTime_Record_1.Total_per_day) ,4)AS Worked_hours_per_day, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day, 
                         COUNT(*) * dbo.tblStaff_info.Hrs_per_day AS deserved,ROUND ( SUM(tblTime_Record_1.Total_per_day) / (COUNT(*) * dbo.tblStaff_info.Hrs_per_day),4) AS Efficiency 
                    
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record AS tblTime_Record_1 ON dbo.tblStaff_info.Staff_id = tblTime_Record_1.Staff_id INNER JOIN
                         dbo.tblJob_Title ON dbo.tblStaff_info.Jop_id = dbo.tblJob_Title.Job_id
WHERE       ( format(tblTime_Record_1.Date,'MMMM yyyy') = format(@Currentmonth,'MMMM yyyy')) AND (tblTime_Record_1.Day_status = 'Normal')
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day
                        
ORDER BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Profession
END

GO
/****** Object:  StoredProcedure [dbo].[realtime]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[realtime] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@Currentdate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession,FORMAT ( dbo.tblTime_Record.Date,'dd/MM/yyyy') as Date,( convert(varchar (20), MAX(dbo.tblTime_Record .Time),109)) as  Time,
                         dbo.tblTime_Record.Status
FROM            dbo.tblTime_Record INNER JOIN
                         dbo.tblStaff_info ON dbo.tblTime_Record.Staff_id = dbo.tblStaff_info.Staff_id
						 where CONVERT(varchar(10), dbo.tblTime_Record.Date,101)=CONVERT(varchar(10), SYSDATETIME(),101) 
						
						 group by dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname,dbo.tblTime_Record.Date, dbo.tblStaff_info.Profession, dbo.tblTime_Record.Date, dbo.tblTime_Record.Status
				order by dbo.tblStaff_info.Profession , dbo.tblStaff_info.Fname,Time desc
				
END

GO
/****** Object:  StoredProcedure [dbo].[report]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[report]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@Currentmonth1 date 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblTime_Record.Date AS Date, 
                         dbo.tblTime_Record.Day_status, dbo.tblTime_Record.Week_id,ROUND ( SUM(dbo.tblTime_Record.Total_per_day),4) AS Worked_hours_per_day
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record ON dbo.tblStaff_info.Staff_id = dbo.tblTime_Record.Staff_id
WHERE        (MONTH(dbo.tblTime_Record.Date) = MONTH(@Currentmonth1))
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblTime_Record.Date, dbo.tblTime_Record.Day_status, 
                         dbo.tblTime_Record.Week_id
ORDER BY dbo.tblStaff_info.Fname, Date
END

GO
/****** Object:  StoredProcedure [dbo].[Report11]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Report11] 
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
		@Currentmonth1 date 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   -- Insert statements for procedure here
	SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, FORMAT ( dbo.tblTime_Record.Date,'dd/MM/yyyy') AS Date, 
                         dbo.tblTime_Record.Day_status, dbo.tblTime_Record.Week_id,ROUND ( SUM(dbo.tblTime_Record.Total_per_day),4) AS Worked_hours_per_day
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record ON dbo.tblStaff_info.Staff_id = dbo.tblTime_Record.Staff_id
WHERE       ( format(dbo.tblTime_Record.Date,'MMMM yyyy') = format(@Currentmonth1,'MMMM yyyy'))
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblTime_Record.Date, dbo.tblTime_Record.Day_status, 
                         dbo.tblTime_Record.Week_id
ORDER BY dbo.tblStaff_info.Fname, Date
END

GO
/****** Object:  StoredProcedure [dbo].[SELECT_STAFF]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECT_STAFF]
 AS 
 SELECT * FROM  tblStaff_info order by Profession 

GO
/****** Object:  StoredProcedure [dbo].[staff]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[staff]
AS select * from tblStaff_info go

GO
/****** Object:  Table [dbo].[AttendanceStatus]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceStatus](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AttendanceStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Authenticate_user]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authenticate_user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Authenticate_user] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblJob_Title]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblJob_Title](
	[Job_id] [int] IDENTITY(1,1) NOT NULL,
	[Job_name] [varchar](50) NOT NULL,
	[Nakfa_per_hr] [money] NOT NULL,
	[Remark] [text] NULL,
 CONSTRAINT [PK_tblService] PRIMARY KEY CLUSTERED 
(
	[Job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStaff_info]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStaff_info](
	[Staff_id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Sex] [char](1) NOT NULL,
	[Age] [numeric](3, 0) NOT NULL,
	[Address] [varchar](150) NULL,
	[Phone_number] [int] NULL,
	[Join_date] [date] NOT NULL,
	[Profession] [varchar](50) NOT NULL,
	[Jop_id] [int] NOT NULL,
	[Del_status] [varchar](50) NULL,
	[Hrs_per_day] [int] NOT NULL,
 CONSTRAINT [PK_tblStaff_info] PRIMARY KEY CLUSTERED 
(
	[Staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTime_Record]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTime_Record](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Staff_id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Week_id] [varchar](20) NOT NULL,
	[Day_status] [varchar](30) NOT NULL,
	[Status] [varchar](10) NULL,
	[Total_per_day] [float] NULL,
 CONSTRAINT [PK_tblTime_Record] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[efficiencynew]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[efficiencynew]
AS
SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, MONTH(SYSDATETIME()) AS Month, COUNT(*) 
                         AS Total_worked_days, SUM(tblTime_Record_1.Total_per_day) AS Worked_hours_per_day, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day, 
                         COUNT(*) * dbo.tblStaff_info.Hrs_per_day AS deserved, SUM(tblTime_Record_1.Total_per_day) / (COUNT(*) * dbo.tblStaff_info.Hrs_per_day) 
                         AS Efficiency
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record AS tblTime_Record_1 ON dbo.tblStaff_info.Staff_id = tblTime_Record_1.Staff_id INNER JOIN
                         dbo.tblJob_Title ON dbo.tblStaff_info.Jop_id = dbo.tblJob_Title.Job_id
WHERE        (MONTH(tblTime_Record_1.Date) = MONTH(SYSDATETIME())) AND (tblTime_Record_1.Day_status = 'Normal')
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblStaff_info.Hrs_per_day
ORDER BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Profession

GO
/****** Object:  View [dbo].[efficiencyview]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[efficiencyview]
AS
SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, MONTH(SYSDATETIME()) AS Expr1, 
                         SUM(dbo.tblTime_Record.Total_per_day) AS Worked_hours_per_day
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record ON dbo.tblStaff_info.Staff_id = dbo.tblTime_Record.Staff_id
WHERE        (MONTH(dbo.tblTime_Record.Date) = MONTH(SYSDATETIME()))
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession

GO
/****** Object:  View [dbo].[report1]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[report1]
AS
SELECT        TOP (100) PERCENT dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, EOMONTH(dbo.tblTime_Record.Date) AS Date, 
                         SUM(dbo.tblTime_Record.Total_per_day) AS Worked_hours_per_day, dbo.tblTime_Record.Day_status, dbo.tblTime_Record.Week_id
FROM            dbo.tblStaff_info INNER JOIN
                         dbo.tblTime_Record ON dbo.tblStaff_info.Staff_id = dbo.tblTime_Record.Staff_id
WHERE        (MONTH(dbo.tblTime_Record.Date) = MONTH(SYSDATETIME()))
GROUP BY dbo.tblStaff_info.Fname, dbo.tblStaff_info.Lname, dbo.tblStaff_info.Profession, dbo.tblTime_Record.Date, dbo.tblTime_Record.Day_status, 
                         dbo.tblTime_Record.Week_id
ORDER BY dbo.tblStaff_info.Fname, Date

GO
/****** Object:  View [dbo].[View_1]    Script Date: 11/1/2014 7:20:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        TOP (100) PERCENT dbo.tblJob_Title.Nakfa_per_hr, MIN(DISTINCT dbo.tblStaff_info.Fname) AS Expr3, MIN(DISTINCT dbo.tblStaff_info.Lname) AS Expr4, 
                         MIN(DISTINCT dbo.tblStaff_info.Sex) AS Expr5, MIN(DISTINCT dbo.tblStaff_info.Profession) AS Expr6, dbo.tblTime_Record.Date AS Expr1, 
                         SUM(dbo.tblTime_Record.Total_per_day) AS Expr2, dbo.tblJob_Title.Job_name
FROM            dbo.tblJob_Title INNER JOIN
                         dbo.tblStaff_info ON dbo.tblJob_Title.Job_id = dbo.tblStaff_info.Jop_id INNER JOIN
                         dbo.tblTime_Record ON dbo.tblStaff_info.Staff_id = dbo.tblTime_Record.Staff_id
GROUP BY dbo.tblTime_Record.Date, dbo.tblJob_Title.Nakfa_per_hr, dbo.tblJob_Title.Job_name
ORDER BY MIN(DISTINCT dbo.tblStaff_info.Profession), dbo.tblTime_Record.Date

GO
ALTER TABLE [dbo].[tblStaff_info]  WITH CHECK ADD  CONSTRAINT [FK_tblStaff_info_tblJob_Title] FOREIGN KEY([Jop_id])
REFERENCES [dbo].[tblJob_Title] ([Job_id])
GO
ALTER TABLE [dbo].[tblStaff_info] CHECK CONSTRAINT [FK_tblStaff_info_tblJob_Title]
GO
ALTER TABLE [dbo].[tblTime_Record]  WITH CHECK ADD  CONSTRAINT [FK_tblTime_Record_tblStaff_info] FOREIGN KEY([Staff_id])
REFERENCES [dbo].[tblStaff_info] ([Staff_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTime_Record] CHECK CONSTRAINT [FK_tblTime_Record_tblStaff_info]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStaff_info"
            Begin Extent = 
               Top = 18
               Left = 223
               Bottom = 148
               Right = 393
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "tblTime_Record_1"
            Begin Extent = 
               Top = 10
               Left = 409
               Bottom = 140
               Right = 579
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblJob_Title"
            Begin Extent = 
               Top = 21
               Left = 1
               Bottom = 151
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'efficiencynew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'efficiencynew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStaff_info"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "tblTime_Record"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 136
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'efficiencyview'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'efficiencyview'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[15] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStaff_info"
            Begin Extent = 
               Top = 51
               Left = 118
               Bottom = 181
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblTime_Record"
            Begin Extent = 
               Top = 74
               Left = 502
               Bottom = 204
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3015
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'report1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'report1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[23] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblJob_Title"
            Begin Extent = 
               Top = 0
               Left = 87
               Bottom = 130
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblStaff_info"
            Begin Extent = 
               Top = 2
               Left = 332
               Bottom = 132
               Right = 502
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "tblTime_Record"
            Begin Extent = 
               Top = 23
               Left = 570
               Bottom = 153
               Right = 740
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [Laquev_timesheet_management] SET  READ_WRITE 
GO
