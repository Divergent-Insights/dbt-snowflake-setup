with stg_source_freshness as
(
    select 
        payload:metadata:dbt_schema_version,
        payload:metadata:dbt_version,
        payload:metadata:generated_at,
        payload:metadata:invocation_id,
        results.value:unique_id,
        results.value:max_loaded_at,
        results.value:snapshotted_at,
        results.value:max_loaded_at_time_ago_in_s,
        results.value:status,
        results.value:criteria,
        results.value:criteria:warn_after,
        results.value:criteria:warn_after:count,
        results.value:criteria:warn_after:period,    
        results.value:criteria:error_after,
        results.value:criteria:error_after:count,
        results.value:criteria:error_after:period,
        results.value:thread_id,
        results.value:execution_time,
        timing.value:name,
        timing.value:started_at,
        timing.value:completed_at
    from my_table
    ,lateral flatten(input => payload:results) as results
    ,lateral flatten(input => results.value:timing) as timing
)
select * from stg_source_freshness
