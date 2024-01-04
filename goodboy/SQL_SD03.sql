USE [master]
GO
/****** Object:  Database [DUANTN_SD03]    Script Date: 1/4/2024 10:01:51 PM ******/
CREATE DATABASE [DUANTN_SD03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DUANTN_SD03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DUANTN_SD03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DUANTN_SD03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DUANTN_SD03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DUANTN_SD03] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DUANTN_SD03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DUANTN_SD03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET ARITHABORT OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DUANTN_SD03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DUANTN_SD03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DUANTN_SD03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DUANTN_SD03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DUANTN_SD03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DUANTN_SD03] SET  MULTI_USER 
GO
ALTER DATABASE [DUANTN_SD03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DUANTN_SD03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DUANTN_SD03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DUANTN_SD03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DUANTN_SD03] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DUANTN_SD03] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DUANTN_SD03] SET QUERY_STORE = ON
GO
ALTER DATABASE [DUANTN_SD03] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DUANTN_SD03]
GO
/****** Object:  Table [dbo].[account]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [uniqueidentifier] NOT NULL,
	[email] [nvarchar](150) NULL,
	[status] [int] NULL,
	[id_customer] [uniqueidentifier] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[password] [nvarchar](200) NULL,
	[image] [nvarchar](max) NULL,
	[actived] [bit] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_voucher]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_voucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_account] [uniqueidentifier] NULL,
	[id_voucher] [uniqueidentifier] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[addresss]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresss](
	[id] [uniqueidentifier] NOT NULL,
	[id_customer] [uniqueidentifier] NULL,
	[ten_dia_chi] [nvarchar](50) NULL,
	[ten_nguoi_nhan] [nvarchar](500) NULL,
	[sdt_nguoi_nhan] [varchar](10) NULL,
	[xa] [nvarchar](max) NULL,
	[huyen] [nvarchar](max) NULL,
	[thanh_pho] [nvarchar](max) NULL,
	[trangthai] [int] NULL,
 CONSTRAINT [PK_addresss] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_customer] [uniqueidentifier] NULL,
	[id_employee] [uniqueidentifier] NULL,
	[id_pay] [bigint] NULL,
	[code] [nvarchar](max) NULL,
	[confirmation_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
	[received_date] [datetime] NULL,
	[completion_date] [datetime] NULL,
	[customer_name] [nvarchar](50) NULL,
	[phone] [nvarchar](11) NULL,
	[address] [nvarchar](255) NULL,
	[money_ship] [float] NULL,
	[total_money] [decimal](20, 3) NULL,
	[reduction_amount] [decimal](20, 3) NULL,
	[deposit] [decimal](20, 3) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[order_type] [int] NULL,
	[status_pay] [int] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_product_detail] [bigint] NULL,
	[id_bill] [bigint] NULL,
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
/****** Object:  Table [dbo].[brand]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_trademark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[id_customer] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[carts_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_cart] [bigint] NULL,
	[id_product_detail] [bigint] NULL,
	[quantity] [int] NULL,
	[price] [real] NULL,
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
/****** Object:  Table [dbo].[category]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](255) NULL,
	[birth_date] [date] NULL,
	[gender] [bit] NULL,
	[phone] [nvarchar](11) NULL,
	[address] [nvarchar](255) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[wardcode] [nvarchar](20) NULL,
	[districtcode] [int] NULL,
	[fulladdress] [nvarchar](255) NULL,
	[thanh_pho] [varchar](255) NULL,
	[new_huyen] [varchar](255) NULL,
	[xa] [varchar](255) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [uniqueidentifier] NOT NULL,
	[id_roles] [bigint] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](255) NULL,
	[gender] [bit] NULL,
	[birth_date] [date] NULL,
	[address] [nvarchar](255) NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nchar](25) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[actived] [bit] NULL,
	[cccd] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[password] [nvarchar](200) NULL,
	[wardcode] [nvarchar](20) NULL,
	[districtcode] [int] NULL,
	[fulladdress] [nvarchar](255) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluate]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluate](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_product_detail] [bigint] NULL,
	[id_customer] [uniqueidentifier] NULL,
	[description] [nvarchar](max) NULL,
	[start_time] [datetime] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[star] [int] NULL,
	[id_bill] [int] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_product_detail] [bigint] NULL,
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
/****** Object:  Table [dbo].[image_product]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_product] [bigint] NULL,
	[image] [nvarchar](max) NULL,
	[discription] [nvarchar](max) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_image_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origin]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origin](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_origin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pattern]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pattern](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_Pattern_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payment_method] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[pay_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_bill] [bigint] NULL,
	[id_pay] [bigint] NULL,
	[total_money] [decimal](20, 3) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_pay_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[id_style] [bigint] NULL,
	[id_material] [bigint] NULL,
	[id_color] [bigint] NULL,
	[id__category] [bigint] NULL,
	[id_origin] [bigint] NULL,
	[id_brand] [bigint] NULL,
	[id_category] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[price] [decimal](20, 3) NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](max) NULL,
	[id_pattern] [bigint] NULL,
	[id_size] [bigint] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
	[id_product] [bigint] NULL,
 CONSTRAINT [PK_product_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](250) NULL,
	[value] [decimal](20, 3) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[delected] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion_detail](
	[id] [uniqueidentifier] NOT NULL,
	[id_promotion] [uniqueidentifier] NULL,
	[id_product] [bigint] NULL,
	[price] [decimal](20, 3) NULL,
	[price_after_promotion] [decimal](20, 3) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[size]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_side] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[styles]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[styles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[status] [int] NULL,
	[deleted] [bit] NULL,
 CONSTRAINT [PK_styles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vertify_email]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vertify_email](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[request_at] [datetime] NULL,
	[email] [nvarchar](255) NULL,
 CONSTRAINT [PK_vertify_email] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[quantily] [int] NULL,
	[discount] [float] NULL,
	[status] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[types] [bit] NULL,
	[deleted] [bit] NULL,
	[max_discount] [float] NULL,
	[min_order] [float] NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_detail]    Script Date: 1/4/2024 10:01:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher_detail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_bill] [bigint] NULL,
	[id_voucher] [bigint] NULL,
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
INSERT [dbo].[account] ([id], [email], [status], [id_customer], [created_at], [updated_at], [deleted], [password], [image], [actived]) VALUES (N'a9db481b-485c-42b5-a69a-d9405ecc0643', N'ngaltph26840@fpt.edu.vn', 1, N'64424e32-2f6f-4808-b7f9-ed2da09842c0', NULL, NULL, 0, N'$2a$10$QcRQn7ZQENUfZR5JvDZD5uygOym1OaFSGZepLGxRsP.mVGD8ajrl2', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (6, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD01', CAST(N'2023-12-27T18:31:52.387' AS DateTime), NULL, NULL, CAST(N'2023-12-27T18:31:52.387' AS DateTime), N'Duy', N'0123456789', NULL, 0, CAST(300000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), CAST(250000.000 AS Decimal(20, 3)), N'', 5, CAST(N'2023-12-27T18:31:51.983' AS DateTime), CAST(N'2023-12-27T18:33:32.357' AS DateTime), 0, 0, 1)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (7, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD02', CAST(N'2023-12-27T18:49:34.230' AS DateTime), NULL, NULL, NULL, N'Ngọc', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Phước Quang, Huyện Tuy Phước ,Bình Định', 53998, CAST(1010000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), CAST(963998.000 AS Decimal(20, 3)), N'', 2, CAST(N'2023-12-27T18:49:34.037' AS DateTime), CAST(N'2023-12-27T18:49:34.233' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (8, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD03', CAST(N'2023-12-27T18:53:45.813' AS DateTime), NULL, NULL, NULL, N'Hà', N'0123456789', N'Ngõ 66 HTM, Xã Thọ Lộc, Huyện Thọ Xuân ,Thanh Hóa', 71504, CAST(2100000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(2171504.000 AS Decimal(20, 3)), N'', 6, CAST(N'2023-12-27T18:53:45.650' AS DateTime), CAST(N'2023-12-27T18:58:58.990' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (9, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD04', CAST(N'2023-12-27T18:53:53.157' AS DateTime), NULL, NULL, NULL, N'Hà', N'0123456789', N'Ngõ 66 HTM, Xã Thọ Lộc, Huyện Thọ Xuân ,Thanh Hóa', 71504, CAST(2100000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(2171504.000 AS Decimal(20, 3)), N'', 2, CAST(N'2023-12-27T18:53:53.117' AS DateTime), CAST(N'2023-12-27T18:53:53.157' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (10, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD05', CAST(N'2023-12-27T18:56:26.193' AS DateTime), NULL, NULL, NULL, N'Hà', N'0123456789', N'Ngõ 66 HTM, Xã Thành Sơn, Huyện Mai Châu ,Hòa Bình', 94007, CAST(266093908.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), CAST(2754007.000 AS Decimal(20, 3)), N'', 4, CAST(N'2023-12-27T18:56:26.117' AS DateTime), CAST(N'2023-12-27T18:58:42.000' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (11, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD06', CAST(N'2023-12-27T18:57:52.593' AS DateTime), NULL, NULL, NULL, N'Thịnh', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Hoàn Sơn, Huyện Tiên Du ,Bắc Ninh', 34001, CAST(400000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(434001.000 AS Decimal(20, 3)), N'ship trong giờ hành chính', 3, CAST(N'2023-12-27T18:57:52.537' AS DateTime), CAST(N'2023-12-27T18:58:26.303' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (12, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD07', CAST(N'2023-12-27T19:02:05.110' AS DateTime), NULL, NULL, NULL, N'Thịnh', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Phước Hậu, Huyện Ninh Phước ,Ninh Thuận', 48998, CAST(6000000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6048998.000 AS Decimal(20, 3)), N'ship trong giờ hành chính', 2, CAST(N'2023-12-27T19:02:04.860' AS DateTime), CAST(N'2023-12-27T19:02:05.117' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (13, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD08', CAST(N'2023-12-27T21:13:06.203' AS DateTime), NULL, NULL, NULL, N'ghghh', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Đông Cứu, Huyện Gia Bình ,Bắc Ninh', 41501, CAST(550000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(591501.000 AS Decimal(20, 3)), N'', 2, CAST(N'2023-12-27T21:13:06.133' AS DateTime), CAST(N'2023-12-27T21:13:06.207' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (14, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD09', CAST(N'2023-12-27T21:17:20.700' AS DateTime), NULL, NULL, NULL, N'Nga', N'0123456789', N'fd, Xã Vạn Ninh, Huyện Gia Bình ,Bắc Ninh', 41501, CAST(750000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), CAST(741501.000 AS Decimal(20, 3)), N'', 2, CAST(N'2023-12-27T21:17:20.667' AS DateTime), CAST(N'2023-12-27T21:17:20.730' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (15, N'a18fa081-a3a4-4056-a8b9-c01ca7fea306', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD010', CAST(N'2023-12-27T21:20:08.027' AS DateTime), NULL, NULL, NULL, N'          ngalt', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Minh Quán, Huyện Trấn Yên ,Yên Bái', 36501, CAST(450000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), CAST(436501.000 AS Decimal(20, 3)), N'', 4, CAST(N'2023-12-27T21:20:07.977' AS DateTime), CAST(N'2023-12-27T22:03:09.633' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (16, N'61b16595-c3da-4b38-8fb8-58d5da1ce148', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD011', CAST(N'2023-12-31T09:43:08.510' AS DateTime), NULL, NULL, CAST(N'2023-12-31T09:43:08.510' AS DateTime), N'HaVM', N'0335188503', NULL, 0, CAST(150000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(150000.000 AS Decimal(20, 3)), N'', 5, CAST(N'2023-12-31T09:43:08.307' AS DateTime), CAST(N'2023-12-31T09:43:08.510' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (17, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD012', CAST(N'2023-12-31T09:44:01.163' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 1, CAST(N'2023-12-31T09:44:01.180' AS DateTime), CAST(N'2023-12-31T09:44:01.180' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (18, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD013', CAST(N'2023-12-31T09:44:03.247' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 1, CAST(N'2023-12-31T09:44:03.257' AS DateTime), CAST(N'2023-12-31T09:44:03.257' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (19, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD014', CAST(N'2023-12-31T09:44:05.183' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Phước Quang, Huyện Tuy Phước ,Bình Định', 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 2, CAST(N'2023-12-31T09:44:05.190' AS DateTime), CAST(N'2024-01-02T01:16:03.480' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (20, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD015', CAST(N'2023-12-31T09:44:06.857' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', N'Ngõ 99 Cầu Diễn', 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 1, CAST(N'2023-12-31T09:44:06.863' AS DateTime), CAST(N'2024-01-02T00:53:22.737' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (21, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD016', CAST(N'2023-12-31T09:44:07.030' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 1, CAST(N'2023-12-31T09:44:07.047' AS DateTime), CAST(N'2023-12-31T09:44:07.047' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (22, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD017', CAST(N'2023-12-31T09:44:07.223' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 5, CAST(N'2023-12-31T09:44:07.230' AS DateTime), CAST(N'2024-01-01T21:27:59.777' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (23, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD018', CAST(N'2023-12-31T09:44:10.730' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(5100000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 1, CAST(N'2023-12-31T09:44:10.820' AS DateTime), CAST(N'2024-01-02T01:07:37.240' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (24, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD019', CAST(N'2023-12-31T09:44:10.903' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', N'', 0, CAST(9300000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 2, CAST(N'2023-12-31T09:44:10.963' AS DateTime), CAST(N'2024-01-02T01:26:00.547' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (25, N'412bfa5b-e636-4138-9144-9a24e712b46b', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD020', CAST(N'2023-12-31T09:44:11.050' AS DateTime), NULL, NULL, NULL, N'Nga', N'0335188503', NULL, 0, CAST(4500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), NULL, 6, CAST(N'2023-12-31T09:44:19.067' AS DateTime), CAST(N'2023-12-31T19:45:13.033' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (26, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD021', CAST(N'2023-12-31T09:49:41.910' AS DateTime), NULL, NULL, CAST(N'2023-12-31T09:49:41.910' AS DateTime), N'', N'', NULL, 0, CAST(6000000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6000000.000 AS Decimal(20, 3)), N'', 5, CAST(N'2023-12-31T09:49:09.133' AS DateTime), CAST(N'2023-12-31T09:49:41.910' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (27, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD022', CAST(N'2023-12-31T09:50:07.753' AS DateTime), NULL, NULL, CAST(N'2023-12-31T09:50:07.753' AS DateTime), N'', N'', NULL, 0, CAST(6000000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6000000.000 AS Decimal(20, 3)), N'', 5, CAST(N'2023-12-31T09:49:35.547' AS DateTime), CAST(N'2023-12-31T09:50:07.753' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (28, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD023', CAST(N'2023-12-31T09:50:08.990' AS DateTime), NULL, NULL, CAST(N'2023-12-31T09:50:08.990' AS DateTime), N'', N'', NULL, 0, CAST(6000000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6000000.000 AS Decimal(20, 3)), N'', 5, CAST(N'2023-12-31T09:49:36.763' AS DateTime), CAST(N'2023-12-31T09:50:08.990' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (29, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD024', CAST(N'2023-12-31T19:47:59.570' AS DateTime), NULL, NULL, NULL, N'Minh Anh', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Hương Mai, Huyện Việt Yên ,Bắc Giang', 34001, CAST(300000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), CAST(284001.000 AS Decimal(20, 3)), N'', 2, CAST(N'2023-12-31T19:47:59.507' AS DateTime), CAST(N'2023-12-31T19:47:59.620' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (30, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD025', CAST(N'2023-12-31T19:50:15.757' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Hiệp, Huyện Phù Mỹ ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 2, CAST(N'2023-12-31T19:50:15.720' AS DateTime), CAST(N'2023-12-31T19:50:15.757' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (31, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD026', CAST(N'2023-12-31T19:50:18.230' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Hiệp, Huyện Phù Mỹ ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 2, CAST(N'2023-12-31T19:50:18.187' AS DateTime), CAST(N'2023-12-31T19:50:18.230' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (32, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD027', CAST(N'2023-12-31T19:50:19.113' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Hiệp, Huyện Phù Mỹ ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 6, CAST(N'2023-12-31T19:50:19.100' AS DateTime), CAST(N'2024-01-02T00:45:16.540' AS DateTime), 0, 1, 1)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (33, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD028', CAST(N'2023-12-31T19:50:19.310' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Hiệp, Huyện Phù Mỹ ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 2, CAST(N'2023-12-31T19:50:19.290' AS DateTime), CAST(N'2023-12-31T19:50:19.310' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (34, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD029', CAST(N'2023-12-31T19:50:49.423' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Châu, Huyện An Lão ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 2, CAST(N'2023-12-31T19:50:49.417' AS DateTime), CAST(N'2023-12-31T19:50:49.423' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (35, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 2, N'HD030', CAST(N'2023-12-31T19:50:52.053' AS DateTime), NULL, NULL, NULL, N'TrangDT', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Mỹ Châu, Huyện An Lão ,Bình Định', 53999, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(503999.000 AS Decimal(20, 3)), N'ok ', 6, CAST(N'2023-12-31T19:50:52.033' AS DateTime), CAST(N'2024-01-01T22:48:26.073' AS DateTime), 0, 1, 1)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (36, N'42fa606d-6335-4104-ae9e-0cd4ebc36d9c', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD031', CAST(N'2024-01-01T00:11:23.380' AS DateTime), NULL, NULL, CAST(N'2024-01-01T00:11:23.380' AS DateTime), N'Xuân', N'0335188503', NULL, 0, CAST(800000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(800000.000 AS Decimal(20, 3)), N'', 6, CAST(N'2024-01-01T00:11:23.153' AS DateTime), CAST(N'2024-01-02T02:02:49.107' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (37, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD032', CAST(N'2024-01-01T21:14:31.410' AS DateTime), NULL, NULL, CAST(N'2024-01-01T21:14:31.410' AS DateTime), N'', N'', NULL, 0, CAST(450000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), N'', 5, CAST(N'2024-01-01T21:14:31.263' AS DateTime), CAST(N'2024-01-01T21:14:31.410' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (38, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 3, N'HD033', CAST(N'2024-01-01T21:43:50.297' AS DateTime), NULL, NULL, CAST(N'2024-01-01T21:43:50.297' AS DateTime), N'Nga', N'0123456789', NULL, 0, CAST(300000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), N'', 5, CAST(N'2024-01-01T21:43:50.240' AS DateTime), CAST(N'2024-01-01T21:43:50.300' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (39, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 3, N'HD034', CAST(N'2024-01-02T00:20:43.567' AS DateTime), NULL, NULL, CAST(N'2024-01-02T00:20:43.567' AS DateTime), N'HaVM', N'0123456789', NULL, 0, CAST(1500000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), CAST(1400000.000 AS Decimal(20, 3)), N'', 6, CAST(N'2024-01-02T00:20:43.437' AS DateTime), CAST(N'2024-01-02T02:01:55.580' AS DateTime), 0, 0, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (40, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD035', CAST(N'2024-01-02T01:12:43.637' AS DateTime), NULL, NULL, NULL, N'Minh Anh', N'0123456789', N'Ngõ 99 Cầu Diễn, Xã Hải Phúc, Huyện Hải Hậu ,Nam Định', 46501, CAST(600000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T01:12:43.590' AS DateTime), CAST(N'2024-01-02T01:12:43.643' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (41, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD036', CAST(N'2024-01-02T01:18:10.037' AS DateTime), NULL, NULL, NULL, N'Duy', N'0123456789', N'Ngõ 36,phố Lưu Hữu Phước, Phường Mỹ Đình 1, Quận Nam Từ Liêm ,Hà Nội', 21000, CAST(360000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T01:18:10.007' AS DateTime), CAST(N'2024-01-02T01:18:10.037' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (42, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD037', CAST(N'2024-01-02T12:07:32.430' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:32.323' AS DateTime), CAST(N'2024-01-02T12:07:32.430' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (43, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD038', CAST(N'2024-01-02T12:07:34.653' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:34.607' AS DateTime), CAST(N'2024-01-02T12:07:34.653' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (44, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD039', CAST(N'2024-01-02T12:07:34.890' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:34.830' AS DateTime), CAST(N'2024-01-02T12:07:34.890' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (45, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD040', CAST(N'2024-01-02T12:07:38.627' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:38.600' AS DateTime), CAST(N'2024-01-02T12:07:38.643' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (46, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD041', CAST(N'2024-01-02T12:07:40.487' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:40.423' AS DateTime), CAST(N'2024-01-02T12:07:40.487' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (47, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD042', CAST(N'2024-01-02T12:07:42.097' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:42.047' AS DateTime), CAST(N'2024-01-02T12:07:42.107' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (48, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD043', CAST(N'2024-01-02T12:07:42.233' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:42.190' AS DateTime), CAST(N'2024-01-02T12:07:42.233' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (49, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD044', CAST(N'2024-01-02T12:07:42.423' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:42.380' AS DateTime), CAST(N'2024-01-02T12:07:42.423' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (50, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD045', CAST(N'2024-01-02T12:07:57.137' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:57.107' AS DateTime), CAST(N'2024-01-02T12:07:57.137' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (51, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD046', CAST(N'2024-01-02T12:07:58.570' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:58.530' AS DateTime), CAST(N'2024-01-02T12:07:58.580' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (52, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD047', CAST(N'2024-01-02T12:07:59.667' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(6231503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:07:59.623' AS DateTime), CAST(N'2024-01-02T12:07:59.667' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (53, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD048', CAST(N'2024-01-02T12:08:15.467' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Hán Đà, Huyện Yên Bình ,Yên Bái', 61503, CAST(6170000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), CAST(6131503.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:08:15.450' AS DateTime), CAST(N'2024-01-02T12:08:15.500' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (54, N'85af6df8-c656-4cc9-a556-9058be1e476d', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 2, N'HD049', CAST(N'2024-01-02T12:45:30.400' AS DateTime), NULL, NULL, NULL, N'Ngalt75', N'0335188503', N'Ngõ 99 Cầu Diễn, Xã Phước Hà, Huyện Thuận Nam ,Ninh Thuận', 83995, CAST(6170000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), CAST(6153995.000 AS Decimal(20, 3)), N'', 2, CAST(N'2024-01-02T12:45:30.300' AS DateTime), CAST(N'2024-01-02T12:45:30.460' AS DateTime), 0, 1, 0)
INSERT [dbo].[bill] ([id], [id_customer], [id_employee], [id_pay], [code], [confirmation_date], [delivery_date], [received_date], [completion_date], [customer_name], [phone], [address], [money_ship], [total_money], [reduction_amount], [deposit], [note], [status], [created_at], [updated_at], [deleted], [order_type], [status_pay]) VALUES (55, N'd60df5f1-25ac-411e-be38-4e88de1c2e36', N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 3, NULL, CAST(N'2024-01-03T01:03:47.867' AS DateTime), NULL, NULL, CAST(N'2024-01-03T01:03:47.867' AS DateTime), N'', N'', NULL, 0, CAST(5500000.000 AS Decimal(20, 3)), CAST(0.000 AS Decimal(20, 3)), CAST(5500000.000 AS Decimal(20, 3)), N'', 6, CAST(N'2024-01-03T01:03:47.750' AS DateTime), CAST(N'2024-01-03T01:03:47.867' AS DateTime), 0, 0, 1)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[bill_detail] ON 

INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (6, 35, 6, CAST(250000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-27T18:31:52.220' AS DateTime), CAST(N'2023-12-27T18:31:52.420' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (7, 35, 7, CAST(300000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-27T18:49:34.153' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (8, 36, 7, CAST(500000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-27T18:49:34.177' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (9, 38, 7, CAST(210000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-27T18:49:34.193' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (10, 35, 8, CAST(1500000.000 AS Decimal(20, 3)), 10, 1, CAST(N'2023-12-27T18:53:45.797' AS DateTime), CAST(N'2023-12-27T18:53:45.797' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (11, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-27T18:53:45.813' AS DateTime), CAST(N'2023-12-27T18:53:45.813' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (12, 35, 9, CAST(1500000.000 AS Decimal(20, 3)), 10, 1, CAST(N'2023-12-27T18:53:53.140' AS DateTime), CAST(N'2023-12-27T18:53:53.140' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (13, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-27T18:53:53.157' AS DateTime), CAST(N'2023-12-27T18:53:53.157' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (14, 39, 10, CAST(1214347.826 AS Decimal(20, 3)), 7, 1, CAST(N'2023-12-27T18:56:26.170' AS DateTime), CAST(N'2023-12-27T18:56:26.243' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (15, 36, 10, CAST(722826.087 AS Decimal(20, 3)), 3, 1, CAST(N'2023-12-27T18:56:26.187' AS DateTime), CAST(N'2023-12-27T18:56:26.243' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (16, 35, 10, CAST(722826.087 AS Decimal(20, 3)), 5, 1, CAST(N'2023-12-27T18:56:26.203' AS DateTime), CAST(N'2023-12-27T18:56:26.243' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (17, 36, 11, CAST(250000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-27T18:57:52.587' AS DateTime), CAST(N'2023-12-27T18:57:52.587' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (18, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-27T18:57:52.603' AS DateTime), CAST(N'2023-12-27T18:57:52.603' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (19, 47, 12, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-27T19:02:04.983' AS DateTime), CAST(N'2023-12-27T19:02:04.983' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (20, 46, 12, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-27T19:02:05.053' AS DateTime), CAST(N'2023-12-27T19:02:05.053' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (21, 49, 12, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-27T19:02:05.100' AS DateTime), CAST(N'2023-12-27T19:02:05.100' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (22, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-27T19:02:05.110' AS DateTime), CAST(N'2023-12-27T19:02:05.110' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (23, 35, 13, CAST(300000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-27T21:13:06.193' AS DateTime), CAST(N'2023-12-27T21:13:06.193' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (24, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-27T21:13:06.207' AS DateTime), CAST(N'2023-12-27T21:13:06.207' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (25, 36, 14, CAST(700000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2023-12-27T21:17:20.703' AS DateTime), CAST(N'2023-12-27T21:17:20.730' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (26, 35, 15, CAST(400000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2023-12-27T21:20:08.040' AS DateTime), CAST(N'2023-12-27T21:20:08.073' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (27, 48, 16, CAST(150000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:43:08.480' AS DateTime), CAST(N'2023-12-31T09:43:08.480' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (28, 43, 17, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:01.190' AS DateTime), CAST(N'2023-12-31T09:44:01.190' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (29, 45, 17, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:01.207' AS DateTime), CAST(N'2023-12-31T09:44:01.207' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (30, 43, 18, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:03.283' AS DateTime), CAST(N'2023-12-31T09:44:03.283' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (31, 45, 18, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:03.283' AS DateTime), CAST(N'2023-12-31T09:44:03.283' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (32, 43, 19, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:05.200' AS DateTime), CAST(N'2023-12-31T09:44:05.200' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (33, 45, 19, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:05.213' AS DateTime), CAST(N'2023-12-31T09:44:05.213' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (34, 43, 20, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:06.887' AS DateTime), CAST(N'2023-12-31T09:44:06.887' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (35, 45, 20, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:06.887' AS DateTime), CAST(N'2023-12-31T09:44:06.887' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (36, 43, 21, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:07.060' AS DateTime), CAST(N'2023-12-31T09:44:07.060' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (37, 45, 21, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:07.080' AS DateTime), CAST(N'2023-12-31T09:44:07.080' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (38, 43, 22, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:07.247' AS DateTime), CAST(N'2023-12-31T09:44:07.247' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (39, 45, 22, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:07.260' AS DateTime), CAST(N'2023-12-31T09:44:07.260' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (40, 43, 23, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:10.903' AS DateTime), CAST(N'2023-12-31T09:44:10.903' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (41, 45, 23, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:10.917' AS DateTime), CAST(N'2023-12-31T09:44:10.917' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (42, 43, 24, CAST(7500000.000 AS Decimal(20, 3)), 5, 1, CAST(N'2023-12-31T09:44:11.020' AS DateTime), CAST(N'2023-12-31T09:44:11.020' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (43, 45, 24, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:11.037' AS DateTime), CAST(N'2023-12-31T09:44:11.037' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (44, 43, 25, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:44:19.110' AS DateTime), CAST(N'2023-12-31T09:44:19.110' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (45, 45, 25, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:44:19.133' AS DateTime), CAST(N'2023-12-31T09:44:19.133' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (46, 43, 26, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:49:09.180' AS DateTime), CAST(N'2023-12-31T09:49:09.180' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (47, 45, 26, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:49:09.197' AS DateTime), CAST(N'2023-12-31T09:49:09.197' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (48, 43, 27, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:49:35.620' AS DateTime), CAST(N'2023-12-31T09:49:35.620' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (49, 45, 27, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:49:35.637' AS DateTime), CAST(N'2023-12-31T09:49:35.637' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (50, 43, 28, CAST(3000000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T09:49:36.857' AS DateTime), CAST(N'2023-12-31T09:49:36.857' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (51, 45, 28, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:49:36.903' AS DateTime), CAST(N'2023-12-31T09:49:36.903' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (52, 46, 26, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:49:41.873' AS DateTime), CAST(N'2023-12-31T09:49:41.873' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (53, 46, 27, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:50:07.723' AS DateTime), CAST(N'2023-12-31T09:50:07.723' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (54, 46, 28, CAST(1500000.000 AS Decimal(20, 3)), 1, 1, CAST(N'2023-12-31T09:50:08.967' AS DateTime), CAST(N'2023-12-31T09:50:08.967' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (55, 35, 29, CAST(250000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2023-12-31T19:47:59.587' AS DateTime), CAST(N'2023-12-31T19:47:59.620' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (56, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:15.757' AS DateTime), CAST(N'2023-12-31T19:50:15.757' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (57, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:18.230' AS DateTime), CAST(N'2023-12-31T19:50:18.230' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (58, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:19.113' AS DateTime), CAST(N'2023-12-31T19:50:19.113' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (59, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:19.310' AS DateTime), CAST(N'2023-12-31T19:50:19.310' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (60, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:49.423' AS DateTime), CAST(N'2023-12-31T19:50:49.423' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (61, NULL, NULL, NULL, 0, 1, CAST(N'2023-12-31T19:50:52.053' AS DateTime), CAST(N'2023-12-31T19:50:52.053' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (62, 35, 36, CAST(300000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-01T00:11:23.237' AS DateTime), CAST(N'2024-01-01T00:11:23.237' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (63, 36, 36, CAST(500000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-01T00:11:23.360' AS DateTime), CAST(N'2024-01-01T00:11:23.360' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (64, 35, 37, CAST(450000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-01T21:14:31.367' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (65, 35, 24, CAST(300000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-01T21:28:54.863' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (66, 35, 38, CAST(300000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-01T21:43:50.277' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (67, 35, 39, CAST(1500000.000 AS Decimal(20, 3)), 10, 1, CAST(N'2024-01-02T00:20:43.497' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (68, 37, 23, CAST(600000.000 AS Decimal(20, 3)), 5, 1, CAST(N'2024-01-02T01:07:37.273' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (69, 37, 40, CAST(600000.000 AS Decimal(20, 3)), 5, 1, CAST(N'2024-01-02T01:12:43.630' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (70, 37, 41, CAST(360000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T01:18:10.033' AS DateTime), NULL, 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (71, 42, 42, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:32.400' AS DateTime), CAST(N'2024-01-02T12:07:32.400' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (72, 41, 42, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:32.417' AS DateTime), CAST(N'2024-01-02T12:07:32.417' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (73, 49, 42, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:32.417' AS DateTime), CAST(N'2024-01-02T12:07:32.417' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (74, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:32.430' AS DateTime), CAST(N'2024-01-02T12:07:32.430' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (75, 42, 43, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:34.623' AS DateTime), CAST(N'2024-01-02T12:07:34.623' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (76, 41, 43, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:34.633' AS DateTime), CAST(N'2024-01-02T12:07:34.633' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (77, 49, 43, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:34.633' AS DateTime), CAST(N'2024-01-02T12:07:34.633' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (78, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:34.653' AS DateTime), CAST(N'2024-01-02T12:07:34.653' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (79, 42, 44, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:34.863' AS DateTime), CAST(N'2024-01-02T12:07:34.863' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (80, 41, 44, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:34.863' AS DateTime), CAST(N'2024-01-02T12:07:34.863' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (81, 49, 44, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:34.883' AS DateTime), CAST(N'2024-01-02T12:07:34.883' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (82, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:34.890' AS DateTime), CAST(N'2024-01-02T12:07:34.890' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (83, 42, 45, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:38.613' AS DateTime), CAST(N'2024-01-02T12:07:38.613' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (84, 41, 45, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:38.627' AS DateTime), CAST(N'2024-01-02T12:07:38.627' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (85, 49, 45, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:38.627' AS DateTime), CAST(N'2024-01-02T12:07:38.627' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (86, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:38.627' AS DateTime), CAST(N'2024-01-02T12:07:38.627' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (87, 42, 46, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:40.453' AS DateTime), CAST(N'2024-01-02T12:07:40.453' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (88, 41, 46, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:40.453' AS DateTime), CAST(N'2024-01-02T12:07:40.453' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (89, 49, 46, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:40.470' AS DateTime), CAST(N'2024-01-02T12:07:40.470' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (90, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:40.487' AS DateTime), CAST(N'2024-01-02T12:07:40.487' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (91, 42, 47, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.063' AS DateTime), CAST(N'2024-01-02T12:07:42.063' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (92, 41, 47, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:42.080' AS DateTime), CAST(N'2024-01-02T12:07:42.080' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (93, 49, 47, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.097' AS DateTime), CAST(N'2024-01-02T12:07:42.097' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (94, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:42.107' AS DateTime), CAST(N'2024-01-02T12:07:42.107' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (95, 42, 48, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.200' AS DateTime), CAST(N'2024-01-02T12:07:42.200' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (96, 41, 48, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:42.217' AS DateTime), CAST(N'2024-01-02T12:07:42.217' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (97, 49, 48, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.217' AS DateTime), CAST(N'2024-01-02T12:07:42.217' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (98, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:42.233' AS DateTime), CAST(N'2024-01-02T12:07:42.233' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (99, 42, 49, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.390' AS DateTime), CAST(N'2024-01-02T12:07:42.390' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (100, 41, 49, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:42.407' AS DateTime), CAST(N'2024-01-02T12:07:42.407' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (101, 49, 49, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:42.423' AS DateTime), CAST(N'2024-01-02T12:07:42.423' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (102, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:42.423' AS DateTime), CAST(N'2024-01-02T12:07:42.423' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (103, 42, 50, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:57.123' AS DateTime), CAST(N'2024-01-02T12:07:57.123' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (104, 41, 50, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:57.137' AS DateTime), CAST(N'2024-01-02T12:07:57.137' AS DateTime), 0)
GO
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (105, 49, 50, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:57.137' AS DateTime), CAST(N'2024-01-02T12:07:57.137' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (106, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:57.137' AS DateTime), CAST(N'2024-01-02T12:07:57.137' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (107, 42, 51, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:58.547' AS DateTime), CAST(N'2024-01-02T12:07:58.547' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (108, 41, 51, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:58.567' AS DateTime), CAST(N'2024-01-02T12:07:58.567' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (109, 49, 51, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:58.570' AS DateTime), CAST(N'2024-01-02T12:07:58.570' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (110, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:58.570' AS DateTime), CAST(N'2024-01-02T12:07:58.570' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (111, 42, 52, CAST(750000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:59.637' AS DateTime), CAST(N'2024-01-02T12:07:59.637' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (112, 41, 52, CAST(380000.000 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:07:59.653' AS DateTime), CAST(N'2024-01-02T12:07:59.653' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (113, 49, 52, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:07:59.653' AS DateTime), CAST(N'2024-01-02T12:07:59.653' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (114, NULL, NULL, NULL, 0, 1, CAST(N'2024-01-02T12:07:59.667' AS DateTime), CAST(N'2024-01-02T12:07:59.667' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (115, 42, 53, CAST(737844.408 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:08:15.457' AS DateTime), CAST(N'2024-01-02T12:08:15.500' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (116, 41, 53, CAST(373841.167 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:08:15.467' AS DateTime), CAST(N'2024-01-02T12:08:15.500' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (117, 49, 53, CAST(4427066.451 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:08:15.467' AS DateTime), CAST(N'2024-01-02T12:08:15.500' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (118, 54, 53, CAST(531247.974 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:08:15.483' AS DateTime), CAST(N'2024-01-02T12:08:15.500' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (119, 42, 54, CAST(737844.408 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:45:30.357' AS DateTime), CAST(N'2024-01-02T12:45:30.460' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (120, 41, 54, CAST(373841.167 AS Decimal(20, 3)), 2, 1, CAST(N'2024-01-02T12:45:30.377' AS DateTime), CAST(N'2024-01-02T12:45:30.460' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (121, 49, 54, CAST(4427066.451 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:45:30.393' AS DateTime), CAST(N'2024-01-02T12:45:30.460' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (122, 54, 54, CAST(531247.974 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-02T12:45:30.403' AS DateTime), CAST(N'2024-01-02T12:45:30.460' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (123, 36, 55, CAST(1000000.000 AS Decimal(20, 3)), 4, 1, CAST(N'2024-01-03T01:03:47.783' AS DateTime), CAST(N'2024-01-03T01:03:47.783' AS DateTime), 0)
INSERT [dbo].[bill_detail] ([id], [id_product_detail], [id_bill], [total_money], [quantity], [status], [created_at], [updated_at], [deleted]) VALUES (124, 44, 55, CAST(4500000.000 AS Decimal(20, 3)), 3, 1, CAST(N'2024-01-03T01:03:47.850' AS DateTime), CAST(N'2024-01-03T01:03:47.850' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[bill_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (1, N'TH1', N'Chanel', CAST(N'2023-12-19T23:52:29.990' AS DateTime), CAST(N'2023-12-19T23:52:29.990' AS DateTime), 1, 0)
INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (2, N'TH2', N'Dior', CAST(N'2023-12-19T23:52:35.947' AS DateTime), CAST(N'2023-12-19T23:52:35.947' AS DateTime), 1, 0)
INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (3, N'TH3', N'Hermes', CAST(N'2023-12-19T23:52:46.197' AS DateTime), CAST(N'2023-12-19T23:52:46.197' AS DateTime), 1, 0)
INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (4, N'TH4', N'Gucci', CAST(N'2023-12-19T23:52:52.530' AS DateTime), CAST(N'2023-12-19T23:52:52.530' AS DateTime), 1, 0)
INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (5, N'TH5', N'Balenciaga', CAST(N'2023-12-19T23:53:09.237' AS DateTime), CAST(N'2023-12-19T23:53:09.237' AS DateTime), 1, 0)
INSERT [dbo].[brand] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (6, N'TH6', N'th11', CAST(N'2023-12-31T18:07:53.987' AS DateTime), CAST(N'2023-12-31T18:07:58.053' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [code], [id_customer], [status], [created_at], [updated_at], [deleted]) VALUES (1, NULL, N'64424e32-2f6f-4808-b7f9-ed2da09842c0', 1, CAST(N'2023-12-20T21:02:15.810' AS DateTime), CAST(N'2023-12-20T21:02:15.810' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[carts_detail] ON 

INSERT [dbo].[carts_detail] ([id], [id_cart], [id_product_detail], [quantity], [price], [status], [created_at], [updated_at], [deleted]) VALUES (1, 1, 121, 4, NULL, 1, CAST(N'2024-01-04T21:27:03.997' AS DateTime), CAST(N'2024-01-04T21:38:46.530' AS DateTime), 0)
INSERT [dbo].[carts_detail] ([id], [id_cart], [id_product_detail], [quantity], [price], [status], [created_at], [updated_at], [deleted]) VALUES (2, 1, 51, 2, NULL, 1, CAST(N'2024-01-04T21:28:09.543' AS DateTime), CAST(N'2024-01-04T21:28:09.543' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[carts_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (1, N'DM1', N'Khăn che nắng', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-08T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[category] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (2, N'DM2', N'Khăn choàng giữ ấm', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-08T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[category] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (3, N'DM3', N'Khăn choàng đi tiệc', CAST(N'2023-11-08T00:00:00.000' AS DateTime), CAST(N'2023-11-08T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[category] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (4, N'DM4', N'Khăn đi biển', CAST(N'2023-12-25T20:53:43.910' AS DateTime), CAST(N'2023-12-25T20:53:43.910' AS DateTime), 1, 0)
INSERT [dbo].[category] ([id], [code], [name], [created_at], [updated_at], [status], [deleted]) VALUES (11, N'DM5', N'Khăn thời trang', CAST(N'2023-12-31T20:24:36.647' AS DateTime), CAST(N'2023-12-31T20:24:36.647' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (1, NULL, N'cd11', CAST(N'2023-12-31T18:08:06.647' AS DateTime), CAST(N'2023-12-31T18:08:06.647' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[color] OFF
GO
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'42fa606d-6335-4104-ae9e-0cd4ebc36d9c', N'KH03', N'Xuân', CAST(N'2000-01-01' AS Date), 0, N'0335188503', NULL, 0, NULL, NULL, 0, NULL, -1, N'Xã Tân Tiến, Huyện Hưng Hà ,Thái Bình', N'Ngõ 99 C?u Di?n', N'1867', N'260328')
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'd60df5f1-25ac-411e-be38-4e88de1c2e36', NULL, N'COUNTER', CAST(N'2023-12-20' AS Date), 0, NULL, NULL, 1, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'61b16595-c3da-4b38-8fb8-58d5da1ce148', N'KH02', N'HaVM', CAST(N'2000-01-01' AS Date), 0, N'0335188503', NULL, 0, NULL, NULL, 0, NULL, -1, N'Xã Hòa Bình, Huyện Đồng Hỷ ,Thái Nguyên', N'Ngõ 99 C?u Di?n', N'1731', N'120705')
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'85af6df8-c656-4cc9-a556-9058be1e476d', N'KH04', N'Ngalt75', CAST(N'2000-11-20' AS Date), 0, N'0335188503', NULL, 0, NULL, NULL, 0, NULL, -1, N'Xã Phình Sáng, Huyện Tuần Giáo ,Điện Biên', N'Ngõ 99 C?u Di?n', N'2022', N'620410')
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'412bfa5b-e636-4138-9144-9a24e712b46b', N'KH01', N'Nga', CAST(N'2000-02-02' AS Date), 0, N'0335188503', N'Ngõ 99 Cầu Diễn', 0, NULL, NULL, 0, N'141007', 1976, N'Xã Hua Păng, Huyện Mộc Châu ,Sơn La', NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'a18fa081-a3a4-4056-a8b9-c01ca7fea306', NULL, N'          ngalt', CAST(N'2000-02-02' AS Date), 0, N'0335188503', N'Ngõ 99 Cầu Diễn', 0, NULL, NULL, 0, N'60807', 1943, N'Xã Đại Tiến, Huyện Hòa An ,Cao Bằng', NULL, NULL, NULL)
INSERT [dbo].[customer] ([id], [code], [name], [birth_date], [gender], [phone], [address], [status], [created_at], [update_at], [deleted], [wardcode], [districtcode], [fulladdress], [thanh_pho], [new_huyen], [xa]) VALUES (N'64424e32-2f6f-4808-b7f9-ed2da09842c0', NULL, N'Le Nga', CAST(N'2000-01-01' AS Date), 0, N'0335188503', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [actived], [cccd], [image], [password], [wardcode], [districtcode], [fulladdress]) VALUES (N'a41e81e2-561e-419b-a215-370963ddff1c', 2, N'NV02', N'Duy Phạm', 1, CAST(N'2000-01-01' AS Date), NULL, N'0123456789', N'duypkph22349@fpt.edu.vn  ', 1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [actived], [cccd], [image], [password], [wardcode], [districtcode], [fulladdress]) VALUES (N'fa837c51-dd4b-4020-ba77-c2c1bed90ebb', 1, NULL, N'Admin', 0, CAST(N'2000-11-20' AS Date), NULL, N'0335188503', N'ngale4089@gmail.com      ', 1, CAST(N'2023-12-19T23:32:45.157' AS DateTime), NULL, 0, 1, NULL, NULL, N'$2a$10$YIT5UiARKH43S.qMpQhaoeo1ghdRDY9dhFVgK4FqsO7mw/f4b3SwS', NULL, NULL, NULL)
INSERT [dbo].[employee] ([id], [id_roles], [code], [name], [gender], [birth_date], [address], [phone], [email], [status], [created_at], [update_at], [deleted], [actived], [cccd], [image], [password], [wardcode], [districtcode], [fulladdress]) VALUES (N'0cc1588b-9b7f-4a86-89e5-c9b579a38b6e', 4, N'NV01', N'Nga Le', 0, CAST(N'2000-04-20' AS Date), NULL, N'0335188503', N'nga@gmail.com            ', 1, CAST(N'2023-12-27T00:00:00.000' AS DateTime), NULL, 0, 0, NULL, NULL, N'$2a$10$SvCXPkvoGdpjUuFnp8/QOuoDAHyTl9ye.X38wGYzGCE0rCYECo/9S', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (134, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703512967/DUANTOTNGHIEP/a7ca524e-5246-4b0a-8a7d-99341080e51b.jpg', NULL, 1, CAST(N'2023-12-25T21:02:49.870' AS DateTime), CAST(N'2023-12-25T21:02:49.870' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (135, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703512967/DUANTOTNGHIEP/c380462d-c2ed-457e-af1c-6010ca24e284.jpg', NULL, 1, CAST(N'2023-12-25T21:02:50.070' AS DateTime), CAST(N'2023-12-25T21:02:50.070' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (136, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703512967/DUANTOTNGHIEP/4f262eb6-3c9c-43c2-b06c-47a24ad44067.jpg', NULL, 1, CAST(N'2023-12-25T21:02:50.110' AS DateTime), CAST(N'2023-12-25T21:02:50.110' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (137, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703512967/DUANTOTNGHIEP/c0a7ea8d-e0b6-443f-8977-ad10c846aa10.jpg', NULL, 1, CAST(N'2023-12-25T21:02:50.150' AS DateTime), CAST(N'2023-12-25T21:02:50.150' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (138, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703512968/DUANTOTNGHIEP/8d4afc9f-1d22-4239-8cba-78d4ef191843.jpg', NULL, 1, CAST(N'2023-12-25T21:02:50.597' AS DateTime), CAST(N'2023-12-25T21:02:50.597' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (139, 36, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513227/DUANTOTNGHIEP/4b40033e-a373-4340-88b4-d815f60c1176.jpg', NULL, 1, CAST(N'2023-12-25T21:07:09.860' AS DateTime), CAST(N'2023-12-25T21:07:09.860' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (140, 36, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513227/DUANTOTNGHIEP/a5420421-249f-4ae6-8b7e-d21f8e93c523.jpg', NULL, 1, CAST(N'2023-12-25T21:07:09.990' AS DateTime), CAST(N'2023-12-25T21:07:09.990' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (141, 36, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513227/DUANTOTNGHIEP/6c575e8d-ab1b-4b2f-bf55-29a038401ee7.jpg', NULL, 1, CAST(N'2023-12-25T21:07:10.013' AS DateTime), CAST(N'2023-12-25T21:07:10.013' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (142, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513334/DUANTOTNGHIEP/8ee331d4-9679-491e-8c71-e181cbbb3278.jpg', NULL, 1, CAST(N'2023-12-25T21:08:57.060' AS DateTime), CAST(N'2023-12-25T21:08:57.060' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (143, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513334/DUANTOTNGHIEP/c065ab76-1d71-4038-b8d4-f45a730384a9.jpg', NULL, 1, CAST(N'2023-12-25T21:08:57.060' AS DateTime), CAST(N'2023-12-25T21:08:57.060' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (144, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513334/DUANTOTNGHIEP/fd7479a2-25e0-4e75-9161-8cb532bb487f.jpg', NULL, 1, CAST(N'2023-12-25T21:08:57.110' AS DateTime), CAST(N'2023-12-25T21:08:57.110' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (145, 38, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513480/DUANTOTNGHIEP/0a36edd3-f6f5-480e-a922-9264e31f0c87.jpg', NULL, 1, CAST(N'2023-12-25T21:11:22.940' AS DateTime), CAST(N'2023-12-25T21:11:22.940' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (146, 38, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513480/DUANTOTNGHIEP/556d932c-3d9a-4cd9-96ed-c523944c8d44.jpg', NULL, 1, CAST(N'2023-12-25T21:11:23.247' AS DateTime), CAST(N'2023-12-25T21:11:23.247' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (147, 38, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513480/DUANTOTNGHIEP/9d03b2fc-ce94-498f-9f4c-f2cd091e7603.jpg', NULL, 1, CAST(N'2023-12-25T21:11:23.257' AS DateTime), CAST(N'2023-12-25T21:11:23.257' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (148, 89, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519797/DUANTOTNGHIEP/f2b73aaa-d4f9-4d23-92f6-8436105d6447.jpg', NULL, 1, CAST(N'2023-12-25T22:56:39.927' AS DateTime), CAST(N'2023-12-25T22:56:39.927' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (149, 89, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519797/DUANTOTNGHIEP/9c777035-5422-4913-9055-b207fd0ff184.jpg', NULL, 1, CAST(N'2023-12-25T22:56:39.980' AS DateTime), CAST(N'2023-12-25T22:56:39.980' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (150, 89, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519797/DUANTOTNGHIEP/09298d54-d085-497e-9060-b8707f7f3271.jpg', NULL, 1, CAST(N'2023-12-25T22:56:40.203' AS DateTime), CAST(N'2023-12-25T22:56:40.203' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (151, 90, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519801/DUANTOTNGHIEP/643547c9-d177-4e8c-96b6-7de2201eb4c9.jpg', NULL, 1, CAST(N'2023-12-25T22:56:43.893' AS DateTime), CAST(N'2023-12-25T22:56:43.893' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (152, 90, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519801/DUANTOTNGHIEP/676fdca0-6dbc-4d25-b7df-41d2fd564457.jpg', NULL, 1, CAST(N'2023-12-25T22:56:43.923' AS DateTime), CAST(N'2023-12-25T22:56:43.923' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (153, 90, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519801/DUANTOTNGHIEP/2e2a98f1-c0e1-4af4-ad06-7574be9588af.jpg', NULL, 1, CAST(N'2023-12-25T22:56:44.173' AS DateTime), CAST(N'2023-12-25T22:56:44.173' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (154, 88, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519842/DUANTOTNGHIEP/2c10bfb0-fa1a-4fad-8f50-f906f3bc6aec.jpg', NULL, 1, CAST(N'2023-12-25T22:57:24.737' AS DateTime), CAST(N'2023-12-25T22:57:24.737' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (155, 88, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519842/DUANTOTNGHIEP/1ccee943-5999-48c4-9174-00496c56e00e.jpg', NULL, 1, CAST(N'2023-12-25T22:57:24.773' AS DateTime), CAST(N'2023-12-25T22:57:24.773' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (156, 88, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519842/DUANTOTNGHIEP/6c60cc46-ecaf-421d-82b7-e7160712d826.jpg', NULL, 1, CAST(N'2023-12-25T22:57:25.627' AS DateTime), CAST(N'2023-12-25T22:57:25.627' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (157, 87, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519943/DUANTOTNGHIEP/288dbf09-ec34-4b8d-82ef-4819dd342d69.jpg', NULL, 1, CAST(N'2023-12-25T22:59:06.250' AS DateTime), CAST(N'2023-12-25T22:59:06.250' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (158, 87, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519943/DUANTOTNGHIEP/4364e46f-4d1c-468b-899b-d589638d5d17.jpg', NULL, 1, CAST(N'2023-12-25T22:59:06.360' AS DateTime), CAST(N'2023-12-25T22:59:06.360' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (159, 87, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519943/DUANTOTNGHIEP/f318a1bd-807f-4f3a-a70f-59e9eac8532d.jpg', NULL, 1, CAST(N'2023-12-25T22:59:06.633' AS DateTime), CAST(N'2023-12-25T22:59:06.633' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (160, 86, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519944/DUANTOTNGHIEP/14a742a9-2a6e-40ab-86e1-6889fb368652.jpg', NULL, 1, CAST(N'2023-12-25T22:59:07.493' AS DateTime), CAST(N'2023-12-25T22:59:07.493' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (161, 86, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519944/DUANTOTNGHIEP/e5839bf5-f605-490a-ab45-58ebccfa4077.jpg', NULL, 1, CAST(N'2023-12-25T22:59:07.603' AS DateTime), CAST(N'2023-12-25T22:59:07.603' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (162, 86, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519945/DUANTOTNGHIEP/19887f91-989c-43fd-8043-d669af30af50.jpg', NULL, 1, CAST(N'2023-12-25T22:59:07.863' AS DateTime), CAST(N'2023-12-25T22:59:07.863' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (163, 85, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519946/DUANTOTNGHIEP/efa9fd03-b903-4dbb-8d89-06a98d850a43.jpg', NULL, 1, CAST(N'2023-12-25T22:59:09.630' AS DateTime), CAST(N'2023-12-25T22:59:09.630' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (164, 85, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519946/DUANTOTNGHIEP/c498212b-cbde-4571-a6d3-35456d6dfd4a.jpg', NULL, 1, CAST(N'2023-12-25T22:59:09.667' AS DateTime), CAST(N'2023-12-25T22:59:09.667' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (165, 85, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519947/DUANTOTNGHIEP/edeb17fd-4c9a-497e-b8ae-e4912f394193.jpg', NULL, 1, CAST(N'2023-12-25T22:59:09.983' AS DateTime), CAST(N'2023-12-25T22:59:09.983' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (166, 84, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519949/DUANTOTNGHIEP/b01a695c-ff27-41bf-aab8-408decbbf62f.jpg', NULL, 1, CAST(N'2023-12-25T22:59:11.903' AS DateTime), CAST(N'2023-12-25T22:59:11.903' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (167, 84, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519949/DUANTOTNGHIEP/9e8c2503-6fab-4a58-832c-68a0e5026177.jpg', NULL, 1, CAST(N'2023-12-25T22:59:12.303' AS DateTime), CAST(N'2023-12-25T22:59:12.303' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (168, 84, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519949/DUANTOTNGHIEP/65eec20a-72a4-4691-9d37-b07e75345ed3.jpg', NULL, 1, CAST(N'2023-12-25T22:59:12.767' AS DateTime), CAST(N'2023-12-25T22:59:12.767' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (169, 83, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519950/DUANTOTNGHIEP/76893928-edce-4c03-90e1-a1e060ed8a04.jpg', NULL, 1, CAST(N'2023-12-25T22:59:13.547' AS DateTime), CAST(N'2023-12-25T22:59:13.547' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (170, 83, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519950/DUANTOTNGHIEP/25fe02af-7c09-4135-b064-cd71729b6b2e.jpg', NULL, 1, CAST(N'2023-12-25T22:59:13.597' AS DateTime), CAST(N'2023-12-25T22:59:13.597' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (171, 73, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520042/DUANTOTNGHIEP/dcc76f3c-3023-4900-9026-ae264bbed5ce.jpg', NULL, 1, CAST(N'2023-12-25T23:00:45.057' AS DateTime), CAST(N'2023-12-25T23:00:45.057' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (172, 73, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520042/DUANTOTNGHIEP/2eb15fc4-dd71-4709-aa50-757e13093bb8.jpg', NULL, 1, CAST(N'2023-12-25T23:00:45.367' AS DateTime), CAST(N'2023-12-25T23:00:45.367' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (173, 73, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520042/DUANTOTNGHIEP/9ddab817-bbe6-4213-9c21-fd73fa08206a.jpg', NULL, 1, CAST(N'2023-12-25T23:00:45.767' AS DateTime), CAST(N'2023-12-25T23:00:45.767' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (174, 74, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520048/DUANTOTNGHIEP/f6781540-968a-40d6-9f1d-b0b9aba51325.jpg', NULL, 1, CAST(N'2023-12-25T23:00:50.630' AS DateTime), CAST(N'2023-12-25T23:00:50.630' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (175, 74, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520048/DUANTOTNGHIEP/13bf8c3d-3cb3-47ee-a23e-76f54ddb3f65.jpg', NULL, 1, CAST(N'2023-12-25T23:00:50.677' AS DateTime), CAST(N'2023-12-25T23:00:50.677' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (176, 74, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520048/DUANTOTNGHIEP/9cc88a8a-a592-47b4-9a06-5088f0dc2d71.jpg', NULL, 1, CAST(N'2023-12-25T23:00:51.443' AS DateTime), CAST(N'2023-12-25T23:00:51.443' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (177, 75, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520053/DUANTOTNGHIEP/2a4dbe7d-7311-4c3d-ac49-12e4463768a5.jpg', NULL, 1, CAST(N'2023-12-25T23:00:55.823' AS DateTime), CAST(N'2023-12-25T23:00:55.823' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (178, 75, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520053/DUANTOTNGHIEP/0e6ba7ed-f294-401c-b813-bf843ebe3ea3.jpg', NULL, 1, CAST(N'2023-12-25T23:00:56.083' AS DateTime), CAST(N'2023-12-25T23:00:56.083' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (179, 75, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520053/DUANTOTNGHIEP/526c9f00-30ea-4a80-bd28-283b44d15bfc.jpg', NULL, 1, CAST(N'2023-12-25T23:00:56.263' AS DateTime), CAST(N'2023-12-25T23:00:56.263' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (180, 76, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520056/DUANTOTNGHIEP/3c2932cd-eba7-4a3a-bb3f-4c8d8cf63689.jpg', NULL, 1, CAST(N'2023-12-25T23:00:59.630' AS DateTime), CAST(N'2023-12-25T23:00:59.630' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (181, 76, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520057/DUANTOTNGHIEP/18ab2b4a-9cc8-4682-aa2b-f11d5f7d5460.jpg', NULL, 1, CAST(N'2023-12-25T23:00:59.917' AS DateTime), CAST(N'2023-12-25T23:00:59.917' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (182, 76, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520057/DUANTOTNGHIEP/a19d896c-5564-42ab-8872-0157be169692.jpg', NULL, 1, CAST(N'2023-12-25T23:01:00.533' AS DateTime), CAST(N'2023-12-25T23:01:00.533' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (183, 77, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520061/DUANTOTNGHIEP/b298e913-74cd-4f9b-bdfe-9804bd6262bb.jpg', NULL, 1, CAST(N'2023-12-25T23:01:04.607' AS DateTime), CAST(N'2023-12-25T23:01:04.607' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (184, 77, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520061/DUANTOTNGHIEP/fef3e7ae-f088-473a-b685-f738473ea1e4.jpg', NULL, 1, CAST(N'2023-12-25T23:01:04.820' AS DateTime), CAST(N'2023-12-25T23:01:04.820' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (185, 77, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520062/DUANTOTNGHIEP/e37452ab-c231-4786-bcb3-4c19c0ad36be.jpg', NULL, 1, CAST(N'2023-12-25T23:01:05.547' AS DateTime), CAST(N'2023-12-25T23:01:05.547' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (186, 68, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520114/DUANTOTNGHIEP/e572197e-6543-43ca-9c11-b471559744a2.jpg', NULL, 1, CAST(N'2023-12-25T23:01:57.580' AS DateTime), CAST(N'2023-12-25T23:01:57.580' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (187, 68, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520115/DUANTOTNGHIEP/45b7b69a-2926-46c8-9936-936a0c915aa6.jpg', NULL, 1, CAST(N'2023-12-25T23:01:58.150' AS DateTime), CAST(N'2023-12-25T23:01:58.150' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (188, 68, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520115/DUANTOTNGHIEP/7fddf758-8003-4fac-b6bc-658115e0b0a8.jpg', NULL, 1, CAST(N'2023-12-25T23:01:58.357' AS DateTime), CAST(N'2023-12-25T23:01:58.357' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (189, 69, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520122/DUANTOTNGHIEP/d41783a3-f150-4af3-8901-c91c31aceb76.jpg', NULL, 1, CAST(N'2023-12-25T23:02:05.350' AS DateTime), CAST(N'2023-12-25T23:02:05.350' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (190, 69, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520123/DUANTOTNGHIEP/61957e87-353d-49aa-ae52-c3727f576373.jpg', NULL, 1, CAST(N'2023-12-25T23:02:05.660' AS DateTime), CAST(N'2023-12-25T23:02:05.660' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (191, 69, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520123/DUANTOTNGHIEP/6e7f08f4-9ee3-496f-9fd8-8af3922fcaa4.jpg', NULL, 1, CAST(N'2023-12-25T23:02:05.743' AS DateTime), CAST(N'2023-12-25T23:02:05.743' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (192, 70, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520140/DUANTOTNGHIEP/566d6a42-c258-4507-8781-14b861dab7c1.jpg', NULL, 1, CAST(N'2023-12-25T23:02:22.817' AS DateTime), CAST(N'2023-12-25T23:02:22.817' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (193, 70, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520140/DUANTOTNGHIEP/849f3d74-c098-4e6b-a9e7-9dc5e6a8834f.jpg', NULL, 1, CAST(N'2023-12-25T23:02:22.870' AS DateTime), CAST(N'2023-12-25T23:02:22.870' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (194, 70, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520140/DUANTOTNGHIEP/5ed42977-85c3-40e1-abe4-ce5bc67c4e3a.jpg', NULL, 1, CAST(N'2023-12-25T23:02:23.410' AS DateTime), CAST(N'2023-12-25T23:02:23.410' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (195, 71, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520152/DUANTOTNGHIEP/f525a2c7-ded4-49e8-8f4c-fcab340f2c80.jpg', NULL, 1, CAST(N'2023-12-25T23:02:34.833' AS DateTime), CAST(N'2023-12-25T23:02:34.833' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (196, 71, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520152/DUANTOTNGHIEP/0955000e-e8ec-4dd9-bb37-37fa7f9664ac.jpg', NULL, 1, CAST(N'2023-12-25T23:02:35.600' AS DateTime), CAST(N'2023-12-25T23:02:35.600' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (197, 71, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520152/DUANTOTNGHIEP/e2fb39de-4d4f-443f-9961-018a1e00aa93.jpg', NULL, 1, CAST(N'2023-12-25T23:02:35.467' AS DateTime), CAST(N'2023-12-25T23:02:35.467' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (198, 72, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520196/DUANTOTNGHIEP/a5f7b7fb-3d73-4bd3-91ac-49c2a2f84076.jpg', NULL, 1, CAST(N'2023-12-25T23:03:19.660' AS DateTime), CAST(N'2023-12-25T23:03:19.660' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (199, 72, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520197/DUANTOTNGHIEP/4c7e674d-8eb0-47eb-8f09-e8cb2b89abf6.jpg', NULL, 1, CAST(N'2023-12-25T23:03:19.873' AS DateTime), CAST(N'2023-12-25T23:03:19.873' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (200, 72, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520197/DUANTOTNGHIEP/c1795559-8a6d-4961-91a5-3e4a0a8543d5.jpg', NULL, 1, CAST(N'2023-12-25T23:03:20.050' AS DateTime), CAST(N'2023-12-25T23:03:20.050' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (201, 63, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520268/DUANTOTNGHIEP/5eb04d4b-b6f1-4f04-9af1-671715a768c4.jpg', NULL, 1, CAST(N'2023-12-25T23:04:30.943' AS DateTime), CAST(N'2023-12-25T23:04:30.943' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (202, 63, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520268/DUANTOTNGHIEP/91012a72-55cf-4763-afea-da1a6412d556.jpg', NULL, 1, CAST(N'2023-12-25T23:04:31.010' AS DateTime), CAST(N'2023-12-25T23:04:31.010' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (203, 63, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520268/DUANTOTNGHIEP/cd47f49b-2032-4780-9b68-4255c10167b2.jpg', NULL, 1, CAST(N'2023-12-25T23:04:31.737' AS DateTime), CAST(N'2023-12-25T23:04:31.737' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (204, 64, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520284/DUANTOTNGHIEP/9bbd3bb0-34ad-49c6-b4fa-ea82dc1d5a78.jpg', NULL, 1, CAST(N'2023-12-25T23:04:47.143' AS DateTime), CAST(N'2023-12-25T23:04:47.143' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (205, 64, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520284/DUANTOTNGHIEP/781b9786-d9e4-49d1-b704-c2f452c7420d.jpg', NULL, 1, CAST(N'2023-12-25T23:04:47.257' AS DateTime), CAST(N'2023-12-25T23:04:47.257' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (206, 64, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520284/DUANTOTNGHIEP/b5646ec8-c841-44fd-b920-c962f7ccd648.jpg', NULL, 1, CAST(N'2023-12-25T23:04:47.500' AS DateTime), CAST(N'2023-12-25T23:04:47.500' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (207, 65, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520296/DUANTOTNGHIEP/3818e942-898c-4bcb-b80f-98ea2315aac0.jpg', NULL, 1, CAST(N'2023-12-25T23:04:58.900' AS DateTime), CAST(N'2023-12-25T23:04:58.900' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (208, 65, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520296/DUANTOTNGHIEP/851fb01e-e0a3-4286-b862-a2e150a55050.jpg', NULL, 1, CAST(N'2023-12-25T23:04:59.140' AS DateTime), CAST(N'2023-12-25T23:04:59.140' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (209, 65, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520296/DUANTOTNGHIEP/c1ebc7f4-3100-49ed-8e74-237b85190db4.jpg', NULL, 1, CAST(N'2023-12-25T23:04:59.190' AS DateTime), CAST(N'2023-12-25T23:04:59.190' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (210, 66, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520309/DUANTOTNGHIEP/66df0f7d-0a1b-40d5-84dc-91796ec81b21.jpg', NULL, 1, CAST(N'2023-12-25T23:05:11.667' AS DateTime), CAST(N'2023-12-25T23:05:11.667' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (211, 66, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520309/DUANTOTNGHIEP/a6e0d9ed-7498-480b-bb6a-88a781736447.jpg', NULL, 1, CAST(N'2023-12-25T23:05:11.707' AS DateTime), CAST(N'2023-12-25T23:05:11.707' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (212, 66, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520309/DUANTOTNGHIEP/a8f57223-be6a-44dc-a405-6f0514053353.jpg', NULL, 1, CAST(N'2023-12-25T23:05:12.543' AS DateTime), CAST(N'2023-12-25T23:05:12.543' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (213, 67, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520323/DUANTOTNGHIEP/c80daa1e-707e-4b51-84c0-05c79774b0e4.jpg', NULL, 1, CAST(N'2023-12-25T23:05:26.040' AS DateTime), CAST(N'2023-12-25T23:05:26.040' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (214, 67, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520323/DUANTOTNGHIEP/2ed7f0a9-829d-4a49-9a25-ba5e973775a1.jpg', NULL, 1, CAST(N'2023-12-25T23:05:26.183' AS DateTime), CAST(N'2023-12-25T23:05:26.183' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (215, 67, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520323/DUANTOTNGHIEP/500b8c7a-1224-46f4-ae4e-7131b0b4f435.jpg', NULL, 1, CAST(N'2023-12-25T23:05:26.600' AS DateTime), CAST(N'2023-12-25T23:05:26.600' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (216, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525126/DUANTOTNGHIEP/e0a1fafc-e670-4eb9-ba56-f8eb23c21d0b.jpg', NULL, 1, CAST(N'2023-12-26T00:25:29.843' AS DateTime), CAST(N'2023-12-26T00:25:29.843' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (217, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525126/DUANTOTNGHIEP/ccc08a8e-38d9-459c-9510-14807b92647e.jpg', NULL, 1, CAST(N'2023-12-26T00:25:29.840' AS DateTime), CAST(N'2023-12-26T00:25:29.840' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (218, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525126/DUANTOTNGHIEP/f96d69ce-6113-48e5-a6eb-88704e195fb1.jpg', NULL, 1, CAST(N'2023-12-26T00:25:29.860' AS DateTime), CAST(N'2023-12-26T00:25:29.860' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (219, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525126/DUANTOTNGHIEP/df74d64a-c5fd-45d1-8f28-7023370dfc3b.jpg', NULL, 1, CAST(N'2023-12-26T00:25:30.173' AS DateTime), CAST(N'2023-12-26T00:25:30.173' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (220, 44, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525128/DUANTOTNGHIEP/2d3aca9d-0e73-48e6-9742-78acc7ce581d.jpg', NULL, 1, CAST(N'2023-12-26T00:25:31.293' AS DateTime), CAST(N'2023-12-26T00:25:31.293' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (221, 44, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525128/DUANTOTNGHIEP/3998a7e4-0647-4bdf-878a-55f9bcab46e8.jpg', NULL, 1, CAST(N'2023-12-26T00:25:31.367' AS DateTime), CAST(N'2023-12-26T00:25:31.367' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (222, 44, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525129/DUANTOTNGHIEP/5d29cb85-1fae-494f-a3a6-615825b39490.jpg', NULL, 1, CAST(N'2023-12-26T00:25:31.893' AS DateTime), CAST(N'2023-12-26T00:25:31.893' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (223, 44, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525129/DUANTOTNGHIEP/68e87641-8e24-431d-96e7-ba102f9c7458.jpg', NULL, 1, CAST(N'2023-12-26T00:25:32.127' AS DateTime), CAST(N'2023-12-26T00:25:32.127' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (224, 43, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525131/DUANTOTNGHIEP/4ecda16d-340f-44b3-ad32-2256faed0ae1.jpg', NULL, 1, CAST(N'2023-12-26T00:25:34.140' AS DateTime), CAST(N'2023-12-26T00:25:34.140' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (225, 43, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525131/DUANTOTNGHIEP/44006ebb-aafb-4507-a456-bafa33d4ab98.jpg', NULL, 1, CAST(N'2023-12-26T00:25:34.353' AS DateTime), CAST(N'2023-12-26T00:25:34.353' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (226, 43, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525131/DUANTOTNGHIEP/bbcda7f8-0956-4f13-8759-c6db9d653812.jpg', NULL, 1, CAST(N'2023-12-26T00:25:34.617' AS DateTime), CAST(N'2023-12-26T00:25:34.617' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (227, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525139/DUANTOTNGHIEP/e42d7931-1267-4c71-b7fb-1d9ce66b1309.jpg', NULL, 1, CAST(N'2023-12-26T00:25:41.967' AS DateTime), CAST(N'2023-12-26T00:25:41.967' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (228, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525139/DUANTOTNGHIEP/1ab973a0-6c3a-4ca1-ad5e-cd0706581b4a.jpg', NULL, 1, CAST(N'2023-12-26T00:25:42.030' AS DateTime), CAST(N'2023-12-26T00:25:42.030' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (229, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525139/DUANTOTNGHIEP/89c752e7-a8f3-4e15-b1be-fef88751c06e.jpg', NULL, 1, CAST(N'2023-12-26T00:25:42.193' AS DateTime), CAST(N'2023-12-26T00:25:42.193' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (230, 45, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525139/DUANTOTNGHIEP/1fcbbfe5-6301-4c84-8454-adb25e9d6edf.jpg', NULL, 1, CAST(N'2023-12-26T00:25:42.330' AS DateTime), CAST(N'2023-12-26T00:25:42.330' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (231, 46, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525141/DUANTOTNGHIEP/aa946610-1f56-4a8d-a5ae-6e3a53b48f0b.jpg', NULL, 1, CAST(N'2023-12-26T00:25:43.893' AS DateTime), CAST(N'2023-12-26T00:25:43.893' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (232, 46, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525141/DUANTOTNGHIEP/dcc71aff-cb99-4302-a49b-c332ce44d993.jpg', NULL, 1, CAST(N'2023-12-26T00:25:44.140' AS DateTime), CAST(N'2023-12-26T00:25:44.140' AS DateTime), 0)
GO
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (233, 46, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525141/DUANTOTNGHIEP/49ce5aa0-63a3-4ea6-bdf4-73589d72f747.jpg', NULL, 1, CAST(N'2023-12-26T00:25:44.440' AS DateTime), CAST(N'2023-12-26T00:25:44.440' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (234, 46, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525141/DUANTOTNGHIEP/0dc46bd9-e17c-4711-b39f-1712d0c4640c.jpg', NULL, 1, CAST(N'2023-12-26T00:25:44.727' AS DateTime), CAST(N'2023-12-26T00:25:44.727' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (235, 46, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525142/DUANTOTNGHIEP/b0170549-3dea-4f1e-bc9e-20241d9a4f00.jpg', NULL, 1, CAST(N'2023-12-26T00:25:45.010' AS DateTime), CAST(N'2023-12-26T00:25:45.010' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (236, 47, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525160/DUANTOTNGHIEP/ddd236b6-a84a-40db-81d4-7a858a4d2277.jpg', NULL, 1, CAST(N'2023-12-26T00:26:03.370' AS DateTime), CAST(N'2023-12-26T00:26:03.370' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (237, 47, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525160/DUANTOTNGHIEP/fe805654-1511-4261-8f5d-681baec44734.jpg', NULL, 1, CAST(N'2023-12-26T00:26:03.443' AS DateTime), CAST(N'2023-12-26T00:26:03.443' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (238, 47, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525160/DUANTOTNGHIEP/54c144ca-a8f8-4123-8c09-29a55feede14.jpg', NULL, 1, CAST(N'2023-12-26T00:26:03.720' AS DateTime), CAST(N'2023-12-26T00:26:03.720' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (239, 48, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525212/DUANTOTNGHIEP/407495fa-c9d3-4115-970b-f3508433ddf0.jpg', NULL, 1, CAST(N'2023-12-26T00:26:55.033' AS DateTime), CAST(N'2023-12-26T00:26:55.033' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (240, 48, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525212/DUANTOTNGHIEP/e5cedaa4-03b6-46bf-b6a5-8d93154c04ef.jpg', NULL, 1, CAST(N'2023-12-26T00:26:55.150' AS DateTime), CAST(N'2023-12-26T00:26:55.150' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (241, 48, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525212/DUANTOTNGHIEP/e361183a-2295-4424-8589-578ba7221041.jpg', NULL, 1, CAST(N'2023-12-26T00:26:55.163' AS DateTime), CAST(N'2023-12-26T00:26:55.163' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (242, 48, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525212/DUANTOTNGHIEP/04883dbb-1278-46e2-a6d5-0d4ffdfca249.jpg', NULL, 1, CAST(N'2023-12-26T00:26:55.407' AS DateTime), CAST(N'2023-12-26T00:26:55.407' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (243, 49, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525217/DUANTOTNGHIEP/c83fe16b-092d-41c5-b27d-22b72296e6de.jpg', NULL, 1, CAST(N'2023-12-26T00:26:59.927' AS DateTime), CAST(N'2023-12-26T00:26:59.927' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (244, 49, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525217/DUANTOTNGHIEP/66165326-7fe6-47bd-ad58-eac9601bb713.jpg', NULL, 1, CAST(N'2023-12-26T00:27:00.803' AS DateTime), CAST(N'2023-12-26T00:27:00.803' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (245, 49, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525217/DUANTOTNGHIEP/d4bf7da2-003e-4cb7-bc4b-fdd9064933a8.jpg', NULL, 1, CAST(N'2023-12-26T00:27:00.847' AS DateTime), CAST(N'2023-12-26T00:27:00.847' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (246, 49, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525217/DUANTOTNGHIEP/4eff7276-25f5-48a0-b722-35a4151c1be6.jpg', NULL, 1, CAST(N'2023-12-26T00:27:01.000' AS DateTime), CAST(N'2023-12-26T00:27:01.000' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (247, 49, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525218/DUANTOTNGHIEP/ea75fb07-b17a-4e2f-96d3-b8c9c3522103.jpg', NULL, 1, CAST(N'2023-12-26T00:27:01.073' AS DateTime), CAST(N'2023-12-26T00:27:01.073' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (248, 50, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525224/DUANTOTNGHIEP/8832613a-4ab5-46bc-b7d6-7b208e2b4957.jpg', NULL, 1, CAST(N'2023-12-26T00:27:07.453' AS DateTime), CAST(N'2023-12-26T00:27:07.453' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (249, 50, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525225/DUANTOTNGHIEP/f0b96b4e-339c-4c0b-aec5-c87996549283.jpg', NULL, 1, CAST(N'2023-12-26T00:27:08.073' AS DateTime), CAST(N'2023-12-26T00:27:08.073' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (250, 50, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525225/DUANTOTNGHIEP/9f027d3e-4d0f-4fef-b649-02fa9abc5628.jpg', NULL, 1, CAST(N'2023-12-26T00:27:08.257' AS DateTime), CAST(N'2023-12-26T00:27:08.257' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (251, 50, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525225/DUANTOTNGHIEP/82099a10-9eca-426d-b31f-f2efba72f526.jpg', NULL, 1, CAST(N'2023-12-26T00:27:08.257' AS DateTime), CAST(N'2023-12-26T00:27:08.257' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (252, 50, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525225/DUANTOTNGHIEP/af7d9b6d-fccf-46f3-9cf4-9bd033fca9d5.jpg', NULL, 1, CAST(N'2023-12-26T00:27:08.563' AS DateTime), CAST(N'2023-12-26T00:27:08.563' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (253, 51, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525230/DUANTOTNGHIEP/27449a85-bd25-4599-b6b2-8ccfebea0843.jpg', NULL, 1, CAST(N'2023-12-26T00:27:13.747' AS DateTime), CAST(N'2023-12-26T00:27:13.747' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (254, 51, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525231/DUANTOTNGHIEP/b7e30267-78b1-41d2-8333-bdf9cbda4a62.jpg', NULL, 1, CAST(N'2023-12-26T00:27:14.247' AS DateTime), CAST(N'2023-12-26T00:27:14.247' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (255, 51, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525231/DUANTOTNGHIEP/82722efb-a428-4c5c-a625-d5bb55badea2.jpg', NULL, 1, CAST(N'2023-12-26T00:27:14.470' AS DateTime), CAST(N'2023-12-26T00:27:14.470' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (256, 51, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525231/DUANTOTNGHIEP/2175f43e-c397-4401-a2fd-8391fc98b04a.jpg', NULL, 1, CAST(N'2023-12-26T00:27:14.543' AS DateTime), CAST(N'2023-12-26T00:27:14.543' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (257, 51, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525231/DUANTOTNGHIEP/290110dc-1d01-4ec2-a53f-ff2222140758.jpg', NULL, 1, CAST(N'2023-12-26T00:27:14.870' AS DateTime), CAST(N'2023-12-26T00:27:14.870' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (258, 52, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525237/DUANTOTNGHIEP/90c9bc5d-b764-49c5-97ff-c5e3eeb484c8.jpg', NULL, 1, CAST(N'2023-12-26T00:27:20.347' AS DateTime), CAST(N'2023-12-26T00:27:20.347' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (259, 52, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525237/DUANTOTNGHIEP/e774df9a-0e65-40a2-94a1-a1dd2b86ce67.jpg', NULL, 1, CAST(N'2023-12-26T00:27:20.390' AS DateTime), CAST(N'2023-12-26T00:27:20.390' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (260, 52, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525237/DUANTOTNGHIEP/8b2e809d-0e39-4b5e-9982-a76b6080aaa2.jpg', NULL, 1, CAST(N'2023-12-26T00:27:20.877' AS DateTime), CAST(N'2023-12-26T00:27:20.877' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (261, 53, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525279/DUANTOTNGHIEP/84cbf2d8-804c-477b-8f46-f278b9ca5e81.jpg', NULL, 1, CAST(N'2023-12-26T00:28:01.900' AS DateTime), CAST(N'2023-12-26T00:28:01.900' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (262, 53, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525279/DUANTOTNGHIEP/e7a60fd5-b892-4fde-bcc3-48d7cc8f95fa.jpg', NULL, 1, CAST(N'2023-12-26T00:28:01.913' AS DateTime), CAST(N'2023-12-26T00:28:01.913' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (263, 53, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525279/DUANTOTNGHIEP/71b6b949-59d1-4ec4-8408-473ee6e4a02a.jpg', NULL, 1, CAST(N'2023-12-26T00:28:01.973' AS DateTime), CAST(N'2023-12-26T00:28:01.973' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (264, 54, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525286/DUANTOTNGHIEP/df1c97bc-3175-4089-b69f-d2056e6bc9de.jpg', NULL, 1, CAST(N'2023-12-26T00:28:09.200' AS DateTime), CAST(N'2023-12-26T00:28:09.200' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (265, 54, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525286/DUANTOTNGHIEP/c21f9d5b-4d57-4568-b198-28b7a6c245e1.jpg', NULL, 1, CAST(N'2023-12-26T00:28:09.297' AS DateTime), CAST(N'2023-12-26T00:28:09.297' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (266, 54, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525286/DUANTOTNGHIEP/1876a300-5360-42dc-92fb-5cbc5828e540.jpg', NULL, 1, CAST(N'2023-12-26T00:28:09.357' AS DateTime), CAST(N'2023-12-26T00:28:09.357' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (267, 55, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525292/DUANTOTNGHIEP/d93b359e-2b0f-4db4-9875-3de423427e1d.jpg', NULL, 1, CAST(N'2023-12-26T00:28:15.387' AS DateTime), CAST(N'2023-12-26T00:28:15.387' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (268, 55, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525292/DUANTOTNGHIEP/7f22c42d-a026-409e-874c-fa9354d8e6f9.jpg', NULL, 1, CAST(N'2023-12-26T00:28:15.333' AS DateTime), CAST(N'2023-12-26T00:28:15.333' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (269, 55, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525292/DUANTOTNGHIEP/e4d723d7-0887-4bec-bcd6-e7ec594ecc38.jpg', NULL, 1, CAST(N'2023-12-26T00:28:15.380' AS DateTime), CAST(N'2023-12-26T00:28:15.380' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (270, 56, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525299/DUANTOTNGHIEP/086bfbbd-7a01-4a5c-972e-3741ccde66a9.jpg', NULL, 1, CAST(N'2023-12-26T00:28:22.620' AS DateTime), CAST(N'2023-12-26T00:28:22.620' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (271, 56, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525299/DUANTOTNGHIEP/1c6774bd-5cc3-4e9f-9b64-be1471486e3b.jpg', NULL, 1, CAST(N'2023-12-26T00:28:22.717' AS DateTime), CAST(N'2023-12-26T00:28:22.717' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (272, 56, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525299/DUANTOTNGHIEP/fc5ceae2-4d76-4698-a2b9-b6ed6dba8bca.jpg', NULL, 1, CAST(N'2023-12-26T00:28:22.873' AS DateTime), CAST(N'2023-12-26T00:28:22.873' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (273, 57, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525307/DUANTOTNGHIEP/2084fec7-5d0d-4463-bf10-d967d4660387.jpg', NULL, 1, CAST(N'2023-12-26T00:28:30.213' AS DateTime), CAST(N'2023-12-26T00:28:30.213' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (274, 57, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525307/DUANTOTNGHIEP/ca02d1d8-7fdc-4207-bb03-4f8cb0f397ee.jpg', NULL, 1, CAST(N'2023-12-26T00:28:30.243' AS DateTime), CAST(N'2023-12-26T00:28:30.243' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (275, 57, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525307/DUANTOTNGHIEP/987298bd-3d10-4e67-b4a2-2dfa0dd49f58.jpg', NULL, 1, CAST(N'2023-12-26T00:28:30.263' AS DateTime), CAST(N'2023-12-26T00:28:30.263' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (276, 62, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525364/DUANTOTNGHIEP/3b0ee77a-dc90-4912-9b97-6151649ddbb7.jpg', NULL, 1, CAST(N'2023-12-26T00:29:27.573' AS DateTime), CAST(N'2023-12-26T00:29:27.573' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (277, 62, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525364/DUANTOTNGHIEP/f75dec89-e21b-4ee2-b1fd-97db654c46c6.jpg', NULL, 1, CAST(N'2023-12-26T00:29:27.657' AS DateTime), CAST(N'2023-12-26T00:29:27.657' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (278, 62, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525364/DUANTOTNGHIEP/4e407160-aa42-4f1c-a213-ca43f395a37f.jpg', NULL, 1, CAST(N'2023-12-26T00:29:27.773' AS DateTime), CAST(N'2023-12-26T00:29:27.773' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (279, 61, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525366/DUANTOTNGHIEP/6d659c3f-e634-449c-bb6e-328c36ffbb83.jpg', NULL, 1, CAST(N'2023-12-26T00:29:29.590' AS DateTime), CAST(N'2023-12-26T00:29:29.590' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (280, 61, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525367/DUANTOTNGHIEP/3903731b-c703-4bef-8d80-8b3716478955.jpg', NULL, 1, CAST(N'2023-12-26T00:29:30.320' AS DateTime), CAST(N'2023-12-26T00:29:30.320' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (281, 61, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525367/DUANTOTNGHIEP/eeda212e-58eb-455c-b200-b3b3350da240.jpg', NULL, 1, CAST(N'2023-12-26T00:29:30.353' AS DateTime), CAST(N'2023-12-26T00:29:30.353' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (282, 61, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525367/DUANTOTNGHIEP/653ab1b3-9f74-4204-b47c-f66dc365cd93.jpg', NULL, 1, CAST(N'2023-12-26T00:29:30.497' AS DateTime), CAST(N'2023-12-26T00:29:30.497' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (283, 60, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525371/DUANTOTNGHIEP/58d718b7-e96f-470e-ad70-97b5c3ebb1fe.jpg', NULL, 1, CAST(N'2023-12-26T00:29:34.047' AS DateTime), CAST(N'2023-12-26T00:29:34.047' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (284, 60, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525371/DUANTOTNGHIEP/4dd5473b-f7d9-4edb-8e1b-b0fad13b7ceb.jpg', NULL, 1, CAST(N'2023-12-26T00:29:34.140' AS DateTime), CAST(N'2023-12-26T00:29:34.140' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (285, 60, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525371/DUANTOTNGHIEP/c0d3dcb9-feab-4a09-8d15-71d35ba8234e.jpg', NULL, 1, CAST(N'2023-12-26T00:29:34.397' AS DateTime), CAST(N'2023-12-26T00:29:34.397' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (286, 59, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525373/DUANTOTNGHIEP/9a391976-72c4-423a-a90e-eba79244e01f.jpg', NULL, 1, CAST(N'2023-12-26T00:29:36.443' AS DateTime), CAST(N'2023-12-26T00:29:36.443' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (287, 59, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525373/DUANTOTNGHIEP/1023815c-e21a-489f-8de0-4e78edbe0188.jpg', NULL, 1, CAST(N'2023-12-26T00:29:36.510' AS DateTime), CAST(N'2023-12-26T00:29:36.510' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (288, 59, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525373/DUANTOTNGHIEP/f923545c-f17a-4811-b93f-62c4737bcec0.jpg', NULL, 1, CAST(N'2023-12-26T00:29:36.737' AS DateTime), CAST(N'2023-12-26T00:29:36.737' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (289, 58, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525378/DUANTOTNGHIEP/ec12a19b-52da-4d95-818e-1581c4f70d90.jpg', NULL, 1, CAST(N'2023-12-26T00:29:41.167' AS DateTime), CAST(N'2023-12-26T00:29:41.167' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (290, 58, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525378/DUANTOTNGHIEP/adebafce-83b6-4878-b1a9-8193ad9f7674.jpg', NULL, 1, CAST(N'2023-12-26T00:29:41.407' AS DateTime), CAST(N'2023-12-26T00:29:41.407' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (291, 58, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525378/DUANTOTNGHIEP/65143873-ff07-4fe0-bd11-5187a71e8399.jpg', NULL, 1, CAST(N'2023-12-26T00:29:41.467' AS DateTime), CAST(N'2023-12-26T00:29:41.467' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (292, 41, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526097/DUANTOTNGHIEP/cfd6afb2-6078-43d0-ae38-93e0c90ac82c.jpg', NULL, 1, CAST(N'2023-12-26T00:41:40.590' AS DateTime), CAST(N'2023-12-26T00:41:40.590' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (293, 41, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526097/DUANTOTNGHIEP/13f384d3-22c1-4db9-ad7c-d1e6a3ea5e8e.jpg', NULL, 1, CAST(N'2023-12-26T00:41:40.990' AS DateTime), CAST(N'2023-12-26T00:41:40.990' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (294, 41, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526098/DUANTOTNGHIEP/e5efe1bd-000f-4ab3-8646-1700a4544a38.jpg', NULL, 1, CAST(N'2023-12-26T00:41:41.090' AS DateTime), CAST(N'2023-12-26T00:41:41.090' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (295, 42, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526104/DUANTOTNGHIEP/5582fde3-2153-4c80-9c20-0550840ebaac.jpg', NULL, 1, CAST(N'2023-12-26T00:41:46.980' AS DateTime), CAST(N'2023-12-26T00:41:46.980' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (296, 42, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526104/DUANTOTNGHIEP/275cee9e-acb6-4043-824c-1419a1e5787d.jpg', NULL, 1, CAST(N'2023-12-26T00:41:47.010' AS DateTime), CAST(N'2023-12-26T00:41:47.010' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (297, 42, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526104/DUANTOTNGHIEP/7b3c1cb9-a266-4b35-b3f3-bc7237b5c8cc.jpg', NULL, 1, CAST(N'2023-12-26T00:41:47.010' AS DateTime), CAST(N'2023-12-26T00:41:47.010' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (298, 39, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526162/DUANTOTNGHIEP/b5b7c616-ef2a-4842-9c37-fd2ee3ae96ee.jpg', NULL, 1, CAST(N'2023-12-26T00:42:45.223' AS DateTime), CAST(N'2023-12-26T00:42:45.223' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (299, 39, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526162/DUANTOTNGHIEP/8448c2cb-27ed-4fb0-901a-52dbf841099a.jpg', NULL, 1, CAST(N'2023-12-26T00:42:45.503' AS DateTime), CAST(N'2023-12-26T00:42:45.503' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (300, 39, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526162/DUANTOTNGHIEP/5db6fe5c-30b8-458a-821a-6d4220d0f89c.jpg', NULL, 1, CAST(N'2023-12-26T00:42:45.683' AS DateTime), CAST(N'2023-12-26T00:42:45.683' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (301, 91, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526391/DUANTOTNGHIEP/0f594b67-d1e3-465c-82f6-7ae86db20ad7.jpg', NULL, 1, CAST(N'2023-12-26T00:46:33.913' AS DateTime), CAST(N'2023-12-26T00:46:33.913' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (302, 91, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526392/DUANTOTNGHIEP/a98da39e-e9f9-4194-8b2d-e973769b66ae.jpg', NULL, 1, CAST(N'2023-12-26T00:46:35.077' AS DateTime), CAST(N'2023-12-26T00:46:35.077' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (303, 91, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526392/DUANTOTNGHIEP/fc805ac0-0610-4a9a-815e-71f73f58edfa.jpg', NULL, 1, CAST(N'2023-12-26T00:46:35.140' AS DateTime), CAST(N'2023-12-26T00:46:35.140' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (304, 92, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526533/DUANTOTNGHIEP/c2f03b42-4a24-43f8-a3d1-a053d2f246bc.jpg', NULL, 1, CAST(N'2023-12-26T00:48:56.667' AS DateTime), CAST(N'2023-12-26T00:48:56.667' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (305, 92, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526534/DUANTOTNGHIEP/53a169c5-4bba-4bcf-a5d0-dbd9acf6ca86.jpg', NULL, 1, CAST(N'2023-12-26T00:48:56.963' AS DateTime), CAST(N'2023-12-26T00:48:56.963' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (306, 92, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526534/DUANTOTNGHIEP/f7fc960b-1875-4836-ba2c-f322c1559bee.jpg', NULL, 1, CAST(N'2023-12-26T00:48:56.973' AS DateTime), CAST(N'2023-12-26T00:48:56.973' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (307, 93, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526541/DUANTOTNGHIEP/81b0567a-fa58-4d6f-9c16-aa3edaa3e68e.jpg', NULL, 1, CAST(N'2023-12-26T00:49:04.223' AS DateTime), CAST(N'2023-12-26T00:49:04.223' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (308, 93, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526541/DUANTOTNGHIEP/563d26d8-3ee7-4468-837f-4145609a4902.jpg', NULL, 1, CAST(N'2023-12-26T00:49:04.393' AS DateTime), CAST(N'2023-12-26T00:49:04.393' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (309, 93, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526541/DUANTOTNGHIEP/10ac11a5-fbf2-431c-90fd-d8fe2df04137.jpg', NULL, 1, CAST(N'2023-12-26T00:49:04.557' AS DateTime), CAST(N'2023-12-26T00:49:04.557' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (310, 94, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526697/DUANTOTNGHIEP/a193beaa-6f96-499f-bcd4-b8cf3f720cde.jpg', NULL, 1, CAST(N'2023-12-26T00:51:40.717' AS DateTime), CAST(N'2023-12-26T00:51:40.717' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (311, 94, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526697/DUANTOTNGHIEP/56363e99-ffe0-4ce4-a12b-dc2f81d09b62.jpg', NULL, 1, CAST(N'2023-12-26T00:51:40.770' AS DateTime), CAST(N'2023-12-26T00:51:40.770' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (312, 94, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526697/DUANTOTNGHIEP/8ea5dc1c-ab31-4b80-8b06-77f7886d9c64.jpg', NULL, 1, CAST(N'2023-12-26T00:51:40.777' AS DateTime), CAST(N'2023-12-26T00:51:40.777' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (313, 95, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526703/DUANTOTNGHIEP/b1dc0eea-95a7-4229-bdeb-dcc5362773a4.jpg', NULL, 1, CAST(N'2023-12-26T00:51:46.077' AS DateTime), CAST(N'2023-12-26T00:51:46.077' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (314, 95, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526703/DUANTOTNGHIEP/f5931423-6b3b-4418-a875-2fbe32f48cd3.jpg', NULL, 1, CAST(N'2023-12-26T00:51:46.080' AS DateTime), CAST(N'2023-12-26T00:51:46.080' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (315, 95, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526703/DUANTOTNGHIEP/96ae3a2a-56dc-4c12-b490-4d36506761bb.jpg', NULL, 1, CAST(N'2023-12-26T00:51:46.087' AS DateTime), CAST(N'2023-12-26T00:51:46.087' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (316, 96, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526712/DUANTOTNGHIEP/c8cd43b8-3987-49d7-9d68-85c7c700938b.jpg', NULL, 1, CAST(N'2023-12-26T00:51:54.910' AS DateTime), CAST(N'2023-12-26T00:51:54.910' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (317, 96, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526712/DUANTOTNGHIEP/d201054f-7361-4175-99a2-ae968edeab38.jpg', NULL, 1, CAST(N'2023-12-26T00:51:55.743' AS DateTime), CAST(N'2023-12-26T00:51:55.743' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (318, 96, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526712/DUANTOTNGHIEP/9ceaea61-c46b-4494-b864-a7d805ab974c.jpg', NULL, 1, CAST(N'2023-12-26T00:51:55.803' AS DateTime), CAST(N'2023-12-26T00:51:55.803' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (319, 96, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526713/DUANTOTNGHIEP/7680dfe4-dd3d-41b7-a15b-0af3aa69cdff.jpg', NULL, 1, CAST(N'2023-12-26T00:51:55.997' AS DateTime), CAST(N'2023-12-26T00:51:55.997' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (320, 97, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703688857/DUANTOTNGHIEP/a059f870-0092-4c25-a563-00cd335f4a05.jpg', NULL, 1, CAST(N'2023-12-27T21:54:19.483' AS DateTime), CAST(N'2023-12-27T21:54:19.483' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (321, 97, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703688857/DUANTOTNGHIEP/076b6cb5-1778-4b3f-9b51-83cbcd3c0083.jpg', NULL, 1, CAST(N'2023-12-27T21:54:19.483' AS DateTime), CAST(N'2023-12-27T21:54:19.483' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (322, 97, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703688857/DUANTOTNGHIEP/bc3d733e-452b-470c-83b7-902419fec31b.jpg', NULL, 1, CAST(N'2023-12-27T21:54:19.503' AS DateTime), CAST(N'2023-12-27T21:54:19.503' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (323, 97, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703688857/DUANTOTNGHIEP/14a99557-8c32-4644-a70a-6aa17f8972e7.jpg', NULL, 1, CAST(N'2023-12-27T21:54:19.740' AS DateTime), CAST(N'2023-12-27T21:54:19.740' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (324, 99, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771658/DUANTOTNGHIEP/d94725a7-d0b8-4589-8b3b-4aff412e8372.jpg', NULL, 1, CAST(N'2023-12-28T20:54:21.980' AS DateTime), CAST(N'2023-12-28T20:54:21.980' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (325, 99, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771659/DUANTOTNGHIEP/66ed4113-c438-4940-aa61-9ca76a1f6cb1.jpg', NULL, 1, CAST(N'2023-12-28T20:54:22.277' AS DateTime), CAST(N'2023-12-28T20:54:22.277' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (326, 99, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771659/DUANTOTNGHIEP/03caa663-6733-45f2-a1bf-39d588b26e14.jpg', NULL, 1, CAST(N'2023-12-28T20:54:22.457' AS DateTime), CAST(N'2023-12-28T20:54:22.457' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (327, 100, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771659/DUANTOTNGHIEP/e6f9e591-2375-4fe9-8ac8-8fa0f1259c6a.jpg', NULL, 1, CAST(N'2023-12-28T20:54:22.743' AS DateTime), CAST(N'2023-12-28T20:54:22.743' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (328, 100, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771659/DUANTOTNGHIEP/32c661ed-49fc-4029-adff-5788adc61ce8.jpg', NULL, 1, CAST(N'2023-12-28T20:54:23.013' AS DateTime), CAST(N'2023-12-28T20:54:23.013' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (329, 100, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771660/DUANTOTNGHIEP/fa99d32c-2254-47b1-948c-53b5291c900b.jpg', NULL, 1, CAST(N'2023-12-28T20:54:23.367' AS DateTime), CAST(N'2023-12-28T20:54:23.367' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (330, 100, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771661/DUANTOTNGHIEP/58003110-56eb-4623-b54b-6cb1aa609668.jpg', NULL, 1, CAST(N'2023-12-28T20:54:24.107' AS DateTime), CAST(N'2023-12-28T20:54:24.107' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (331, 98, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771661/DUANTOTNGHIEP/75b5f929-3f87-42f2-aefb-a71a5ecaf044.jpg', NULL, 1, CAST(N'2023-12-28T20:54:24.267' AS DateTime), CAST(N'2023-12-28T20:54:24.267' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (332, 98, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771661/DUANTOTNGHIEP/40a1067a-8d24-4f44-8ffc-580400b4409f.jpg', NULL, 1, CAST(N'2023-12-28T20:54:24.543' AS DateTime), CAST(N'2023-12-28T20:54:24.543' AS DateTime), 0)
GO
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (333, 98, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771661/DUANTOTNGHIEP/cc3f035d-9d67-42e5-824b-a4024cdb3e63.jpg', NULL, 1, CAST(N'2023-12-28T20:54:24.777' AS DateTime), CAST(N'2023-12-28T20:54:24.777' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (334, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771731/DUANTOTNGHIEP/bdeefb2c-249a-4df2-90e6-38d9c8ce7a5a.jpg', NULL, 1, CAST(N'2023-12-28T20:55:34.043' AS DateTime), CAST(N'2023-12-28T20:55:34.043' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (335, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771731/DUANTOTNGHIEP/d0d2eee0-0d42-4726-bc4f-dbda0188248d.jpg', NULL, 1, CAST(N'2023-12-28T20:55:34.080' AS DateTime), CAST(N'2023-12-28T20:55:34.080' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (336, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771730/DUANTOTNGHIEP/2191af04-6578-471b-976d-430f19e8c1aa.jpg', NULL, 1, CAST(N'2023-12-28T20:55:34.160' AS DateTime), CAST(N'2023-12-28T20:55:34.160' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (337, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771744/DUANTOTNGHIEP/be5c629e-8ef9-4c69-a7f9-2bb71628b1f0.jpg', NULL, 1, CAST(N'2023-12-28T20:55:47.510' AS DateTime), CAST(N'2023-12-28T20:55:47.510' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (338, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771744/DUANTOTNGHIEP/08a6b1cc-4dd1-4338-af7f-cb10167714bb.jpg', NULL, 1, CAST(N'2023-12-28T20:55:47.577' AS DateTime), CAST(N'2023-12-28T20:55:47.577' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (339, 101, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771744/DUANTOTNGHIEP/8255d569-11c7-4577-b778-db35de7bceb8.jpg', NULL, 1, CAST(N'2023-12-28T20:55:47.693' AS DateTime), CAST(N'2023-12-28T20:55:47.693' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (340, 102, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771809/DUANTOTNGHIEP/73c2063c-4fe1-4a84-b4a7-1b06d2247530.jpg', NULL, 1, CAST(N'2023-12-28T20:56:52.400' AS DateTime), CAST(N'2023-12-28T20:56:52.400' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (341, 102, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771809/DUANTOTNGHIEP/a06338f5-5022-4250-9c32-16cf6b8d1d79.jpg', NULL, 1, CAST(N'2023-12-28T20:56:52.517' AS DateTime), CAST(N'2023-12-28T20:56:52.517' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (342, 102, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771809/DUANTOTNGHIEP/183b23e7-16ea-4074-bbfd-54bba64efcff.jpg', NULL, 1, CAST(N'2023-12-28T20:56:52.980' AS DateTime), CAST(N'2023-12-28T20:56:52.980' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (343, 103, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771848/DUANTOTNGHIEP/67db2fd3-a396-4104-9040-1234974d6e69.jpg', NULL, 1, CAST(N'2023-12-28T20:57:31.347' AS DateTime), CAST(N'2023-12-28T20:57:31.347' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (344, 103, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771848/DUANTOTNGHIEP/77c88e21-d89b-4791-8471-b7a6cb5adfcc.jpg', NULL, 1, CAST(N'2023-12-28T20:57:31.563' AS DateTime), CAST(N'2023-12-28T20:57:31.563' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (345, 103, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771848/DUANTOTNGHIEP/10613fce-892f-4861-93b1-e30d7b5fad85.jpg', NULL, 1, CAST(N'2023-12-28T20:57:31.847' AS DateTime), CAST(N'2023-12-28T20:57:31.847' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (346, 104, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771878/DUANTOTNGHIEP/c19f8c8f-8043-4262-9669-36870f06abef.jpg', NULL, 1, CAST(N'2023-12-28T20:58:01.913' AS DateTime), CAST(N'2023-12-28T20:58:01.913' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (347, 104, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771878/DUANTOTNGHIEP/4b03f09b-4bf7-45a8-a363-95625b052fef.jpg', NULL, 1, CAST(N'2023-12-28T20:58:01.927' AS DateTime), CAST(N'2023-12-28T20:58:01.927' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (348, 104, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771878/DUANTOTNGHIEP/4c79b3a9-07fe-406c-8954-ddc00ac240f6.jpg', NULL, 1, CAST(N'2023-12-28T20:58:02.577' AS DateTime), CAST(N'2023-12-28T20:58:02.577' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (349, 105, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771928/DUANTOTNGHIEP/21363b6c-07e8-4ee2-a5f5-141c511e21b5.jpg', NULL, 1, CAST(N'2023-12-28T20:58:51.233' AS DateTime), CAST(N'2023-12-28T20:58:51.233' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (350, 105, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771928/DUANTOTNGHIEP/ec880999-8b97-4755-ab45-0d67de325920.jpg', NULL, 1, CAST(N'2023-12-28T20:58:51.420' AS DateTime), CAST(N'2023-12-28T20:58:51.420' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (351, 105, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771928/DUANTOTNGHIEP/f078dd3b-0c4a-4cb3-8350-36281a2fcac7.jpg', NULL, 1, CAST(N'2023-12-28T20:58:51.950' AS DateTime), CAST(N'2023-12-28T20:58:51.950' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (352, 106, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771993/DUANTOTNGHIEP/10925f73-21ce-4dd3-899c-b3820cc07744.jpg', NULL, 1, CAST(N'2023-12-28T20:59:56.807' AS DateTime), CAST(N'2023-12-28T20:59:56.807' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (353, 106, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771993/DUANTOTNGHIEP/4b9b0f1e-476b-420e-ab3e-c43e6bc5105f.jpg', NULL, 1, CAST(N'2023-12-28T20:59:56.853' AS DateTime), CAST(N'2023-12-28T20:59:56.853' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (354, 106, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771993/DUANTOTNGHIEP/8d246e48-5e62-4d31-8acc-c14bf9bb33cc.jpg', NULL, 1, CAST(N'2023-12-28T20:59:56.990' AS DateTime), CAST(N'2023-12-28T20:59:56.990' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (355, 106, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771993/DUANTOTNGHIEP/769391f4-da07-46a5-ab12-8de5c343ea53.jpg', NULL, 1, CAST(N'2023-12-28T20:59:56.993' AS DateTime), CAST(N'2023-12-28T20:59:56.993' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (356, 107, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772019/DUANTOTNGHIEP/acd52ab3-0515-4f04-96ab-72a712742150.jpg', NULL, 1, CAST(N'2023-12-28T21:00:23.053' AS DateTime), CAST(N'2023-12-28T21:00:23.053' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (357, 107, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772020/DUANTOTNGHIEP/a754b7f1-ac05-4259-bd70-ce7f3f6bfeb4.jpg', NULL, 1, CAST(N'2023-12-28T21:00:23.103' AS DateTime), CAST(N'2023-12-28T21:00:23.103' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (358, 107, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772020/DUANTOTNGHIEP/408f62af-05cb-4ad5-bc39-e2cdb7b9f07e.jpg', NULL, 1, CAST(N'2023-12-28T21:00:23.433' AS DateTime), CAST(N'2023-12-28T21:00:23.433' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (359, 108, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772094/DUANTOTNGHIEP/6ab12272-95c2-43cf-a90a-f8926b98bc00.jpg', NULL, 1, CAST(N'2023-12-28T21:01:37.270' AS DateTime), CAST(N'2023-12-28T21:01:37.270' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (360, 108, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772094/DUANTOTNGHIEP/7c7fa141-c0a9-4e1e-b671-289363052629.jpg', NULL, 1, CAST(N'2023-12-28T21:01:37.457' AS DateTime), CAST(N'2023-12-28T21:01:37.457' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (361, 108, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772094/DUANTOTNGHIEP/82c60a41-5fae-440b-9ed5-46c33d763500.jpg', NULL, 1, CAST(N'2023-12-28T21:01:37.603' AS DateTime), CAST(N'2023-12-28T21:01:37.603' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (362, 109, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772139/DUANTOTNGHIEP/aae46194-184c-4daa-9cdf-be8f190b8247.jpg', NULL, 1, CAST(N'2023-12-28T21:02:22.087' AS DateTime), CAST(N'2023-12-28T21:02:22.087' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (363, 109, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772139/DUANTOTNGHIEP/e0200817-4975-45f8-98a4-de2df6563dc0.jpg', NULL, 1, CAST(N'2023-12-28T21:02:22.187' AS DateTime), CAST(N'2023-12-28T21:02:22.187' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (364, 109, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772138/DUANTOTNGHIEP/35756d03-bb40-49d6-968d-e606db7019e3.jpg', NULL, 1, CAST(N'2023-12-28T21:02:22.223' AS DateTime), CAST(N'2023-12-28T21:02:22.223' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (365, 110, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772168/DUANTOTNGHIEP/e7d10f98-d8d1-43da-927b-d68b8b349bb6.jpg', NULL, 1, CAST(N'2023-12-28T21:02:51.407' AS DateTime), CAST(N'2023-12-28T21:02:51.407' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (366, 110, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772168/DUANTOTNGHIEP/059e7ea9-25a5-4651-8a7d-fcf85feec9f9.jpg', NULL, 1, CAST(N'2023-12-28T21:02:51.687' AS DateTime), CAST(N'2023-12-28T21:02:51.687' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (367, 110, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772168/DUANTOTNGHIEP/00685f0b-6316-4f82-a8fd-462cc66ec59e.jpg', NULL, 1, CAST(N'2023-12-28T21:02:52.383' AS DateTime), CAST(N'2023-12-28T21:02:52.383' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (368, 111, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772214/DUANTOTNGHIEP/90187847-eea3-4e87-812d-a48c0bf6a7f5.jpg', NULL, 1, CAST(N'2023-12-28T21:03:37.203' AS DateTime), CAST(N'2023-12-28T21:03:37.203' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (369, 111, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772214/DUANTOTNGHIEP/d62894b0-1c28-467b-bb43-919a2d7ce3bd.jpg', NULL, 1, CAST(N'2023-12-28T21:03:37.540' AS DateTime), CAST(N'2023-12-28T21:03:37.540' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (370, 111, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772214/DUANTOTNGHIEP/cd73371f-344b-46d1-be73-225cac56da97.jpg', NULL, 1, CAST(N'2023-12-28T21:03:37.990' AS DateTime), CAST(N'2023-12-28T21:03:37.990' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (371, 112, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772310/DUANTOTNGHIEP/0aade736-d296-43fa-bc78-5f9d49e259e1.jpg', NULL, 1, CAST(N'2023-12-28T21:05:13.590' AS DateTime), CAST(N'2023-12-28T21:05:13.590' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (372, 112, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772310/DUANTOTNGHIEP/132a2d96-92e9-457c-a17f-4ef0d7fec24e.jpg', NULL, 1, CAST(N'2023-12-28T21:05:13.990' AS DateTime), CAST(N'2023-12-28T21:05:13.990' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (373, 112, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772311/DUANTOTNGHIEP/4295779f-f7ce-4445-bc60-5b22be205251.jpg', NULL, 1, CAST(N'2023-12-28T21:05:14.527' AS DateTime), CAST(N'2023-12-28T21:05:14.527' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (374, 112, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772311/DUANTOTNGHIEP/1dac7fc9-414f-4938-a4dd-5849b4387cbf.jpg', NULL, 1, CAST(N'2023-12-28T21:05:14.527' AS DateTime), CAST(N'2023-12-28T21:05:14.527' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (375, 113, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772393/DUANTOTNGHIEP/dcaad82a-18bb-4590-b41b-783a1e4daef1.jpg', NULL, 1, CAST(N'2023-12-28T21:06:36.730' AS DateTime), CAST(N'2023-12-28T21:06:36.730' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (376, 113, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772393/DUANTOTNGHIEP/5c36fd9a-f592-4e43-9ca8-762400c4f012.jpg', NULL, 1, CAST(N'2023-12-28T21:06:36.967' AS DateTime), CAST(N'2023-12-28T21:06:36.967' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (377, 113, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772394/DUANTOTNGHIEP/8ac4482e-1fdf-4093-a565-6f86ac92d636.jpg', NULL, 1, CAST(N'2023-12-28T21:06:37.177' AS DateTime), CAST(N'2023-12-28T21:06:37.177' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (378, 114, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772459/DUANTOTNGHIEP/a284b1e1-8a7d-4e8d-9929-85bf15839b48.jpg', NULL, 1, CAST(N'2023-12-28T21:07:42.163' AS DateTime), CAST(N'2023-12-28T21:07:42.163' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (379, 114, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772459/DUANTOTNGHIEP/9ae9d457-9323-49dc-b02d-88d857e966dc.jpg', NULL, 1, CAST(N'2023-12-28T21:07:42.210' AS DateTime), CAST(N'2023-12-28T21:07:42.210' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (380, 114, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772459/DUANTOTNGHIEP/647c1d21-beb2-45a7-a6da-6ca3b76b3fdf.jpg', NULL, 1, CAST(N'2023-12-28T21:07:42.287' AS DateTime), CAST(N'2023-12-28T21:07:42.287' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (381, 115, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772514/DUANTOTNGHIEP/c4b14e1e-605f-44c1-aeda-383521ec56cc.jpg', NULL, 1, CAST(N'2023-12-28T21:08:37.880' AS DateTime), CAST(N'2023-12-28T21:08:37.880' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (382, 115, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772514/DUANTOTNGHIEP/9eb6fd1f-47e3-4460-a833-a3d40827a188.jpg', NULL, 1, CAST(N'2023-12-28T21:08:38.030' AS DateTime), CAST(N'2023-12-28T21:08:38.030' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (383, 115, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772515/DUANTOTNGHIEP/f1a043c7-dbf1-44b3-842d-ea7447da16f3.jpg', NULL, 1, CAST(N'2023-12-28T21:08:38.270' AS DateTime), CAST(N'2023-12-28T21:08:38.270' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (384, 116, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772541/DUANTOTNGHIEP/4527ce19-3166-49a5-8e09-14f40612682d.jpg', NULL, 1, CAST(N'2023-12-28T21:09:04.880' AS DateTime), CAST(N'2023-12-28T21:09:04.880' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (385, 116, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772541/DUANTOTNGHIEP/2b9193e6-f950-4010-a489-f95de5d9fda0.jpg', NULL, 1, CAST(N'2023-12-28T21:09:05.050' AS DateTime), CAST(N'2023-12-28T21:09:05.050' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (386, 116, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772541/DUANTOTNGHIEP/878a29bf-a214-4858-9d5a-72cda7167d5b.jpg', NULL, 1, CAST(N'2023-12-28T21:09:05.183' AS DateTime), CAST(N'2023-12-28T21:09:05.183' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (387, 117, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772586/DUANTOTNGHIEP/211151a8-12b8-42ba-ad36-a30d2af3035b.jpg', NULL, 1, CAST(N'2023-12-28T21:09:49.030' AS DateTime), CAST(N'2023-12-28T21:09:49.030' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (388, 117, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772586/DUANTOTNGHIEP/feb18a15-dced-4c18-bb1b-4bed50554c27.jpg', NULL, 1, CAST(N'2023-12-28T21:09:49.113' AS DateTime), CAST(N'2023-12-28T21:09:49.113' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (389, 117, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772586/DUANTOTNGHIEP/f9996bcf-5755-4883-9e7a-b20fb1293234.jpg', NULL, 1, CAST(N'2023-12-28T21:09:49.677' AS DateTime), CAST(N'2023-12-28T21:09:49.677' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (390, 118, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772621/DUANTOTNGHIEP/416374aa-9bcb-44ef-9547-fc43cb883dc7.jpg', NULL, 1, CAST(N'2023-12-28T21:10:24.497' AS DateTime), CAST(N'2023-12-28T21:10:24.497' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (391, 118, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772621/DUANTOTNGHIEP/7b714bf9-c772-4ae8-82a0-3e6371e2f36e.jpg', NULL, 1, CAST(N'2023-12-28T21:10:24.893' AS DateTime), CAST(N'2023-12-28T21:10:24.893' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (392, 118, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772622/DUANTOTNGHIEP/18fac1c6-4b38-4d42-95ef-73646f88e84a.jpg', NULL, 1, CAST(N'2023-12-28T21:10:25.313' AS DateTime), CAST(N'2023-12-28T21:10:25.313' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (393, 119, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704027390/DUANTOTNGHIEP/6fe6732a-87eb-4fb0-8f42-4f252af954b2.jpg', NULL, 1, CAST(N'2023-12-31T19:56:31.650' AS DateTime), CAST(N'2023-12-31T19:56:31.650' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (394, 120, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704027390/DUANTOTNGHIEP/6fe6732a-87eb-4fb0-8f42-4f252af954b2.jpg', NULL, 1, CAST(N'2023-12-31T19:56:31.660' AS DateTime), CAST(N'2023-12-31T19:56:31.660' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (395, 121, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217845/DUANTOTNGHIEP/3e37f62d-1b8b-4958-b62e-498ee2196182.jpg', NULL, 1, CAST(N'2024-01-03T00:50:46.377' AS DateTime), CAST(N'2024-01-03T00:50:46.377' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (396, 122, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217845/DUANTOTNGHIEP/3e37f62d-1b8b-4958-b62e-498ee2196182.jpg', NULL, 1, CAST(N'2024-01-03T00:50:46.390' AS DateTime), CAST(N'2024-01-03T00:50:46.390' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (397, 123, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217845/DUANTOTNGHIEP/3e37f62d-1b8b-4958-b62e-498ee2196182.jpg', NULL, 1, CAST(N'2024-01-03T00:50:46.390' AS DateTime), CAST(N'2024-01-03T00:50:46.390' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (398, 124, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217845/DUANTOTNGHIEP/3e37f62d-1b8b-4958-b62e-498ee2196182.jpg', NULL, 1, CAST(N'2024-01-03T00:50:46.390' AS DateTime), CAST(N'2024-01-03T00:50:46.390' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (399, 121, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217846/DUANTOTNGHIEP/6a64f5f8-8c5c-46ff-b174-35e0ab97bd00.jpg', NULL, 1, CAST(N'2024-01-03T00:50:47.137' AS DateTime), CAST(N'2024-01-03T00:50:47.137' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (400, 122, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217846/DUANTOTNGHIEP/6a64f5f8-8c5c-46ff-b174-35e0ab97bd00.jpg', NULL, 1, CAST(N'2024-01-03T00:50:47.143' AS DateTime), CAST(N'2024-01-03T00:50:47.143' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (401, 123, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217846/DUANTOTNGHIEP/6a64f5f8-8c5c-46ff-b174-35e0ab97bd00.jpg', NULL, 1, CAST(N'2024-01-03T00:50:47.150' AS DateTime), CAST(N'2024-01-03T00:50:47.150' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (402, 124, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217846/DUANTOTNGHIEP/6a64f5f8-8c5c-46ff-b174-35e0ab97bd00.jpg', NULL, 1, CAST(N'2024-01-03T00:50:47.150' AS DateTime), CAST(N'2024-01-03T00:50:47.150' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (403, 121, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217850/DUANTOTNGHIEP/351fae18-7cae-4848-a55e-2eaf6ca3a1c0.jpg', NULL, 1, CAST(N'2024-01-03T00:50:51.477' AS DateTime), CAST(N'2024-01-03T00:50:51.477' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (404, 122, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217850/DUANTOTNGHIEP/351fae18-7cae-4848-a55e-2eaf6ca3a1c0.jpg', NULL, 1, CAST(N'2024-01-03T00:50:51.477' AS DateTime), CAST(N'2024-01-03T00:50:51.477' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (405, 123, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217850/DUANTOTNGHIEP/351fae18-7cae-4848-a55e-2eaf6ca3a1c0.jpg', NULL, 1, CAST(N'2024-01-03T00:50:51.477' AS DateTime), CAST(N'2024-01-03T00:50:51.477' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (406, 124, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217850/DUANTOTNGHIEP/351fae18-7cae-4848-a55e-2eaf6ca3a1c0.jpg', NULL, 1, CAST(N'2024-01-03T00:50:51.487' AS DateTime), CAST(N'2024-01-03T00:50:51.487' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (407, 119, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217952/DUANTOTNGHIEP/e2983bf7-5804-4775-934b-41b41b58e3bb.jpg', NULL, 1, CAST(N'2024-01-03T00:52:33.250' AS DateTime), CAST(N'2024-01-03T00:52:33.250' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (408, 120, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217953/DUANTOTNGHIEP/5732a08d-560c-4712-b8e1-95f7639b5961.jpg', NULL, 1, CAST(N'2024-01-03T00:52:33.870' AS DateTime), CAST(N'2024-01-03T00:52:33.870' AS DateTime), 0)
INSERT [dbo].[image] ([id], [id_product_detail], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (409, 120, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217953/DUANTOTNGHIEP/f90e296b-21f3-4b00-b8d0-6489703def18.jpg', NULL, 1, CAST(N'2024-01-03T00:52:34.863' AS DateTime), CAST(N'2024-01-03T00:52:34.863' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[image_product] ON 

INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (4, 15, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513232/DUANTOTNGHIEP/b0896608-1571-4343-a3e6-976179d4946d.jpg', NULL, 0, CAST(N'2023-12-25T21:07:14.817' AS DateTime), CAST(N'2023-12-25T21:07:14.817' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (5, 16, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513345/DUANTOTNGHIEP/585a5711-04c2-4457-8050-20f5f9b2a1ce.jpg', NULL, 0, CAST(N'2023-12-25T21:09:08.477' AS DateTime), CAST(N'2023-12-25T21:09:08.477' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (6, 17, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703513482/DUANTOTNGHIEP/e5cb893d-a739-47fc-9bc6-9be7e527b3f0.jpg', NULL, 0, CAST(N'2023-12-25T21:11:25.450' AS DateTime), CAST(N'2023-12-25T21:11:25.450' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (7, 31, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519808/DUANTOTNGHIEP/1864f68b-529c-46db-bb84-9706dc51d362.jpg', NULL, 0, CAST(N'2023-12-25T22:56:50.863' AS DateTime), CAST(N'2023-12-25T22:56:50.863' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (8, 30, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519849/DUANTOTNGHIEP/09f3677d-de16-4738-877f-3db59896c0b2.jpg', NULL, 0, CAST(N'2023-12-25T22:57:32.107' AS DateTime), CAST(N'2023-12-25T22:57:32.107' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (9, 29, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703519973/DUANTOTNGHIEP/b808b2ba-5bde-4bf0-b367-9bda92d6b2ee.jpg', NULL, 0, CAST(N'2023-12-25T22:59:36.147' AS DateTime), CAST(N'2023-12-25T22:59:36.147' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (10, 27, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520069/DUANTOTNGHIEP/fd394bfe-ecd6-477f-a2e2-a7d4db06b6eb.jpg', NULL, 0, CAST(N'2023-12-25T23:01:12.847' AS DateTime), CAST(N'2023-12-25T23:01:12.847' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (11, 26, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520214/DUANTOTNGHIEP/8d4c9b23-c5d5-413d-8b07-c6c2111f1520.jpg', NULL, 0, CAST(N'2023-12-25T23:03:37.573' AS DateTime), CAST(N'2023-12-25T23:03:37.573' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (12, 25, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520334/DUANTOTNGHIEP/9b457db3-c369-44e9-964a-1160585ab817.jpg', NULL, 0, CAST(N'2023-12-25T23:05:37.433' AS DateTime), CAST(N'2023-12-25T23:05:37.433' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (13, 25, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520334/DUANTOTNGHIEP/ed2f87dd-3e02-479d-8fa7-c91a6de470d5.jpg', NULL, 0, CAST(N'2023-12-25T23:05:37.480' AS DateTime), CAST(N'2023-12-25T23:05:37.480' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (14, 25, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703520335/DUANTOTNGHIEP/6be87d51-7409-4919-a847-0304f865c1e2.jpg', NULL, 0, CAST(N'2023-12-25T23:05:37.963' AS DateTime), CAST(N'2023-12-25T23:05:37.963' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (15, 31, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525044/DUANTOTNGHIEP/5ec3c731-07c3-4ab5-8711-a71a9529f3e5.jpg', NULL, 0, CAST(N'2023-12-26T00:24:07.160' AS DateTime), CAST(N'2023-12-26T00:24:07.160' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (16, 31, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525044/DUANTOTNGHIEP/ec871dc5-ccfb-462b-be7b-ca51af400ac8.jpg', NULL, 0, CAST(N'2023-12-26T00:24:07.167' AS DateTime), CAST(N'2023-12-26T00:24:07.167' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (17, 31, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525044/DUANTOTNGHIEP/00ab2a95-4d56-4545-b2f5-9a6b0f1099e6.jpg', NULL, 0, CAST(N'2023-12-26T00:24:07.440' AS DateTime), CAST(N'2023-12-26T00:24:07.440' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (18, 21, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525173/DUANTOTNGHIEP/9968bb42-baff-40d9-82e8-575a7ae5a63c.jpg', NULL, 0, CAST(N'2023-12-26T00:26:16.033' AS DateTime), CAST(N'2023-12-26T00:26:16.033' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (19, 21, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525173/DUANTOTNGHIEP/55bdfb8a-8d2e-4bea-b708-139189783144.jpg', NULL, 0, CAST(N'2023-12-26T00:26:16.160' AS DateTime), CAST(N'2023-12-26T00:26:16.160' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (20, 21, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525173/DUANTOTNGHIEP/263dc461-dbf1-41ca-a45e-999a7b09e9e9.jpg', NULL, 0, CAST(N'2023-12-26T00:26:16.377' AS DateTime), CAST(N'2023-12-26T00:26:16.377' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (21, 21, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525173/DUANTOTNGHIEP/848860bd-d61a-4cc8-a2d4-8613cc3316f7.jpg', NULL, 0, CAST(N'2023-12-26T00:26:16.423' AS DateTime), CAST(N'2023-12-26T00:26:16.423' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (22, 22, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525251/DUANTOTNGHIEP/961a4c9f-4da5-4ab1-b11f-9c03c132bdba.jpg', NULL, 0, CAST(N'2023-12-26T00:27:34.480' AS DateTime), CAST(N'2023-12-26T00:27:34.480' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (23, 22, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525251/DUANTOTNGHIEP/bff3c16f-82e1-44ec-8ade-f7e3b3090ce4.jpg', NULL, 0, CAST(N'2023-12-26T00:27:34.653' AS DateTime), CAST(N'2023-12-26T00:27:34.653' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (24, 22, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525251/DUANTOTNGHIEP/8d00cb11-a83a-407e-8d4b-40be2ab52602.jpg', NULL, 0, CAST(N'2023-12-26T00:27:34.737' AS DateTime), CAST(N'2023-12-26T00:27:34.737' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (25, 22, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525252/DUANTOTNGHIEP/a38fcc4c-96da-4152-be42-0c1eca21ce36.jpg', NULL, 0, CAST(N'2023-12-26T00:27:34.897' AS DateTime), CAST(N'2023-12-26T00:27:34.897' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (26, 23, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525317/DUANTOTNGHIEP/3718671a-f7e1-4222-a8c2-3eda5d26e0ae.jpg', NULL, 0, CAST(N'2023-12-26T00:28:39.953' AS DateTime), CAST(N'2023-12-26T00:28:39.953' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (27, 23, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525317/DUANTOTNGHIEP/fe23eaa0-4d3b-47f2-9710-1ce3bf00b716.jpg', NULL, 0, CAST(N'2023-12-26T00:28:39.963' AS DateTime), CAST(N'2023-12-26T00:28:39.963' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (28, 23, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525317/DUANTOTNGHIEP/1d5fee9f-f917-49e0-bf9f-7ddabf127289.jpg', NULL, 0, CAST(N'2023-12-26T00:28:40.153' AS DateTime), CAST(N'2023-12-26T00:28:40.153' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (29, 24, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525384/DUANTOTNGHIEP/0be28f22-5576-47f5-a78e-24f3667d445d.jpg', NULL, 0, CAST(N'2023-12-26T00:29:47.227' AS DateTime), CAST(N'2023-12-26T00:29:47.227' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (30, 24, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525384/DUANTOTNGHIEP/d6c55652-0a2a-4454-956a-414d32912a7a.jpg', NULL, 0, CAST(N'2023-12-26T00:29:47.380' AS DateTime), CAST(N'2023-12-26T00:29:47.380' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (31, 24, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525384/DUANTOTNGHIEP/9606eaf6-3bb7-40c7-8ebb-c80691d80e7e.jpg', NULL, 0, CAST(N'2023-12-26T00:29:47.533' AS DateTime), CAST(N'2023-12-26T00:29:47.533' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (32, 30, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525455/DUANTOTNGHIEP/ab27a37c-3280-444e-a600-d8c53a252af2.jpg', NULL, 0, CAST(N'2023-12-26T00:30:59.007' AS DateTime), CAST(N'2023-12-26T00:30:59.007' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (33, 30, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703525456/DUANTOTNGHIEP/def2d1f7-1aa4-4f49-bd42-9b82daf4da86.jpg', NULL, 0, CAST(N'2023-12-26T00:30:59.377' AS DateTime), CAST(N'2023-12-26T00:30:59.377' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (34, 20, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526113/DUANTOTNGHIEP/11edcaa9-ffda-4c5e-b07e-9d2216cf1dc7.jpg', NULL, 0, CAST(N'2023-12-26T00:41:56.383' AS DateTime), CAST(N'2023-12-26T00:41:56.383' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (35, 20, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526115/DUANTOTNGHIEP/8b1f0d96-0374-43e3-975a-cf5d14262059.jpg', NULL, 0, CAST(N'2023-12-26T00:41:57.963' AS DateTime), CAST(N'2023-12-26T00:41:57.963' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (36, 20, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526115/DUANTOTNGHIEP/b101c2ca-4473-438e-8eba-59e891998191.jpg', NULL, 0, CAST(N'2023-12-26T00:41:58.053' AS DateTime), CAST(N'2023-12-26T00:41:58.053' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (37, 19, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526142/DUANTOTNGHIEP/53855ec6-f7fd-47df-af2b-4a7861e8d6b1.jpg', NULL, 0, CAST(N'2023-12-26T00:42:25.430' AS DateTime), CAST(N'2023-12-26T00:42:25.430' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (38, 19, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526142/DUANTOTNGHIEP/a5b6a655-86ce-46b4-a1fe-141b38874f68.jpg', NULL, 0, CAST(N'2023-12-26T00:42:25.560' AS DateTime), CAST(N'2023-12-26T00:42:25.560' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (39, 19, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526142/DUANTOTNGHIEP/08e2ce33-5d41-4857-8a50-fe4b9c387461.jpg', NULL, 0, CAST(N'2023-12-26T00:42:25.747' AS DateTime), CAST(N'2023-12-26T00:42:25.747' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (40, 18, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526166/DUANTOTNGHIEP/c07cf612-e0e4-4379-a42c-63b2666ad41f.jpg', NULL, 0, CAST(N'2023-12-26T00:42:49.343' AS DateTime), CAST(N'2023-12-26T00:42:49.343' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (41, 18, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526166/DUANTOTNGHIEP/b0bba66e-2ead-429a-afbc-b8f48af39607.jpg', NULL, 0, CAST(N'2023-12-26T00:42:49.600' AS DateTime), CAST(N'2023-12-26T00:42:49.600' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (42, 18, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526167/DUANTOTNGHIEP/5b8985d6-f872-4d14-a2c7-79bdf4e07dc6.jpg', NULL, 0, CAST(N'2023-12-26T00:42:50.297' AS DateTime), CAST(N'2023-12-26T00:42:50.297' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (43, 15, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526215/DUANTOTNGHIEP/4443952c-e905-4966-a623-c22736cba5c0.jpg', NULL, 0, CAST(N'2023-12-26T00:43:37.990' AS DateTime), CAST(N'2023-12-26T00:43:37.990' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (44, 15, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526215/DUANTOTNGHIEP/78892a49-773a-480c-a0bc-368b372f8d16.jpg', NULL, 0, CAST(N'2023-12-26T00:43:38.540' AS DateTime), CAST(N'2023-12-26T00:43:38.540' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (45, 14, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526229/DUANTOTNGHIEP/1030fdf2-3ca2-49ff-b502-484649762aa2.jpg', NULL, 0, CAST(N'2023-12-26T00:43:52.550' AS DateTime), CAST(N'2023-12-26T00:43:52.550' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (46, 32, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526393/DUANTOTNGHIEP/bdbf1269-6a8c-48c4-a943-a3afe145b5dd.jpg', NULL, 0, CAST(N'2023-12-26T00:46:36.540' AS DateTime), CAST(N'2023-12-26T00:46:36.540' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (47, 32, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526394/DUANTOTNGHIEP/5e177f75-ceba-4f1b-98d4-264f60c01038.jpg', NULL, 0, CAST(N'2023-12-26T00:46:36.837' AS DateTime), CAST(N'2023-12-26T00:46:36.837' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (48, 32, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526393/DUANTOTNGHIEP/18df51ed-8b46-4b9b-8e28-735b15931aa2.jpg', NULL, 0, CAST(N'2023-12-26T00:46:36.900' AS DateTime), CAST(N'2023-12-26T00:46:36.900' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (49, 33, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526546/DUANTOTNGHIEP/1e6cd74b-0553-40e3-8f4c-b2254ad9f5a9.jpg', NULL, 0, CAST(N'2023-12-26T00:49:09.457' AS DateTime), CAST(N'2023-12-26T00:49:09.457' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (50, 33, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526546/DUANTOTNGHIEP/1679e036-f88e-46f5-9ae8-1e58dec74fba.jpg', NULL, 0, CAST(N'2023-12-26T00:49:09.527' AS DateTime), CAST(N'2023-12-26T00:49:09.527' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (51, 33, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526546/DUANTOTNGHIEP/fee187aa-b702-447c-a08a-efbb27f6cfd4.jpg', NULL, 0, CAST(N'2023-12-26T00:49:09.837' AS DateTime), CAST(N'2023-12-26T00:49:09.837' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (52, 34, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703526742/DUANTOTNGHIEP/83a36df9-289d-48fd-89c8-b4af10b49e76.jpg', NULL, 0, CAST(N'2023-12-26T00:52:24.943' AS DateTime), CAST(N'2023-12-26T00:52:24.943' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (53, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703688860/DUANTOTNGHIEP/4f568019-86bb-462a-bc46-c5201e50a5c1.jpg', NULL, 0, CAST(N'2023-12-27T21:54:22.283' AS DateTime), CAST(N'2023-12-27T21:54:22.283' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (54, 36, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771666/DUANTOTNGHIEP/a0e998e1-fa16-4659-897a-49341cd3b831.jpg', NULL, 0, CAST(N'2023-12-28T20:54:29.217' AS DateTime), CAST(N'2023-12-28T20:54:29.217' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (55, 36, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771666/DUANTOTNGHIEP/159324a9-513d-4999-8601-6552ce9c4f48.jpg', NULL, 0, CAST(N'2023-12-28T20:54:30.030' AS DateTime), CAST(N'2023-12-28T20:54:30.030' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (56, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771691/DUANTOTNGHIEP/5d1a03cc-1d6d-4c7e-ac05-39036af5ebe6.jpg', NULL, 0, CAST(N'2023-12-28T20:54:54.077' AS DateTime), CAST(N'2023-12-28T20:54:54.077' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (57, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771691/DUANTOTNGHIEP/57b9d309-f67a-4cea-ba47-d5aca875467d.jpg', NULL, 0, CAST(N'2023-12-28T20:54:54.087' AS DateTime), CAST(N'2023-12-28T20:54:54.087' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (58, 35, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703771691/DUANTOTNGHIEP/c64c2ea6-fca9-4c8a-bcd6-de4a61901782.jpg', NULL, 0, CAST(N'2023-12-28T20:54:54.487' AS DateTime), CAST(N'2023-12-28T20:54:54.487' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (59, 26, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772464/DUANTOTNGHIEP/1e814e0c-4c3b-4ce4-819d-88470b174089.jpg', NULL, 0, CAST(N'2023-12-28T21:07:47.607' AS DateTime), CAST(N'2023-12-28T21:07:47.607' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (60, 26, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772464/DUANTOTNGHIEP/6428f5c8-a650-4963-86d9-7fc8c68c05b3.jpg', NULL, 0, CAST(N'2023-12-28T21:07:47.677' AS DateTime), CAST(N'2023-12-28T21:07:47.677' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (61, 26, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772465/DUANTOTNGHIEP/9ea5df57-3d7a-4def-9b8d-0682c16b2edf.jpg', NULL, 0, CAST(N'2023-12-28T21:07:48.363' AS DateTime), CAST(N'2023-12-28T21:07:48.363' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (62, 27, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772478/DUANTOTNGHIEP/35c85534-f00a-4975-96e0-53e19c488296.jpg', NULL, 0, CAST(N'2023-12-28T21:08:01.530' AS DateTime), CAST(N'2023-12-28T21:08:01.530' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (63, 27, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772478/DUANTOTNGHIEP/ab945345-f682-404d-ad64-31a02b4218b2.jpg', NULL, 0, CAST(N'2023-12-28T21:08:01.743' AS DateTime), CAST(N'2023-12-28T21:08:01.743' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (64, 27, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1703772478/DUANTOTNGHIEP/af0199b2-8d54-412d-969d-958761c57f8e.jpg', NULL, 0, CAST(N'2023-12-28T21:08:01.963' AS DateTime), CAST(N'2023-12-28T21:08:01.963' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (65, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217957/DUANTOTNGHIEP/95504558-9b69-42fc-bd7f-aba9a22578ca.jpg', NULL, 0, CAST(N'2024-01-03T00:52:37.637' AS DateTime), CAST(N'2024-01-03T00:52:37.637' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (66, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217958/DUANTOTNGHIEP/f01feb20-8e7e-479d-bd23-11f207ae872b.jpg', NULL, 0, CAST(N'2024-01-03T00:52:38.793' AS DateTime), CAST(N'2024-01-03T00:52:38.793' AS DateTime), 0)
INSERT [dbo].[image_product] ([id], [id_product], [image], [discription], [status], [created_at], [update_at], [deleted]) VALUES (67, 37, N'http://res.cloudinary.com/da30qcqmf/image/upload/v1704217958/DUANTOTNGHIEP/b8af6c7c-241b-49ce-8303-f37121c70d1a.jpg', NULL, 0, CAST(N'2024-01-03T00:52:39.300' AS DateTime), CAST(N'2024-01-03T00:52:39.300' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[image_product] OFF
GO
SET IDENTITY_INSERT [dbo].[material] ON 

INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (1, N'CL1', N'Len', CAST(N'2023-12-19T23:54:25.220' AS DateTime), CAST(N'2023-12-19T23:54:25.220' AS DateTime), 1, 0)
INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (2, N'CL2', N'Thổ cẩm', CAST(N'2023-12-19T23:54:30.873' AS DateTime), CAST(N'2023-12-19T23:54:30.873' AS DateTime), 1, 0)
INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (3, N'CL3', N'Nhung', CAST(N'2023-12-19T23:54:41.013' AS DateTime), CAST(N'2023-12-19T23:54:41.013' AS DateTime), 1, 0)
INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (4, N'CL4', N'Lụa', CAST(N'2023-12-19T23:54:45.500' AS DateTime), CAST(N'2023-12-19T23:54:45.500' AS DateTime), 1, 0)
INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (5, N'CL5', N'Cotton', CAST(N'2023-12-19T23:55:34.753' AS DateTime), CAST(N'2023-12-19T23:55:34.753' AS DateTime), 1, 0)
INSERT [dbo].[material] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (6, N'CL6', N'cl 111', CAST(N'2023-12-31T18:07:39.643' AS DateTime), CAST(N'2023-12-31T18:07:45.687' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[material] OFF
GO
SET IDENTITY_INSERT [dbo].[origin] ON 

INSERT [dbo].[origin] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (1, N'XX1', N'Hàn Quốc', CAST(N'2023-12-20T00:01:28.433' AS DateTime), CAST(N'2023-12-20T00:01:28.433' AS DateTime), 1, 0)
INSERT [dbo].[origin] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (2, N'XX2', N'Thái Lan', CAST(N'2023-12-20T00:01:33.333' AS DateTime), CAST(N'2023-12-20T00:01:33.333' AS DateTime), 1, 0)
INSERT [dbo].[origin] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (3, N'XX3', N'Pháp', CAST(N'2023-12-20T00:01:39.620' AS DateTime), CAST(N'2023-12-20T00:01:39.620' AS DateTime), 1, 0)
INSERT [dbo].[origin] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (4, N'XX4', N'Việt Nam', CAST(N'2023-12-20T00:01:56.610' AS DateTime), CAST(N'2023-12-20T00:01:56.610' AS DateTime), 1, 0)
INSERT [dbo].[origin] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (5, N'XX5', N'Test xxx', CAST(N'2023-12-31T18:00:36.447' AS DateTime), CAST(N'2023-12-31T18:00:44.140' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[origin] OFF
GO
SET IDENTITY_INSERT [dbo].[pattern] ON 

INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (1, N'HoaVan1', N'Hoa lá', CAST(N'2023-12-20T00:00:49.747' AS DateTime), CAST(N'2023-12-20T00:00:49.747' AS DateTime), 1, 0)
INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (2, N'HoaVan2', N'Kẻ sọc', CAST(N'2023-12-20T00:00:57.170' AS DateTime), CAST(N'2023-12-20T00:00:57.170' AS DateTime), 1, 0)
INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (3, N'HoaVan3', N'In hoa', CAST(N'2023-12-20T00:01:02.580' AS DateTime), CAST(N'2023-12-20T00:01:02.580' AS DateTime), 1, 0)
INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (4, N'HoaVan4', N'Trơn', CAST(N'2023-12-20T00:01:10.440' AS DateTime), CAST(N'2023-12-31T17:33:44.343' AS DateTime), 1, 0)
INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (5, N'HoaVan5', N'Hình khối', CAST(N'2023-12-20T00:01:17.277' AS DateTime), CAST(N'2023-12-31T17:33:30.147' AS DateTime), 1, 0)
INSERT [dbo].[pattern] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (9, N'HoaVan6', N'Test11', CAST(N'2023-12-31T18:00:12.697' AS DateTime), CAST(N'2023-12-31T18:00:17.663' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[pattern] OFF
GO
SET IDENTITY_INSERT [dbo].[pay] ON 

INSERT [dbo].[pay] ([id], [payment_method], [status], [created_at], [update_at], [deleted]) VALUES (1, N'CASH', 1, CAST(N'2023-12-19T23:31:49.653' AS DateTime), CAST(N'2023-12-19T23:31:49.653' AS DateTime), 0)
INSERT [dbo].[pay] ([id], [payment_method], [status], [created_at], [update_at], [deleted]) VALUES (2, N'TRANSFER', 1, CAST(N'2023-12-19T23:31:49.683' AS DateTime), CAST(N'2023-12-19T23:31:49.683' AS DateTime), 0)
INSERT [dbo].[pay] ([id], [payment_method], [status], [created_at], [update_at], [deleted]) VALUES (3, N'COUNTER', 1, CAST(N'2023-12-19T23:31:49.683' AS DateTime), CAST(N'2023-12-19T23:31:49.683' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[pay] OFF
GO
SET IDENTITY_INSERT [dbo].[pay_detail] ON 

INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (4, 6, 1, CAST(200000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (5, 6, 2, CAST(50000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (6, 16, 1, CAST(150000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (16, 26, 1, CAST(7000000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (17, 27, 1, CAST(7000000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (18, 28, 1, CAST(7000000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (19, 36, 1, CAST(800000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (20, 37, 1, CAST(450000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (21, 38, 1, CAST(300000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (22, 39, 1, CAST(1400000.000 AS Decimal(20, 3)), 1)
INSERT [dbo].[pay_detail] ([id], [id_bill], [id_pay], [total_money], [status]) VALUES (23, 55, 1, CAST(5500000.000 AS Decimal(20, 3)), 1)
SET IDENTITY_INSERT [dbo].[pay_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (14, NULL, N'Khăn choàng vuông họa tiết cao cấp', 1, CAST(N'2023-12-25T20:59:21.510' AS DateTime), CAST(N'2023-12-25T20:59:21.600' AS DateTime), 0, 4, 1, NULL, NULL, 1, 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (15, NULL, N'Khăn choàng cổ dạng chăn in hình', 1, CAST(N'2023-12-25T21:06:18.680' AS DateTime), CAST(N'2023-12-25T21:06:18.720' AS DateTime), 0, 3, 2, NULL, NULL, 2, 2, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (16, NULL, N'Khăn choàng đạ cashmere thêu cao cấp', 1, CAST(N'2023-12-25T21:08:14.830' AS DateTime), CAST(N'2023-12-25T21:08:14.880' AS DateTime), 0, 2, 3, NULL, NULL, 3, 3, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (17, NULL, N'Khăn choàng lụa hàng châu phiên bản mới', 1, CAST(N'2023-12-25T21:10:50.670' AS DateTime), CAST(N'2023-12-25T21:10:50.717' AS DateTime), 0, 5, 5, NULL, NULL, 4, 3, 4)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (18, NULL, N'Khăn choàng cổ len mềm mịn ấm áp', 1, CAST(N'2023-12-25T21:12:06.480' AS DateTime), CAST(N'2023-12-25T21:12:06.520' AS DateTime), 0, 6, 3, NULL, NULL, 2, 3, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (19, NULL, N'Khăn choàng len quàng cổ mùa đông', 1, CAST(N'2023-12-25T21:12:46.410' AS DateTime), CAST(N'2023-12-25T21:12:46.460' AS DateTime), 0, 3, 4, NULL, NULL, 3, 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (20, NULL, N'Khăn choàng cổ dạ len trơn unisex', 1, CAST(N'2023-12-25T21:13:49.190' AS DateTime), CAST(N'2023-12-25T21:13:49.240' AS DateTime), 0, 4, 2, NULL, NULL, 3, 4, 1)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (21, NULL, N'Khăn Choàng cổ nữ jussy fashion', 1, CAST(N'2023-12-25T21:15:04.260' AS DateTime), CAST(N'2023-12-25T21:15:04.317' AS DateTime), 0, 3, 3, NULL, NULL, 1, 3, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (22, NULL, N'Khăn choàng nữ thời trang cao cấp', 1, CAST(N'2023-12-25T21:16:27.880' AS DateTime), CAST(N'2023-12-25T21:16:27.940' AS DateTime), 0, 3, 5, NULL, NULL, 2, 4, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (23, NULL, N'Khăn choàng boho đi biển thổ cẩm', 1, CAST(N'2023-12-25T21:18:24.550' AS DateTime), CAST(N'2023-12-25T21:18:24.617' AS DateTime), 0, 4, 3, NULL, NULL, 1, 2, 1)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (24, NULL, N'Khăn choàng lụa hàng châu cao cấp', 1, CAST(N'2023-12-25T21:19:58.173' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 2, 2, NULL, NULL, 3, 4, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (25, NULL, N'Khăn choàng cổ voan lụa kim tuyến', 1, CAST(N'2023-12-25T21:21:43.567' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 4, 2, NULL, NULL, 1, 1, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (26, NULL, N'Khăn choàng cổ đi biển dáng dài', 1, CAST(N'2023-12-25T21:23:05.440' AS DateTime), CAST(N'2023-12-25T21:23:05.510' AS DateTime), 0, 6, 3, NULL, NULL, 4, 5, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (27, NULL, N'Khăn choàng len dạ boho họa tiết', 1, CAST(N'2023-12-25T21:24:44.750' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 4, 5, NULL, NULL, 4, 3, 4)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (29, NULL, N'Khăn choàng cổ len dạ lông thỏ', 1, CAST(N'2023-12-25T21:27:44.920' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 6, 2, NULL, NULL, 1, 4, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (30, NULL, N'Khăn choàng cổ caro mềm mịn, dày ấm', 1, CAST(N'2023-12-25T21:29:08.213' AS DateTime), CAST(N'2023-12-25T21:29:08.260' AS DateTime), 0, 3, 5, NULL, NULL, 1, 3, 3)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (31, NULL, N'Khăn choàng lụa thêu tay hoa sen', 1, CAST(N'2023-12-25T21:36:52.710' AS DateTime), CAST(N'2023-12-25T21:36:52.770' AS DateTime), 0, 3, 2, NULL, NULL, 4, 2, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (32, NULL, N'Khăn choàng cổ trơn nam nữ bản to', 1, CAST(N'2023-12-26T00:46:03.313' AS DateTime), CAST(N'2023-12-26T00:46:03.457' AS DateTime), 0, 3, 2, NULL, NULL, 3, 3, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (33, NULL, N'Khăn choàng cổ len cashmere', 1, CAST(N'2023-12-26T00:48:33.007' AS DateTime), CAST(N'2023-12-26T00:48:33.040' AS DateTime), 0, 6, 1, NULL, NULL, 1, 4, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (34, NULL, N'Khăn choàng cashmere dài tua rua mềm mại', 1, CAST(N'2023-12-26T00:51:19.320' AS DateTime), CAST(N'2023-12-26T00:51:19.353' AS DateTime), 0, 5, 2, NULL, NULL, 4, 2, 1)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (35, NULL, N'Khăn choàng Linen phong cách Hàn Quốc cao', 1, CAST(N'2023-12-27T21:52:18.233' AS DateTime), CAST(N'2023-12-27T21:54:44.550' AS DateTime), 0, 3, 2, NULL, NULL, 1, 1, 1)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (36, NULL, N'Khăn choàng cổ Chanel', 1, CAST(N'2023-12-28T20:53:26.327' AS DateTime), CAST(N'2023-12-28T20:53:26.507' AS DateTime), 0, 4, 2, NULL, NULL, 1, 1, 1)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (37, NULL, N'Khăn choàng dạ tiệc', 1, CAST(N'2023-12-31T19:56:28.550' AS DateTime), CAST(N'2024-01-03T00:52:34.857' AS DateTime), 0, 2, 1, NULL, NULL, 3, 2, 2)
INSERT [dbo].[product] ([id], [code], [name], [status], [created_at], [updated_at], [deleted], [id_style], [id_material], [id_color], [id__category], [id_origin], [id_brand], [id_category]) VALUES (38, NULL, N'Khăn choàng Cashmere len dài', 1, CAST(N'2024-01-03T00:50:43.070' AS DateTime), CAST(N'2024-01-03T00:50:43.163' AS DateTime), 0, 3, 2, NULL, NULL, 1, 2, 3)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_detail] ON 

INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (35, N'SP0001', N'Khăn choàng vuông họa tiết cao cấp', CAST(150000.000 AS Decimal(20, 3)), 26, N'', 1, 2, 1, CAST(N'2023-12-25T20:59:21.550' AS DateTime), CAST(N'2024-01-02T00:20:43.487' AS DateTime), 0, 14)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (36, N'SP0002', N'Khăn choàng cổ dạng chăn in hình', CAST(250000.000 AS Decimal(20, 3)), 84, N'', 3, 3, 1, CAST(N'2023-12-25T21:06:18.690' AS DateTime), CAST(N'2024-01-03T01:03:47.767' AS DateTime), 0, 15)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (37, N'SP0003', N'Khăn choàng đạ cashmere thêu cao cấp', CAST(120000.000 AS Decimal(20, 3)), 77, N'', 5, 5, 1, CAST(N'2023-12-25T21:08:14.850' AS DateTime), CAST(N'2024-01-02T01:18:10.023' AS DateTime), 0, 16)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (38, N'SP0004', N'Khăn choàng lụa hàng châu phiên bản mới', CAST(210000.000 AS Decimal(20, 3)), 99, N'', 2, 6, 1, CAST(N'2023-12-25T21:10:50.680' AS DateTime), CAST(N'2023-12-27T18:49:34.190' AS DateTime), 0, 17)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (39, N'SP0005', N'Khăn choàng cổ len mềm mịn ấm áp', CAST(180000.000 AS Decimal(20, 3)), 93, N'', 1, 3, 1, CAST(N'2023-12-25T21:12:06.497' AS DateTime), CAST(N'2023-12-27T18:56:26.150' AS DateTime), 0, 18)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (40, N'SP0006', N'Khăn choàng len quàng cổ mùa đông', CAST(350000.000 AS Decimal(20, 3)), 5, N'', 3, 4, 1, CAST(N'2023-12-25T21:12:46.420' AS DateTime), CAST(N'2023-12-25T21:12:46.460' AS DateTime), 0, 19)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (41, N'SP0007', N'Khăn choàng cổ dạ len trơn unisex', CAST(190000.000 AS Decimal(20, 3)), 74, N'', 2, 5, 1, CAST(N'2023-12-25T21:13:49.200' AS DateTime), CAST(N'2024-01-02T12:45:30.367' AS DateTime), 0, 20)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (42, N'SP0008', N'Khăn choàng cổ dạ len trơn unisex', CAST(250000.000 AS Decimal(20, 3)), 111, N'', 4, 4, 1, CAST(N'2023-12-25T21:13:49.240' AS DateTime), CAST(N'2024-01-02T12:45:30.337' AS DateTime), 0, 20)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (43, N'SP0009', N'Khăn Choàng cổ nữ jussy fashion', CAST(1500000.000 AS Decimal(20, 3)), 75, N'', 1, 2, 1, CAST(N'2023-12-25T21:15:04.270' AS DateTime), CAST(N'2023-12-31T09:49:36.833' AS DateTime), 0, 21)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (44, N'SP00010', N'Khăn Choàng cổ nữ jussy fashion', CAST(1500000.000 AS Decimal(20, 3)), 97, N'', 2, 3, 1, CAST(N'2023-12-25T21:15:04.300' AS DateTime), CAST(N'2024-01-03T01:03:47.790' AS DateTime), 0, 21)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (45, N'SP00011', N'Khăn Choàng cổ nữ jussy fashion', CAST(1500000.000 AS Decimal(20, 3)), 88, N'', 3, 4, 1, CAST(N'2023-12-25T21:15:04.310' AS DateTime), CAST(N'2023-12-31T09:49:36.867' AS DateTime), 0, 21)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (46, N'SP00012', N'Khăn Choàng cổ nữ jussy fashion', CAST(1500000.000 AS Decimal(20, 3)), 87, N'', 4, 4, 1, CAST(N'2023-12-25T21:15:04.310' AS DateTime), CAST(N'2023-12-31T09:49:36.907' AS DateTime), 0, 21)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (47, N'SP00013', N'Khăn Choàng cổ nữ jussy fashion', CAST(1500000.000 AS Decimal(20, 3)), 99, N'', 5, 5, 1, CAST(N'2023-12-25T21:15:04.317' AS DateTime), CAST(N'2023-12-27T19:02:04.927' AS DateTime), 0, 21)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (48, N'SP00014', N'Khăn choàng nữ thời trang cao cấp', CAST(150000.000 AS Decimal(20, 3)), 99, N'', 1, 2, 1, CAST(N'2023-12-25T21:16:27.890' AS DateTime), CAST(N'2023-12-31T09:43:08.353' AS DateTime), 0, 22)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (49, N'SP00015', N'Khăn choàng nữ thời trang cao cấp', CAST(1500000.000 AS Decimal(20, 3)), 60, N'', 2, 3, 1, CAST(N'2023-12-25T21:16:27.920' AS DateTime), CAST(N'2024-01-02T12:45:30.383' AS DateTime), 0, 22)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (50, N'SP00016', N'Khăn choàng nữ thời trang cao cấp', CAST(1500000.000 AS Decimal(20, 3)), 100, N'', 3, 4, 1, CAST(N'2023-12-25T21:16:27.930' AS DateTime), CAST(N'2023-12-25T21:16:27.940' AS DateTime), 0, 22)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (51, N'SP00017', N'Khăn choàng nữ thời trang cao cấp', CAST(1500000.000 AS Decimal(20, 3)), 100, N'', 4, 4, 1, CAST(N'2023-12-25T21:16:27.930' AS DateTime), CAST(N'2023-12-25T21:16:27.940' AS DateTime), 0, 22)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (52, N'SP00018', N'Khăn choàng nữ thời trang cao cấp', CAST(1500000.000 AS Decimal(20, 3)), 100, N'', 5, 5, 1, CAST(N'2023-12-25T21:16:27.940' AS DateTime), CAST(N'2023-12-25T21:16:27.940' AS DateTime), 0, 22)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (53, N'SP00019', N'Khăn choàng boho đi biển thổ cẩm', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 1, 6, 1, CAST(N'2023-12-25T21:18:24.560' AS DateTime), CAST(N'2023-12-25T21:18:24.617' AS DateTime), 0, 23)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (54, N'SP00020', N'Khăn choàng boho đi biển thổ cẩm', CAST(180000.000 AS Decimal(20, 3)), 61, N'', 2, 4, 1, CAST(N'2023-12-25T21:18:24.597' AS DateTime), CAST(N'2024-01-02T12:45:30.393' AS DateTime), 0, 23)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (55, N'SP00021', N'Khăn choàng boho đi biển thổ cẩm', CAST(120000.000 AS Decimal(20, 3)), 50, N'', 3, 5, 1, CAST(N'2023-12-25T21:18:24.600' AS DateTime), CAST(N'2023-12-25T21:18:24.617' AS DateTime), 0, 23)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (56, N'SP00022', N'Khăn choàng boho đi biển thổ cẩm', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 4, 3, 1, CAST(N'2023-12-25T21:18:24.610' AS DateTime), CAST(N'2023-12-25T21:18:24.617' AS DateTime), 0, 23)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (57, N'SP00023', N'Khăn choàng boho đi biển thổ cẩm', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 5, 5, 1, CAST(N'2023-12-25T21:18:24.617' AS DateTime), CAST(N'2023-12-25T21:18:24.617' AS DateTime), 0, 23)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (58, N'SP00024', N'Khăn choàng lụa hàng châu cao cấp', CAST(180000.000 AS Decimal(20, 3)), 50, N'', 1, 3, 1, CAST(N'2023-12-25T21:19:58.187' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 24)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (59, N'SP00025', N'Khăn choàng lụa hàng châu cao cấp', CAST(180000.000 AS Decimal(20, 3)), 100, N'', 2, 2, 1, CAST(N'2023-12-25T21:19:58.210' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 24)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (60, N'SP00026', N'Khăn choàng lụa hàng châu cao cấp', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 3, 5, 1, CAST(N'2023-12-25T21:19:58.220' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 24)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (61, N'SP00027', N'Khăn choàng lụa hàng châu cao cấp', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 4, 6, 1, CAST(N'2023-12-25T21:19:58.230' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 24)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (62, N'SP00028', N'Khăn choàng lụa hàng châu cao cấp', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 5, 4, 1, CAST(N'2023-12-25T21:19:58.230' AS DateTime), CAST(N'2023-12-25T21:19:58.240' AS DateTime), 0, 24)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (63, N'SP00029', N'Khăn choàng cổ voan lụa kim tuyến', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 1, 2, 1, CAST(N'2023-12-25T21:21:43.580' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 25)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (64, N'SP00030', N'Khăn choàng cổ voan lụa kim tuyến', CAST(120000.000 AS Decimal(20, 3)), 100, N'', 2, 3, 1, CAST(N'2023-12-25T21:21:43.617' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 25)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (65, N'SP00031', N'Khăn choàng cổ voan lụa kim tuyến', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 3, 5, 1, CAST(N'2023-12-25T21:21:43.617' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 25)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (66, N'SP00032', N'Khăn choàng cổ voan lụa kim tuyến', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 4, 4, 1, CAST(N'2023-12-25T21:21:43.620' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 25)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (67, N'SP00033', N'Khăn choàng cổ voan lụa kim tuyến', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 5, 4, 1, CAST(N'2023-12-25T21:21:43.630' AS DateTime), CAST(N'2023-12-25T21:21:43.630' AS DateTime), 0, 25)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (68, N'SP00034', N'Khăn choàng cổ đi biển dáng dài', CAST(200000.000 AS Decimal(20, 3)), 100, N'', 1, 5, 1, CAST(N'2023-12-25T21:23:05.450' AS DateTime), CAST(N'2023-12-25T21:23:05.510' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (69, N'SP00035', N'Khăn choàng cổ đi biển dáng dài', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 2, 4, 1, CAST(N'2023-12-25T21:23:05.490' AS DateTime), CAST(N'2023-12-25T21:23:05.510' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (70, N'SP00036', N'Khăn choàng cổ đi biển dáng dài', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 3, 4, 1, CAST(N'2023-12-25T21:23:05.500' AS DateTime), CAST(N'2023-12-25T21:23:05.517' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (71, N'SP00037', N'Khăn choàng cổ đi biển dáng dài', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 4, 5, 1, CAST(N'2023-12-25T21:23:05.500' AS DateTime), CAST(N'2023-12-25T21:23:05.517' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (72, N'SP00038', N'Khăn choàng cổ đi biển dáng dài', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 5, 5, 1, CAST(N'2023-12-25T21:23:05.510' AS DateTime), CAST(N'2023-12-25T21:23:05.517' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (73, N'SP00039', N'Khăn choàng len dạ boho họa tiết', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 1, 6, 1, CAST(N'2023-12-25T21:24:44.770' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (74, N'SP00040', N'Khăn choàng len dạ boho họa tiết', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 2, 2, 1, CAST(N'2023-12-25T21:24:44.807' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (75, N'SP00041', N'Khăn choàng len dạ boho họa tiết', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 3, 3, 1, CAST(N'2023-12-25T21:24:44.810' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (76, N'SP00042', N'Khăn choàng len dạ boho họa tiết', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 4, 4, 1, CAST(N'2023-12-25T21:24:44.820' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (77, N'SP00043', N'Khăn choàng len dạ boho họa tiết', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 5, 6, 1, CAST(N'2023-12-25T21:24:44.820' AS DateTime), CAST(N'2023-12-25T21:24:44.830' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (83, N'SP00044', N'Khăn choàng cổ len dạ lông thỏ', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 1, 3, 1, CAST(N'2023-12-25T21:27:44.920' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 29)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (84, N'SP00045', N'Khăn choàng cổ len dạ lông thỏ', CAST(150000.000 AS Decimal(20, 3)), 150, N'', 2, 4, 1, CAST(N'2023-12-25T21:27:44.930' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 29)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (85, N'SP00046', N'Khăn choàng cổ len dạ lông thỏ', CAST(500000.000 AS Decimal(20, 3)), 150, N'', 3, 5, 1, CAST(N'2023-12-25T21:27:44.933' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 29)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (86, N'SP00047', N'Khăn choàng cổ len dạ lông thỏ', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 4, 6, 1, CAST(N'2023-12-25T21:27:44.943' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 29)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (87, N'SP00048', N'Khăn choàng cổ len dạ lông thỏ', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 5, 5, 1, CAST(N'2023-12-25T21:27:44.950' AS DateTime), CAST(N'2023-12-25T21:27:44.950' AS DateTime), 0, 29)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (88, N'SP00049', N'Khăn choàng cổ caro mềm mịn, dày ấm', CAST(150000.000 AS Decimal(20, 3)), 100, N'', 2, 5, 1, CAST(N'2023-12-25T21:29:08.230' AS DateTime), CAST(N'2023-12-25T21:29:08.260' AS DateTime), 0, 30)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (89, N'SP00050', N'Khăn choàng lụa thêu tay hoa sen', CAST(1687000.000 AS Decimal(20, 3)), 50, N'', 1, 7, 1, CAST(N'2023-12-25T21:36:52.720' AS DateTime), CAST(N'2023-12-25T21:36:52.770' AS DateTime), 0, 31)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (90, N'SP00051', N'Khăn choàng lụa thêu tay hoa sen', CAST(1000000.000 AS Decimal(20, 3)), 20, N'', 3, 3, 1, CAST(N'2023-12-25T21:36:52.770' AS DateTime), CAST(N'2023-12-25T21:36:52.770' AS DateTime), 0, 31)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (91, N'SP00052', N'Khăn choàng cổ trơn nam nữ bản to', CAST(150000.000 AS Decimal(20, 3)), 50, N'', 4, 6, 1, CAST(N'2023-12-26T00:46:03.343' AS DateTime), CAST(N'2023-12-26T00:46:03.463' AS DateTime), 0, 32)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (92, N'SP00053', N'Khăn choàng cổ len cashmere', CAST(350000.000 AS Decimal(20, 3)), 50, N'', 5, 4, 1, CAST(N'2023-12-26T00:48:33.010' AS DateTime), CAST(N'2023-12-26T00:48:33.040' AS DateTime), 0, 33)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (93, N'SP00054', N'Khăn choàng cổ len cashmere', CAST(580000.000 AS Decimal(20, 3)), 50, N'', 2, 6, 1, CAST(N'2023-12-26T00:48:33.033' AS DateTime), CAST(N'2023-12-26T00:48:33.040' AS DateTime), 0, 33)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (94, N'SP00055', N'Khăn choàng cashmere dài tua rua mềm mại', CAST(800000.000 AS Decimal(20, 3)), 50, N'', 2, 6, 1, CAST(N'2023-12-26T00:51:19.333' AS DateTime), CAST(N'2023-12-26T00:51:19.353' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (95, N'SP00056', N'Khăn choàng cashmere dài tua rua mềm mại', CAST(0.000 AS Decimal(20, 3)), 50, N'', 3, 4, 1, CAST(N'2023-12-26T00:51:19.347' AS DateTime), CAST(N'2023-12-26T00:51:19.353' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (96, N'SP00057', N'Khăn choàng cashmere dài tua rua mềm mại', CAST(750000.000 AS Decimal(20, 3)), 50, N'', 4, 2, 1, CAST(N'2023-12-26T00:51:19.350' AS DateTime), CAST(N'2023-12-26T00:51:19.353' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (97, N'SP00058', N'Khăn choàng Linen phong cách Hàn Quốc cao', CAST(150000.000 AS Decimal(20, 3)), 10, N'', 1, 2, 1, CAST(N'2023-12-27T21:52:18.260' AS DateTime), CAST(N'2023-12-27T21:52:18.297' AS DateTime), 0, 35)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (98, N'SP00059', N'Khăn choàng cổ Chanel', CAST(350000.000 AS Decimal(20, 3)), 50, N'', 1, 3, 1, CAST(N'2023-12-28T20:53:26.420' AS DateTime), CAST(N'2023-12-28T20:53:26.507' AS DateTime), 0, 36)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (99, N'SP00060', N'Khăn choàng cổ Chanel', CAST(350000.000 AS Decimal(20, 3)), 50, N'', 1, 2, 1, CAST(N'2023-12-28T20:53:26.483' AS DateTime), CAST(N'2023-12-28T20:53:26.507' AS DateTime), 0, 36)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (100, N'SP00061', N'Khăn choàng cổ Chanel', CAST(350000.000 AS Decimal(20, 3)), 50, N'', 1, 5, 1, CAST(N'2023-12-28T20:53:26.483' AS DateTime), CAST(N'2023-12-28T20:53:26.507' AS DateTime), 0, 36)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (101, N'SP00062', NULL, CAST(250000.000 AS Decimal(20, 3)), 50, N'', 1, 3, 0, CAST(N'2023-12-28T20:55:31.730' AS DateTime), CAST(N'2023-12-28T20:55:31.730' AS DateTime), 0, 35)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (102, N'SP00063', NULL, CAST(150000.000 AS Decimal(20, 3)), 50, N'', 2, 2, 0, CAST(N'2023-12-28T20:56:30.143' AS DateTime), CAST(N'2023-12-28T20:56:50.457' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (103, N'SP00064', NULL, CAST(150000.000 AS Decimal(20, 3)), 50, N'', 3, 6, 0, CAST(N'2023-12-28T20:57:13.930' AS DateTime), CAST(N'2023-12-28T20:57:13.930' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (104, N'SP00065', NULL, CAST(150000.000 AS Decimal(20, 3)), 50, N'', 4, 7, 0, CAST(N'2023-12-28T20:57:50.317' AS DateTime), CAST(N'2023-12-28T20:57:50.317' AS DateTime), 0, 34)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (105, N'SP00066', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 4, 3, 0, CAST(N'2023-12-28T20:58:42.787' AS DateTime), CAST(N'2023-12-28T20:58:42.787' AS DateTime), 0, 32)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (106, N'SP00067', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 1, 6, 0, CAST(N'2023-12-28T20:59:42.470' AS DateTime), CAST(N'2023-12-28T20:59:42.470' AS DateTime), 0, 31)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (107, N'SP00068', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 1, 4, 0, CAST(N'2023-12-28T21:00:11.033' AS DateTime), CAST(N'2023-12-28T21:00:11.033' AS DateTime), 0, 31)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (108, N'SP00069', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 3, 2, 0, CAST(N'2023-12-28T21:01:27.870' AS DateTime), CAST(N'2023-12-28T21:01:27.870' AS DateTime), 0, 31)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (109, N'SP00070', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 1, 6, 0, CAST(N'2023-12-28T21:02:12.743' AS DateTime), CAST(N'2023-12-28T21:02:12.743' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (110, N'SP00071', NULL, CAST(500000.000 AS Decimal(20, 3)), 10, N'', 1, 4, 0, CAST(N'2023-12-28T21:02:38.070' AS DateTime), CAST(N'2023-12-28T21:02:38.070' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (111, N'SP00072', NULL, CAST(800000.000 AS Decimal(20, 3)), 10, N'', 2, 7, 0, CAST(N'2023-12-28T21:03:24.453' AS DateTime), CAST(N'2023-12-28T21:03:24.453' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (112, N'SP00073', NULL, CAST(1200000.000 AS Decimal(20, 3)), 10, N'', 5, 3, 0, CAST(N'2023-12-28T21:04:42.393' AS DateTime), CAST(N'2023-12-28T21:04:42.393' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (113, N'SP00074', NULL, CAST(250000.000 AS Decimal(20, 3)), 10, N'', 4, 2, 0, CAST(N'2023-12-28T21:05:51.310' AS DateTime), CAST(N'2023-12-28T21:05:51.310' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (114, N'SP00075', NULL, CAST(150000.000 AS Decimal(20, 3)), 10, N'', 3, 6, 0, CAST(N'2023-12-28T21:07:09.913' AS DateTime), CAST(N'2023-12-28T21:07:09.913' AS DateTime), 0, 26)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (115, N'SP00076', NULL, CAST(250000.000 AS Decimal(20, 3)), 10, N'', 1, 3, 0, CAST(N'2023-12-28T21:08:22.413' AS DateTime), CAST(N'2023-12-28T21:08:22.413' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (116, N'SP00077', NULL, CAST(250000.000 AS Decimal(20, 3)), 10, N'', 2, 7, 0, CAST(N'2023-12-28T21:08:50.630' AS DateTime), CAST(N'2023-12-28T21:08:50.630' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (117, N'SP00078', NULL, CAST(160000.000 AS Decimal(20, 3)), 10, N'', 4, 2, 0, CAST(N'2023-12-28T21:09:27.780' AS DateTime), CAST(N'2023-12-28T21:09:27.780' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (118, N'SP00079', NULL, CAST(220000.000 AS Decimal(20, 3)), 10, N'', 3, 2, 0, CAST(N'2023-12-28T21:10:10.213' AS DateTime), CAST(N'2023-12-28T21:10:10.213' AS DateTime), 0, 27)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (119, N'SP00080', N'test 111111111', CAST(100.000 AS Decimal(20, 3)), 3, N'', 4, 2, 1, CAST(N'2023-12-31T19:56:28.590' AS DateTime), CAST(N'2023-12-31T19:56:28.640' AS DateTime), 0, 37)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (120, N'SP00081', N'test 111111111', CAST(10.000 AS Decimal(20, 3)), 2, N'', 4, 3, 1, CAST(N'2023-12-31T19:56:28.627' AS DateTime), CAST(N'2023-12-31T19:56:28.640' AS DateTime), 0, 37)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (121, NULL, N'Khăn choàng Cashmere len dài', CAST(560000.000 AS Decimal(20, 3)), 100, N'Ấm áp', 1, 2, 1, CAST(N'2024-01-03T00:50:43.120' AS DateTime), CAST(N'2024-01-03T00:50:43.163' AS DateTime), 0, 38)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (122, NULL, N'Khăn choàng Cashmere len dài', CAST(850000.000 AS Decimal(20, 3)), 110, N'', 1, 3, 1, CAST(N'2024-01-03T00:50:43.143' AS DateTime), CAST(N'2024-01-03T00:50:43.163' AS DateTime), 0, 38)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (123, NULL, N'Khăn choàng Cashmere len dài', CAST(530000.000 AS Decimal(20, 3)), 120, N'', 1, 4, 1, CAST(N'2024-01-03T00:50:43.143' AS DateTime), CAST(N'2024-01-03T00:50:43.163' AS DateTime), 0, 38)
INSERT [dbo].[product_detail] ([id], [code], [name], [price], [quantity], [description], [id_pattern], [id_size], [status], [created_at], [update_at], [deleted], [id_product]) VALUES (124, NULL, N'Khăn choàng Cashmere len dài', CAST(950000.000 AS Decimal(20, 3)), 100, N'', 1, 5, 1, CAST(N'2024-01-03T00:50:43.150' AS DateTime), CAST(N'2024-01-03T00:50:43.163' AS DateTime), 0, 38)
SET IDENTITY_INSERT [dbo].[product_detail] OFF
GO
INSERT [dbo].[promotion] ([id], [code], [name], [value], [start_date], [end_date], [status], [created_at], [update_at], [delected]) VALUES (N'c0c4c647-d0c0-430b-8477-20f8e6893550', N'KM01', N'giam 49k', CAST(49.000 AS Decimal(20, 3)), CAST(N'2023-12-27T18:31:52.000' AS DateTime), CAST(N'2024-12-27T18:31:52.000' AS DateTime), 1, CAST(N'2023-12-27T00:00:00.000' AS DateTime), CAST(N'2023-12-27T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (1, N'Quản lý', 0, NULL, CAST(N'2023-12-19T23:32:45.160' AS DateTime), 0, N'ADMIN')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (2, N'Quản lý', 0, NULL, NULL, 0, N'Admin')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (3, NULL, 0, NULL, NULL, 0, N'Nhân Viên')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (4, N'EMPLOYEE', 0, NULL, CAST(N'2023-12-27T21:49:28.997' AS DateTime), 0, N'ADMIN')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (5, NULL, 0, NULL, NULL, 0, N'Khách Hàng')
INSERT [dbo].[roles] ([id], [name], [status], [created_at], [update_at], [deleted], [role]) VALUES (6, NULL, 0, NULL, NULL, 0, N'Khách Hàng')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (2, N'Size1', N'100 * 150 cm', CAST(N'2023-12-20T01:12:15.610' AS DateTime), CAST(N'2023-12-20T01:12:15.610' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (3, N'Size2', N'90 * 90 cm', CAST(N'2023-12-20T01:13:55.917' AS DateTime), CAST(N'2023-12-20T01:13:55.917' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (4, N'Size3', N'140x180cm', CAST(N'2023-12-20T01:14:35.570' AS DateTime), CAST(N'2023-12-20T01:14:35.570' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (5, N'Size4', N'200 * 150 cm', CAST(N'2023-12-20T01:14:53.810' AS DateTime), CAST(N'2023-12-20T01:14:53.810' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (6, N'Size5', N'200x60cm', CAST(N'2023-12-25T20:57:17.970' AS DateTime), CAST(N'2023-12-25T20:57:17.970' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (7, N'Size6', N'200 x 55 cm', CAST(N'2023-12-25T21:35:55.270' AS DateTime), CAST(N'2023-12-25T21:35:55.270' AS DateTime), 1, 0)
INSERT [dbo].[size] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (8, N'Size7', N'SS', CAST(N'2023-12-31T18:01:00.553' AS DateTime), CAST(N'2023-12-31T18:02:48.737' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET IDENTITY_INSERT [dbo].[styles] ON 

INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (2, N'Sty1', N'Cổ điển', CAST(N'2023-12-16T19:58:54.923' AS DateTime), CAST(N'2023-12-16T19:58:54.923' AS DateTime), 1, 0)
INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (3, N'Sty2', N'Cá tính', CAST(N'2023-12-16T19:58:54.923' AS DateTime), CAST(N'2023-12-16T19:58:54.923' AS DateTime), 1, 0)
INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (4, N'Sty3', N'Trang trọng', CAST(N'2023-12-16T19:58:54.923' AS DateTime), CAST(N'2023-12-16T19:58:54.923' AS DateTime), 1, 0)
INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (5, N'Sty4', N'Nhẹ nhàng', CAST(N'2023-12-16T19:58:54.923' AS DateTime), CAST(N'2023-12-16T19:58:54.923' AS DateTime), 1, 0)
INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (6, N'Sty5', N'Đơn giản', CAST(N'2023-12-16T19:58:54.923' AS DateTime), CAST(N'2023-12-16T19:58:54.923' AS DateTime), 1, 0)
INSERT [dbo].[styles] ([id], [code], [name], [created_at], [update_at], [status], [deleted]) VALUES (8, N'Sty6', N'test sty 11', CAST(N'2023-12-31T18:07:18.087' AS DateTime), CAST(N'2023-12-31T18:07:23.693' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[styles] OFF
GO
SET IDENTITY_INSERT [dbo].[vertify_email] ON 

INSERT [dbo].[vertify_email] ([id], [code], [request_at], [email]) VALUES (1, 213833, CAST(N'2023-12-19T23:33:06.987' AS DateTime), N'ngale4089@gmail.com      ')
INSERT [dbo].[vertify_email] ([id], [code], [request_at], [email]) VALUES (2, 299032, CAST(N'2023-12-20T21:01:19.283' AS DateTime), N'ngaltph26840@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[vertify_email] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher] ON 

INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (3, N'VC01', N'Sale 12/12', CAST(N'2023-12-01T18:20:00.000' AS DateTime), CAST(N'2024-01-20T18:20:00.000' AS DateTime), 50, 5, 1, CAST(N'2023-12-27T18:21:27.657' AS DateTime), CAST(N'2023-12-27T18:21:27.657' AS DateTime), 1, 0, 10, 1000000)
INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (4, N'VC02', N'Giảm tối đa 100K', CAST(N'2023-12-20T18:22:00.000' AS DateTime), CAST(N'2024-01-31T18:22:00.000' AS DateTime), 47, 100000, 1, CAST(N'2023-12-27T18:22:56.720' AS DateTime), CAST(N'2024-01-02T00:20:43.510' AS DateTime), 0, 0, 100000, 1000000)
INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (5, N'VC03', N'Giảm 5%', CAST(N'2023-12-01T18:25:00.000' AS DateTime), CAST(N'2023-12-25T18:25:00.000' AS DateTime), 10, 50000, 1, CAST(N'2023-12-27T18:25:39.557' AS DateTime), CAST(N'2023-12-27T18:25:39.557' AS DateTime), 0, 0, 50000, 500000)
INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (6, N'VC04', N'Giảm 10%', CAST(N'2023-12-28T18:25:00.000' AS DateTime), CAST(N'2024-01-30T18:26:00.000' AS DateTime), 50, 10, 1, CAST(N'2023-12-27T18:26:52.173' AS DateTime), CAST(N'2023-12-27T18:27:31.817' AS DateTime), 1, 0, 10, 1500000)
INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (7, N'VC05', N'Voucher 100k chào 2024', CAST(N'2024-01-01T00:20:00.000' AS DateTime), CAST(N'2024-01-30T18:29:00.000' AS DateTime), 48, 100000, 1, CAST(N'2023-12-27T18:29:07.433' AS DateTime), CAST(N'2024-01-03T00:41:36.877' AS DateTime), 0, 0, 100000, 250000)
INSERT [dbo].[voucher] ([id], [code], [name], [start_time], [end_time], [quantily], [discount], [status], [created_at], [update_at], [types], [deleted], [max_discount], [min_order]) VALUES (8, N'VC06', N'Giảm 50K', CAST(N'2023-12-27T18:30:00.000' AS DateTime), CAST(N'2024-01-31T18:30:00.000' AS DateTime), 46, 50000, 1, CAST(N'2023-12-27T18:30:54.523' AS DateTime), CAST(N'2023-12-31T19:47:59.587' AS DateTime), 0, 0, 50000, 200000)
SET IDENTITY_INSERT [dbo].[voucher] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher_detail] ON 

INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (2, 6, 8, CAST(300000.000 AS Decimal(20, 3)), CAST(250000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (3, 7, 4, CAST(1010000.000 AS Decimal(20, 3)), CAST(910000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (4, 10, 4, CAST(2760000.000 AS Decimal(20, 3)), CAST(2660000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (5, 14, 8, CAST(750000.000 AS Decimal(20, 3)), CAST(700000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (6, 15, 8, CAST(450000.000 AS Decimal(20, 3)), CAST(400000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (7, 29, 8, CAST(300000.000 AS Decimal(20, 3)), CAST(250000.000 AS Decimal(20, 3)), CAST(50000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (8, 39, 4, CAST(1500000.000 AS Decimal(20, 3)), CAST(1400000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (9, 53, 7, CAST(6170000.000 AS Decimal(20, 3)), CAST(6070000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
INSERT [dbo].[voucher_detail] ([id], [id_bill], [id_voucher], [money_before_reduction], [money_after_reduction], [money_reduction], [status], [created_at], [update_at], [deleted]) VALUES (10, 54, 7, CAST(6170000.000 AS Decimal(20, 3)), CAST(6070000.000 AS Decimal(20, 3)), CAST(100000.000 AS Decimal(20, 3)), 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[voucher_detail] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__account__AB6E6164ECB4C984]    Script Date: 1/4/2024 10:01:52 PM ******/
ALTER TABLE [dbo].[account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__cart__8CC9BA478917DE98]    Script Date: 1/4/2024 10:01:52 PM ******/
ALTER TABLE [dbo].[cart] ADD UNIQUE NONCLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__AB6E6164379B119E]    Script Date: 1/4/2024 10:01:52 PM ******/
ALTER TABLE [dbo].[employee] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[account] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_Account_actived]  DEFAULT ((0)) FOR [actived]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [money_ship]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0.0)) FOR [total_money]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0.0)) FOR [reduction_amount]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0.0)) FOR [deposit]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [order_type]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [status_pay]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0.0)) FOR [total_money]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[bill_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[brand] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[cart] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[cart] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[carts_detail] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[carts_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[carts_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[color] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[customer] ADD  CONSTRAINT [DF_customer_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((0)) FOR [gender]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((-1)) FOR [districtcode]
GO
ALTER TABLE [dbo].[employee] ADD  CONSTRAINT [DF_staff_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0)) FOR [gender]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0)) FOR [actived]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((-1)) FOR [districtcode]
GO
ALTER TABLE [dbo].[evaluate] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[evaluate] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[image_product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[image_product] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[material] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[material] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[origin] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[origin] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[pattern] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[pattern] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[pay] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[pay] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0.0)) FOR [price]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[product_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[promotion_detail] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[size] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[styles] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[styles] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [quantily]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [types]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [max_discount]
GO
ALTER TABLE [dbo].[voucher] ADD  DEFAULT ((0)) FOR [min_order]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0.0)) FOR [money_before_reduction]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0.0)) FOR [money_after_reduction]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0.0)) FOR [money_reduction]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[voucher_detail] ADD  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_customer]
GO
ALTER TABLE [dbo].[addresss]  WITH CHECK ADD  CONSTRAINT [FK_id_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[addresss] CHECK CONSTRAINT [FK_id_customer]
GO
ALTER TABLE [dbo].[bill]  WITH NOCHECK ADD  CONSTRAINT [FK_bill_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_customer]
GO
ALTER TABLE [dbo].[bill]  WITH NOCHECK ADD  CONSTRAINT [FK_bill_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_employee]
GO
ALTER TABLE [dbo].[bill]  WITH NOCHECK ADD  CONSTRAINT [FK_bill_pay] FOREIGN KEY([id_pay])
REFERENCES [dbo].[pay] ([id])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_pay]
GO
ALTER TABLE [dbo].[bill_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_bill_detail_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_bill]
GO
ALTER TABLE [dbo].[bill_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_bill_detail_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[bill_detail] CHECK CONSTRAINT [FK_bill_detail_product_detail]
GO
ALTER TABLE [dbo].[cart]  WITH NOCHECK ADD  CONSTRAINT [FK_cart_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [FK_cart_customer]
GO
ALTER TABLE [dbo].[carts_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_carts_detail_cart] FOREIGN KEY([id_cart])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[carts_detail] CHECK CONSTRAINT [FK_carts_detail_cart]
GO
ALTER TABLE [dbo].[carts_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_carts_detail_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[carts_detail] CHECK CONSTRAINT [FK_carts_detail_product_detail]
GO
ALTER TABLE [dbo].[employee]  WITH NOCHECK ADD  CONSTRAINT [FK_employee_roles] FOREIGN KEY([id_roles])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_roles]
GO
ALTER TABLE [dbo].[evaluate]  WITH NOCHECK ADD  CONSTRAINT [FK_evaluate_customer] FOREIGN KEY([id_customer])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[evaluate] CHECK CONSTRAINT [FK_evaluate_customer]
GO
ALTER TABLE [dbo].[evaluate]  WITH NOCHECK ADD  CONSTRAINT [FK_evaluate_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[evaluate] CHECK CONSTRAINT [FK_evaluate_product_detail]
GO
ALTER TABLE [dbo].[image]  WITH NOCHECK ADD  CONSTRAINT [FK_image_product_detail] FOREIGN KEY([id_product_detail])
REFERENCES [dbo].[product_detail] ([id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_product_detail]
GO
ALTER TABLE [dbo].[image_product]  WITH CHECK ADD  CONSTRAINT [FK_image_product_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[image_product] CHECK CONSTRAINT [FK_image_product_product]
GO
ALTER TABLE [dbo].[pay_detail]  WITH CHECK ADD  CONSTRAINT [FK_pay_detail_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[pay_detail] CHECK CONSTRAINT [FK_pay_detail_bill]
GO
ALTER TABLE [dbo].[pay_detail]  WITH CHECK ADD  CONSTRAINT [FK_pay_detail_pay] FOREIGN KEY([id_pay])
REFERENCES [dbo].[pay] ([id])
GO
ALTER TABLE [dbo].[pay_detail] CHECK CONSTRAINT [FK_pay_detail_pay]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([id_brand])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([id__category])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_color] FOREIGN KEY([id_color])
REFERENCES [dbo].[color] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_color]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_material] FOREIGN KEY([id_material])
REFERENCES [dbo].[material] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_material]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_origin] FOREIGN KEY([id_origin])
REFERENCES [dbo].[origin] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_origin]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_styles] FOREIGN KEY([id_style])
REFERENCES [dbo].[styles] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_styles]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FKs6xn6ag6vlc609mc1mdmu3b8k] FOREIGN KEY([id_color])
REFERENCES [dbo].[styles] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FKs6xn6ag6vlc609mc1mdmu3b8k]
GO
ALTER TABLE [dbo].[product_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_product_detail_pattern] FOREIGN KEY([id_pattern])
REFERENCES [dbo].[pattern] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_pattern]
GO
ALTER TABLE [dbo].[product_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_product_detail_product] FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_product]
GO
ALTER TABLE [dbo].[product_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_product_detail_size] FOREIGN KEY([id_size])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[product_detail] CHECK CONSTRAINT [FK_product_detail_size]
GO
ALTER TABLE [dbo].[promotion_detail]  WITH CHECK ADD FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[promotion_detail]  WITH CHECK ADD FOREIGN KEY([id_promotion])
REFERENCES [dbo].[promotion] ([id])
GO
ALTER TABLE [dbo].[voucher_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_detail_bill] FOREIGN KEY([id_bill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[voucher_detail] CHECK CONSTRAINT [FK_voucher_detail_bill]
GO
ALTER TABLE [dbo].[voucher_detail]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_detail_voucher] FOREIGN KEY([id_voucher])
REFERENCES [dbo].[voucher] ([id])
GO
ALTER TABLE [dbo].[voucher_detail] CHECK CONSTRAINT [FK_voucher_detail_voucher]
GO
/****** Object:  Trigger [dbo].[trg_generate_bill_code]    Script Date: 1/4/2024 10:01:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



------------hóa đơn------------
CREATE TRIGGER [dbo].[trg_generate_bill_code]
ON [dbo].[bill]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(10) = 'HD';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[bill];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('0' + CAST(@CodeNumber + 1 AS NVARCHAR(max)), 10)
    FROM [dbo].[bill] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[bill] ENABLE TRIGGER [trg_generate_bill_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_brand_code]    Script Date: 1/4/2024 10:01:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----1. trigger brand---------
CREATE TRIGGER [dbo].[trg_generate_brand_code]
ON [dbo].[brand]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(2) = 'TH';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[brand];

	-- Increment the code number for each new inserted row
	UPDATE br
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[brand] br
		INNER JOIN inserted i ON br.id = i.id;
END;
GO
ALTER TABLE [dbo].[brand] ENABLE TRIGGER [trg_generate_brand_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_category_code]    Script Date: 1/4/2024 10:01:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------2. category--------------------  

CREATE TRIGGER [dbo].[trg_generate_category_code]
ON [dbo].[category]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(2) = 'DM';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[category];

	-- Increment the code number for each new inserted row
	UPDATE ca
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[category] ca
		INNER JOIN inserted i ON ca.id = i.id;
END;
GO
ALTER TABLE [dbo].[category] ENABLE TRIGGER [trg_generate_category_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_color_code]    Script Date: 1/4/2024 10:01:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------8. color--------------

CREATE TRIGGER [dbo].[trg_generate_color_code]
ON [dbo].[color]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(6) = 'Color';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[color];

	-- Increment the code number for each new inserted row
	UPDATE cl
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[color] cl
		INNER JOIN inserted i ON cl.id = i.id;
END;
GO
ALTER TABLE [dbo].[color] ENABLE TRIGGER [trg_generate_color_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_customer_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------khách hàng ----------
CREATE TRIGGER [dbo].[trg_generate_customer_code]
ON [dbo].[customer]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(2) = 'KH';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[customer];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('0' + CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[customer] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[customer] ENABLE TRIGGER [trg_generate_customer_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_employee_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------nhân viên ------------
CREATE TRIGGER [dbo].[trg_generate_employee_code]
ON [dbo].[employee]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(2) = 'NV';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[employee];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('0' + CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[employee] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[employee] ENABLE TRIGGER [trg_generate_employee_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_material_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------3. chất liệu: material-----------------

CREATE TRIGGER [dbo].[trg_generate_material_code]
ON [dbo].[material]
AFTER INSERT
AS
BEGIN

	DECLARE @Prefix NVARCHAR(2) = 'CL';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[material];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[material] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[material] ENABLE TRIGGER [trg_generate_material_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_origin_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------4. origin: xuất xứ----------
CREATE TRIGGER [dbo].[trg_generate_origin_code]
ON [dbo].[origin]
AFTER INSERT
AS
BEGIN

	DECLARE @Prefix NVARCHAR(2) = 'Or';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[origin];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[origin] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[origin] ENABLE TRIGGER [trg_generate_origin_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_pattern_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------5. pattern: kiểu hoa văn------------
CREATE TRIGGER [dbo].[trg_generate_pattern_code]
ON [dbo].[pattern]
AFTER INSERT
AS
BEGIN

	DECLARE @Prefix NVARCHAR(10) = 'HoaVan';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[pattern];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[pattern] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[pattern] ENABLE TRIGGER [trg_generate_pattern_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_product_detail_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------9.product_detail--------------

CREATE TRIGGER [dbo].[trg_generate_product_detail_code]
ON [dbo].[product_detail]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(10) = 'SP';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[product_detail];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('000' + CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[product_detail] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[product_detail] ENABLE TRIGGER [trg_generate_product_detail_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_promotion_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------promotion--------------------------------------------
CREATE TRIGGER [dbo].[trg_generate_promotion_code]
ON [dbo].[promotion]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(10) = 'KM';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[promotion];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('0' + CAST(@CodeNumber + 1 AS NVARCHAR(max)), 10)
    FROM [dbo].[promotion] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[promotion] ENABLE TRIGGER [trg_generate_promotion_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_size_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------6. size-------------
CREATE TRIGGER [dbo].[trg_generate_size_code]
ON [dbo].[size]
AFTER INSERT
AS
BEGIN
	DECLARE @Prefix NVARCHAR(10) = 'Size';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[size];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[size] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[size] ENABLE TRIGGER [trg_generate_size_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_style_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--------------7. style---------------
CREATE TRIGGER [dbo].[trg_generate_style_code]
ON [dbo].[styles]
AFTER INSERT
AS
BEGIN

	DECLARE @Prefix NVARCHAR(10) = 'Sty';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[styles];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT( CAST(@CodeNumber + 1 AS NVARCHAR(10)), 10)
    FROM [dbo].[styles] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[styles] ENABLE TRIGGER [trg_generate_style_code]
GO
/****** Object:  Trigger [dbo].[trg_generate_voucher_code]    Script Date: 1/4/2024 10:01:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------voucher--------------------------------------------
CREATE TRIGGER [dbo].[trg_generate_voucher_code]
ON [dbo].[voucher]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Prefix NVARCHAR(10) = 'VC';
	DECLARE @CodeNumber INT;

	-- Get the maximum existing code number
	SELECT @CodeNumber = ISNULL(MAX(CAST(SUBSTRING(code, LEN(@Prefix) + 1, LEN(code)) AS INT)), 0)
	FROM [dbo].[voucher];

	-- Increment the code number for each new inserted row
	UPDATE b
    SET code = @Prefix + RIGHT('0' + CAST(@CodeNumber + 1 AS NVARCHAR(max)), 10)
    FROM [dbo].[voucher] b
		INNER JOIN inserted i ON b.id = i.id;
END;
GO
ALTER TABLE [dbo].[voucher] ENABLE TRIGGER [trg_generate_voucher_code]
GO
USE [master]
GO
ALTER DATABASE [DUANTN_SD03] SET  READ_WRITE 
GO
