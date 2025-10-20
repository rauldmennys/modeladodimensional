CREATE TABLE [dbo].[Staging_Location] (
    [Location Key]           INT            IDENTITY (1, 1) NOT NULL,
    [_Source Key]            NVARCHAR (200) NOT NULL,
    [Continent]              NVARCHAR (200) NOT NULL,
    [Region]                 NVARCHAR (200) NOT NULL,
    [Subregion]              NVARCHAR (200) NOT NULL,
    [Country Code]           NVARCHAR (200) NULL,
    [Country]                NVARCHAR (200) NOT NULL,
    [Country Formal Name]    NVARCHAR (200) NOT NULL,
    [Country Population]     BIGINT         NULL,
    [Province Code]          NVARCHAR (200) NOT NULL,
    [Province]               NVARCHAR (200) NOT NULL,
    [Province Population]    BIGINT         NULL,
    [City]                   NVARCHAR (200) NOT NULL,
    [City Population]        BIGINT         NULL,
    [Address Line 1]         NVARCHAR (200) NOT NULL,
    [Address Line 2]         NVARCHAR (200) NULL,
    [Postal Code]            NVARCHAR (200) NOT NULL,
    [Address Modified Date]  DATETIME       NOT NULL,
    [City Modified Date]     DATETIME       NOT NULL,
    [Province Modified Date] DATETIME       NOT NULL,
    [Country Modified Date]  DATETIME       NOT NULL,
    [Valid From]             DATETIME       NOT NULL,
    [Valid To]               DATETIME       NOT NULL
);



