[getBankAccounts]
SELECT * FROM bankaccount

[getById]
SELECT * FROM bankaccount WHERE objid = $P{objid}

[getFund]
SELECT f.objid AS objid, f.fundname AS fundname 
FROM fund f 
LEFT JOIN bankaccount b ON b.fundid != f.objid 
WHERE f.docstate = 'APPROVED'

[getFundByFundName]
SELECT objid FROM fund WHERE fundname = $P{fundname}

[checkDuplicateBankAccount]
SELECT COUNT(*) AS count 
FROM bankaccount 
WHERE acctno = $P{acctno} 
AND fundid = $P{fundid}


[getList]
SELECT * FROM bankaccount ${filters} ORDER BY bankname, acctno 
