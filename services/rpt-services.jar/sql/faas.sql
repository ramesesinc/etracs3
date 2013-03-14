#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getInfoById]
SELECT objid, docstate, schemaname, tdno, fullpin, claimno, ledgerid, issuedate, rputype, ry 
FROM faaslist WHERE objid = $P{objid} 

[getInfoByTdno]
SELECT objid, docstate, schemaname, tdno, fullpin, claimno, ledgerid, issuedate, rputype, ry 
FROM faaslist WHERE tdno = $P{tdno} 

[getInfoByPin]
SELECT objid, docstate, schemaname, tdno, fullpin, claimno, ledgerid, issuedate, rputype, ry 
FROM faaslist WHERE pin = $P{pin} 

[getLandReferenceByPin]
SELECT objid, schemaname, taxpayerid FROM faaslist WHERE fullpin = $P{pin} AND docstate <> 'CANCELLED' 

[getTxnReference]
SELECT * FROM txnreference WHERE objid = $P{objid}

[getState]
SELECT docstate FROM faas WHERE objid = $P{objid}

[getByTdNo]
SELECT docstate FROM faas WHERE tdNo = $P{tdNo}

[getPinCount]
SELECT COUNT(*) AS pinCount FROM faaslist WHERE pin = $P{pin}

[getExchangePinList]
SELECT objid, pin FROM faaslist WHERE objid <> $P{objid}  AND docstate = 'FORAPPROVAL' ORDER BY pin 

[getLookupList]
SELECT * FROM faaslist

[getLookupByTdNo]
SELECT * FROM faaslist 
${whereClause}

[getFaasHistory]
SELECT h.objid, h.faasid, h.pin, h.tdno, lh.municipality 
FROM rpu r, rpu_history h, faaslist lh 
WHERE r.objid = h.parentid 
  AND h.faasid = lh.objid 
  AND r.faasid = $P{faasid}   
ORDER BY h.tdno DESC   

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

[getLgu]
SELECT objid, lguname, indexno, parentid FROM lgu WHERE objid = $P{objid} 

[getPin]
SELECT * FROM pin WHERE pin = $P{pin}

[getPinClaimnoRy]
SELECT * FROM pin 
WHERE pin = $P{pin} AND claimno = $P{claimno} AND ry = $P{ry}

[getCurrentRY]
SELECT ry FROM rptsetting  
 

[getLedgerInfo]
SELECT objid, docstate, lastyearpaid, lastqtrpaid, taxable, assessedvalue FROM rptledger where objid = $P{objid} 


[getLandImprovementIds]
SELECT objid FROM faaslist 
WHERE landfaasid = $P{landfaasid} 
AND docstate NOT IN ('CANCELLED') 

[getBarangayInfo]
SELECT provcity, munidistrict, barangay, barangayid, provcityindex, munidistrictindex, barangayindex 
FROM faaslist 
WHERE objid = $P{objid} 
 
[getTaxpayerInfo]
SELECT taxpayerid, taxpayerno, taxpayername, taxpayeraddress FROM faaslist WHERE objid = $P{objid} 

[getAttachmentById]
SELECT * FROM faasattachment WHERE objid = $P{objid}

[getAttachments]
SELECT * FROM faasattachment WHERE faasid = $P{faasid}

[getAttachmentForTransmittal]
SELECT * FROM faasattachment WHERE docstate = 'FORTRANSMITTAL' 

[getMunicipalities]
SELECT * FROM lgu WHERE lgutype = 'MUNICIPALITY' ORDER BY objid 

[getDistricts]
SELECT * FROM lgu WHERE lgutype = 'DISTRICT' ORDER BY objid 

[getBarangays]
SELECT * FROM lgu WHERE lgutype = 'BARANGAY' ORDER BY objid 

[getBarangayListByParentId]
SELECT * FROM lgu 
WHERE parentid = $P{parentid} 
  AND lgutype = 'BARANGAY' 
ORDER BY lguname

[getActiveAnnotationId] 
SELECT objid FROM faasannotation WHERE faasid = $P{faasid} AND docstate = 'APPROVED' ORDER BY docno DESC 

[getActiveAnnotations] 
SELECT * FROM faasannotation WHERE faasid = $P{faasid} AND docstate = 'APPROVED' ORDER BY docno DESC 

[getActiveAnnotationTexts] 
SELECT memoranda AS annotationtext FROM faasannotation WHERE faasid = $P{faasid} AND docstate = 'APPROVED' ORDER BY docno DESC 


[getLandReference] 
SELECT tdno, taxpayername, pin, cadastrallotno, totalareasqm FROM faaslist WHERE objid = $P{objid} 

[updateFAASAnnotationInfo]
UPDATE faasannotation SET 
	docstate = $P{docstate}, 
	tdno = $P{tdno} 
WHERE faasid = $P{faasid}	 

[updateFAASAnnotationState]
UPDATE faasannotation SET 
	docstate = $P{docstate} 
WHERE faasid = $P{faasid}	




