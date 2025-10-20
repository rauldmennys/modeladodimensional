CREATE TABLE [dbo].[Dim_PaymentType] (
    [Payment Type Key]  INT           IDENTITY (1, 1) NOT NULL,
    [_Source Key]       NVARCHAR (50) NOT NULL,
    [Payment Type Name] NVARCHAR (50) NOT NULL,
    [Valid From]        DATETIME      NOT NULL,
    [Valid To]          DATETIME      NOT NULL,
    [Lineage Key]       INT           NOT NULL,
    CONSTRAINT [PK_Dim_PaymentType] PRIMARY KEY CLUSTERED ([Payment Type Key] ASC)
);



