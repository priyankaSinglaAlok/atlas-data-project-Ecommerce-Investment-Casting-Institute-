/****** Object:  UserDefinedFunction [dbo].[udfSplit]    Script Date: 02/05/2017 19:51:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


-- Create function:
CREATE FUNCTION [dbo].[udfSplit] (@s VARCHAR(512),@sep CHAR(1))
RETURNS TABLE AS
RETURN 
	(
    WITH Pieces(pn, start, stop) AS 
		(
		SELECT 1, 1, CHARINDEX(@sep, @s)
		UNION ALL
		SELECT pn + 1, stop + 1, CHARINDEX(@sep, @s, stop + 1)
		FROM Pieces
		WHERE stop > 0
		)
    SELECT pn, SUBSTRING(@s, start, CASE WHEN stop > 0 THEN stop-start ELSE 512 END) AS splitvalue
    FROM Pieces
    )

GO


