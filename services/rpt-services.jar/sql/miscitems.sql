[getList]
SELECT * 
FROM miscitems 
${filters}
ORDER BY misccode

[getById]
SELECT * FROM miscitems WHERE objid = $P{objid}
