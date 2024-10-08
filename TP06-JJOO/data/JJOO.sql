USE [master]
GO
/****** Object:  Database [JJOO]    Script Date: 15/8/2024 15:44:04 ******/
CREATE DATABASE [JJOO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JJOO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JJOO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JJOO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JJOO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JJOO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JJOO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JJOO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JJOO] SET ARITHABORT OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JJOO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JJOO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JJOO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JJOO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JJOO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JJOO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JJOO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JJOO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JJOO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JJOO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JJOO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JJOO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JJOO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JJOO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JJOO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JJOO] SET RECOVERY FULL 
GO
ALTER DATABASE [JJOO] SET  MULTI_USER 
GO
ALTER DATABASE [JJOO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JJOO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JJOO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JJOO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JJOO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JJOO', N'ON'
GO
ALTER DATABASE [JJOO] SET QUERY_STORE = OFF
GO
USE [JJOO]
GO
/****** Object:  User [alumno]    Script Date: 15/8/2024 15:44:05 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Deportes]    Script Date: 15/8/2024 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportes](
	[IdDeporte] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Foto] [text] NOT NULL,
 CONSTRAINT [PK_Deportes] PRIMARY KEY CLUSTERED 
(
	[IdDeporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deportistas]    Script Date: 15/8/2024 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deportistas](
	[IdDeportista] [int] NOT NULL,
	[Apellido] [varchar](200) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [text] NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdDeporte] [int] NOT NULL,
 CONSTRAINT [PK_Deportistas] PRIMARY KEY CLUSTERED 
(
	[IdDeportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 15/8/2024 15:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Bandera] [text] NOT NULL,
	[FechaFundacion] [date] NOT NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (1, N'Tenis', N'https://olympics.com/images/static/sports/pictograms/v2/ten.svg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (2, N'Ciclismo BMX Freestyle', N'https://olympics.com/images/static/sports/pictograms/v2/bmf.svg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (3, N'Tiro', N'https://olympics.com/images/static/sports/pictograms/v2/sho.svg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (4, N'Hockey sobre césped', N'https://olympics.com/images/static/sports/pictograms/v2/hoc.svg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (5, N'Fútbol', N'https://olympics.com/images/static/sports/pictograms/v2/fbl.svg')
INSERT [dbo].[Deportes] ([IdDeporte], [Nombre], [Foto]) VALUES (6, N'Baloncesto', N'https://olympics.com/images/static/sports/pictograms/v2/bkb.svg')
GO
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (1, N'Torres Gil', N'José Augusto', CAST(N'1995-03-28' AS Date), N'https://www.elgrafico.com.ar/media/cache/pub_news_details_large/media/i/16/2a/162a32496df37e7c7ccda531b256bd85e3cf5b94.jpg', 1, 2)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (2, N'Djokovic', N'Novak ', CAST(N'1987-05-22' AS Date), N'https://www.ole.com.ar/2024/08/04/fCvpRAZqn_720x0__1.jpg', 3, 1)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (3, N'Dikeç', N'Yusuf ', CAST(N'1973-01-01' AS Date), N'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2024/08/06/17229365310225.jpg', 5, 3)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (4, N'Fokke', N'Luna Noa', CAST(N'2001-03-09' AS Date), N'https://storage.pubble.nl/6a98e371/content/2024/7/5d85c7af-acba-4558-acaa-63cb15506e00_thumb1440.jpg', 6, 4)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (5, N'López Marín', N'Fermín', CAST(N'2003-05-11' AS Date), N'https://phantom-marca.unidadeditorial.es/2eec5f2b76015b472deef32cc3304a5e/resize/828/f/jpg/assets/multimedia/imagenes/2024/08/09/17232242907234.jpg', 2, 5)
INSERT [dbo].[Deportistas] ([IdDeportista], [Apellido], [Nombre], [FechaNacimiento], [Foto], [IdPais], [IdDeporte]) VALUES (6, N'Curry II', N'Stephen', CAST(N'1988-03-14' AS Date), N'https://phantom-marca.unidadeditorial.es/79eb954270c764141d0bb5b217fe6986/resize/828/f/jpg/assets/multimedia/imagenes/2024/08/11/17233745739270.jpg', 4, 6)
GO
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (1, N'Argentina', N'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/200px-Flag_of_Argentina.svg.png', CAST(N'1816-07-09' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (2, N'España', N'https://upload.wikimedia.org/wikipedia/commons/8/89/Bandera_de_Espa%C3%B1a.svg', CAST(N'1492-10-12' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (3, N'Serbia', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Flag_of_Serbia.svg/1920px-Flag_of_Serbia.svg.png', CAST(N'2006-06-05' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (4, N'EEUU', N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/800px-Flag_of_the_United_States.svg.png', CAST(N'1776-07-04' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (5, N'Turquía', N'https://upload.wikimedia.org/wikipedia/commons/b/b4/Flag_of_Turkey.svg', CAST(N'1923-10-29' AS Date))
INSERT [dbo].[Paises] ([IdPais], [Nombre], [Bandera], [FechaFundacion]) VALUES (6, N'Países Bajos', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM89PWpoVWcc5Vx1mmGfuUFMZVCwn5cM57xw&s', CAST(N'1581-07-26' AS Date))
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Deportes] FOREIGN KEY([IdDeporte])
REFERENCES [dbo].[Deportes] ([IdDeporte])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Deportes]
GO
ALTER TABLE [dbo].[Deportistas]  WITH CHECK ADD  CONSTRAINT [FK_Deportistas_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([IdPais])
GO
ALTER TABLE [dbo].[Deportistas] CHECK CONSTRAINT [FK_Deportistas_Paises]
GO
USE [master]
GO
ALTER DATABASE [JJOO] SET  READ_WRITE 
GO
