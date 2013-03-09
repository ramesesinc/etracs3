[getList] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress, lguname 
FROM entity 
ORDER BY entityname 

[getListByNo] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress, lguname   
FROM entity 
WHERE entityno = $P{entityno} 
ORDER BY entityname 

[getListByName] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress, lguname  
FROM entity 
WHERE entityname LIKE $P{entityname} 
ORDER BY entityname 

[getMemberList]
SELECT * FROM entitymember WHERE entityid = $P{entityid} ORDER BY itemno 

[checkDuplicateNo]
SELECT COUNT(*) AS icount FROM entity WHERE objid <> $P{objid} AND entityno = $P{entityno} 

[checkDuplicateName]
SELECT * FROM entity 
WHERE objid <> $P{objid} 
  AND entityname = $P{entityname} AND entityaddress = $P{entityaddress} 

[getEntityInfo]
SELECT objid, entityno, entitytype, entityname, entityaddress, lguname   
FROM entity 
WHERE objid = $P{objid} 

[getContactNo]
SELECT contactno FROM entity WHERE objid = $P{objid} 

[getMappingList]  
SELECT * FROM entitymapping WHERE parentid = $P{parentid} 


#------------------------------------------------------
# Contact 
#------------------------------------------------------
[insertContact]
INSERT INTO entitycontact
	(objid, entityid, contacttype, contact )
VALUES	
	($P{objid}, $P{entityid}, $P{contacttype}, $P{contact} )

[deleteContact]	
DELETE FROM entitycontact WHERE objid = $P{objid}

[deleteContactByEntity]	
DELETE FROM entitycontact WHERE entityid = $P{objid}


[getContactByEntity]
SELECT * FROM entitycontact WHERE entityid=$P{entityid}

[getDuplicateContact]
SELECT e.entityname
FROM entity e
	INNER JOIN entitycontact c ON e.objid = c.entityid 
WHERE e.objid <> $P{entityid}
  AND c.contact = $P{contact} 
  AND c.contacttype = $P{contacttype}
  
  
#------------------------------------------------------
# ID CARD 
#------------------------------------------------------
[insertCard]
INSERT INTO entityidcard
	(objid, entityid, cardtype, cardno, expiry )
VALUES	
	($P{objid}, $P{entityid}, $P{cardtype}, $P{cardno}, $P{expiry} )

[deleteCard]	
DELETE FROM entityidcard WHERE objid = $P{objid}

[deleteCardByEntity]	
DELETE FROM entityidcard WHERE entityid = $P{objid}


[getCardByEntity]
SELECT * FROM entityidcard WHERE entityid=$P{entityid}


[getDuplicateCard]
SELECT e.entityname
FROM entity e
	INNER JOIN entityidcard c ON e.objid = c.entityid 
WHERE e.objid <> $P{entityid}
  AND c.cardtype = $P{cardtype} 
  AND c.cardno = $P{cardno}
  
