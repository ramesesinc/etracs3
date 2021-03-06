[getList]
SELECT * FROM fund ${filters}

[getById]
SELECT * FROM fund WHERE objid = $P{objid}

[getFund]
SELECT fund FROM fund

[checkDuplicateFund]
SELECT COUNT(*) AS count 
FROM fund 
WHERE objid <> $P{objid}
  AND fund = $P{fund}
  AND subfund = $P{subfund} 

[checkReferencedId]
SELECT * FROM incomeaccount WHERE fundid = $P{fundid}

[getFundsWithBankAccount]
SELECT * FROM fund WHERE bankacctrequired = 1