{{ config(materialized="materialized_view",pre_hook="set rw_streaming_allow_jsonb_in_stream_key to true")
 }}
select
    (meta -> 'domain') as domain,
    to_timestamp(timestamp) timestamp,
    user,
    bot,
    comment
from {{ ref("src_wikimedia") }}

