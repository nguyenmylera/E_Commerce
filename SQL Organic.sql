USE [master]
GO
/****** Object:  Database [Organic]    Script Date: 11/11/2024 9:04:07 CH ******/
CREATE DATABASE [Organic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Organic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SVAD\MSSQL\DATA\Organic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Organic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SVAD\MSSQL\DATA\Organic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Organic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Organic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Organic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Organic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Organic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Organic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Organic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Organic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Organic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Organic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Organic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Organic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Organic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Organic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Organic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Organic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Organic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Organic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Organic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Organic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Organic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Organic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Organic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Organic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Organic] SET RECOVERY FULL 
GO
ALTER DATABASE [Organic] SET  MULTI_USER 
GO
ALTER DATABASE [Organic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Organic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Organic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Organic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Organic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Organic', N'ON'
GO
ALTER DATABASE [Organic] SET QUERY_STORE = OFF
GO
USE [Organic]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Organic]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [tinyint] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](32) NOT NULL,
	[ImageUrl] [varchar](16) NOT NULL,
	[Description] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[MemberId] [varchar](32) NOT NULL,
	[CategoryId] [smallint] NOT NULL,
	[Tags] [nvarchar](64) NOT NULL,
	[ImageUrl] [varchar](32) NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[BlogDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [varchar](32) NOT NULL,
	[Productid] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](64) NOT NULL,
	[ImageUrl] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [smallint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] NOT NULL,
	[MemberId] [varchar](32) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[GivenName] [nvarchar](16) NOT NULL,
	[Surname] [nvarchar](32) NULL,
	[Phone] [varchar](16) NOT NULL,
	[Address] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 11/11/2024 9:04:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[InvoiceId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/11/2024 9:04:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberId] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Password] [varchar](128) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[GivenName] [nvarchar](16) NOT NULL,
	[Surname] [nvarchar](32) NULL,
	[LoginDate] [datetime] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[RoleId] [int] NOT NULL,
	[VerificationCode] [nvarchar](50) NULL,
	[CodeExpirationTime] [date] NULL,
	[PasswordResetToken] [nvarchar](max) NULL,
	[ResetTokenExpiry] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2024 9:04:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [smallint] NOT NULL,
	[ProductName] [nvarchar](64) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[ImageUrl] [varchar](32) NOT NULL,
	[Explain] [nvarchar](512) NOT NULL,
	[Availability] [nvarchar](16) NOT NULL,
	[Shipping] [varchar](64) NOT NULL,
	[Weight] [decimal](10, 2) NOT NULL,
	[Unit] [varchar](8) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
	[Reviews] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/11/2024 9:04:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VnPayments]    Script Date: 11/11/2024 9:04:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VnPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[BankCode] [nvarchar](50) NOT NULL,
	[BankTranNo] [nvarchar](50) NOT NULL,
	[CardType] [nvarchar](50) NOT NULL,
	[OrderInfo] [nvarchar](255) NOT NULL,
	[PayDate] [nvarchar](50) NOT NULL,
	[ResponseCode] [nvarchar](50) NOT NULL,
	[TmnCode] [nvarchar](50) NOT NULL,
	[TransactionNo] [nvarchar](50) NOT NULL,
	[TransactionStatus] [nvarchar](50) NOT NULL,
	[TxnRef] [nvarchar](50) NOT NULL,
	[SecureHash] [nvarchar](255) NOT NULL,
	[PaymentDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [BlogDate]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT (getdate()) FOR [LoginDate]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[VnPayments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[VnPayments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[VnPayments] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([Productid])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberId])
GO
USE [master]
GO
ALTER DATABASE [Organic] SET  READ_WRITE 
GO
