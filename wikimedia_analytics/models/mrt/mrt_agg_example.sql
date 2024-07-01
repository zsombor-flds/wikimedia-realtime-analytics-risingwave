{{ config(materialized="materialized_view",pre_hook="set rw_streaming_allow_jsonb_in_stream_key to true")
 }}
select
    (meta -> 'domain') as domain,
    min(to_timestamp(timestamp)) as min_edit,
    max(to_timestamp(timestamp)) as max_edit,
    count(1) as total_records,
    count(distinct user) as distinct_users,
    count(case when bot = true then 1 end) as bot_edits,
    count(case when bot = false then 1 end) as human_edits,
    avg(length(comment)) as avg_comment_length,
    max(length(comment)) as maximum_comment_length
from {{ ref("src_wikimedia") }}
group by domain
