USE [master]
GO

/****** Object:  Table [dbo].[test]    Script Date: 2021-11-06 12:58:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[test](
	[status_payments] [varchar](50) NULL,
	[empresa] [varchar](50) NULL,
	[obrigacao_fiscal] [varchar](50) NULL,
	[valor_principal] [varchar](50) NULL,
	[total_a_pagar] [varchar](50) NULL,
	[data_vencimento] [varchar](50) NULL,
	[responsavel_atual] [varchar](50) NULL
) ON [PRIMARY]
GO


