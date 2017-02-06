create or replace PROCEDURE PURGE_DB_SCHEMA(p_drop_syn_flag varchar2 default 'Y')
AS
  bad_obj varchar2(30);
  bad_obj_type varchar2(30);

  CURSOR get_tables IS
    SELECT object_name, object_type
    FROM user_objects
    WHERE object_type = 'TABLE'
    ORDER BY object_name;

  CURSOR get_snapshots IS
    SELECT object_name, object_type
    FROM user_objects
    WHERE object_type IN ('MATERIALIZED VIEW')
    ORDER BY object_type ASC;

  CURSOR get_synonyms IS
    SELECT object_name, object_type
    FROM user_objects
    WHERE object_type IN ('SYNONYM')
    ORDER BY object_type ASC;

  CURSOR get_objects IS
    SELECT object_type, object_name
    FROM user_objects
    WHERE object_name not in ('PURGE_DB_SCHEMA', 'PURGE_DATABASE')
    AND  object_type not in ( 'JOB', 'PROGRAM', 'PACKAGE BODY', 'SYNONYM', 'DATABASE LINK')
    ORDER BY object_type, object_name;

  CURSOR get_jobs IS
    SELECT object_type, object_name
    FROM user_objects
    WHERE OBJECT_TYPE ='JOB'
    ORDER BY object_type, object_name ASC;

  CURSOR get_programs IS
    SELECT object_type, object_name
    FROM user_objects
    WHERE OBJECT_TYPE ='PROGRAM'
    ORDER BY object_type, object_name ASC;

  CURSOR get_views IS
    SELECT object_type, object_name
    FROM user_objects
    WHERE OBJECT_TYPE ='VIEW'
    ORDER BY object_type, object_name ASC;


  BEGIN

    EXECUTE IMMEDIATE 'PURGE RECYCLEBIN';

    FOR tab in get_snapshots LOOP

      bad_obj := tab.object_name;
      bad_obj_type := tab.object_type;
      execute immediate 'DROP MATERIALIZED VIEW '||tab.object_name;
      --dbms_output.put_line('Snapshot '||tab.object_name||' and associated constraints have been dropped...');
    END LOOP;

    FOR tab in get_tables LOOP

      bad_obj := tab.object_name;
      bad_obj_type := tab.object_type;
      execute immediate 'DROP TABLE '||tab.object_name||' CASCADE CONSTRAINTS PURGE';
      --dbms_output.put_line('Table '||tab.object_name||' and associated constraints have been dropped...');

    END LOOP;

    if p_drop_syn_flag = 'Y' then

      FOR syn in get_synonyms LOOP

      bad_obj := syn.object_name;
      bad_obj_type := syn.object_type;
      execute immediate 'DROP SYNONYM '||syn.object_name||' FORCE';
      --dbms_output.put_line('Synonym '||syn.object_name||' and associated constraints have been dropped...');

      END LOOP;

     end if;

    FOR obj IN get_objects LOOP

      bad_obj := obj.object_name;
      bad_obj_type := obj.object_type;
      execute immediate 'DROP '||obj.object_type||' '||obj.object_name;
      --dbms_output.put_line(initcap(obj.object_type)||' '||obj.object_name||' has been dropped...');

    END LOOP;

    FOR job IN get_jobs LOOP

      bad_obj := job.object_name;
      bad_obj_type := job.object_type;
      sys.dbms_scheduler.drop_job(job.object_name);
      --dbms_output.put_line(initcap(job.object_type)||' '||job.object_name||' has been dropped...');

    END LOOP;

    FOR program IN get_programs LOOP

      bad_obj := program.object_name;
      bad_obj_type := program.object_type;
      sys.dbms_scheduler.drop_program(program.object_name);
      --dbms_output.put_line(initcap(program.object_type)||' '||program.object_name||' has been dropped...');

    END LOOP;

    FOR vw IN get_views LOOP

      bad_obj := vw.object_name;
      bad_obj_type := vw.object_type;
      execute immediate 'DROP VIEW '||vw.object_name||' FORCE';
      --dbms_output.put_line('View '||vw.object_name||' has been dropped...');
    END LOOP;

    EXCEPTION

    WHEN OTHERS THEN
    dbms_output.put_line('Encountered error while attempting to drop ' || bad_obj_type || ' ' || bad_obj || ': ' || SQLERRM);
    -- Send it back to the caller
    RAISE;

  END purge_db_schema;