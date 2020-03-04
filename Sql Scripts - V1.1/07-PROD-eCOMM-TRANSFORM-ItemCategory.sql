TRUNCATE TABLE dbo.eCom_ItemCategory
GO

INSERT INTO dbo.eCom_ItemCategory
        ( ItemID, CategoryID )
SELECT DISTINCT ei.ItemID, ec.ECOM_CategoryID 
FROM 
	dbo.eCom_Items ei
	INNER JOIN dbo.z_import_papers_20170205$ p ON ei.Title = LTRIM(p.[eCommerce Item Title])
	CROSS APPLY dbo.udfSplit(p.[eCommerce Category],',') split
	INNER JOIN dbo.eCom_Categories ec ON ec.ECOM_Category = RTRIM(LTRIM(split.splitvalue))
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE 
	p.[eCommerce Category] IS NOT NULL
UNION
SELECT DISTINCT ei.ItemID, ec.ECOM_CategoryID 
FROM 
	dbo.eCom_Items ei
	INNER JOIN dbo.z_import_publications_20170122$ p ON ei.Title = LTRIM(p.[eCommerce Item Title])
	CROSS APPLY dbo.udfSplit(p.[eCommerce Category],',') split
	INNER JOIN dbo.eCom_Categories ec ON ec.ECOM_Category = RTRIM(LTRIM(split.splitvalue))
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE 
	p.[eCommerce Category] IS NOT NULL
	
-- COMMIT