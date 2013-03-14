[getList]
SELECT * 
FROM plantsandtrees 
${filters}
ORDER BY planttreecode

[getById]
SELECT * FROM plantsandtrees WHERE objid = $P{objid}
