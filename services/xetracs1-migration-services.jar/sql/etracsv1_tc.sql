[account_ids]
select "objid" from account 

[account_info]
SELECT 
	CASE 
		WHEN "objid" = 'NGAS2004' THEN 'NGAS' 
		WHEN "objid" = 'SIE' THEN 'SRE' 
		ELSE "objid" 
	END AS "objid", 
	'account:account' AS schemaname, 
	'1.0' AS schemaversion, 
	ISNULL(fromyear, 0), 
	toyear, 
	code AS acctcode, 
	upper(title) AS accttitle, 
	CASE WHEN charttype = 'NGAS' THEN 'NGAS' ELSE 'SRE' END AS charttype, 
	CASE WHEN dtype = 'GLAccount' THEN 'GLACCOUNT' ELSE 'CATEGORY' END AS laccttype, 
	0.0 AS target, 
	0 AS acctlevel, 
	CASE 
		WHEN parentid = 'NGAS2004' THEN 'NGAS' 
		WHEN parentid = 'SIE' THEN 'SRE' 
		ELSE parentid 
	END AS parentid, 
	CASE WHEN charttype = 'NGAS' THEN 'NGAS' ELSE 'SRE' END AS rootid, 
	'' AS pathbyids, 
	'' AS pathbytitle 
FROM account  
where "objid"=$P{objid} and parentid is not null

[account_insert]
insert into account 
(	
	"objid", schemaname, schemaversion, fromyear, 
	toyear, acctcode, accttitle, charttype, accttype, 
	target, acctlevel, parentid, rootid, pathbyids, pathbytitle
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{fromyear}, 
	$P{toyear}, $P{acctcode}, $P{accttitle}, $P{charttype}, $P{accttype}, 
	$P{target}, $P{acctlevel}, $P{parentid}, $P{rootid}, $P{pathbyids}, $P{pathbytitle}
)


[incomeaccount_ids]
select "objid" from incomeaccount

[incomeaccount_info]
SELECT 
	ia."objid" as objid, 
	'incomeacct:incomeacct' AS schemaname, 
	'1.0' AS schemaversion, 
	'APPROVED' AS docstate, 
	null AS acctno, 
	ia.title AS accttitle, 
	null AS acctcode, 
	ia.defaultvalue, 
	CASE 
		WHEN ia.type = 'RPT_BASIC_INT' THEN 'RPT_BASICINT'
		WHEN ia.type = 'RPT_BASIC_INTPREV' THEN 'RPT_BASICPREVINT'
		WHEN ia.type = 'RPT_BASIC_PREV' THEN 'RPT_BASICPREV'
		WHEN ia.type = 'RPT_SEF_INT' THEN 'RPT_SEFINT'
		WHEN ia.type = 'RPT_SEF_INTPREV' THEN 'RPT_SEFPREVINT'
		WHEN ia.type = 'RPT_SEF_PREV' THEN 'RPT_SEFPREV'
		ELSE ia.type
	END AS systype, 
	n."objid" AS ngasid, 
	n.title AS ngastitle, 
	null AS ngassubacctid, 
	null AS ngassubaccttitle, 
	s."objid" AS sreid, 
	s.title AS sretitle, 
	null AS sresubacctid, 
	null AS sresubaccttitle, 
	fund_name AS fundid, 
	fund_name AS fundname, 
	null AS amounttype 
FROM incomeaccount ia  
	LEFT JOIN account n ON ia.acctid = n."objid"  
	LEFT JOIN account s ON ia.sieacctid = s."objid"  
WHERE "objid"=$P{objid} and state = 'APPROVED'

[incomeaccount_insert] 
insert into incomeaccount 
(
	"objid", schemaname, schemaversion, docstate, acctno, accttitle, acctcode, 
	defaultvalue, systype, ngasid, ngastitle, ngassubacctid, ngassubaccttitle, 
	sreid, sretitle, sresubacctid, sresubaccttitle, fundid, fundname, amounttype
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{acctno}, $P{accttitle}, $P{acctcode}, 
	$P{defaultvalue}, $P{systype}, $P{ngasid}, $P{ngastitle}, $P{ngassubacctid}, $P{ngassubaccttitle}, 
	$P{sreid}, $P{sretitle}, $P{sresubacctid}, $P{sresubaccttitle}, $P{fundid}, $P{fundname}, $P{amounttype}
)

[collectiontype_ids]
select "objid" from collectiontype

[collectiontype_info]
SELECT 
	"objid", 
	'collectiontype:collectiontype' AS schemaname, 
	'1.0' AS schemaversion, 
	name, 
	CASE 
		WHEN appcode = 'BP' THEN 'business_tax'
		WHEN appcode = 'BPFR' THEN 'burial_permit'
		WHEN appcode = 'LCO' THEN 'cattle_ownership'
		WHEN appcode = 'LCT' THEN 'cattle_transfer'
		WHEN appcode = 'MLFR' THEN 'marriage_license'
		WHEN appcode = 'RPT' THEN 'real_property'
		ELSE 'general_collection'
	END AS	appcode, 
	0 AS payorrequired, 
	af AS afid 
