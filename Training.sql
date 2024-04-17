USE [master]
GO
/****** Object:  Database [Training]    Script Date: 4/12/2024 10:48:01 AM ******/
CREATE DATABASE [Training]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Training', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Training.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Training_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Training_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Training] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Training].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Training] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Training] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Training] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Training] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Training] SET ARITHABORT OFF 
GO
ALTER DATABASE [Training] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Training] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Training] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Training] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Training] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Training] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Training] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Training] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Training] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Training] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Training] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Training] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Training] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Training] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Training] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Training] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Training] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Training] SET RECOVERY FULL 
GO
ALTER DATABASE [Training] SET  MULTI_USER 
GO
ALTER DATABASE [Training] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Training] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Training] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Training] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Training] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Training] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Training', N'ON'
GO
ALTER DATABASE [Training] SET QUERY_STORE = ON
GO
ALTER DATABASE [Training] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Training]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[PosterImage] [varchar](max) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NOT NULL,
	[LikeCourse] [int] NULL,
	[StartCourse] [int] NULL,
	[Status] [varchar](10) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Status] [varchar](20) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Documents] [varchar](max) NOT NULL,
	[AttachFile] [varchar](max) NULL,
	[TypeDocument] [varchar](20) NOT NULL,
	[PosterTopic] [varchar](max) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraineeCouse]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraineeCouse](
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CreateAt] [datetime] NULL,
	[UpdateAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainerTopic]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainerTopic](
	[UserId] [int] NOT NULL,
	[TopicId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/12/2024 10:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RolesId] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](150) NULL,
	[ExtraCode] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](30) NULL,
	[Address] [varchar](max) NOT NULL,
	[FullName] [varchar](50) NULL,
	[FistName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Education] [varchar](150) NULL,
	[ProgramLanguage] [varchar](50) NULL,
	[ToeicScore] [int] NULL,
	[Skill] [varchar](max) NULL,
	[IPClient] [varchar](max) NULL,
	[LastLogin] [datetime] NULL,
	[LastLogout] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [DF_Course_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_Status]  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Course_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Course_Categories]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Course]
GO
ALTER TABLE [dbo].[TraineeCouse]  WITH CHECK ADD  CONSTRAINT [FK_TraineeCouse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[TraineeCouse] CHECK CONSTRAINT [FK_TraineeCouse_Course]
GO
ALTER TABLE [dbo].[TraineeCouse]  WITH CHECK ADD  CONSTRAINT [FK_TraineeCouse_User] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TraineeCouse] CHECK CONSTRAINT [FK_TraineeCouse_User]
GO
ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_Topics]
GO
ALTER TABLE [dbo].[TrainerTopic]  WITH CHECK ADD  CONSTRAINT [FK_TrainerTopic_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TrainerTopic] CHECK CONSTRAINT [FK_TrainerTopic_User]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles] FOREIGN KEY([RolesId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Roles]
GO
USE [master]
GO
ALTER DATABASE [Training] SET  READ_WRITE 
GO
