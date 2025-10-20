ALTER PROCEDURE [dbo].[Load_StagingPaymentType]
@LastLoadDate datetime,
@NewLoadDate datetime
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

--SELECT @LastLoadDate, @NewLoadDate

SELECT 
	 'Demo|' + CONVERT(NVARCHAR, pay.[PaymentTypeID])				AS [_SourceKey],
	CONVERT(nvarchar(100),ISNULL(pay.[PaymentTypeName], 'N/A'))		AS [Payment Type Name],
	CONVERT(datetime, ISNULL(pay.[ModifiedDate], '1753-01-01'))		AS [ValidFrom],
	CONVERT(datetime, '9999-12-31')									AS [ValidTo]
FROM	
	[dbo].[PaymentTypes] pay

WHERE 
	([pay].ModifiedDate > @LastLoadDate AND [pay].ModifiedDate <= @NewLoadDate) 

    RETURN 0;
END;