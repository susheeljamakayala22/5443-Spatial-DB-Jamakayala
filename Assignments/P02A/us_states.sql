-- Table: public.us_states

-- DROP TABLE IF EXISTS public.us_states;

CREATE TABLE IF NOT EXISTS public.us_states
(
    gid integer NOT NULL DEFAULT nextval('us_states_gid_seq'::regclass),
    region character varying(2) COLLATE pg_catalog."default",
    division character varying(2) COLLATE pg_catalog."default",
    statefp character varying(2) COLLATE pg_catalog."default",
    statens character varying(8) COLLATE pg_catalog."default",
    geoid character varying(2) COLLATE pg_catalog."default",
    stusps character varying(2) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default",
    lsad character varying(2) COLLATE pg_catalog."default",
    mtfcc character varying(5) COLLATE pg_catalog."default",
    funcstat character varying(1) COLLATE pg_catalog."default",
    aland double precision,
    awater double precision,
    intptlat character varying(11) COLLATE pg_catalog."default",
    intptlon character varying(12) COLLATE pg_catalog."default",
    geom geometry(MultiPolygon,4326),
    CONSTRAINT us_states_pkey PRIMARY KEY (gid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.us_states
    OWNER to postgres;
-- Index: us_states_ind

-- DROP INDEX IF EXISTS public.us_states_ind;

CREATE INDEX IF NOT EXISTS us_states_ind
    ON public.us_states USING gist
    (geom)
    TABLESPACE pg_default;
