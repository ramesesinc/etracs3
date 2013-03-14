[getListByFilter]
SELECT * FROM profession o
WHERE ${filters}

[open]
SELECT * FROM profession
WHERE objid = $P{objid}

[insert]
INSERT INTO profession ( objid)
VALUES($P{objid})

[delete]
DELETE FROM profession 
WHERE objid = $P{objid}