[deleteFAASAnnotations]
DELETE FROM faasannotation WHERE faasid = $P{faasid} 

[deleteFaasAttachments]
DELETE FROM faasattachment WHERE faasid = $P{faasid}

#----------------------------------------------------------------
# INSERT
#----------------------------------------------------------------
[insertPin]
INSERT INTO pin ( pin, claimno, docstate, ry, rpid, rputype ) 
VALUES( $P{pin}, $P{claimno}, $P{docstate}, $P{ry}, $P{rpid}, $P{rputype} )

[insertTxnReference]
INSERT INTO txnreference (objid, refid, refname, message, txndate )  
VALUES( $P{objid}, $P{refid}, $P{refname}, $P{message}, $P{txndate} ) 

#----------------------------------------------------------------
# UPDATE
#----------------------------------------------------------------
[updateState]    
UPDATE faas SET docstate = $P{docstate} WHERE objid = $P{objid} 
    
[updateListState]    
UPDATE faaslist SET docstate = $P{docstate} WHERE objid = $P{objid} 

[updatePinState]    
UPDATE pin SET docstate = $P{docstate} 
WHERE pin = $P{pin} AND ry = $P{ry}

[updatePinStateWithClaimno]    
UPDATE pin SET docstate = $P{docstate} 
WHERE pin = $P{pin} AND claimno = $P{claimno} AND ry = $P{ry}

[updateListCancelInfo]
UPDATE faaslist SET 
    docstate     = $P{docstate}, 
    cancelreason = $P{cancelreason},  
    canceldate  = $P{canceldate}, 
    cancelledbytdnos = $P{cancelledbytdnos} 
WHERE objid = $P{objid}    


[updateListTdNo]
UPDATE faaslist SET tdno = $P{tdno} WHERE objid = $P{objid} 


[updateListLandReference]
UPDATE faaslist SET landfaasid = $P{landfaasid}, landfaastaxpayerid = $P{landfaastaxpayerid} WHERE objid = $P{objid} 

[updateMessage]
UPDATE faas SET message = $P{message} WHERE objid = $P{objid} 

[updateAttachmentState]
UPDATE faasattachment SET docstate = $P{docstate} WHERE faasid = $P{faasid}

[updateFaasAttachmentInfo]
UPDATE faasattachment SET  
    docstate = $P{docstate}, 
    message = $P{message}  
WHERE objid = $P{objid} 



#----------------------------------------------------------------
# CHECKS
#----------------------------------------------------------------
[checkDuplicateTdNo]
SELECT tdno FROM faaslist WHERE objid <> $P{objid} AND tdno = $P{tdno}

#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------
[deletePin]		
DELETE FROM pin 
WHERE pin = $P{pin} AND ry = $P{ry}

[deleteTxnReference]
DELETE FROM txnreference WHERE refid = $P{refid} 
		
		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[getList]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha, munidistrict, annotated 
FROM faaslist o 
WHERE o.docstate LIKE $P{docstate} 
${filters} 
ORDER BY o.tdno, o.fullpin 

[findByTaxpayerId]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha , munidistrict , annotated 
FROM  faaslist 
WHERE taxpayerid = $P{taxpayerid} 
  AND docstate LIKE $P{docstate}  

[findByFilter]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha , munidistrict , annotated 
FROM  faaslist  
WHERE ${whereclause}   
ORDER BY tdno, fullpin   

[getFaasFilters]
SELECT * FROM filter WHERE refname = 'faas' ORDER BY name  

[getFaasIds]
select objid, tdno from faaslist where ${filter}

[getClassificationList]
SELECT objid, propertycode AS classcode, propertydesc AS classname FROM propertyclassification ORDER BY orderno  


[createFilter]
INSERT INTO filter (objid, name, refname, info )
VALUES ( $P{objid}, $P{name}, $P{refname}, $P{info} )

[removeFilter]
DELETE FROM filter WHERE objid = $P{objid}



#----------------------------------------------------------------
# CLEARED FINDERS
#----------------------------------------------------------------
[findClearedList]
SELECT  
	f.*, rl.lastyearpaid, rl.assessedvalue, rl.lastqtrpaid , rl.objid as ledgerid     
FROM faaslist f 
	INNER JOIN rptledger rl ON f.objid = rl.faasid  
WHERE rl.docstate = 'APPROVED' 
${filters}


[findByExaminer]
SELECT * FROM faaslist ${whereClause}


[getCityMunicipalityList]
SELECT * FROM lgu 
WHERE lgutype IN ('CITY', 'MUNICIPALITY') 
ORDER BY lguname 



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

[insertBackTaxItem]
INSERT INTO backtaxitem
	(objid, faasid, ry, tdno, bmv, mv, av, effectivityyear, effectivityqtr, taxable)
VALUES 
	($P{objid}, $P{faasid}, $P{ry}, $P{tdno}, $P{bmv}, $P{mv}, $P{av}, $P{effectivityyear}, $P{effectivityqtr}, $P{taxable})