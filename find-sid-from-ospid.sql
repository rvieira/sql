-- Get SID from ospid

SELECT
   CHR(10)||
   'Check for SESSION ID ---->  '||LPAD( s.sid, 4 )||CHR(10)||CHR(10) as "Session ID"
FROM
   v$session s, v$process p
WHERE
   p.addr = s.paddr AND
   p.spid = 3269;&Enter_OSPid