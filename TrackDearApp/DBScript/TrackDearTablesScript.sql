USE [TrackDear]
GO
/****** Object:  Table [dbo].[Appusers]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[Appusers]
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[GroupMember]
GO
/****** Object:  Table [dbo].[History]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[History]
GO
/****** Object:  Table [dbo].[LoginPage]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[LoginPage]
GO
/****** Object:  Table [dbo].[TypeGroups]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[TypeGroups]
GO
/****** Object:  Table [dbo].[types]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[types]
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[UserLocation]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 07/08/2017 12:13:06 ******/
DROP TABLE [dbo].[UserLogins]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/08/2017 12:13:07 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/08/2017 12:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Mobilenumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobileotp] [varchar](50) NULL,
	[Emailotp] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[Mobileotpsenton] [datetime] NULL,
	[emailotpsenton] [datetime] NULL,
	[StatusId] [int] NULL,
	[Latitude] [numeric](10, 6) NULL,
	[Longitude] [numeric](10, 6) NULL,
	[OwnerId] [int] NULL,
 CONSTRAINT [PK_AddUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Active] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [numeric](10, 6) NULL,
	[Longitude] [numeric](10, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[TypegroupId] [int] NULL,
	[active] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeGroups]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[active] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginPage]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginPage](
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mobilenumber] [varchar](50) NULL,
	[Latitude] [numeric](10, 6) NULL,
	[Longitude] [numeric](10, 6) NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupMember]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMember](
	[Id] [int] NULL,
	[AddUserId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appusers]    Script Date: 07/08/2017 12:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Appusers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobilenumber] [varchar](20) NULL,
	[Password] [varchar](50) NULL,
	[Mobileotp] [varchar](10) NULL,
	[Emailotp] [varchar](10) NULL,
	[Passwordotp] [varchar](10) NULL,
	[StatusId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Mobileotpsenton] [datetime] NULL,
	[emailotpsenton] [datetime] NULL,
	[noofattempts] [int] NULL,
	[Firstname] [varchar](20) NULL,
	[lastname] [varchar](20) NULL,
	[AuthTypeId] [int] NULL,
	[AltPhonenumber] [varchar](20) NULL,
	[Altemail] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
 CONSTRAINT [PK_Appusers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