FROM collectiontype 
where "objid" = $P{objid} 

[collectiontype_insert]
INSERT INTO collectiontype 
(
	"objid", schemaname, schemaversion, name, appcode, payorrequired, afid
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{name}, $P{appcode}, $P{payorrequired}, $P{afid}
)

[afinventory_ids]
select "objid" from afcontrol

[afinventory_info]
SELECT  
	a."objid", 'afcontrol:afcontrol' AS schemaname, '1.0' AS schemaversion, 'CLOSED' AS docstate, 
	'' AS irafid, '' AS irafno, 'LGU' AS iraftype, af_objid as afid, 'serial' AS aftype, 'STUB' AS afunit, 
	0 AS stubfrom, 0 AS stubto, 1 AS qtyonhand, 1 AS qtyissued, a.prefix, a.suffix, a.startseries, 
	a.endseries, a.startseries AS issuedfrom, a.endseries  AS issuedto, a.dtissued AS dtposted, 
	7 AS aflength, 0 AS currentstub, null AS stubprefix, a.startseries AS startserialno 
FROM afcontrol a  
WHERE a."objid"=$P{objid} and a.dtype = 'SerialAFControl' 
  AND a.currentseries <= a.endseries
  
[afinventory_insert]
insert into afinventory 
(
	"objid", schemaname, schemaversion, docstate, irafid, irafno, 
	iraftype, afid, aftype, afunit, stubfrom, stubto, qtyonhand, 
	qtyissued, prefix, suffix, startseries, endseries, issuedfrom, 
	issuedto, dtposted, aflength, currentstub, stubprefix, startserialno
)  
values 
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{irafid}, $P{irafno}, 
	$P{iraftype}, $P{afid}, $P{aftype}, $P{afunit}, $P{stubfrom}, $P{stubto}, $P{qtyonhand}, 
	$P{qtyissued}, $P{prefix}, $P{suffix}, $P{startseries}, $P{endseries}, $P{issuedfrom}, 
	$P{issuedto}, $P{dtposted}, $P{aflength}, $P{currentstub}, $P{stubprefix}, $P{startserialno} 
)

[afinventorycredit_ids]
select "objid" from afcontrol 

[afinventorycredit_info]
SELECT  
	a."objid", 'afinventorycredit' AS schemaname, '1.0' AS schemaversion, 'OPEN' AS docstate, 
	a."objid" AS afinventoryid, '' AS irafid, 'COLLECTOR' AS iraftype, a.af_objid as afid, 
	'serial' AS aftype, 'STUB' AS afunit, a.prefix, a.suffix, a.startseries, a.endseries, 
	0 AS stubfrom, 0 AS stubto, a.totalQtyIssued AS qtyissued, NULL as irafno, 0 AS stubno, 
	a.endseries - a.currentseries + 1 AS balance, 	7 AS aflength
FROM afcontrol a 
WHERE a."objid"=$P{objid} and dtype ='SerialAFControl' 
  and a.currentseries <= a.endseries  
  
[afinventorycredit_insert] 
INSERT INTO afinventorycredit 
(
	"objid", schemaname, schemaversion, docstate, afinventoryid, irafid, iraftype, 
	afid, aftype, afunit, prefix, suffix, startseries, endseries, stubfrom, stubto, 
	qtyissued, irafno, stubno, balance, aflength
)
values 
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{afinventoryid}, $P{irafid}, $P{iraftype}, 
	$P{afid}, $P{aftype}, $P{afunit}, $P{prefix}, $P{suffix}, $P{startseries}, $P{endseries}, $P{stubfrom}, $P{stubto}, 
	$P{qtyissued}, $P{irafno}, $P{stubno}, $P{balance}, $P{aflength}
)

[craaf_inventory_ids]
select "objid" from afcontrol 

[craaf_inventory_info]
SELECT
	a."objid", 'craaf:craaf' AS schemaname, '1.0' AS schemaversion, a."objid" AS afinventoryid, 
	null AS afinventorycreditid, YEAR( a.dtissued ) AS craafyear, MONTH( a.dtissued ) AS craafmonth, 
	a.collectorid as collectorid, case when u.middlename is null 
		then u.lastname + ', ' + u.firstname 
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename
	end as collectorname, a.collectortitle, a.af_objid as afid, a.totalqtyreceived AS beginqty, 
	a.startseries AS beginfrom, a.endseries AS beginto, null AS receivedqty, null AS receivedfrom, 
	null AS  receivedto, 50 AS issuedqty, a.startseries As issuedfrom, a.endseries AS issuedto, 
	null AS canceledqty, null AS canceledfrom, NULL AS canceledto, NULL AS cancelreason, 0 AS endingqty, 
	NULL AS endingfrom, NULL AS endingto, a.stub AS stubno
