[getList]
SELECT * 
FROM structures 
${filters}
ORDER BY indexno

[getById]
SELECT * FROM structures WHERE objid = $P{objid}

[getMaterialList]
SELECT objid AS materialid, materialcode, materialdesc AS materialname 
FROM materials 
${filters}
ORDER BY materialcode 

