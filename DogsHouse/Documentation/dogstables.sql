USE [DogsHouse]
GO
/****** Object:  Table [dbo].[Dogs]    Script Date: 5.4.2023. 16:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nchar](10) NULL,
	[Microchip] [nvarchar](50) NULL,
	[BrojRodovnika] [nchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[OwnerId] [int] NULL,
	[BreederId] [int] NULL,
 CONSTRAINT [PK_Dogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 5.4.2023. 16:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[UserAddress] [nvarchar](max) NOT NULL,
	[LoginProfileId] [nvarchar](450) NOT NULL,
	[IsBreeder] [bit] NOT NULL,
	[IsOwner] [bit] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_IsBreeder]  DEFAULT ((0)) FOR [IsBreeder]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_IsOwner]  DEFAULT ((0)) FOR [IsOwner]
GO
ALTER TABLE [dbo].[Dogs]  WITH CHECK ADD  CONSTRAINT [FK_Dogs_UserProfile] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Dogs] CHECK CONSTRAINT [FK_Dogs_UserProfile]
GO
ALTER TABLE [dbo].[Dogs]  WITH CHECK ADD  CONSTRAINT [FK_Dogs_UserProfile1] FOREIGN KEY([BreederId])
REFERENCES [dbo].[UserProfile] ([Id])
GO
ALTER TABLE [dbo].[Dogs] CHECK CONSTRAINT [FK_Dogs_UserProfile1]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_AspNetUsers] FOREIGN KEY([LoginProfileId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_AspNetUsers]
GO
