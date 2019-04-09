USE [db_pressnews]
GO
/****** Object:  User [userpress]    Script Date: 09/04/2019 06:39:05 ******/
CREATE USER [userpress] FOR LOGIN [userpress] WITH DEFAULT_SCHEMA=[userpress]
GO
ALTER ROLE [db_owner] ADD MEMBER [userpress]
GO
/****** Object:  Schema [userpress]    Script Date: 09/04/2019 06:39:05 ******/
CREATE SCHEMA [userpress]
GO
/****** Object:  Table [dbo].[TB_CATEGORIES]    Script Date: 09/04/2019 06:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CATEGORIES](
	[id_cat] [int] IDENTITY(1,1) NOT NULL,
	[nm_cat] [varchar](50) NOT NULL,
	[ds_imgcat] [varbinary](max) NOT NULL,
	[fl_atv] [char](1) NOT NULL,
	[dt_icl] [datetime] NOT NULL,
	[cd_usricl] [int] NOT NULL,
	[dt_dencat] [datetime] NULL,
	[cd_usrden] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_NEWS]    Script Date: 09/04/2019 06:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_NEWS](
	[id_new] [int] IDENTITY(1,1) NOT NULL,
	[nm_new] [varchar](70) NOT NULL,
	[ds_txtnew] [varchar](max) NOT NULL,
	[ds_urlnew] [varchar](200) NOT NULL,
	[dt_new] [datetime] NOT NULL,
	[dt_icl] [datetime] NOT NULL,
	[cd_usricl] [int] NOT NULL,
	[dt_alt] [datetime] NULL,
	[cd_usralt] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USERS]    Script Date: 09/04/2019 06:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USERS](
	[id_usr] [int] IDENTITY(1,1) NOT NULL,
	[nm_lgnusr] [varchar](20) NOT NULL,
	[ds_pwdusr] [varchar](50) NOT NULL,
	[nm_usr] [varchar](50) NOT NULL,
	[fl_atv] [char](1) NOT NULL,
	[dt_icl] [datetime] NOT NULL,
	[dt_denurs] [datetime] NULL
) ON [PRIMARY]
GO
