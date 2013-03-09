[getUnreadMessages]
SELECT * FROM sys_inbox 
WHERE docstate = 'UNREAD'
ORDER BY dtposted

[getReadMessages]
SELECT * FROM sys_inbox 
WHERE docstate = 'READ'
ORDER BY dtposted


[getUndeliveredMessages]
SELECT * FROM sys_outbox 
WHERE docstate = 'UNDELIVERED'
ORDER BY dtposted

[getDeliveredMessages]
SELECT * FROM sys_outbox 
WHERE docstate = 'DELIVERED'
ORDER BY dtposted

[getInboxMessage]
SELECT * 
FROM sys_inbox 
WHERE objid = $P{objid}

[getOutboxMessage]
SELECT * 
FROM sys_outbox 
WHERE objid = $P{objid}

[updateInboxMessageState]
UPDATE sys_inbox SET
	docstate = $P{docstate}
WHERE objid = $P{objid}	

[getInboxMessages]
SELECT * 
FROM sys_inbox 
WHERE receiverid = $P{receiverid} 
  AND docstate = 'UNREAD' 
ORDER BY dtposted   

[getOutboxMessages]
SELECT * 
FROM sys_outbox 
WHERE docstate = 'UNDELIVERED'
ORDER BY dtposted 

[getOutboxMessagesByReceiver]
SELECT * 
FROM sys_outbox 
WHERE docstate = 'UNDELIVERED'
  AND receiverid = $P{receiverid}
ORDER BY dtposted 

[getOtherDestinationMessages]
SELECT *
FROM sys_inbox 
WHERE receiverid <> $P{receiverid}  
  AND docstate = 'UNREAD' 

  



#--------------------------------------------
# Response Data
#--------------------------------------------

[getResponseData]
SELECT * FROM sys_responsedata WHERE sessionid = $P{sessionid}

[deleteResponseDataBySessionId]
DELETE FROM sys_responsedata WHERE sessionid = $P{sessionid} 

[insertResponseData]
INSERT INTO sys_responsedata 
	(objid, sessionid, status, data, senderid, sendername, receiverid, receivername ) 
VALUES ($P{objid}, $P{sessionid}, $P{status}, $P{data}, $P{senderid}, $P{sendername}, $P{receiverid}, $P{receivername} )


