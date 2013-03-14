[getList]
SELECT objid, docstate, ry, newtdno, newpin, areasqm, areaha, newtaxpayerid, newtaxpayername, newtaxpayeraddress 
FROM consolidation 

[getListByTdno]
SELECT objid, docstate, ry, newtdno, newpin, areasqm, areaha, newtaxpayerid, newtaxpayername, newtaxpayeraddress 
FROM consolidation 
WHERE newtdno = $P{newtdno}

[getListByPIN]
SELECT objid, docstate, ry, newtdno, newpin, areasqm, areaha, newtaxpayerid, newtaxpayername, newtaxpayeraddress 
FROM consolidation 
WHERE newpin = $P{newpin} 

[getListByTaxpayer]
SELECT objid, docstate, ry, newtdno, newpin, areasqm, areaha, newtaxpayerid, newtaxpayername, newtaxpayeraddress 
FROM consolidation 
WHERE newtaxpayername LIKE $P{newtaxpayername} 

[getCurrentRy]
SELECT ry FROM rptsetting 

[getConsolidatedLands]
SELECT * FROM consolidationland WHERE consolidationid = $P{consolidationid} ORDER BY tdno 

[getAffectedRpus]
SELECT * FROM consolidationaffectedrpu WHERE consolidationid = $P{consolidationid} ORDER BY rputype, prevtdno 

[getConsolidatedLandAffectedRpus]
SELECT * FROM faaslist 
WHERE landfaasid = $P{landfaasid} 
  AND rputype <> 'land' 
  AND docstate <> 'CANCELLED' 
  
  
[getTotalConsolidatedLandArea]  
SELECT SUM( areasqm ) AS totalareasqm FROM consolidationland WHERE consolidationid = $P{consolidationid}


[cancelConsolidationLandLedgers]
UPDATE rptledger rl, consolidationland cl SET 
	rl.docstate = 'CANCELLED' 
WHERE rl.faasid = cl.landfaasid  
  AND cl.consolidationid = $P{consolidationid}  

[getMinLastYearPaidByConsolidation]  
SELECT MIN(lastyearpaid) as minlastyearpaid 
FROM rptledger rl 
	INNER JOIN consolidationland cl on rl.faasid = cl.landfaasid 
WHERE cl.consolidationid = $P{consolidationid} 

[getLedgerByFaasId]
SELECT * FROM rptledger WHERE faasid = $P{faasid} 
  

#---------------------------------------------------------------
# DELETE
#---------------------------------------------------------------
[deleteLand]
DELETE FROM consolidationland WHERE consolidationid = $P{consolidationid} 

[deleteAffectedRpuFaas]
DELETE FROM faas WHERE objid IN ( SELECT newfaasid FROM consolidationaffectedrpu WHERE consolidationid = $P{consolidationid} )

[deleteAffectedRpus]
DELETE FROM consolidationaffectedrpu WHERE consolidationid = $P{consolidationid} 

[deleteConsolidatedFaas]
DELETE FROM faas WHERE objid IN (SELECT newfaasid FROM consolidation WHERE objid = $P{objid} ) 

[deleteConsolidation]
DELETE FROM consolidation WHERE objid = $P{objid} 

[deleteConsolidatedLandAffectedRpu]
DELETE FROM consolidationaffectedrpu WHERE consolidationid = $P{consolidationid} AND landfaasid = $P{landfaasid} 

[deleteTxnRefs]
DELETE FROM txnreference WHERE refid = $P{refid}


#---------------------------------------------------------------
# CHECK
#---------------------------------------------------------------
[checkDuplicateLand]
SELECT objid FROM consolidationland WHERE landfaasid = $P{landfaasid} 


[getImprovementStates] 
SELECT f.tdno, f.docstate  
FROM faaslist f, consolidationaffectedrpu r  
WHERE f.objid = r.prevfaasid  
  AND f.docstate NOT IN ('CURRENT', 'CANCELLED')  
  AND r.consolidationid = $P{consolidationid} 

  
[getAffectedRpuUnapprovedLedgers]  
SELECT rl.tdno, rl.docstate 
FROM consolidationaffectedrpu r, rptledger rl 
WHERE r.prevfaasid = rl.faasid  
  AND rl.docstate NOT IN ('APPROVED')  
  AND r.consolidationid = $P{consolidationid} 
  
[checkDuplicateTDNo]
SELECT objid, tdno FROM faaslist WHERE tdno = $P{tdno} AND objid <> $P{objid} 
  
[getPin]
SELECT * FROM pin WHERE pin = $P{pin} AND  ry = $P{ry} 