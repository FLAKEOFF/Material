USE [master]
GO
/****** Object:  Database [Materials]    Script Date: 18.12.2021 13:44:23 ******/
CREATE DATABASE [Materials]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Materials', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Materials.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Materials_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Materials_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Materials] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Materials].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Materials] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Materials] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Materials] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Materials] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Materials] SET ARITHABORT OFF 
GO
ALTER DATABASE [Materials] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Materials] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Materials] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Materials] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Materials] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Materials] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Materials] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Materials] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Materials] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Materials] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Materials] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Materials] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Materials] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Materials] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Materials] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Materials] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Materials] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Materials] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Materials] SET  MULTI_USER 
GO
ALTER DATABASE [Materials] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Materials] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Materials] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Materials] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Materials] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Materials] SET QUERY_STORE = OFF
GO
USE [Materials]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorutyValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](150) NULL,
	[AgentTypeID] [nvarchar](49) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[INN] [nvarchar](49) NOT NULL,
	[KPP] [nvarchar](49) NOT NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [nvarchar](49) NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](49) NOT NULL,
	[Image] [nvarchar](49) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](49) NOT NULL,
	[TypeMaterial] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](49) NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Count] [int] NOT NULL,
	[MinCount] [int] NOT NULL,
	[CountInPackage] [int] NOT NULL,
	[UnitOfMeasurement] [nvarchar](49) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSuplier]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSuplier](
	[MaterialID] [int] NOT NULL,
	[SuplierID] [int] NULL,
 CONSTRAINT [PK_MaterialSuplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](49) NOT NULL,
	[DeferentPrecent] [int] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 18.12.2021 13:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [nvarchar](20) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (1, 1, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 50)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (2, 2, CAST(N'2021-12-19T00:00:00.000' AS DateTime), 374)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (3, 3, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 431)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (4, 4, CAST(N'2021-12-21T00:00:00.000' AS DateTime), 396)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (5, 5, CAST(N'2021-12-22T00:00:00.000' AS DateTime), 169)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (6, 6, CAST(N'2021-12-23T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (7, 7, CAST(N'2021-12-24T00:00:00.000' AS DateTime), 278)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (8, 8, CAST(N'2021-12-25T00:00:00.000' AS DateTime), 165)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (9, 9, CAST(N'2021-12-26T00:00:00.000' AS DateTime), 355)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (10, 10, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 473)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (11, 11, CAST(N'2021-12-28T00:00:00.000' AS DateTime), 477)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (12, 12, CAST(N'2021-12-29T00:00:00.000' AS DateTime), 426)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (13, 13, CAST(N'2021-12-30T00:00:00.000' AS DateTime), 185)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (14, 14, CAST(N'2021-12-31T00:00:00.000' AS DateTime), 304)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (15, 15, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 198)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (16, 16, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 457)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (17, 17, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 259)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (18, 18, CAST(N'2022-01-04T00:00:00.000' AS DateTime), 268)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (19, 19, CAST(N'2022-01-05T00:00:00.000' AS DateTime), 300)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (20, 20, CAST(N'2022-01-06T00:00:00.000' AS DateTime), 107)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (21, 21, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 170)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (22, 22, CAST(N'2022-01-08T00:00:00.000' AS DateTime), 129)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (23, 23, CAST(N'2022-01-09T00:00:00.000' AS DateTime), 366)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (24, 24, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 175)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (25, 25, CAST(N'2022-01-11T00:00:00.000' AS DateTime), 413)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (26, 26, CAST(N'2022-01-12T00:00:00.000' AS DateTime), 482)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (27, 27, CAST(N'2022-01-13T00:00:00.000' AS DateTime), 62)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (28, 28, CAST(N'2022-01-14T00:00:00.000' AS DateTime), 272)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (29, 29, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 442)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (30, 30, CAST(N'2022-01-16T00:00:00.000' AS DateTime), 151)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (31, 31, CAST(N'2022-01-17T00:00:00.000' AS DateTime), 207)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (32, 32, CAST(N'2022-01-18T00:00:00.000' AS DateTime), 464)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (33, 33, CAST(N'2022-01-19T00:00:00.000' AS DateTime), 491)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (34, 34, CAST(N'2022-01-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (35, 35, CAST(N'2022-01-21T00:00:00.000' AS DateTime), 321)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (36, 36, CAST(N'2022-01-22T00:00:00.000' AS DateTime), 107)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (37, 37, CAST(N'2022-01-23T00:00:00.000' AS DateTime), 236)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (38, 38, CAST(N'2022-01-24T00:00:00.000' AS DateTime), 374)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (39, 39, CAST(N'2022-01-25T00:00:00.000' AS DateTime), 369)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (40, 40, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 470)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (41, 41, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 361)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (42, 42, CAST(N'2022-01-28T00:00:00.000' AS DateTime), 213)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (43, 43, CAST(N'2022-01-29T00:00:00.000' AS DateTime), 327)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (44, 44, CAST(N'2022-01-30T00:00:00.000' AS DateTime), 375)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (45, 45, CAST(N'2022-01-31T00:00:00.000' AS DateTime), 361)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (46, 46, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 189)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (47, 47, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (48, 48, CAST(N'2022-02-03T00:00:00.000' AS DateTime), 139)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (49, 49, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 252)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (50, 50, CAST(N'2022-02-05T00:00:00.000' AS DateTime), 445)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (51, 51, CAST(N'2022-02-06T00:00:00.000' AS DateTime), 124)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (52, 52, CAST(N'2022-02-07T00:00:00.000' AS DateTime), 124)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (53, 53, CAST(N'2022-02-08T00:00:00.000' AS DateTime), 250)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (54, 54, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 488)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (55, 55, CAST(N'2022-02-10T00:00:00.000' AS DateTime), 416)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (56, 56, CAST(N'2022-02-11T00:00:00.000' AS DateTime), 475)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (57, 57, CAST(N'2022-02-12T00:00:00.000' AS DateTime), 329)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (58, 58, CAST(N'2022-02-13T00:00:00.000' AS DateTime), 201)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (59, 59, CAST(N'2022-02-14T00:00:00.000' AS DateTime), 340)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (60, 60, CAST(N'2022-02-15T00:00:00.000' AS DateTime), 359)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (61, 61, CAST(N'2022-02-16T00:00:00.000' AS DateTime), 166)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (62, 62, CAST(N'2022-02-17T00:00:00.000' AS DateTime), 161)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (63, 63, CAST(N'2022-02-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (64, 64, CAST(N'2022-02-19T00:00:00.000' AS DateTime), 31)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (65, 65, CAST(N'2022-02-20T00:00:00.000' AS DateTime), 84)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (66, 66, CAST(N'2022-02-21T00:00:00.000' AS DateTime), 69)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (67, 67, CAST(N'2022-02-22T00:00:00.000' AS DateTime), 302)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (68, 68, CAST(N'2022-02-23T00:00:00.000' AS DateTime), 372)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (69, 69, CAST(N'2022-02-24T00:00:00.000' AS DateTime), 247)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (70, 70, CAST(N'2022-02-25T00:00:00.000' AS DateTime), 395)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (71, 71, CAST(N'2022-02-26T00:00:00.000' AS DateTime), 292)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (72, 72, CAST(N'2022-02-27T00:00:00.000' AS DateTime), 255)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (73, 73, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 88)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (74, 74, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 92)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (75, 75, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 237)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (76, 76, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 446)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (77, 77, CAST(N'2022-03-04T00:00:00.000' AS DateTime), 38)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (78, 78, CAST(N'2022-03-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (79, 79, CAST(N'2022-03-06T00:00:00.000' AS DateTime), 407)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (80, 80, CAST(N'2022-03-07T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (81, 81, CAST(N'2022-03-08T00:00:00.000' AS DateTime), 81)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (82, 82, CAST(N'2022-03-09T00:00:00.000' AS DateTime), 100)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (83, 83, CAST(N'2022-03-10T00:00:00.000' AS DateTime), 72)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (84, 84, CAST(N'2022-03-11T00:00:00.000' AS DateTime), 278)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (85, 85, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 335)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (86, 86, CAST(N'2022-03-13T00:00:00.000' AS DateTime), 159)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (87, 87, CAST(N'2022-03-14T00:00:00.000' AS DateTime), 273)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (88, 88, CAST(N'2022-03-15T00:00:00.000' AS DateTime), 176)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (89, 89, CAST(N'2022-03-16T00:00:00.000' AS DateTime), 426)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (90, 90, CAST(N'2022-03-17T00:00:00.000' AS DateTime), 156)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (91, 91, CAST(N'2022-03-18T00:00:00.000' AS DateTime), 244)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (92, 92, CAST(N'2022-03-19T00:00:00.000' AS DateTime), 82)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (93, 93, CAST(N'2022-03-20T00:00:00.000' AS DateTime), 221)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (94, 94, CAST(N'2022-03-21T00:00:00.000' AS DateTime), 371)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (95, 95, CAST(N'2022-03-22T00:00:00.000' AS DateTime), 464)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (96, 96, CAST(N'2022-03-23T00:00:00.000' AS DateTime), 218)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (97, 97, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 425)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (98, 98, CAST(N'2022-03-25T00:00:00.000' AS DateTime), 73)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (99, 99, CAST(N'2022-03-26T00:00:00.000' AS DateTime), 290)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorutyValue]) VALUES (100, 100, CAST(N'2022-03-27T00:00:00.000' AS DateTime), 158)
GO
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'МонтажОрионУрал', N'МКК', N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'(35222) 67-39-26', N'email: pzaitev@blokin.org', N'\agents\agent_96.png', N'50')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'МетизСтрой', N'МКК', N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'8-800-172-62-56', N'kristina.pakomov@burova.ru', N'\agents\agent_94.png', N'374')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'РадиоСевер', N'ОАО', N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'(495) 368-86-51', N'maiy.belov@rogov.ru', N'\agents\agent_123.png', N'431')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'Компания КазАлмаз', N'ООО', N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'8-800-533-24-75', N'irina.gusina@vlasova.ru', N'\agents\agent_80.png', N'396')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'Компания СервисРадиоГор', N'ООО', N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'8-800-676-32-86', N'nika.nekrasova@kovalev.ru', N'\agents\agent_40.png', N'169')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ВодТверьХозМашина', N'ЗАО', N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'7 (922) 849-91-96', N'tkrylov@baranova.net', N'\agents\agent_56.png', N'8')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'Тех', N'ОАО', N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'7 (922) 427-13-31', N'vasilisa99@belyev.ru', N'\agents\agent_61.png', N'278')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'ТверьМетизУралСнос', N'ООО', N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'(35222) 57-92-75', N'email: rlazareva@novikov.ru', N'\agents\agent_109.png', N'165')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'МясРеч', N'ЗАО', N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'8-800-453-63-45', N'bkozlov@volkov.ru', N'\agents\agent_58.png', N'355')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Флот', N'ЗАО', N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'8-800-144-25-38', N'gerasim.makarov@kornilov.ru', N'\agents\agent_87.png', N'473')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'CибПивОмскСнаб', N'ЗАО', N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'7 (922) 153-95-22', N'evorontova@potapova.ru', N'\agents\agent_46.png', N'477')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'ЦементАсбоцемент', N'ЗАО', N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'(495) 184-87-92', N'email: polykov.veronika@artemeva.ru', N'', N'426')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'ТелеГлавВекторСбыт', N'ЗАО', N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'(35222) 56-15-37', N'nsitnikov@kovaleva.ru', N'\agents\agent_31.png', N'185')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Инфо', N'ОАО', N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'8-800-793-59-97', N'arsenii.mikailova@prokorov.com', N'\agents\agent_89.png', N'304')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'ЭлектроРемОрионЛизинг', N'ЗАО', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 519-97-41', N'anfisa.fedotova@tvetkov.ru', N'\agents\agent_68.png', N'198')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'Компания ТелекомХмельГаражПром', N'ООО', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'(812) 983-91-73', N'email: qkolesnikova@kalinina.ru', N'\agents\agent_71.png', N'457')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Компания Алмаз', N'ООО', N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'7 (922) 688-74-22', N'akalinina@zaitev.ru', N'\agents\agent_121.png', N'259')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'МясТрансМоторЛизинг', N'ОАО', N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'7 (922) 676-34-94', N'email: vlad.sokolov@andreev.org', N'\agents\agent_62.png', N'268')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'Монтаж', N'МФО', N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 867-76-15', N'email: zakar.sazonova@gavrilov.ru', N'', N'300')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'ВостокГлав', N'ООО', N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'(812) 949-29-26', N'gordei95@kirillov.ru', N'\agents\agent_63.png', N'107')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'Газ', N'МФО', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'(35222) 22-45-58', N'ulyna.antonov@noskov.ru', N'\agents\agent_76.png', N'170')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'ЭлектроТранс', N'ОАО', N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N' (812) 342-24-31', N'boleslav.zukova@nikiforova.com', N'\agents\agent_91.png', N'129')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'Электро', N'ОАО', N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N' 8-800-714-36-41', N'likacev.makar@antonov.ru', N'\agents\agent_93.png', N'366')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Гор', N'МКК', N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(495) 973-48-55', N'maiy12@koklov.net', N'\agents\agent_52.png', N'175')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'Компания Гараж', N'ООО', N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'7 (922) 848-38-54', N'email: asiryeva@andreeva.com', N'\agents\agent_66.png', N'413')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ОрионГлав', N'ПАО', N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'7 (922) 684-13-74', N'sermakova@sarova.net', N'\agents\agent_106.png', N'482')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'ГлавITФлотПроф', N'МФО', N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N' (812) 146-66-46', N'savva.rybov@kolobov.ru', N'\agents\agent_64.png', N'62')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'ТверьМонтажОмск', N'ПАО', N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'8-800-363-43-86', N'dteterina@selezneva.ru', N'\agents\agent_128.png', N'272')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'РемСантехОмскБанк', N'ОАО', N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N' (812) 182-44-77', N'anisimov.mark@vorobev.ru', N'\agents\agent_57.png', N'442')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'ЭлектроМоторТрансСнос', N'ОАО', N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N' (35222) 43-62-19', N'inessa.voronov@sidorova.ru', N'', N'151')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'ТверьХозМорСбыт', N'МКК', N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'(495) 416-75-67', N'email: marina58@koroleva.com', N'\agents\agent_117.png', N'207')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Компания ТомскХоз', N'ООО', N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'7 (922) 849-13-37', N'email: nelli11@gureva.ru', N'\agents\agent_115.png', N'464')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'Компания МясДизайнДизайн', N'ООО', N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N' (812) 535-17-25', N'email: gleb.gulyev@belyeva.com', N'\agents\agent_53.png', N'491')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'Компания ЖелДорТверьМонтаж', N'ООО', N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'(495) 521-61-75', N'email: burova.zlata@zueva.ru', N'\agents\agent_85.png', N'2')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'МетизТехАвтоПроф', N'ООО', N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N' (495) 581-42-46', N'anastasiy.gromov@samsonova.com', N'\agents\agent_33.png', N'321')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'Гараж', N'МФО', N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'(35222) 54-72-59', N'antonin51@korolev.com', N'\agents\agent_90.png', N'107')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'ГазДизайнЖелДор', N'МКК', N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(495) 797-97-33', N'elizaveta.komarov@rybakov.net', N'\agents\agent_49.png', N'236')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'РемГаражЛифт', N'ОАО', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N' 8-800-772-27-53', N'novikova.gleb@sestakov.ru', N'\agents\agent_65.png', N'374')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'СантехБашкир', N'МФО', N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'7 (922) 155-87-39', N'email: nikodim81@kiseleva.com', N'\agents\agent_99.png', N'369')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'ЮпитерЛенГараж-М', N'МКК', N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(495) 327-58-25', N'larkipova@gorbunov.ru', N'\agents\agent_48.png', N'470')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'ОрионСофтВодСнос', N'ЗАО', N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'(35222) 59-75-11', N'isukanov@sobolev.com', N'\agents\agent_97.png', N'361')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'КазХоз', N'ОАО', N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'7 (922) 728-85-62', N'istrelkova@fomin.ru', N'', N'213')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'БухВжух', N'ПАО', N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'(495) 367-21-41', N'valentina.bolsakova@aksenova.ru', N'', N'327')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'ХозЮпитер', N'ОАО', N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'7 (922) 332-48-96', N'jisakova@nazarova.com', N'\agents\agent_114.png', N'375')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'ВостокКазРыб', N'МФО', N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N' (495) 987-31-63', N'flukin@misin.org', N'\agents\agent_112.png', N'361')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ЦементКрепТех-М', N'ЗАО', N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N' (812) 838-79-58', N'email: yna.evdokimov@gordeeva.ru', N'\agents\agent_82.png', N'189')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'Строй', N'МФО', N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'(812) 447-45-59', N'soloveva.adam@andreev.ru', N'', N'12')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'БашкирЮпитерТомск', N'ЗАО', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 189-59-57', N'dyckov.veniamin@kotova.ru', N'\agents\agent_59.png', N'139')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'Компания КазМеталКазань', N'ООО', N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'(495) 685-34-29', N'email: mmoiseev@teterin.ru', N'\agents\agent_130.png', N'252')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'Компания Газ', N'ООО', N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N' (35222) 75-96-85', N'alina56@zdanov.com', N'\agents\agent_120.png', N'445')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'Компания Монтаж', N'ООО', N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N' (35222) 92-45-98', N'afanasev.anastasiy@muravev.ru', N'\agents\agent_75.png', N'124')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'СервисХмельМонтаж', N'ЗАО', N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'7 (922) 344-73-38', N'galina31@melnikov.ru', N'\agents\agent_92.png', N'124')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'ВодГараж', N'ОАО', N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'7 (922) 363-86-67', N'email: pmaslov@fomiceva.com', N'\agents\agent_67.png', N'250')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'CибГаз', N'МКК', N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'(495) 945-37-25', N'inna.sarova@panfilov.ru', N'\agents\agent_103.png', N'488')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'БашкирФлотМотор-H', N'МКК', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N' (495) 793-84-82', N'email: morozova.nika@kazakova.ru', N'\agents\agent_36.png', N'416')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'МеталСервисМор', N'ПАО', N'293265, Иркутская область, город Клин, пр. Славы, 12', N'6922817841', N'580142825', N'Коновалова Кирилл Львович', N'(35222) 91-28-62', N'xdanilov@titov.ru', N'', N'475')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'Рем', N'ЗАО', N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N' (495) 987-88-53', N'zanna25@nikiforova.com', N'\agents\agent_79.png', N'329')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'СантехСеверЛенМашина', N'ООО', N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 918-88-43', N'email: pgorbacev@vasilev.net', N'\agents\agent_74.png', N'201')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'Цемент', N'ООО', N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'8-800-517-78-47', N'panova.klementina@bobrov.ru', N'\agents\agent_54.png', N'340')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'Вод', N'ЗАО', N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'(495) 142-19-84', N'email: savva86@zaiteva.ru', N'\agents\agent_129.png', N'359')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'Орион', N'ПАО', N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'8-800-621-61-93', N'email: aleksei63@kiselev.ru', N'\agents\agent_77.png', N'166')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'СтройГорНефть', N'ОАО', N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N' (812) 385-21-37', N'email: lysy.kolesnikova@molcanova.com', N'\agents\agent_37.png', N'161')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'Компания Хмель', N'ООО', N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N' (812) 421-77-82', N'ermakov.mark@isakova.ru', N'', N'2')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Компания ВодАлмазIT', N'ООО', N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'(35222) 52-76-16', N'zakar37@nikolaeva.ru', N'\agents\agent_111.png', N'31')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'БашкирРечТомск', N'ПАО', N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'8-800-254-71-85', N'email: aleksandra77@karpov.com', N'\agents\agent_100.png', N'84')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'СофтРосБух', N'ЗАО', N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'7 (922) 445-69-17', N'ivanova.antonin@rodionov.ru', N'\agents\agent_124.png', N'69')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'ТелекомЮпитер', N'МКК', N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 895-67-23', N'kulikov.adrian@zuravlev.org', N'\agents\agent_81.png', N'302')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'УралСтройХмель', N'ЗАО', N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'(35222) 39-23-65', N'email: aleksandr95@kolobova.ru', N'\agents\agent_113.png', N'372')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'АсбоцементТехАвто', N'МФО', N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'7 (922) 977-68-84', N'matveev.yliy@kiseleva.ru', N'\agents\agent_110.png', N'247')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Компания ФинансСервис', N'ООО', N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'(812) 878-42-71', N'email: robert.serbakov@safonova.ru', N'\agents\agent_38.png', N'395')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'Софт', N'ОАО', N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'(35222) 12-82-65', N'jterentev@ersov.com', N'\agents\agent_122.png', N'292')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'ТелекомГор', N'ОАО', N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'(35222) 78-93-21', N'gorskov.larisa@kalinin.com', N'\agents\agent_98.png', N'255')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'РемСтрем', N'ПАО', N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N' (35222) 55-28-24', N'rafail96@sukin.ru', N'\agents\agent_116.png', N'88')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'Лифт', N'ООО', N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N' (812) 484-92-38', N'email: zinaida01@bespalova.ru', N'\agents\agent_101.png', N'92')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Компания МоторТелекомЦемент-М', N'ООО', N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'(812) 857-95-57', N'larisa44@silin.org', N'\agents\agent_118.png', N'237')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'ЮпитерТяжОрионЭкспедиция', N'ОАО', N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N' (35222) 95-63-65', N'email: gblokin@orlov.net', N'\agents\agent_44.png', N'446')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Транс', N'МФО', N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'8-800-954-23-89', N'artem.fadeev@polykov.com', N'\agents\agent_127.png', N'38')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'РемВод', N'ОАО', N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'7 (922) 353-31-72', N'komarov.elizaveta@agafonova.ru', N'\agents\agent_126.png', N'1')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'АсбоцементЛифтРеч-H', N'ПАО', N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'(495) 245-57-16', N'vladlena58@seliverstova.ru', N'\agents\agent_105.png', N'407')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'РосАвтоМонтаж', N'ООО', N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'(495) 445-97-76', N'lapin.inessa@isaeva.com', N'\agents\agent_55.png', N'10')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'Компания СервисТелеМотор', N'ООО', N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'7 (922) 461-25-29', N'email: veronika.egorov@bespalova.com', N'\agents\agent_102.png', N'81')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ФинансТелеТверь', N'ПАО', N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(812) 115-56-93', N'email: medvedev.klim@afanasev.com', N'\agents\agent_45.png', N'100')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'ВодГор', N'ОАО', N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N' (35222) 73-72-16', N'tvetkova.robert@sorokin.com', N'\agents\agent_125.png', N'72')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'ТяжРадиоУралПроф', N'ОАО', N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'7 (922) 885-66-15', N'liliy62@grisina.ru', N'\agents\agent_88.png', N'278')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ГаражЛофт', N'ОАО', N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'(495) 427-55-66', N'lydmila.belyeva@karpov.ru', N'\agents\agent_108.png', N'335')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'ITСтройАлмаз', N'ОАО', N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'8-800-185-78-91', N'fokin.eduard@samoilov.com', N'\agents\agent_83.png', N'159')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'Асбоцемент', N'ООО', N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N' 8-800-211-16-23', N'antonin19@panfilov.ru', N'\agents\agent_34.png', N'273')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'ТекстильУралАвтоОпт', N'ЗАО', N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N' (35222) 98-76-54', N'hkononova@pavlova.ru', N'', N'176')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'Компания КрепЦемент', N'ООО', N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N' (812) 963-77-87', N'rusakov.efim@nikiforov.ru', N'\agents\agent_50.png', N'426')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'КазаньТекстиль', N'ОАО', N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'(35222) 86-74-21', N'osimonova@andreeva.com', N'\agents\agent_47.png', N'156')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'КазЮпитерТомск', N'ОАО', N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'7 (922) 772-33-58', N'tgavrilov@frolov.ru', N'\agents\agent_60.png', N'244')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'Бух', N'МФО', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'7 (922) 375-49-21', N'belova.vikentii@konstantinova.net', N'\agents\agent_78.png', N'82')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Радио', N'ПАО', N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'8-800-897-32-78', N'rtretykova@kozlov.ru', N'\agents\agent_43.png', N'221')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'Креп', N'ЗАО', N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N' (495) 217-46-29', N'savina.dominika@belousova.com', N'\agents\agent_39.png', N'371')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'Мобайл', N'ОАО', N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'8-800-618-73-37', N'email: dsiryev@dementeva.com', N'\agents\agent_107.png', N'464')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'CибБашкирТекстиль', N'МКК', N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(495) 285-78-38', N'vzimina@zdanova.com', N'\agents\agent_69.png', N'218')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'МеталТекстильЛифтТрест', N'МКК', N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'(812) 753-96-76', N'email: muravev.trofim@sazonov.net', N'\agents\agent_86.png', N'425')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'ОрионТомскТех', N'ПАО', N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'7 (922) 542-89-15', N'faina.tikonova@veselov.com', N'\agents\agent_119.png', N'73')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ЖелДорДизайнМетизТраст', N'ПАО', N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'(812) 123-63-47', N'lnikitina@kulikova.com', N'', N'290')
INSERT [dbo].[Agents] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'БухМясМоторПром', N'ОАО', N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'(35222) 83-23-59', N'varvara49@savin.ru', N'\agents\agent_95.png', N'158')
GO
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'МонтажОрионУрал', N'\agents\agent_96.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МетизСтрой', N'\agents\agent_94.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'РадиоСевер', N'\agents\agent_123.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'Компания КазАлмаз', N'\agents\agent_80.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'Компания СервисРадиоГор', N'\agents\agent_40.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ВодТверьХозМашина', N'\agents\agent_56.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (7, N'Тех', N'\agents\agent_61.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (8, N'ТверьМетизУралСнос', N'\agents\agent_109.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (9, N'МясРеч', N'\agents\agent_58.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (10, N'Флот', N'\agents\agent_87.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (11, N'CибПивОмскСнаб', N'\agents\agent_46.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (12, N'ЦементАсбоцемент', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (13, N'ТелеГлавВекторСбыт', N'\agents\agent_31.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (14, N'Инфо', N'\agents\agent_89.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (15, N'ЭлектроРемОрионЛизинг', N'\agents\agent_68.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (16, N'Компания ТелекомХмельГаражПром', N'\agents\agent_71.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (17, N'Компания Алмаз', N'\agents\agent_121.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (18, N'МясТрансМоторЛизинг', N'\agents\agent_62.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (19, N'Монтаж', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (20, N'ВостокГлав', N'\agents\agent_63.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (21, N'Газ', N'\agents\agent_76.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (22, N'ЭлектроТранс', N'\agents\agent_91.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (23, N'Электро', N'\agents\agent_93.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (24, N'Гор', N'\agents\agent_52.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (25, N'Компания Гараж', N'\agents\agent_66.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (26, N'ОрионГлав', N'\agents\agent_106.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (27, N'ГлавITФлотПроф', N'\agents\agent_64.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (28, N'ТверьМонтажОмск', N'\agents\agent_128.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (29, N'РемСантехОмскБанк', N'\agents\agent_57.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (30, N'ЭлектроМоторТрансСнос', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (31, N'ТверьХозМорСбыт', N'\agents\agent_117.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (32, N'Компания ТомскХоз', N'\agents\agent_115.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (33, N'Компания МясДизайнДизайн', N'\agents\agent_53.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (34, N'Компания ЖелДорТверьМонтаж', N'\agents\agent_85.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (35, N'МетизТехАвтоПроф', N'\agents\agent_33.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (36, N'Гараж', N'\agents\agent_90.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (37, N'ГазДизайнЖелДор', N'\agents\agent_49.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (38, N'РемГаражЛифт', N'\agents\agent_65.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (39, N'СантехБашкир', N'\agents\agent_99.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (40, N'ЮпитерЛенГараж-М', N'\agents\agent_48.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (41, N'ОрионСофтВодСнос', N'\agents\agent_97.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (42, N'КазХоз', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (43, N'БухВжух', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (44, N'ХозЮпитер', N'\agents\agent_114.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (45, N'ВостокКазРыб', N'\agents\agent_112.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (46, N'ЦементКрепТех-М', N'\agents\agent_82.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (47, N'Строй', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (48, N'БашкирЮпитерТомск', N'\agents\agent_59.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (49, N'Компания КазМеталКазань', N'\agents\agent_130.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (50, N'Компания Газ', N'\agents\agent_120.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (51, N'Компания Монтаж', N'\agents\agent_75.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (52, N'СервисХмельМонтаж', N'\agents\agent_92.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (53, N'ВодГараж', N'\agents\agent_67.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (54, N'CибГаз', N'\agents\agent_103.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (55, N'БашкирФлотМотор-H', N'\agents\agent_36.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (56, N'МеталСервисМор', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (57, N'Рем', N'\agents\agent_79.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (58, N'СантехСеверЛенМашина', N'\agents\agent_74.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (59, N'Цемент', N'\agents\agent_54.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (60, N'Вод', N'\agents\agent_129.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (61, N'Орион', N'\agents\agent_77.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (62, N'СтройГорНефть', N'\agents\agent_37.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (63, N'Компания Хмель', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (64, N'Компания ВодАлмазIT', N'\agents\agent_111.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (65, N'БашкирРечТомск', N'\agents\agent_100.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (66, N'СофтРосБух', N'\agents\agent_124.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (67, N'ТелекомЮпитер', N'\agents\agent_81.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (68, N'УралСтройХмель', N'\agents\agent_113.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (69, N'АсбоцементТехАвто', N'\agents\agent_110.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (70, N'Компания ФинансСервис', N'\agents\agent_38.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (71, N'Софт', N'\agents\agent_122.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (72, N'ТелекомГор', N'\agents\agent_98.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (73, N'РемСтрем', N'\agents\agent_116.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (74, N'Лифт', N'\agents\agent_101.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (75, N'Компания МоторТелекомЦемент-М', N'\agents\agent_118.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (76, N'ЮпитерТяжОрионЭкспедиция', N'\agents\agent_44.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (77, N'Транс', N'\agents\agent_127.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (78, N'РемВод', N'\agents\agent_126.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (79, N'АсбоцементЛифтРеч-H', N'\agents\agent_105.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (80, N'РосАвтоМонтаж', N'\agents\agent_55.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (81, N'Компания СервисТелеМотор', N'\agents\agent_102.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (82, N'ФинансТелеТверь', N'\agents\agent_45.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (83, N'ВодГор', N'\agents\agent_125.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (84, N'ТяжРадиоУралПроф', N'\agents\agent_88.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (85, N'ГаражЛофт', N'\agents\agent_108.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (86, N'ITСтройАлмаз', N'\agents\agent_83.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (87, N'Асбоцемент', N'\agents\agent_34.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (88, N'ТекстильУралАвтоОпт', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (89, N'Компания КрепЦемент', N'\agents\agent_50.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (90, N'КазаньТекстиль', N'\agents\agent_47.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (91, N'КазЮпитерТомск', N'\agents\agent_60.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (92, N'Бух', N'\agents\agent_78.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (93, N'Радио', N'\agents\agent_43.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (94, N'Креп', N'\agents\agent_39.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (95, N'Мобайл', N'\agents\agent_107.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (96, N'CибБашкирТекстиль', N'\agents\agent_69.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (97, N'МеталТекстильЛифтТрест', N'\agents\agent_86.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (98, N'ОрионТомскТех', N'\agents\agent_119.png')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (99, N'ЖелДорДизайнМетизТраст', N'')
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (100, N'БухМясМоторПром', N'\agents\agent_95.png')
GO
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (1, N'Гранулы зеленый 0x3', N'Гранулы', N'', CAST(33037.00 AS Numeric(18, 2)), 937, 31, 10, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (2, N'Рулон зеленый 0x0', N'Рулон', N'\materials\material_25.jpeg', CAST(43562.00 AS Numeric(18, 2)), 371, 32, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (3, N'Нарезка серый 1x1', N'Нарезка', N'', CAST(36682.00 AS Numeric(18, 2)), 302, 41, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (4, N'Рулон серый 1x0', N'Рулон', N'\materials\material_12.jpeg', CAST(1998.00 AS Numeric(18, 2)), 811, 26, 10, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (5, N'Нарезка белый 1x2', N'Нарезка', N'', CAST(39259.00 AS Numeric(18, 2)), 248, 27, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (6, N'Нарезка зеленый 3x0', N'Нарезка', N'\materials\material_7.jpeg', CAST(25985.00 AS Numeric(18, 2)), 345, 30, 4, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (7, N'Спрессованный пак синий 0x2', N'Пресс', N'\materials\material_24.jpeg', CAST(47443.00 AS Numeric(18, 2)), 881, 14, 9, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (8, N'Спрессованный пак зеленый 2x0', N'Пресс', N'', CAST(25974.00 AS Numeric(18, 2)), 215, 25, 6, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (9, N'Нарезка белый 3x1', N'Нарезка', N'', CAST(27374.00 AS Numeric(18, 2)), 439, 50, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (10, N'Гранулы цветной 1x3', N'Гранулы', N'\materials\material_11.jpeg', CAST(16651.00 AS Numeric(18, 2)), 20, 23, 4, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (11, N'Рулон синий 1x0', N'Рулон', N'', CAST(49990.00 AS Numeric(18, 2)), 972, 40, 9, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (12, N'Спрессованный пак цветной 3x0', N'Пресс', N'', CAST(36740.00 AS Numeric(18, 2)), 159, 42, 5, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (13, N'Нарезка белый 0x1', N'Нарезка', N'', CAST(32370.00 AS Numeric(18, 2)), 368, 16, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (14, N'Рулон зеленый 1x3', N'Рулон', N'', CAST(12393.00 AS Numeric(18, 2)), 20, 17, 6, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (15, N'Спрессованный пак белый 1x2', N'Пресс', N'\materials\material_16.jpeg', CAST(21359.00 AS Numeric(18, 2)), 27, 28, 2, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (16, N'Спрессованный пак белый 0x2', N'Пресс', N'\materials\material_5.jpeg', CAST(36343.00 AS Numeric(18, 2)), 601, 49, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (17, N'Рулон зеленый 2x2', N'Рулон', N'', CAST(7610.00 AS Numeric(18, 2)), 94, 6, 4, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (18, N'Спрессованный пак зеленый 1x2', N'Пресс', N'\materials\material_3.jpeg', CAST(35304.00 AS Numeric(18, 2)), 1, 12, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (19, N'Рулон зеленый 1x1', N'Рулон', N'', CAST(28235.00 AS Numeric(18, 2)), 884, 5, 1, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (20, N'Нарезка синий 2x1', N'Нарезка', N'', CAST(30327.00 AS Numeric(18, 2)), 82, 44, 7, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (21, N'Гранулы цветной 2x1', N'Гранулы', N'', CAST(33885.00 AS Numeric(18, 2)), 757, 5, 1, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (22, N'Нарезка синий 2x3', N'Нарезка', N'\materials\material_23.jpeg', CAST(53097.00 AS Numeric(18, 2)), 44, 5, 5, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (23, N'Нарезка серый 2x2', N'Нарезка', N'', CAST(30474.00 AS Numeric(18, 2)), 476, 5, 3, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (24, N'Спрессованный пак серый 0x2', N'Пресс', N'', CAST(2540.00 AS Numeric(18, 2)), 497, 27, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (25, N'Гранулы серый 3x0', N'Гранулы', N'', CAST(50093.00 AS Numeric(18, 2)), 705, 34, 9, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (26, N'Спрессованный пак серый 3x1', N'Пресс', N'', CAST(10763.00 AS Numeric(18, 2)), 429, 22, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (27, N'Спрессованный пак зеленый 1x0', N'Пресс', N'\materials\material_17.jpeg', CAST(18413.00 AS Numeric(18, 2)), 560, 17, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (28, N'Рулон синий 0x3', N'Рулон', N'\materials\material_8.jpeg', CAST(47343.00 AS Numeric(18, 2)), 243, 41, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (29, N'Спрессованный пак цветной 0x3', N'Пресс', N'', CAST(10544.00 AS Numeric(18, 2)), 610, 41, 2, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (30, N'Рулон белый 3x2', N'Рулон', N'', CAST(17632.00 AS Numeric(18, 2)), 608, 5, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (31, N'Спрессованный пак зеленый 1x1', N'Пресс', N'', CAST(13911.00 AS Numeric(18, 2)), 577, 28, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (32, N'Гранулы зеленый 2x0', N'Гранулы', N'', CAST(18961.00 AS Numeric(18, 2)), 708, 11, 2, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (33, N'Нарезка серый 3x3', N'Нарезка', N'', CAST(51486.00 AS Numeric(18, 2)), 149, 18, 5, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (34, N'Рулон синий 2x3', N'Рулон', N'', CAST(15889.00 AS Numeric(18, 2)), 775, 42, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (35, N'Спрессованный пак цветной 1x2', N'Пресс', N'\materials\material_15.jpeg', CAST(1382.00 AS Numeric(18, 2)), 189, 31, 9, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (36, N'Нарезка синий 1x2', N'Нарезка', N'', CAST(40754.00 AS Numeric(18, 2)), 353, 5, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (37, N'Спрессованный пак цветной 2x1', N'Пресс', N'', CAST(20404.00 AS Numeric(18, 2)), 549, 21, 9, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (38, N'Гранулы белый 1x2', N'Гранулы', N'', CAST(28326.00 AS Numeric(18, 2)), 265, 10, 10, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (39, N'Рулон зеленый 3x2', N'Рулон', N'\materials\material_2.jpeg', CAST(40932.00 AS Numeric(18, 2)), 111, 37, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (40, N'Гранулы зеленый 1x2', N'Гранулы', N'\materials\material_4.jpeg', CAST(36121.00 AS Numeric(18, 2)), 2, 29, 9, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (41, N'Гранулы серый 2x3', N'Гранулы', N'', CAST(30903.00 AS Numeric(18, 2)), 185, 22, 6, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (42, N'Гранулы синий 1x0', N'Гранулы', N'', CAST(19889.00 AS Numeric(18, 2)), 579, 12, 9, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (43, N'Гранулы белый 2x2', N'Гранулы', N'', CAST(11843.00 AS Numeric(18, 2)), 232, 22, 9, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (44, N'Нарезка зеленый 1x1', N'Нарезка', N'\materials\material_6.jpeg', CAST(53096.00 AS Numeric(18, 2)), 883, 42, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (45, N'Рулон зеленый 0x2', N'Рулон', N'', CAST(50081.00 AS Numeric(18, 2)), 35, 10, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (46, N'Гранулы белый 2x1', N'Гранулы', N'', CAST(49124.00 AS Numeric(18, 2)), 437, 40, 4, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (47, N'Гранулы зеленый 2x3', N'Гранулы', N'', CAST(19788.00 AS Numeric(18, 2)), 848, 18, 10, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (48, N'Нарезка зеленый 0x3', N'Нарезка', N'', CAST(7884.00 AS Numeric(18, 2)), 943, 25, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (49, N'Рулон белый 0x1', N'Рулон', N'', CAST(50081.00 AS Numeric(18, 2)), 99, 8, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (50, N'Спрессованный пак синий 2x1', N'Пресс', N'', CAST(31625.00 AS Numeric(18, 2)), 921, 18, 10, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (51, N'Спрессованный пак серый 3x0', N'Пресс', N'', CAST(35304.00 AS Numeric(18, 2)), 391, 29, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (52, N'Спрессованный пак зеленый 0x3', N'Пресс', N'', CAST(18848.00 AS Numeric(18, 2)), 966, 7, 6, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (53, N'Нарезка белый 2x2', N'Нарезка', N'\materials\material_26.jpeg', CAST(39945.00 AS Numeric(18, 2)), 614, 7, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (54, N'Нарезка синий 2x0', N'Нарезка', N'', CAST(13380.00 AS Numeric(18, 2)), 899, 9, 8, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (55, N'Рулон цветной 1x3', N'Рулон', N'', CAST(45185.00 AS Numeric(18, 2)), 423, 48, 6, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (56, N'Спрессованный пак серый 1x3', N'Пресс', N'', CAST(375.00 AS Numeric(18, 2)), 805, 50, 7, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (57, N'Спрессованный пак белый 3x3', N'Пресс', N'', CAST(28510.00 AS Numeric(18, 2)), 158, 34, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (58, N'Гранулы цветной 0x3', N'Гранулы', N'\materials\material_20.jpeg', CAST(16202.00 AS Numeric(18, 2)), 641, 35, 3, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (59, N'Нарезка зеленый 0x1', N'Нарезка', N'', CAST(53874.00 AS Numeric(18, 2)), 502, 36, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (60, N'Нарезка белый 0x3', N'Нарезка', N'', CAST(34619.00 AS Numeric(18, 2)), 444, 27, 5, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (61, N'Рулон зеленый 0x1', N'Рулон', N'', CAST(46510.00 AS Numeric(18, 2)), 60, 14, 2, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (62, N'Нарезка цветной 2x0', N'Нарезка', N'', CAST(49221.00 AS Numeric(18, 2)), 118, 22, 7, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (63, N'Спрессованный пак цветной 2x3', N'Пресс', N'', CAST(4347.00 AS Numeric(18, 2)), 746, 27, 10, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (64, N'Гранулы цветной 3x0', N'Гранулы', N'', CAST(3273.00 AS Numeric(18, 2)), 151, 25, 4, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (65, N'Спрессованный пак серый 0x3', N'Пресс', N'', CAST(40699.00 AS Numeric(18, 2)), 386, 34, 9, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (66, N'Спрессованный пак цветной 3x1', N'Пресс', N'', CAST(45318.00 AS Numeric(18, 2)), 146, 23, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (67, N'Спрессованный пак цветной 3x3', N'Пресс', N'', CAST(18048.00 AS Numeric(18, 2)), 932, 47, 5, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (68, N'Рулон зеленый 1x0', N'Рулон', N'', CAST(41572.00 AS Numeric(18, 2)), 124, 5, 3, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (69, N'Спрессованный пак зеленый 3x2', N'Пресс', N'', CAST(18071.00 AS Numeric(18, 2)), 890, 5, 5, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (70, N'Нарезка зеленый 3x3', N'Нарезка', N'', CAST(30112.00 AS Numeric(18, 2)), 172, 20, 2, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (71, N'Рулон белый 3x1', N'Рулон', N'', CAST(13360.00 AS Numeric(18, 2)), 613, 13, 10, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (72, N'Нарезка цветной 2x2', N'Нарезка', N'\materials\material_9.jpeg', CAST(41538.00 AS Numeric(18, 2)), 326, 34, 2, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (73, N'Гранулы цветной 2x0', N'Гранулы', N'\materials\material_21.jpeg', CAST(2670.00 AS Numeric(18, 2)), 309, 15, 9, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (74, N'Нарезка белый 1x0', N'Нарезка', N'', CAST(16050.00 AS Numeric(18, 2)), 924, 33, 5, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (75, N'Нарезка зеленый 1x2', N'Нарезка', N'', CAST(45568.00 AS Numeric(18, 2)), 339, 8, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (76, N'Нарезка цветной 2x3', N'Нарезка', N'', CAST(32336.00 AS Numeric(18, 2)), 498, 45, 3, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (77, N'Спрессованный пак цветной 0x2', N'Пресс', N'', CAST(24205.00 AS Numeric(18, 2)), 474, 30, 7, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (78, N'Нарезка синий 3x1', N'Нарезка', N'', CAST(50887.00 AS Numeric(18, 2)), 631, 27, 6, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (79, N'Нарезка серый 2x1', N'Нарезка', N'', CAST(7801.00 AS Numeric(18, 2)), 2, 50, 6, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (80, N'Рулон белый 1x2', N'Рулон', N'', CAST(17952.00 AS Numeric(18, 2)), 599, 18, 2, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (81, N'Спрессованный пак цветной 2x0', N'Пресс', N'\materials\material_13.jpeg', CAST(17965.00 AS Numeric(18, 2)), 211, 46, 5, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (82, N'Нарезка цветной 0x0', N'Нарезка', N'', CAST(4018.00 AS Numeric(18, 2)), 311, 9, 6, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (83, N'Нарезка серый 2x0', N'Нарезка', N'', CAST(35548.00 AS Numeric(18, 2)), 858, 37, 6, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (84, N'Рулон белый 1x0', N'Рулон', N'\materials\material_18.jpeg', CAST(37126.00 AS Numeric(18, 2)), 960, 35, 9, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (85, N'Спрессованный пак синий 2x0', N'Пресс', N'\materials\material_22.jpeg', CAST(53857.00 AS Numeric(18, 2)), 744, 50, 9, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (86, N'Спрессованный пак цветной 0x1', N'Пресс', N'', CAST(21081.00 AS Numeric(18, 2)), 175, 50, 7, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (87, N'Спрессованный пак синий 0x3', N'Пресс', N'', CAST(29128.00 AS Numeric(18, 2)), 349, 41, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (88, N'Рулон синий 2x1', N'Рулон', N'', CAST(32118.00 AS Numeric(18, 2)), 859, 5, 3, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (89, N'Гранулы белый 3x2', N'Гранулы', N'', CAST(36635.00 AS Numeric(18, 2)), 732, 50, 9, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (90, N'Гранулы зеленый 0x2', N'Гранулы', N'', CAST(46326.00 AS Numeric(18, 2)), 787, 40, 7, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (91, N'Рулон синий 2x2', N'Рулон', N'', CAST(16303.00 AS Numeric(18, 2)), 426, 17, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (92, N'Рулон серый 3x0', N'Рулон', N'\materials\material_10.jpeg', CAST(39760.00 AS Numeric(18, 2)), 34, 17, 8, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (93, N'Гранулы цветной 3x1', N'Гранулы', N'\materials\material_1.jpeg', CAST(21534.00 AS Numeric(18, 2)), 44, 45, 10, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (94, N'Нарезка синий 2x2', N'Нарезка', N'', CAST(55748.00 AS Numeric(18, 2)), 845, 42, 3, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (95, N'Гранулы зеленый 1x3', N'Гранулы', N'', CAST(48576.00 AS Numeric(18, 2)), 603, 5, 8, N'л')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (96, N'Спрессованный пак белый 1x1', N'Пресс', N'', CAST(16919.00 AS Numeric(18, 2)), 547, 35, 2, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (97, N'Рулон зеленый 0x3', N'Рулон', N'', CAST(52323.00 AS Numeric(18, 2)), 913, 13, 4, N'м')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (98, N'Нарезка синий 3x0', N'Нарезка', N'\materials\material_19.jpeg', CAST(52955.00 AS Numeric(18, 2)), 696, 42, 8, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (99, N'Нарезка цветной 2x1', N'Нарезка', N'', CAST(9509.00 AS Numeric(18, 2)), 168, 40, 2, N'кг')
INSERT [dbo].[Material] ([ID], [Name], [TypeMaterial], [Image], [Price], [Count], [MinCount], [CountInPackage], [UnitOfMeasurement]) VALUES (100, N'Рулон синий 1x1', N'Рулон', N'\materials\material_14.jpeg', CAST(40995.00 AS Numeric(18, 2)), 22, 37, 4, N'кг')
GO
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (1, 1, CAST(N'2014-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (2, 2, CAST(N'2010-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (3, 3, CAST(N'2014-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (4, 4, CAST(N'2010-09-07T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (5, 5, CAST(N'2012-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (6, 6, CAST(N'2011-12-28T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (7, 7, CAST(N'2012-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (8, 8, CAST(N'2013-05-23T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (9, 9, CAST(N'2010-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (10, 10, CAST(N'2016-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (11, 11, CAST(N'2016-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (12, 12, CAST(N'2019-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (13, 13, CAST(N'2014-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (14, 14, CAST(N'2019-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (15, 15, CAST(N'2013-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (16, 16, CAST(N'2013-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (17, 17, CAST(N'2015-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (18, 18, CAST(N'2016-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (19, 19, CAST(N'2016-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (20, 20, CAST(N'2018-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (21, 21, CAST(N'2010-08-09T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (22, 22, CAST(N'2017-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (23, 23, CAST(N'2016-08-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (24, 24, CAST(N'2012-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (25, 25, CAST(N'2012-06-17T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (26, 26, CAST(N'2016-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (27, 27, CAST(N'2013-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (28, 28, CAST(N'2017-12-17T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (29, 29, CAST(N'2019-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (30, 30, CAST(N'2010-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (31, 31, CAST(N'2012-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (32, 32, CAST(N'2019-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (33, 33, CAST(N'2017-12-21T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (34, 34, CAST(N'2017-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (35, 35, CAST(N'2014-06-19T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (36, 36, CAST(N'2012-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (37, 37, CAST(N'2016-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (38, 38, CAST(N'2013-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (39, 39, CAST(N'2015-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (40, 40, CAST(N'2017-05-27T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (41, 41, CAST(N'2016-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (42, 42, CAST(N'2015-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (43, 43, CAST(N'2017-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (44, 44, CAST(N'2018-04-28T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (45, 45, CAST(N'2015-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (46, 46, CAST(N'2015-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (47, 47, CAST(N'2016-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (48, 48, CAST(N'2015-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (49, 49, CAST(N'2019-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[MaterialCountHistory] ([ID], [MaterialID], [ChangeDate]) VALUES (50, 50, CAST(N'2015-05-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (1, 1)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (2, 2)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (3, 3)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (4, 4)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (5, 5)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (6, 6)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (7, 7)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (8, 8)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (9, 9)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (10, 10)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (11, 11)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (12, 12)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (13, 13)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (14, 14)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (15, 15)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (16, 16)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (17, 17)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (18, 18)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (19, 19)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (20, 20)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (21, 21)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (22, 22)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (23, 23)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (24, 24)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (25, 25)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (26, 26)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (27, 27)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (28, 28)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (29, 29)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (30, 30)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (31, 31)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (32, 32)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (33, 33)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (34, 34)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (35, 35)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (36, 36)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (37, 37)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (38, 38)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (39, 39)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (40, 40)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (41, 41)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (42, 42)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (43, 43)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (44, 44)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (45, 45)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (46, 46)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (47, 47)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (48, 48)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (49, 49)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (50, 50)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (51, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (52, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (53, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (54, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (55, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (56, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (57, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (58, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (59, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (60, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (61, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (62, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (63, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (64, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (65, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (66, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (67, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (68, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (69, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (70, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (71, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (72, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (73, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (74, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (75, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (76, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (77, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (78, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (79, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (80, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (81, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (82, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (83, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (84, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (85, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (86, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (87, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (88, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (89, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (90, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (91, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (92, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (93, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (94, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (95, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (96, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (97, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (98, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (99, NULL)
INSERT [dbo].[MaterialSuplier] ([MaterialID], [SuplierID]) VALUES (100, NULL)
GO
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (1, N'ОблВектор', 40)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (2, N'Строй', 54)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (3, N'МонтажНефтьОрион', 45)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (4, N'ХозБашкирГла', 10)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (5, N'ДизайнТекстил', 69)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (6, N'Инфо', 33)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (7, N'ОрионБухМетал', 52)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (8, N'РыбИнфо', 71)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (9, N'Тех', 28)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (10, N'ЦементОрион', 43)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (11, N'ФинансСервис', 21)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (12, N'ТрансМясМясКомплекс', 78)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (13, N'ГлавСтрой', 77)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (14, N'ИнжСофт', 99)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (15, N'ТелекомМетизХмель', 67)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (16, N'Лифт', 26)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (17, N'МонтажОр', 6)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (18, N'РыбОбл', 80)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (19, N'ГлавСерви', 20)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (20, N'СервисБашкирКазТраст', 36)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (21, N'Компания Нефть', 97)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (22, N'РыбВостокХоз', 47)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (23, N'Радио', 27)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (24, N'РечСофтРе', 77)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (25, N'Компания ТелекомРосКрепПром', 71)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (26, N'Омск', 90)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (27, N'РосЮпитер', 23)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (28, N'БухИнфо', 91)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (29, N'РечТранс', 22)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (30, N'ТелекомТра', 31)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (31, N'Глав', 87)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (32, N'ЖелДорСтройВекторКомплекс', 97)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (33, N'Вод', 63)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (34, N'ТверьМор', 61)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (35, N'ЦементИнфоМонтаж', 46)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (36, N'Вектор', 22)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (37, N'Компания МорКаза', 6)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (38, N'Урал', 21)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (39, N'ГорТверьЛифт', 50)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (40, N'ЭлектроВод', 16)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (41, N'АлмазМикроМобайлПром', 94)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (42, N'Компания ТомскТверьТ', 26)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (43, N'Тверь', 17)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (44, N'УралТексти', 54)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (45, N'ТверьЛайт', 14)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (46, N'ХозСервис', 99)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (47, N'КрепМетизВектор', 64)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (48, N'ЖелДорХ', 65)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (49, N'ВодОбл', 38)
INSERT [dbo].[MaterialType] ([ID], [Name], [DeferentPrecent]) VALUES (50, N'Электро', 86)
GO
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (1, N'ОблВектор', N'1385540089', CAST(N'2014-11-01' AS Date), 40, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (2, N'Строй', N'2255810682', CAST(N'2010-04-06' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (3, N'МонтажНефтьОрион', N'1298208597', CAST(N'2014-12-13' AS Date), 45, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (4, N'ХозБашкирГла', N'1708759159', CAST(N'2010-09-07' AS Date), 10, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (5, N'ДизайнТекстил', N'2093683523', CAST(N'2012-12-16' AS Date), 69, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (6, N'Инфо', N'1272826845', CAST(N'2011-12-28' AS Date), 33, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (7, N'ОрионБухМетал', N'2193222008', CAST(N'2012-04-09' AS Date), 52, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (8, N'РыбИнфо', N'1418660803', CAST(N'2013-05-23' AS Date), 71, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (9, N'Тех', N'2148577794', CAST(N'2010-12-15' AS Date), 28, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (10, N'ЦементОрион', N'1536344749', CAST(N'2016-02-06' AS Date), 43, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (11, N'ФинансСервис', N'1499914719', CAST(N'2016-05-27' AS Date), 21, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (12, N'ТрансМясМясКомплекс', N'1184923897', CAST(N'2019-07-14' AS Date), 78, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (13, N'ГлавСтрой', N'1107467048', CAST(N'2014-05-01' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (14, N'ИнжСофт', N'2209210168', CAST(N'2019-07-21' AS Date), 99, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (15, N'ТелекомМетизХмель', N'1001436679', CAST(N'2013-06-14' AS Date), 67, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (16, N'Лифт', N'1226636245', CAST(N'2013-12-02' AS Date), 26, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (17, N'МонтажОр', N'1687338212', CAST(N'2015-01-18' AS Date), 6, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (18, N'РыбОбл', N'2097643775', CAST(N'2016-03-05' AS Date), 80, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (19, N'ГлавСерви', N'2112058447', CAST(N'2016-11-05' AS Date), 20, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (20, N'СервисБашкирКазТраст', N'1549832431', CAST(N'2018-03-19' AS Date), 36, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (21, N'Компания Нефть', N'2173203619', CAST(N'2010-08-09' AS Date), 97, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (22, N'РыбВостокХоз', N'1311161756', CAST(N'2017-09-09' AS Date), 47, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (23, N'Радио', N'1104637210', CAST(N'2016-08-21' AS Date), 27, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (24, N'РечСофтРе', N'1155044386', CAST(N'2012-08-08' AS Date), 77, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (25, N'Компания ТелекомРосКрепПром', N'1124623718', CAST(N'2012-06-17' AS Date), 71, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (26, N'Омск', N'1567184813', CAST(N'2016-12-01' AS Date), 90, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (27, N'РосЮпитер', N'2100448888', CAST(N'2013-07-21' AS Date), 23, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (28, N'БухИнфо', N'2192138211', CAST(N'2017-12-17' AS Date), 91, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (29, N'РечТранс', N'2237035085', CAST(N'2019-10-12' AS Date), 22, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (30, N'ТелекомТра', N'1144555605', CAST(N'2010-08-26' AS Date), 31, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (31, N'Глав', N'1859167660', CAST(N'2012-05-24' AS Date), 87, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (32, N'ЖелДорСтройВекторКомплекс', N'2004254497', CAST(N'2019-05-12' AS Date), 97, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (33, N'Вод', N'1492095710', CAST(N'2017-12-21' AS Date), 63, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (34, N'ТверьМор', N'2013469587', CAST(N'2017-01-08' AS Date), 61, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (35, N'ЦементИнфоМонтаж', N'1389100819', CAST(N'2014-06-19' AS Date), 46, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (36, N'Вектор', N'1009676137', CAST(N'2012-06-20' AS Date), 22, N' МКК')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (37, N'Компания МорКаза', N'1177669508', CAST(N'2016-05-28' AS Date), 6, N' ПАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (38, N'Урал', N'1439263529', CAST(N'2013-05-06' AS Date), 21, N' МФО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (39, N'ГорТверьЛифт', N'1865606765', CAST(N'2015-04-01' AS Date), 50, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (40, N'ЭлектроВод', N'1521101623', CAST(N'2017-05-27' AS Date), 16, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (41, N'АлмазМикроМобайлПром', N'1664868343', CAST(N'2016-03-06' AS Date), 94, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (42, N'Компания ТомскТверьТ', N'1341807682', CAST(N'2015-12-25' AS Date), 26, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (43, N'Тверь', N'1860530128', CAST(N'2017-06-25' AS Date), 17, N' ООО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (44, N'УралТексти', N'1705799898', CAST(N'2018-04-28' AS Date), 54, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (45, N'ТверьЛайт', N'1499654365', CAST(N'2015-02-09' AS Date), 14, N' ЗАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (46, N'ХозСервис', N'1656715446', CAST(N'2015-11-13' AS Date), 99, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (47, N'КрепМетизВектор', N'1209084074', CAST(N'2016-06-04' AS Date), 64, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (48, N'ЖелДорХ', N'2004002859', CAST(N'2015-05-03' AS Date), 65, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (49, N'ВодОбл', N'1987741499', CAST(N'2019-04-25' AS Date), 38, N' ОАО')
INSERT [dbo].[Supplier] ([ID], [Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES (50, N'Электро', N'1827769521', CAST(N'2015-05-03' AS Date), 86, N' ПАО')
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agents] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agents]
GO
ALTER TABLE [dbo].[AgentType]  WITH CHECK ADD  CONSTRAINT [FK_AgentType_Agents] FOREIGN KEY([ID])
REFERENCES [dbo].[Agents] ([ID])
GO
ALTER TABLE [dbo].[AgentType] CHECK CONSTRAINT [FK_AgentType_Agents]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSuplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSuplier] CHECK CONSTRAINT [FK_MaterialSuplier_Material]
GO
ALTER TABLE [dbo].[MaterialSuplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuplier_Supplier] FOREIGN KEY([SuplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSuplier] CHECK CONSTRAINT [FK_MaterialSuplier_Supplier]
GO
ALTER TABLE [dbo].[MaterialType]  WITH CHECK ADD  CONSTRAINT [FK_MaterialType_Material] FOREIGN KEY([ID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialType] CHECK CONSTRAINT [FK_MaterialType_Material]
GO
USE [master]
GO
ALTER DATABASE [Materials] SET  READ_WRITE 
GO
