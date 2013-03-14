[rptsetting_ids]
SELECT	objid FROM rptsetting  r

[rptsetting_insert]
insert into rptsetting 
	(objid, 
	schemaname, 
	schemaversion, 
	ry, 
	ordinanceno, 
	ordinancedate, 
	roundadjmarketvalue, 
	allowlandcancellation, 
	usenewtdprintout, 
	landreportbasedonactualuse, 
	allowtransferwithbalance, 
	allowcorrectionwithbalance, 
	allowdepreciationwithbalance, 
	allowchangetaxabilitywithbalance, 
	allowsubdivisionwithbalance, 
	allowconsolidationwithbalance, 
	allowreclasswithbalance, 
	approvedmvbelow, 
	agriculturalid, 
	agriculturaltitle, 
	adjustplanttree, 
	propertyclassifications,
	allowreassessmentwithbalance,
	allowchangedepreciationwithbalance
	)
values 	
(
	$P{objid}, 
	$P{schemaname}, 
	$P{schemaversion}, 
	$P{ry}, 
	$P{ordinanceno}, 
	$P{ordinancedate}, 
	$P{roundadjmarketvalue}, 
	$P{allowlandcancellation}, 
	$P{usenewtdprintout}, 
	$P{landreportbasedonactualuse}, 
	$P{allowtransferwithbalance}, 
	$P{allowcorrectionwithbalance}, 
	$P{allowdepreciationwithbalance}, 
	$P{allowchangetaxabilitywithbalance}, 
	$P{allowsubdivisionwithbalance}, 
	$P{allowconsolidationwithbalance}, 
	$P{allowreclasswithbalance}, 
	$P{approvedmvbelow}, 
	$P{agriculturalid}, 
	$P{agriculturaltitle}, 
	$P{adjustplanttree}, 
	$P{propertyclassifications},
	$P{allowreassessmentwithbalance},
	$P{allowchangedepreciationwithbalance}
)

[rptsetting_info]
SELECT
	objid, 
	'rptsetting:rptsetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	ordinanceno, 
	ordinancedate, 
	roundadjmarketvalue, 
	allowlandcancellation, 
	usenewtdprintout, 
	landreportbasedonactualuse, 
	allowtransferwithbalance, 
	allowcorrectionwithbalance, 
	allowdepreciationwithbalance, 
	allowchangetaxabilitywithbalance, 
	allowsubdivisionwithbalance, 
	allowAmalgamationWithBalance as allowconsolidationwithbalance, 
	allowreclasswithbalance, 
	0 as allowreassessmentwithbalance,
	0 as allowchangedepreciationwithbalance,
	approvedmvbelow, 
	agriculturalid , 
	(SELECT description FROM propertyclassification WHERE objid = r.agriculturalid ) as agriculturaltitle, 
	0 as adjustplanttree, 
	'[]' as propertyclassifications
FROM rptsetting  r
where objid = $P{objid}



[propertyclassification_ids]
select objid from propertyclassification

[propertyclassification_info]
SELECT
	objid, 
	'propertyclassification:propertyclassification' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS propertycode, 
	description AS propertydesc, 
	special, 
	orderno
FROM propertyclassification
where "objid"=$P{objid}

[propertyclassification_insert]
INSERT INTO propertyclassification 
(
	"objid", schemaname, schemaversion, propertycode, 
	propertydesc, special, orderno
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{propertycode}, 
	$P{propertydesc}, $P{special}, $P{orderno}
)

[exemptiontype_ids]
select "objid" from exemptiontype

[exemptiontype_info]
SELECT 
	objid, 
	'exemptiontype:exemptiontype' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS exemptcode, 
	description AS exemptdesc, 
	orderno
FROM exemptiontype
where "objid"=$P{objid}

[exemptiontype_insert]
insert into exemptiontype 
(
	"objid", schemaname, schemaversion, exemptcode, 
	exemptdesc, orderno
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{exemptcode}, 
	$P{exemptdesc}, $P{orderno}
)

[canceltdreason_ids]
select "objid" from canceltdreason

[canceltdreason_info]
SELECT 
	objid, 
	'canceltdreason' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS cancelcode, 
	title AS canceltitle, 
	description AS canceldesc	
FROM canceltdreason
where "objid"=$P{objid}

[canceltdreason_insert]
insert into canceltdreason 
(
	"objid", schemaname, schemaversion, cancelcode, canceltitle,canceldesc
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{cancelcode}, $P{canceltitle},$P{canceldesc} 
)

[kindofbuilding_ids]
select "objid" from bldgkind 

[kindofbuilding_info]
SELECT
	objid, 
	'kindofbuilding:kindofbuilding' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS bldgcode, 
	description AS bldgkind
FROM bldgkind 
where "objid"=$P{objid}

[kindofbuilding_insert]
insert into kindofbuilding 
(
	objid, schemaname, schemaversion, bldgcode, bldgkind
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{bldgcode}, $P{bldgkind}
)

[materials_ids]
select "objid" from material 

[materials_info]
SELECT
	objid, 
	'materials:materials' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS materialcode, 
	description AS materialdesc
FROM material
where "objid"=$P{objid}

[materials_insert]
insert into materials 
(
	objid, schemaname, schemaversion, materialcode, materialdesc
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{materialcode}, $P{materialdesc}
)

[structures_ids]
select "objid" from structure

[structures_info]
SELECT
	objid, 
	'structures:structures' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS structurecode, 
	description AS structuredesc, 
	'[]' AS materials
FROM structure
where "objid"=$P{objid} 

[structures_insert]
insert into structures 
(
	objid, schemaname, schemaversion, structurecode, 
	structuredesc, materials
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{structurecode}, 
	$P{structuredesc}, $P{materials} 
)

[machines_ids]
select "objid" from machine

[machines_info]
SELECT 
	objid, 
	'machines:machines' AS schemaname, 
	'1.0' as schemaversion, 
	code AS machinecode, 
	description AS machinedesc, 
	0 AS economiclife, 
	0 as residualrate
FROM machine 
where "objid"=$P{objid}

[machines_insert]
insert into machines 
(
	objid, schemaname, schemaversion, machinecode, 
	machinedesc, economiclife, residualrate
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{machinecode}, 
	$P{machinedesc}, $P{economiclife}, $P{residualrate}
)

[plantsandtrees_ids]
select "objid" from tree

[plantsandtrees_info]
SELECT
	objid, 
	'plantsandtrees:plantsandtrees' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS planttreecode, 
	description AS planttreedesc
FROM tree
where "objid"=$P{objid}