FROM afcontrol a 
	inner join sys_user u on a.collectorid = u."objid" 
WHERE a."objid"=$P{objid} and a.currentseries <= a.endseries  

[craaf_inventory_insert]
insert into craaf 
(
	"objid", schemaname, schemaversion, afinventoryid, afinventorycreditid, craafyear, 
	craafmonth, collectorid, collectorname, collectortitle, afid, beginqty, beginfrom, 
	beginto, receivedqty, receivedfrom, receivedto, issuedqty, issuedfrom, issuedto, 
	canceledqty, canceledfrom, canceledto, cancelreason, endingqty, endingfrom, 
	endingto, stubno
) 
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{afinventoryid}, $P{afinventorycreditid}, $P{craafyear}, 
	$P{craafmonth}, $P{collectorid}, $P{collectorname}, $P{collectortitle}, $P{afid}, $P{beginqty}, $P{beginfrom}, 
	$P{beginto}, $P{receivedqty}, $P{receivedfrom}, $P{receivedto}, $P{issuedqty}, $P{issuedfrom}, $P{issuedto}, 
	$P{canceledqty}, $P{canceledfrom}, $P{canceledto}, $P{cancelreason}, $P{endingqty}, $P{endingfrom}, 
	$P{endingto}, $P{stubno}
)

[craaf_credit_ids]
select "objid" from afcontrol

[craaf_credit_ids]
SELECT
	'I' + a."objid" AS "objid", 'craaf:craaf' AS schemaname, '1.0' AS schemaversion, NULL AS afinventoryid, 
	a."objid" AS afinventorycreditid, YEAR( a.dtissued ) AS craafyear, MONTH( a.dtissued ) AS craafmonth, 
	a.collectorid, 
	case when u.middlename is null 
		then u.lastname + ', ' + u.firstname
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename 
	end as collectorname, 
	a.collectortitle, a.af_objid as afid, a.totalqtyreceived AS beginqty, a.startseries AS beginfrom, 
	a.endseries AS beginto, a.totalqtyreceived AS receivedqty, a.startseries AS receivedfrom, 
	a.endseries AS  receivedto, 
	CASE WHEN a.currentseries = a.startseries THEN null ELSE a.currentseries - a.startseries END AS  issuedqty, 
	CASE WHEN a.currentseries = a.startseries THEN NULL ELSE a.startseries END As issuedfrom, 
	CASE WHEN a.currentseries = a.startseries THEN NULL ELSE a.currentseries - 1 END AS issuedto, 
	null AS canceledqty, null AS canceledfrom, NULL AS canceledto, NULL AS cancelreason, 
	a.endseries - a.currentseries + 1 AS endingqty, a.currentseries AS endingfrom, 
	a.endseries AS endingto, a.stub AS stubno
FROM afcontrol a
	inner join sys_user u on a.collectorid = u."objid" 
WHERE a."objid"=$P{objid} and a.dtype ='SerialAFControl' 
  and a.currentseries <= a.endseries
  
[craaf_credit_insert]
insert into craaf 
(
	"objid", schemaname, schemaversion, afinventoryid, afinventorycreditid, craafyear, 
	craafmonth, collectorid, collectorname, collectortitle, afid, beginqty, beginfrom, 
	beginto, receivedqty, receivedfrom, receivedto, issuedqty, issuedfrom, issuedto, 
	canceledqty, canceledfrom, canceledto, cancelreason, endingqty, endingfrom, 
	endingto, stubno
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{afinventoryid}, $P{afinventorycreditid}, $P{craafyear}, 
	$P{craafmonth}, $P{collectorid}, $P{collectorname}, $P{collectortitle}, $P{afid}, $P{beginqty}, $P{beginfrom}, 
	$P{beginto}, $P{receivedqty}, $P{receivedfrom}, $P{receivedto}, $P{issuedqty}, $P{issuedfrom}, $P{issuedto}, 
	$P{canceledqty}, $P{canceledfrom}, $P{canceledto}, $P{cancelreason}, $P{endingqty}, $P{endingfrom}, 
	$P{endingto}, $P{stubno}
)

[afcontrol_ids]
select "objid" from afcontrol

