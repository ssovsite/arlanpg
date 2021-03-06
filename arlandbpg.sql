-- SQL Manager Lite for PostgreSQL 6.1.2.53864
-- ---------------------------------------
-- Хост         : localhost
-- База данных  : arlandbpg
-- Версия       : PostgreSQL 13.0, compiled by Visual C++ build 1914, 64-bit



SET check_function_bodies = false;
--
-- Structure for table personlist (OID = 16395) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.personlist (
    personid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    personname varchar(128),
    personpass varchar(64),
    personfio varchar(128),
    persondisable smallint DEFAULT 0 NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence personlist_personid_seq (OID = 16401) : 
--
CREATE SEQUENCE public.personlist_personid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Data for table public.personlist (OID = 16395) (LIMIT 0,1)
--
INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (1, 'ЧемодановСВ', '111111', 'Чемоданов Сергей Викторович', 0);

--
-- Definition for index personlist_pkey (OID = 16399) : 
--
ALTER TABLE ONLY personlist
    ADD CONSTRAINT personlist_pkey
    PRIMARY KEY (personid);
--
-- Data for sequence public.personlist_personid_seq (OID = 16401)
--
SELECT pg_catalog.setval('personlist_personid_seq', 1, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
