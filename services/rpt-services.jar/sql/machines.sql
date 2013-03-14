[getList]
SELECT * 
FROM machines 
${filters}
ORDER BY machinecode


[getById]
SELECT * FROM machines WHERE objid = $P{objid}