[plantsandtrees_insert]
insert into plantsandtrees 
(
	"objid", schemaname, schemaversion, planttreecode, planttreedesc
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{planttreecode}, $P{planttreedesc}
)

[rptparameters_ids]
select "objid" from rptparameter 

[rptparameters_info]
SELECT
	objid, 
	'rptparameters:rptparameters' AS schemaname, 
	'1.0' AS schemaversion, 
	name AS paramname, 
	caption AS paramcaption, 
	description AS paramdesc, 
	CASE 
		WHEN datatype = 'INTEGER' THEN 'integer' 
		WHEN datatype = 'DECIMAL' THEN 'decimal' 
	END AS paramtype, 
	0 AS parammin, 
	0 AS parammax
FROM rptparameter 
where "objid"=$P{objid} 

[rptparameters_insert]
insert into rptparameters 
(
	objid, schemaname, schemaversion, paramname, paramcaption, 
	paramdesc, paramtype, parammin, parammax
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{paramname}, $P{paramcaption}, 
	$P{paramdesc}, $P{paramtype}, $P{parammin}, $P{parammax}
)

[miscitems_ids]
select "objid" from miscitem

[miscitems_info]
SELECT
	objid, 
	'miscitems:miscitems' AS schemaname, 
	'1.0' AS schemaversion, 
	code AS misccode, 
	description AS miscdesc 
FROM miscitem
where "objid"=$P{objid}

[miscitems_insert]
insert into miscitems 
(
	"objid", schemaname, schemaversion, misccode, miscdesc
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{misccode}, $P{miscdesc}
)





#-------------------------------------------------------------
# LANDRYSETTING
#-------------------------------------------------------------

[landrysetting_ids]
select objid from rysetting  where dtype = 'LandRYSetting'

[landrysetting_insert]
insert into landrysetting (objid, schemaname, schemaversion,ry,previd )
values($P{objid},$P{schemaname},$P{schemaversion},$P{ry},$P{previd})

[landrysetting_info]
select
	objid, 
	'landrysetting:landrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from rysetting 
where objid = $P{objid}



[landassesslevel_ids]
select l.objid
from landassesslevel l
	inner join PropertyClassification pc on l.propertyclassificationid = pc.objid

[landassesslevel_insert]
insert into landassesslevel 
	(objid, classcode, classname, fixrate, rate, 
	 previd, landrysettingid, ranges)
values
	($P{objid}, $P{classcode}, $P{classname}, $P{fixrate}, $P{rate}, 
	 $P{previd}, $P{landrysettingid}, $P{ranges} )	

[landassesslevel_info]
select
	l.objid, 
	pc.code as classcode, 
	pc.description as classname, 
	l.special as fixrate, 
	l.assesslevel as rate, 
	l.previd, 
	rysettingid as landrysettingid, 
	'[]' as ranges
from landassesslevel l
	inner join PropertyClassification pc on l.propertyclassificationid = pc.objid
where l.objid = $P{objid}
	
	
[lcuv_ids]
select	l.objid 
from lcuv l
	inner join propertyclassification pc on l.propertyclassificationid = pc.objid 

[lcuv_insert]	
insert into lcuv 
	(objid, classcode, classname, landrysettingid, previd)
values
	($P{objid}, $P{classcode}, $P{classname}, $P{landrysettingid}, $P{previd})	

[lcuv_info]
select	
	l.objid, 
	pc.code as classcode, 
	pc.description as classname, 
	l.rysettingid as landrysettingid, 
	l.previd
from lcuv l
	inner join propertyclassification pc on l.propertyclassificationid = pc.objid 
where l.objid = $P{objid}

[lcuvspecificclass_ids]	
select s.objid 
from lcuvspecificclass s
	inner join lcuv l on s.lcuvid = l.objid 
	
[lcuvspecificclass_insert]	
insert into lcuvspecificclass 
	(objid, classcode, classname, areatype, 
	 lcuvid, previd, landrysettingid )
values	 
    ($P{objid}, $P{classcode}, $P{classname}, $P{areatype}, 
	 $P{lcuvid}, $P{previd}, $P{landrysettingid} )
	
[lcuvspecificclass_info]	
select
	s.objid, 
	s.code as classcode, 
	s.description as classname, 
	case when s.areatype = 'HEC' then 'HA' else 'SQM' END AS areatype, 
	s.lcuvid, 
	s.previd, 
	l.rysettingid as landrysettingid
from lcuvspecificclass s
	inner join lcuv l on s.lcuvid = l.objid 
where s.objid = $P{objid}

	
[lcuvsubclass_ids]
select sb.objid
from lcuv l
	inner join lcuvspecificclass s on l.objid = s.lcuvid
	inner join lcuvsubclass sb on s.objid = sb.specificclassid 

[lcuvsubclass_insert]
insert into lcuvsubclass 
	(objid, subclasscode, subclassname, unitvalue, 
	 specificclassid, previd, landrysettingid)
values	 
	($P{objid}, $P{subclasscode}, $P{subclassname}, $P{unitvalue}, 
	 $P{specificclassid}, $P{previd}, $P{landrysettingid})
	
[lcuvsubclass_info]
select 
	sb.objid, 
	sb.code as subclasscode, 
	sb.description as subclassname, 
	sb.unitvalue, 
	sb.specificclassid, 
	sb.previd, 
	l.rysettingid as landrysettingid
from lcuv l
	inner join lcuvspecificclass s on l.objid = s.lcuvid
	inner join lcuvsubclass sb on s.objid = sb.specificclassid 
where sb.objid = $P{objid}	
	
[lcuvstripping_ids]	
select	s.objid 
from lcuv l
	inner join lcuvstripping s on l.objid = s.lcuvid 

[lcuvstripping_insert]	
insert into lcuvstripping 
	(objid, striplevel, rate, lcuvid, 
	 previd, landrysettingid )
values 
	($P{objid}, $P{striplevel}, $P{rate}, $P{lcuvid}, 
	 $P{previd}, $P{landrysettingid} )	 

[lcuvstripping_info]	
select
	s.objid, 
	s.striplevel, 
	s.rate, 
	s.lcuvid, 
	s.previd, 
	l.rysettingid as landrysettingid
from lcuv l
	inner join lcuvstripping s on l.objid = s.lcuvid 
where s.objid = $P{objid}	
	
	
	
[landadjustment_ids]	
select l.objid from landadjustmenttype l

[landadjustment_insert]	
insert into landadjustment 
	(objid, adjustmentcode, adjustmentname, classids, classifications, 
	expression, landrysettingid, appliedto, previd )
