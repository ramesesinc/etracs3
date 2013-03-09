[getBarangayList]
SELECT objid AS barangayid, lguname AS barangayname FROM lgu WHERE lgutype = 'BARANGAY'  ORDER BY lguname  

[getClassificationList]
SELECT objid AS classificationid, name AS classification FROM lobclassification ORDER BY name 
 
[getListByYear]
SELECT  
 p.*  
FROM bppermit p  
INNER JOIN bpapplication a on a.objid = p.applicationid  
INNER JOIN bpapplicationlisting l on l.objid = p.applicationid  
WHERE p.iyear = $P{iyear}  
 AND l.barangayname LIKE $P{barangay} 
 AND p.docstate = 'ACTIVE'  
 
 [getAppByIdActivePermit]
SELECT  
 * 
FROM bpapplication 
WHERE objid = $P{applicationid}
 AND docstate = 'ACTIVE'  
 
[getTaxpayerMasterList]
SELECT  
	a.objid,  
	p.txnno AS permitno, a.iyear,  a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, a.txntype,
	(SELECT isnull(sum(convert(decimal(16,2),value)), 0) FROM bpappinfolisting WHERE applicationid = a.objid and varname like $P{varname_capital}) AS capital,
	(SELECT isnull(sum(convert(decimal(16,2),value)), 0) FROM bpappinfolisting WHERE applicationid = a.objid and varname like $P{varname_gross}) AS gross 
FROM bpapplicationlisting a, bppermit p  
WHERE a.objid = p.applicationid  
  AND a.iyear = $P{iyear} 
ORDER BY a.txnno  

[getApplicationListing] 
SELECT 
	a.txnno AS appno, a.iyear, a.docstate, a.txntype, a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, 
	l.name AS lobname, l.classification,
	(SELECT isnull(sum(convert(decimal(10,2),value)), 0) FROM bpappinfolisting WHERE applicationid = a.objid AND lobid = bl.lobid and varname = $P{varname_capital}) AS capital,
	(SELECT isnull(sum(convert(decimal(10,2),value)), 0) FROM bpappinfolisting WHERE applicationid = a.objid AND lobid = bl.lobid and varname = $P{varname_gross}) AS gross 
FROM bpapplicationlisting a
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid 
	INNER JOIN lob l ON l.objid = bl.lobid 
WHERE a.iyear = $P{iyear} 
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayid LIKE $P{barangayid}  
  AND l.classificationid LIKE $P{classificationid} 
  AND l.objid LIKE $P{lobid} 
ORDER BY a.txnno 

[getLOBCountListing]
SELECT  
	a.iyear, 
	l.name AS lobname, 
	CONVERT(decimal(14,2), SUM(CASE WHEN a.txntype = 'NEW' THEN 1 ELSE 0 END))  AS newcount, 
	CONVERT(decimal(14,2), SUM(CASE WHEN a.txntype = 'RENEW' THEN 1 ELSE 0 END))  AS renewcount, 
	CONVERT(decimal(14,2), SUM(CASE WHEN a.txntype = 'ADDLOB' THEN 1 ELSE 0 END))  AS addlobcount, 
	CONVERT(decimal(14,2), SUM(CASE WHEN a.txntype = 'RETIRE' THEN 1 ELSE 0 END))  AS retirecount 
FROM bpapplicationlisting a 
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid  
	INNER JOIN lob l ON l.objid = bl.lobid  
WHERE a.iyear = $P{iyear}  
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayid LIKE $P{barangayid} 
  AND l.classification LIKE $P{classification} 
GROUP BY a.iyear, l.name   

[getBusinessTaxpayerList]
SELECT objid, taxpayerid, taxpayername, taxpayeraddress 
FROM bpapplicationlisting 
WHERE docstate IN ('APPROVED','PERMIT_PENDING', 'ACTIVE') 
  AND barangayid LIKE $P{barangayid} 
  
[getPermitInfo]
SELECT info FROM bppermit WHERE applicationid = $P{applicationid} 

[getBusinessTopList]
SELECT DISTINCT TOP $P{topsize}
	bb.amount 
FROM ( 
	SELECT bl.objid, SUM(CONVERT(FLOAT,bi.VALUE)) AS amount  
	FROM bpappinfolisting bi  
		INNER JOIN bpapplicationlisting bl ON bi.applicationid = bl.objid  
		INNER JOIN lob l ON l.objid = bi.lobid 
		INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
	WHERE bl.txntype = $P{txntype} 
	  AND bl.iyear = $P{year} 
	  AND bl.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
	  AND bi.varname = $P{varname}     
	  AND lc.name LIKE $P{classification}  
	GROUP BY bl.objid   
) bb  
ORDER BY bb.amount DESC   


