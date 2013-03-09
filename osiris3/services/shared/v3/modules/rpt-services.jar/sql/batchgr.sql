[getLandFAASIdForRevision]
SELECT objid, section  
FROM faaslist  fl 
WHERE fl.barangayid = $P{barangayid}
  AND fl.ry < $P{newry} 
  AND fl.docstate = 'CURRENT' 
  AND fl.rputype = 'land' 
  AND NOT EXISTS(SELECT * FROM faaslist WHERE prevtdno = fl.tdno AND ry = $P{newry}  )  
ORDER BY fl.fullpin 

[getCurrentRY]
SELECT ry FROM rptsetting  

[getRYSetting_land]
SELECT * FROM landrysetting  where ry = $P{ry}

[getRYSetting_bldg]
SELECT * FROM bldgrysetting  where ry = $P{ry}

[getRYSetting_mach]
SELECT * FROM machrysetting  where ry = $P{ry}

[getRYSetting_planttree]
SELECT * FROM planttreerysetting  where ry = $P{ry}

[getRYSetting_misc]
SELECT * FROM miscrysetting  where ry = $P{ry}

[getLandRYSetting] 
SELECT * FROM landrysetting ORDER BY ry 

[getBldgRYSetting] 
SELECT * FROM bldgrysetting ORDER BY ry 

[getMachRYSetting] 
SELECT * FROM machrysetting ORDER BY ry 

[getPlantTreeRYSetting] 
SELECT * FROM planttreerysetting ORDER BY ry 

[getMiscRYSetting] 
SELECT * FROM miscrysetting ORDER BY ry 


[getPendingFaasList]
SELECT objid FROM faaslist 
WHERE barangayid LIKE $P{barangayid}
  AND docstate NOT IN ('CURRENT', 'CANCELLED')
  AND ry <> $P{ry}
  
[getPendingSubdivisions]  
SELECT objid FROM subdivision
WHERE docstate <> 'APPROVED' 

[getPendingConsolidations]  
SELECT objid FROM consolidation
WHERE docstate <> 'APPROVED' 

[getPendingAnnotations]  
SELECT objid FROM faasannotation
WHERE docstate <> 'APPROVED' 

[getActiveTxnReferences]
SELECT fl.objid FROM faaslist fl 
	INNER JOIN txnreference r ON fl.objid = r.objid 

	
[insertBatchGRError]	
INSERT INTO batchgrerror(faasid, ry, msg)
VALUES($P{faasid}, $P{ry}, $P{msg})


[deleteBatchGRError]
DELETE FROM batchgrerror WHERE faasid = $P{faasid} 