values	
	($P{objid}, $P{adjustmentcode}, $P{adjustmentname}, $P{classids}, $P{classifications}, 
	$P{expression}, $P{landrysettingid}, $P{appliedto}, $P{previd} )
	
[landadjustment_info]	
select
	l.objid, 
	l.code as adjustmentcode, 
	l.description as adjustmentname, 
	null as classids, 
	'[]' as classifications, 
	CASE 
		when expression like '%if%' then expression
		else 'SYS_BASE_MARKET_VALUE * ' + convert(varchar(100),expression) + ' / 100.0' 
	END as expression, 
	l.rysettingid landrysettingid, 
	'' as appliedto, 
	null as previd
from landadjustmenttype l
where l.objid = $P{objid}



#-------------------------------------------------------------
# BLDGRYSETTING
#-------------------------------------------------------------
[bldgrysetting_ids]
select r.objid from rysetting r where dtype = 'BldgRYSetting'

[bldgrysetting_insert]
insert into bldgrysetting 
	(objid, schemaname, schemaversion, ry, predominant, depreciatecoreanditemseparately, 
	computedepreciationbasedonschedule, calcbldgagebasedondtoccupied, previd
	)
values	
	($P{objid}, $P{schemaname}, $P{schemaversion}, $P{ry}, $P{predominant}, 
	 $P{depreciatecoreanditemseparately}, $P{computedepreciationbasedonschedule}, 
	 $P{calcbldgagebasedondtoccupied}, $P{previd}
	)	
	
[bldgrysetting_info]
select
	r.objid, 
	'bldgrysetting' as schemaname, 
	'1.0' as schemaversion, 
	r.ry, 
	r.predominant, 
	0 as depreciatecoreanditemseparately, 
	0 as computedepreciationbasedonschedule, 
	0 as calcbldgagebasedondtoccupied,
	r.previd
from rysetting r
where dtype = 'BldgRYSetting'
  and r.objid = $P{objid}


[bldgassesslevel_ids]
select 	a.objid
from bldgassesslevel a 
	inner join PropertyClassification pc on a.propertyclassificationid = pc.objid

[bldgassesslevel_insert]
insert into bldgassesslevel 
	(objid, bldgrysettingid, code, name, fixrate, rate, previd, ranges)
values
	($P{objid}, $P{bldgrysettingid}, $P{code}, $P{name}, 
     $P{fixrate}, $P{rate}, $P{previd}, $P{ranges})
	
[bldgassesslevel_info]
select
	a.objid, 
	a.bldgrysettingid, 
	pc.code, 
	pc.description as name, 
	a.special as fixrate, 
	a.assesslevel as rate, 
	a.previd, 
	'[]' as ranges
from bldgassesslevel a 
	inner join PropertyClassification pc on a.propertyclassificationid = pc.objid
where a.objid = $P{objid}	

[bldgtype_ids]
select objid from bldgtype bt

[bldgtype_insert]
insert into bldgtype 
	( objid, bldgrysettingid, code, name, basevaluetype, residualrate, 
	  multistoreyadjustments, depreciations, previd
	)
values
	( $P{objid}, $P{bldgrysettingid}, $P{code}, $P{name}, $P{basevaluetype},
	$P{residualrate}, $P{multistoreyadjustments}, $P{depreciations}, $P{previd} 
	)	

[bldgtype_info]
select 
	objid, bldgrysettingid, code, description as name, 
	(select top 1  case when basevaluetype = 'range' then  lower(basevaluetype) else 'fix' end 
	   from BldgTypeClassification where bldgtypeid=bt.objid
	) as basevaluetype, 
	residualvalue as residualrate, 
	'[]' as multistoreyadjustments, 
	'[]' as depreciations, 
	previd
from bldgtype bt
where objid = $P{objid}


[bldgkindbucc_ids]  
select btc.objid
from bldgtypeclassification btc 
	inner join bldgtype bt on btc.bldgtypeid = bt.objid 
	inner join bldgkind bk on btc.bldgkindid = bk.objid 

[bldgkindbucc_insert] 
insert into bldgkindbucc 
	(objid, bldgrysettingid, bldgtypeid, bldgkindid, bldgkindcode, 
	bldgkindname, 
	basevaluetype, 
	basevalue, 
	minbasevalue, 
	maxbasevalue, 
	gapvalue, 
	minarea, 
	maxarea, 
	bldgclass, 
	previd, 
	extended
	)
values
	($P{objid}, $P{bldgrysettingid}, $P{bldgtypeid}, $P{bldgkindid}, $P{bldgkindcode}, 
	$P{bldgkindname}, 
	$P{basevaluetype}, 
	$P{basevalue}, 
	$P{minbasevalue}, 
	$P{maxbasevalue}, 
	$P{gapvalue}, 
	$P{minarea}, 
	$P{maxarea}, 
	$P{bldgclass}, 
	$P{previd}, 
	$P{extended}
	)	
	
[bldgkindbucc_info]  
select
	btc.objid, 
	bt.bldgrysettingid, 
	btc.bldgtypeid, 
	btc.bldgkindid, 
	bk.code as bldgkindcode, 
	bk.description as bldgkindname, 
	CASE WHEN btc.basevaluetype = 'RANGE' THEN 'range' ELSE 'fix' END as basevaluetype , 
	btc.basevalue, 
	btc.minbasevalue, 
	btc.maxbasevalue, 
	0 as gapvalue, 
	0 as minarea, 
	0 as maxarea, 
	null as bldgclass, 
	btc.previd, 
	'[:]' as extended
from bldgtypeclassification btc 
	inner join bldgtype bt on btc.bldgtypeid = bt.objid 
	inner join bldgkind bk on btc.bldgkindid = bk.objid 
where btc.objid = $P{objid}


[bldgadditionalitem_ids]
select bi.objid from bldgadditionalitem bi 

[bldgadditionalitem_insert]
insert into bldgadditionalitem 
	(objid, bldgrysettingid, code, name, unit, expr, previd)
values 	
	($P{objid}, $P{bldgrysettingid}, $P{code}, $P{name}, 
	 $P{unit}, $P{expr}, $P{previd})
	 
[bldgadditionalitem_info]
select
	bi.objid, 
	bi.bldgrysettingid, 
	bi.code, 
	bi.description as name, 
	bi.unit, 
	bi.expression as expr, 
	bi.previd
from bldgadditionalitem bi 
where bi.objid = $P{objid}






[machrysetting_ids]
select "objid" from rysetting where dtype= 'MachRYSetting'

[machrysetting_info]
select
	objid, 
	'machrysetting' as schemaname, 
	'1.0' as schemaversion, 
	ry, 
	previd
