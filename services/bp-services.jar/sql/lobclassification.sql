[getList]
SELECT * 
FROM lobclassification  
${filters}
ORDER BY name 

[getClassifications]
SELECT objid, name FROM lobclassification ORDER BY name 