[afcontrol_info]
SELECT
	a."objid", 'afcontrol:afcontrol' AS schemaname, '1.0' AS schemaversion, 
	'APPROVED' AS docstate, 0 AS active, 
	case 
		when a.mode = 0 then 'ONLINE' 
		when a.mode = 1 then 'OFFLINE' 
		else 'CAPTURE'
	end AS mode, 
	a."objid" AS afinventorycreditid, a.dtissued AS dtissued, a.collectorid as collectorid, 
	case when u.middlename is null 
		then u.lastname + ', ' + u.firstname
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename
	end as collectorname, 
	a.collectortitle as collectortitle, case when stub is null then '-' else stub end AS stubno, 
	'serial' as aftype, a.af_objid as afid, a.totalqtyreceived AS qtyreceived, a.startseries, 
	a.endseries, a.currentseries, a.beginseries, a.endseries - a.beginseries + 1 AS beginqty, 
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.totalqtyissued END AS qtyissued,
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.beginseries END AS issuedfrom,
	CASE WHEN a.totalqtyissued = 0 THEN null ELSE a.currentseries - 1 END AS issuedoto,
	a.totalQtyOnHand AS balance, a.prefix, a.suffix, 7 AS serieslength, null AS receiptformat, 
	null as cancelledseries, a.dtissued as txndate
FROM afcontrol a
	inner join sys_user u on a.collectorid = u."objid" 
WHERE a."objid"=$P{objid} and a.dtype= 'SerialAFControl' 
  and a.currentseries <= a.endseries  

[afcontrol_insert]
insert into afcontrol 
(
	"objid", schemaname, schemaversion, docstate, active, mode, afinventorycreditid, 
	dtissued, collectorid, collectorname, collectortitle, stubno, aftype, afid, 
	qtyreceived, tartseries, endseries, currentseries, beginseries, beginqty, qtyissued, 
	issuedfrom, issuedto, balance, prefix, suffix, serieslength, receiptformat, 
	cancelledseries, txndate
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{active}, $P{mode}, $P{afinventorycreditid}, 
	$P{dtissued}, $P{collectorid}, $P{collectorname}, $P{collectortitle}, $P{stubno}, $P{aftype}, $P{afid}, 
	$P{qtyreceived}, $P{tartseries}, $P{endseries}, $P{currentseries}, $P{beginseries}, $P{beginqty}, $P{qtyissued}, 
	$P{issuedfrom}, $P{issuedto}, $P{balance}, $P{prefix}, $P{suffix}, $P{serieslength}, $P{receiptformat}, 
	$P{cancelledseries}, $P{txndate} 
)

[receiptlist_ids]
select "objid" from receipt 

[receiptlist_info]
SELECT 
	r1."objid", 
	CASE WHEN r1.remittanceid IS NOT NULL THEN 'CLOSED' ELSE 'OPEN' END AS docstate, 
	
	CASE WHEN r1.dtype = 'BPReceipt' THEN 'BUSINESS_TAX'
		 WHEN r1.dtype = 'CorporateCTCReceipt' THEN 'CTCC'
		 WHEN r1.dtype = 'IndividualCTCReceipt' THEN 'CTCI'
		 WHEN r1.dtype = 'LargeCattleOwnershipReceipt' THEN 'CATTLE_OWNERSHIP'
		 WHEN r1.dtype = 'MiscReceipt' THEN 'MISC'
		 WHEN r1.dtype = 'RPTReceipt' THEN 'RPT'
	END as doctype, 
	
	CASE WHEN r1.dtype = 'BPReceipt' THEN 'tc:business_tax'
	     WHEN r1.dtype = 'CorporateCTCReceipt' THEN 'tc:ctc_corporate'
		 WHEN r1.dtype = 'IndividualCTCReceipt' THEN 'tc:ctc_individual'
		 WHEN r1.dtype = 'LargeCattleOwnershipReceipt' THEN 'tc:cattle_ownership'
		 WHEN r1.dtype = 'MiscReceipt' THEN 'tc:general_collection'
		 WHEN r1.dtype = 'RPTReceipt' THEN 'tc:real_property'
	END as opener, 
	
	r1.remittanceid, 
	rem.docno as remittanceno, 
	rem.dateposted as remittancedate, 
	r1.txndate, 
	r1.dtposted, 
	YEAR( r1.txndate) AS iyear, 
	QUARTER( r1.txndate) AS iqtr, 
	MONTH( r1.txndate ) AS imonth, 
	DAY( r1.txndate ) AS iday, 
	'ONLINE' AS mode, 
	a.af_objid as afid, 
	a."objid" AS afcontrolid, 
	r1.serialno, 
	isnull(a.stub,'-') AS stubno, 
	r1.collectiontypeid, 
	ct.name AS collectiontype, 
	r1.collectorid as collectorid, 
	case when u.middlename is null 
		then (u.lastname + ', ' + u.firstname) 
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename ) 
	end as collectorname, 
	r1.collectortitle, 
	r1.payerid AS payorid, 
	r1.payername AS payorname, 
	r1.payeraddress AS payoraddress, 
	isnull(r1.paidby, r1.payername) AS paidby, 
	isnull(r1.payeraddress, r1.payeraddress) AS paidbyaddress, 
	r1.amount, 
	isnull((SELECT SUM(p.amount) FROM paymentmethod p WHERE dtype = 'CashPaymentMethod' and parentid = r1."objid" ),0.0) AS cash, 
	isnull((SELECT SUM(p.amount) FROM paymentmethod p WHERE dtype = 'CheckPaymentMethod' and parentid = r1."objid" ),0.0) AS otherpayment,
	CASE WHEN vr."objid" IS NULL THEN 0 ELSE 1 END voided, 
	vr.reason AS voidreason, 
	null AS postcaptureid,
	r1.collectorid as capturedbyid, 
	case when u.middlename is null 
		then (u.lastname + ', ' + u.firstname) 
		else u.lastname + ', ' + u.firstname + ' ' + u.middlename ) 
	end as capturedbyname, 
	r1.collectortitle as capturedbytitle, 
	r1.amount as totalpayment, 
	r1.remarks, r1.series, '[:]' as extended, null as sc_remittanceid 
