
SELECT 'SGA: '||name         	AS info
 	, round(value/1024/1024, 2) AS MB
 	, NULL                 	AS program
 	, NULL                 	AS logon_time
 	, NULL                 	AS SID
 	, NULL                 	AS SERIAL
 	, NULL                 	AS user_name
 	, NULL                 	AS machine
 	, NULL                 	AS osuser
FROM  v$sga

UNION ALL

SELECT 'PGA: Process-ID '||p.spid AS info

 	, round(p.pga_alloc_mem/1024/1024,2) AS MB
 	, p.program            	AS program
 	, s.logon_time         	AS logon_time
 	, s.sid                	AS SID
 	, s.serial#            	AS SERIAL
 	, s.username           	AS user_name
 	, s.machine            	AS machine
 	, s.osuser             	AS osuser
FROM  v$session s

, v$sesstat pcur
, v$process p
WHERE

  	pcur.statistic# = 20	AND
  	s.paddr    	= p.addr AND
  	pcur.sid   	= s.sid
ORDER BY 2 DESC;