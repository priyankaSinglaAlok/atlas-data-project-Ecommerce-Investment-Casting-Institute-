BEGIN TRAN
INSERT INTO dbo.eCom_ItemTypeCustomFieldItemValue
        ( ItemID ,
          ItemTypeID ,
          ItemTypeCustomFieldID ,
          Value
        )
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[Publication ID]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END) 
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Publication ID'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Publications'
WHERE ISNULL(p.[Publication ID], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: Price Level]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'Price Level'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Publications'
WHERE ISNULL(p.[eCommerce Custom Field: Price Level], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: typelink]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'typelink'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Publications'
WHERE ISNULL(p.[eCommerce Custom Field: typelink], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: topiclink]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'topiclink'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Publications'
WHERE ISNULL(p.[eCommerce Custom Field: topiclink], '') <> ''
UNION ALL
SELECT DISTINCT ei.ItemID, ei.ItemTypeID, icf.ItemTypeCustomFieldID, CONVERT(NVARCHAR(4000),p.[eCommerce Custom Field: bodytext]) Value
FROM dbo.z_import_publications_20170122$ p
	INNER JOIN dbo.eCom_Items ei 
		ON ei.Title = LTRIM(p.[eCommerce Item Title]) AND ei.Price = ISNULL(p.Price, 0) 
		AND ei.RestrictForMembersOnly = (CASE WHEN ISNULL(p.Restricted, 'N') = 'Y' THEN 1 ELSE 0 END)
	INNER JOIN dbo.eCom_ItemTypeCustomField icf ON icf.Name = 'bodytext'
	INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = 'Publications'
WHERE ISNULL(p.[eCommerce Custom Field: bodytext], '') <> ''

-- COMMIT