[getList]
SELECT * 
FROM rptparameters 
${filters}
ORDER BY paramname

[getById]
SELECT * FROM rptparameters WHERE objid = $P{objid}
