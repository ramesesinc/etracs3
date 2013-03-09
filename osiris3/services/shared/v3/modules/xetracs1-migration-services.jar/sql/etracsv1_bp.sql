[lobclassification_ids]
select "objid" from lobclassification where parentid='c'

[lobclassification_info]
select
	c.objid, 
	'lobclassification' as schemaname, 
	'1.0' as schemaversion, 
	c.name, 
	null as remarks
from lobclassification c
where c."objid"=$P{objid}

[lobclassification_insert]
insert into lobclassification 
(objid, schemaname, schemaversion, name, remarks)
values
($P{objid}, $P{schemaname}, $P{schemaversion}, $P{name}, $P{remarks})	

[lob_ids]
select 
	l."objid" 
from lob l  
	left join lobclassification c on l.classificationid = c.objid 
where c.parentid = 'c' 
 

[lob_info]
select
	l."objid", 'lob' as schemaname, '1.0' as schemaversion, 'APPROVED' as docstate, 
	l.name as name, c.objid as classificationid, c.name as classification, '[]' as attributes
from lob l
	left join lobclassification c on l.classificationid = c.objid
where l."ojbid"=$P{objid} 

[lob_insert]
insert into lguname_etracs.lob 
(
	objid, schemaname, schemaversion, docstate, name, 
	classificationid, classification, attributes
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{name}, 
	$P{classificationid}, $P{classification}, $P{attributes}
)

[lob_retailer_ids]
select l."objid" from lob l, lobclassification c 
where c.name = 'RETAILERS' and l.name like '%RETAILER%'

[lob_retailer_info]
select
	l.objid, 
	'lob' as schemaname, 
	'1.0' as schemaversion, 
	'APPROVED' as docstate, 
	l.name as name, 
	c.objid as classificationid, 
	c.name as classification, 
	'[]' as attributes
from lob l  
	left join .lobclassification c on l.classificationid = c.objid
where l.objid=$P{objid}
   
[variable_ids]
 select objid from abstractvariable  
 
[variable_info]
select
	v."objid", 
	'variable' as schemaname, 
	'1.0' as schemaversion, 
	v.name,
	lower(v.datatype) as datatype , 
	v.caption, 
	v.description, 
	case 
		when v.arrayvalue is null then null 
		when cast( v.arrayvalue as varchar) = '' then '[]'
		else '["' + replace(cast( v.arrayValue as varchar),',', '","') + '"]'
	end  as arrayvalues, 0 as printtopermit 
from abstractvariable v
where objid=$P{objid}

[variable_insert]
insert into lguname_etracs.variable 
(
	objid, schemaname, schemaversion, name, datatype, 
	caption, description, arrayvalues, printtopermit 
)
values 
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{name}, $P{datatype}, 
	$P{caption}, $P{description}, $P{arrayvalues}, $P{printtopermit} 
)
	
	
[rule_ids]
select r.objid from abstractrule r 
	inner join rulegroup rg on r.rulegroupid = rg.name 

[rule_info]
select
	r."objid", 
	'rule' as schemaname, 
	'1.0' as schemaversion, 
	'DRAFT' as docstate, 
	r.rulename, 
	r.description, 
	('bp.assessment.rules.' + r.rulename ) as packagename, 
	r.author, 
	r.salience, 
	rg.name as agendagroupid, 
	rg.ruletitle as agendagroup, 
	'bpassessment' as ruleset, 
	r.fromdate as effectivefrom, 
	r.todate as effectiveto, 
	null as ruletext, 
	'[]' as conditions, 
	'[]' as actions, 
	'[:]' as extended
from abstractrule r 
	inner join rulegroup rg on r.rulegroupid = rg.name 
where r.objid=$P{objid}

[rule_insert]
insert into "rule"  
(
	"objid", schemaname, schemaversion, docstate, rulename, 
	description, packagename, author, salience, agendagroupid, 
	agendagroup, ruleset, effectivefrom, effectiveto, ruletext, 
	conditions, actions, extended
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{rulename}, 
	$P{description}, $P{packagename}, $P{author}, $P{salience}, $P{agendagroupid}, 
	$P{agendagroup}, $P{ruleset}, $P{effectivefrom}, $P{effectiveto}, $P{ruletext}, 
	$P{conditions}, $P{actions}, $P{extended}
)

[bpapplication_ids]
select abp.objid from abstractbpapplication abp
	inner join bpapplication bp on abp.objid = bp.objid 
	
