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
WHERE td.tdno = $P{tdno}
	
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
