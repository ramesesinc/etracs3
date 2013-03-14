[getListByFilter]
SELECT * FROM discounttype o
WHERE ${filters}
ORDER BY objid 

[checkReferencedItem]
SELECT objid 
FROM receiptitem 
WHERE discounttypeid = $P{discounttypeid}

