[getFundList]
SELECT objid AS fundid, fundname  FROM fund ORDER BY fundname 

[getChart]
SELECT objid FROM account WHERE charttype = $P{charttype} AND parentid IS NULL 
  
[getAccountByParentId]  
SELECT objid, charttype, accttitle, acctcode, accttype, acctlevel - 1 AS acctlevel 
FROM account 
WHERE parentid = $P{parentid} 
ORDER BY acctcode 

[getIncomeAccountByNGAS]
SELECT 
	objid, 'NGAS' AS charttype, CONCAT('- ', accttitle) AS accttitle, acctcode, 
	'incomeaccount' AS accttype, fundname 
FROM incomeaccount 
WHERE ngasid = $P{objid} 
ORDER BY acctno, accttitle 

[getIncomeAccountBySRE]
SELECT objid, 'SRE' AS charttype, CONCAT('- ', accttitle) AS accttitle, acctcode, 
	'incomeaccount' AS accttype, fundname 
FROM incomeaccount 
WHERE sreid = $P{objid} 
ORDER BY acctno, accttitle  


[getUnmappedIncomeAccountByNGAS]
SELECT objid, 'NGAS' AS charttype, CONCAT('<unmapped> - ', accttitle) AS accttitle, acctcode, 
	'incomeaccount' AS accttype, fundname 
FROM incomeaccount 
WHERE ngasid IS NULL 
ORDER BY acctno, accttitle  

[getUnmappedIncomeAccountBySRE]
SELECT objid, 'SRE' AS charttype, CONCAT('<unmapped>  -  ', accttitle) AS accttitle, acctcode, 
	'incomeaccount' AS accttype, fundname 
FROM incomeaccount 
WHERE sreid IS NULL 
ORDER BY acctno, accttitle  


[getAbstractOfCollection]
SELECT DISTINCT * FROM (
	SELECT 
		afid, 
		serialno, 
		receiptdate, 
		CASE WHEN voided = 0 THEN payorname ELSE '*** VOIDED ***' END AS payorname, 
		CASE WHEN voided = 0 THEN payoraddress ELSE '' END AS payoraddress, 
		CASE WHEN voided = 0 THEN accttitle ELSE '' END AS accttitle, 
		CASE WHEN voided = 0 THEN fundname ELSE '' END AS fundname, 
		CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount, 
		collectorname, 
		collectortitle  
	FROM revenue   
	WHERE liquidationtimestamp LIKE $P{txntimestamp}  
	  AND fundid LIKE $P{fundid} 
) xreport 	
ORDER BY afid, serialno  


[getAbstractAccountSummaries]
SELECT accttitle, fundname, SUM(amount) AS amount 
FROM revenue  
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY fundname, accttitle 
ORDER BY fundname, accttitle 



[getRevenueByGLAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.sreid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByGLAccountNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS acctcode,   
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.ngasid 
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 




[getStatementOfRevenueSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.sreid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid} 
  AND r.voided = 0 
GROUP BY p.pathbytitle, a.acctcode, a.accttitle 
ORDER BY a.pathbytitle, a.acctcode   


[getStatementOfRevenueNGAS]  
SELECT  
	p.pathbytitle AS pathtitle,   
	a.acctcode AS acctcode,   
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.ngasid 
	LEFT JOIN account p on p.objid = a.parentid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid} 
  AND r.voided = 0 
GROUP BY p.pathbytitle, a.acctcode, a.accttitle 
ORDER BY a.pathbytitle, a.acctcode   


[getStatementOfRevenueSimplifiedSRE] 
SELECT  
	MIN(a.acctcode) AS acctcode,  
	MIN(a.accttitle) AS accttitle, 
	MIN(p.acctcode) as parentcode, 
	MIN(p.accttitle) as parenttitle, 
	MIN(IFNULL(p.target, 0.0)) AS target, 
	SUM(r.amount) AS amount 
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.sreid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid} 
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle 
ORDER BY p.acctcode, a.acctcode 


