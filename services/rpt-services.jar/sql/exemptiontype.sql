[getList]
SELECT * 
FROM exemptiontype 
${filters}
ORDER BY orderno

[lookupList]
SELECT objid AS exemptid, exemptcode AS exemptcode, exemptdesc AS exemptname 
FROM exemptiontype 
${filters}
ORDER BY orderno

[getById]
SELECT * FROM exemptiontype WHERE objid = $P{objid}
