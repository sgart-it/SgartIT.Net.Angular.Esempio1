USE [NetAngularEsempio1]
GO
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Modificabile]) VALUES (1, N'Prodotto 1', 1)
GO
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Modificabile]) VALUES (2, N'Prodotto 2', 1)
GO
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Modificabile]) VALUES (3, N'Prodotto 3', 1)
GO
INSERT [dbo].[Prodotti] ([ProdottoId], [Descrizione], [Modificabile]) VALUES (4, N'Prodotto 4', 1)
GO
SET IDENTITY_INSERT [dbo].[PuntiVendita] ON 
GO
INSERT [dbo].[PuntiVendita] ([PuntoVenditaId], [Codice], [Descrizione], [Email], [Telefono], [Citta], [Abilitato], [DataUltimaModifica]) VALUES (1, N'A001', N'PV001', NULL, N'02 12345', N'Milano', 1, CAST(N'2024-03-25T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[PuntiVendita] ([PuntoVenditaId], [Codice], [Descrizione], [Email], [Telefono], [Citta], [Abilitato], [DataUltimaModifica]) VALUES (2, N'A002', N'PV002', N'bbb@cccc.it', N'02 4561', N'Seveso', 1, CAST(N'2025-03-24T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[PuntiVendita] ([PuntoVenditaId], [Codice], [Descrizione], [Email], [Telefono], [Citta], [Abilitato], [DataUltimaModifica]) VALUES (3, N'B003', N'PV003', NULL, N'011 34789', N'Torino', 1, CAST(N'2025-03-25T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[PuntiVendita] OFF
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (1, 1)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (1, 2)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (1, 3)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (1, 4)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (2, 1)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (2, 2)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (2, 4)
GO
INSERT [dbo].[PuntiVenditaProdotti] ([PuntoVenditaId], [ProdottoId]) VALUES (3, 2)
GO
INSERT [dbo].[Carte] ([CartaId], [Descrizione]) VALUES (1, N'Visa')
GO
INSERT [dbo].[Carte] ([CartaId], [Descrizione]) VALUES (2, N'Mastercard')
GO
INSERT [dbo].[Carte] ([CartaId], [Descrizione]) VALUES (3, N'American Express')
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (1, 1)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (1, 2)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (1, 3)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (2, 1)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (2, 3)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (3, 1)
GO
INSERT [dbo].[PuntiVenditaCarte] ([PuntoVenditaId], [CartaId]) VALUES (3, 3)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (1, N'Servizio 1', 1)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (2, N'Servizio 2', 1)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (3, N'Servizio 3', 1)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (4, N'Servizio 4', 1)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (5, N'Servizio 5', 0)
GO
INSERT [dbo].[Servizi] ([ServizioId], [Descrizione], [Modificabile]) VALUES (6, N'Servizio 6', 0)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 1)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 2)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 3)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 4)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 5)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (1, 6)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (2, 3)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (2, 4)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (3, 1)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (3, 4)
GO
INSERT [dbo].[PuntiVenditaServizi] ([PuntoVenditaId], [ServizioId]) VALUES (3, 5)
GO
