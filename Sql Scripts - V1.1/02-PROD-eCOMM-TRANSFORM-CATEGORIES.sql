/* 
 * Conversion step for eCommerce Categories
*/

TRUNCATE TABLE dbo.eCom_Categories;
GO

--BEGIN TRAN
INSERT INTO dbo.eCom_Categories
        ( ECOM_Category ,
          ECOM_desc ,
          DateCreated ,
          DateChanged ,
          ChangedBy ,
          ECOM_ParentCategoryID
        )

SELECT DISTINCT 
	tbl.Category, -- ECOM_Category
	tbl.Category, -- ECOM_desc
	GETDATE() , -- DateCreated - datetime
	GETDATE() , -- DateChanged - datetime
	N'spriyanka' , -- ChangedBy - nvarchar(50)
	0  -- ECOM_ParentCategoryID - int 
FROM 
(
	SELECT RTRIM(LTRIM(split.splitvalue)) Category
	FROM 
		dbo.z_import_papers_20170205$ 
		CROSS APPLY dbo.udfSplit([eCommerce Category],',') split
		WHERE 
			[eCommerce Category] IS NOT NULL
	UNION
	SELECT RTRIM(LTRIM(split.splitvalue)) Category
	FROM 
		dbo.z_import_publications_20170122$ 
		CROSS APPLY dbo.udfSplit([eCommerce Category],',') split
	WHERE 
		[eCommerce Category] IS NOT NULL
)tbl
ORDER BY tbl.Category
-- COMMIT
-- ROLLBACK

