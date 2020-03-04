SELECT * FROM dbo.zImport_PS_20170316

-- RELATED PROFILES WITH USERNAME/PASSWORD
SELECT p.* FROM 
dbo.Profile p
JOIN dbo.ProfileRelations pr ON p.ProfileId = pr.RelProfileID
WHERE pr.MainContact = 1 AND pr.RelationTypeID in (1, 11, 13, 14)
AND len(p.UserName) > 0
--AND p.OrgInd = 1

-- ORGANIZATION WITHOUT USERNAME/PASSWORD
SELECT pOrg.ProfileId OrgProfileId, pOrg.OrgInd OrgOrgInd, pOrg.OrgName, pOrg.UserName OrgUserName, pOrg.Password OrgPassword, 
Ind.ProfileId IndProfileId, Ind.OrgInd IndOrgInd, Ind.UserName IndUserName, Ind.Password IndPassword FROM 
dbo.Profile pOrg
JOIN dbo.ProfileRelations pr ON pOrg.ProfileId = pr.ProfileID
JOIN (
	SELECT p.* FROM 
	dbo.Profile p
	JOIN dbo.ProfileRelations pr ON p.ProfileId = pr.RelProfileID
	WHERE pr.MainContact = 1 AND pr.RelationTypeID in (1, 11, 13, 14)
	AND len(p.UserName) > 0
) Ind ON pr.RelProfileID = Ind.ProfileId
WHERE pr.RelationTypeID in (1, 11, 13, 14) AND len(pOrg.UserName) <= 0
AND pOrg.OrgInd = 1 AND Ind.OrgInd = 0

BEGIN tran

UPDATE p
SET p.UserName = tp.IndUserName, p.Password = tp.IndPassword
SELECT * FROM dbo.Profile p WITH(NOLOCK)
JOIN dbo.zImport_PS_20170316 tp ON p.ProfileId = tp.OrgProfileId
WHERE p.OrgInd = 0
COMMIT


BEGIN TRAN
UPDATE p
set p.UserName = '', p.Password = ''
FROM 
SELECT * FROM dbo.Profile p WITH(NOLOCK)
JOIN dbo.zImport_PS_20170316 tp ON p.ProfileId = tp.IndProfileId
WHERE p.OrgInd = 0

-- ORGANIZATION WITH USERNAME/PASSWORD
SELECT p.* FROM 
dbo.Profile p
JOIN dbo.ProfileRelations pr ON p.ProfileId = pr.ProfileID
JOIN (
	SELECT p.* FROM 
	dbo.Profile p
	JOIN dbo.ProfileRelations pr ON p.ProfileId = pr.RelProfileID
	WHERE pr.MainContact = 1 AND pr.RelationTypeID in (1, 11, 13, 14)
	AND len(p.UserName) > 0
) Ind ON pr.RelProfileID = Ind.ProfileId
WHERE pr.RelationTypeID in (1, 11, 13, 14) AND len(p.UserName) > 0


SELECT * FROM dbo.RelationType