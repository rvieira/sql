#!/bin/ksh
#
# Author: Ricardo Vieira

. ~/.bash_profile

MAX_PCT=50
#ORACLE_SID=&SID
OUTPUT_FILE=/tmp/recovery_area_usage-debug.txt

sqlplus -s "/ as sysdba" <<HERE
set lines 200
spool $OUTPUT_FILE
select * from v\$recovery_area_usage;
spool off;
HERE

set | grep ORA >> ${OUTPUT_FILE}
if [ `cut -c 25-42 $OUTPUT_FILE | tail -n+5 | sort -n | tail -1 | awk '{print $1}' | xargs printf "%.f\n"` -gt $MAX_PCT ]; then
  mailx -s 'Quota exceeded on FRA' &email < $OUTPUT_FILE
fi
