BEGIN TRAN

-- Last working profile table backup name : dbo.zabckup_20170316_PS_Profile

SELECT * INTO dbo.zabckup_20170409_PS_Profile
FROM dbo.Profile

-- RESTORE INDIVIDUALS
BEGIN TRAN
UPDATE p
SET p.UserName = bp.UserName, p.Password = bp.Password
--SELECT bp.ProfileId, bp.OrgInd, bp.UserName, bp.Password, p.UserName, p.Password, p.DateChanged, zp.IndUserName, zp.IndPassword
FROM dbo.zabckup_20170316_PS_Profile bp
JOIN dbo.Profile p ON bp.ProfileId = p.ProfileId
JOIN dbo.zImport_PS_20170316 zp ON p.ProfileId = zp.IndProfileId
WHERE 
	bp.UserName <> p.UserName AND
	p.OrgInd = 0
--ORDER BY p.DateChanged asc
-- COMMIT

BEGIN TRAN
-- Restore Organizations
UPDATE p
SET p.UserName = bp.UserName, p.Password = bp.Password
--SELECT bp.ProfileId, bp.OrgInd, bp.UserName, bp.Password, p.UserName, p.Password, p.DateChanged, zp.IndUserName, zp.IndPassword
FROM dbo.zabckup_20170316_PS_Profile bp
JOIN dbo.Profile p ON bp.ProfileId = p.ProfileId
JOIN dbo.zImport_PS_20170316 zp ON p.ProfileId = zp.OrgProfileId
WHERE 
	bp.UserName <> p.UserName AND 
	p.ProfileId NOT IN (2593) AND -- Someone updated user name for this profile after 03/16/2017 
	p.OrgInd = 1
--ORDER BY p.DateChanged asc
--ROLLBACK
-- COMMIT