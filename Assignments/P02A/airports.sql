-- Table: public.airports

-- DROP TABLE IF EXISTS public.airports;

CREATE TABLE IF NOT EXISTS public.airports
(
    id smallint,
    name character varying(100) COLLATE pg_catalog."default",
    city character varying(35) COLLATE pg_catalog."default",
    country character varying(35) COLLATE pg_catalog."default",
    "3-code" character varying(3) COLLATE pg_catalog."default",
    "4-code" character varying(4) COLLATE pg_catalog."default",
    lat numeric(12,9),
    lon numeric(12,9),
    elevation smallint,
    gmt character varying(5) COLLATE pg_catalog."default",
    tz_short character varying(3) COLLATE pg_catalog."default",
    timezone character varying(30) COLLATE pg_catalog."default",
    type character varying(7) COLLATE pg_catalog."default",
    airport_type character varying(15) COLLATE pg_catalog."default",
    geom geometry
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.airports
    OWNER to postgres;
-- Index: ind_geom

-- DROP INDEX IF EXISTS public.ind_geom;

CREATE INDEX IF NOT EXISTS ind_geom
    ON public.airports USING gist
    (geom)
    TABLESPACE pg_default;