[getBusinessTopListGroupByAmount]
SELECT 
 pa.permitno, ba.tradename, ba.businessaddress,
 ba.taxpayername, ba.taxpayeraddress, CONVERT(FLOAT,pa.amount ) AS amount 
FROM bpapplicationlisting ba, 
	( 
		SELECT t.* 
		FROM (	 
			SELECT  
			 a.objid, p.txnno as permitno,  
			 SUM(CONVERT( FLOAT,i.VALUE)) AS amount 
			FROM bpappinfolisting i  
				INNER JOIN bpapplicationlisting a ON i.applicationid = a.objid  
				INNER JOIN lob l ON l.objid = i.lobid 
				INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
				LEFT JOIN bppermit p on p.applicationid = a.objid 
			WHERE i.varname = $P{varname}  
			AND lc.name LIKE $P{classification} 
			GROUP BY a.objid, p.txnno  
		) t 
		WHERE t.amount = $P{amount}	
	) pa 
WHERE ba.txntype = $P{txntype}  
  AND ba.iyear = $P{year} 
  AND ba.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
  AND ba.objid = pa.objid 
ORDER BY pa.amount DESC  


[generateLobListing]
SELECT 
	lc.name as classification,
	l.name as lobname 
FROM lob l
INNER JOIN lobclassification lc ON l.classificationid = lc.objid 
ORDER BY lc.name, l.name 

[getAssessmentAnnually]
SELECT 
	lc.name AS classification,
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearto} THEN tf.amountdue * 1.0 ELSE 0.0 END )AS businesstaxto, 
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearfrom} THEN tf.amountdue * 1.0 ELSE 0.0 END )AS businesstaxfrom, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearto} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS regfeeto, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearfrom} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS regfeefrom, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue * 1.0 ELSE 0.0 END) AS otherfeeto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue * 1.0 ELSE 0.0 END) AS otherfeefrom,
	SUM(CASE WHEN a.iyear = $P{yearto} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS amountfrom  
FROM bptaxfeelisting tf 
	INNER JOIN bpapplication a ON a.objid = tf.applicationid  
	INNER JOIN incomeaccount ia ON ia.objid = tf.acctid  
	INNER JOIN lob l ON l.objid = tf.lobid  
	INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
WHERE a.iyear IN ( $P{yearto}, $P{yearfrom} )  
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')    
GROUP BY lc.name 
ORDER BY lc.name 

[getAssessmentQuarterly]
SELECT 
	lc.name AS classification,
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END )AS businesstaxto, 
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END )AS businesstaxfrom, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS regfeeto, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS regfeefrom, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = $P{qtr} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue * 1.0 ELSE 0.0 END) AS otherfeeto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = $P{qtr} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue * 1.0 ELSE 0.0 END) AS otherfeefrom,
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = $P{qtr} THEN tf.amountdue * 1.0 ELSE 0.0 END) AS amountfrom  
FROM bptaxfeelisting tf 
	INNER JOIN bpapplication a ON a.objid = tf.applicationid  
	INNER JOIN incomeaccount ia ON ia.objid = tf.acctid  
	INNER JOIN lob l ON l.objid = tf.lobid  
	INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
WHERE a.iyear IN ( $P{yearto}, $P{yearfrom} )  
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')    
GROUP BY lc.name 
ORDER BY lc.name

[getAnnually] 
SELECT
	lc.name AS classification, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND al.varname = $P{varname} THEN convert(decimal(16,2),al.value) ELSE 0.0 END ) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND al.varname = $P{varname} THEN convert(decimal(16,2),al.value) ELSE 0.0 END ) AS amountfrom	 
FROM lobclassification lc 
	INNER JOIN lob l ON lc.objid = l.classificationid  
	INNER JOIN bpappinfolisting al ON l.objid = al.lobid  
	INNER JOIN bpapplication a ON al.applicationid = a.objid  
WHERE  a.iyear IN ( $P{yearto}, $P{yearfrom} ) 
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')   
GROUP BY lc.name 

[getBusinessPermitSummary]
SELECT 
	a.iyear, a.iqtr, a.imonth, a.smonth,
	SUM(a.newcount) AS newcount,
	SUM(a.newamount) AS newamount,
	SUM(a.renewcount) AS renewcount,
	SUM(a.renewamount) AS renewamount,
	SUM(a.retirecount) AS retirecount,
	SUM(a.retireamount) AS retireamount,
	SUM(a.total) AS total 
