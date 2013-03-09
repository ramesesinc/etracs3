[lgu_ids]
select "objid" from lgu

[lgu_info]
select  
	"objid", 'lgu' as schemaname, '1.0' as schemaversion, 'DRAFT' AS docstate, 
	type as lgutype, indexno, pin, name as lguname, formalname,  parentid 
from lgu 
where "objid" = $P{objid} 

[lgu_insert]
insert into lgu 
(
	"objid", schemaname, schemaversion, docstate, lgutype, 
	indexno, pin, lguname, formalname, parentid
)
values 
(
	$P{objid}, $P{schemaname}, $P{schemaversion}, $P{docstate}, $P{lgutype}, 
	$P{indexno}, $P{pin}, $P{lguname}, $P{formalname}, $P{parentid}
)

[personnel_ids]
select "objid" from sys_user

[personnel_info]
select 
	"objid", username as staffno, firstname, lastname, middlename, email
from sys_user 
where "objid"=$P{objid} and username <> 'sysadmin'

[personnel_insert]
insert into personnel 
(	
	"objid", staffno, firstname, lastname, middlename, email
)
values
(
	$P{objid}, $P{staffno}, $P{firstname}, $P{lastname}, $P{middlename}, $P{email}
) 

[useraccount_ids]
select "objid" from sys_user

[useraccount_info]
select
	"objid",username as uid,'personnel' as usertype, firstname, lastname, middlename, email
from sys_user 
where "objid"=$P{objid} and username <> 'sysadmin' 

[useraccount_insert]
insert into useraccount
(
	"objid", "uid", usertype, firstname, lastname, middlename, email
)
values
(
	$P{objid}, $P{uid}, $P{usertype}, $P{firstname}, $P{lastname}, $P{middlename}, $P{email} 
)



