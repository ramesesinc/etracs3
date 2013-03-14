[getList]
SELECT 
	objid, docstate, tdno, fullpin, barangay, prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	administratorname, administratoraddress,
	lastyearpaid, lastqtrpaid, assessedvalue , classcode, undercompromised, faasid 
FROM rptledger 
WHERE docstate LIKE $P{docstate} 
${filters}


[getLatestItem]
SELECT * FROM rptledgeritem WHERE toyear = 0 AND parentid = $P{parentid} 

[getLedgerItemList]
SELECT * FROM rptledgeritem WHERE parentid = $P{parentid} ORDER BY fromyear DESC 

[getSmallestFromYear]
SELECT MIN(fromyear) AS minfromyear FROM rptledgeritem WHERE parentid = $P{parentid} AND docstate = 'APPROVED' 


[getPayments]
SELECT 
	rp.*,  
	basic + basicint - basicdisc AS basicnet,   
	sef + sefint - sefdisc AS sefnet,  
	basic + basicint - basicdisc + sef + sefint - sefdisc AS total ,
	r.paidby, r.paidbyaddress 
FROM rptpayment rp  
	LEFT JOIN receiptlist r ON rp.receiptid = r.objid 
WHERE rp.rptledgerid = $P{ledgerid} 
ORDER BY rp.fromYear DESC, rp.fromqtr DESC   


[getPaymentsWithLguInfo]
SELECT
	rp.objid, rp.mode, rp.receiptno, rp.receiptdate, rp.collectorname, rp.period, rp.collectingagency, 
	rp.basic, rp.basicdisc, rp.basicint, rp.sef, rp.sefdisc, rp.sefint, 
	rp.basic + rp.basicint - rp.basicdisc AS basicnet,    
	rp.sef + rp.sefint - rp.sefdisc AS sefnet,  
	rp.basic + rp.basicint - rp.basicdisc + rp.sef + rp.sefint - rp.sefdisc AS total,
	r.paidby, r.paidbyaddress 
FROM rptpayment rp 
	LEFT JOIN receiptlist r ON rp.receiptid = r.objid 
WHERE rp.rptledgerid = $P{ledgerid}  
ORDER BY rp.fromYear DESC, rp.fromqtr DESC       


[updateFaasLedgerId]
UPDATE faas SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}

[updateFaasListLedgerId]
UPDATE faaslist SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}


[updateLastYearQtrPaid]
UPDATE rptledger SET 
	lastyearpaid = $P{lastyearpaid}, 
	lastqtrpaid = $P{lastqtrpaid} 
WHERE objid = $P{objid} 

[updateLedgerInfo]
UPDATE rptledger SET 
	lastyearpaid = $P{lastyearpaid}, 
	lastqtrpaid = $P{lastqtrpaid},
	quarterlyinstallmentpaidontime = $P{quarterlyinstallmentpaidontime}
WHERE objid = $P{objid} 


#------------------------------------
# PROVINCE LEDGER SUPPORT
#------------------------------------
[deleteProvinceRPTLedger]
DELETE FROM rptledger WHERE faasid = $P{faasid} 

[deleteProvinceRPTLedgerItem]
DELETE FROM rptledgeritem WHERE faasid = $P{faasid} 

[updateFAASLedgerReference]
UPDATE faas SET ledgerid = $P{ledgerid} WHERE objid = $P{objid} 

[updateFAASListLedgerReference]
UPDATE faaslist SET ledgerid = $P{ledgerid} WHERE objid = $P{objid} 



[getOnlinePaymentList]
SELECT  
	rpd.year, rpd.qtr,
	rli.tdno, rl.fullpin, rli.txntype, rli.assessedvalue,
	rpd.basic, rpd.basicdisc, rpd.basicint,
	rpd.sef, rpd.sefdisc, rpd.sefint,
	rp.receiptno, rp.receiptdate, rp.collectorname
FROM rptledger rl 
	INNER JOIN rptpayment rp ON rl.objid = rp.rptledgerid
	INNER JOIN rptpaymentdetail rpd ON rp.objid = rpd.rptpaymentid 
	INNER JOIN rptledgeritem rli ON rpd.rptledgeritemid = rli.objid 
WHERE rl.objid = $P{objid}
  AND rp.voided = 0
  AND rp.mode = 'ONLINE'
ORDER BY rpd.year DESC, rpd.qtr  DESC 
  
  
  