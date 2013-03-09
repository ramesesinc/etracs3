[getListByFilter]
SELECT * FROM entitycontacttype o
WHERE ${filters}

[open]
SELECT * FROM entitycontacttype
WHERE objid = $P{objid}

[insert]
INSERT INTO entitycontacttype ( objid, isunique)
VALUES($P{objid} $P{isunique})

[delete]
DELETE FROM entitycontacttype 
WHERE objid = $P{objid}