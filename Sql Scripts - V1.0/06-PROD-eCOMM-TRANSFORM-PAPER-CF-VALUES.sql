--BEGIN TRAN
INSERT INTO dbo.eCom_ItemTypeCustomFieldItemValue
        ( ItemID ,
          ItemTypeID ,
          ItemTypeCustomFieldID ,
          Value
        )
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: PaperID]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'PaperID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[eCommerce Custom Field: PaperID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: EventID]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'EventID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[eCommerce Custom Field: EventID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Author]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Author'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[eCommerce Custom Field: Author], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Abstract]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Abstract'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[eCommerce Custom Field: Abstract], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Keywords]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Keywords'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[eCommerce Custom Field: Keywords], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Pages]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Pages'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[Custom Field: Paper Pages], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Year]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Year'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[Custom Field: Paper Year], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Index]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Index'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[Custom Field: Paper Index], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Source]) Value
FROM tblPapers p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Source'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Papers'
WHERE ISNULL(p.[Custom Field: Paper Source], '') <> ''

-- COMMIT