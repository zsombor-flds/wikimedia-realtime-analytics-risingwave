CREATE SOURCE wikichanges (
    meta_uri varchar,
    meta_request_id varchar,
    meta_id varchar,
    meta_dt timestamp,
    meta_domain varchar,
    meta_stream varchar,
    meta_topic varchar,
    meta_partition integer,
    meta_offset bigint,
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