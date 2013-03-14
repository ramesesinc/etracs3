[getList]
SELECT * 
FROM propertyclassification 
${filters}
ORDER BY orderno


[lookupList]
SELECT objid as classid, propertycode as classcode, propertydesc as classname 
FROM propertyclassification 
${filters}
ORDER BY orderno


[getById]
SELECT * FROM propertyclassification WHERE objid = $P{objid}

[checkReferencedLCUVId]
SELECT COUNT(*) AS count FROM lcuv WHERE objid = $P{objid}

[checkReferencedAgriId]
SELECT COUNT(*) AS count FROM rptsetting WHERE agriculturalid = $P{objid}

[checkReferencedSettingId]
SELECT propertyclassifications FROM rptsetting
