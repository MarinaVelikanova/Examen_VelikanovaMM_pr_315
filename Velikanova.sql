USE [master]
GO
/****** Object:  Database [Lombard]    Script Date: 02.07.2022 13:26:06 ******/
CREATE DATABASE [Lombard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lombard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lombard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lombard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Lombard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Lombard] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lombard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lombard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lombard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lombard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lombard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lombard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lombard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lombard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lombard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lombard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lombard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lombard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lombard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lombard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lombard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lombard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lombard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lombard] SET  MULTI_USER 
GO
ALTER DATABASE [Lombard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lombard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lombard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lombard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lombard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lombard] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Lombard] SET QUERY_STORE = OFF
GO
USE [Lombard]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID_Client] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronomic] [nvarchar](50) NULL,
	[Phone] [nvarchar](11) NULL,
	[Passport] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodSoult]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodSoult](
	[ID_GoodSoult] [int] IDENTITY(1,1) NOT NULL,
	[ID_Sotrudnick] [int] NOT NULL,
	[Date_of_sale] [datetime] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_GoodSoult] PRIMARY KEY CLUSTERED 
(
	[ID_GoodSoult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Graphick]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graphick](
	[ID_Graphick] [int] IDENTITY(1,1) NOT NULL,
	[ID_Sotrudnick] [int] NULL,
	[ID_Status] [int] NULL,
	[Summa] [float] NULL,
	[Date_platega] [datetime] NULL,
	[Fact_date_platega] [datetime] NULL,
 CONSTRAINT [PK_Graphick] PRIMARY KEY CLUSTERED 
(
	[ID_Graphick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_Products] [int] IDENTITY(1,1) NOT NULL,
	[ID_Sotrudnik] [int] NULL,
	[ID_Client] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Delivery_date] [datetime] NULL,
	[Assessed_value] [nvarchar](50) NULL,
	[Bail_amount] [float] NULL,
	[Summa_vykupa] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_Products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnick]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnick](
	[ID_Sotrudnick] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sotrudnick] PRIMARY KEY CLUSTERED 
(
	[ID_Sotrudnick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 02.07.2022 13:26:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID_Status] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID_Client], [Surname], [Name], [Patronomic], [Phone], [Passport]) VALUES (1, N'Великанова', N'Марина', N'Михайловна', N'79134732645', N'234567 3434')
INSERT [dbo].[Client] ([ID_Client], [Surname], [Name], [Patronomic], [Phone], [Passport]) VALUES (2, N'Михайлов', N'Сергей', N'Сергеевич', N'79134756483', N'678934 3456')
INSERT [dbo].[Client] ([ID_Client], [Surname], [Name], [Patronomic], [Phone], [Passport]) VALUES (3, N'Косыгина', N'Юлия', N'Владимировна', N'79137658764', N'987653 8834')
INSERT [dbo].[Client] ([ID_Client], [Surname], [Name], [Patronomic], [Phone], [Passport]) VALUES (4, N'Косолапов', N'Андрей', N'Пупкин', N'79134756364', N'987645 8374')
INSERT [dbo].[Client] ([ID_Client], [Surname], [Name], [Patronomic], [Phone], [Passport]) VALUES (5, N'Горячева', N'Валерия', N'Ильинична', N'79134677365', N'987653 7465')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodSoult] ON 

INSERT [dbo].[GoodSoult] ([ID_GoodSoult], [ID_Sotrudnick], [Date_of_sale], [Price]) VALUES (1, 1, CAST(N'2022-03-22T00:00:00.000' AS DateTime), 3000.2)
INSERT [dbo].[GoodSoult] ([ID_GoodSoult], [ID_Sotrudnick], [Date_of_sale], [Price]) VALUES (2, 2, CAST(N'2022-03-22T00:00:00.000' AS DateTime), 5000)
INSERT [dbo].[GoodSoult] ([ID_GoodSoult], [ID_Sotrudnick], [Date_of_sale], [Price]) VALUES (3, 3, CAST(N'2022-04-21T00:00:00.000' AS DateTime), 2000)
INSERT [dbo].[GoodSoult] ([ID_GoodSoult], [ID_Sotrudnick], [Date_of_sale], [Price]) VALUES (4, 4, CAST(N'2022-04-24T00:00:00.000' AS DateTime), 3400)
INSERT [dbo].[GoodSoult] ([ID_GoodSoult], [ID_Sotrudnick], [Date_of_sale], [Price]) VALUES (5, 5, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 34534)
SET IDENTITY_INSERT [dbo].[GoodSoult] OFF
GO
SET IDENTITY_INSERT [dbo].[Graphick] ON 

