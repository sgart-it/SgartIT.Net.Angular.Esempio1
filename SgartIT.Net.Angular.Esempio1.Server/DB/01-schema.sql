USE [master]
GO
CREATE DATABASE [NetAngularEsempio1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NetAngularEsempio1', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NetAngularEsempio1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NetAngularEsempio1_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\NetAngularEsempio1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NetAngularEsempio1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NetAngularEsempio1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NetAngularEsempio1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET ARITHABORT OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NetAngularEsempio1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NetAngularEsempio1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NetAngularEsempio1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NetAngularEsempio1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET RECOVERY FULL 
GO
ALTER DATABASE [NetAngularEsempio1] SET  MULTI_USER 
GO
ALTER DATABASE [NetAngularEsempio1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NetAngularEsempio1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NetAngularEsempio1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NetAngularEsempio1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NetAngularEsempio1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NetAngularEsempio1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NetAngularEsempio1', N'ON'
GO
ALTER DATABASE [NetAngularEsempio1] SET QUERY_STORE = ON
GO
ALTER DATABASE [NetAngularEsempio1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NetAngularEsempio1]
GO
CREATE USER [NetAngularEsempio1] FOR LOGIN [NetAngularEsempio1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NetAngularEsempio1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carte](
	[CartaId] [int] NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Carte] PRIMARY KEY CLUSTERED 
(
	[CartaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodotti](
	[ProdottoId] [int] NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
	[Modificabile] [bit] NOT NULL,
 CONSTRAINT [PK_Prodotti] PRIMARY KEY CLUSTERED 
(
	[ProdottoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntiVendita](
	[PuntoVenditaId] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Citta] [nvarchar](50) NOT NULL,
	[Abilitato] [bit] NOT NULL,
	[DataUltimaModifica] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PuntiVendita] PRIMARY KEY CLUSTERED 
(
	[PuntoVenditaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntiVenditaCarte](
	[PuntoVenditaId] [int] NOT NULL,
	[CartaId] [int] NOT NULL,
 CONSTRAINT [PK_PuntiVenditaCarte] PRIMARY KEY CLUSTERED 
(
	[PuntoVenditaId] ASC,
	[CartaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntiVenditaProdotti](
	[PuntoVenditaId] [int] NOT NULL,
	[ProdottoId] [int] NOT NULL,
 CONSTRAINT [PK_PuntiVenditaProdotti] PRIMARY KEY CLUSTERED 
(
	[PuntoVenditaId] ASC,
	[ProdottoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntiVenditaServizi](
	[PuntoVenditaId] [int] NOT NULL,
	[ServizioId] [int] NOT NULL,
 CONSTRAINT [PK_PuntiVenditaServizi] PRIMARY KEY CLUSTERED 
(
	[PuntoVenditaId] ASC,
	[ServizioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servizi](
	[ServizioId] [int] NOT NULL,
	[Descrizione] [nvarchar](50) NOT NULL,
	[Modificabile] [bit] NOT NULL,
 CONSTRAINT [PK_Servizi] PRIMARY KEY CLUSTERED 
(
	[ServizioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PuntiVenditaCarte]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaCarte_Carte] FOREIGN KEY([CartaId])
REFERENCES [dbo].[Carte] ([CartaId])
GO
ALTER TABLE [dbo].[PuntiVenditaCarte] CHECK CONSTRAINT [FK_PuntiVenditaCarte_Carte]
GO
ALTER TABLE [dbo].[PuntiVenditaCarte]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaCarte_PuntiVendita] FOREIGN KEY([PuntoVenditaId])
REFERENCES [dbo].[PuntiVendita] ([PuntoVenditaId])
GO
ALTER TABLE [dbo].[PuntiVenditaCarte] CHECK CONSTRAINT [FK_PuntiVenditaCarte_PuntiVendita]
GO
ALTER TABLE [dbo].[PuntiVenditaProdotti]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaProdotti_Prodotti] FOREIGN KEY([ProdottoId])
REFERENCES [dbo].[Prodotti] ([ProdottoId])
GO
ALTER TABLE [dbo].[PuntiVenditaProdotti] CHECK CONSTRAINT [FK_PuntiVenditaProdotti_Prodotti]
GO
ALTER TABLE [dbo].[PuntiVenditaProdotti]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaProdotti_PuntiVendita] FOREIGN KEY([PuntoVenditaId])
REFERENCES [dbo].[PuntiVendita] ([PuntoVenditaId])
GO
ALTER TABLE [dbo].[PuntiVenditaProdotti] CHECK CONSTRAINT [FK_PuntiVenditaProdotti_PuntiVendita]
GO
ALTER TABLE [dbo].[PuntiVenditaServizi]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaServizi_PuntiVendita] FOREIGN KEY([PuntoVenditaId])
REFERENCES [dbo].[PuntiVendita] ([PuntoVenditaId])
GO
ALTER TABLE [dbo].[PuntiVenditaServizi] CHECK CONSTRAINT [FK_PuntiVenditaServizi_PuntiVendita]
GO
ALTER TABLE [dbo].[PuntiVenditaServizi]  WITH CHECK ADD  CONSTRAINT [FK_PuntiVenditaServizi_Servizi] FOREIGN KEY([ServizioId])
REFERENCES [dbo].[Servizi] ([ServizioId])
GO
ALTER TABLE [dbo].[PuntiVenditaServizi] CHECK CONSTRAINT [FK_PuntiVenditaServizi_Servizi]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-- =============================================
-- Author:		Alberto
-- Create date: 25/03/2024
-- Description:	Salvataggio Punto Vendita
-- =============================================
DECLARE @PuntoVenditaId int = 2, @jsonData nvarchar(MAX) = '{
  "email": "aaa@bbb.it",
  "telefono": "02 4567",
  "prodotti": [1,2],
  "servizi": [3,5]
}';

EXEC [dbo].[SpuPuntiVenditaSalva] '',  PuntoVenditaId, jsonData
*/
CREATE PROCEDURE [dbo].[SpuPuntiVenditaSalva]
	@CurrentUserUPN nvarchar(128),	-- per uso futuro
	@PuntoVenditaId int,
	@JsonData nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[PuntiVendita] SET
		[email] = JSON_VALUE(@jsonData, '$.email'),
		[Telefono] = JSON_VALUE(@JsonData, '$.telefono'),
		[Abilitato]= JSON_VALUE(@JsonData, '$.abilitato')
	WHERE [PuntoVenditaId]  =@PuntoVenditaId;

	-- PRODOTTI
	DELETE FROM [dbo].[PuntiVenditaProdotti]
	WHERE [PuntoVenditaId] = @PuntoVenditaId;

	INSERT INTO [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId],[ProdottoId])
	SELECT @PuntoVenditaId, [ProdottoId]
	FROM OPENJSON(@JsonData,  N'$.prodotti') WITH (
		[ProdottoId] INT 'strict $'
	);

	-- SERVIZI
	DELETE FROM [dbo].[PuntiVenditaServizi]
	WHERE [PuntoVenditaId] = @PuntoVenditaId;

	INSERT INTO [dbo].[PuntiVenditaServizi] ([PuntoVenditaId],[ServizioId])
	SELECT @PuntoVenditaId, [ServizioId]
	FROM OPENJSON(@JsonData,  N'$.servizi') WITH (
		[ServizioId] INT 'strict $'
	);

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alberto
-- Create date: 25/03/2024
-- Description:	Dettaglio Punto Vendita
-- =============================================
ALTER PROCEDURE [dbo].[SpuPuntiVenditaDettaglio]
	@CurrentUserUPN nvarchar(128),	-- per uso futuro
	@PuntoVenditaId int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1 [PuntoVenditaId], [Codice], [Descrizione], [Email], 
		[Telefono], [Citta], [Abilitato], [DataUltimaModifica]
	FROM [dbo].[PuntiVendita]
	WHERE [PuntoVenditaId] = @PuntoVenditaId;

	SELECT A.[ProdottoId], A.[Descrizione], A.[Modificabile],
		CAST(IIF(B.[ProdottoId] IS null, 0, 1) AS bit) AS [Selected]
	FROM [dbo].[Prodotti] A
		LEFT OUTER JOIN [dbo].[PuntiVenditaProdotti] B 
			ON A.[ProdottoId] = B.[ProdottoId] AND [PuntoVenditaId] = @PuntoVenditaId
	ORDER BY A.[Descrizione];

	SELECT A.[ServizioId], A.[Descrizione], A.[Modificabile],
		CAST(IIF(B.[ServizioId] IS null, 0, 1) AS bit)  AS [Selected]
	FROM [dbo].[Servizi] A
		LEFT OUTER JOIN [dbo].[PuntiVenditaServizi] B 
			ON A.[ServizioId] = B.[ServizioId] AND [PuntoVenditaId] = @PuntoVenditaId
	ORDER BY A.[Descrizione];

	SELECT A.[CartaId], A.[Descrizione], CAST(0 as bit) AS [Modificabile],
		CAST(IIF(B.[CartaId] IS null, 0, 1) AS bit)  AS [Selected]
	FROM [dbo].[Carte] A
		LEFT OUTER JOIN [dbo].[PuntiVenditaCarte] B 
			ON A.[CartaId] = B.[CartaId] AND [PuntoVenditaId] = @PuntoVenditaId
	ORDER BY A.[Descrizione];

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alberto
-- Create date: 25/03/2024
-- Description:	Elenco Punti Vendita
-- =============================================
CREATE PROCEDURE [dbo].[SpuPuntiVenditaElenco] 
	@CurrentUserUPN nvarchar(128),	-- per uso futuro
	@Text nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @isNull bit = 0;
	if @Text is null OR @Text = ''
		SET @isNull = 1

	SELECT [PuntoVenditaId], [Codice], [Descrizione], [Citta]
	FROM [dbo].[PuntiVendita]
	WHERE @isNull=1
		OR [Codice] like '%' + @Text + '%'
		OR [Descrizione] like '%' + @Text + '%'
		OR [Telefono] like '%' + @Text + '%'
		OR [Citta] like '%' + @Text + '%'
	ORDER BY [Descrizione];
END
GO
USE [master]
GO
ALTER DATABASE [NetAngularEsempio1] SET  READ_WRITE 
GO
