CREATE VIEW dbo.vw_SKUPrice AS
SELECT
	SKU.ID,
	SKU.Code,
	SKU.Name,
	dbo.udf_GetSKUPrice(SKU.ID) AS CalcPrice
FROM dbo.SKU;