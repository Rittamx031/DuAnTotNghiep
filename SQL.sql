USE [master]
GO
--/****** Object:  Database [DUANTN]    Script Date: 14/10/2023 11:33:48 CH ******/
Drop DATABASE [DUANTN]
GO
USE [master]
GO
/****** Object:  Database [DUANTN]    Script Date: 14/10/2023 11:33:48 CH ******/
Create DATABASE [DUANTN]
GO
USE [DUANTN]
GO
/****** Object:  Table [dbo].[account_voucher]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[bill]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[bill_detail]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[brand]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[cart]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[carts_detail]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[color]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[customer]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[evaluate]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[image]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[material]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[origin]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[pattern]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[pay]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[product]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[product_detail]    Script Date: 14/10/2023 11:33:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_detail](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[code] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[price] [decimal](20, 3) NULL,
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
/****** Object:  Table [dbo].[roles]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[size]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[styles]    Script Date: 14/10/2023 11:33:48 CH ******/
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
/****** Object:  Table [dbo].[voucher]    Script Date: 14/10/2023 11:33:48 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](25) NULL,
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
	[min_order] [float] NULL

 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_detail]    Script Date: 14/10/2023 11:33:48 CH ******/
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
USE [master]
GO
ALTER DATABASE [DUANTN] SET  READ_WRITE 
GO



USE DUANTN
GO
-- Tạo trigger
CREATE TRIGGER trg_generate_voucher_code
ON dbo.voucher
AFTER INSERT
AS
BEGIN
    DECLARE @InsertedID INT
    SELECT @InsertedID = id FROM inserted
    DECLARE @GeneratedCode NVARCHAR(50)
    DECLARE @Month INT
    DECLARE @Year INT
    DECLARE @RandomChars NVARCHAR(4)
    -- Lấy tháng và năm tạo
    SELECT @Month = MONTH(created_at), @Year = YEAR(created_at) FROM dbo.voucher WHERE id = @InsertedID
    -- Tạo ngẫu nhiên 4 ký tự
    SET @RandomChars = CHAR(65 + CAST(RAND() * 26 AS INT)) +
                       CHAR(65 + CAST(RAND() * 26 AS INT)) +
                       CHAR(65 + CAST(RAND() * 26 AS INT)) +
                       CHAR(65 + CAST(RAND() * 26 AS INT))
    -- Tạo mã voucher dựa trên giá trị types
    SELECT @GeneratedCode = 'T' + CAST(@Month AS NVARCHAR) + 'N' + CAST(@Year AS NVARCHAR) +
        CASE 
            WHEN (SELECT types FROM dbo.voucher WHERE id = @InsertedID) = 1 THEN 'PER' + @RandomChars
            ELSE 'CASH' + @RandomChars
        END
    -- Cập nhật mã voucher vào bản ghi mới được chèn
    UPDATE dbo.voucher
    SET code = @GeneratedCode
    WHERE id = @InsertedID
END
Go
USE [DUANTN]
GO

CREATE TRIGGER [dbo].[GenerateProductDetailCode] ON [dbo].[product_detail]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Generate the 20-letter product code
    UPDATE pd
    SET pd.code = LEFT(p.code, 20)+"-" + s.code +"-"+ c.code
    FROM [dbo].[product_detail] pd
    JOIN inserted i ON pd.id = i.id
    JOIN [dbo].[product] p ON pd.id_product = p.id
    JOIN [dbo].[size] s ON pd.id_size = s.id
    JOIN [dbo].[color] c ON pd.id_color = c.id;
END
GO