from rysetting 
where objid=$P{objid}

[machrysetting_insert]
insert into machrysetting 
	(objid, schemaname, schemaversion, ry, previd)
values
	($P{objid}, $P{schemaname}, $P{schemaversion}, $P{ry}, $P{previd})
	
[machassesslevel_ids]
select "objid" from machassesslevel

[machassesslevel_info]
select
	ma.objid, 
	ma.machrysettingid, 
	pc.code, 
	pc.description as name, 
	ma.special as fixrate, 
	ma.assesslevel as rate, 
	previd, 
	'[]' as ranges
from machassesslevel ma
	inner join PropertyClassification pc on ma.propertyclassificationid = pc.objid
where ma.objid=$P{objid}

[machassesslevel_insert]
insert into machassesslevel 
(
	objid, machrysettingid, code, name, fixrate, 
	rate, previd, ranges
)
values
(
	$P{objid}, $P{machrysettingid}, $P{code}, $P{name}, $P{fixrate}, 
	$P{rate}, $P{previd}, $P{ranges}
)

	
[planttreerysetting_ids]
select "objid" from rysetting where dtype= 'TreeRYSetting'

[planttreerysetting_info]
select
	r.objid, 
	'planttreerysetting' as schemaname, 
	'1.0' as schemaversion, 
	r.ry, 
	0 as applyagriadjustment, 
	r.previd, 
	'[]' as assesslevels, 
	'[]' as planttreeunits
from rysetting r 
where objid=$P{objid}

[planttreerysetting_insert]
insert into planttreerysetting 
(
	objid, schemaname, schemaversion, ry, applyagriadjustment, 
	previd, assesslevels, planttreeunits
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{ry}, $P{applyagriadjustment}, 
	$P{previd}, $P{assesslevels}, $P{planttreeunits}
)

[planttreeunitvalue_ids]
select tuv.objid 
from treeunitvalue tuv 
	inner join treeunit tu on tuv.treeunitid = tu.objid 
	inner join tree t on tu.treeid = t.objid 
	
[planttreeunitvalue_info]
select
	tuv.objid, 
	tu.rysettingid as planttreerysettingid, 
	t.objid as planttreeid, 
	t.code as planttreecode, 
	t.description as planttreename, 
	tuv.code, 
	tuv.description as name, 
	tuv.unitvalue, 
	tuv.previd
from treeunitvalue tuv 
	inner join treeunit tu on tuv.treeunitid = tu.objid 
	inner join tree t on tu.treeid = t.objid
where tuv.objid=$P{objid}

[planttreeunitvalue_insert]
insert into planttreeunitvalue 
(
	objid, planttreerysettingid, planttreeid, planttreecode, 
	planttreename, code, name, unitvalue, previd
)
values
(
	$P{objid}, $P{planttreerysettingid}, $P{planttreeid}, $P{planttreecode}, 
	$P{planttreename}, $P{code}, $P{name}, $P{unitvalue}, $P{previd}
)


	
	


[entity_ids]
select objid from  payer

[entity_info]
select 	
	p.objid, 
	'entity:entity' as schemaname, 
	'1.0' as schemaversion, 
	p.taxpayerno as entityno, 
	p.name as entityname, 
	p.primaryaddress as entityaddress, 
	p.mailingaddress, 
	case 
		when p.dtype = 'MultipleTaxpayer' then 'multiple' 
		when p.dtype = 'IndividualTaxpayer' then 'individual' 
		else 'juridical'
	end as entitytype, 
	'[:]' as info, 
	null as sys_lastupdate, 
	null as sys_lastupdateby, 
	p.remarks
from payer p
where p.objid=$P{objid}

[entity_insert]
insert into entity 
(
	objid, schemaname, schemaversion, entityno, entityname, 
	entityaddress, mailingaddress, entitytype, info, 
	sys_lastupdate, sys_lastupdateby, remarks
)
values
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{entityno}, $P{entityname}, 
	$P{entityaddress}, $P{mailingaddress}, $P{entitytype}, $P{info}, 
	$P{sys_lastupdate}, $P{sys_lastupdateby}, $P{remarks} 
)

[entitymember_ids]
select m."objid" from multipletaxpayermember m 
	inner join payer p on m.taxpayerid = p.objid

[entitymember_info]	
select
	m.objid, 
	m.parentid as entityid, 
	m.itemno, 
	m.prefix, 
	m.taxpayerid, 
	p.name as taxpayername, 
	p.primaryaddress as taxpayeraddress, 
	m.suffix, 
	null as remarks
from multipletaxpayermember m 
	inner join payer p on m.taxpayerid = p.objid
where m.objid=$P{objid}

[entitymember_insert]	
insert into entitymember 
(
	objid, entityid, itemno, prefix, taxpayerid, taxpayername, 
	taxpayeraddress, suffix, remarks
)
values
(
	$P{objid}, $P{entityid}, $P{itemno}, $P{prefix}, $P{taxpayerid}, $P{taxpayername}, 
	$P{taxpayeraddress}, $P{suffix}, $P{remarks}
)


[pin_insert]
insert into pin 
	( pin, claimno, docstate, ry, rpid, rputype )
values 
	( $P{pin}, $P{claimno}, $P{docstate}, $P{ry}, $P{rpid}, $P{rputype} )
	
[pin_list]
select distinct 
	rp.pin,
	case when rp.claimno = 0 then '-' else rp.claimno end as claimno,
	rp.state as docstate,
	r.ry,
	r.objid as rpid,
	lower(r.type) as  rputype 
from realproperty rp
	inner join rpu r on rp.objid = r.realpropertyid 
	inner join taxdeclaration td on r.objid = td.rpuid 
where td.state = 'CURRENT'	

[getFaasObjid_land]
select td.objid 
from taxdeclaration td  
	inner join rpu r on r.objid= td.rpuid
where r.type='land'

[getFaasObjid_all]
select td.objid 
from taxdeclaration td  
	inner join rpu r on r.objid= td.rpuid
where r.type != 'land'


[getFaas]
select
	td.objid, 
	'faas:faas' as schemaname, 
	'1.0' as schemaversion, 
	td.state as docstate, 
	null as transmittalid, 
	null as transmitted, 
	'[:]' as info, 
	'[:]' as rp, 
	'[:]' as rpu, 
	'[]' as previousfaases, 
	'[:]' as extended, 
	null as message, 
	null as sys_dtapproved, 
	rl.objid as ledgerid, 
	'[]' as attachments
from taxdeclaration td
	left join rptledger rl on td.objid = rl.tdid 
where td.objid = $P{objid}