[getStatementOfRevenueSimplifiedNGAS] 
SELECT  
	MIN(a.acctcode) AS acctcode,  
	MIN(a.accttitle) AS accttitle, 
	MIN(p.acctcode) as parentcode, 
	MIN(p.accttitle) as parenttitle, 
	MIN(IFNULL(p.target, 0.0)) AS target, 
	SUM(r.amount) AS amount 
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.ngasid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid} 
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle 
ORDER BY p.acctcode, a.acctcode 


[getStatementOfRevenueDetailedSRE]  
SELECT  
	concat(a.pathbytitle, '/', IFNULL(a.acctcode,'-'), ' - ' , IFNULL(a.accttitle,'unmapped' ) ) AS pathtitle,   
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,	
	a.acctcode AS glacctcode,   
	a.accttitle AS glaccttitle, 
	ia.acctno as acctcode, 
	ia.accttitle as accttitle, 
	SUM(r.amount) AS amount  
FROM revenue r  
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid  
	LEFT JOIN account a ON a.objid = ia.sreid  
	LEFT JOIN account p on p.objid = a.parentid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}   
  AND r.voided = 0  
GROUP BY a.pathbytitle, ia.acctcode, ia.accttitle 
ORDER BY concat(a.pathbytitle, '/', IFNULL(a.acctcode,'unmapped'), ' - ' , IFNULL(a.accttitle,'unmapped' ) ), ia.acctno, ia.accttitle  

 
[getStatementOfRevenueDetailedNGAS]  
SELECT  
	concat(a.pathbytitle, '/', IFNULL(a.acctcode,'-'), ' - ' , IFNULL(a.accttitle,'unmapped' ) ) AS pathtitle,   
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,	
	a.acctcode AS glacctcode,   
	a.accttitle AS glaccttitle, 
	ia.acctno as acctcode,
	ia.accttitle as accttitle,
	SUM(r.amount) AS amount 
FROM revenue r  
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid  
	LEFT JOIN account a ON a.objid = ia.ngasid  
	LEFT JOIN account p on p.objid = a.parentid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}   
  AND r.voided = 0  
GROUP BY a.pathbytitle, ia.acctcode, ia.accttitle 
ORDER BY concat(a.pathbytitle, '/', IFNULL(a.acctcode,'unmapped'), ' - ' , IFNULL(a.accttitle,'unmapped' ) ), ia.acctno, ia.accttitle  


[getStatementOfRevenueExpandedSRE]  
SELECT  
	CASE WHEN a.pathbytitle IS NULL THEN p.pathbytitle ELSE a.pathbytitle END AS pathtitle,   
	CASE WHEN a.acctcode IS NULL THEN p.acctcode ELSE a.acctcode END AS acctcode,   
	CASE WHEN a.accttitle IS NULL THEN p.accttitle ELSE a.accttitle END AS accttitle, 	 
	SUM(r.amount) AS amount  
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.sresubacctid      
	LEFT JOIN account p ON p.objid = ia.sreid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}      
  AND r.voided = 0 
GROUP BY a.pathbytitle, p.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY CASE WHEN a.pathbytitle IS NULL THEN p.pathbytitle ELSE a.pathbytitle END

[getStatementOfRevenueExpandedNGAS]  
SELECT  
	CASE WHEN a.pathbytitle IS NULL THEN p.pathbytitle ELSE a.pathbytitle END AS pathtitle,   
	CASE WHEN a.acctcode IS NULL THEN p.acctcode ELSE a.acctcode END AS acctcode,   
	CASE WHEN a.accttitle IS NULL THEN p.accttitle ELSE a.accttitle END AS accttitle, 	 
	SUM(r.amount) AS amount  
FROM revenue r 
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
	LEFT JOIN account a ON a.objid = ia.ngassubacctid      
	LEFT JOIN account p ON p.objid = ia.ngasid 
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}      
  AND r.voided = 0 
GROUP BY a.pathbytitle, p.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY CASE WHEN a.pathbytitle IS NULL THEN p.pathbytitle ELSE a.pathbytitle END


