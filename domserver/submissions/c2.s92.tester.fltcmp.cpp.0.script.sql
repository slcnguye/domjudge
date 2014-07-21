USE [master]
GO
/****** Object:  Database [TeamCity]    Script Date: 11/08/2013 11:23:10 ******/
CREATE DATABASE [TeamCity] ON  PRIMARY 
( NAME = N'TeamCity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TeamCity.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TeamCity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TeamCity_1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TeamCity] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeamCity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeamCity] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TeamCity] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TeamCity] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TeamCity] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TeamCity] SET ARITHABORT OFF
GO
ALTER DATABASE [TeamCity] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TeamCity] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TeamCity] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TeamCity] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TeamCity] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TeamCity] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TeamCity] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TeamCity] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TeamCity] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TeamCity] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TeamCity] SET  DISABLE_BROKER
GO
ALTER DATABASE [TeamCity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TeamCity] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TeamCity] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TeamCity] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TeamCity] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TeamCity] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TeamCity] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TeamCity] SET  READ_WRITE
GO
ALTER DATABASE [TeamCity] SET RECOVERY FULL
GO
ALTER DATABASE [TeamCity] SET  MULTI_USER
GO
ALTER DATABASE [TeamCity] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TeamCity] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeamCity', N'ON'
GO
USE [TeamCity]
GO
/****** Object:  Table [dbo].[Release]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Release](
	[ReleaseId] [int] NOT NULL,
	[Release] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Release] PRIMARY KEY CLUSTERED 
(
	[ReleaseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyDatabases]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDatabases](
	[CompanyDatabaseId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyDatabase] PRIMARY KEY CLUSTERED 
(
	[CompanyDatabaseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerTypes]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerTypes](
	[ServerTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServerType] PRIMARY KEY CLUSTERED 
(
	[ServerTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[TeamMemberId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Team_Id] [int] NOT NULL,
 CONSTRAINT [PK_TeamMember] PRIMARY KEY CLUSTERED 
(
	[TeamMemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suites]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suites](
	[SuiteId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Team_Id] [int] NOT NULL,
 CONSTRAINT [PK_Suite] PRIMARY KEY CLUSTERED 
(
	[SuiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Environments]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Environments](
	[EnvironmentId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UodName] [nvarchar](50) NOT NULL,
	[BuildVersion] [int] NOT NULL,
	[IsInUod] [bit] NOT NULL,
	[AutoUod] [bit] NOT NULL,
	[AutoUodTime] [int] NULL,
	[AdditionalInformation] [ntext] NULL,
	[Team_Id] [int] NOT NULL,
	[Release_Id] [int] NOT NULL,
 CONSTRAINT [PK_Environment] PRIMARY KEY CLUSTERED 
(
	[EnvironmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fixtures]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fixtures](
	[FixtureId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameSpace] [nvarchar](max) NOT NULL,
	[Team_Id] [int] NOT NULL,
 CONSTRAINT [PK_Fixture] PRIMARY KEY CLUSTERED 
(
	[FixtureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnvironmentServers]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvironmentServers](
	[Name] [nvarchar](50) NOT NULL,
	[ServerType_Id] [int] NOT NULL,
	[Environment_Id] [int] NOT NULL,
 CONSTRAINT [PK_EnvironmentServers] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[ServerType_Id] ASC,
	[Environment_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnvironmentCompanyDatabases]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvironmentCompanyDatabases](
	[Envrionment_Id] [int] NOT NULL,
	[CompanyDatabase_Id] [int] NOT NULL,
 CONSTRAINT [PK_EnvironmentCompanyDatabases] PRIMARY KEY CLUSTERED 
(
	[Envrionment_Id] ASC,
	[CompanyDatabase_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnvironmentCheckedOutBy]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnvironmentCheckedOutBy](
	[Environment_Id] [int] NOT NULL,
	[TeamMember_Id] [int] NOT NULL,
 CONSTRAINT [PK_EnvironmentCheckedOutBy] PRIMARY KEY CLUSTERED 
(
	[Environment_Id] ASC,
	[TeamMember_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSuites]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSuites](
	[RunSuiteId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Environment_Id] [int] NOT NULL,
	[Team_Id] [int] NOT NULL,
 CONSTRAINT [PK_RunSuite] PRIMARY KEY CLUSTERED 
(
	[RunSuiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameSpace] [nvarchar](max) NOT NULL,
	[Fixture_Id] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuiteTests]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuiteTests](
	[Suite_Id] [int] NOT NULL,
	[Test_Id] [int] NOT NULL,
 CONSTRAINT [PK_SuiteTests] PRIMARY KEY CLUSTERED 
(
	[Suite_Id] ASC,
	[Test_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RunSuiteSuites]    Script Date: 11/08/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunSuiteSuites](
	[Suite_Id] [int] NOT NULL,
	[RunSuite_Id] [int] NOT NULL,
 CONSTRAINT [PK_RunSuiteSuites] PRIMARY KEY CLUSTERED 
(
	[Suite_Id] ASC,
	[RunSuite_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_TeamMember_Team]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_Team] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([TeamId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMember_Team]
GO
/****** Object:  ForeignKey [FK_Suite_Team1]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[Suites]  WITH CHECK ADD  CONSTRAINT [FK_Suite_Team1] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[Suites] CHECK CONSTRAINT [FK_Suite_Team1]
GO
/****** Object:  ForeignKey [FK_Environment_Team]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[Environments]  WITH CHECK ADD  CONSTRAINT [FK_Environment_Team] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[Environments] CHECK CONSTRAINT [FK_Environment_Team]
GO
/****** Object:  ForeignKey [FK_Environments_Release]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[Environments]  WITH CHECK ADD  CONSTRAINT [FK_Environments_Release] FOREIGN KEY([Release_Id])
REFERENCES [dbo].[Release] ([ReleaseId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Environments] CHECK CONSTRAINT [FK_Environments_Release]
GO
/****** Object:  ForeignKey [FK_Fixture_Team]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[Fixtures]  WITH CHECK ADD  CONSTRAINT [FK_Fixture_Team] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[Fixtures] CHECK CONSTRAINT [FK_Fixture_Team]
GO
/****** Object:  ForeignKey [FK_EnvironmentServers_Environment]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentServers]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentServers_Environment] FOREIGN KEY([Environment_Id])
REFERENCES [dbo].[Environments] ([EnvironmentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentServers] CHECK CONSTRAINT [FK_EnvironmentServers_Environment]
GO
/****** Object:  ForeignKey [FK_EnvironmentServers_ServerType]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentServers]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentServers_ServerType] FOREIGN KEY([ServerType_Id])
REFERENCES [dbo].[ServerTypes] ([ServerTypeId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentServers] CHECK CONSTRAINT [FK_EnvironmentServers_ServerType]
GO
/****** Object:  ForeignKey [FK_EnvironmentCompanyDatabases_CompanyDatabase]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentCompanyDatabases]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentCompanyDatabases_CompanyDatabase] FOREIGN KEY([CompanyDatabase_Id])
REFERENCES [dbo].[CompanyDatabases] ([CompanyDatabaseId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentCompanyDatabases] CHECK CONSTRAINT [FK_EnvironmentCompanyDatabases_CompanyDatabase]
GO
/****** Object:  ForeignKey [FK_EnvironmentCompanyDatabases_Environment]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentCompanyDatabases]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentCompanyDatabases_Environment] FOREIGN KEY([Envrionment_Id])
REFERENCES [dbo].[Environments] ([EnvironmentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentCompanyDatabases] CHECK CONSTRAINT [FK_EnvironmentCompanyDatabases_Environment]
GO
/****** Object:  ForeignKey [FK_EnvironmentCheckedOutBy_Environment]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentCheckedOutBy]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentCheckedOutBy_Environment] FOREIGN KEY([Environment_Id])
REFERENCES [dbo].[Environments] ([EnvironmentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentCheckedOutBy] CHECK CONSTRAINT [FK_EnvironmentCheckedOutBy_Environment]
GO
/****** Object:  ForeignKey [FK_EnvironmentCheckedOutBy_TeamMember]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[EnvironmentCheckedOutBy]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentCheckedOutBy_TeamMember] FOREIGN KEY([TeamMember_Id])
REFERENCES [dbo].[TeamMembers] ([TeamMemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnvironmentCheckedOutBy] CHECK CONSTRAINT [FK_EnvironmentCheckedOutBy_TeamMember]
GO
/****** Object:  ForeignKey [FK_RunSuite_Environment]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[RunSuites]  WITH CHECK ADD  CONSTRAINT [FK_RunSuite_Environment] FOREIGN KEY([Environment_Id])
REFERENCES [dbo].[Environments] ([EnvironmentId])
GO
ALTER TABLE [dbo].[RunSuites] CHECK CONSTRAINT [FK_RunSuite_Environment]
GO
/****** Object:  ForeignKey [FK_RunSuite_Team1]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[RunSuites]  WITH CHECK ADD  CONSTRAINT [FK_RunSuite_Team1] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[Teams] ([TeamId])
GO
ALTER TABLE [dbo].[RunSuites] CHECK CONSTRAINT [FK_RunSuite_Team1]
GO
/****** Object:  ForeignKey [FK_Test_Fixture]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[Tests]  WITH CHECK ADD  CONSTRAINT [FK_Test_Fixture] FOREIGN KEY([Fixture_Id])
REFERENCES [dbo].[Fixtures] ([FixtureId])
GO
ALTER TABLE [dbo].[Tests] CHECK CONSTRAINT [FK_Test_Fixture]
GO
/****** Object:  ForeignKey [FK_SuiteTests_Suite]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[SuiteTests]  WITH CHECK ADD  CONSTRAINT [FK_SuiteTests_Suite] FOREIGN KEY([Suite_Id])
REFERENCES [dbo].[Suites] ([SuiteId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuiteTests] CHECK CONSTRAINT [FK_SuiteTests_Suite]
GO
/****** Object:  ForeignKey [FK_SuiteTests_Test]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[SuiteTests]  WITH CHECK ADD  CONSTRAINT [FK_SuiteTests_Test] FOREIGN KEY([Test_Id])
REFERENCES [dbo].[Tests] ([TestId])
GO
ALTER TABLE [dbo].[SuiteTests] CHECK CONSTRAINT [FK_SuiteTests_Test]
GO
/****** Object:  ForeignKey [FK_RunSuiteSuites_RunSuite]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[RunSuiteSuites]  WITH CHECK ADD  CONSTRAINT [FK_RunSuiteSuites_RunSuite] FOREIGN KEY([RunSuite_Id])
REFERENCES [dbo].[RunSuites] ([RunSuiteId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RunSuiteSuites] CHECK CONSTRAINT [FK_RunSuiteSuites_RunSuite]
GO
/****** Object:  ForeignKey [FK_RunSuiteSuites_Suite]    Script Date: 11/08/2013 11:23:11 ******/
ALTER TABLE [dbo].[RunSuiteSuites]  WITH CHECK ADD  CONSTRAINT [FK_RunSuiteSuites_Suite] FOREIGN KEY([Suite_Id])
REFERENCES [dbo].[Suites] ([SuiteId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RunSuiteSuites] CHECK CONSTRAINT [FK_RunSuiteSuites_Suite]
GO
