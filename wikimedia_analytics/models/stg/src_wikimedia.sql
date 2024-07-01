{{ config(materialized="source") }}
CREATE SOURCE  {{ this }} (
    meta jsonb,
    id integer,
    type varchar,
    namespace integer,
    title varchar,
    title_url varchar,
    comment varchar,
    timestamp integer,
    user varchar,
    bot boolean,
    notify_url varchar,
    server_url varchar,
    server_name varchar,
    server_script_path varchar,
    wiki varchar,
    parsedcomment varchar
)
WITH (
    connector='kafka',
    topic='wikichanges',
    properties.bootstrap.server='redpanda:9092',
    scan.startup.mode='latest',
    scan.startup.timestamp.millis='140000000'
) FORMAT PLAIN ENCODE JSON;