#-------------------------------------------
# Report of Collection 2
#-------------------------------------------
[getAffectedNGLListingNGAS]
SELECT DISTINCT 
	p.objid AS parentglacctid,
	p.acctcode AS parentglcode,  
	p.accttitle AS parentgltitle,  
	a.objid AS glacctid, 
	a.acctcode AS glcode, 
	a.accttitle AS gltitle  
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp} 
  AND r.voided = 0 
ORDER BY p.acctcode, a.acctcode 


[getReportOfCollection2NGAS]
SELECT  
	p.acctcode AS parentglacctcode, 
	p.accttitle AS parentglaccttitle, 
	a.acctcode AS glacctcode, 
	a.accttitle AS glaccttitle,  
	r.receiptid, r.remittanceno, r.receiptdate, r.serialno, r.payorname, r.collectorname,  
	r.acctid, r.amount, p.objid AS parentglacctid, a.objid AS glacctid 
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}  
  AND r.voided = 0  
ORDER BY p.acctcode, a.acctcode, r.collectorname, r.remittanceno, r.serialno 

[getReportOfCollection2SRE]
SELECT  
	p.acctcode AS parentglacctcode, 
	p.accttitle AS parentglaccttitle, 
	a.acctcode AS glacctcode, 
	a.accttitle AS glaccttitle,  
	r.receiptid, r.remittanceno, r.receiptdate, r.serialno, r.payorname, r.collectorname,  
	r.acctid, r.amount, p.objid AS parentglacctid, a.objid AS glacctid 
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.sreid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}  
  AND r.voided = 0  
ORDER BY p.acctcode, a.acctcode, r.collectorname, r.remittanceno, r.serialno 


[getCheckPaymentsYearly]
SELECT 
	r.collectorname, r.serialno, r.txndate, r.paidby, i.amount, i.extended 
FROM paymentitem i 
INNER JOIN receiptlist r ON r.objid=i.receiptid 
INNER JOIN remittance rl ON rl.objid=r.remittanceid 
INNER JOIN liquidation l ON l.objid=rl.liquidationid 
WHERE i.paytype='CHECK' 
	AND r.iyear = $P{iyear} 
	AND r.collectorid LIKE $P{collectorid} 
	AND r.paidby LIKE $P{paidby} 
	AND r.voided = 0 
ORDER BY r.txndate, r.paidby 


[getCheckPaymentsMonthly]
SELECT 
	r.collectorname, r.serialno, r.txndate, r.paidby, i.amount, i.extended 
FROM paymentitem i 
INNER JOIN receiptlist r ON r.objid=i.receiptid 
inner JOIN remittance rl ON rl.objid=r.remittanceid 
INNER JOIN liquidation l ON l.objid=rl.liquidationid 
WHERE i.paytype='CHECK' 
	AND r.iyear = $P{iyear} 
	AND r.imonth = $P{imonth} 
	AND r.collectorid LIKE $P{collectorid} 
	AND r.paidby LIKE $P{paidby} 
	AND r.voided = 0 
ORDER BY r.txndate, r.paidby 


[getCheckPaymentsDateRanged]
SELECT 
	r.collectorname, r.serialno, r.txndate, r.paidby, i.amount, i.extended 
FROM paymentitem i 
INNER JOIN receiptlist r ON r.objid=i.receiptid 
INNER JOIN remittance rl ON rl.objid=r.remittanceid 
INNER JOIN liquidation l ON l.objid=rl.liquidationid 
WHERE i.paytype='CHECK' 
	AND r.txndate BETWEEN $P{dtfrom} AND $P{dtto} 
	AND r.collectorid LIKE $P{collectorid} 
	AND r.paidby LIKE $P{paidby} 
	AND r.voided = 0 
ORDER BY r.txndate, r.paidby 



[getReportOfCollectionByIncomeAccount]
SELECT  
	r.receiptdate, r.serialno, r.payorname, ia.objid, 
	ia.accttitle, r.amount
FROM revenue r  
	INNER JOIN incomeaccount ia ON r.acctid = ia.objid   
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.objid = $P{incomeacctid}
  AND r.voided = 0  
ORDER BY r.serialno   