[getFaasInfo]
select
	case when td.txnType = 'DC' then 1 else 0 end as datacapture,
	td.previousMarketValue as  prevmv,
	td.previousAssessedValue as prevav,
	datepart(q, td.effectivityDate) as effectivityqtr,
	td.remarks as memoranda,
	td.tdno as tdno,
	0 as  autonumber,
	0 as backtaxyrs,
	rp.claimno as claimno,
	0 as annotated,
	'[txntype:"' + 
	case when td.txntype in( 'CT','PC','CD','CC','PD' ) then 'RE' else td.txnType end + 
	'",caption:"' + 
	case when td.txntype in( 'CT','PC','CD','CC','PD' ) then 'RE' else td.txnType end +  '",]' as  txn,
	
	case when td.txntype in( 'CT','PC','CD','CC','PD' ) then 'RE' else td.txnType end as txntype,
	'' as titletype,
	td.titleNo as titleno,
	td.issueDate as issuedate,
	year(td.issueDate) as effectivityyear,
	td.previousTdNo as prevtdno,
	td.previousPin as prevpin,
	td.previousOwner as prevowner,
	null as appraisedbyid,
	td.appraisedBy as appraisedby,
	td.appraisedByPosition as appraisedbytitle,
	td.issueDate as dtappraised,
	null as recommendedbyid,
	td.recommendedBy as recommendedby,
	td.recommendedByPosition as recommendedbytitle,
	td.issueDate as dtrecommended,
	null as  approvedbyid,
	td.appraisedBy as approvedby,
	td.approvedByPosition as  approvedbytitle,
	td.issueDate as dtapproved,
	td.taxpayerId as taxpayerid,
	p.taxpayerno as taxpayerno,
	td.taxpayerName as taxpayername,
	isnull(td.taxpayerAddress, '-') as taxpayeraddress,
	td.taxpayerName as ownername,
	isnull(td.taxpayerAddress, '-') as owneraddress
from taxdeclaration td
	inner join RPU r on td.rpuid = r.objid 
	inner join RealProperty rp on r.realpropertyid = rp.objid 
	left join Payer p on td.taxpayerId = p.objid 
where td.objid = $P{objid}	

[getRealProperty]
select
	case 
		when m.pin = $P{lgupin} then lower(m.type) 
		when p.pin = $P{lgupin} then lower(p.type) 
		else LOWER(p.type)
	end as lgutype,
	'[:]' as attributes,
	0 as autonumber,
	'old' as pintype,
	rp.barangayId as barangayid,
	b.name as barangay,
	b.indexNo as barangayindex,
	m.objid as munidistrictid,
	rp.sectionNo as section,
	rp.parcelNo as parcel,
	p.name as provcity,
	p.indexNo as provcityindex,
	m.name as munidistrict,
	m.indexNo as munidistrictindex,
	rp.pin as pin,
	case when rp.cadastralLotNo is null then '-' else rp.cadastralLotNo end  as cadastrallotno,
	rp.surveyNo as surveyno,
	rp.northBoundary as north,
	rp.eastBoundary as east,
	rp.southBoundary as south,
	rp.westBoundary as  west
from taxdeclaration td
	inner join RPU r on td.rpuid = r.objid 
	inner join RealProperty rp on r.realpropertyid = rp.objid 
	inner join LGU b on rp.barangayId = b.objid 
	inner join LGU m on b.parentid = m.objid 
	inner join LGU p on m.parentid = p.objid 
where td.objid = $P{objid}	


[getExtendedInfo]
select
	case 
		when m.pin = $P{lgupin} then lower(m.type) 
		when p.pin = $P{lgupin} then lower(p.type) 
		else LOWER(p.type)
	end as lgutype,
	case 
		when m.pin = $P{lgupin} then lower(m.name) 
		when p.pin = $P{lgupin} then lower(p.name) 
		else LOWER(p.name)
	end as lguname,
	case 
		when m.pin = $P{lgupin} then lower(m.objid) 
		when p.pin = $P{lgupin} then lower(p.objid) 
		else LOWER(p.objid)
	end as lguid,
	0 as transmitted,
	CONVERT(VARCHAR(4),YEAR(td.issuedate)) +
	CONVERT(VARCHAR(4), DATEPART(Q,td.issuedate)) +
	CASE WHEN MONTH(td.issuedate) < 10 THEN '0' + convert(varchar(4),MONTH(td.issuedate)) ELSE convert(varchar(4),MONTH(td.issuedate)) END +
	CASE WHEN DAY(td.issuedate) < 10 THEN '0' + convert(varchar(4),DAY(td.issuedate)) ELSE convert(varchar(4),DAY(td.issuedate)) END
	AS txntimestamp
from taxdeclaration td
	inner join RPU r on td.rpuid = r.objid 
	inner join RealProperty rp on r.realpropertyid = rp.objid 
	inner join LGU l on rp.barangayId = l.objid 
	inner join LGU m on l.parentid = m.objid 
	inner join LGU p on m.parentid = p.objid 
where td.objid = $P{objid}	





#---------#
#---------------------------------------------------
# LAND
#---------------------------------------------------

[getRpu]
SELECT 
	rp.objid AS realpropertyid,
	rpu.objid,
	td.objid AS faasid,
	LOWER(rpu.type) AS rputype,
	rpu.ry, 
	case when type = 'LAND' then rp.pin else rp.pin + '-' + convert(varchar(4),rpu.suffix) end AS fullpin, 
	rpu.suffix,
	null as subsuffix,
	rpu.taxable,
	rpu.totalmv as totalbmv,
	rpu.totalamv as totalmv,
	rpu.totalav as totalav,
	rpu.areaInSqm as  totalareasqm,
	rpu.areaInHec as totalareaha,
	rpu.classificationId as  classid,
	RPU.classCode as  classcode,
	rpu.classTitle as  classname,
	RPU.exemptionTypeId as  exemptid,
	RPU.exemptCode as  exemptcode,
	RPU.exemptTitle as  exemptname,
	RPU.cancelReason as cancelreason,
	RPU.dtCancelled as  canceldate,
	td.cancelledByTdNo as  cancelledbytdnos
FROM taxdeclaration td
	INNER JOIN rpu rpu ON td.rpuid = rpu.objid 
	INNER JOIN RealProperty rp ON rpu.realpropertyid = rp.objid
WHERE td.objid = $P{objid}
	
[getLandInfo]	
SELECT
lr.idleland as  idleland,	
0 as swornstatement,
0 as swornamount,
0 as useswornamount,
lr.totallandadjustment as  landvalueadjustment
FROM landrpu lr
WHERE objid = $P{rpuid}

