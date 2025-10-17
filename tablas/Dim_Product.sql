CREATE TABLE [dbo].[Dim_Product] (
    [Product Key]          INT             IDENTITY (1, 1) NOT NULL,
    [_Source Key]          NVARCHAR (50)   NOT NULL,
    [Product Name]         NVARCHAR (200)  NOT NULL,
    [Product Code]         NVARCHAR (50)   NOT NULL,
    [Product Description]  NVARCHAR (200)  NOT NULL,
    [Product Subcategory]  NVARCHAR (200)  NOT NULL,
    [Product Category]     NVARCHAR (200)  NOT NULL,
    [Product Department]   NVARCHAR (200)  NOT NULL,
    [Unit Of Measure Code] NVARCHAR (10)   NOT NULL,
    [Unit Of Measure Name] NVARCHAR (50)   NOT NULL,
    [Unit Price]           DECIMAL (18, 2) NOT NULL,
    [Discontinued]         NVARCHAR (10)   NOT NULL,
    [Valid From]           DATETIME        NOT NULL,
    [Valid To]             DATETIME        NOT NULL,
    [Lineage Key]          INT             NOT NULL,
    CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED ([Product Key] ASC)
);


