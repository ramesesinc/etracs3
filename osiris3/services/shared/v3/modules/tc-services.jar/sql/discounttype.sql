[getListByFilter]
SELECT * FROM discounttype o
WHERE ${filters}
ORDER BY objid 

[checkDuplicateType]
SELECT * 
FROM discounttype 
WHERE discounttype = $P{discounttype}
AND objid <> $P{objid} 

[checkReferencedItem]
SELECT objid 
FROM receiptitem 
WHERE discounttypeid = $P{discounttypeid}