[getLandDetails]
SELECT 
	ld.objid,
	ld.actualuseid as actualuseid,
	ld.actualusecode as actualusecode,
	ld.actualusetitle as actualusename,
	ld.specificclassid as  specificclassid,
	ld.specificclasscode as  specificclasscode,
	ld.specificclasstitle as  specificclassname,
	ld.lcuvsubclassid as subclassid,
	ld.subclasscode as subclasscode,
	ld.subclasstitle as  subclassname,
	ld.landassesslevelid as assesslevelid,
	ld.assessLevelClassCode as  assesslevelcode,
	ld.assesslevelclasstitle as assesslevelname,
	ld.lcuvstrippingid as strippingid,
	ld.striplevel as  striplevel,
	ld.striprate as  striprate,
	case when ld.areatype = 'SQM' then ld.areatype else 'HA' end as areatype ,
	'' as addlinfo,
	ld.area as area,
	ld.areaSqm as  areasqm,
	ld.areaHec as  areaha,
	ld.baseValue as  basevalue,
	ld.unitValue as  unitvalue,
	ld.taxable as taxable, 
	ld.marketvalue as basemarketvalue,
	ld.totaladjustment as adjustment,
	ld.totaladjustment as landvalueadjustment,
	0 as actualuseadjustment,
	ld.adjmarketvalue as marketvalue,
	ld.assesslevel as  assesslevel,
	ld.assessedvalue as assessedvalue
FROM landdetail ld
WHERE ld.rpuid = $P{rpuid}

[getLandTotal]
SELECT
	lr.totalareasqm as areasqm,
	lr.totalareahec as  areaha,
	lr.totallandadjustment as adjustment,
	lr.totallandmv as basemarketvalue,
	lr.totalLandAMV as  marketvalue,
	lr.totallandav as assessedvalue
FROM landrpu lr
WHERE objid = $P{rpuid}
     
[getPlantTrees]	 
SELECT
	lp.objid as objid,
	lp.treeunitvalueid as unitvalueid,
	lp.treeunitvaluecode as unitvaluecode,
	lp.treeunitvaluetitle as unitvaluename, 
	lp.treeid as planttreeid,
	lp.treecode as planttreecode,
	lp.treetitle as  planttreename,
	lp.treeAssessLevelId as assesslevelid,
	lp.treeassesslevelcode as  assesslevelcode,
	lp.treeAssessLevelTitle as assesslevelname,
	lp.bearing as bearing,
	lp.nonbearing as nonbearing,
	lp.nonbearingage as nonbearingage,
	lp.unitvalue as unitvalue,
	lp.marketvalue as basemarketvalue,
	0.0 as adjustment,
	0.0 as adjustmentrate,
	lp.adjmarketvalue as  marketvalue,
	lp.assessLevel as  assesslevel,
	lp.assessedValue as assessedvalue
FROM landplantdetail lp 
WHERE lp.rpuid = $P{rpuid}		

[getPlantTotal]
SELECT
		lr.totalplantbearing as bearing,
		lr.totalplantnonbearing as nonbearing,
		lr.totalplantmv as basemarketvalue,
        0.0 as adjustment,
        lr.totalPlantAMV as marketvalue,
		lr.totalPlantAV as assessedvalue
FROM landrpu lr  
WHERE lr.objid = $P{rpuid}

[getLandAdjustments]
SELECT
	la.objid,
	0.0 as adjustment,
	la.landadjustmenttypeid as adjtypeid,
	la.landadjustmenttypecode as adjtypecode,
	la.landAdjustmentTypeTitle as adjtypename,
	la.expression as expr
FROM landadjustment la
WHERE la.rpuid = $P{rpuid}
	
[updateRpuInfo]
UPDATE faas SET 
	rpu = $P{rpu}
WHERE objid = $P{faasid} 


[getSubclassInfo]
select 
	ld.subclassTitle as subclassname,
	ld.lcuvSubclassId as subclassid,
	ld.actualUseTitle as actualusename,
	ld.actualUseId as actualuseid,
	case when ld.areaType = 'SQM' then 'SQM' else 'HA' end as  areatype,
	ld.actualUseCode as actualusecode,
	ld.subclassCode as subclasscode,
	ld.specificClassTitle as  specificclassname,
	ld.specificClassCode as specificclasscode,
	ld.baseValue as basevalue,
	ld.specificClassId as specificclassid
from RPU r
	inner join LandDetail ld on r.objid = ld.rpuid
where ld.objid = $P{objid}	


#---------------------------------------------------
# BLDG
#---------------------------------------------------

[getBldgInfo]
SELECT 
	b.psic as psic,
	b.permitno as permitno,
	b.permitdate as permitdate,
	b.permitissuedby as permitissuedby,
	b.dtbldgcompleted as  dtcompleted,
	b.dtbldgoccupied as  dtoccupied,
	b.totalarea as totalarea,
    1 as  floorcount,
	b.depreciation as depreciation,
	0.0 as depreciationvalue,
	b.totaladjustment as totaladjustment,
	b.additionalinfo as additionalinfo,
	b.firstfloorbasevalue as firstfloorbasevalue,
	b.bldgage as bldgage,
	b.swornstatement as swornstatement,
	b.swornamount as  swornamount,
	0 as  useswornamount,
	100 as percentcompleted,
	b.bldgassesslevelid as assesslevelid,
	pc.code as assesslevelcode,
	pc.description as assesslevelname,
	b.assesslevel as assesslevel,
	0 as condominium,
	'FIRST CLASS' as bldgclass
FROM bldgrpu b
	inner join bldgassesslevel bal on b.bldgassesslevelid = bal.objid 
	inner join propertyclassification pc on bal.propertyclassificationid = pc.objid 
WHERE b.objid = $P{rpuid}

[getBldgType]
SELECT 
	b.bldgTypeId as bldgtypeid, 
	b.bldgTypeCode as bldgtypecode, 
	b.bldgTypeTitle as bldgtypename,
    b.bldgBaseValueType as  basevaluetype, 
    0 as  residualrate,
    b.predominant as predominant, 
    1 as depreciatecoreanditemseparately, 
    0 as  computedepreciationbasedonschedule 
FROM bldgrpu b
WHERE b.objid = $P{rpuid}

[getBldgKindBucc]
SELECT 
	b.bldgTypeClassificationId as bldgkindbuccid, 
	b.bldgKindId as bldgkindid, 
	b.bldgKindCode as  bldgkindcode, 
	b.bldgKindTitle as bldgkindname,
    b.bldgBaseValueType as  basevaluetype, 
    b.baseValue as basevalue, 
    bc.minBaseValue as minbasevalue, 
    bc.maxBaseValue as maxbasevalue,
    0.0 as gapvalue, 
    0.0 as minarea, 
    0.0 as maxarea