[bpapplication_info]	
SELECT 	
	abp."objid", 
	'bpapplication:bpapplication' as schemaname, 
	'1.0' as schemaversion, 
	abp.state as docstate, 
	bp.businessid, 
	null as info, 
	abp.mode as txnmode, 
	bp.type as txntype, 
	abp.taxpayerid, 
	bp.tradename, 
	bp.address as businessaddress, 
	abp.dtapplied as txndate, 
	abp.appno as txnno, 
	abp.year as iyear, 
	bp.parentid, 
	'[:]' as extended, 
	'-' as barcode, 
	'[]' as lobs, 
	'[]' as appinfos, 
	'[]' as taxfees, 
	'[]' as receivables, 
	'[]' as credits
FROM abstractbpapplication abp
	inner join bpapplication bp on abp."objid" = bp."objid" 
where abp."objid"=$P{objid}

[bpapplication_insert]
insert into bpapplication 
(
	"objid", schemaname, schemaversion, docstate, businessid, info, 
	txnmode, txntype, taxpayerid, tradename, businessaddress, 
	txndate, txnno, iyear, parentid, extended, barcode, lobs, 
	appinfos, taxfees, receivables, credits
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{businessid}, $P{info}, 
	$P{txnmode}, $P{txntype}, $P{taxpayerid}, $P{tradename}, $P{businessaddress}, 
	$P{txndate}, $P{txnno}, $P{iyear}, $P{parentid}, $P{extended}, $P{barcode}, $P{lobs}, 
	$P{appinfos}, $P{taxfees}, $P{receivables}, $P{credits}
)

[bpapplicationlisting_ids]
select abp.objid from abstractbpapplication abp
	inner join bpapplication bp on abp.objid = bp.objid 
	
[bpapplicationlisting_info]
SELECT 	
	abp."objid", 
	abp.appno as txnno, 
	bp.type as txntype, 
	abp.mode as txnmode, 
	'-' as barcode, 
	abp.state as docstate, 
	abp.taxpayerid, 
	abp.taxpayername, 
	abp.taxpayeraddress, 
	bp.tradename, 
	bp.address as businessaddress, 
	abp.tin, 
	bp.bin, 
	bp.pin, 
	abp.officetype, 
	abp.organizationtype as organization, 
	abp.ctcno, 
	abp.ctcplaceissued, 
	abp.ctcdtissued as ctcdateissued, 
	abp.adminname as administratorname, 
	abp.adminaddress as administratoraddress, 
	abp.year as iyear, 
	bp.businessid, 
	bp.parentid, 
	bp.barangayid, 
	bp.barangayname, 
	abp.dtapplied as txndate, 
	case when amtdue = amtpaid then 1 else 0 end as fullypaid
FROM abstractbpapplication abp
	inner join bpapplication bp on abp."objid" = bp."objid" 
where abp.objid=$P{objid}

[bpapplicationlisting_insert]
insert into bpapplicationlisting 
(
	"objid", txnno, txntype, txnmode, barcode, docstate, taxpayerid, 
	taxpayername, taxpayeraddress, tradename, businessaddress, tin, 
	bin, pin, officetype, organization, ctcno, ctcplaceissued, 
	ctcdateissued, administratorname, administratoraddress, iyear, 
	businessid, parentid, barangayid, barangayname, txndate, fullypaid
)
values
(
	$P{objid}, $P{txnno}, $P{txntype}, $P{txnmode}, $P{barcode}, $P{docstate}, $P{taxpayerid}, 
	$P{taxpayername}, $P{taxpayeraddress}, $P{tradename}, $P{businessaddress}, $P{tin}, 
	$P{bin}, $P{pin}, $P{officetype}, $P{organization}, $P{ctcno}, $P{ctcplaceissued}, 
	$P{ctcdateissued}, $P{administratorname}, $P{administratoraddress}, $P{iyear}, 
	$P{businessid}, $P{parentid}, $P{barangayid}, $P{barangayname}, $P{txndate}, $P{fullypaid}
)

[bpappinfolisting_ids]
select abp.objid from abstractbpapplication abp
	inner join bpapplication bp on abp.objid = bp.objid 
	
