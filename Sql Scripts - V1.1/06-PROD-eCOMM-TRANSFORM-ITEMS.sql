TRUNCATE TABLE dbo.eCom_Items
GO

INSERT INTO dbo.eCom_Items
        ( Inactive ,
          ItemTypeID ,
          CategoryID ,
          Title ,
          Descr ,
          SortOrder ,
          Price ,
          InfoURL ,
          IconURL ,
          ImageURL ,
          ImageLink ,
          SmallImageURL ,
          SmallImageLink ,
          SalesTax ,
          DateCreated ,
          DateChanged ,
          ChangedBy ,
          RestrictForMembersOnly ,
          RestrictForAffiliations ,
          Expires ,
          StartDate ,
          EndDate ,
          ShowAsTeaserIfRestricted ,
          TeaserMessage ,
          RestrictedMessage ,
          ItemNum ,
          ItemNum_SalesTax ,
          ShippingAllowDownload ,
          ContentID ,
          DownloadAccessDays ,
          Keywords ,
          LimitedInventory ,
          UnitOfMeasure ,
          MinOrder ,
          ProfileID
        )
SELECT DISTINCT
	0 , -- Inactive - bit
	tbl.ECOM_ItemTypeID , -- ItemTypeID - int
	0 , -- CategoryID - int
	tbl.Title, -- Title - nvarchar(200)
	tbl.Description , -- Descr - ntext
	1 , -- SortOrder - int
	tbl.Price, -- Price - float
	N'' , -- InfoURL - ntext
	N'' , -- IconURL - ntext
	N'' , -- ImageURL - ntext
	N'' , -- ImageLink - ntext
	N'' , -- SmallImageURL - ntext
	N'' , -- SmallImageLink - ntext
	0 , -- SalesTax - bit
	GETDATE() , -- DateCreated - datetime
	GETDATE() , -- DateChanged - datetime
	N'spriyanka' , -- ChangedBy - nvarchar(50)
	tbl.RestrictForMembersOnly , -- RestrictForMembersOnly - bit
	0 , -- RestrictForAffiliations - bit
	0 , -- Expires - bit
	GETDATE() , -- StartDate - datetime
	GETDATE() , -- EndDate - datetime
	tbl.ShowAsTeaserIfRestricted , -- ShowAsTeaserIfRestricted - bit
	tbl.TeaserMessage , -- TeaserMessage - nvarchar(254)
	N'' , -- RestrictedMessage - nvarchar(254)
	tbl.ItemNum , -- ItemNum - int
	0 , -- ItemNum_SalesTax - int
	0 , -- ShippingAllowDownload - bit
	0 , -- ContentID - int
	0 , -- DownloadAccessDays - int
	'' , -- Keywords - ntext
	0 , -- LimitedInventory - bit
	N'' , -- UnitOfMeasure - nvarchar(100)
	0 , -- MinOrder - int
	0  -- ProfileID - int
FROM 
( 
	SELECT 	
		it.ECOM_ItemTypeID , -- ItemTypeID - int	
		LTRIM(p.[eCommerce Item Title]) Title, -- Title - nvarchar(200)	
		N'' Description, -- Descr - ntext
		ISNULL(p.Price,0) Price, -- Price - float
		0 RestrictForMembersOnly,
		0 ShowAsTeaserIfRestricted, -- ShowAsTeaserIfRestricted - bit
		N'' TeaserMessage, -- TeaserMessage - nvarchar(254)
		ISNULL(ri.ItemNum, 0) ItemNum -- ItemNum - int
	FROM
		dbo.z_import_papers_20170205$ p
		INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
		LEFT JOIN dbo.RevenueItems ri ON p.[Revenue Item] = ri.ItemName
	WHERE 
		ISNULL(p.[eCommerce Item Title],'') <> ''
	UNION
	SELECT 	
		it.ECOM_ItemTypeID , -- ItemTypeID - int	
		LTRIM(p.[eCommerce Item Title]) Title, -- Title - nvarchar(200)	
		p.[Description] Description, -- Descr - ntext
		ISNULL(p.Price,0) Price, -- Price - float
		CASE 
			WHEN p.Restricted='Y' THEN 1
			ELSE 0
		END RestrictForMembersOnly, -- RestrictForMembersOnly - bit
		CASE 
			WHEN p.Restricted='Y' THEN 1
			ELSE 0
		END ShowAsTeaserIfRestricted, -- ShowAsTeaserIfRestricted - bit
		CASE 
			WHEN p.Restricted='Y' THEN N'Login for access to member pricing'
			ELSE N''
		END TeaserMessage, -- TeaserMessage - nvarchar(254)
		0 ItemNum -- ItemNum - int
	FROM
		dbo.z_import_publications_20170122$ p
		INNER JOIN dbo.eCom_ItemType it ON it.ECOM_ItemType = p.[eCommerce Item Type]
	WHERE 
		ISNULL(p.[eCommerce Item Title],'') <> ''
) tbl

-- COMMIT