FROM bldgrpu b
	inner join BldgTypeClassification bc on b.bldgTypeClassificationId = bc.objid 
WHERE b.objid = $P{rpuid}
		
[getBldgUses]		
SELECT 
	bu.objid,
    bu.actualUseId as actualuse,
	bu.actualUseTitle as actualusename,
    bu.area as area,
    bu.marketValue as basemarketvalue,
    0 as depreciationvalue,
    bu.adjustment as adjustment,
    bu.adjMarketValue as marketvalue,
    bu.assessLevel as assesslevel,
    bu.assessedValue as assessedvalue 
FROM BldgUse bu 
WHERE bu.bldgrpuid = $P{rpuid}

[getFloors]
SELECT 
	bf.objid,
	bf.floorNo as floorno,
	0.0 as  depreciationvalue,
	bf.adjustment as adjustment,
	bf.area as area,
	bf.storeyRate as storeyrate,
	bf.baseValue as basevalue,
	bf.marketValue as basemarketvalue,
	bf.adjMarketValue as  marketvalue
FROM BldgFloor bf
WHERE bf.bldguseid = $P{bldguseid}

[getBldgAddlItems]
SELECT 
	bfa.objid,
    bfa.unit as unit,
    bfa.amount as  amount,
    bfa.bldgAdditionalItemId as  addlitemid,
    bfa.bldgAdditionalItemCode as addlitemcode,
    bfa.bldgAdditionalItemTitle as addlitemname,
    bfa.unit as addlitemunit,
    bfa.bldgAdditionalItemExpression as  expr
FROM BldgFloorAdditional bfa
WHERE bfa.bldgfloorid = $P{floorid}

[getStructures]
SELECT 
	bs.objid,
    bs.structureId as structureid,
    bs.structureCode as structurecode,
    bs.structureTitle as structurename,
    bs.materialId as  materialid,
    bs.materialCode as materialcode,
    bs.materialTitle as materialname
FROM BldgRPUStructure bs
WHERE bs.bldgrpuid = $P{rpuid}

[getBldgActualUseInfo]
select 
	bl.special as fixrate,
	bu.assessLevel as rate,
	bu.actualUseTitle as actualusename,
	bu.actualUseId as actualuseid,
	bu.actualUseCode as actualusecode
from BldgUse bu
	inner join BldgAssessLevel bl on bu.bldgAssessLevelId = bl.objid
where bu.objid = $P{objid}

[getBldgAssessLevelRange]
select 
	br.mvFrom as mvfrom,
	br.mvTo as mvto,
	br.rate
from BldgUse bu
	inner join BldgAssessLevel bl on bu.bldgAssessLevelId = bl.objid
	inner join BldgAssessLevelRange br on bl.objid = br.bldgassesslevelid
where bu.objid = $P{objid}
order by br.mvFrom

		
#---------------------------------------------------
# MACH
#---------------------------------------------------

[getMachUses]
select
	mu.objid,
	mu.marketValue as basemarketvalue,
	mu.adjMarketValue as marketvalue,
	mu.assessLevel as assesslevel,
	mu.assessedValue as  assessedvalue,
	mu.machAssessLevelId as actualuseid,
	mu.actualUseCode as actualusecode,
	mu.actualUseTitle as actualusename
from MachineUse mu
where mu.rpuid = $P{rpuid}

[getMachActualUse]
select
	mal.objid as actualuseid,
	mu.actualUseCode as actualusecode,
	mu.actualUseTitle as actualusename,
	mal.special as  fixrate
from MachAssessLevel mal
	inner join MachineUse mu on mal.objid = mu.machAssessLevelId 
where mu.rpuid = $P{rpuid}
  and  mal.objid = $P{actualuseid}
        
[getMachDetails]		
select
	ml.objid,
	ml.operationYear as operationyear,
	ml.replacementCost as replacementcost,
	ml.depreciation as depreciation,
	ml.depreciation as depreciationvalue,
	ml.marketValue as basemarketvalue,
	ml.adjMarketValue as marketvalue,
	ml.assessLevel as assesslevel,
	ml.assessedValue as assessedvalue,
	null as brand,
	null as capacity,
	null as model,
	null as serialno,
	null as status,
	null as yearacquired,
	0 as estimatedlife,
	0 as remaininglife,
	null as yearinstalled,
	0 as yearsused,
	ml.replacementCost as  originalcost,
	0.0 as freightcost,
	0.0 as insurancecost,
	0.0 as installationcost,
	0.0 as brokeragecost,
	0.0 as arrastrecost,
	0.0 as othercost,
	ml.replacementCost as acquisitioncost,
	null as feracid,
	0 as ferac,
	0 as forexid,
	0 as forex,
	0 as residualrate,
	1.0 as conversionfactor,
	ml.machineId as machineid,
	ml.machineCode as machinecode,
	ml.machineTitle as machinename,
	ml.useSwornAmount as useswornamount,
	ml.swornAmount as swornamount,
	0 as imported,
	0 as newlyinstalled,
	0 as autodepreciate
from MachineList ml
where ml.machineuseid = $P{machuseid} 
        

#---------------------------------------------------
# PLANT/TREE
#---------------------------------------------------

[getPlantTreeInfo]
SELECT 
	t.objid,
	t.totalBearing as totalbearing,
	t.totalNonBearing as totalnonbearing
FROM treerpu t
where t.objid = $P{rpuid}

		
#---------------------------------------------------
# MISC
#---------------------------------------------------
[getMiscInfo]
select
	mr.objid,
	mr.miscAssessLevelId as actualuseid,
	mr.actualUseCode as actualusecode,
	mr.actualUseTitle as actualusename,
	mr.assessLevel as assesslevel 
from MiscRPU mr
where mr.objid = $P{rpuid}
		
[getMiscItems]		
select
	mi.objid,
	mi.depreciation as depreciation,
	mi.marketValue - mi.adjMarketValue as depreciatedvalue,
	mi.marketValue as basemarketvalue,
	mi.adjMarketValue as marketvalue,
	mi.assessLevel as assesslevel,
	mi.assessedValue as assessedvalue,
	mi.miscItemValueId as miscitemvalueid,
	mi.miscItemId as miscitemid,
	mi.miscItemCode as miscitemcode,
	mi.miscItemTitle as  miscitemname,
	mi.expression as expr 
from MiscRPUItem mi
where mi.rpuid = $P{rpuid}



