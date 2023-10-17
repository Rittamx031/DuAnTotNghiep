USE [master]
GO
/****** Object:  Database [DUANTN]    Script Date: 16/10/2023 11:08:48 CH ******/
CREATE DATABASE [DUANTN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DUANTN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAY1\MSSQL\DATA\DUANTN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DUANTN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAY1\MSSQL\DATA\DUANTN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DUANTN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DUANTN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DUANTN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DUANTN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DUANTN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DUANTN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DUANTN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DUANTN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DUANTN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DUANTN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DUANTN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DUANTN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DUANTN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DUANTN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DUANTN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DUANTN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DUANTN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DUANTN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DUANTN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DUANTN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DUANTN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DUANTN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DUANTN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DUANTN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DUANTN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DUANTN] SET  MULTI_USER 
GO
ALTER DATABASE [DUANTN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DUANTN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DUANTN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DUANTN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DUANTN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DUANTN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DUANTN', N'ON'
GO
ALTER DATABASE [DUANTN] SET QUERY_STORE = OFF
GO
USE [DUANTN]
GO
/****** Object:  Table [dbo].[account]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [uniqueidentifier] NOT NULL,
	[email] [nvarchar](100) NULL,
	[status] [int] NULL,
	[id_customer] [uniqueidentifier] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[password] [nvarchar](200) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_voucher]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_voucher](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_account] [uniqueidentifier] NOT NULL,
	[id_voucher] [bigint] NOT NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_account_voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_customer] [uniqueidentifier] NOT NULL,
	[id_employee] [uniqueidentifier] NOT NULL,
	[id_pay] [bigint] NOT NULL,
	[code] [nvarchar](50) NULL,
	[confirmation_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[completion_date] [datetime] NULL,
	[customer_name] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[money_ship] [float] NULL,
	[total_money] [decimal](20, 3) NULL,
	[reduction_amount] [decimal](20, 3) NULL,
	[deposit] [decimal](20, 3) NULL,
	[note] [nvarchar](500) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_product_detail] [bigint] NOT NULL,
	[id_bill] [bigint] NOT NULL,
	[total_money] [decimal](20, 3) NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_bill_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_trademark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[id_customer] [uniqueidentifier] NOT NULL,
	[start_time] [datetime] NULL,
	[quantity] [int] NULL,
	[total_money] [decimal](20, 3) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts_detail]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts_detail](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[quantity] [int] NULL,
	[id_cart] [bigint] NOT NULL,
	[id_product_detail] [bigint] NOT NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_carts_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](50) NULL,
	[birth_date] [datetime] NULL,
	[gender] [bit] NULL,
	[phone] [nvarchar](10) NULL,
	[thanh_pho] [nvarchar](50) NULL,
	[thanh_pho_name] [nvarchar](50) NULL,
	[huyen] [nvarchar](50) NULL,
	[huyen_name] [nvarchar](50) NULL,
	[xa] [nvarchar](50) NULL,
	[xa_name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [uniqueidentifier] NOT NULL,
	[id_roles] [bigint] NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[birth_date] [datetime] NULL,
	[thanh_pho] [nvarchar](50) NULL,
	[thanh_pho_name] [nvarchar](50) NULL,
	[huyen] [nvarchar](50) NULL,
	[huyen_name] [nvarchar](50) NULL,
	[xa] [nvarchar](50) NULL,
	[xa_name] [nvarchar](50) NULL,
	[address] [nvarchar](500) NULL,
	[phone] [nvarchar](10) NULL,
	[email] [nchar](25) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[cccd] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[password] [nvarchar](200) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluate]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluate](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_product_detail] [bigint] NOT NULL,
	[id_customer] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](500) NULL,
	[start_time] [datetime] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_product_detail] [bigint] NOT NULL,
	[image] [nvarchar](500) NULL,
	[discription] [nvarchar](500) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nchar](25) NOT NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origin]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origin](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_origin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pattern]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pattern](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_Pattern_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payment_method] [int] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_pay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](50) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_detail]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_detail](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](50) NULL,
	[import_price] [decimal](20, 3) NULL,
	[export_price] [decimal](20, 3) NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](500) NULL,
	[id_pattern] [bigint] NULL,
	[id_color] [bigint] NULL,
	[id_origin] [bigint] NULL,
	[id_brand] [bigint] NULL,
	[id_material] [bigint] NULL,
	[id_size] [bigint] NULL,
	[id_styles] [bigint] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[id_product] [bigint] NULL,
 CONSTRAINT [PK_product_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_side] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[styles]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[styles](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_styles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](25) NULL,
	[name] [nvarchar](50) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[quantily] [int] NULL,
	[discount] [decimal](20, 3) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[brand_voucher] [bit] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_detail]    Script Date: 16/10/2023 11:08:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher_detail](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[id_bill] [bigint] NOT NULL,
	[id_voucher] [bigint] NOT NULL,
	[money_before_reduction] [decimal](20, 3) NULL,
	[money_after_reduction] [decimal](20, 3) NULL,
	[money_reduction] [decimal](20, 3) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_voucher_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'32978b98-6923-4af1-b5dc-00ceb04db8f6', 1, N'NV01', N'Phạm Mỹ Tho', 0, CAST(N'2003-06-17T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hà Nội', N'0961745487', N'my@gmail.com             ', 0, NULL, NULL, 0, N'023133245213', N'face2.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'915854e3-65af-451c-b466-0904b615f3be', 2, N'NV02', N'Phạm Khương Duy', 0, CAST(N'2002-05-11T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Thái Bình', N'0141234144', N'duy@gmail.com            ', 0, NULL, NULL, 0, N'031241362432', N'face1.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'183f9459-ee9e-45cb-982c-1564882f6fd4', 3, N'NV03', N'Nguyễn Văn Long', 1, CAST(N'2003-11-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Nam Định', N'0348452345', N'long@gmail.com           ', 1, NULL, NULL, 1, N'043423642342', N'face3.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'a06ab4b4-e457-4733-9037-383e59502921', 4, N'NV04', N'Trần Thị Huyền', 0, CAST(N'2003-02-07T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Thanh Hóa', N'0823623564', N'huyen@gmail.com          ', 1, NULL, NULL, 1, N'034394573243', N'face4.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'6b07adc1-adfc-4588-806c-44563581ca72', 5, N'NV05', N'Phạm Anh Dũng', 1, CAST(N'2003-07-22T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hồ Chí Minh', N'0312744342', N'dung@gmail.com           ', 0, NULL, NULL, 1, N'034384264624', N'face5.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'6fe4567c-a06f-425e-b6f4-4980cf025c01', 6, N'NV06', N'Phạm Tuyết Nga', 0, CAST(N'2000-01-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Nam Định', N'0923472342', N'nga@gmail.com            ', 0, NULL, NULL, 1, N'038473265354', N'face6.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'40d4f149-f6b7-4377-add9-4b27b17f4919', 7, N'NV07', N'Vũ Thị Phương', 1, CAST(N'1999-01-02T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Phú Thọ', N'0742364321', N'phuong@gmail.com         ', 1, NULL, NULL, 1, N'034857475234', N'face7.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'680f30a4-13cf-4ccd-a308-539977ea3866', 8, N'NV08', N'Trần Khánh Thịnh', 1, CAST(N'1998-02-11T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hưng Yên', N'0834372423', N'thinh@gmail.com          ', 0, NULL, NULL, 1, N'034835674567', N'face8.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'4308d505-c2ce-4162-8e14-57af8f50fe7d', 1, N'NV09', N'Quản Thu Hà', 0, CAST(N'2003-05-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Bình Định', N'0538532223', N'ha@gmail.com             ', 1, NULL, NULL, 1, N'034854735624', N'face9.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'35355a54-22a8-45d0-be09-69d775ecf993', 2, N'NV010', N'Vũ Văn Ngọ', 1, CAST(N'2003-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Huế', N'0834623462', N'ngoc@gmail.com           ', 0, NULL, NULL, 1, N'034875353453', N'face10.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'417b2f81-cca4-4a17-b491-7ba7e04e889a', 1, N'NV011', N'Phạm Thị Ánh', 0, CAST(N'2004-06-22T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Duy Nhất, Vũ Thư, Thái Bình', N'0423434212', N'27@gmail.com             ', 0, NULL, NULL, 0, N'23123123123', N'face27.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'ac2542ce-c4a4-4b43-bb82-83b1865abcde', 3, N'NV012', N'Trương Thị Trúc', 1, CAST(N'2000-01-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Quảng Ninh', N'0438264242', N'truc@gmail.com           ', 0, NULL, NULL, 1, N'034823572652', N'face11.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'7ea03b5d-216b-411b-97b5-9ac5413c19bc', 4, N'NV013', N'Vũ Thị Trang', 0, CAST(N'2003-09-13T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Thái Bình', N'0368423642', N'trang@gmail.com          ', 0, NULL, NULL, 1, N'034382462642', N'face12.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'd46506b4-6de3-41d7-8459-a77cbd701dd4', 5, N'NV014', N'Lâm Văn Huy', 0, CAST(N'2002-02-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hà Nội', N'0328426244', N'chuc@gmail.com           ', 0, NULL, NULL, 1, N'034284263462', N'face13.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'3bbd0fd3-b64a-46cb-bbcf-a7d450867eab', 6, N'NV015', N'Vũ Thị Ngô', 0, CAST(N'2000-01-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hà Nội', N'0348235262', N'ngo@gmail.com            ', 0, NULL, NULL, 1, N'034823457234', N'face14.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'0a8587f9-4c42-4cf1-afc3-b16dbf7391db', 7, N'NV016', N'Trần Quốc Khánh', 0, CAST(N'2001-02-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Thanh Hóa', N'0342842634', N'duyet@gmail.com          ', 0, NULL, NULL, 1, N'034382462734', N'face15.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'c7cfa9e4-47b2-4aed-8f17-c530dea374b8', 8, N'NV017', N'Nguyễn Khánh Cường', 0, CAST(N'1995-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Hà Giang', N'0357326242', N'ha@gmail.com             ', 0, NULL, NULL, 1, N'034832472342', N'face16.jpg', NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [thanh_pho], [thanh_pho_name], [huyen], [huyen_name], [xa], [xa_name], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [cccd], [image], [password]) VALUES (N'b2599c14-53a3-45f8-a24d-e5080f38281a', 5, N'NV018', N'Nguyễn Quỳnh Anh', 0, CAST(N'2002-12-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, N'Bắc Giang', N'0343247246', N'bap@gmail.com            ', 0, NULL, NULL, 1, N'034284274234', N'face17.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[product_detail] ON 

INSERT [dbo].[product_detail] ([id], [code], [name], [import_price], [export_price], [quantity], [description], [id_pattern], [id_color], [id_origin], [id_brand], [id_material], [id_size], [id_styles], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (0, N'CTSP01', N'Chi tiet san pham 1', CAST(10000.000 AS Decimal(20, 3)), CAST(15000.000 AS Decimal(20, 3)), 100, N'ngon me ly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[product_detail] ([id], [code], [name], [import_price], [export_price], [quantity], [description], [id_pattern], [id_color], [id_origin], [id_brand], [id_material], [id_size], [id_styles], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (1, N'CTSP02', N'Chi tiet san pham 2', CAST(20000.000 AS Decimal(20, 3)), CAST(30000.000 AS Decimal(20, 3)), 50, N'khum ngon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL)
INSERT [dbo].[product_detail] ([id], [code], [name], [import_price], [export_price], [quantity], [description], [id_pattern], [id_color], [id_origin], [id_brand], [id_material], [id_size], [id_styles], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (2, N'CTSP03', N'Chi tiet san pham 3', CAST(15000.000 AS Decimal(20, 3)), CAST(40000.000 AS Decimal(20, 3)), 75, N'tuyet voi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL)
INSERT [dbo].[product_detail] ([id], [code], [name], [import_price], [export_price], [quantity], [description], [id_pattern], [id_color], [id_origin], [id_brand], [id_material], [id_size], [id_styles], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (3, N'CTSP04', N'Chi tiet san pham 4', CAST(1000000.000 AS Decimal(20, 3)), CAST(3000000.000 AS Decimal(20, 3)), 25, N'hoi dat do', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[product_detail] ([id], [code], [name], [import_price], [export_price], [quantity], [description], [id_pattern], [id_color], [id_origin], [id_brand], [id_material], [id_size], [id_styles], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (4, N'CTSP05', N'Chi tiet san pham 5', CAST(2200000.000 AS Decimal(20, 3)), CAST(4000000.000 AS Decimal(20, 3)), 45, N'toy stoy 5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[product_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (1, N'User1', 0, NULL, NULL, 1, N'User1')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (2, N'User2', 1, NULL, NULL, 1, N'User2')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (3, N'User3', 0, NULL, NULL, 1, N'User3')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (4, N'User4', 1, NULL, NULL, 1, N'User4')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (5, N'User5', 0, NULL, NULL, 1, N'User5')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (6, N'User6', 0, NULL, NULL, 1, N'User6')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (7, N'User7', 0, NULL, NULL, 1, N'User7')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (8, N'User8', 0, NULL, NULL, 1, N'User8')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[account_voucher] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[account_voucher] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[cart] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[cart] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[carts_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[carts_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_staff_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[evaluate] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[evaluate] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[material] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[material] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[origin] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[origin] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[pattern] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[pattern] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[pay] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[pay] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[styles] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[styles] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_customer]
GO
ALTER TABLE [dbo].[account_voucher]  WITH CHECK ADD  CONSTRAINT [FK_account_voucher_account] FOREIGN KEY([id_account])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[account_voucher] CHECK CONSTRAINT [FK_account_voucher_account]
GO
ALTER TABLE [dbo].[account_voucher]  WITH CHECK ADD  CONSTRAINT [FK_account_voucher_voucher] FOREIGN KEY([id_voucher])
REFERENCES [dbo].[voucher] ([id])
GO
ALTER TABLE [dbo].[account_voucher] CHECK CONSTRAINT [FK_account_voucher_voucher]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_customer]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_employee]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_pay] FOREIGN KEY([id_pay])
REFERENCES [dbo].[pay] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_pay]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH CHECK ADD  CONSTRAINT [FK_bill_detail_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product_detail]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [FK_cart_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_customer]
GO
ALTER TABLE [dbo].[carts_detail]  WITH CHECK ADD  CONSTRAINT [FK_carts_detail_cart] FOREIGN KEY([id_cart])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[carts_detail] CHECK CONSTRAINT [FK_carts_detail_cart]
GO
ALTER TABLE [dbo].[carts_detail]  WITH CHECK ADD  CONSTRAINT [FK_carts_detail_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[carts_detail] CHECK CONSTRAINT [FK_carts_detail_product_detail]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_roles] FOREIGN KEY([id_roles])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_roles]
GO
ALTER TABLE [dbo].[evaluate]  WITH CHECK ADD  CONSTRAINT [FK_evaluate_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[evaluate] CHECK CONSTRAINT [FK_evaluate_customer]
GO
ALTER TABLE [dbo].[evaluate]  WITH CHECK ADD  CONSTRAINT [FK_evaluate_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[evaluate] CHECK CONSTRAINT [FK_evaluate_product_detail]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_product_detail]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_brand] FOREIGN KEY([id_brand])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_brand]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_color] FOREIGN KEY([id_color])
REFERENCES [dbo].[color] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_color]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_material] FOREIGN KEY([id_material])
REFERENCES [dbo].[material] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_material]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_origin] FOREIGN KEY([id_origin])
REFERENCES [dbo].[origin] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_origin]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_pattern] FOREIGN KEY([id_pattern])
REFERENCES [dbo].[pattern] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_pattern]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_product]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_size] FOREIGN KEY([id_size])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_size]
GO
ALTER TABLE [dbo].[product_detail]  WITH CHECK ADD  CONSTRAINT [FK_product_detail_styles] FOREIGN KEY([id_styles])
REFERENCES [dbo].[styles] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_styles]
GO
ALTER TABLE [dbo].[voucher_detail]  WITH CHECK ADD  CONSTRAINT [FK_voucher_detail_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[voucher_detail] CHECK CONSTRAINT [FK_voucher_detail_bill]
GO
ALTER TABLE [dbo].[voucher_detail]  WITH CHECK ADD  CONSTRAINT [FK_voucher_detail_voucher] FOREIGN KEY([id_voucher])
REFERENCES [dbo].[voucher] ([id])
GO
ALTER TABLE [dbo].[voucher_detail] CHECK CONSTRAINT [FK_voucher_detail_voucher]
GO
/****** Object:  Trigger [dbo].[trg_generate_bill_code]    Script Date: 16/10/2023 11:08:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_bill_code]
ON [dbo].[bill]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'HD'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[bill]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END

GO
ALTER TABLE [dbo].[bill] ENABLE TRIGGER [trg_generate_bill_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_brand_code]    Script Date: 16/10/2023 11:08:49 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_brand_code]
ON [dbo].[brand]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'TH'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[brand]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END
GO
ALTER TABLE [dbo].[brand] ENABLE TRIGGER [trg_generate_brand_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_cart_code]    Script Date: 16/10/2023 11:08:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_cart_code]
ON [dbo].[cart]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'CR'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[cart]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END
GO
ALTER TABLE [dbo].[cart] ENABLE TRIGGER [trg_generate_cart_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_color_code]    Script Date: 16/10/2023 11:08:50 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_color_code]
ON [dbo].[color]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'MS'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[color]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END
GO
ALTER TABLE [dbo].[color] ENABLE TRIGGER [trg_generate_color_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_customer_code]    Script Date: 16/10/2023 11:08:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_customer_code]
ON [dbo].[customer]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'KH'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[customer]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END
GO
ALTER TABLE [dbo].[customer] ENABLE TRIGGER [trg_generate_customer_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_employee_code]    Script Date: 16/10/2023 11:08:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_generate_employee_code]
ON [dbo].[employee]
AFTER INSERT
AS
BEGIN
    DECLARE @CodePrefix nvarchar(2) = 'NV'
    DECLARE @CodeSuffix nvarchar(2)
    DECLARE @NextCode nvarchar(4)

    SET @CodeSuffix = RIGHT('00' + CAST((SELECT COUNT(*) FROM inserted) AS nvarchar), 2)
    SET @NextCode = @CodePrefix + @CodeSuffix

    UPDATE [dbo].[employee]
    SET [code] = @NextCode
    WHERE [id] IN (SELECT [id] FROM inserted)
END
GO
ALTER TABLE [dbo].[employee] ENABLE TRIGGER [trg_generate_employee_code]
GO
/****** Object:  Trigger [dbo].[GenerateDescription]    Script Date: 16/10/2023 11:08:51 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateDescription]
ON [dbo].[evaluate]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'DG'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng evaluate
    SELECT @id = MAX(id) FROM dbo.evaluate

    -- Nếu không có bản ghi nào trong bảng evaluate, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "description"
    UPDATE dbo.evaluate
    SET description = @prefix + RIGHT('00' + CONVERT(NVARCHAR(3), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[evaluate] ENABLE TRIGGER [GenerateDescription]
GO
/****** Object:  Trigger [dbo].[GenerateCode]    Script Date: 16/10/2023 11:08:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode]
ON [dbo].[material]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'CL'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng material
    SELECT @id = MAX(id) FROM dbo.material

    -- Nếu không có bản ghi nào trong bảng material, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.material
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(3), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[material] ENABLE TRIGGER [GenerateCode]
GO
/****** Object:  Trigger [dbo].[GenerateCode1]    Script Date: 16/10/2023 11:08:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode1]
ON [dbo].[origin]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'NG'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng origin
    SELECT @id = MAX(id) FROM dbo.origin

    -- Nếu không có bản ghi nào trong bảng origin, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.origin
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[origin] ENABLE TRIGGER [GenerateCode1]
GO
/****** Object:  Trigger [dbo].[GenerateCode2]    Script Date: 16/10/2023 11:08:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode2]
ON [dbo].[pattern]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'HV'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng pattern
    SELECT @id = MAX(id) FROM dbo.pattern

    -- Nếu không có bản ghi nào trong bảng pattern, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.pattern
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[pattern] ENABLE TRIGGER [GenerateCode2]
GO
/****** Object:  Trigger [dbo].[GenerateCode3]    Script Date: 16/10/2023 11:08:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode3]
ON [dbo].[product]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'SP'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng product
    SELECT @id = MAX(id) FROM dbo.product

    -- Nếu không có bản ghi nào trong bảng product, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.product
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[product] ENABLE TRIGGER [GenerateCode3]
GO
/****** Object:  Trigger [dbo].[GenerateCode4]    Script Date: 16/10/2023 11:08:53 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode4]
ON [dbo].[product_detail]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(4) = 'CTSP'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng product_detail
    SELECT @id = MAX(id) FROM dbo.product_detail

    -- Nếu không có bản ghi nào trong bảng product_detail, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.product_detail
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[product_detail] ENABLE TRIGGER [GenerateCode4]
GO
/****** Object:  Trigger [dbo].[GenerateCode5]    Script Date: 16/10/2023 11:08:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode5]
ON [dbo].[size]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'KC'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng size
    SELECT @id = MAX(id) FROM dbo.size

    -- Nếu không có bản ghi nào trong bảng size, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.size
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[size] ENABLE TRIGGER [GenerateCode5]
GO
/****** Object:  Trigger [dbo].[GenerateCode6]    Script Date: 16/10/2023 11:08:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode6]
ON [dbo].[styles]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'PC'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng styles
    SELECT @id = MAX(id) FROM dbo.styles

    -- Nếu không có bản ghi nào trong bảng styles, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.styles
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[styles] ENABLE TRIGGER [GenerateCode6]
GO
/****** Object:  Trigger [dbo].[GenerateCode7]    Script Date: 16/10/2023 11:08:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[GenerateCode7]
ON [dbo].[voucher]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @prefix NVARCHAR(2) = 'KM'
    DECLARE @id INT

    -- Lấy giá trị id mới nhất từ bảng voucher
    SELECT @id = MAX(id) FROM dbo.voucher

    -- Nếu không có bản ghi nào trong bảng voucher, gán @id = 1
    IF @id IS NULL
        SET @id = 1
    ELSE
        SET @id = @id + 1

    -- Tạo mã tự động cho trường "code"
    UPDATE dbo.voucher
    SET code = @prefix + RIGHT('00' + CONVERT(NVARCHAR(2), @id), 2)
    WHERE id IN (SELECT id FROM inserted)
END
GO
ALTER TABLE [dbo].[voucher] ENABLE TRIGGER [GenerateCode7]
GO
USE [master]
GO
ALTER DATABASE [DUANTN] SET  READ_WRITE 
GO
