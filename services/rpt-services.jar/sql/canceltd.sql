[getList]
SELECT * 
FROM canceltdreason 
${filters}
ORDER BY cancelcode

[getById]
SELECT * FROM canceltdreason WHERE objid = $P{objid}