FROM receipt r1
	LEFT JOIN afcontrol a ON r1.afissuedid = a."objid" 
	LEFT JOIN voidreceipt vr ON r1."objid" = vr.receipt_objid 
	LEFT join collectionremittance  rem on r1.remittanceid = rem."objid" 
	left JOIN collectiontype ct on r1.collectiontypeid = ct."objid" 
	left join sys_user u on a.collectorid = u."objid" 
where r1."objid"=$P{objid}
	
[receiptlist_insert]
insert into receiptlist
(
	"objid", docstate, doctype, opener, remittanceid, remittanceno, 
	remittancedate, txndate, dtposted, iyear, iqtr, imonth, iday, 
	mode, afid, afcontrolid, serialno, stubno, collectiontypeid, 
	collectiontype, collectorid, collectorname, collectortitle, payorid, 
	payorname, payoraddress, paidby, paidbyaddress, amount, cash, 
	otherpayment, voided, voidreason, postcaptureid, capturedbyid, 
	capturedbyname, capturedbytitle, totalpayment, remarks, series, 
	extended, sc_remittanceid 
)	
values 
(
	$P{objid}, $P{docstate}, $P{doctype}, $P{opener}, $P{remittanceid}, $P{remittanceno}, 
	$P{remittancedate}, $P{txndate}, $P{dtposted}, $P{iyear}, $P{iqtr}, $P{imonth}, $P{iday}, 
	$P{mode}, $P{afid}, $P{afcontrolid}, $P{serialno}, $P{stubno}, $P{collectiontypeid}, 
	$P{collectiontype}, $P{collectorid}, $P{collectorname}, $P{collectortitle}, $P{payorid}, 
	$P{payorname}, $P{payoraddress}, $P{paidby}, $P{paidbyaddress}, $P{amount}, $P{cash}, 
	$P{otherpayment}, $P{voided}, $P{voidreason}, $P{postcaptureid}, $P{capturedbyid}, 
	$P{capturedbyname}, $P{capturedbytitle}, $P{totalpayment}, $P{remarks}, $P{series}, 
	$P{extended}, $P{sc_remittanceid} 
)

[receiptitem_ids]
select "objid" from receiptitem

[receiptitem_info]
SELECT
	ri."objid", 
	ri.parentid AS receiptid, 
	ri.acctid, 
	ia.acctno, 
	ia.title AS accttitle, 
	ia.fund_name AS fundid, 
	ia.fund_name AS fundname, 
	ri.amount, 
	ri.remarks, 
	'[:]' AS extended, 
	NULL AS refid
FROM receiptitem ri 
	INNER JOIN incomeaccount ia ON ri.acctid = ia."objid" 
where ri."objid"  = $P{objid}
	
[receiptitem_insert]
INSERT INTO receiptitem 
(
	"objid", receiptid, acctid, acctno, accttitle, fundid, 
	fundname, amount, remarks, extended, refid
)	
values
(
	$P{objid}, $P{receiptid}, $P{acctid}, $P{acctno}, $P{accttitle}, $P{fundid}, 
	$P{fundname}, $P{amount}, $P{remarks}, $P{extended}, $P{refid}
)

[paymentitem_cash_ids]
select "objid" from paymentmethod where dtype = 'CashPaymentMethod'

[paymentitem_cash_info]
SELECT
	p."objid", 
	p.parentid AS receiptid, 
	'CASH' AS paytype, 
	'CASH PAYMENT' AS particulars, 
	p.amount, 
	'[:]' AS extended
FROM paymentmethod p
WHERE p."objid"=$P{objid}

[paymentitem_cash_insert]
INSERT INTO paymentitem 
	("objid", receiptid, paytype, particulars, amount, extended)
values
	($P{objid}, $P{receiptid}, $P{paytype}, $P{particulars}, $P{amount}, $P{extended})
	
[paymentitem_check_ids]
select "objid" from paymentmethod where dtype = 'CheckPaymentMethod'

