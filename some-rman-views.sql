-- Author: Ricardo Vieira
-- Created: 2018
-- Description:

set lines 200 pages 100

col value for a70

select * from v$rman_output where output like 'Finished%';

select * from v$rman_backup_job_details;
select * from v$rman_configuration;
select * from v$backup_corruption;
select * from v$rman_status;

select * from v$hm_check;
select * from v$hm_check_param;

select * from v$backup_set_summary;
