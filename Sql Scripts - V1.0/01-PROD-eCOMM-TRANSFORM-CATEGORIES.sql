-- INSERT eCommerce Categories
BEGIN TRAN
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
	SELECT [eCommerce Category] Category
	FROM tblPapers WHERE [eCommerce Category] IS NOT NULL
	UNION
	SELECT [eCommerce Category] Category
	FROM dbo.z_import_publications_20170122$
)tbl
WHERE tbl.Category NOT IN (SELECT ECOM_Category FROM dbo.eCom_Categories)

-- COMMIT
-- ROLLBACK