[paymentitem_check_info]
SELECT
	p."objid", 
	p.parentid AS receiptid, 
	'CHECK' AS paytype, 
	('CHECK NO.: ' + p.checkno + '  DATE: ' + p.checkdate + '  BANK: '+ b.code ) AS particulars, 
	amount, 
	('[', 'bank:' +  '"' + b.code +'",checkdate:"' +  p.checkdate + '",checkno:"' + p.checkno + '"]') AS extended
FROM paymentmethod p
	left join bank b on p.bankid = b."objid" 
where p."objid"=$P{objid}

[paymentitem_check_insert]
INSERT INTO paymentitem 
	("objid", receiptid, paytype, particulars, amount, extended)
values
	($P{objid}, $P{receiptid}, $P{paytype}, $P{particulars}, $P{amount}, $P{extended})
	
[remittance_ids]
select "objid" from collectionremittance 

[remittance_info]
SELECT
	r."objid", 
	'remittance:remittance' AS schemaname, 
	'1.0' AS schemaversion, 
	'[:]' AS info, 
	CASE WHEN r.liquidationid IS NULL THEN 'OPEN' ELSE 'CLOSED' END AS docstate, 
	r.dateposted AS dtposted, 
	r.liquidationid, 
	l.docno as liquidationno, 
	l.dtposted as liquidationdate, 
	r.liquidatingofficerid as liquidatingofficerid, 
	r.collectorid as collectorid
FROM collectionremittance r 
	left join liquidation l on r.liquidationid = l."objid" 
where r."objid" = $P{objid} 

[remittance_insert]
insert into remittance 
(
	"objid", schemaname, schemaversion, info, docstate, dtposted, 
	liquidationid, liquidationno, liquidationdate, liquidatingofficerid, 
	collectorid
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{info}, $P{docstate}, $P{dtposted}, 
	$P{liquidationid}, $P{liquidationno}, $P{liquidationdate}, $P{liquidatingofficerid}, 
	$P{collectorid} 
)

[af_ids]
select "objid" from af

[af_info]
select 
	"objid", 
	'af:af' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	description, 
	lower(type) as aftype, 
	'STUB' as unit, 
	50 as pcsperunit, 
	0 as denomination, 
	7 as serieslength
from af 
where "objid"=$P{objid}

[af_insert]
insert into af 
(
	"objid", schemaname, schemaversion, docstate, description, 
	aftype, unit, pcsperunit, denomination, serieslength
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{description}, 
	$P{aftype}, $P{unit}, $P{pcsperunit}, $P{denomination}, $P{serieslength}
)

[remittedform_ids]
select "objid" from remittedform

[remittedform_info]
SELECT 
	r."objid", r.afissuedid AS afcontrolid, a.af_objid as afid, r.receivedfrom, 
	r.receivedto, r.receivedqty, r.beginfrom, r.beginto, r.beginqty, r.issuedfrom, 
	r.issuedto, r.issuedqty, r.endingfrom, r.endingto, r.endingqty, 
	r.parentid AS remittanceid, isnull(a.stub,'-') AS stubno, 'serial' AS aftype 
FROM remittedform r
	INNER JOIN afcontrol a ON r.afissuedid = a."objid"
where r."objid"=$P{objid}

[remittedform_insert]
INSERT INTO remittedform 
(
	"objid", afcontrolid, afid, receivedfrom, receivedto, receivedqty, 
	beginfrom, beginto, beginqty, issuedfrom, issuedto, issuedqty, 
	endingfrom, endingto, endingqty, remittanceid, stubno, aftype
)
values
(
	$P{objid}, $P{afcontrolid}, $P{afid}, $P{receivedfrom}, $P{receivedto}, $P{receivedqty}, 
	$P{beginfrom}, $P{beginto}, $P{beginqty}, $P{issuedfrom}, $P{issuedto}, $P{issuedqty}, 
	$P{endingfrom}, $P{endingto}, $P{endingqty}, $P{remittanceid}, $P{stubno}, $P{aftype} 
)

[remittancelist_ids]
select "objid" from collectionremittance 

[remittancelist_info]
SELECT
	r."objid", 
	CASE WHEN r.liquidationid IS NULL THEN 'OPEN' ELSE 'CLOSED' END AS docstate, 
	r.docno AS txnno, 
	r.dateposted AS txndate, 
	case when c.middlename is null 
		then (c.firstname + ' ' + c.lastname)
		else (c.firstname + ' ' + c.middlename + ' ' + c.lastname )
	end as 	collectorname, 
	r.amount, 
	r.collectorid as collectorid, 
	r.collectortitle, 
	r.amount - r.totalchecks AS totalcash, 
	r.totalchecks AS totalotherpayment, 
	r.liquidationid, 
	(YEAR(r.dateposted) +  
		QUARTER(r.dateposted) + 
		CASE WHEN MONTH(r.dateposted) < 10 THEN ('0' + MONTH(r.dateposted)) ELSE MONTH(r.dateposted) END +
		CASE WHEN DAY(r.dateposted) < 10 THEN ('0' + DAY(r.dateposted)) ELSE DAY(r.dateposted) END
	) AS txntimestamp, 
	l.docno as liquidationno, 
	l.dtposted as liquidationdate, 
	r.liquidatingofficerid as liquidatingofficerid, 
	case when lq.middlename is null 
		then (lq.firstname + ' ' + lq.lastname)
		else (lq.firstname + ' ' + lq.middlename + ' ' + lq.lastname )
	end as 	liquidatingofficername, 
	l.liquidatingofficertitle as liquidatingofficertitle
