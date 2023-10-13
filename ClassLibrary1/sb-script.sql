USE [master]
GO
/****** Object:  Database [BookManagementDB]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE DATABASE [BookManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHICUONG\MSSQL\DATA\BookManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CHICUONG\MSSQL\DATA\BookManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookManagementDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagementDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookManagementDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/12/2023 6:56:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
    [MigrationId] [nvarchar](150) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED
(
[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Area]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Area](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Blog]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Blog](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Tittle] [nvarchar](255) NOT NULL,
    [Date] [datetime2](7) NOT NULL,
    [Type] [nvarchar](255) NOT NULL,
    [Status] [nvarchar](255) NOT NULL,
    [Short] [nvarchar](255) NOT NULL,
    [Long] [nvarchar](max) NOT NULL,
    CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Category](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [CategoryName] [nvarchar](50) NOT NULL,
    [Status] [int] NULL,
    [CreateAt] [datetime] NOT NULL,
    [UpdateAt] [datetime] NULL,
    [Description] [nvarchar](50) NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[ComboProduct]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ComboProduct](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ProductId] [int] NOT NULL,
    [Name] [nchar](10) NULL,
    [Discount] [nchar](10) NULL,
    CONSTRAINT [PK_ComboProduct] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Customer](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](50) NOT NULL,
    [Email] [nvarchar](50) NOT NULL,
    [ImageUrl] [nvarchar](255) NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Floor]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Floor](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [FloorNumber] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Floor] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Menu](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [MenuName] [nvarchar](50) NULL,
    [Type] [int] NULL,
    [PicUrl] [nvarchar](max) NULL,
    [TimeSlotId] [int] NOT NULL,
    [CreateAt] [datetime] NULL,
    [UpdateAt] [datetime] NULL,
    CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Order](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [OrderName] [nvarchar](50) NULL,
    [CheckInDate] [datetime] NOT NULL,
    [TotalAmount] [float] NOT NULL,
    [ShippingFee] [float] NULL,
    [FinalAmount] [float] NOT NULL,
    [OrderStatus] [int] NOT NULL,
    [CustomerId] [int] NOT NULL,
    [DeliveryPhone] [nvarchar](50) NULL,
    [OrderType] [int] NOT NULL,
    [TimeSlotId] [int] NOT NULL,
    [RoomId] [int] NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[OrderDetail](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [OrderId] [int] NOT NULL,
    [ProductName] [nchar](255) NOT NULL,
    [Quantity] [int] NOT NULL,
    [FinalAmount] [float] NOT NULL,
    [Status] [int] NOT NULL,
    [ProductInMenuId] [int] NOT NULL,
    CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Product](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Image] [nvarchar](255) NULL,
    [Price] [float] NOT NULL,
    [Detail] [nvarchar](100) NULL,
    [Status] [int] NOT NULL,
    [CreateAt] [datetime] NOT NULL,
    [UpdatedAt] [datetime] NULL,
    [CategoryId] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [SupplierStoreId] [int] NOT NULL,
    [GeneralProductId] [int] NULL,
    [Code] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[ProductInMenu]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[ProductInMenu](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ProductId] [int] NOT NULL,
    [MenuId] [int] NOT NULL,
    [Price] [float] NULL,
    [Active] [bit] NOT NULL,
    [CreateAt] [datetime] NULL,
    [UpdateAt] [datetime] NULL,
    CONSTRAINT [PK_ProductInMenu] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[RequestCustomer]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[RequestCustomer](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](255) NOT NULL,
    [Phone] [nvarchar](255) NOT NULL,
    [Adress] [nvarchar](255) NOT NULL,
    [Date] [datetime2](7) NOT NULL,
    [Material] [nvarchar](255) NOT NULL,
    [Color] [nvarchar](255) NOT NULL,
    [Prices] [nvarchar](255) NOT NULL,
    [Description] [nvarchar](255) NOT NULL,
    [Img] [nvarchar](255) NOT NULL,
    CONSTRAINT [PK_RequestCustomer] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Room](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [RoomNumber] [nvarchar](50) NOT NULL,
    [FloorId] [int] NOT NULL,
    [AreaId] [int] NOT NULL,
    CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Shipper](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ShipperName] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](50) NOT NULL,
    [Status] [int] NOT NULL,
    CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Store]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[Store](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](50) NULL,
    [StoreCode] [nvarchar](50) NOT NULL,
    [CreateAt] [datetime] NOT NULL,
    [UpdateAt] [datetime] NULL,
    [Active] [bit] NOT NULL,
    CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 10/12/2023 6:56:10 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [dbo].[TimeSlot](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ArriveTime] [time](7) NOT NULL,
    [CheckoutTime] [time](7) NOT NULL,
    [IsActive] [bit] NULL,
    [Status] [int] NOT NULL,
    CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED
(
[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    GO
    INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230930082306_data', N'6.0.9')
    INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230930095908_newdatabase', N'6.0.9')
    GO
    SET IDENTITY_INSERT [dbo].[Category] ON

    INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (1, N'Necklace', 1, CAST(N'2023-10-12T16:07:01.067' AS DateTime), NULL, N'Natural Material')
    INSERT [dbo].[Category] ([Id], [CategoryName], [Status], [CreateAt], [UpdateAt], [Description]) VALUES (2, N'Bracelets', 1, CAST(N'2023-10-12T16:09:15.163' AS DateTime), NULL, N'Minimalist Elegance')
    SET IDENTITY_INSERT [dbo].[Category] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Menu] ON

    INSERT [dbo].[Menu] ([Id], [MenuName], [Type], [PicUrl], [TimeSlotId], [CreateAt], [UpdateAt]) VALUES (1, N'Vòng Tay', 1, N'Handle', 1, CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime))
    INSERT [dbo].[Menu] ([Id], [MenuName], [Type], [PicUrl], [TimeSlotId], [CreateAt], [UpdateAt]) VALUES (2, N'Handle', 1, N'a', 2, CAST(N'2023-11-21T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime))
    SET IDENTITY_INSERT [dbo].[Menu] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Product] ON

    INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (1, N'Minimalist Elegance Bracelet', N'a', 10, N'b', 0, CAST(N'2023-10-12T16:56:25.970' AS DateTime), NULL, 2, 1, 1, NULL, N'1')
    INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (2, N'Natural Material Necklace', N'a', 100, N'b', 0, CAST(N'2023-10-12T16:56:56.333' AS DateTime), NULL, 1, 1, 1, NULL, N'2')
    INSERT [dbo].[Product] ([Id], [Name], [Image], [Price], [Detail], [Status], [CreateAt], [UpdatedAt], [CategoryId], [Quantity], [SupplierStoreId], [GeneralProductId], [Code]) VALUES (3, N'Exquisitely Engraved Necklace', N'a', 100, N'b', 0, CAST(N'2023-10-12T16:57:47.877' AS DateTime), NULL, 1, 1, 1, NULL, N'3')
    SET IDENTITY_INSERT [dbo].[Product] OFF
    GO
    SET IDENTITY_INSERT [dbo].[ProductInMenu] ON

    INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (1, 1, 1, 10, 1, CAST(N'2023-10-12T16:56:25.977' AS DateTime), NULL)
    INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (2, 2, 1, 100, 1, CAST(N'2023-10-12T16:56:56.340' AS DateTime), NULL)
    INSERT [dbo].[ProductInMenu] ([Id], [ProductId], [MenuId], [Price], [Active], [CreateAt], [UpdateAt]) VALUES (3, 3, 1, 100, 1, CAST(N'2023-10-12T16:57:47.883' AS DateTime), NULL)
    SET IDENTITY_INSERT [dbo].[ProductInMenu] OFF
    GO
    SET IDENTITY_INSERT [dbo].[Store] ON

    INSERT [dbo].[Store] ([Id], [Name], [Phone], [StoreCode], [CreateAt], [UpdateAt], [Active]) VALUES (1, N'Miu Miu', N'01229382564', N'1', CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 1)
    INSERT [dbo].[Store] ([Id], [Name], [Phone], [StoreCode], [CreateAt], [UpdateAt], [Active]) VALUES (2, N'Black Miu', N'0907920191', N'1', CAST(N'2023-10-12T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 1)
    SET IDENTITY_INSERT [dbo].[Store] OFF
    GO
    SET IDENTITY_INSERT [dbo].[TimeSlot] ON

    INSERT [dbo].[TimeSlot] ([Id], [ArriveTime], [CheckoutTime], [IsActive], [Status]) VALUES (1, CAST(N'07:00:00' AS Time), CAST(N'08:10:00' AS Time), 1, 1)
    INSERT [dbo].[TimeSlot] ([Id], [ArriveTime], [CheckoutTime], [IsActive], [Status]) VALUES (2, CAST(N'10:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 1)
    SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
    GO
/****** Object:  Index [IX_ComboProduct_ProductId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_ComboProduct_ProductId] ON [dbo].[ComboProduct]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Menu_TimeSlotId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Menu_TimeSlotId] ON [dbo].[Menu]
(
	[TimeSlotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_RoomId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_RoomId] ON [dbo].[Order]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductInMenuId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductInMenuId] ON [dbo].[OrderDetail]
(
	[ProductInMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_SupplierStoreId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_SupplierStoreId] ON [dbo].[Product]
(
	[SupplierStoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInMenu_MenuId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInMenu_MenuId] ON [dbo].[ProductInMenu]
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductInMenu_ProductId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductInMenu_ProductId] ON [dbo].[ProductInMenu]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_AreaId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Room_AreaId] ON [dbo].[Room]
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_FloorId]    Script Date: 10/12/2023 6:56:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Room_FloorId] ON [dbo].[Room]
(
	[FloorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComboProduct]  WITH CHECK ADD  CONSTRAINT [FK_ComboProduct_Product] FOREIGN KEY([ProductId])
    REFERENCES [dbo].[Product] ([Id])
    GO
ALTER TABLE [dbo].[ComboProduct] CHECK CONSTRAINT [FK_ComboProduct_Product]
    GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_TimeSlot] FOREIGN KEY([TimeSlotId])
    REFERENCES [dbo].[TimeSlot] ([Id])
    GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_TimeSlot]
    GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
    REFERENCES [dbo].[Customer] ([Id])
    GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
    GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Room1] FOREIGN KEY([RoomId])
    REFERENCES [dbo].[Room] ([Id])
    GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Room1]
    GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
    REFERENCES [dbo].[Order] ([Id])
    GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
    GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductInMenu] FOREIGN KEY([ProductInMenuId])
    REFERENCES [dbo].[ProductInMenu] ([Id])
    GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductInMenu]
    GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
    REFERENCES [dbo].[Category] ([Id])
    GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
    GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([SupplierStoreId])
    REFERENCES [dbo].[Store] ([Id])
    GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
    GO
ALTER TABLE [dbo].[ProductInMenu]  WITH CHECK ADD  CONSTRAINT [FK_ProductInMenu_Menu] FOREIGN KEY([MenuId])
    REFERENCES [dbo].[Menu] ([Id])
    GO
ALTER TABLE [dbo].[ProductInMenu] CHECK CONSTRAINT [FK_ProductInMenu_Menu]
    GO
ALTER TABLE [dbo].[ProductInMenu]  WITH CHECK ADD  CONSTRAINT [FK_ProductInMenu_Product] FOREIGN KEY([ProductId])
    REFERENCES [dbo].[Product] ([Id])
    GO
ALTER TABLE [dbo].[ProductInMenu] CHECK CONSTRAINT [FK_ProductInMenu_Product]
    GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Area] FOREIGN KEY([AreaId])
    REFERENCES [dbo].[Area] ([Id])
    GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Area]
    GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Floor] FOREIGN KEY([FloorId])
    REFERENCES [dbo].[Floor] ([Id])
    GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Floor]
    GO
    USE [master]
    GO
ALTER DATABASE [BookManagementDB] SET  READ_WRITE 
GO
