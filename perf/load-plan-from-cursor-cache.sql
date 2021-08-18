--show parameter baselines

--select * from dba_sql_plan_baselines;

--select * from dba_sql_profiles order by created desc;

DECLARE
my_plans pls_integer;
BEGIN
  my_plans := DBMS_SPM.LOAD_PLANS_FROM_CURSOR_CACHE(
    sql_id => 'c89x4xk3f7j0h');
END;
/