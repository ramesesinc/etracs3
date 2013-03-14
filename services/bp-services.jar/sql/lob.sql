[getList]
SELECT * FROM lob  ${filters} ORDER BY name  


[getApprovedList]
SELECT * FROM lob WHERE docstate = 'APPROVED' ${filters} ORDER BY name  

[lookup]
SELECT objid, name, classificationid FROM lob WHERE docstate = 'APPROVED' ${filters} ORDER BY name  

[getAttributes]
SELECT * FROM lobattribute WHERE name LIKE $P{name} 

[getLobInUsed]
SELECT lobid  FROM bploblisting WHERE lobid = $P{objid}


[getRuleConditions]
SELECT conditions FROM rule WHERE ruleset = 'bpassessment'