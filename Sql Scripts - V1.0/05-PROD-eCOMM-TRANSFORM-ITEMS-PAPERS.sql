BEGIN TRAN 
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
	2 , -- ItemTypeID - int
	0 , -- CategoryID - int
	LTRIM(p.[eCommerce Item Title]), -- Title - nvarchar(200)
	N'' , -- Descr - ntext
	1 , -- SortOrder - int
	ISNULL(p.Price,0), -- Price - float
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
	0 , -- RestrictForMembersOnly - bit
	0 , -- RestrictForAffiliations - bit
	0 , -- Expires - bit
	GETDATE() , -- StartDate - datetime
	GETDATE() , -- EndDate - datetime
	0 , -- ShowAsTeaserIfRestricted - bit
	N'' , -- TeaserMessage - nvarchar(254)
	N'' , -- RestrictedMessage - nvarchar(254)
	3 , -- ItemNum - int
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
	dbo.tblPapers p
WHERE 
	ISNULL(p.[eCommerce Item Title],'') <> ''
	AND LTRIM(p.[eCommerce Item Title]) NOT IN (SELECT ei.Title FROM dbo.eCom_Items ei WHERE ei.ItemTypeID = 2)  

GO

INSERT INTO dbo.eCom_ItemCategory
        ( ItemID, CategoryID )
SELECT DISTINCT ei.ItemID, ec.ECOM_CategoryID
FROM 
	dbo.eCom_Items ei
	INNER JOIN tblPapers p ON ei.Title = LTRIM(p.[eCommerce Item Title])
	INNER JOIN dbo.eCom_Categories ec ON ec.ECOM_Category = p.[eCommerce Category]
	LEFT JOIN dbo.eCom_ItemCategory ic 
		ON ic.CategoryID = ec.ECOM_CategoryID AND ic.ItemID = ei.ItemID
WHERE 
	EI.ItemTypeID = 2 AND p.[eCommerce Category] IS NOT NULL
	AND IC.ItemCategoryID IS NULL
	
-- COMMIT