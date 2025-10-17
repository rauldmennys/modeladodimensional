CREATE TABLE [dbo].[Staging_Product] (
    [Product Key]               INT             IDENTITY (1, 1) NOT NULL,
    [_Source Key]               NVARCHAR (50)   NOT NULL,
    [Product Name]              NVARCHAR (200)  NOT NULL,
    [Product Code]              NVARCHAR (50)   NOT NULL,
    [Product Description]       NVARCHAR (200)  NOT NULL,
    [Product Subcategory]       NVARCHAR (200)  NOT NULL,
    [Product Category]          NVARCHAR (200)  NOT NULL,
    [Product Department]        NVARCHAR (200)  NOT NULL,
    [Unit Of Measure Code]      NVARCHAR (10)   NOT NULL,
    [Unit Of Measure Name]      NVARCHAR (50)   NOT NULL,
    [Unit Price]                DECIMAL (18, 2) NOT NULL,
    [Discontinued]              NVARCHAR (10)   NOT NULL,
    [Product Modified Date]     DATETIME        NOT NULL,
    [Subcategory Modified Date] DATETIME        NOT NULL,
    [Category Modified Date]    DATETIME        NOT NULL,
    [Department Modified Date]  DATETIME        NOT NULL,
    [UM Modified Date]          DATETIME        NOT NULL,
    [Valid From]                DATETIME        NOT NULL,
    [Valid To]                  DATETIME        NOT NULL
);