FROM collectionremittance r
	left join liquidation l on r.liquidationid = l."objid" 
	left join sys_user c on r.collectorid = c."objid" 
	left join sys_user lq on r.liquidatingofficerid = lq."objid" 
where r."objid"=$P{objid} 

[remittancelist_insert]
INSERT INTO remittancelist 
(
	"objid", docstate, txnno, txndate, collectorname, amount, 
	collectorid, collectortitle, totalcash, totalotherpayment, 
	liquidationid, txntimestamp, liquidationno, liquidationdate, 
	liquidatingofficerid, liquidatingofficername, liquidatingofficertitle
)
values
(
	$P{objid}, $P{docstate}, $P{txnno}, $P{txndate}, $P{collectorname}, $P{amount}, 
	$P{collectorid}, $P{collectortitle}, $P{totalcash}, $P{totalotherpayment}, 
	$P{liquidationid}, $P{txntimestamp}, $P{liquidationno}, $P{liquidationdate}, 
	$P{liquidatingofficerid}, $P{liquidatingofficername}, $P{liquidatingofficertitle}
)

[liquidation_ids]
select "objid" from liquidation 

[liquidation_info]
SELECT
	"objid", 
	'liquidation:liquidation' AS schemaname, 
	'1.0' AS schemaversion, 
	'CLOSED' AS docstate, 
	dtposted, 
	'[:]' AS info, 
	NULL AS depositid, 
	NULL AS dtdeposited
FROM liquidation
where "objid"=$P{objid}

[liquidation_insert]
INSERT INTO liquidation 
(
	"objid", schemaname, schemaversion, docstate, dtposted, 
	info, depositid, dtdeposited
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{dtposted}, 
	$P{info}, $P{depositid}, $P{dtdeposited} 
)

[liquidationlist_ids]
select "objid" from liquidation 

[liquidationlist_info]
SELECT
	l."objid", 
	'CLOSED' AS docstate, 
	l.docno AS txnno, 
	l.dtposted AS txndate, 
	YEAR(l.dtposted) AS iyear, 
	QUARTER(l.dtposted) AS iqtr, 
	MONTH(l.dtposted) AS imonth, 
	DAY(l.dtposted) AS iday, 
	(YEAR(l.dtposted) + 
		QUARTER(l.dtposted) +
		CASE WHEN MONTH(l.dtposted) < 10 THEN ('0' +  MONTH(l.dtposted)) ELSE MONTH(l.dtposted) END,
		CASE WHEN DAY(l.dtposted) < 10 THEN ('0' + DAY(l.dtposted)) ELSE DAY(l.dtposted) END
	) AS txntimestamp, 
	l.liquidatingofficerid, 
	case when U.middlename is null 
		then (u.firstname + ' ' + u.lastname)
		else concat(u.firstname  + ' ' + u.middlename + ' ' + u.lastname )
	end as 	liquidatingofficername, 
	l.liquidatingofficertitle, 
	l.amount, 
	(l.amount - l.totalchecks) AS totalcash, 
	l.totalchecks AS totalotherpayment, 
	NULL AS depositid, 
	NULL AS dtdeposited, 
	NULL AS depositedbyid, 
	NULL AS depositedbyname, 
	NULL AS depositedbytitle
FROM liquidation l
	inner join sys_user u on l.liquidatingofficerid = u."objid" 
where l."objid"=$P{objid}

[liquidationlist_insert]
INSERT INTO liquidationlist 
(
	"objid", docstate, txnno, txndate, iyear, iqtr, imonth, 
	iday, txntimestamp, liquidatingofficerid, liquidatingofficername, 
	liquidatingofficertitle, amount, totalcash, totalotherpayment, 
	depositid, dtdeposited, depositedbyid, depositedbyname, depositedbytitle
)
values
(
	$P{objid}, $P{docstate}, $P{txnno}, $P{txndate}, $P{iyear}, $P{iqtr}, $P{imonth}, 
	$P{iday}, $P{txntimestamp}, $P{liquidatingofficerid}, $P{liquidatingofficername}, 
	$P{liquidatingofficertitle}, $P{amount}, $P{totalcash}, $P{totalotherpayment}, 
	$P{depositid}, $P{dtdeposited}, $P{depositedbyid}, $P{depositedbyname}, $P{depositedbytitle} 
)

