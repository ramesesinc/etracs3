[getList]
SELECT * 
FROM materials 
${filters}
ORDER BY materialcode

[getLookupList]
SELECT objid, materialcode, materialdesc 
FROM materials 
${filters}
ORDER BY materialcode

[getById]
SELECT * FROM materials WHERE objid = $P{objid}
