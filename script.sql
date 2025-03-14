USE [Household]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressId] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](255) NULL,
	[ward] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[city] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseholdMembers]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdMembers](
	[memberId] [int] IDENTITY(1,1) NOT NULL,
	[householdId] [int] NULL,
	[cccd] [varchar](12) NULL,
	[relationship] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Households]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Households](
	[householdId] [int] IDENTITY(1,1) NOT NULL,
	[headOfHouseholdCccd] [varchar](12) NULL,
	[addressId] [int] NOT NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[householdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[logId] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NULL,
	[action] [nvarchar](100) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notificationID] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
	[message] [nvarchar](200) NOT NULL,
	[sentDate] [datetime] NULL,
	[isRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[notificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PendingHousehold]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PendingHousehold](
	[pendingId] [int] IDENTITY(1,1) NOT NULL,
	[registrationId] [int] NOT NULL,
	[headOfHouseholdCccd] [nvarchar](12) NOT NULL,
	[addressId] [int] NOT NULL,
	[relationship] [nvarchar](50) NOT NULL,
	[cccd] [nvarchar](12) NOT NULL,
	[createDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pendingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrations](
	[registrationId] [int] IDENTITY(1,1) NOT NULL,
	[cccd] [varchar](12) NOT NULL,
	[registrationType] [nvarchar](50) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NULL,
	[status] [nvarchar](20) NULL,
	[approvedBy] [varchar](12) NULL,
	[comments] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[registrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/15/2025 1:31:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[cccd] [varchar](12) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[birthday] [date] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](10) NOT NULL,
	[gender] [char](1) NULL,
	[password] [varchar](255) NOT NULL,
	[roleID] [int] NOT NULL,
	[addressID] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cccd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (1, N'Đông Cựu', N'Đông Sơn', N'Chương Mỹ', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (2, N'Yên Kiện', N'Đông Sơn', N'Chương Mỹ', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (3, N'Phố Tràng Tiền', N'Phường Tràng Tiền', N'Quận Hoàn Kiếm', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (4, N'Phố Hàng Bài', N'Phường Hàng Bài', N'Quận Hoàn Kiếm', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (5, N'Phố Đội Cấn', N'Phường Đội Cấn', N'Quận Ba Đình', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (6, N'Đường Kim Mã', N'Phường Ngọc Khánh', N'Quận Ba Đình', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (7, N'Phố Tôn Đức Thắng', N'Phường Hàng Bột', N'Quận Đống Đa', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (8, N'Phố Xã Đàn', N'Phường Nam Đồng', N'Quận Đống Đa', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (9, N'Phố Bạch Mai', N'Phường Bạch Mai', N'Quận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (10, N'Phố Minh Khai', N'Phường Vĩnh Tuy', N'Quận Hai Bà Trưng', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (11, N'Đường Nguyễn Phong Sắc', N'Phường Dịch Vọng Hậu', N'Quận Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (12, N'Đường Trần Duy Hưng', N'Phường Trung Hòa', N'Quận Cầu Giấy', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (13, N'Phố Nguyễn Trãi', N'Phường Thượng Đình', N'Quận Thanh Xuân', N'Hà Nội')
INSERT [dbo].[Address] ([addressId], [street], [ward], [district], [city]) VALUES (14, N'Đường Khuất Duy Tiến', N'Phường Nhân Chính', N'Quận Thanh Xuân', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[HouseholdMembers] ON 

INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (1, 2, N'001200000001', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (6, 2, N'001200000004', N'Vợ/Chồng')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (8, 3, N'001200000006', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (11, 3, N'001200000012', N'Anh/Chị/Em')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (13, 7, N'002200000019', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (14, 8, N'003300000021', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (17, 9, N'002200000020', N'Chủ hộ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (18, 2, N'001204050461', N'Con')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (19, 8, N'001200000111', N'Cha/Mẹ')
INSERT [dbo].[HouseholdMembers] ([memberId], [householdId], [cccd], [relationship]) VALUES (20, 10, N'001200000011', N'Chủ hộ')
SET IDENTITY_INSERT [dbo].[HouseholdMembers] OFF
GO
SET IDENTITY_INSERT [dbo].[Households] ON 

INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (2, N'001200000001', 1, CAST(N'2025-03-09' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (3, N'001200000006', 14, CAST(N'2025-03-10' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (7, N'002200000019', 4, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (8, N'003300000021', 11, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (9, N'002200000020', 4, CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Households] ([householdId], [headOfHouseholdCccd], [addressId], [createdDate]) VALUES (10, N'001200000011', 11, CAST(N'2025-03-15' AS Date))
SET IDENTITY_INSERT [dbo].[Households] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (1, N'005500000050', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-11T23:02:24.207' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (2, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-11T23:32:43.880' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (3, N'002200000016', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T12:02:25.773' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (4, N'002200000016', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T12:02:42.423' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (5, N'002200000016', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T12:05:58.037' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (6, N'001200000012', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:04:33.117' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (7, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:04:44.063' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (8, N'001200000012', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:04:46.570' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (9, N'001204050456', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T13:08:14.660' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (10, N'002200000019', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:11:46.940' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (11, N'002200000019', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:15:02.617' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (12, N'003300000021', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T13:22:39.837' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (13, N'003300000021', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T13:22:49.533' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (14, N'001200000004', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:12:34.823' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (15, N'001200000004', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:14:44.977' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (16, N'002200000020', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T16:16:04.440' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (17, N'001200000012', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T16:30:27.387' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (18, N'001200000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T17:00:39.680' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (19, N'001200000010', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:00:51.903' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (20, N'001200000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-12T17:02:16.513' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (21, N'001200000010', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:02:26.210' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (22, N'001200000012', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:15:36.317' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (23, N'001200000012', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:45.777' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (24, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:52.980' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (25, N'001200000004', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:15:58.080' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (26, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:16:01.903' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (27, N'001200000012', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:16:19.487' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (28, N'001200000010', N'Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:16:57.330' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (29, N'001200000010', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-12T17:22:53.907' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (30, N'002200000020', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-12T17:28:31.153' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (31, N'001200000001', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:54:43.783' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (32, N'001200000001', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-12T17:59:17.503' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (33, N'001200000001', N'Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới', CAST(N'2025-03-12T17:59:31.490' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (34, N'001200000001', N'Đơn tách hộ khẩu của bạn đã được duyệt!', CAST(N'2025-03-12T18:20:51.353' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (35, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-14T14:47:52.160' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (36, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-14T14:50:07.377' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (37, N'001204050461', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-14T14:50:19.090' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (38, N'001204050461', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-14T14:50:47.800' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (39, N'001204050461', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-14T14:51:00.223' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (40, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:07:31.127' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (41, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:07:59.190' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (42, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-15T12:08:03.933' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (43, N'001200000111', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:30:40.333' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (44, N'001200000111', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-15T12:31:23.980' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (45, N'001200000011', N'Đơn của bạn bị từ chối vì: ', CAST(N'2025-03-15T12:34:42.863' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (46, N'001200000011', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:41:50.650' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (47, N'001200000011', N'Đơn của bạn đã được duyệt!', CAST(N'2025-03-15T12:41:54.583' AS DateTime), 0)
INSERT [dbo].[Notifications] ([notificationID], [cccd], [message], [sentDate], [isRead]) VALUES (48, N'001202000010', N'Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.', CAST(N'2025-03-15T12:44:23.680' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[PendingHousehold] ON 

INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (1, 1, N'001200000001', 0, N'Vợ/Chồng', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (2, 2, N'001200000001', 0, N'Anh/Chị/Em', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (3, 3, N'001200000001', 0, N'Con', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (4, 4, N'001204050461', 0, N'Con', N'001200000004', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (5, 7, N'001204050461', 0, N'Con', N'001200000012', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (7, 8, N'001204050461', 1, N'Chủ hộ', N'001204050461', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (8, 10, N'001204050456', 13, N'Chủ hộ', N'001204050456', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (9, 11, N'005500000050', 12, N'Chủ hộ', N'005500000050', CAST(N'2025-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (10, 12, N'002200000016', 7, N'Chủ hộ', N'002200000016', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (11, 13, N'001200000006', 0, N'Anh/Chị/Em', N'001200000012', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (12, 14, N'002200000019', 4, N'Chủ hộ', N'002200000019', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (13, 15, N'003300000021', 11, N'Chủ hộ', N'003300000021', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (14, 18, N'002200000020', 4, N'Chủ hộ', N'002200000020', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (15, 20, N'001200000001', 0, N'Con', N'001200000010', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (16, 21, N'001200000001', 0, N'Con', N'001200000010', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (17, 25, N'001200000001', 1, N'Chủ hộ', N'001200000001', CAST(N'2025-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (18, 26, N'001200000001', 0, N'Con', N'001204050461', CAST(N'2025-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (19, 27, N'001200000001', 1, N'Con', N'001204050461', CAST(N'2025-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (20, 28, N'001200000001', 1, N'Anh/Chị/Em', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (21, 29, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (22, 30, N'003300000021', 11, N'Cha/Mẹ', N'001200000111', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (23, 31, N'001200000011', 11, N'Chủ hộ', N'001200000011', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PendingHousehold] ([pendingId], [registrationId], [headOfHouseholdCccd], [addressId], [relationship], [cccd], [createDate]) VALUES (24, 32, N'001200000011', 11, N'Con', N'001202000010', CAST(N'2025-03-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[PendingHousehold] OFF
GO
SET IDENTITY_INSERT [dbo].[Registrations] ON 

INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (1, N'001200000004', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (2, N'001200000004', N'Tạm thời', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (3, N'001200000004', N'Tạm thời', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'B?n đ? ? trong h? kh?u r')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (4, N'001200000004', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (7, N'001200000012', N'Dài hạn', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'Không t?n t?i h? kh?u')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (8, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (9, N'001204050461', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (10, N'001204050456', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (11, N'005500000050', N'Tạo hộ khẩu', CAST(N'2025-03-11' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (12, N'002200000016', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (13, N'001200000012', N'Tạm thời', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (14, N'002200000019', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (15, N'003300000021', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (16, N'001200000004', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (17, N'001200000004', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (18, N'002200000020', N'Tạo hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (19, N'001200000012', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (20, N'001200000010', N'Dài hạn', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (21, N'001200000010', N'Dài hạn', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (22, N'001200000012', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (23, N'001200000010', N'Tách hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (24, N'001200000001', N'Chuyển hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (25, N'001200000001', N'Chuyển hộ khẩu', CAST(N'2025-03-12' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (26, N'001204050461', N'Dài hạn', CAST(N'2025-03-14' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (27, N'001204050461', N'Dài hạn', CAST(N'2025-03-14' AS Date), NULL, N'Đã được chấp thuận', N'001204050461', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (28, N'001200000011', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (29, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-15' AS Date), NULL, N'Bị từ chối', NULL, N'')
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (30, N'001200000111', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Đã được chấp thuận', N'001200000011', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (31, N'001200000011', N'Tạo hộ khẩu', CAST(N'2025-03-15' AS Date), NULL, N'Đã được chấp thuận', N'001200000011', NULL)
INSERT [dbo].[Registrations] ([registrationId], [cccd], [registrationType], [startDate], [endDate], [status], [approvedBy], [comments]) VALUES (32, N'001202000010', N'Dài hạn', CAST(N'2025-03-15' AS Date), NULL, N'Đang chờ xử lý', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Registrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (3, N'Cảnh sát')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'Công dân')
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (4, N'Tổ trưởng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000001', N'Nguyễn Văn Chỉnh', CAST(N'1990-05-15' AS Date), N'nam.nguyen90@gmail.com', N'0912000001', N'M', N'1', 2, 14, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000004', N'Lê Thị Hạnh', CAST(N'1995-03-25' AS Date), N'hanh.le250395@gmail.com', N'0912000004', N'F', N'123', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000006', N'Hoàng Thị Mai', CAST(N'1988-06-05' AS Date), N'mai.hoang88@gmail.com', N'0912000006', N'F', N'1', 2, 14, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000007', N'Đỗ Văn Tùng', CAST(N'1998-01-30' AS Date), N'tung.do98@gmail.com', N'0912000007', N'M', N'123456', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000010', N'Tạ Thị Thu', CAST(N'1996-08-07' AS Date), N'thu.ta96@gmail.com', N'0912000010', N'F', N'123456', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000011', N'Nguyễn Thùy Linh', CAST(N'2004-03-02' AS Date), N'thuylinhnguyen@gmail.com', N'0862234599', N'F', N'1', 4, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000012', N'Nguyễn Minh Đức', CAST(N'2025-02-26' AS Date), N'minhducnguyen@gmail.com', N'0862234598', N'M', N'1', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001200000111', N'Trần Thị Mẫn', CAST(N'1980-03-26' AS Date), N'tranthiman123@gmail.com', N'0365544759', N'F', N'1', 2, 1, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000001', N'Nguyễn Văn An', CAST(N'1985-04-12' AS Date), N'an.nguyen85@gmail.com', N'0912000115', N'M', N'1', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000002', N'Trần Thị Bích', CAST(N'1992-07-20' AS Date), N'bich.tran92@gmail.com', N'0912000116', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000003', N'Lê Minh Tuấn', CAST(N'1990-10-05' AS Date), N'tuan.le90@gmail.com', N'0912000117', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000004', N'Phạm Hoàng Nam', CAST(N'1988-03-15' AS Date), N'nam.pham88@gmail.com', N'0912000118', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000005', N'Đặng Thị Hương', CAST(N'1995-09-25' AS Date), N'huong.dang95@gmail.com', N'0912000119', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000006', N'Bùi Văn Hậu', CAST(N'1993-06-30' AS Date), N'hau.bui93@gmail.com', N'0912000120', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000007', N'Võ Thị Lan', CAST(N'1991-11-22' AS Date), N'lan.vo91@gmail.com', N'0912000121', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000008', N'Hoàng Minh Hải', CAST(N'1987-08-14' AS Date), N'hai.hoang87@gmail.com', N'0912000122', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000009', N'Nguyễn Thị Thu', CAST(N'1996-05-18' AS Date), N'thu.nguyen96@gmail.com', N'0912000123', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000010', N'Trịnh Công Thành', CAST(N'1989-12-09' AS Date), N'thanh.trinh89@gmail.com', N'0912000124', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000011', N'Lê Thị Mai', CAST(N'1994-07-07' AS Date), N'mai.le94@gmail.com', N'0912000125', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000012', N'Nguyễn Hữu Tùng', CAST(N'1992-01-28' AS Date), N'tung.nguyen92@gmail.com', N'0912000126', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000013', N'Phạm Thùy Linh', CAST(N'1997-04-05' AS Date), N'linh.pham97@gmail.com', N'0912000127', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000014', N'Đoàn Văn Tiến', CAST(N'1990-02-17' AS Date), N'tien.doan90@gmail.com', N'0912000128', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000015', N'Lý Thu Hương', CAST(N'1993-10-31' AS Date), N'huong.ly93@gmail.com', N'0912000129', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000016', N'Trần Đăng Khoa', CAST(N'1991-06-06' AS Date), N'khoa.tran91@gmail.com', N'0912000130', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000017', N'Bùi Thị Minh', CAST(N'1986-09-12' AS Date), N'minh.bui86@gmail.com', N'0912000131', N'F', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001202000018', N'Vũ Văn Cường', CAST(N'1995-03-08' AS Date), N'cuong.vu95@gmail.com', N'0912000132', N'M', N'123456', 2, 11, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050446', N'Nguyễn Minh Phúc', CAST(N'2004-12-29' AS Date), N'nguyenminhphuc@gmail.com', N'0326930890', N'M', N'1', 3, 2, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050456', N'Tạ Thanh Tùng', CAST(N'2004-02-01' AS Date), N'tathanhtung@gmail.com', N'0332435454', N'M', N'1', 2, 2, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'001204050461', N'Đỗ Hữu Đức', CAST(N'2004-01-01' AS Date), N'dohuuduc@gmail.com', N'0376226204', N'M', N'1', 1, 1, 1)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000011', N'Nguyễn Hữu Long', CAST(N'1987-02-15' AS Date), N'long.nguyen87@gmail.com', N'0912000011', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000012', N'Trần Minh Hoàng', CAST(N'1994-05-10' AS Date), N'hoang.tran94@gmail.com', N'0912000012', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000013', N'Phan Thị Hương', CAST(N'1989-07-25' AS Date), N'huong.phan89@gmail.com', N'0912000013', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000014', N'Bùi Văn Hải', CAST(N'1991-09-08' AS Date), N'hai.bui91@gmail.com', N'0912000014', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000015', N'Lê Hoàng Phúc', CAST(N'1995-12-22' AS Date), N'phuc.le95@gmail.com', N'0912000015', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000016', N'Đặng Thị Hoa', CAST(N'1986-10-01' AS Date), N'hoa.dang86@gmail.com', N'0912000016', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000017', N'Vũ Văn Thịnh', CAST(N'1993-06-14' AS Date), N'thinh.vu93@gmail.com', N'0912000017', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000018', N'Tạ Thị Hiền', CAST(N'1980-11-29' AS Date), N'hien.ta80@gmail.com', N'0912000018', N'F', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000019', N'Hoàng Minh Tâm', CAST(N'1999-03-05' AS Date), N'tam.hoang99@gmail.com', N'0912000019', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'002200000020', N'Nguyễn Văn Hùng', CAST(N'2002-08-17' AS Date), N'hung.nguyen02@gmail.com', N'0912000020', N'M', N'123456', 2, 3, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000021', N'Nguyễn Văn An', CAST(N'1990-01-10' AS Date), N'an.nguyen90@gmail.com', N'0912000021', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000022', N'Trần Thị Bình', CAST(N'1995-06-22' AS Date), N'binh.tran95@gmail.com', N'0912000022', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000023', N'Phạm Hoàng Sơn', CAST(N'1988-03-14' AS Date), N'son.pham88@gmail.com', N'0912000023', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000024', N'Lê Minh Châu', CAST(N'1992-12-05' AS Date), N'chau.le92@gmail.com', N'0912000024', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000025', N'Hoàng Văn Kiên', CAST(N'1994-09-30' AS Date), N'kien.hoang94@gmail.com', N'0912000025', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000026', N'Ngô Thị Lan', CAST(N'1987-07-07' AS Date), N'lan.ngo87@gmail.com', N'0912000026', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000027', N'Vũ Hữu Hạnh', CAST(N'1996-11-18' AS Date), N'hanh.vu96@gmail.com', N'0912000027', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000028', N'Bùi Văn Hùng', CAST(N'1989-05-24' AS Date), N'hung.bui89@gmail.com', N'0912000028', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000029', N'Đỗ Minh Tú', CAST(N'1993-04-11' AS Date), N'tu.do93@gmail.com', N'0912000029', N'F', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'003300000030', N'Tạ Văn Tín', CAST(N'2001-08-08' AS Date), N'tin.ta01@gmail.com', N'0912000030', N'M', N'123456', 2, 5, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000031', N'Nguyễn Thị Hương', CAST(N'1990-10-15' AS Date), N'huong.nguyen90@gmail.com', N'0912000031', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000032', N'Trần Văn Hải', CAST(N'1985-12-22' AS Date), N'hai.tran85@gmail.com', N'0912000032', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000033', N'Phạm Minh Đức', CAST(N'1998-04-04' AS Date), N'duc.pham98@gmail.com', N'0912000033', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000034', N'Lê Thanh Hoa', CAST(N'1991-06-14' AS Date), N'hoa.le91@gmail.com', N'0912000034', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000035', N'Bùi Hữu Nghĩa', CAST(N'1993-08-19' AS Date), N'nghia.bui93@gmail.com', N'0912000035', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000036', N'Hoàng Thị Bích', CAST(N'2000-05-29' AS Date), N'bich.hoang00@gmail.com', N'0912000036', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000037', N'Ngô Minh Tuấn', CAST(N'1995-02-10' AS Date), N'tuan.ngo95@gmail.com', N'0912000037', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000038', N'Vũ Thị Vân', CAST(N'1986-07-17' AS Date), N'van.vu86@gmail.com', N'0912000038', N'F', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000039', N'Đỗ Văn Thanh', CAST(N'1997-03-03' AS Date), N'thanh.do97@gmail.com', N'0912000039', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'004400000040', N'Tạ Hữu Lâm', CAST(N'2002-01-20' AS Date), N'lam.ta02@gmail.com', N'0912000040', N'M', N'123456', 2, 7, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000041', N'Nguyễn Văn Tuấn', CAST(N'1990-09-12' AS Date), N'tuan.nguyen90@gmail.com', N'0912000041', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000042', N'Trần Thị Ngọc', CAST(N'1993-06-24' AS Date), N'ngoc.tran93@gmail.com', N'0912000042', N'F', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000043', N'Phạm Minh Khôi', CAST(N'1998-05-18' AS Date), N'khoi.pham98@gmail.com', N'0912000043', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000044', N'Lê Văn Lộc', CAST(N'1992-04-08' AS Date), N'loc.le92@gmail.com', N'0912000044', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000045', N'Hoàng Thị Kim', CAST(N'2000-02-02' AS Date), N'kim.hoang00@gmail.com', N'0912000045', N'F', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000046', N'Ngô Minh Hưng', CAST(N'1987-08-30' AS Date), N'hung.ngo87@gmail.com', N'0912000046', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000047', N'Vũ Hồng Quang', CAST(N'1996-07-19' AS Date), N'quang.vu96@gmail.com', N'0912000047', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000048', N'Đỗ Thị Hòa', CAST(N'1991-10-27' AS Date), N'hoa.do91@gmail.com', N'0912000048', N'F', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000049', N'Tạ Minh Tuệ', CAST(N'1989-11-09' AS Date), N'tue.ta89@gmail.com', N'0912000049', N'M', N'123456', 2, 10, 0)
INSERT [dbo].[Users] ([cccd], [fullName], [birthday], [email], [phoneNumber], [gender], [password], [roleID], [addressID], [isActive]) VALUES (N'005500000050', N'Nguyễn Văn Tiến', CAST(N'2001-12-12' AS Date), N'tien.nguyen01@gmail.com', N'0912000050', N'M', N'1', 2, 10, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_member_cccd]    Script Date: 3/15/2025 1:31:50 PM ******/
ALTER TABLE [dbo].[HouseholdMembers] ADD  CONSTRAINT [unique_member_cccd] UNIQUE NONCLUSTERED 
(
	[cccd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__B194786148257B26]    Script Date: 3/15/2025 1:31:50 PM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[roleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__4849DA018F3062D3]    Script Date: 3/15/2025 1:31:50 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164DA4BBF24]    Script Date: 3/15/2025 1:31:50 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Households] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [sentDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [isRead]
GO
ALTER TABLE [dbo].[PendingHousehold] ADD  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Registrations] ADD  DEFAULT (N'Đang chờ xử lý') FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([householdId])
REFERENCES [dbo].[Households] ([householdId])
GO
ALTER TABLE [dbo].[HouseholdMembers]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Households]  WITH CHECK ADD FOREIGN KEY([headOfHouseholdCccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[PendingHousehold]  WITH CHECK ADD FOREIGN KEY([registrationId])
REFERENCES [dbo].[Registrations] ([registrationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([approvedBy])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD FOREIGN KEY([cccd])
REFERENCES [dbo].[Users] ([cccd])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([registrationType]=N'Tạo hộ khẩu' OR [registrationType]=N'Chuyển hộ khẩu' OR [registrationType]=N'Tách hộ khẩu' OR [registrationType]=N'Lưu trú tạm thời' OR [registrationType]=N'Tạm thời' OR [registrationType]=N'Dài hạn'))
GO
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD CHECK  (([status]=N'Bị từ chối' OR [status]=N'Đã được chấp thuận' OR [status]=N'Đang chờ xử lý'))
GO