[revenue_ids]
select "objid" from receiptlist remittanceid is not null 

[revenue_info]
SELECT
	ri."objid", 
	CASE 
		WHEN rem.liquidationid IS NOT NULL THEN 'LIQUIDATED' 
		ELSE 'REMITTED'
	END AS docstate, 
	rl.remittanceid, 
	rl.remittanceno, 
	rl.remittancedate, 
	(YEAR(rl.remittancedate) + 
		QUARTER(rl.remittancedate) + 
		CASE WHEN MONTH(rl.remittancedate) < 10 THEN ('0' + MONTH(rl.remittancedate)) ELSE MONTH(rl.remittancedate) END +
		CASE WHEN DAY(rl.remittancedate) < 10 THEN ('0' + DAY(rl.remittancedate)) ELSE DAY(rl.remittancedate) END
	) AS remittancetimestamp, 
	rem.liquidationid, 
	rem.liquidationno, 
	rem.liquidationdate, 
	(YEAR(rem.liquidationdate) +
		QUARTER(rem.liquidationdate) +  
		CASE WHEN MONTH(rem.liquidationdate) < 10 THEN ('0' + MONTH(rem.liquidationdate)) ELSE MONTH(rem.liquidationdate) END +
		CASE WHEN DAY(rem.liquidationdate) < 10 THEN ('0' + DAY(rem.liquidationdate)) ELSE DAY(rem.liquidationdate) END
	) AS liquidationtimestamp, 
	NULL AS depositid, 
	NULL AS depositno, 
	NULL AS depositdate, 
	NULL AS deposittimestamp, 
	rl.collectorid, 
	rl.collectorname, 
	rl.collectortitle, 
	'MISC' AS receipttype, 
	rl."objid" AS receiptid, 
	rl.txndate AS receiptdate, 
	rl.amount AS receiptamount, 
	ri."objid" AS receiptitemid, 
	rl.afid AS afid, 
	rl."objid" AS afcontrolid, 
	rl.stubno AS stubno, 
	rl.serialno AS serialno, 
	rl.payorname AS payorname, 
	rl.payoraddress AS payoraddress, 
	ri.acctid AS acctid, 
	ri.acctno as acctno, 
	ri.accttitle as accttitle, 
	ri.fundid AS fundid, 
	ri.fundname AS fundname, 
	ia.ngasid AS ngasid, 
	ia.sreid AS sreid, 
	ri.amount, 
	rl.voided
FROM receiptlist rl
	INNER JOIN receiptitem ri on rl."objid" = ri.receiptid 
	LEFT JOIN remittancelist rem on rl.remittanceid = rem."objid"
	LEFT JOIN incomeaccount ia on ri.acctid = ia."objid" 
WHERE rl."objid"=$P{objid}

[revenue_insert]
INSERT INTO revenue 
(
	"objid", docstate, remittanceid, remittanceno, remittancedate, 	remittancetimestamp, 
	liquidationid, liquidationno, liquidationdate, liquidationtimestamp, depositid, 
	depositno, depositdate, deposittimestamp, collectorid, collectorname, collectortitle, 
	receipttype, receiptid, receiptdate, receiptamount, receiptitemid, afid, 
	afcontrolid, stubno, serialno, payorname, payoraddress, acctid, acctno, 
	accttitle, fundid, fundname, ngasid, sreid, amount, voided
)
values
(
	$P{objid}, $P{docstate}, $P{remittanceid}, $P{remittanceno}, $P{remittancedate}, $P{remittancetimestamp}, 
	$P{liquidationid}, $P{liquidationno}, $P{liquidationdate}, $P{liquidationtimestamp}, $P{depositid}, 
	$P{depositno}, $P{depositdate}, $P{deposittimestamp}, $P{collectorid}, $P{collectorname}, $P{collectortitle}, 
	$P{receipttype}, $P{receiptid}, $P{receiptdate}, $P{receiptamount}, $P{receiptitemid}, $P{afid}, 
	$P{afcontrolid}, $P{stubno}, $P{serialno}, $P{payorname}, $P{payoraddress}, $P{acctid}, $P{acctno}, 
	$P{accttitle}, $P{fundid}, $P{fundname}, $P{ngasid}, $P{sreid}, $P{amount}, $P{voided} 
)

[fund_ids]
select name from fund

[fund_info]
select
	name as "objid", 'fund' as schemaname, '1.0' as schemaversion, 
	'APPROVED' AS docstate, name as fund, name as subfund, name as fundname
from fund
where name=$P{objid}

[fund_insert]
insert into bayombong_etracs..fund 
(
	"objid", schemaname, schemaversion, docstate,
	fund, subfund, 	fundname
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate},
	$P{fund}, $P{subfund}, $P{fundname}
)

