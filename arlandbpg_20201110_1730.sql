-- SQL Manager Lite for PostgreSQL 6.1.2.53864
-- ---------------------------------------
-- Хост         : 10.24.0.64
-- База данных  : arlandbpg
-- Версия       : PostgreSQL 13.0, compiled by Visual C++ build 1914, 64-bit



SET search_path = public, pg_catalog;
DROP INDEX IF EXISTS public.paramlist_idx;
DROP TABLE IF EXISTS public.paramlist;
DROP SEQUENCE IF EXISTS public.paramlist_paramid_seq;
DROP TABLE IF EXISTS public.delegatelist;
DROP SEQUENCE IF EXISTS public.delegatelist_delegateid_seq;
DROP TABLE IF EXISTS public.clientlist;
DROP SEQUENCE IF EXISTS public.clientlist_clientid_seq;
DROP TABLE IF EXISTS public.templateparamlist;
DROP SEQUENCE IF EXISTS public.templateparamlist_templateparamid_seq;
DROP TABLE IF EXISTS public.templatelist;
DROP SEQUENCE IF EXISTS public.templatelist_templateid_seq;
DROP TABLE IF EXISTS public.documentlist;
DROP SEQUENCE IF EXISTS public.documentlist_documentid_seq;
DROP TABLE IF EXISTS public.banklist;
DROP SEQUENCE IF EXISTS public.banklist_bankid_seq;
DROP TABLE IF EXISTS public.cataloglist;
DROP TABLE IF EXISTS public.personlist;
SET check_function_bodies = false;
--
-- Structure for table personlist (OID = 16397) : 
--
CREATE TABLE public.personlist (
    personid integer NOT NULL,
    personname varchar(128),
    personpass varchar(64),
    personfio varchar(128),
    persondisable smallint DEFAULT 0 NOT NULL
)
WITH (oids = false);
--
-- Structure for table cataloglist (OID = 16403) : 
--
CREATE TABLE public.cataloglist (
    catalogid integer NOT NULL,
    catalogname varchar(32)
)
WITH (oids = false);
--
-- Definition for sequence banklist_bankid_seq (OID = 16415) : 
--
CREATE SEQUENCE public.banklist_bankid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table banklist (OID = 16417) : 
--
CREATE TABLE public.banklist (
    bankid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    bankname varchar(128),
    bankadres varchar(1024),
    catalogid integer,
    personid integer,
    createpoint timestamp without time zone
)
WITH (oids = false);
--
-- Definition for sequence documentlist_documentid_seq (OID = 16436) : 
--
CREATE SEQUENCE public.documentlist_documentid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table documentlist (OID = 16438) : 
--
CREATE TABLE public.documentlist (
    documentid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    documentname varchar(128),
    catalogid integer,
    documentlink varchar(1024),
    personid integer,
    documenttypeid integer,
    casedate date,
    casenumber varchar(128),
    agentid integer,
    clientid integer,
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence templatelist_templateid_seq (OID = 16447) : 
--
CREATE SEQUENCE public.templatelist_templateid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table templatelist (OID = 16449) : 
--
CREATE TABLE public.templatelist (
    templateid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    templatename varchar(128),
    catalogid integer,
    templatelink varchar(1024),
    personid integer,
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence templateparamlist_templateparamid_seq (OID = 16464) : 
--
CREATE SEQUENCE public.templateparamlist_templateparamid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table templateparamlist (OID = 16466) : 
--
CREATE TABLE public.templateparamlist (
    templateparamid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    templateid integer,
    templateparamname varchar(64),
    templateparamcaption varchar(64),
    templateparamtype varchar(16),
    catalogid integer,
    clientid integer,
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence clientlist_clientid_seq (OID = 16472) : 
--
CREATE SEQUENCE public.clientlist_clientid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table clientlist (OID = 16474) : 
--
CREATE TABLE public.clientlist (
    clientid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    clientname varchar(128),
    clientadres varchar(1024),
    clientogrn varchar(64),
    clientinn varchar(64),
    catalogid integer,
    personid integer,
    createpoint timestamp without time zone
)
WITH (oids = false);
--
-- Definition for sequence delegatelist_delegateid_seq (OID = 16483) : 
--
CREATE SEQUENCE public.delegatelist_delegateid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table delegatelist (OID = 16485) : 
--
CREATE TABLE public.delegatelist (
    delegateid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    delegatename varchar(128),
    delegatephone varchar(32),
    delegateorder varchar(128),
    catalogid integer,
    personid integer,
    createpoint timestamp without time zone
)
WITH (oids = false);
--
-- Definition for sequence paramlist_paramid_seq (OID = 16493) : 
--
CREATE SEQUENCE public.paramlist_paramid_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table paramlist (OID = 16495) : 
--
CREATE TABLE public.paramlist (
    paramid integer GENERATED ALWAYS AS IDENTITY NOT NULL,
    paramtable varchar(128),
    paramname varchar(128),
    paramcaption varchar(64),
    paramtype varchar(16)
)
WITH (oids = false);
--
-- Definition for index paramlist_idx (OID = 16502) : 
--
CREATE INDEX paramlist_idx ON public.paramlist USING btree (paramtable);
--
-- Definition for index personlist_pkey (OID = 16401) : 
--
ALTER TABLE ONLY personlist
    ADD CONSTRAINT personlist_pkey
    PRIMARY KEY (personid);
--
-- Definition for index cataloglist_pkey (OID = 16420) : 
--
ALTER TABLE ONLY cataloglist
    ADD CONSTRAINT cataloglist_pkey
    PRIMARY KEY (catalogid);
--
-- Definition for index banklist_pkey (OID = 16424) : 
--
ALTER TABLE ONLY banklist
    ADD CONSTRAINT banklist_pkey
    PRIMARY KEY (bankid);
--
-- Definition for index documentlist_pkey (OID = 16445) : 
--
ALTER TABLE ONLY documentlist
    ADD CONSTRAINT documentlist_pkey
    PRIMARY KEY (documentid);
--
-- Definition for index templatelist_pkey (OID = 16456) : 
--
ALTER TABLE ONLY templatelist
    ADD CONSTRAINT templatelist_pkey
    PRIMARY KEY (templateid);
--
-- Definition for index templateparamlist_pkey (OID = 16470) : 
--
ALTER TABLE ONLY templateparamlist
    ADD CONSTRAINT templateparamlist_pkey
    PRIMARY KEY (templateparamid);
--
-- Definition for index clientlist_pkey (OID = 16480) : 
--
ALTER TABLE ONLY clientlist
    ADD CONSTRAINT clientlist_pkey
    PRIMARY KEY (clientid);
--
-- Definition for index delegatelist_pkey (OID = 16488) : 
--
ALTER TABLE ONLY delegatelist
    ADD CONSTRAINT delegatelist_pkey
    PRIMARY KEY (delegateid);
--
-- Definition for index paramlist_pkey (OID = 16498) : 
--
ALTER TABLE ONLY paramlist
    ADD CONSTRAINT paramlist_pkey
    PRIMARY KEY (paramid);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
