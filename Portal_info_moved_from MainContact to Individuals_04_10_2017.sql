SELECT * INTO dbo.zabckup_20170410_PS_Profile
FROM dbo.Profile

SELECT * INTO dbo.zImport_20170410_PS_ProfileToPort
FROM(
SELECT DISTINCT
	porg.ProfileId OrgProfileId, porg.OrgInd OrgOrgInd, porg.OrgName, porg.UserName OrgUserName, porg.Password OrgPassword, 
	porg.DateChanged OrgProfileDateChanged,
	p.ProfileId IndProfileId, p.OrgInd IndOrgInd, p.UserName IndUserName, p.Password IndPassword 
FROM 
dbo.Profile p
JOIN dbo.ProfileRelations pr ON p.ProfileId = pr.RelProfileID AND p.OrgInd = 0
JOIN dbo.Profile porg ON pr.ProfileID = porg.ProfileId AND porg.OrgInd = 1
WHERE pr.MainContact = 1 --AND pr.RelationTypeID in (1, 11, 13, 14)
AND len(p.UserName) > 0
)T
--ORDER BY porg.DateChanged asc

BEGIN TRAN

-- PORT MAIN CONTACT USERNAME/PWD TO ORGANIZATION
UPDATE p
SET p.UserName = zpp.IndUserName,
	p.Password = zpp.IndPassword,
	p.DateChanged = GETDATE()
FROM 
	dbo.Profile p
	JOIN dbo.zImport_20170410_PS_ProfileToPort zpp ON p.ProfileId = zpp.OrgProfileId
WHERE p.OrgInd = 1

BEGIN TRAN
-- CLEAR MAIN CONTACT USERNAME/PWD
UPDATE p
SET p.UserName = '',
	p.Password = '',
	p.DateChanged = GETDATE()
FROM 
	dbo.Profile p
	JOIN dbo.zImport_20170410_PS_ProfileToPort zpp ON p.ProfileId = zpp.IndProfileId
WHERE p.OrgInd = 0

-- COMMIT