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
-- Structure for table cataloglist (OID = 16403) :
--
CREATE TABLE public.cataloglist (
    catalogid integer NOT NULL,
    catalogname varchar(32)
)
WITH (oids = false);
--
-- Definition for sequence documentlist_documentid_seq (OID = 16416) :
--
CREATE SEQUENCE public.documentlist_documentid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table documentlist (OID = 16418) :
--
CREATE TABLE public.documentlist (
    documentid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    documentname varchar(128),
    catalogid integer,
    documentlink varchar(1024),
    personid integer,
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence banklist_bankid_seq (OID = 16427) :
--
CREATE SEQUENCE public.banklist_bankid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table banklist (OID = 16429) :
--
CREATE TABLE public.banklist (
    bankid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    bankname varchar(128),
    bankadres varchar(128),
    catalogid integer,
    personid integer,
    createpoint timestamp without time zone
)
WITH (oids = false);
--
-- Data for table public.personlist (OID = 16395) (LIMIT 0,2)
--
INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (1, 'ЧемодановСВ', '96e79218965eb72c92a549dd5a330112', 'Чемоданов Сергей Викторович', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (2, 'КарповаТС', '96e79218965eb72c92a549dd5a330112', 'Карпова Татьяна Сергеевна', 0);

--
-- Data for table public.cataloglist (OID = 16403) (LIMIT 0,2)
--
INSERT INTO cataloglist (catalogid, catalogname)
VALUES (1, 'ОРИП Владимир');

INSERT INTO cataloglist (catalogid, catalogname)
VALUES (2, 'ОРИП Иваново');

--
-- Data for table public.documentlist (OID = 16418) (LIMIT 0,2)
--
INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, createpoint)
VALUES (1, 'Тестовый 1', 1, NULL, NULL, '2020-10-18 19:02:01.830725');

INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, createpoint)
VALUES (2, 'Тестовый 2', 1, NULL, NULL, '2020-10-18 19:02:40.206908');

--
-- Data for table public.banklist (OID = 16429) (LIMIT 0,1)
--
INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (1, 'ПАО Сбербанк', 'г.Владимир, ул. Б.Московская д.26', 1, NULL, NULL);

--
-- Definition for index personlist_pkey (OID = 16399) :
--
ALTER TABLE ONLY personlist
    ADD CONSTRAINT personlist_pkey
    PRIMARY KEY (personid);
--
-- Definition for index cataloglist_pkey (OID = 16406) :
--
ALTER TABLE ONLY cataloglist
    ADD CONSTRAINT cataloglist_pkey
    PRIMARY KEY (catalogid);
--
-- Definition for index documentlist_pkey (OID = 16424) :
--
ALTER TABLE ONLY documentlist
    ADD CONSTRAINT documentlist_pkey
    PRIMARY KEY (documentid);
--
-- Definition for index banklist_pkey (OID = 16432) :
--
ALTER TABLE ONLY banklist
    ADD CONSTRAINT banklist_pkey
    PRIMARY KEY (bankid);
--
-- Data for sequence public.personlist_personid_seq (OID = 16401)
--
SELECT pg_catalog.setval('personlist_personid_seq', 2, true);
--
-- Data for sequence public.documentlist_documentid_seq (OID = 16416)
--
SELECT pg_catalog.setval('documentlist_documentid_seq', 2, true);
--
-- Data for sequence public.banklist_bankid_seq (OID = 16427)
--
SELECT pg_catalog.setval('banklist_bankid_seq', 1, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
