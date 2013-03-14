[getList]
SELECT * 
FROM kindofbuilding 
${filters}
ORDER BY bldgcode

[getListByCode]
SELECT * FROM kindofbuilding WHERE bldgcode LIKE $P{bldgcode} ORDER BY bldgcode

[getListByKind]
SELECT * FROM kindofbuilding WHERE bldgkind LIKE $P{bldgkind} ORDER BY bldgcode

[getById]
SELECT * FROM kindofbuilding WHERE objid = $P{objid}

[lookupBldgKind]
SELECT objid, bldgcode, bldgkind 
FROM kindofbuilding 
${filters}
ORDER BY bldgcode