FROM (
	SELECT 
		ba.objid,
		bp.iyear,
		bp.iqtr, 
		bp.imonth,
		CASE 
		WHEN bp.imonth = 1 THEN 'JANUARY'
		WHEN bp.imonth = 2 THEN 'FEBRUARY'
		WHEN bp.imonth = 3 THEN 'MARCH'
		WHEN bp.imonth = 4 THEN 'APRIL'
		WHEN bp.imonth = 5 THEN 'MAY'
		WHEN bp.imonth = 6 THEN 'JUNE'
		WHEN bp.imonth = 7 THEN 'JULY'
		WHEN bp.imonth = 8 THEN 'AUGUST'
		WHEN bp.imonth = 9 THEN 'SEPTEMBER'
		WHEN bp.imonth = 10 THEN 'OCTOBER'
		WHEN bp.imonth = 11 THEN 'NOVEMBER'
		WHEN bp.imonth = 12 THEN 'DECEMBER'
	END AS smonth,
		CASE WHEN ba.txntype IN ('NEW','ADDLOB') THEN 1 ELSE 0 END AS newcount,
		SUM(CASE WHEN ba.txntype IN ('NEW', 'ADDLOB') THEN bp.total ELSE 0.0 END) AS newamount,
		CASE WHEN ba.txntype = 'RENEW' THEN 1 ELSE 0 END AS renewcount,
		SUM(CASE WHEN ba.txntype = 'RENEW' THEN bp.total ELSE 0.0 END) AS renewamount,
		CASE WHEN ba.txntype IN ('RETIRE', 'RETIRELOB') THEN 1 ELSE 0 END AS retirecount,
		SUM(CASE WHEN ba.txntype IN ('RETIRE', 'RETIRELOB') THEN bp.amount ELSE 0.0 END) AS retireamount,
		SUM(bp.amount) AS total 
	FROM bpapplication ba
		INNER JOIN bppayment bp ON ba.objid = bp.applicationid
	WHERE bp.iyear = $P{year}
	  AND bp.voided = 0
	GROUP BY   ba.objid, bp.iyear, bp.iqtr, bp.imonth, ba.txntype  
) a
GROUP BY a.iyear, a.iqtr, a.imonth, a.smonth
ORDER BY a.iyear, a.iqtr, a.imonth


[getBusinessByTaxpayer]
SELECT objid, tradename, businessaddress 
FROM business 
WHERE taxpayerid = $P{taxpayerid}
  AND docstate = 'ACTIVE' 
  
[getQuarterly]
SELECT 
	lc.name AS classification, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS   amountto, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART(q, a.txndate) = 1 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), CONVERT( numeric(16,2), al.value)) ELSE 0.0 END ) AS amttoq1, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = 2 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amttoq2, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = 3 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amttoq3, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND DATEPART( q, a.txndate) = 4 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amttoq4, 
	 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS  amountfrom, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = 1 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amtfrmq1, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = 2 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amtfrmq2, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = 3 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amtfrmq3, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND DATEPART( q, a.txndate) = 4 AND al.varname = $P{varname} THEN CONVERT( numeric(16,2), al.value) ELSE 0.0 END ) AS amtfrmq4   
FROM lobclassification lc  
	INNER JOIN lob l ON lc.objid = l.classificationid  
	INNER JOIN bpappinfolisting al ON l.objid = al.lobid  
	INNER JOIN bpapplication a ON al.applicationid = a.objid  
WHERE  a.iyear IN ( $P{yearto}, $P{yearfrom} ) 
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')  
GROUP BY lc.name 

  
[getQtrlyPaidBusinessListing]
SELECT tmp.*
FROM (
	SELECT a.objid, a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, 
		MAX(pmt.paidqtr) AS lastqtrpaid, SUM(amount) AS amount, SUM(surcharge) AS surcharge,
		SUM(interest) AS interest, SUM(discount) AS discount, SUM(pmt.total) AS total
	FROM bpapplicationlisting a 
		INNER JOIN bppayment pmt ON a.objid = pmt.applicationid 
	WHERE a.iyear = $P{year}
	  AND a.txntype = 'RENEW' 
	  AND pmt.voided = 0
	GROUP BY a.objid, a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress
 ) tmp
 WHERE tmp.lastqtrpaid < 4   
 ORDER BY tmp.tradename   
 
 
[getListOfEmployers]
SELECT  
	a.iyear, 
	p.txnno AS permitno, 
	a.tradename, a.businessaddress, 
	'' AS sss, '' AS tin, a.taxpayername,
	SUM( bi.value ) AS numemployee
FROM bpapplicationlisting a
	INNER JOIN bppermit p ON a.objid = p.applicationid
	INNER JOIN bpappinfolisting bi ON a.objid = bi.applicationid 
WHERE a.iyear = $P{iyear}
  AND bi.varname = $P{varname}
GROUP BY p.txnno, a.tradename, a.businessaddress, a.taxpayername
ORDER BY p.txnno 

[getApplicationForDelinquencyListing]  
 SELECT objid, taxpayerid, taxpayername, taxpayeraddress 
FROM bpapplicationlisting 
WHERE docstate IN ('APPROVED','PERMIT_PENDING', 'ACTIVE', 'EXPIRED') 
  AND barangayid LIKE $P{barangayid} 

  