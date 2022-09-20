-- Table: public.time_zones

-- DROP TABLE IF EXISTS public.time_zones;

CREATE TABLE IF NOT EXISTS public.time_zones
(
    gid integer NOT NULL DEFAULT nextval('time_zones_gid_seq'::regclass),
    objectid integer,
    scalerank smallint,
    featurecla character varying(50) COLLATE pg_catalog."default",
    name character varying(50) COLLATE pg_catalog."default",
    map_color6 smallint,
    map_color8 smallint,
    note character varying(250) COLLATE pg_catalog."default",
    zone double precision,
    utc_format character varying(50) COLLATE pg_catalog."default",
    time_zone character varying(254) COLLATE pg_catalog."default",
    iso_8601 character varying(254) COLLATE pg_catalog."default",
    places character varying(254) COLLATE pg_catalog."default",
    dst_places character varying(254) COLLATE pg_catalog."default",
    tz_name1st character varying(100) COLLATE pg_catalog."default",
    tz_namesum smallint,
    geom geometry(MultiPolygon,4326),
    CONSTRAINT time_zones_pkey PRIMARY KEY (gid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.time_zones
    OWNER to postgres;
-- Index: time_zones_ind

-- DROP INDEX IF EXISTS public.time_zones_ind;

CREATE INDEX IF NOT EXISTS time_zones_ind
    ON public.time_zones USING gist
    (geom)
    TABLESPACE pg_default;
