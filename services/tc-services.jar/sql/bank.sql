[getList]
SELECT * FROM bank ${filters} ORDER BY bankname 

[getById]
SELECT * FROM bank WHERE objid = $P{objid} 

[checkDuplicateBank]
SELECT COUNT(*) AS count FROM bank WHERE bankname = $P{bankname} AND branchname = $P{branchname}

[checkIfReferenced]
SELECT COUNT(*) AS count FROM bankaccount WHERE bankid = $P{bankid}
