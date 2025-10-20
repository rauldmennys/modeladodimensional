CREATE TABLE [dbo].[Staging_PaymentType] (
    [Payment Type Key]  INT           IDENTITY (1, 1) NOT NULL,
    [_Source Key]       NVARCHAR (50) NOT NULL,
    [Payment Type Name] NVARCHAR (50) NOT NULL,
    [Valid From]        DATETIME      NOT NULL,
    [Valid To]          DATETIME      NOT NULL
);