#---------------------------------------------------
# RPTLedger
#---------------------------------------------------
[rptledger_ids]
SELECT rl.objid
FROM RPTLedger rl
	INNER JOIN TaxDeclaration td ON rl.tdid = td.objid 
	INNER JOIN RPU r ON td.rpuid = r.objid 
	INNER JOIN RealProperty rp ON r.realpropertyid= rp.objid
	LEFT JOIN payer p on td.taxpayerId = p.objid

[rptledger_insert]
INSERT INTO rptledger
(
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	fullpin, 
	claimno, 
	faasid, 
	rputype, 
	classid, 
	classcode , 
	actualuseid, 
	actualusecode, 
	tdno,
	prevtdno, 
	cadastrallotno, 
	blockno, 
	barangay, 
	txntype, 
	taxable, 
	assessedvalue, 
	taxpayerid, 
	taxpayerno, 
	taxpayername, 
	taxpayeraddress, 
	administratorid, 
	administratorno, 
	administratorname, 
	administratoraddress, 
	lastyearpaid, 
	lastqtrpaid, 
	partialbasic, 
	partialsef, 
	firstqtrpaidontime, 
	partialbasicint, 
	partialsefint
)
values
(
$P{objid}, 
$P{schemaname}, 
$P{schemaversion}, 
$P{docstate}, 
$P{fullpin}, 
$P{claimno}, 
$P{faasid}, 
$P{rputype}, 
$P{classid}, 
$P{classcode }, 
$P{actualuseid}, 
$P{actualusecode}, 
$P{tdno},
$P{prevtdno}, 
$P{cadastrallotno}, 
$P{blockno}, 
$P{barangay}, 
$P{txntype}, 
$P{taxable}, 
$P{assessedvalue}, 
$P{taxpayerid}, 
$P{taxpayerno}, 
$P{taxpayername}, 
$P{taxpayeraddress}, 
$P{administratorid}, 
$P{administratorno}, 
$P{administratorname}, 
$P{administratoraddress}, 
$P{lastyearpaid}, 
$P{lastqtrpaid}, 
$P{partialbasic}, 
$P{partialsef}, 
$P{firstqtrpaidontime}, 
$P{partialbasicint}, 
$P{partialsefint}
)


[rptledger_info]
SELECT
	rl.objid, 
	'rptledger' AS schemaname, 
	'1.0' AS schemaversion, 
	rl.state AS docstate, 
	case when r.suffix = 0 
		then rp.pin 
		else (rp.pin + '-' + cast(r.suffix as varchar(255)))
	end as fullpin, 
	rp.claimno as claimno, 
	td.objid as faasid, 
	lower(r.type ) as  rputype, 
	r.classificationId as  classid, 
	r.classCode as classcode , 
	r.classificationId as  actualuseid, 
	r.classCode as  actualusecode, 
	td.tdno,
	td.previousTdNo as  prevtdno, 
	isnull(rp.cadastralLotNo,'-') as  cadastrallotno, 
	null as  blockno, 
	rp.location as  barangay, 
	td.txnType as  txntype, 
	r.taxable as  taxable, 
	r.totalAV as  assessedvalue, 
	td.taxpayerId as taxpayerid, 
	isnull(p.taxpayerno,'-') as  taxpayerno, 
	td.taxpayerName as taxpayername, 
	td.taxpayerAddress as taxpayeraddress, 
	td.administratorId as administratorid, 
	null as  administratorno, 
	td.administratorName as administratorname, 
	td.administratorAddress as  administratoraddress, 
	rl.lastYearPaid as lastyearpaid, 
	rl.lastQtrPaid as lastqtrpaid, 
	0 as partialbasic, 
	0 as partialsef, 
	0 as firstqtrpaidontime, 
	0 as partialbasicint, 
	0 as partialsefint
FROM RPTLedger rl
	INNER JOIN TaxDeclaration td ON rl.tdid = td.objid 
	INNER JOIN RPU r ON td.rpuid = r.objid 
	INNER JOIN RealProperty rp ON r.realpropertyid= rp.objid
	LEFT JOIN payer p on td.taxpayerId = p.objid
where  rl.objid = $P{objid}


[rptledgeritem_ids]
SELECT	rli.objid
FROM RPTLedger rl
	INNER JOIN RPTLedgerItem rli ON rl.objid = rli.parentid 
	LEFT JOIN TaxDeclaration td ON rli.tdno  = td.tdno 
	LEFT JOIN RPU r ON td.rpuid = r.objid;

[rptledgeritem_insert]
INSERT INTO rptledgeritem
(
	objid, 
	schemaname, 
	schemaversion, 
	docstate, 
	parentid, 
	faasid, 
	tdno, 
	txntype, 
	classid, 
	classcode, 
	actualuseid, 
	actualusecode, 
	taxable, 
	backtax, 
	fromyear, 
	toyear,
	assessedvalue, 
	systemcreated 	
)
values 
(
$P{objid}, 
$P{schemaname}, 
$P{schemaversion}, 
$P{docstate}, 
$P{parentid}, 
$P{faasid}, 
$P{tdno}, 
$P{txntype}, 
$P{classid}, 
$P{classcode}, 
$P{actualuseid}, 
$P{actualusecode}, 
$P{taxable}, 
$P{backtax}, 
$P{fromyear}, 
$P{toyear},
$P{assessedvalue}, 
$P{systemcreated}
)

[rptledgeritem_info]
SELECT
	rli.objid, 
	'rptledger:rptledgeritem' as schemaname, 
	'1.0' as schemaversion, 
	convert(varchar(25),rli.state) as  docstate, 
	rl.objid as  parentid, 
	td.objid as  faasid, 
	convert(varchar(30), rli.tdno) as tdno, 
	isnull(td.txntype, '') as txntype, 
	isnull(r.classificationId, '') as classid, 
	isnull(r.classCode, '') as  classcode, 
	isnull(r.classificationId, '') as actualuseid, 
	isnull(r.classCode, '') as actualusecode, 
	case when r.taxable is null then 1 else r.taxable end as  taxable, 
	0 as backtax, 
	rli.fromYear as  fromyear, 
	rli.toYear as  toyear,
	rli.assessedValue as  assessedvalue, 
	rli.systemCreated as  systemcreated 
FROM RPTLedger rl
	INNER JOIN RPTLedgerItem rli ON rl.objid = rli.parentid 
	LEFT JOIN TaxDeclaration td ON rli.tdno  = td.tdno 
	LEFT JOIN RPU r ON td.rpuid = r.objid
WHERE rli.objid = $P{objid}




