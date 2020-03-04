TRUNCATE TABLE dbo.eCom_ItemTypeCustomFieldItemValue
GO

INSERT INTO dbo.eCom_ItemTypeCustomFieldItemValue
        ( ItemID ,
          ItemTypeID ,
          ItemTypeCustomFieldID ,
          Value
        )
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: PaperID]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'PaperID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: PaperID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: EventID]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'EventID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: EventID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Author]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Author'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: Author], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Abstract]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Abstract'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: Abstract], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Keywords]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Keywords'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: Keywords], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Pages]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Pages'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[Custom Field: Paper Pages], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Year]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Year'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[Custom Field: Paper Year], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Index]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Index'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[Custom Field: Paper Index], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Custom Field: Paper Source]) Value
FROM dbo.z_import_papers_20170205$ p
	INNER JOIN dbo.eCom_Items ei ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Paper Source'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[Custom Field: Paper Source], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Publication ID]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END) 
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Publication ID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[Publication ID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Price Level]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Price Level'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: Price Level], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: typelink]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'typelink'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: typelink], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: topiclink]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'topiclink'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: topiclink], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: bodytext]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'bodytext'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
WHERE ISNULL(p.[eCommerce Custom Field: bodytext], '') <> ''

-- COMMIT