[bpappinfolisting_info]
SELECT 	
	binfo."objid", 
	abp."objid" as applicationid, 
	binfo.lobid, 
	l.name as lobname, 
	binfo.variableid as varid, 
	v.name as varname, 
	lower(v.datatype) as vartype, 
	case 
		when binfo.stringvalue is not null then binfo.stringvalue 
		when binfo.doublevalue is not null then convert( varchar(100), convert(decimal(16, 2), binfo.doublevalue ) )
		when binfo.integervalue is not null then cast(binfo.integervalue as varchar) 
	end as value, 
	'[]' as arrayvalues, 
	binfo.beforeprint as  requiredbeforeprint
FROM abstractbpapplication abp
	inner join bpapplicationinfo binfo on abp."objid" = binfo.parentid
	left join lob l on binfo.lobid = l."objid" 
	left join abstractvariable v on binfo.variableid = v."objid"  
where abp.objid=$P{objid} 

[bpappinfolisting_insert]
insert into bpappinfolisting  
(
	"objid", applicationid, lobid, lobname, varid, 
	varname, vartype, value, arrayvalues, requiredbeforeprint
)
values 
(
	$P{objid}, $P{applicationid}, $P{lobid}, $P{lobname}, $P{varid}, 
	$P{varname}, $P{vartype}, $P{value}, $P{arrayvalues}, $P{requiredbeforeprint}
)

[bploblisting_ids]
select abp.objid from abstractbpapplication abp
	inner join bpapplication bp on abp.objid = bp.objid 
	
[bploblisting_info]	
SELECT	
	( abp.objid + '-' + l.objid ) as "objid", 
	abp."objid" as applicationid, 
	l."objid" as lobid, 
	l.classificationid, 
	l.name, 
	abp.year as iyear, 
	ba.type as assessmenttype
FROM abstractbpapplication abp
	inner join bpapplication ba on abp.objid = ba.objid 
	inner join bpapplication_lob bl on abp.objid = bl.bpapplication_objid
	inner join lob l on bl.lines_objid = l.objid
where apb.objid=$P{objid}

[bploblisting_insert]
insert into bploblisting 
(
	objid, applicationid, lobid, classificationid, 
	name, iyear, assessmenttype
)
values
(
	$P{objid}, $P{applicationid}, $P{lobid}, $P{classificationid}, 
	$P{name}, $P{iyear}, $P{assessmenttype} 
)

[bpapplication_lobs]
select 
	group_concat('[',
	'lobid:"', l.objid, '",', 
	'name:"', ifnull(l.name,''), '",', 
	'assessmenttype:"', ba.type, '",',
	'classificationid:"', ifnull(l.classificationid,''), '",', 
	'iyear:', xba.iyear, ']') 
from bpapplication ba
inner join bpapplication_lob bl on ba.objid = bl.bpapplication_objid
inner join lob l on bl.lines_objid = l.objid 
where bl=$P{objid}
group by bl.bpapplication_objid 

[bpapplication_appinfos]
select 
	group_concat('[',
	'lobid:', case when l.objid is null then 'null' else concat('"', l.objid, '"') end , ',', 
	'required:', case when info.required = true then 'true' else 'false' end , ',', 
	'varid:"', info.variableid, '",',
	'varname:"', ifnull(v.name,''), '",', 
	'vartype:"', lower(ifnull(v.datatype,'')), '",', 
	'requiredbeforeprint:', case when info.beforeprint = true then 'true' else 'false' end, ',', 
	'lobname:"', ifnull(l.name,''), '",', 
	'objid:"', info.objid, '",', 
	'arrayvalues:', case when v.arrayvalue is null then '[]' else concat('["', replace(v.arrayvalue, ',', '","'),'"]')   end , ',', 
	'rulename:"', '-', '",', 
	'datatype:"', lower(v.datatype), '",', 
	'category:"', ifnull(l.name,''), '",', 
	'caption:"', ifnull(v.caption,''), '",', 
	'varcaption:"', ifnull(v.caption,''), '",', 
	'items:', case when v.arrayvalue is null then '[]' else concat('["', replace(v.arrayvalue, ',', '","'),'"]')   end , ',', 
	'value:', case when info.stringvalue is not null then concat('"', info.stringvalue, '"')
			   when info.doublevalue is not null then doublevalue
			   when info.integervalue is not null then integervalue 
		end, ']') 
from bpapplicationinfo info 
left join lob l on info.lobid = l.objid 
inner join abstractvariable v on info.variableid = v.objid 
where info.parentid =$P{objid}
group by info.parentid

[bpapplication_info]

