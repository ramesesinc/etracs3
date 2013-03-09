[getListByFilter]
SELECT * FROM entityidcardtype o
WHERE ${filters}

[open]
SELECT * FROM entityidcardtype
WHERE objid = $P{objid}

[insert]
INSERT INTO entityidcardtype ( objid)
VALUES($P{objid})

[delete]
DELETE FROM entityidcardtype 
WHERE objid = $P{objid}