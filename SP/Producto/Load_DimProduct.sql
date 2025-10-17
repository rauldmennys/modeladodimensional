
CREATE PROCEDURE [dbo].[Load_DimProduct]
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @EndOfTime datetime =  '9999-12-31';
	DECLARE @LastDateLoaded datetime;

    BEGIN TRAN;

    -- Get the lineage of the current load of Dim_Product
	DECLARE @LineageKey int = (SELECT TOP(1) [LineageKey]
                               FROM int.Lineage
                               WHERE [TableName] = N'Dim_Product'
                               AND [FinishLoad] IS NULL
                               ORDER BY [LineageKey] DESC);


	IF NOT EXISTS (SELECT * FROM Dim_Product WHERE [_Source Key] = '')
INSERT INTO [dbo].[Dim_Product]
           ([_Source Key]
           ,[Product Name]
           ,[Product Code]
           ,[Product Description]
           ,[Product Subcategory]
           ,[Product Category]
           ,[Product Department]
           ,[Unit Of Measure Code]
           ,[Unit Of Measure Name]
           ,[Unit Price]
           ,[Discontinued]
           ,[Valid From]
           ,[Valid To]
           ,[Lineage Key])
     VALUES
           ('', 'N/A', 'N/A','N/A','N/A','N/A','N/A','N/A','N/A', -1, 'N/A', '1753-01-01', '9999-12-31', -1)

	-- Update the validity date of modified products in Dim_Product. 
	-- The rows will not be active anymore, because the staging table holds newer versions
    UPDATE prod
    SET prod.[Valid To] = mprod.[Valid From]
    FROM 
		Dim_Product AS prod INNER JOIN 
		Staging_Product AS mprod ON prod.[_Source Key] = mprod.[_Source Key]
    WHERE prod.[Valid To] = @EndOfTime

    -- Insert new rows for the modified products
	INSERT Dim_Product
		    ([_Source Key]
           ,[Product Name]
           ,[Product Code]
           ,[Product Description]
           ,[Product Subcategory]
           ,[Product Category]
           ,[Product Department]
           ,[Unit Of Measure Code]
           ,[Unit Of Measure Name]
           ,[Unit Price]
           ,[Discontinued]
           ,[Valid From]
           ,[Valid To]
           ,[Lineage Key])
    SELECT [_Source Key]
           ,[Product Name]
           ,[Product Code]
           ,[Product Description]
           ,[Product Subcategory]
           ,[Product Category]
           ,[Product Department]
           ,[Unit Of Measure Code]
           ,[Unit Of Measure Name]
           ,[Unit Price]
           ,[Discontinued]
           ,[Valid From]
           ,[Valid To]
           ,@LineageKey
    FROM Staging_Product;

    
	-- Update the lineage table for the most current Dim_Product load with the finish date and 
	-- 'S' in the Status column, meaning that the load finished successfully
	UPDATE [int].Lineage
        SET 
			FinishLoad = SYSDATETIME(),
            Status = 'S',
			@LastDateLoaded = LastLoadedDate
    WHERE [LineageKey] = @LineageKey;
	 
	
	-- Update the LoadDates table with the most current load date for Dim_Product
	UPDATE [int].[IncrementalLoads]
        SET [LoadDate] = @LastDateLoaded
    WHERE [TableName] = N'Dim_Product';

    -- All these tasks happen together or don't happen at all. 
	COMMIT;

    RETURN 0;
END;