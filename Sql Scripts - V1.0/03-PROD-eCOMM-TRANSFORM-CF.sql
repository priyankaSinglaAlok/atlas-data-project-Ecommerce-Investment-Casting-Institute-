-- INSERT eCommerce Item type custom Fields
BEGIN TRAN
INSERT INTO dbo.eCom_ItemTypeCustomField
        ( Name ,
          Descr ,
          DataType ,
          Searchable ,
          ShowOnListPages ,
          ShowOnDetailPage
        )
SELECT  
	tbl.Name, -- Name - nvarchar(254),
	tbl.Name, -- Descr - nvarchar(4000),
	N'' , -- DataType - nvarchar(100)
	1 , -- Searchable - bit
	1 , -- ShowOnListPages - bit
	1  -- ShowOnDetailPage - bit
FROM
(        
	SELECT 'PaperID' AS Name
	UNION 
	SELECT 'EventID' AS Name
	UNION
	SELECT 'Author' AS Name
	UNION
	SELECT 'Abstract' AS Name
	UNION
	SELECT 'Keywords' AS Name
	UNION 
	SELECT 'Paper Pages' AS Name
	UNION
	SELECT 'Paper Year' AS Name
	UNION
	SELECT 'Paper Index' AS Name
	UNION
	SELECT 'Paper Source' AS Name
	UNION
	SELECT 'Publication ID' AS Name
	UNION
	SELECT 'Price Level' AS Name
	UNION
	SELECT 'typelink'
	UNION
	SELECT 'topiclink'
	UNION
	SELECT 'bodytext'
)tbl
WHERE tbl.Name NOT IN (SELECT c.Name FROM dbo.eCom_ItemTypeCustomField c)

-- COMMIT