INSERT [dbo].[Graphick] ([ID_Graphick], [ID_Sotrudnick], [ID_Status], [Summa], [Date_platega], [Fact_date_platega]) VALUES (1, 1, 1, 3000, CAST(N'2022-04-22T00:00:00.000' AS DateTime), CAST(N'2022-04-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Graphick] ([ID_Graphick], [ID_Sotrudnick], [ID_Status], [Summa], [Date_platega], [Fact_date_platega]) VALUES (2, 2, 2, 4000, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Graphick] ([ID_Graphick], [ID_Sotrudnick], [ID_Status], [Summa], [Date_platega], [Fact_date_platega]) VALUES (3, 3, 3, 4544, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Graphick] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID_Products], [ID_Sotrudnik], [ID_Client], [Name], [Type], [Delivery_date], [Assessed_value], [Bail_amount], [Summa_vykupa]) VALUES (1, 1, 1, N'Колье', N'золото', CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'345667', 45677, 456789)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sotrudnick] ON 

INSERT [dbo].[Sotrudnick] ([ID_Sotrudnick], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, N'Борисов', N'Илья', N'Владимирович', N'Bor', N'Bor2')
INSERT [dbo].[Sotrudnick] ([ID_Sotrudnick], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, N'Фракцев', N'Сергей', N'Михайлович', N'Fr', N'Fr3')
INSERT [dbo].[Sotrudnick] ([ID_Sotrudnick], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, N'Климова', N'Ирина', N'Сергеевна', N'Kl', N'Kl4')
INSERT [dbo].[Sotrudnick] ([ID_Sotrudnick], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (4, N'Петрова', N'Марина', N'Владимировна', N'Petr', N'Petr00')
INSERT [dbo].[Sotrudnick] ([ID_Sotrudnick], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (5, N'Хазов', N'Михаил', N'Юрьевич', N'Haz', N'Haz5')
SET IDENTITY_INSERT [dbo].[Sotrudnick] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID_Status], [Name]) VALUES (1, N'просрочен')
INSERT [dbo].[Status] ([ID_Status], [Name]) VALUES (2, N'принят')
INSERT [dbo].[Status] ([ID_Status], [Name]) VALUES (3, N'отменен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[GoodSoult]  WITH CHECK ADD  CONSTRAINT [FK_GoodSoult_Sotrudnick] FOREIGN KEY([ID_GoodSoult])
REFERENCES [dbo].[Sotrudnick] ([ID_Sotrudnick])
GO
ALTER TABLE [dbo].[GoodSoult] CHECK CONSTRAINT [FK_GoodSoult_Sotrudnick]
GO
ALTER TABLE [dbo].[Graphick]  WITH CHECK ADD  CONSTRAINT [FK_Graphick_Sotrudnick] FOREIGN KEY([ID_Sotrudnick])
REFERENCES [dbo].[Sotrudnick] ([ID_Sotrudnick])
GO
ALTER TABLE [dbo].[Graphick] CHECK CONSTRAINT [FK_Graphick_Sotrudnick]
GO
ALTER TABLE [dbo].[Graphick]  WITH CHECK ADD  CONSTRAINT [FK_Graphick_Status] FOREIGN KEY([ID_Status])
REFERENCES [dbo].[Status] ([ID_Status])
GO
ALTER TABLE [dbo].[Graphick] CHECK CONSTRAINT [FK_Graphick_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Client] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID_Client])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Client]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sotrudnick] FOREIGN KEY([ID_Sotrudnik])
REFERENCES [dbo].[Sotrudnick] ([ID_Sotrudnick])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sotrudnick]
GO
USE [master]
GO
ALTER DATABASE [Lombard] SET  READ_WRITE 
GO
