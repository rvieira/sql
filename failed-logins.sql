SELECT *  
FROM  
  sys.dba_audit_session  
where  
   returncode != 0 
and timestamp > sysdate-1/48;

--select count(*) from sys.dba_audit_session where timestamp > sysdate-1/48;