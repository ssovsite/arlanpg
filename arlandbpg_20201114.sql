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
    casedate varchar(32),
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
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    criticallparam integer DEFAULT 0 NOT NULL
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
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP
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
    createpoint timestamp without time zone DEFAULT LOCALTIMESTAMP
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
-- Data for table public.personlist (OID = 16397) (LIMIT 0,7)
--
INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (3, 'КарповаТС', '96e79218965eb72c92a549dd5a330112', 'Карпова Татьяна Сергеевна', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (4, 'ЧемодановСВ', '96e79218965eb72c92a549dd5a330112', 'Чемоданов Сергей Викторович', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (5, 'ХицковаАА', '8a26bf64674ae23404c78e4fb787f7b5', 'Хицкова Анна Алексеевна', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (6, 'АндриановаАА', 'd89a7a4333097bcc0bbbc68cc6b81c00', 'Андрианова Анна Алексеевна', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (7, 'СоколоваАЮ', 'c0e97702401fb85a244913ca8bacc4a3', 'Соколова Алла Юрьевна', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (8, 'КочетковаНВ', '9c84e72247a720da0e4207b4c7fbdfd2', 'Кочеткова Наталья Владимировна', 0);

INSERT INTO personlist (personid, personname, personpass, personfio, persondisable)
VALUES (9, 'ЛаврентьевАН', '96e79218965eb72c92a549dd5a330112', 'Лаврентьев Александр Николаевич', 0);

--
-- Data for table public.cataloglist (OID = 16403) (LIMIT 0,3)
--
INSERT INTO cataloglist (catalogid, catalogname)
VALUES (1, 'ОРИП Владимир');

INSERT INTO cataloglist (catalogid, catalogname)
VALUES (2, 'ОРИП Иваново');

INSERT INTO cataloglist (catalogid, catalogname)
VALUES (3, 'ОСЗ Владимир / электро');

--
-- Data for table public.banklist (OID = 16417) (LIMIT 0,40)
--
INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (4, 'АО "Владбизнесбанк"', '600015, г. Владимир, пр-т Ленина, д. 35', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (5, 'ПАО Банк ВТБ', '600000, г. Владимир, Октябрьский пр-т, д. 47', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (6, 'ПАО Банк "ФК Открытие"', '600017, г. Владимир, ул. Мира, д. 34', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (7, 'АО «АБ «РОССИЯ»', '600000, г. Владимир, Студёная Гора, 14', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (8, 'Банк ГПБ (АО)', '600031, г. Владимир, ул. Большая Нижегородская, д. 111', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (9, 'ПАО «МИнБанк»', '600015, г. Владимир, пр-т Ленина, д. 35', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (10, 'ПАО МОСОБЛБАНК', '600001, г. Владимир, ул. Дворянская, д. 10а', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (11, 'ПАО «Промсвязьбанк»', '60000, г. Владимир, Октябрьский пр-т, д. 25', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (12, 'АО «Россельхозбанк', '600000, Владимирская область, г. Владимир, ул. Большая Московская, д. 1-б', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (13, 'ПАО «Совкомбанк»', '600015, г. Владимир, пр-т Ленина, д. 40', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (14, 'Банк «Развитие-Столица»', '105064, г. Москва, Нижний Сусальный пер., д. 5, стр. 15', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (15, 'УПФ РФ в г. Владимире Владимирской области', '600007, г. Владимир, ул. Мира, д. 61', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (16, 'ГУ ФССП по г. Москве', '125047, г. Москва, Бутырский вал, д. 5', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (17, 'ОСП Камешковского района УФССП по Владимирской области', '601300, г. Камешково, ул. Школьная, д. 4', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (18, 'ОСП Киржачского района ГУ ФССП по Владимирской области', '601012, г. Киржач, ул. Дзержинского, д. 4', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (19, 'ОСП Ковровского района УФССП по Владимирской области', '601900, г. Ковров, ул. Свердлова, д. 94', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (20, 'ОСП Кольчугинского района УФССП по Владимирской области', '601780, г. Кольчугино, ул. Коллективная, д. 48', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (3, 'ПАО "Сбербанк"', '600015, г. Владимир, пр-т Ленина, д. 36', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (21, 'ОСП Ленинского района г. Владимира УФССП по Владимирской области', '600017, г. Владимир, ул. Горького, д. 2А', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (22, 'МОСП по ИОИП УФССП по Владимирской области', '600017, г. Владимир, ул. Горького, д. 2А', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (23, 'ОСП Октябрьского района г. Владимира УФССП по Владимирской области', '600017, г. Владимир, ул. Горького, д. 2А', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (25, 'ОСП Собинского района УФССП России по Владимирской области', '601204, г. Собинка, ул. Димитрова, д. 26', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (24, 'ОСП Судогодского района УФССП России по Владимирской области', '601351, г. Судогда, ул. Чапаева, д. 1А', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (26, 'ОСП Суздальского района УФССП по Владимирской области', '601293, г. Суздаль, пл. Красная, д. 8', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (27, 'ОСП Фрунзенского района г. Владимира УФССП России по Владимирской области', '600017, г. Владимир, ул. Горького, д. 2А', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (28, 'ОСП Гусь-Хрустального района УФССП России по Владимирской области', '601508, г. Гусь-Хрустальный, пр-т 50-летия Советской Власти, д. 8', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (29, 'ОСП Юрьев-Польского района УФССП по Владимирской области', '601800, г. Юрьев-Польский, пер. Садовый, д. 11', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (30, 'Ивановское отделение № 8639 ПАО Сбербанк', '153009, г. Иваново, ул. Лежневская, д. 159', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (31, 'Банк ВТБ (ПАО)', '153000, г. Иваново, Шереметьевский просп., д. 49', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (32, 'ИРФ АО "Россельхозбанк"', '153002, г. Иваново, пр. Ленина, д. 21, строение 1', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (33, 'АО КИБ "ЕВРОАЛЬЯНС"', '153000, г. Иваново, ул. Станко, д. 13', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (34, 'ПАО "МИнБанк"', '153013, г. Иваново, ул. Куконковых, д. 96', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (35, 'Банк ГПБ (АО)', '153000, г. Иваново, ул. Варенцовой, д. 11', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (36, 'Банк ДОМ.РФ', '125009, г. Москва, ул. Воздвиженка, д. 10', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (37, 'Московский Филиал АО КБ «Модульбанк»', '127015, г. Москва, ул. Новодмитровская, д. 2, корп. 1', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (38, 'АО АКБ "Новикомбанк"', '119180, г. Москва, ул. Большая Полянка, д. 50/1, стр. 1', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (39, 'ПАО Банк «ФК Открытие»', '153012, г. Иваново, ул. 10 Августа, д. 33а', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (40, 'ПАО "Промсвязьбанк"', '109052, г. Москва, ул. Смирновская, д. 10, стр. 22', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (41, 'АКБ «Инвестиционный торговый банк» (ПАО)', '115054, г. Москва, ул. Дубининская, д. 45', 1, NULL, NULL);

INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (42, 'ПАО АКБ «АВАНГАРД»', '153003, г. Иваново, ул. Парижской Коммуны, д. 16', 1, NULL, NULL);

--
-- Data for table public.documentlist (OID = 16438) (LIMIT 0,2)
--
INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, documenttypeid, casedate, casenumber, agentid, clientid, createpoint)
VALUES (6, '{17C51B65-3CE9-4BB6-821D-E6CD81E3C013}.docx', 1, '\\\\vla-ad02-fs01\\Work\\УПРДЗ\\Автоматизация\\Базафайлов\\{17C51B65-3CE9-4BB6-821D-E6CD81E3C013}.docx', 3, 4, '13.11.2020', '', 26, 148, '2020-11-13 15:22:26.329715');

INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, documenttypeid, casedate, casenumber, agentid, clientid, createpoint)
VALUES (7, '{19FF6708-2DAD-4D09-BADF-A1296D54B00F}.docx', 1, '\\\\vla-ad02-fs01\\Work\\УПРДЗ\\Автоматизация\\Базафайлов\\{19FF6708-2DAD-4D09-BADF-A1296D54B00F}.docx', 3, 4, '13.11.2020', '', 26, 148, '2020-11-13 15:53:29.567258');

--
-- Data for table public.templatelist (OID = 16449) (LIMIT 0,1)
--
INSERT INTO templatelist (templateid, templatename, catalogid, templatelink, personid, createpoint)
VALUES (4, 'Заявление в кред. орг. от АО ВКС', 1, '\\\\vla-ad02-fs01\\Work\\УПРДЗ\\Автоматизация\\Базашаблонов\\oripvladzakovks.docx', 4, '2020-10-20 15:53:47.292947');

--
-- Data for table public.templateparamlist (OID = 16466) (LIMIT 0,19)
--
INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (2, 4, 'doc_to_adres', 'кому адрес', 'memo', 1, NULL, '2020-11-12 11:31:18.426', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (6, 4, 'doc_dolgnik_adres', 'клиент адрес', 'memo', 1, NULL, '2020-11-12 11:35:30.6', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (7, 4, 'doc_dolgnik_ogrn', 'клиент ОГРН', 'edit', 1, NULL, '2020-11-12 11:39:12.218', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (8, 4, 'doc_dolgnik_inn', 'клиент ИНН', 'edit', 1, NULL, '2020-11-12 11:39:31.69', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (9, 4, 'doc_number_date', 'дело дата', 'edit', 1, NULL, '2020-11-12 11:40:58.49', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (4, 4, 'doc_number', 'дело номер', 'edit', 1, NULL, '2020-11-12 11:32:38.3', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (10, 4, 'doc_number_ispol', 'испол. лист номер', 'edit', 1, NULL, '2020-11-12 11:43:14.718', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (11, 4, 'doc_data_ispol', 'испол. лист дата', 'edit', 1, NULL, '2020-11-12 11:43:55.591', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (13, 4, 'doc_pen_zadolgnost', 'документ пени за неоплату', 'edit', 1, NULL, '2020-11-12 11:45:35.025', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (14, 4, 'doc_pen_osndolg', 'документ пени долга', 'edit', 1, NULL, '2020-11-12 11:47:04.284', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (12, 4, 'doc_zadolgnost', 'документ долг', 'edit', 1, NULL, '2020-11-12 11:44:48.472', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (15, 4, 'doc_data_dolga', 'документ долг дата', 'edit', 1, NULL, '2020-11-12 11:49:43.789', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (16, 4, 'doc_gosposhlina', 'документ госпошлина', 'edit', 1, NULL, '2020-11-12 11:50:26.349', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (18, 4, 'doc_doverennost', 'представитель доверенность', 'edit', 1, NULL, '2020-11-12 11:52:03.685', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (19, 4, 'doc_phone', 'представитель телефон', 'edit', 1, NULL, '2020-11-12 11:52:55.997', 0);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (1, 4, 'doc_to', 'кому наименование', 'edit', 1, NULL, '2020-11-12 11:30:29.79', 1);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (3, 4, 'doc_date', 'документ дата', 'edit', 1, NULL, '2020-11-12 11:32:09.705', 1);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (5, 4, 'doc_dolgnik', 'клиент наименование', 'edit', 1, NULL, '2020-11-12 11:34:39.406', 1);

INSERT INTO templateparamlist (templateparamid, templateid, templateparamname, templateparamcaption, templateparamtype, catalogid, clientid, createpoint, criticallparam)
VALUES (17, 4, 'doc_predstavitel', 'представитель ФИО', 'edit', 1, NULL, '2020-11-12 11:51:28.099', 1);

--
-- Data for table public.clientlist (OID = 16474) (LIMIT 0,500)
--
INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (3, 'ООО "Владимиртеплогаз"', 'г. Владимир, ул. Мира, д. 15В, этаж 2, каб. 201', '1023302553064', '33100003494', 1, 3, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (4, 'МУПП ЖКХ ГО Кохма "Кохмабытсервис"', '153510, г. Кохма, ул. Рабочая, д. 13', '1023701512306', '3711004061', 1, 3, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (5, 'АО "Ивгортеплоэнерго"', '153021, Ивановская область, г. иваноов, ул. Рабфаковская, д. 2/1', '', '3702733438', 1, 3, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (6, 'ООО "Палехские ВКС"', '155620, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ПАЛЕХСКИЙ, ПОСЕЛОК ПАЛЕХ, УЛИЦА ДЕМЬЯНА БЕДНОГО, 10', '1063706012556', '3717005583', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (8, 'МУП РАЙОНА "СИРИУС"', '155840, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО РЕШМА, УЛИЦА ЛЕНИНА, 3', '1023701591352', '3713000954', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (9, 'ООО "ЖИЛЭКС"', '155710 ИВАНОВСКАЯ ОБЛАСТЬ РАЙОН САВИНСКИЙ ПОСЕЛОК САВИНОУЛИЦА ПЕРВОМАЙСКАЯ 12', '1143711001488', '3711036867', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (10, 'ООО "ЭНЕРГОСЕРВИСНАЯ КОМПАНИЯ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КУЗНЕЧНАЯ, д. 38, оф. 72', '1073702043799', '3702542673', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (11, 'ЗАО "ИВТБС"', '153015, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, д. 47-И', '1023700542513', '3731023506', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (12, 'МУПП "КОХМАБЫТСЕРВИС"', '153510, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА РАБОЧАЯ, ДОМ 13', '1023701512306', '3711004061', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (13, 'ООО "Алекс"', '55830, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КИНЕШЕМСКИЙ, ГОРОД НАВОЛОКИ, УЛИЦА ПРИГОРОДНАЯ, д. 2,', '1023701592265', '3713005744', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (14, 'МУП ГАВРИЛОВО-ПОСАДСКОГО', '155000 ИВАНОВСКАЯ ОБЛАСТЬ РАЙОН ГАВРИЛОВО-ПОСАДСКИЙ ГОРОД ГАВРИЛОВ ПОСАД УЛИЦА ПИОНЕРСКАЯ ДОМ 12', '1143704000043', '3704007488', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (15, 'ООО "Водоканал-Сервис"', '155815, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД КИНЕШМА, УЛИЦА БОРОВАЯ, ДОМ 2', '1183702011470', '3703021634', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (16, 'ООО "БИТ СТАНДАРТ"', '153043, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ГНЕДИНА, ДОМ 18А, ПОМЕЩЕНИЕ 15', '1123702026194', '3702680793', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (17, 'МУП "ЗАВОЛЖСКИЙ КОММУНАЛЬЩИК"', '155412, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ЗАВОЛЖСКИЙ, ГОРОД ЗАВОЛЖСК, УЛИЦА ПУШКИНА, ДОМ 1', '1123703000046', '3703045794', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (18, 'АО "РСО"', '155000, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ГАВРИЛОВО-ПОСАДСКИЙ, ГОРОД ГАВРИЛОВ ПОСАД, УЛИЦА ЛИЗЫ БОЛОТИНОЙ, д. 28', '1093704000015', '3704562555', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (19, 'ООО "КОНТУР-ЭЛЕКТРИЧЕСКИЕ СЕТИ"', '153510, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, МИКРОРАЙОН ПРОСТОРНЫЙ, ДОМ 3', '1163702061820', '3711043335', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (20, 'ООО "Жилкомсервис"', '155821, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО ПЕРВОМАЙСКИЙ, УЛИЦА САДОВАЯ, Д. 28', '1093703000874', '3703043003', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (21, 'ООО "ТеплокоммунСервис"', '155838, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, ДЕРЕВНЯ ЛУГОВОЕ, УЛИЦА МОЛОДЕЖНАЯ, ДОМ 5', '1093703001204', '3703043268', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (22, 'ОАО "Домоуправление"', '155450, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЮРЬЕВЕЦКИЙ, ГОРОД ЮРЬЕВЕЦ, УЛИЦА ЧКАЛОВА, ДОМ 2', '1083720000594', '3720004276', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (23, 'ООО "СТОК"', '155313 ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ВИЧУГСКИЙ, ПОСЕЛОК НОВО-ПИСЦОВО, УЛИЦА КООПЕРАТИВНАЯ, Д. 5, ОФ. 3', '1133701001081', '3701048581', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (24, 'ОАО "КОМСЕРВИС"', '155120, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЛЕЖНЕВСКИЙ, ПОСЕЛОК ЛЕЖНЕВО, УЛИЦА ОКТЯБРЬСКАЯ, Д. 24', '1083711000900,', '3711022670', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (26, 'ОАО "Вичугская городская электросеть"', '155334, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ВИЧУГСКИЙ, ГОРОД ВИЧУГА, УЛИЦА ЛЕНИНГРАДСКАЯ, 26', '1043700000596', '3701006119', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (27, 'ООО "Промэнергосеть - Кохма"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ИВАНОВСКАЯ, ДОМ 18, ЛИТЕР А, ПОМЕЩЕНИЕ 63', '1163702068606', '3711043800', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (28, 'ООО "Техносеть"', '153032, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, ДОМ 1, ЛИТЕР А5, ПОМЕЩЕНИЕ 40', '1173702008435', '3702176071', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (30, 'МУП Г. КИНЕШМЫ "ОК И ТС"', '155801, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА ЮРЬЕВЕЦКАЯ, Д. 50', '1023701273639', '3703002014', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (31, 'ОБУЗ "ТЕЙКОВСКАЯ ЦРБ"', '155040, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ТЕЙКОВСКИЙ, ГОРОД ТЕЙКОВО, УЛИЦА КРАСНАЯ 1-Я, Д. 9', '1023701327506', '3704000387', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (32, 'МУП ЖКХ "ТЕПЛОВИК"', '155270, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЛУХСКИЙ, ПОСЕЛОК ЛУХ, УЛИЦА ОКТЯБРЬСКАЯ, ДОМ 4', '1193702015650', '3706027377', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (33, 'ФГБОУ ВО "Ивановский государственный политехнический университет"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ШЕРЕМЕТЕВСКИЙ, ДОМ 21', '1133702011222', '3702698511', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (34, 'МУП ЖКХ ТЕЙКОВСКОГО МУНИЦИПАЛЬНОГО РАЙОНА', '155035, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ТЕЙКОВСКИЙ, СЕЛО МОРОЗОВО, УЛИЦА ШКОЛЬНАЯ, ДОМ 16А', '1063704002361', '3724004950', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (29, 'ООО "МПО ЖКХ Ивановской области"', '153035, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, Улица ПОЛЕВАЯ 1-Я, 35 ДОМ, 82 КВАРТИРА', '1143702015346', '3702732924', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (35, 'ООО "МЖК"', '153023, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА РЕВОЛЮЦИОННАЯ, Д. 22', '1103702009036', '3702615184', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (36, 'ФГБУ "ЦЖКУ" МИНОБОРОНЫ РОССИИ', '105005, ГОРОД МОСКВА, УЛИЦА СПАРТАКОВСКАЯ, ДОМ 2Б', '1027700430889', '7729314745', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (37, 'ООО "МИП "Кинешма"', '155815, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД КИНЕШМА, УЛИЦА 2-Я ШУЙСКАЯ, ДОМ 1', '1173702005289', '3703020510', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (38, 'ООО "ШуяПромЭнерго"', '155902, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ШУЙСКИЙ, ГОРОД ШУЯ, УЛИЦА НАГОРНАЯ 1-Я, Д. 16', '1123706001066', '3706019062', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (39, 'МУП ЖКХ "ТЕПЛОЭНЕРГЕТИК"', '155700, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН САВИНСКИЙ, СЕЛО АРХИПОВКА, УЛИЦА СОВЕТСКАЯ, ДОМ 5, ПОМЕЩЕНИЕ 8,9', '1153711001619', '3711038543', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (40, 'ООО "Ивановский станкостроительный завод"', '153032, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, Д. 1', '1143702021726', '3702738570', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (41, 'МУП "КС" Вичугского муниципального района Ивановской области', '155313, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ВИЧУГСКИЙ, ПОСЕЛОК НОВО-ПИСЦОВО, УЛИЦА КООПЕРАТИВНАЯ, Д. 1', '1143701000101', '3701048768', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (42, 'ООО УК "КОМФОРТ- СЕРВИС"', '155040, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ТЕЙКОВСКИЙ, ГОРОД ТЕЙКОВО, УЛИЦА ФРУНЗЕНСКАЯ, ДОМ 40', '1113704000915', '3704006100', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (43, 'ФКУ ИК-5 УФСИН РОССИИ ПО ИВАНОВСКОЙ ОБЛАСТИ', '153512, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА КОЧЕТОВОЙ, Д. 59А', '1023701507862', '3711010890', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (44, 'МЕЖРЕГИОНАЛЬНОЕ УПРАВЛЕНИЕ РОСПРИРОДНАДЗОРА ПО ИВАНОВСКОЙ И ВЛАДИМИРСКОЙ ОБЛАСТЯМ', '153025, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ДЗЕРЖИНСКОГО, ДОМ 8', '1043303407322', '3329032932', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (45, 'ООО УК "ДОМОВОЙ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТЕПАНОВА, ДОМ 15, ПОМЕЩЕНИЕ 14', '1163702063810', '3702152320', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (46, 'ООО "Теплотехническая компания"', '155908, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, ДЕРЕВНЯ ОСТАПОВО, УЛИЦА ЗЕЛЕНАЯ, Д. 72', '1083706001345', '3725007841', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (48, 'СНТ "МИР"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ТЕРРИТОРИЯ СНТ МИР', '1023701513846', '3711009888', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (49, 'МУП "КОМСЕРВИС" ПОС. СТАРАЯ ВИЧУГА', '155310, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ВИЧУГСКИЙ, ПОСЕЛОК СТАРАЯ ВИЧУГА, УЛИЦА КЛУБНАЯ, ДОМ 1', '1163702076383', '3701049881', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (50, 'МУП "ЖКХ ШУЙСКОГО МУНИЦИПАЛЬНОГО РАЙОНА"', '155900, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, ГОРОД ШУЯ, ПЛОЩАДЬ ЛЕНИНА, ДОМ 7', '1123706000318', '3706019048', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (51, 'ООО УК "ГАРМОНИЯ"', '153035, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ЛЕТЧИКА ЛАЗАРЕВА, ДОМ 6, КВАРТИРА 78', '1173702003771', '3702172447', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (52, 'ООО "Ивановская тепловая электростанция"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ИВАНОВСКАЯ, ДОМ 18, ЛИТЕР А, ПОМЕЩЕНИЕ 64', '1053701071270', '3702070999', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (53, 'ТСЖ "Мечта"', '155523, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ФУРМАНОВСКИЙ, ГОРОД ФУРМАНОВ, УЛИЦА ДЕМЬЯНА БЕДНОГО, Д. 69А, ОФ. 4', '1093705000597', '3705063904', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (54, 'ООО "Ивановская Производственная Компания""', '155502, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ФУРМАНОВСКИЙ, ДЕРЕВНЯ ОЛЮКОВО, ДОМ 1', '1163702069486', '3705009640', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (55, 'ООО "СИТИ"', '153510, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ОКТЯБРЬСКАЯ, ДОМ 20А, ПОМЕЩЕНИЕ 1001Б', '1143711000091', '3702720767', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (56, 'ОАО "ДСК"', '153051, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ШОССЕ КОХОМСКОЕ, Д. 1', '1033700050581', '3728000058', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (57, 'ТСЖ "Чернореченский"', '153538, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, Д. 1', '1093711000316', '3711024621', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (58, 'ТСЖ "Загородное"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ КОЛЯНОВО, УЛИЦА ЗАГОРОДНАЯ, ДОМ 9, КВАРТИРА 2', '1083711001692', '3711023434', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (59, 'ТСЖ "Академическая-35"', '153045, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА АКАДЕМИЧЕСКАЯ, Д. 35', '1133702013081', '3702699995', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (60, 'ООО "ТЕПЛОСЕРВИС"', '153013, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КАВАЛЕРИЙСКАЯ, ДОМ 3, КВАРТИРА 25', '1163702067748', '3702155762', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (61, 'МУП ЖКХ Фурмановского муниципального района', '155520, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ФУРМАНОВСКИЙ, ГОРОД ФУРМАНОВ, УЛИЦА КОЛОСОВА, ДОМ 25', '1073705000929', '3705062837', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (62, 'ООО "Межмуниципальное коммунальное предприятие"', '155412, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЗАВОЛЖСКИЙ, ГОРОД ЗАВОЛЖСК, УЛИЦА ПУШКИНА, ДОМ 1', '1103703000807', '3703044328', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (25, 'АО "САВИНСКИЙ ТЕПЛОСЕРВИС"', '155710, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН САВИНСКИЙ, ПОСЕЛОК САВИНО, УЛИЦА СОВЕТСКАЯ, Д. 24', '1083711002429', '3711024195', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (63, 'ООО "ИвСпецГарант"', '153037, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ШЕРЕМЕТЕВСКИЙ,  Д. 153А', '1073702021007', '3702522719', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (64, 'АО "ИЗТС"', '153009, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, ДОМ 1', '1163702051050', '3702128455', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (65, 'АО "Стройиндустрия-Холдинг"', '53015, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, Д. 45 И', '1023701513110', '3731001076', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (66, 'АО "Савинский Водоканал"', '155710, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН САВИНСКИЙ, ПОСЕЛОК САВИНО, УЛИЦА СОВЕТСКАЯ, Д. 24', '1083711002430', '3711024205', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (67, 'ООО "Техгарант"', '153023, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА РЕВОЛЮЦИОННАЯ, Д. 16А, КОРПУС 1', '1023700531282', '3702027263', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (68, 'ООО "УК "КРЕПОСТЬ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ЖАРОВА, ДОМ 10, ОФИС 309', '1163702068661', '3702156445', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (69, 'ООО "ЖУК-Профессионал"', '53040, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, ДОМ 54А, ПОМЕЩЕНИЕ 2', '1153702022198', '3702120600', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (70, 'МП "ЖКХ', '155150, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КОМСОМОЛЬСКИЙ, ГОРОД КОМСОМОЛЬСК, УЛИЦА СОВЕТСКАЯ, ДОМ 7, ПОМЕЩЕНИЕ 1002', '1193702018553', '3704010748', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (71, 'ООО "ИСток"', '153520, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, С/П НОВОТАЛИЦКОЕ ТЕР МЕТАЛЛУРГИЧЕСКАЯ, СТРОЕНИЕ 3', '1183702013527', '3711047516', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (72, 'ООО "АНТАРЕС"', '155927, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ШУЙСКИЙ, СЕЛО КИТОВО, УЛИЦА СЕВЕРНАЯ, ДОМ 6', '1163702068892', '3706023929', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (73, 'ООО "АРИСТОКРАТ"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, ДОМ 52, ОФИС 1', '1133702020242', '3702706025', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (74, 'ООО "ДЕМИДОВЪ"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, Д. 52', '1083702021479', '3702566032', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (75, 'МП "Водоканал" Лежневского муниципального района Ивановской области', '155120, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ЛЕЖНЕВСКИЙ, ПОСЕЛОК ЛЕЖНЕВО, УЛИЦА ОКТЯБРЬСКАЯ, Д. 32', '1133711000807', '3711032742', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (76, 'ТСЖ "Новый дом"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ КОЛЯНОВО, УЛИЦА ЗАГОРОДНАЯ, Д. 17А', '1143711000773', '3711036144', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (77, 'ООО "ЗБК-ИНВЕСТ"', '55802, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА ЛЕСОЗАВОДСКАЯ, Д. 10', '1093703001149', '3703043204', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (78, 'ОАО "Строммашина"', '153512, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА КОЧЕТОВОЙ, Д. 2', '1023701508137', '3711003090', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (79, 'ООО "Мануфактура Балина"', '152020, ОБЛАСТЬ ЯРОСЛАВСКАЯ, ГОРОД ПЕРЕСЛАВЛЬ-ЗАЛЕССКИЙ, УЛИЦА КУЗНЕЦОВА, Д. 1, ОФИС 22', '1063706012325', '3726004850', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (80, 'ООО "Тепловик"', '153006, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОЕЗД 11-Й, ДОМ 2, ЛИТЕР Ю', '1153702015752', '3702114043', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (81, 'ООО "Центр Авиа"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ТЕРРИТОРИЯ ЛЕЖНЕВСКОЕ ШОССЕ, Д. 3', '1127746293730', '7703766546', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (82, 'ООО "ЭКОСТОК"', '153038, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА МАРШАЛА ВАСИЛЕВСКОГО, ДОМ 2, КВАРТИРА 21', '1183702001230', '3702192355', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (83, 'МТУ РОСИМУЩЕСТВА ВО ВЛАДИМИРСКОЙ, ИВАНОВСКОЙ, КОСТРОМСКОЙ И ЯРОСЛАВСКОЙ ОБЛАСТЯХ', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ МОСКОВСКАЯ, ДОМ 29', '1133340004401', '3329056771', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (84, 'ДЕПАРТАМЕНТ ДОРОЖНОГО ХОЗЯЙСТВА И ТРАНСПОРТА ИВАНОВСКОЙ ОБЛАСТИ', '153013, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КУКОНКОВЫХ, Д. 139', '1023700561829', '3728012825', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (85, 'ООО "Перспектива"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ОКТЯБРЬСКАЯ, ДОМ 20А, ПОМЕЩЕНИЕ 1007', '1163702066527', '3702154737', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (86, 'КФХ "Аван"', '153535, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ БАБЕНКИ', '1063711016115', '3711003773', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (87, 'ООО "АКВА-БАЛАНС"', '155927, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ШУЙСКИЙ, СЕЛО КИТОВО, УЛИЦА СЕВЕРНАЯ, ДОМ 6', '1183702017355', '3706026221', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (88, 'ООО ДОЗ "ДМИТРИЙ"', '153032, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, Д. 5', '1033700083340', '3731025969', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (89, 'ООО "В.Р.Е."', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПОЧТОВАЯ, ДОМ 3А, ОФИС 108', '1033700087167', '3702024625', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (90, 'ООО "Большая Ивановская Мануфактура"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, Д. 21', '1073702034174', '3702533301', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (91, 'МУП ЖКХ П.КОЛОБОВО', '155933, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ШУЙСКИЙ, ПОСЕЛОК КОЛОБОВО, УЛИЦА ФАБРИЧНАЯ 1-Я, Д. 35', '1023701393781', '3725003124', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (92, 'ОАО ПТМ Г.ИВАНОВО', '153011, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, Д. 141', '1023700534450', '3702441940', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (93, 'ООО "Спорт - Текс"', '155921, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ШУЙСКИЙ, СЕЛО ЧЕРНЦЫ, УЛИЦА ФАБРИЧНЫЙ ДВОР, Д. 24', '1033700110091', '3702044519', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (94, 'АО "КПТФ"', '155814, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД КИНЕШМА, УЛИЦА СОЦИАЛИСТИЧЕСКАЯ, ДОМ 24', '1023701272121', '3703011227', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (95, 'ООО "Славянский Дом"', '153022, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ВЕЛИЖСКАЯ, Д. 8', '1033700062990', '3728026289', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (96, 'ООО "АЛЬФА"', '121374, ГОРОД МОСКВА, ШОССЕ МОЖАЙСКОЕ, ДОМ 4, КОРПУС 1, ПОМ. VI КОМ. 70', '1187746346886', '7722445731', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (97, 'ООО "ЭЛЕКТРО-СЕРВИС"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ЛЕЖНЕВСКАЯ, ДОМ 183, ЛИТЕР А28', '1083702012470', '3702556570', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (98, 'ООО " КФХ Воронковское+"', '153045, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СВОБОДЫ, ДОМ 50, ПОМЕЩЕНИЕ 1', '1093702018442', '3702592836', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (99, 'ТСЖ "Надежда +"', '153012, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ЛАКИНА, Д. 1', '1033700095263', '3702039999', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (100, 'ООО "ПЕТРОЛЕУМ ПЛЮС 33"', '109369, МОСКВА ГОРОД, УЛИЦА ПЕРЕРВА, ДОМ 52, СТРОЕНИЕ 1, ЭТАЖ 2 ОФИС 209', '1167746176861', '7723432171', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (101, 'ФГУП "ВАСИЛЬЕВСКОЕ"', '155926, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, СЕЛО ВАСИЛЬЕВСКОЕ, УЛИЦА СОВЕТСКАЯ, Д. 2', '1023701392120', '3725000148', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (102, 'ЗАО "РМЗ"', '155250, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН РОДНИКОВСКИЙ, ГОРОД РОДНИКИ, УЛИЦА КОЛХОЗНАЯ, Д. 2', '1053700010022', '3721006639', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (103, 'ПК по газификации "Бухарово-96"', '153009, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ БУХАРОВО, УЛИЦА НИКОЛЬСКАЯ, Д. 19', '1033700583234', '3711014750', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (104, 'ТСЖ "Загородное - 1"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ КОЛЯНОВО, УЛИЦА ЗАГОРОДНАЯ, Д. 15', '1093711000272', '3711024519', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (105, 'ГЛАВНОЕ УПРАВЛЕНИЕ МЧС РОССИИ ПО ИВАНОВСКОЙ ОБЛАСТИ', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ДИАНОВЫХ, Д. 8А', '1043700102775', '3702062557', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (106, 'СНТ "Аэропорт"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ ЖУКОВО', '1023701509215', '3711009969', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (107, 'ООО "КАМИНСКИЙ ТЕКСТИЛЬ"', '155240, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН РОДНИКОВСКИЙ, СЕЛО КАМИНСКИЙ, УЛИЦА КАМИНСКОГО, Д. 1', '1043700742249', '3721006371', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (108, 'ООО "СК Европейский стиль"', '153029, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПЕРЕУЛОК 2-Й МИНСКИЙ, ДОМ 8, ОФИС 3', '1173702010899', '3702177967', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (109, 'ООО "УК "ЖилСтройСервис"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КОМСОМОЛЬСКАЯ, 17, ПОМ 1003', '1083702025197', '3702569724', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (110, 'ООО "СпецПак"', '153029, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПОПОВА, ДОМ 3, ЛИТЕР А', '1143702021198', '3702738080', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (111, 'МУП "СЕРВИС-ЦЕНТР Г.ПРИВОЛЖСКА"', '155550, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ПРИВОЛЖСКИЙ, ГОРОД ПРИВОЛЖСК, УЛИЦА РЕВОЛЮЦИОННАЯ, Д. 20', '1083705000125', '3719009720', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (112, 'ООО "Новый Город"', '153015, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, МИКРОРАЙОН НОВАЯ ИЛЬИНКА, ДОМ 13, ОФИС 1001', '1083702015638', '3702559758', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (113, 'ТСЖ "Южный"', '153013, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КУКОНКОВЫХ, Д. 86', '1063702090011', '3702088330', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (114, 'ООО "УК "БАСК 1"', '153051, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, МИКРОРАЙОН ДСК, Д. 3, ОФ. 316', '1093702014702', '3702589304', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (115, 'ООО "РСУ-ПРОГРЕСС"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КАЛИНИНА, 10, ПОМЕЩЕНИЕ 1006', '1123702022630', '3702677896', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (116, 'ООО "КОММУНАЛЬЩИК РЕСУРС"', '153535, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ ВОСТРА, ДОМ 6А', '1153711002741', '3711039650', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (117, 'ООО "НТС"', '153520, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ТЕРРИТОРИЯ МЕТАЛЛУРГИЧЕСКАЯ, НОВОТАЛИЦКОЕ С/П ЗДАНИЕ № 1', '1183702014165', '3702202980', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (118, 'ООО "УК "ЮТ"', '153043, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ГНЕДИНА, ДОМ 18А, ПОМЕЩЕНИЕ 16', '1103702008937', '3702615089', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (119, 'АО "Центральная управляющая компания"', '153022, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА БОГДАНА ХМЕЛЬНИЦКОГО, ДОМ 83, ЛИТЕР А1, ЭТАЖ 2 КАБИНЕТ 14,15,16', '1103702023578', '3702629853', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (120, 'ООО "УОЖХ-ЭТАЛОН"', '153040, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, ДОМ 54А, ПОМЕЩЕНИЕ 3', '1153702020812', '3702119203', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (121, 'МУП "Приволжское ТЭП"', '155550, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ПРИВОЛЖСКИЙ, ГОРОД ПРИВОЛЖСК, УЛИЦА МОСКОВСКАЯ Б., Д. 3', '1073705000192', '3719009495', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (122, 'ООО "Объединенные котельные"', '155630, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЮЖСКИЙ, ГОРОД ЮЖА, УЛИЦА СОВЕТСКАЯ, Д. 44', '1073706001600', '3726005004', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (123, 'ООО "РЕСУРСЭНЕРГО"', '153029, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА МИНСКАЯ, ДОМ 3, ОФИС 4', '1183702020237', '3702207918', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (124, 'ООО "Машиностроительный завод"', '155330, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ВИЧУГСКИЙ, ГОРОД ВИЧУГА, УЛИЦА ЛИТЕЙНАЯ, Д. 1', '1033700002632', '3701005965', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (125, 'УПРАВЛЕНИЕ РОСГВАРДИИ ПО ИВАНОВСКОЙ ОБЛАСТИ', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ОКТЯБРЬСКАЯ, ДОМ 22А', '1163702078066', '3702164090', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (7, 'ФКУ КП-12 УФСИН России по Ивановской области', '155828, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО ШИЛЕКША, УЛИЦА ЦЕНТРАЛЬНАЯ, 32', '1023701592001', '3713006811', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (126, 'Администрация Савинского муниципального района Ивановской области', '155710, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН САВИНСКИЙ, ПОСЕЛОК САВИНО, УЛИЦА ПЕРВОМАЙСКАЯ, Д. 22', '1023701650070', '3722002235', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (127, 'ООО "ИВЭСК"', '153012, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ТРЕТЬЕГО ИНТЕРНАЦИОНАЛА, ДОМ 22', '1183702002472', '3702193430', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (128, 'ООО "ПИТСТОП"', '153521, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, СЕЛО НОВО-ТАЛИЦЫ, УЛИЦА САДОВАЯ, У ДОМА 8', '1123711001743', '3711031403', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (129, 'АО "Управляющая компания "Опора"', '153013, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КУКОНКОВЫХ, ДОМ 145, ЭТАЖ 2 ПОМЕЩЕНИЕ 25,26,27', '1103702023490', '3702629780', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (130, 'ООО "Город"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПЕРЕУЛОК МАРХЛЕВСКОГО, ДОМ 17, ПОМЕЩЕНИЕ 5,6 ЭТАЖ 3', '1153702007777', '3702106042', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (131, 'ООО "АЛЬЯНС"', '155830, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КИНЕШЕМСКИЙ, ГОРОД НАВОЛОКИ, УЛИЦА ПРОМЫШЛЕННАЯ, ДОМ 6', '1163702060906', '3703019628', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (132, 'ООО "Петролеум Плюс"', '109388, МОСКВА ГОРОД, УЛИЦА ШОССЕЙНАЯ, ДОМ 33, ЭТ 1 ПОМ IV КОМ 8', '1177746909295', '9729131657', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (133, 'ОМВД России по Советскому району г. Иваново', '153020 ИВАНОВСКАЯ ОБЛАСТЬ ГОРОД ИВАНОВО УЛИЦА 2-Я СОСНЕВСКАЯ ДОМ 81', '1163702081883', '3702167327', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (134, 'ФКУЗ МСЧ МВД по Ивановской области', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, ДОМ 37', '1063702019655', '3702086773', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (135, 'ООО "Вектор"', '153022, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА БОГДАНА ХМЕЛЬНИЦКОГО, ДОМ 44, ПОМЕЩЕНИЕ ЧАСТЬ 1029', '1103702029595', '3702635945', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (136, 'ООО "УК (МР Сервис)"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, ДОМ 23, ПОМЕЩЕНИЕ 1001', '1133702005546', '3702693545', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (137, 'МЕЖМУНИЦИПАЛЬНЫЙ ОТДЕЛ МВД РОССИИ "ИВАНОВСКИЙ"', '153020, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ОКУЛОВОЙ, Д. 76', '1023701509567', '3711007383', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (138, 'УФССП России по Ивановской области', '53000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА БАГАЕВА, Д. 27', '1043700122454', '3702065237', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (139, 'ООО "УК "Мегаполис"', '153009, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ЛЕЖНЕВСКАЯ, ДОМ 183, ПОМЕЩЕНИЕ 2ПР, КАБИНЕТ 6', '1153702021000', '3702119404', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (140, 'ООО "АКРУС"', '155937, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, ДЕРЕВНЯ КЛОЧКОВО, УЛИЦА ЦЕНТРАЛЬНАЯ, ДОМ 7', '1163702068782', '3706023911', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (141, 'ОБУЗ "ПАЛЕХСКАЯ ЦРБ"', '155620, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ПАЛЕХСКИЙ, ПОСЕЛОК ПАЛЕХ, УЛИЦА ЗИНОВЬЕВА, Д. 2', '1023701831757', '3717003191', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (142, 'ООО "ТЕПЛО-ЭЛЕКТРО СЕТИ"', '155210, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ВЕРХНЕЛАНДЕХОВСКИЙ, ПОСЕЛОК ВЕРХНИЙ ЛАНДЕХ, УЛИЦА ПЕРВОМАЙСКАЯ, Д. 2', '1063720006019', '3708001984', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (143, 'ООО "Сельский дом"', '155360, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ПУЧЕЖСКИЙ, ГОРОД ПУЧЕЖ, УЛИЦА ЛЕНИНА, ДОМ 15', '1113720000118', '3720005760', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (144, 'ООО "Спецтранснефть"', '153003, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА НАГОВИЦЫНОЙ-ИКРЯНИСТОВОЙ, ДОМ 6, ОФИС 602', '1103702012237', '3702618516', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (145, 'ООО "Водосети"', '155630, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ЮЖСКИЙ, ГОРОД ЮЖА, УЛИЦА ЧЕРНЯХОВСКОГО, Д. 19', '1103706000782', '3706017266', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (146, 'ООО "ГЕОПРОЕКТ"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА 9 ЯНВАРЯ, Д.  4', '1073702032392', '3702531576', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (147, 'ТСЖ № 8', '600005, Владимирская область, г. Владимир, ул. Токарева, д. 2', '1103328004988', '3328472352', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (148, 'АДМИНИСТРАЦИЯ ГОРОДА КИРЖАЧ КИРЖАЧСКОГО РАЙОНА ВЛАДИМИРСКОЙ ОБЛАСТИ', '601021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КИРЖАЧСКИЙ, ГОРОД КИРЖАЧ, МИКРОРАЙОН КРАСНЫЙ ОКТЯБРЬ, УЛИЦА ПУШКИНА, 8, Б', '1063316000868', '3316012470', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (149, 'АО "ВЛАДИМИРСКИЙ ПРОМСТРОЙПРОЕКТ"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ГЕОРГИЕВСКАЯ, 7', '1033303415166', '3329031311', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (150, 'АО "ВФМ"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, 34', '1033302000588', '3302014453', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (151, 'АО "ИНФРАДИАЛОГ"', '107207, МОСКВА Г, БАЙКАЛЬСКАЯ УЛ, ДОМ 35А, ЭТАЖ 6 ПОМ.VII КОМН. 14,15', '1137746828064', '7719855488', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (152, 'АО "КОМПАНИЯ ТРАНСТЕЛЕКОМ"', '121357, МОСКВА ГОРОД, УЛИЦА ВЕРЕЙСКАЯ, ДОМ 29, СТРОЕНИЕ 33, ЭТАЖ 6 КОМ 12', '1027739598248', '7709219099', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (153, 'АО "ПОЧТА РОССИИ"', '131000, МОСКВА ГОРОД, ШОССЕ ВАРШАВСКОЕ, ДОМ 37', '1197746000000', '7724490000', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (154, 'АО ВТФ "ПЕЧАТЬ"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ИЛЬИЧА, 3', '1023303355250', '3329009080', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (155, 'ВЛАДИМИРСКАЯ ТАМОЖНЯ', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА АСАТКИНА, ДОМ 35', '1023301287954', '3327102246', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (156, 'ВОО ВТОО "СОЮЗ ХУДОЖНИКОВ РОССИИ"', '600015, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА РАЗИНА, 16', '1033303602750', '3327700366', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (157, 'ВООО ВОИ', '600006, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, ГЕРЦЕНА УЛ, 39', '1023300000041', '3328300360', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (158, 'ВОООЦ "Валента"', '600007, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА 16 ЛЕТ ОКТЯБРЯ, 1А', '1033303600087', '3328302142', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (159, 'ГБУЗ ВО "ГБ №6 Г.ВЛАДИМИРА"', '600901, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ГОРОДОК ИНСТИТУТСКИЙ (ЮРЬЕВЕЦ МКР.), 18', '1033301800388', '3327102535', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (160, 'ГБУЗ ВО "КИРЖАЧСКАЯ РБ"', '601010, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КИРЖАЧСКИЙ, ГОРОД КИРЖАЧ, ПРОЕЗД БОЛЬНИЧНЫЙ, ДОМ 11А', '1023300998313', '3316004215', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (161, 'ТСЖ "Куликово"', '153508, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ КУЛИКОВО, Д. 1', '1093711000250', '3711024526', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (162, 'ТСН «Чернореченский-1»', '153538, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, ДОМ 1', '1193702004308', '3711048414', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (163, 'ГБУЗ ВО "ОДКБ"', '600016, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 34', '1023303358253', '3329025565', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (164, 'ТСН «Черноречье-1»', '153538, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, ДОМ 1А', '1193702004297', '3711048407', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (166, 'ТСН "Чернореченский-2"', '153538, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, ДОМ 2', '1183702024186', '3711048213', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (168, 'МУП "ЮРЬЕВЕЦКОЕ ЖКХ"', '155453, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЮРЬЕВЕЦКИЙ, ГОРОД ЮРЬЕВЕЦ, УЛИЦА ТАРКОВСКОГО, ДОМ 1А', '1193702023217', '3706027698', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (171, 'ООО "ИВАНОВСКОЕ ППЖТ № 1"', '155150, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КОМСОМОЛЬСКИЙ, ГОРОД КОМСОМОЛЬСК, УЛИЦА ЛИНЕЙНАЯ, Д. 9', '1093704000312', '3704562851', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (173, 'ООО "ИВЛЕС"', '153000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПАЛЕХСКАЯ, ДОМ 6, ОФИС 510', '1183702009963', '3702199664', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (174, 'ООО "Заволжск Инвест"', '155410, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЗАВОЛЖСКИЙ, ГОРОД ЗАВОЛЖСК, УЛИЦА ТИМИРЯЗЕВА, ДОМ 41А', '1193702017508', '3703023053', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (175, 'МУП "ВОЛГА"', '155412, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ЗАВОЛЖСКИЙ, ГОРОД ЗАВОЛЖСК, УЛИЦА ПУШКИНА, ДОМ 1', '1193702021732', '3703023230', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (177, 'ООО "УК Ивановского района"', '153540, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ ТИМОШИХА, УЛИЦА СОВЕТСКАЯ, ДОМ 2А', '1153711000068', '3711034316', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (179, 'ООО "ТЕХИНВЕСТ"', '153003 ИВАНОВСКАЯ ОБЛАСТЬ ГОРОД ИВАНОВО УЛИЦА НАГОВИЦЫНОЙ-ИКРЯНИСТОВОЙ 6 ОФИС 301', '1033700107440', '3702043667', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (180, 'ООО "КОММУНАЛЬЩИК"', '153520, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, СЕЛО НОВО-ТАЛИЦЫ, ЛИНИЯ 3-Я, ДОМ 4', '1153711000046', '3711034309', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (181, 'МУП Кинешемского района "Решма"', '155840, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО РЕШМА, УЛИЦА ЛЕНИНА, ДОМ 12', '1193702015803', '3703022998', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (182, 'ООО "Промэнергосеть"', '153510, Ивановская обл., Ивановский район, г. Кохма, ул. Ивановская, д. 18, лит. А., пом. 65.', '1103702027604', '3702633948', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (183, 'ООО СПЕЦИАЛИЗИРОВАННЫЙ ЗАСТРОЙЩИК "КОРПОРАЦИЯ ВАВИЛОН"', '153025, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ТИМИРЯЗЕВА, ДОМ 1, СТРОЕНИЕ 2, ОФИС 226', '1143702026269', '3702742961', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (187, 'ООО "Ивцем - 2"', '153015, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПЕРЕУЛОК ТОРФЯНОЙ, Д. 67', '1113702020233', '3702654440', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (188, 'ОАО "Совхоз "Тепличный"', '153521, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, СЕЛО НОВО-ТАЛИЦЫ', '1073711002750', '3711021726', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (189, 'ООО "ОБЪЕДИНЕННЫЕ КОММУНАЛЬНЫЕ СИСТЕМЫ"', '119034, ГОРОД МОСКВА, ПЕРЕУЛОК 2-Й ОБЫДЕНСКИЙ, ДОМ 11', '1127746012085', '7704799174', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (190, 'ООО "Инвестпроект"', '153003 ИВАНОВСКАЯ ОБЛАСТЬ ГОРОД ИВАНОВО УЛИЦА НАГОВИЦЫНОЙ-ИКРЯНИСТОВОЙ 6 ОФ.301', '1113702031244', '3702659270', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (191, 'ООО УК "Согласие"', '153009, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ЛЕЖНЕВСКАЯ, ДОМ 183, ПОМЕЩЕНИЕ 2ПР, КАБИНЕТ 3', '1153702021010', '3702119411', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (192, 'ООО "ТЭС-Приволжск"', '155550, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ПРИВОЛЖСКИЙ, ГОРОД ПРИВОЛЖСК, УЛИЦА МОСКОВСКАЯ Б., ДОМ 3, ПОМЕЩЕНИЕ 41,42,43', '1183702018158', '3705010317', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (193, 'МУП "РСО"', '155410, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ЗАВОЛЖСКИЙ, ГОРОД ЗАВОЛЖСК, УЛИЦА ПОЧТОВАЯ, ДОМ 2', '1193702023646', '3703023335', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (194, 'ООО "Контур-Т"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, МИКРОРАЙОН ПРОСТОРНЫЙ, ДОМ 3', '1163702056825', '3711042927', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (195, 'МУП "МУК"', '155453 ИВАНОВСКАЯ ОБЛАСТЬ РАЙОН ЮРЬЕВЕЦКИЙ ГОРОД ЮРЬЕВЕЦ УЛИЦА ТАРКОВСКОГО ДОМ 1А', '1163702068331', '3720007252', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (202, 'МУП "ЖКХ ИЛЬИНСКОЕ"', '155060, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИЛЬИНСКИЙ, ПОСЕЛОК ИЛЬИНСКОЕ-ХОВАНСКОЕ, УЛИЦА СОВЕТСКАЯ, Д. 85', '1083704000522', '3704561791', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (204, 'ИОО ВТОО "Союз художников России"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, Д. 45', '1033700022620', '3729010404', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (205, 'ОБУЗ "РОДНИКОВСКАЯ ЦРБ"', '155251, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН РОДНИКОВСКИЙ, ГОРОД РОДНИКИ, УЛИЦА ЛЮБИМОВА, Д. 7', '1023701758486', '3721001662', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (206, 'ООО "Волгостальконструкция"', '603011, НИЖЕГОРОДСКАЯ ОБЛАСТЬ, ГОРОД НИЖНИЙ НОВГОРОД, ПРОСПЕКТ ЛЕНИНА, Д. 2', '1025202605383', '5258007761', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (208, 'ООО "УК "Основа"', '153025, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ГАГАРИНА, ДОМ 19, ЛИТЕРА А, ПОМЕЩЕНИЕ 1001', '1173702007764', '3702175462', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (210, 'РОООГО ДОСААФ России по Ивановской области', '153040, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, Д. 31', '1103700000359', '3702616269', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (211, 'ООО "Компания "ДОМА"', '153038, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА РОДНИКОВСКАЯ, Д. 50, ОФ. 13', '1133702026732', '3702712149', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (213, 'ООО "Региональная тепловая инвестиционная компания"', '155830, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КИНЕШЕМСКИЙ, ГОРОД НАВОЛОКИ, УЛИЦА ЧКАЛОВА, ДОМ 1А', '1184401003896', '4403006732', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (214, 'ООО "Шоколад"', '153035, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ЛЕЖНЕВСКАЯ, ДОМ 117, ПОМЕЩЕНИЕ 406', '1123702019550', '3702676275', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (217, 'ООО "Аверс - 2"', '153008, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПОСТЫШЕВА, ДОМ 10', '1173702014012', '3702180487', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (165, 'ГБУЗ ВО "СУДОГОДСКАЯ ЦРБ ИМ.ПОСПЕЛОВА"', '601352, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СУДОГОДСКИЙ, ГОРОД СУДОГДА, УЛИЦА ЛЕНИНА, 41 Б', '1023302751790', '3324001095', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (167, 'ГБУЗ ВО "ЮРЬЕВ-ПОЛЬСКАЯ ЦРБ"', '601800, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ЮРЬЕВ-ПОЛЬСКИЙ, ГОРОД ЮРЬЕВ-ПОЛЬСКИЙ, УЛИЦА 1 МАЯ, 16', '1063326005225', '3326006476', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (169, 'ГК "МИР"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, ДОМ 22А', '1193328003934', '3328022716', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (170, 'ГК "ПОГОДИНА"', '600016, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПОГОДИНА, 5Г', '1123340001620', '3329070945', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (172, 'ГКУЗ ВО "ОПБ №2"', '601280, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СУЗДАЛЬСКИЙ, ПОСЕЛОК СОДЫШКА, УЛИЦА ПРИБОЛЬНИЧНАЯ, 2', '1023302552184', '3325005085', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (176, 'ГПК "СУДОГОДСКОЕ ШОССЕ 17Д"', '600023, Владимирская область, г Владимир, Октябрьский район, Судогодское шоссе,17Д', '1093340004636', '3329057920', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (178, 'ГСК - 21', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДИКТОРА ЛЕВИТАНА', '1033301822399', '3327630493', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (184, 'ГСК "БАЛАКИРЕВА - 2"', '600028, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БАЛАКИРЕВА, 30А', '1043301803137', '3327630334', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (185, 'ГСК "ЖЕЛЕЗНОДОРОЖНЫЙ - 4"', '600037, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ФАТЬЯНОВА, 26, 111', '1043301805140', '3327630013', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (186, 'ГСК "ПОДОЗЁРКА"', '600902, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЭНЕРГЕТИКОВ (ЭНЕРГЕТИК МКР.), 9, -, 24', '1033301821827', '3327631056', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (196, 'ГСК "РУСИЧ"', '600021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КРАСНОАРМЕЙСКАЯ, ДОМ 43Г.', '1033301812510', '3327630077', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (197, 'ГСК "СТАВРОВСКИЙ"', '600022, Владимирская область, г Владимир, ул Ставровская,7', '1043301803148', '3327630870', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (198, 'ГСК Пичугина', '600001, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, ЛЕНИНА ПР-КТ, 2, 41', '1033301813445', '3327630976', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (199, 'ГУП "ВЛАДИМИРГРАЖДАНПРОЕКТ"', '600033, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДИКТОРА ЛЕВИТАНА, ДОМ 35', '1033301800696', '3327101228', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (200, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РЕСУРС СЕРВИС"', '601010, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КИРЖАЧСКИЙ, ГОРОД КИРЖАЧ, УЛИЦА ЛЕНИНГРАДСКАЯ, ДОМ 19, ЭТАЖ/ПОМЕЩЕНИЕ 3/2', '1193328012140', '3316019268', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (201, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РЕСУРС"', '600015, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ГОРОДОК СТРЕЛЕЦКИЙ, ДОМ 49-А, ПОМЕЩЕНИЕ 11', '1163328054240', '3329085532', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (203, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РИКС"', '197375, ГОРОД САНКТ-ПЕТЕРБУРГ, УЛИЦА МАРШАЛА НОВИКОВА, ДОМ 28, КОРПУС 2 ЛИТЕР А', '1033302008728', '3328411688', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (207, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РИТУАЛЬНЫЕ УСЛУГИ"', '601300, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КАМЕШКОВСКИЙ, ГОРОД КАМЕШКОВО, УЛИЦА ШКОЛЬНАЯ, 6', '1093336001274', '3315095481', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (209, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РОДНИК"', '111524, МОСКВА ГОРОД, УЛИЦА ЭЛЕКТРОДНАЯ, ДОМ 11, СТРОЕНИЕ 2, ПОМЕЩЕНИЕ I; 3', '1067761858141', '7719616497', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (212, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "РЕГИОНАЛЬНАЯ ТЕПЛО-ЭКСПЛУАТАЦИОННАЯ КОМПАНИЯ"', '600024, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ВАСИЛИСИНА, ДОМ 2, ЭТАЖ ЦОКОЛЬНЫЙ, ОФИС 30', '1173328011636', '3328018438', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (215, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ " РУССКИЙ БЕРЕГ"', '601130, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ПЕТУШИНСКИЙ, ПОСЕЛОК ГОРОДИЩИ, УЛИЦА СОВЕТСКАЯ, 114', '1123316000521', '3321030980', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (216, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СВР- ИНВЕСТ"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ДЕВИЧЕСКАЯ, ДОМ 11, ЭТАЖ 2, КАБИНЕТ 2', '1073336000210', '3310005163', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (218, 'Управление благоустройства Администрации г. Иваново', '153000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПЛОЩАДЬ РЕВОЛЮЦИИ, Д. 6', '1023700547881', '3728023270', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (219, 'ООО "Управляющая компания "Регион СтройПроект"', '153013, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КУКОНКОВЫХ, ДОМ 96, ПОМЕЩЕНИЕ 8', '1153702026642', '3702124612', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (220, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "С-ГРУПП"', '600017, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, ДОМ 61А', '1033302020883', '3328428233', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (221, 'ОБУЗ ВЕРХНЕЛАНДЕХОВСКАЯ ЦРБ', '155210, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ВЕРХНЕЛАНДЕХОВСКИЙ, ПОСЕЛОК ВЕРХНИЙ ЛАНДЕХ, УЛИЦА ОКТЯБРЬСКАЯ, Д. 37', '1023701700791', '3708000772', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (222, 'Администрация Пестяковского муниципального района Ивановской области', '155650, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ПЕСТЯКОВСКИЙ, ПОСЕЛОК ПЕСТЯКИ, УЛИЦА ЛЕНИНА, Д. 4', '1023701700142', '3718000813', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (223, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СЕЛЕНА"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОЕЗД 1-Й КОЛЛЕКТИВНЫЙ, 6А', '1033302007386', '3328416816', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (224, 'ООО "Высотка"', '153043, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КАЛАШНИКОВА, ДОМ 28Б, ОФИС 1-10', '1153702002684', '3702101125', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (225, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СЕРВИССТРОЙ"', '600016 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА БОЛЬШАЯ НИЖЕГОРОДСКАЯ ДОМ 108А ОФИС 201', '1173328007258', '3329090282', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (226, 'ООО "БИЗНЕС-ЛЭНД"', '153013, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КУКОНКОВЫХ, ДОМ 141, ЛИТЕР А-А24', '1163702063051', '3702151662', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (227, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СПЕЦИАЛИЗИРОВАННЫЙ ЗАСТРОЙЩИК "СТРОИТЕЛЬНОЕ УПРАВЛЕНИЕ ДСК 33"', '601915, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД КОВРОВ, УЛИЦА СТРОИТЕЛЕЙ, 15, СТРОЕНИЕ 1', '1043302202503', '3305050900', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (228, 'ТСЖ "НАШ ДОМ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СМИРНОВА, Д. 83', '1053701091399', '3702074136', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (229, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СИСТЕМА ТЕХНОЛОГИЙ"', '121552, МОСКВА ГОРОД, УЛИЦА ЯРЦЕВСКАЯ, ДОМ 34, КОРПУС 1, Э 2 ПОМ I К 7 ОФ 41', '1197746188936', '9731033368', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (230, 'ЖСК "МЕСТПРОМОВЕЦ-2"', '153040, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ШУБИНЫХ, Д. 9', '1023700558199', '3728014861', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (231, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СИСТЕМА"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ОКТЯБРЬСКИЙ, ДОМ 22, ЭТАЖ 4, ОФИС 14Г', '1103328002722', '3328470355', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (232, 'ООО "РЕГИОНПРО"', '153003, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, ДОМ 16, ЛИТЕР А, ПОМЕЩЕНИЕ 427', '1113702005768', '3702641297', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (233, 'ООО "УЖКК-ПРИОРИТЕТ"', '153040, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, ДОМ 54А, ПОМЕЩЕНИЕ 2', '1153702020801', '3702119193', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (234, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СИТИСТРОЙ"', '600005 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА СЕВЕРНАЯ ДОМ 63 Б ОФИС 7', '1153328005313', '3328009680', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (235, 'ООО "ДВОРЯНКА"', '153035, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА РАДИЩЕВА, ДОМ 12, КВАРТИРА 62', '1163702057837', '3702147426', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (236, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СТРАХОВАЯ КОМПАНИЯ "СЕРВИСРЕЗЕРВ"', '601901, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД КОВРОВ, УЛИЦА ЧЕРНЫШЕВСКОГО, 17', '1023301952190', '3317000799', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (237, 'ООО "Гарант - Сервис"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КАЛИНИНА, 10, ПОМЕЩЕНИЕ 1006', '1063702137290', '3702096468', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (238, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СЛАВЯНСКИЙ ДОМ"', '153022, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ВЕЛИЖСКАЯ, 8', '1033700062990', '3728026289', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (239, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СОДРУЖЕСТВО"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ МОСКОВСКАЯ, ДОМ 80, ЭТАЖ МАНСАРДА, ПОМЕЩЕНИЕ 1', '1083327002703', '3327837554', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (240, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СОЗВЕЗДИЕ"', '600020 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА БОЛЬШАЯ НИЖЕГОРОДСКАЯ 71 ПОМЕЩЕНИЕ 20', '1143340004170', '3329077877', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (241, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СОЛИДАРНОСТЬ"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ВАСИЛИСИНА, 14', '1033302013876', '3328413340', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (242, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СПЕЦИНСТРУМЕНТ"', '600020 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР СПУСК РАБОЧИЙ 8', '1023303357186', '3329023991', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (243, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СТРОЙТЕХНОКОНТРОЛЬ"', '600005, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СТРОИТЕЛЕЙ, ДОМ 5Г, ЭТАЖ 1, ПОМЕЩЕНИЕ 3', '1153328005467', '3328009899', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (244, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СТРОЙ-СЕРВИС-ХХI"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ВАНЦЕТТИ, 18', '1083702015264', '3702559490', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (246, 'ООО "ИТБ-СМОЛ"', '153012, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА НАУМОВА, Д. 1', '1043700054408', '3702051259', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (249, 'АО "ПСК"', '153007, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА МЕСТЕЧКО МИНЕЕВО, КРАНЭКС, ДОМ 17', '1033700069765', '3729007313', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (251, 'ООО "СТРОЙТЕХМОНТАЖ"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КОМСОМОЛЬСКАЯ, 17, ПОМ 1003', '1083702019444', '3702563553', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (252, 'ООО "ЭКСПРЕСС+"', '155802, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА ПРАВДЫ, ДОМ 20, ОФИС 11', '1153703000263', '3703018399', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (254, 'ТСЖ "КУЛЬТУРА"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ГОЛУБЕВА, Д. 6', '1063702146397', '3702503459', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (256, 'ООО "ЭНЕРГИЯ +"', '153031, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОЕЗД БАКИНСКИЙ, Д. 55А', '1083702020995', '3702565550', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (259, 'ТСН "ПРЕСТИЖ"', '153511, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ИВАНОВСКАЯ, ДОМ 71', '1153711001575', '3711038511', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (262, 'ООО СЗ "ГЛАВСТРОЙ"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА 8 МАРТА, ДОМ 13', '1163702057200', '3702146863', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (263, 'МУП "Зеленый город"', '155331, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ВИЧУГСКИЙ, ГОРОД ВИЧУГА, УЛИЦА 50 ЛЕТ ОКТЯБРЯ, Д. 19', '1023700509788', '3701005027', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (264, 'ФКУ "ЦХиСО УМВД России по Ивановской области"', '153020, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ОКУЛОВОЙ, ДОМ 76', '1123702021827', '3702677670', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (266, 'ЖСК "КОСМОС"', '153040, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ШУБИНЫХ, ДОМ 34А, КВАРТИРА 39', '1033700086200', '3728014710', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (269, 'АДМИНИСТРАЦИЯ КИНЕШЕМСКОГО МУНИЦИПАЛЬНОГО РАЙОНА', '155800, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА ИМ ЛЕНИНА, Д. 12', '1033700450112', '3713002824', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (247, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТАМБОВЭЛИТСТРОЙ"', '392523, ОБЛАСТЬ ТАМБОВСКАЯ, РАЙОН ТАМБОВСКИЙ, СЕЛО БОКИНО, УЛИЦА ШИРОКАЯ (НОВЫЙ МКР МКР), ДОМ 23А', '1146820000766', '6820035033', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (248, 'Жилищно-строительный кооператив №17', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ВАСИЛИСИНА, 14А, 26', '1033301822355', '3327610088', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (250, 'Жилищно-строительный кооператив при организации п/я 34 (ЖСК № 37)ИНН 3327610289', '600022, Владимирская область, г Владимир, ул Василисина,12', '1033301802984', '3327610289', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (253, 'ЖСК 41', '600009, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПОЛИНЫ ОСИПЕНКО, 30', '1033302019959', '3328102231', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (255, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕПЛОСЕТЕВАЯ КОМПАНИЯ"', '601903 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД КОВРОВ УЛИЦА ФУРМАНОВА ДОМ 33 ПОМЕЩЕНИЕ 24', '1133332001912', '3305718338', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (245, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕПЛОСЕТЕВАЯ КОМПАНИЯ"', '600009 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА СЕВЕРНАЯ ДОМ 59ЭТАЖ 2 КАБИНЕТ 10', '1173328000273', '3328016222', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (257, 'ЖСК 47', '600009, Владимирская область, г Владимир, ул Полины Осипенко,32', '1033302019772', '3328102369', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (258, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕПЛОТЕХ"', '601770, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА МЕЛИОРАТОРОВ (БЕЛАЯ РЕЧКА МКР.), ДОМ 3, ОФИС 2', '1183328011338', '3306019131', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (260, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕХАВТО"', '600014 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ЛАКИНА 139 ПОМЕЩЕНИЕ 21', '1143328000628', '3328494532', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (261, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕХНОЛОГИЯ ТЕПЛА"', '600021, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА 9 ЯНВАРЯ, ДОМ 3, КОРП. ОБЩ., КВАРТИРА 316А', '1183328003451', '3306018949', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (265, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТОН"', '601781 ВЛАДИМИРСКАЯ ОБЛАСТЬ РАЙОН КОЛЬЧУГИНСКИЙ ГОРОД КОЛЬЧУГИНО УЛИЦА МИРА ДОМ 84ЭТАЖ 1 ОФИС 1', '1163328053778', '3306018240', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (267, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТРИО"', '600033, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА МОСТОСТРОЕВСКАЯ, 2А', '1023303357000', '3327309843', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (268, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТРОЙКА"', '601010 ВЛАДИМИРСКАЯ ОБЛАСТЬ РАЙОН КИРЖАЧСКИЙ ГОРОД КИРЖАЧ УЛИЦА ЗЕЛЕНОГРАДНАЯ 14', '1033301003075', '3316002120', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (270, 'ООО "НТС"', '153032, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ТАШКЕНТСКАЯ, ДОМ 100-А, ПОМЕЩЕНИЯ 1-18', '1163702070014', '3702157512', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (271, 'ТСН «Чернореченский-4»', '153538, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, ДОМ 4', '1193702002900', '3711048340', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (272, 'ООО УК "Иваново-Вознесенск"', '153040, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, ДОМ 92, ПОМЕЩЕНИЕ 35', '', '3702158690', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (273, 'ООО "УК "Корона"', '153000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СОВЕТСКАЯ, ДОМ 3А', '1143702022936', '3702739662', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (274, 'ТСЖ "Рождественский-8"', '153051, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, МИКРОРАЙОН РОЖДЕСТВЕНСКИЙ, ДОМ 8', '1173702002759', '3702171612', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (275, 'ООО "Возрождение"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПЕРЕУЛОК КОНСПИРАТИВНЫЙ, ДОМ 11, ЛИТЕР А, ПОМЕЩЕНИЕ 1008', '1103702029496', '3702636032', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (276, 'ООО "Вернисаж"', '153003, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, ДОМ 16, ЛИТЕР А, ОФИС 204', '1083702014912', '3702559099', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (277, 'ООО "Санаторий Зеленый городок"', '153535, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, ДЕРЕВНЯ ЛОМЫ', '1023701513384', '3711001695', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (278, 'ООО "Тепло-город"', '155450, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ЮРЬЕВЕЦКИЙ, ГОРОД ЮРЬЕВЕЦ, УЛИЦА ЧКАЛОВА, ДОМ 2', '1153720000114', '3720006883', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (279, 'ТСЖ "Агат"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПОЧТОВАЯ, 19', '1033700083999', '3731031955', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (280, 'ООО УК "ПИСЦОВСКОЕ ЖКХ"', '155130, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КОМСОМОЛЬСКИЙ, СЕЛО ПИСЦОВО, УЛИЦА КОМСОМОЛЬСКАЯ, 33', '', '3704561752', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (281, 'ТСН "ЧЕРНОРЕЧЕНСКИЙ-5"', '153538, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ИВАНОВСКИЙ, СЕЛО ЧЕРНОРЕЧЕНСКИЙ, УЛИЦА ЛЕНИНА, ДОМ 5, КВАРТИРА 34', '', '3711047932', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (282, 'ООО "Галтекс"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, ДОМ 3А, ОФИС 506', '', '3702067805', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (283, 'ООО "Варго"', '155900, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, ГОРОД ШУЯ, ПЛОЩАДЬ ФРУНЗЕ, ДОМ 6', '', '3702620177', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (284, 'ТСЖ "ОКТЯБРЬ - 2"', '153038, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА МАРШАЛА ВАСИЛЕВСКОГО, Д. 17', '', '3702676500', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (285, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТЕХНИЧЕСКАЯ ЭКСПЛУАТАЦИОННАЯ КОМПАНИЯ"', '600001, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА РАЗИНА, 4А', '1033301805877', '3327306345', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (310, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "СОЮЗ"', '600017 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР ПРОСПЕКТ ОКТЯБРЬСКИЙ 36 12', '1033302009751', '3328425955', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (286, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ "ДЕЛОВОЙ ДОМЪ"', '600020 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА БОЛЬШАЯ НИЖЕГОРОДСКАЯ ДОМ 34 Б ПОМЕЩЕНИЕ 44', '1073340006255', '3329047417', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (287, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ "ДОВЕРИЕ"', '600001, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СТУДЕНАЯ ГОРА, ДОМ 36-А, ЭТАЖ 2, ОФИС 225', '1177746050833', '9717052560', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (288, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ "ЖИЛСЕРВИС"', '601903, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА МОЛОДОГВАРДЕЙСКАЯ, ДОМ 11', '1083332000784', '3305061290', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (289, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ УПРАВЛЯЮЩАЯ КОМПАНИЯ "СОГЛАСИЕ"', '601900 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД КОВРОВ ПРОСПЕКТ ЛЕНИНА ДОМ 14КОРУС А ОФИС 1', '1153332001162', '3305793102', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (290, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ ЛЮКС"', '600022 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА СТАВРОВСКАЯ ДОМ 10ЛИТЕР В ЭТАЖ 1 КОМНАТА 28А', '1133326000620', '3306016878', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (291, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ "ПАРАДИГМА"', '601914, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОВРОВСКИЙ, ДЕРЕВНЯ БЕЛЬКОВО, ДОМ 22А', '1183328004298', '3317027053', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (292, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ-40А"', '600015 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ЧАЙКОВСКОГО 40А', '1083327000096', '3327834987', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (293, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УСПЕХ"', '121374, МОСКВА ГОРОД, УЛИЦА АЛЕКСЕЯ СВИРИДОВА, ДОМ 9, СТРОЕНИЕ 3, КОМНАТА 12', '1063327009998', '3327824770', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (294, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЕНИЕ ТРОЛЛЕЙБУСНОГО ТРАНСПОРТА ГОРОДА КОВРОВА"', '601914, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД КОВРОВ, УЛИЦА КОМСОМОЛЬСКАЯ, ДОМ 112', '1173328003276', '3305796880', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (295, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ФОРТ-ПЛЮС"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ МОСКОВСКАЯ, ДОМ 24А, ПОМЕЩЕНИЕ I I ЭТАЖ 1, ОФИС 20', '1023303356450', '3329027996', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (296, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЧЕЧЕН ГРУПП"', '600033, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СУЩЕВСКАЯ, ДОМ 37, ПОМЕЩЕНИЕ 8', '1183328004364', '3327140040', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (297, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЧИСТОГОР"', '601786, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА ДРУЖБЫ, 29, 6', '1043300401550', '3306009197', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (298, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭКОСТОК"', '601351, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН СУДОГОДСКИЙ, ГОРОД СУДОГДА, УЛИЦА КОММУНИСТИЧЕСКАЯ, ДОМ 1А, ОФИС 2', '1083337000834', '3324121755', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (299, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭЛБИНГ ИНВЕСТМЕНТС"', '107078, ГОРОД МОСКВА, УЛИЦА НОВАЯ БАСМАННАЯ, ДОМ 9, СТРОЕНИЕ 8, ПОМЕЩЕНИЕ 1, КОМ. 2А', '1117746571612', '7701926096', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (300, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭЛЕКС-КАБЕЛЬ"', '601787, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА ВЕДЕНЕЕВА, 3', '1093326001075', '3306013482', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (301, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭЛЬДОРАДО"', '600021, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ПУШКАРСКАЯ, ДОМ 46, ЭТАЖ 3, ПОМЕЩЕНИЕ 327', '1023303352490', '3329027058', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (302, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭНЕРГОСТРОЙИНВЕСТ"', '600001, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ОФИЦЕРСКАЯ, ДОМ 16, ОФИС 6', '1123327004833', '3327112300', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (303, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЭТАЛОН-ЦЕНТР"', '600037 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ВЕРХНЯЯ ДУБРОВА ДОМ 40ВЭТАЖ 2 ОФИС 1', '1163328060510', '3327133445', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (304, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ВАРИАНТ"', '601785, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА ПОСЕЛОК ТРУДА, 20', '1103326000095', '3306014197', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (305, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ВОЗРОЖДЕНИЕ"', '601900, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА АБЕЛЬМАНА, 18', '1033302209423', '3305000699', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (306, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ ДНТ "ОВЧУХИ"', '601291, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СУЗДАЛЬСКИЙ, ГОРОД СУЗДАЛЬ, УЛИЦА ПРОМЫШЛЕННАЯ, 12, ОФИС 5', '1143340002805', '3310006907', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (307, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ЖИЛСТРОЙ"', '601203, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН СОБИНСКИЙ, ГОРОД ЛАКИНСК, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, ДОМ 24', '1153327002014', '3309005232', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (308, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ ПРОИЗВОДСТВЕННО-КОММЕРЧЕСКОЕ ПРЕДПРИЯТИЕ "ПИРАМИДА-91"', '600023 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ПЕСОЧНАЯ (КОММУНАР МКР.) ДОМ 2Д КВАРТИРА 52', '1023303357296', '3329005417', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (309, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ СТРОИТЕЛЬНАЯ КОМПАНИЯ "СТРОЙВЛАДИМИР"', '600021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПУШКАРСКАЯ, ДОМ 44, ЭТАЖ 1, КАБИНЕТ 2', '1173328008842', '3327137545', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (311, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ СПЕЦИАЛИЗИРОВАННЫЙ ЗАСТРОЙЩИК "СТРОЙКОМ"', '600005, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СТУДЕНЧЕСКАЯ, ДОМ 6Д, ЭТАЖ 1, ОФИС 1', '1093328003560', '3328466038', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (312, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТОРГОВАЯ ФИРМА "ВИЛ"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ОКТЯБРЬСКИЙ, 16', '1023301290946', '3328405067', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (313, 'ЖСК 47', '600009, Владимирская область, г Владимир, ул Полины Осипенко,32', '1033302019772', '3328102369', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (314, 'ЖСК № 1', '601202, ВЛАДИМИРСКАЯ ОБЛ, СОБИНСКИЙ Р-Н, СОБИНКА Г, МИРА УЛ, 3, 19', '1033302601342', '3309003732', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (315, 'ЖСК № 10 ВТЗ', '600026, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ГОРЬКОГО, 93', '1033302020278', '3328102094', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (316, 'ЖСК № 103', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 195Б', '1033303414100', '3329014130', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (317, 'ЖСК № 123', '600026, Владимирская область, г Владимир, Октябрьский район, ул Тракторная,13', '1033302020322', '3328102168', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (318, 'ЖСК № 138', '600026, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, ГОРЬКОГО УЛ, 86', '1033302012732', '3328102190', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (319, 'ЖСК № 144', '600033, Владимирская область, г Владимир, Ленинский район, ул Сущевская,3.', '1033301815360', '3327610031', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (320, 'ЖСК № 20', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИХАЙЛОВСКАЯ, 55', '1033302012017', '3328102400', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (321, 'ЖСК № 20', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИХАЙЛОВСКАЯ, 55', '1033302012017', '3328102400', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (322, 'ЖСК № 37', '601900, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА ЗОИ КОСМОДЕМЬЯНСКОЙ, 1, 3', '1033302211590', '3305011316', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (323, 'ЖСК № 40', '600022, Владимирская область, г Владимир, ул Василисина,12А.', '1033301805790', '3327610320', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (324, 'ЖСК № 5', '601755, ВЛАДИМИРСКАЯ ОБЛАСТЬ, КОЛЬЧУГИНСКИЙ РАЙОН, П БАВЛЕНЫ, УЛ ЖЕЛЕЗНОДОРОЖНАЯ,5', '1033300403179', '3318001280', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (325, 'ЖСК № 59', '601900, ВЛАДИМИРСКАЯ ОБЛ, КОВРОВ Г, МАЯКОВСКОГО УЛ, 4, 68', '1033302210237', '3305009282', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (326, 'ЖСК № 59', '600007, Владимирская область, г Владимир, Октябрьский район, ул Почаевская,23', '1033302004394', '3328102584', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (327, 'ЖСК № 82', '600022, Владимирская область, Ленинский район, г Владимир, ул Верхняя Дуброва,18', '1033301810497', '3327610225', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (328, 'ЖСК №13', '600007, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА УСТИ-НА-ЛАБЕ, ДОМ 33', '1033302019761', '3328103059', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (329, 'ЖСК №21', '600026, Владимирская область, г Владимир, Октябрьский район, ул Горького,96', '1033302019871', '3328102070', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (330, 'ЖСК №7', '600026, Владимирская область, г Владимир, Октябрьский район, ул Горького,96', '', '', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (331, 'ЖСК №7', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА НИКОЛАЯ ОСТРОВСКОГО, 62, 7', '1043301805579', '3327610345', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (332, 'ЖСК №83', '600028, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, БАЛАКИРЕВА УЛ, 47, 8', '1033301810794', '3327610465', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (333, 'ЖСК-34', '600015, Г ВЛАДИМИР,УЛ ЧАЙКОВСКОГО,5', '', '3327610105', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (334, 'ЗАО "Альтернатива"', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СУЗДАЛЬСКИЙ, 9А', '1033303412064', '3329030452', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (335, 'ЗАО "МНК-ГРУПП"', '196128, САНКТ-ПЕТЕРБУРГ ГОРОД, УЛИЦА ВАРШАВСКАЯ, ДОМ 5А, ЛИТЕР АВ, КОРПУС 16 ПОМЕЩЕНИЕ 2Н КОМН. 2', '1107847321823', '7810802206', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (336, 'ЗАО "СМЗ"', '601291, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СУЗДАЛЬСКИЙ, ГОРОД СУЗДАЛЬ, УЛИЦА ПРОМЫШЛЕННАЯ, 13', '1023302551040', '3310003286', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (337, 'ЗАО ПО СВИНОВОДСТВУ "ВЛАДИМИРСКОЕ"', '600903, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, МИКРОРАЙОН ЛЕСНОЙ, УЛИЦА ЛЕСНАЯ, 21', '1023303352731', '3302012103', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (338, 'ЗАО ХК "СТРОЙЭНЕРГОСЕРВИС"', '601903, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА ВОЛГО-ДОНСКАЯ, 33', '1027700496735', '7736121543', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (339, 'КООПЕРАТИВ №6 ВЛАДЕЛЬЦЕВ АВТО-МОТОТРАНСПОРТА ПО СТРОИТЕЛЬСТВУ И ЭКСПЛУАТАЦИИ КОЛЛЕКТИВНЫХ ГАРАЖЕЙ', '600032, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА РАСТОПЧИНА, 7, 8', '1033303409094', '3329014637', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (340, 'КПК "НАРОДНАЯ КАССА"', '109431, МОСКВА ГОРОД, УЛИЦА ПРИВОЛЬНАЯ, 61, 1', '1057746379459', '7721526025', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (341, 'МБОУ СОШ №1 г.Собинка', '601202, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА ГАГАРИНА, ДОМ 22', '1023302352028', '3309004197', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (342, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ - АТЛАНТ"', '600037, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА НИЖНЯЯ ДУБРОВА, 19А', '1103327007211', '3327852873', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (343, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ УПРАВЛЯЮЩАЯ КОМПАНИЯ "ЗОЛОТЫЕ ВОРОТА"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЗЕЛЕНАЯ, ДОМ 1А, ОФИС 1.03', '1173328013407', '3328018808', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (344, 'МБОУ СОШ №1 г.Собинка', '601202, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА ГАГАРИНА, ДОМ 22', '1023302352028', '3309004197', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (394, 'ООО "ВЛАД-ВСКА"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ МОСКОВСКАЯ, 19', '1023303357428', '3329006361', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (345, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ УПРАВЛЯЮЩАЯ КОМПАНИЯ "ПОНОМАРЕВ С.А."', '601202, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА ПЕРВОМАЙСКАЯ, 7', '1073335000298', '3309011099', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (347, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ УПРАВЛЯЮЩАЯ КОМПАНИЯ "ПОРЯДОК"', '600022, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, ДОМ 71, ПОМЕЩЕНИЕ V', '1153327002608', '3327127924', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (349, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ УПРАВЛЯЮЩАЯ КОМПАНИЯ "СПЕЦСТРОЙГАРАНТ-1"', '601203, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА МОЛОДЕЖНАЯ, 14 КВАРТАЛ', '1093340000984', '3329054260', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (350, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "УПРАВЛЯЮЩАЯ КОМПАНИЯ "АКВА-ГРАД"', '601900, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА СОЦИАЛИСТИЧЕСКАЯ, ДОМ 3, КВАРТИРА 7', '1143332000240', '3305719927', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (351, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "АЛИВС"', '601108, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ПЕТУШИНСКИЙ, ДЕРЕВНЯ НОВОЕ АННИНО, УЛИЦА ЦЕНТРАЛЬНАЯ, 18', '1053300633594', '3321021015', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (353, 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ ФИРМА "ЭКСПРЕСС"', '143912, ОБЛАСТЬ МОСКОВСКАЯ, ГОРОД БАЛАШИХА, КВАРТАЛ ЩИТНИКОВО, 161', '1035000703209', '5040007386', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (354, 'РЕГИОНАЛЬНАЯ ОБЩЕСТВЕННАЯ ОРГАНИЗАЦИЯ "СОВЕТ ОТЦОВ" ВЛАДИМИРСКОЙ ОБЛАСТИ', '601270 ВЛАДИМИРСКАЯ ОБЛАСТЬ РАЙОН СУЗДАЛЬСКИЙ ПОСЕЛОК БОГОЛЮБОВОУЛИЦА ФРУНЗЕ ДОМ 62', '1163300050638', '3325013209', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (355, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "РАДУГА" КОМБИНАТА "ДУБРАВА" П. ЮРЬЕВЕЦ', '600901, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, МИКРОРАЙОН ЮРЬЕВЕЦ', '1033301802863', '3327620093', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (357, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "ЮРЬЕВЕЦ - 1"', '600022, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, ДОМ 61, КВАРТИРА 26', '1033301811971', '3327620390', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (358, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "ВИШЕНКА"', '600901, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ТЕРРИТОРИЯ СНТ ВИШЕНКА (ЮРЬЕВЕЦ МКР.)', '1033301807912', '3327620079', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (359, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "ДУБКИ"', '601130, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН ПЕТУШИНСКИЙ, ПОСЕЛОК ГОРОДИЩИ, УЛИЦА СОВЕТСКАЯ', '1033301402595', '3321008078', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (360, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "НИЖНЕЕ СЕЛЬЦО-2"', '600022, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ТЕРРИТОРИЯ АЭРОПОРТ', '1033301807351', '3328302181', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (361, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "РАССВЕТ"', '601130, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН ПЕТУШИНСКИЙ, ПОСЕЛОК ГОРОДИЩИ, УЛИЦА СОВЕТСКАЯ, ДОМ 40, КВАРТИРА 8', '1153316153836', '3321008416', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (362, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "СВОЙ ТРУД"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ДМИТРИЕВСКАЯ СЛОБОДА', '1033301802368', '3327620329', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (364, 'САДОВОДЧЕСКОЕ НЕКОММЕРЧЕСКОЕ ТОВАРИЩЕСТВО "ТЕКСТИЛЬЩИК"', '601201 ВЛАДИМИРСКАЯ ОБЛАСТЬ РАЙОН СОБИНСКИЙ ДЕРЕВНЯ ПЕРЕБОР', '1033302600715', '3309003348', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (366, 'СЕЛЬСКОХОЗЯЙСТВЕННЫЙ ПОТРЕБИТЕЛЬСКИЙ САДОВОДЧЕСКИЙ КООПЕРАТИВ "ДРУЖБА"', '601130, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ПЕТУШИНСКИЙ, ПОСЕЛОК ГОРОДИЩИ', '1083316001449', '3321026831', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (346, 'МБУ СДЦ "ТОРПЕДО"', '601021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КИРЖАЧСКИЙ, ГОРОД КИРЖАЧ, МИКРОРАЙОН КРАСНЫЙ ОКТЯБРЬ, УЛИЦА ОКТЯБРЬСКАЯ, 9', '1043301002084', '3316011357', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (348, 'МБУК ДК ИМ. НОГИНА', '601902, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА АБЕЛЬМАНА, 75', '1033302206409', '3305004220', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (352, 'МКУ ЮРЬЕВ-ПОЛЬСКОГО РАЙОНА "УКС"', '601800, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ЮРЬЕВ-ПОЛЬСКИЙ, ГОРОД ЮРЬЕВ-ПОЛЬСКИЙ, УЛИЦА ШИБАНКОВА, 33', '1023301253865', '3326005271', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (356, 'МУП Г ВЛАДИМИРА "ГУК"', '600009, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПОЛИНЫ ОСИПЕНКО, ДОМ 3, ОФИС 38', '1153328001529', '3328002766', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (363, 'МУП Г. КОЛЬЧУГИНО "КОММУНАЛЬНИК"', '601784, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, ШОССЕ УЛЬЯНОВСКОЕ, 21', '1033300400407', '3306001575', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (365, 'МУП КОЛЬЧУГИНСКОГО РАЙОНА "КОЛЬЧУГТЕПЛОЭНЕРГО"', '601784, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, ПЕРЕУЛОК ГОГОЛЯ, ДОМ 1', '1183328011041', '3306019117', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (367, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "СТРОИТЕЛЕЙ 34 - В"', '600014, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СТРОИТЕЛЕЙ, 34В', '1033302005670', '3328302720', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (368, 'НСТ САД КЭЗ№ 5', '601910, ВЛАДИМИРСКАЯ ОБЛ.,Г КОВРОВ,УЛ ПУГАЧЕВА,35', '1033302200238', '3305011549', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (369, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "БАЛАКИРЕВА 27"', '600028, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА БАЛАКИРЕВА, 27', '1063327012605', '3327826104', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (370, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "БЕЗЫМЕНСКОГО 26 А"', '600035, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БЕЗЫМЕНСКОГО, 26А', '1103340003084', '3329061355', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (371, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "БЯКОВА 20"', '601352, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН СУДОГОДСКИЙ, ГОРОД СУДОГДА, УЛИЦА БЯКОВА, 20, 2', '1103337000315', '3324122928', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (372, 'ОАО "Владалко"', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ НИЖЕГОРОДСКАЯ, 62', '1023303351235', '3302008555', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (373, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ВЕСНА"', '600035 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА БЕЗЫМЕНСКОГО 6Б', '1053303616200', '3329034739', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (374, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ВИКТОРИЯ"', '601241, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН СОБИНСКИЙ, ГОРОД ЛАКИНСК, УЛИЦА ЛЕРМОНТОВА, 34, 108', '1093335002001', '3309459211', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (375, 'ОАО "ВЛАДИМИРТИСИЗ"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СВЯЗИ, 8', '1023301458366', '3328101220', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (376, 'ОАО "МНПК "ПИКЪ"', '601907, ВЛАДИМИРСКАЯ ОБЛ, КОВРОВ Г, ПЕРШУТОВА УЛ, 25', '1023301952684', '3305012856', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (377, 'ОАО "ШВЕЙНАЯ ФАБРИКА "ПОБЕДА"', '600016, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, ДОБРОСЕЛЬСКАЯ УЛ, 8', '1033303405827', '3302000524', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (378, 'ООО  "СТРОЙКОМПЛЕКТ"', '600022, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, СТАВРОВСКАЯ УЛ, 7', '1023301286799', '3302003910', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (379, 'ООО "УК "Лидер"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, ДОМ 34, ОФИС 203', '1173328008105', '3328017787', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (380, 'ООО "АВ-ГРУПП"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СТРОИТЕЛЕЙ, ДОМ 2, ПОМЕЩЕНИЕ III', '1173328002979', '3327136291', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (381, 'ООО "Агро-прогресс"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 207Б', '1033302008409', '3328405780', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (382, 'ООО "АГРОПРОМСТРОЙЗАКАЗЧИК"', '600001, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, 15А', '1103327001304', '3327847739', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (383, 'ООО "АГРОПРОМСТРОЙЗАКАЗЧИК"', '600001, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, 15А', '1103327001304', '3327847739', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (384, 'ООО "Алые паруса"', '600003, г. Владимир, мкр. Оргтруд, ул. Строителей, д. 2 А', '1033302005043', '3328410324', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (385, 'ООО "АЛЬВЕНТА"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СЕМАШКО, ДОМ 13, ОФИС 5', '1023301287570', '3327325404', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (386, 'ООО "АЛЬЯНСАКТИВ"', '101000, МОСКВА Г, АРМЯНСКИЙ ПЕР, ДОМ 9, СТРОЕНИЕ 1, ОФИС 413/73', '1177746605288', '9701079686', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (387, 'ООО "АУРА"', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ВОКЗАЛЬНАЯ, ДОМ 24, ЭТАЖ 1, ПОМЕЩЕНИЕ 1', '1113328012269', '3328478724', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (388, 'ООО "БЛОМАРТ"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ЖИДЕЛЕВА, ДОМ 19', '1153702006996', '3702105112', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (389, 'ООО "ВАН - БАГ"', '600901, Владимирская область, г Владимир, Ленинский район, Микрорайон Юрьевец,проезд Строительный,1', '1033301805404', '3327309152', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (390, 'ООО "ВИКТОРИЯ"', '600009, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПОЛИНЫ ОСИПЕНКО, 12', '1123328001499', '3328481734', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (391, 'ООО "ВИКТОРИЯ"', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЕГОРОВА, ДОМ 8Б, ЭТАЖ 5, ПОМЕЩЕНИЕ 42/3', '1033301815865', '3327328268', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (392, 'ООО "ВИТЦ"', '600007, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЭЛЕКТРОЗАВОДСКАЯ, 7', '1023301459390', '3328411769', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (393, 'ООО "ВКУСНЫЙ ДОМ"', '600023, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЦЕНТРАЛЬНАЯ (КОММУНАР МКР.), ДОМ 19Ж', '1183328005190', '3329093460', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (395, 'ООО "ВЛАДЗАСТРОЙЩИК"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СТУДЕНЧЕСКАЯ, ДОМ 6Д, ЭТАЖ 1, ОФИС 1, ПОМЕЩЕНИЕ 7', '1153328001969', '3328003858', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (396, 'ООО "ВЛАДИМИРСКИЙ ПАССАЖ"', '600025, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДВОРЯНСКАЯ, ДОМ 10, ЭТАЖ 3, ОФИС 62', '1023301289880', '3327309177', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (397, 'ООО "ВЛАДИМИРСКИЙ СТАНДАРТ"', '600910, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД РАДУЖНЫЙ, КВАРТАЛ 13/13, ДОМ 20', '1113340004062', '3308006635', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (398, 'ООО "ВЛАДСТРОЙ"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СЕВЕРНАЯ, 63Б, ОФИС 7', '1143328004786', '3328498713', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (399, 'ООО "Владтеплоресурс"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ГАГАРИНА, ДОМ 6, ЭТАЖ 2, ПОМЕЩЕНИЕ 22', '1163328068200', '3329088445', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (400, 'ООО "ВЛК"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ГОРЬКОГО, 70', '1143328005798', '3328499724', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (401, 'ООО "ВУК"', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КАМАНИНА, ДОМ 18, ЭТАЖ 1, ПОМЕЩЕНИЕ 6', '1143328003246', '3328497188', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (402, 'ООО "ВЮН"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, 22А, 7', '1033302018012', '3328427374', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (403, 'ООО "ВЯЗНИКИ СПЕЦСТРОЙ"', '143406, МОСКОВСКАЯ ОБЛ, КРАСНОГОРСК Г, ЖЕЛЕЗНОДОРОЖНАЯ УЛ, ДОМ 23', '1133332001770', '3303010525', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (404, 'ООО "ГК "АЛЬЯНС"', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ШОССЕ МОСКОВСКОЕ, 5 А', '1113340005063', '3329067830', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (405, 'ООО "ГЛАССТЕКС"', '600022, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, СТАВРОВСКАЯ УЛ, ДОМ 10, ЛИТЕР В, ОФИС 2', '1103327002008', '3327848443', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (406, 'ООО "ГНЁЗДЫШКО"', '600037, Владимирская область, г Владимир, Ленинский район, ул Фатьянова, д 12, офис 3', '1113327013656', '3327107710', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (407, 'ООО "НовоГрад"', '153031, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ЛИНИЯ 23-Я, ДОМ 13, ОФИС 311', '1193702013152', '3702221599', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (408, 'ТСЖ "Панина"', '153048, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, МИКРОРАЙОН 30-Й, Д. 4', '1053701085712', '3702073238', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (409, 'ООО "Заря"', '155663, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ПЕСТЯКОВСКИЙ, СЕЛО НИЖНИЙ ЛАНДЕХ, УЛИЦА ШКОЛЬНАЯ, 2А', '1123720000150', '3720006178', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (410, 'ООО "Русфонд"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА КАЛИНИНА, ДОМ 10, ПОМЕЩЕНИЕ 1006, КОМНАТА 3', '1173702019072', '3702184435', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (411, 'ООО УК "ИВТЕКМАШ"', '153043, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КАЛАШНИКОВА, ДОМ 28И, ЛИТЕР А69-А76, ПОМЕЩЕНИЕ 1', '1103702014305', '3702620530', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (412, 'Ивановский городской комитет по управлению имуществом', '153000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПЛОЩАДЬ РЕВОЛЮЦИИ, ДОМ 6', '1023700533504', '3728012631', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (413, 'ЖСК "Коммунальник-2"', '153038, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА МАРШАЛА ВАСИЛЕВСКОГО, 16', '1033700087387', '3728014678', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (414, 'ООО "Тримакс"', '153000, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, 13', '1033700063100', '3729009180', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (415, 'Шуйское МУП ОК и ТС', '155908, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ШУЙСКИЙ, ГОРОД ШУЯ, УЛИЦА КООПЕРАТИВНАЯ, 31', '', '3706001241', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (416, 'ЖСК "Локомотив-2"', '153035, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ГЕНЕРАЛА ХЛЕБНИКОВА, 14', '', '3728024281', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (417, 'ООО "ПАРТНЕР"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ЖАРОВА, ДОМ 3, ПОМЕЩЕНИЕ 3003', '1153702026312', '3702124404', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (418, 'ООО "ИНВЕСТЭНЕРГО"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ИВАНОВСКАЯ, ДОМ 18', '1163702078704', '3711044459', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (419, 'АНО СОЦ "СПОРТЛАНДИЯ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ПУШКИНА, 28', '', '3702005968', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (420, 'ООО "АЛЬФАТЕХГАРАНТ"', '155120 ИВАНОВСКАЯ ОБЛАСТЬ РАЙОН ЛЕЖНЕВСКИЙ ПОСЕЛОК ЛЕЖНЕВОУЛИЦА ОКТЯБРЬСКАЯ 3', '', '3711024445', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (421, 'ООО "Комстар"', '153022, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ТАНКИСТА АЛЕКСАНДРОВА, 2А', '', '3702724352', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (423, 'ТСЖ "Наш Дом"', '153012, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА САДОВАЯ, 36', '', '3702580693', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (426, 'ОБУЗ "Кинешемская ЦРБ"', '155801, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА НАГОРНАЯ, 18', '', '3703007051', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (430, 'ООО "Синтеко"', '603073, НИЖЕГОРОДСКАЯ ОБЛАСТЬ, ГОРОД НИЖНИЙ НОВГОРОД, УЛИЦА АДМИРАЛА НАХИМОВА, ДОМ 14, ПОМЕЩЕНИЕ ВП2', '', '5258144944', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (432, 'ООО "КУРОРТ ОБОЛСУНОВО"', '155053, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ТЕЙКОВСКИЙ, СЕЛО ОБОЛСУНОВО', '1033700472002', '3724004407', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (435, 'ОБУЗ ВИЧУГСКАЯ ЦРБ', '155331, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ВИЧУГСКИЙ, ГОРОД ВИЧУГА, УЛИЦА БОЛЬНИЧНАЯ, 1', '1023700509470', '3701002964', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (437, 'ГСК "ПОЛЕТ-2"', '153014, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПОЧТОВОЕ ОТДЕЛЕНИЕ 14-Е, ДОМ 312, КВАРТИРА 69', '1163702084281', '3702169268', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (439, 'ООО "Санаторий имени Станко"', '155823, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО СТАНКО', '', '3713005769', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (441, 'ОБУЗ ИЛЬИНСКАЯ ЦРБ', '155060, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИЛЬИНСКИЙ, ПОСЕЛОК ИЛЬИНСКОЕ-ХОВАНСКОЕ, УЛИЦА СОВЕТСКАЯ, 44', '', '3712000503', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (422, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ДОБРОЕ"', '600031 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ДОБРОСЕЛЬСКАЯ 197Б', '1123340001542', '3329070871', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (424, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ДУБРАВА 2"', '601506, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА ТРАНСПОРТНАЯ, 16, 14', '1143304000696', '3304023767', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (425, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ДУБРАВА-2"', '600022 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА НИЖНЯЯ ДУБРОВА 40', '1083327005838', '3327840780', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (427, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЖИЛАЯ ВСТАВКА"', '600001, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, 5А', '1053301265203', '3302014686', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (428, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЖИЛИЩНЫЙ КООПЕРАТИВ № 24"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИХАЙЛОВСКАЯ, 12', '1063328029819', '3328445260', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (429, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЖИЛИЩНЫЙ КООПЕРАТИВ № 3"', '600026, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ГОРЬКОГО, 91', '1063328031140', '3328446360', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (431, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЖИЛИЩНО-СТРОИТЕЛЬНЫЙ КООПЕРАТИВ № 18"', '600017, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА МИХАЙЛОВСКАЯ, 4', '1063328004750', '3328441210', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (433, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЗАРЯ"', '601503, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА КАХОВСКОГО, 12', '1133304000026', '3304022629', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (434, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЗАСТАВА"', '600901, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА МИХАЛЬКОВА (ЮРЬЕВЕЦ МКР.), 15,', '1033301820804', '3327306521', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (436, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЗОЛОТОЕ КОЛЬЦО"', '600017, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА КИРОВА, 3-А', '1033302008486', '3328303026', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (438, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КАРЛА МАРКСА 2"', '601337, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КАМЕШКОВСКИЙ, ПОСЕЛОК ИМ КАРЛА МАРКСА, УЛИЦА КАРЛА МАРКСА, 2, 28', '1093336000889', '3315095227', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (440, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КАРЛА МАРКСА 4"', '601337, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КАМЕШКОВСКИЙ, ПОСЕЛОК ИМ КАРЛА МАРКСА, УЛИЦА КАРЛА МАРКСА, 4, 29', '1093336001087', '3315095393', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (442, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КИРКИЖА 14Б"', '601900, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА КИРКИЖА, ДОМ 14, КОРПУС Б, КВАРТИРА 61', '1183328013791', '3305799224', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (444, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КОМФОРТ"', '600018 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА КОМИССАРОВА ДОМ 14 КВАРТИРА 3', '1143340001090', '3329075380', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (446, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КОНДОМИНИУМ № 2"', '600001, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ПИЧУГИНА, ДОМ 14', '1033301809881', '3327315043', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (448, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КРАСНОАРМЕЙСКАЯ 43Г"', '600021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КРАСНОАРМЕЙСКАЯ, 43Г', '1103327006012', '3327851830', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (450, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КРЭДО"', '600033, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА 2-Я КОЛЬЦЕВАЯ, 31Б, 7', '1073300000102', '3327829000', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (451, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ЛЕНИНА-44"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, 44, 1А', '1053301265170', '3327821963', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (452, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "МАЯК"', '601503 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ УЛИЦА МАЯКОВСКОГО 8А', '1083304000284', '3304016142', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (453, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "НА 3-ЕЙ КОЛЬЦЕВОЙ"', '600033, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА 3-Я КОЛЬЦЕВАЯ, 25 А', '1053301274333', '3327822396', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (443, 'ООО "СНЕТИНОВСКИЙ НП"', '155531, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН ФУРМАНОВСКИЙ, ДЕРЕВНЯ СНЕТИНОВО, ДОМ 14', '', '3705009488', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (445, 'ООО "Инжспецстройсервис"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, 52', '', '3729025866', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (447, 'ОАО "Экспериментальный завод "Импульс"', '153442, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СВОБОДНАЯ, 2', '', '3728000594', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (449, 'АО ПО ТУРИЗМУ, ОТДЫХУ И ЛЕЧЕНИЮ (Г.ИВАНОВО)', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА НАБЕРЕЖНАЯ, 9', '', '3729006334', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (454, 'ГАУДПО ИО "УНИВЕРСИТЕТ НЕПРЕРЫВНОГО ОБРАЗОВАНИЯ И ИННОВАЦИЙ"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА БОЛЬШАЯ ВОРОБЬЕВСКАЯ, 80', '1023700556362', '3731000964', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (455, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "НАШ ДОМ-38"', '601785, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА 3 ИНТЕРНАЦИОНАЛА, 38', '1073300000157', '3306010971', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (456, 'ООО "ГОРСТРОЙ"', '153031, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ЛИНИЯ 23-Я, ДОМ 13, ЭТАЖ 3 ОФИС 327', '1104401000571', '4401104935', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (457, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "НАШ ДОМ-19"', '601500 ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА КУРЛОВСКАЯ, 19, 10', '1103304001129', '3304020117', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (458, 'МУП "ИПТ"', '153009, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ЛЕЖНЕВСКАЯ, 181', '', '3702080387', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (459, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "НИВА"', '601505, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА МИКРОРАЙОН, ДОМ 36, КВАРТИРА 46', '1033300204520', '3304005415', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (460, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "НОВО-ЯМСКАЯ 31-А"', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА НОВО-ЯМСКАЯ, 31, А, 2', '1033301810002', '3327322474', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (461, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ПАРУС"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СЕМАШКО, 8', '1143327000850', '3327120164', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (462, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ПОЛИНЫ ОСИПЕНКО 11"', '600009, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ПОЛИНЫ ОСИПЕНКО, 11', '1133328006514', '3328493828', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (463, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "РАЗИНА 12"', '600001, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА РАЗИНА, 12', '1113327006715', '3327104469', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (465, 'ООО "ИВЦЕНТРСНАБ - К"', '153032, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, ДОМ 11', '', '3728032229', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (464, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "СВЕТЛАНА"', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЗАВАДСКОГО, 11', '1093327002988', '3327843903', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (466, 'ООО "ТрансСервис"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, 23', '', '3702594008', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (467, 'ИОО ПП КОММУНИСТИЧЕСКАЯ ПАРТИЯ КОММУНИСТЫ РОССИИ', '153048, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА ГЕНЕРАЛА ХЛЕБНИКОВА, 48, 39', '', '3702950760', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (468, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "СОГЛАСИЕ-15А"', '601505, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА МЕНДЕЛЕЕВА, 15А, 52', '1093304001515', '3304018566', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (469, 'ООО "ДомСтрой"', '155808, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД КИНЕШМА, УЛИЦА ПАРКОВАЯ, ДОМ 2А, ПОМЕЩЕНИЕ 1004', '1153703001022', '3703019184', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (470, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "СТРОИТЕЛЬ -2"', '600033, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СУЩЕВСКАЯ, 7, 111', '1033301808253', '3327319785', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (471, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ТАТЬЯНА"', '601503, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА МЕНДЕЛЕЕВА, 25, 30', '1093304001152', '3304018284', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (472, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ТЕЗА"', '600035, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БЕЗЫМЕНСКОГО, 9Д', '1103340005966', '3329064236', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (473, 'ООО "ДЕНФО"', '153002, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, ПЕРЕУЛОК ПОСАДСКИЙ, ДОМ 4, ОФИС 302', '', '3702219014', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (474, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ТОПОЛЬ"', '600021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ГОРОДОК ПЕРЕКОПСКИЙ ВОЕННЫЙ, 25', '1043301814687', '3327818336', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (475, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ТСЖ-10"', '601505, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА МИКРОРАЙОН, 32, 39', '1093304000965', '3304018238', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (476, 'ТСН "ТАШКЕНТСКАЯ 110"', '153032, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ТАШКЕНТСКАЯ, ДОМ 110', '', '3702228509', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (477, 'ООО "Инженерная коммуникационная компания"', '153040, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ СТРОИТЕЛЕЙ, 94', '', '3702643760', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (478, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ФОРТУНА"', '600027, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КОМИССАРОВА, 9', '1083340001580', '3329048964', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (479, 'ООО "Добро"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТЕПАНОВА, ДОМ 5, ОФИС 302', '1153702010725', '3702109043', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (480, 'ООО"МАРКИЗА"', '153025 ИВАНОВСКАЯ ОБЛАСТЬ ГОРОД ИВАНОВО УЛИЦА ДЗЕРЖИНСКОГО ДОМ 39 ОФИС 9', '1063702093058', '3702088925', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (481, 'АО "ПАНОВО"', '155624, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ПАЛЕХСКИЙ, ДЕРЕВНЯ ПАНОВО, УЛИЦА ЦЕНТРАЛЬНАЯ, ДОМ 30', '', '3717005093', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (482, 'ЗАО ПМК "РЕШМА"', '155841, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, ДЕРЕВНЯ ДЬЯЧЕВО', '', '3713000023', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (483, 'ООО "ПРОФСЕРВИСТРЕЙД"', '125167, МОСКВА ГОРОД, ПРОСПЕКТ ЛЕНИНГРАДСКИЙ, ДОМ 47, СТРОЕНИЕ 2, КОМНАТА 29', '', '7707820378', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (484, 'ЦЕНТРАЛЬНОЕ УПРАВЛЕНИЕ ФЕДЕРАЛЬНОЙ СЛУЖБЫ ПО ЭКОЛОГИЧЕСКОМУ, ТЕХНОЛОГИЧЕСКОМУ И АТОМНОМУ НАДЗОРУ', '107031, ГОРОД МОСКВА, УЛИЦА РОЖДЕСТВЕНКА, 5/7', '', '7702609639', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (485, 'АО "ЛИДЕР"', '153022, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА БОГДАНА ХМЕЛЬНИЦКОГО, ДОМ 44, ПОМЕЩЕНИЕ ЧАСТЬ 1029', '', '3702644996', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (487, 'ООО "ТАЙФУН Медиа"', '153004 ИВАНОВСКАЯ ОБЛАСТЬ ГОРОД ИВАНОВО ПЛОЩАДЬ ВОКЗАЛЬНАЯ 3', '', '3702031213', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (488, 'ТСЖ "Чайка-2"', '153008, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КОЛЕСАНОВА, 9', '', '3728015343', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (489, 'ТСН "На Пролетарской"', '153012, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПРОЛЕТАРСКАЯ, ДОМ 44 А, КВАРТИРА 13', '', '3702175529', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (490, 'ООО "АВЕРС"', '153006, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОЕЗД 11-Й, ДОМ 2, ОФИС 202', '', '3728002520', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (492, 'МУП "МУО" ГОРОДА ИВАНОВА', '153003, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПАРИЖСКОЙ КОММУНЫ, ДОМ 7, ОФИС 12', '', '3702115470', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (494, 'ТСЖ "Мир"', '153045, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА ПОБЕДЫ, 12', '1063702139490', '3702098056', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (495, 'ООО АН "ПРОФЕССИОНАЛ"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КОМСОМОЛЬСКАЯ, 8, 26', '1033700125250', '3702049500', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (496, 'ТСЖ "РОЖДЕСТВЕНСКОЕ"', '153051, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, МИКРОРАЙОН РОЖДЕСТВЕНСКИЙ, ДОМ 6', '', '3702180783', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (497, 'ФГБУЗ МЦ "РЕШМА" ФМБА РОССИИ', '155841, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, ТЕРРИТОРИЯ МЦ РЕШМА, ДОМ 1', '', '3713003497', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (498, 'ООО "САТУРН СЕРВИС"', '153000, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА СТЕПАНОВА, ДОМ 5, ОФИС 215', '', '3702174243', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (499, 'ООО СП ЖКХ "ЖИЛИЩНИК"', '153002, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, ПРОСПЕКТ ЛЕНИНА, ДОМ 23, ПОМЕЩЕНИЕ 1002', '', '3702183640', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (501, 'ООО "Народная управляющая компания"', '153003, ОБЛАСТЬ ИВАНОВСКАЯ, ГОРОД ИВАНОВО, УЛИЦА КРАСНЫХ ЗОРЬ, ДОМ 15 А, ОФИС 220', '', '3711034531', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (502, 'ЖСК "Сосновый бор"', '153027, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА 2-Я ЛАГЕРНАЯ, 52, 80', '', '3730005952', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (486, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ № 136', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЮБИЛЕЙНАЯ, 8', '1113340005393', '3329066339', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (491, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ТСЖ № 62"', '600014, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА БЕЛОКОНСКОЙ, 19А', '1063328023098', '3328442380', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (493, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "ДОБРОЕ"', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 197Б', '1123340001542', '3329070871', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (500, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "КИРОВА 6"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КИРОВА, 6', '1043302002809', '3328305055', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (503, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ "СЕВЕРНАЯ 108"', '600007, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СЕВЕРНАЯ, 108, 1', '1143328000155', '3328494081', 3, 5, NULL);

--
-- Data for table public.clientlist (OID = 16474) (LIMIT 500,68)
--
INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (504, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ ЖИЛЬЯ -94', '600028, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЛАКИНА, 157Б', '1103327003724', '3327850072', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (505, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "2 КОЛЬЦЕВАЯ, 70"', '600033, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА 2-Я КОЛЬЦЕВАЯ, ДОМ 70', '1153327002300', '3327127667', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (506, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "АСТРА"', '601503 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ УЛИЦА КАХОВСКОГО ДОМ 10А КВАРТИРА 4', '1163328067341', '3314008408', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (507, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ВОСХОД"', '601202, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА ЛЕНИНА, ДОМ 18А, КВАРТИРА 15', '1153327001090', '3309005176', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (508, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ГАРАНТ"', '601508, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА ПОЛЕВАЯ, ДОМ 5, КВАРТИРА 54', '1173328012296', '3304025651', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (509, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ГОГОЛЯ 1А"', '601204, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СОБИНСКИЙ, ГОРОД СОБИНКА, УЛИЦА ГОГОЛЯ, ДОМ 1А, КВАРТИРА 47', '1193328009380', '3309006363', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (510, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "КВАРТАЛ-1"', '600023, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ШОССЕ СУДОГОДСКОЕ, ДОМ 45, КВАРТИРА 16', '1033303405783', '3329023078', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (511, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "КОМФОРТ"', '600027, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СУЗДАЛЬСКИЙ, ДОМ 15, КВАРТИРА 16', '1173328008094', '3329090564', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (512, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ЛИДЕР"', '601785, ОБЛАСТЬ ВЛАДИМИРСКАЯ, РАЙОН КОЛЬЧУГИНСКИЙ, ГОРОД КОЛЬЧУГИНО, УЛИЦА УЛЬЯНОВСКАЯ, ДОМ 33', '1023300713391', '3306005467', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (513, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ЛУЧ"', '600028, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СТРОИТЕЛЕЙ, 13Б, ПОМЕЩЕНИЕ 01', '1143327006250', '3327124761', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (514, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "МИР-ВЛАДИМИР"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, ДОМ 15', '1153328002574', '3328004594', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (515, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "НИЖНЯЯ ДУБРОВА 46"', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА НИЖНЯЯ ДУБРОВА, ДОМ 46, КВАРТИРА 35', '1153327003356', '3327128558', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (516, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "РУБИН"', '600037, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ФАТЬЯНОВА, ДОМ 6, КВАРТИРА 111', '1173328012626', '3327138250', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (517, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "СОДРУЖЕСТВО"', '601501, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, ПРОСПЕКТ ТЕПЛИЦКИЙ, ДОМ 43, КВАРТИРА 32', '1123304000038', '3304021713', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (518, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "СТРЕЛЕЦКАЯ СЛОБОДА"', '600021, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА СТРЕЛЕЦКАЯ, ДОМ 2, ПОМЕЩЕНИЕ 12', '1153327006128', '3327131166', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (519, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ТЕПЛЫЙ ДОМ"', '600903, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ЛЕСНАЯ (ЛЕСНОЙ МКР.), ДОМ 10, КВАРТИРА 37', '1153340002760', '3329081545', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (520, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ТСН-35"', '601508, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, ПРОСПЕКТ 50 ЛЕТ СОВЕТСКОЙ ВЛАСТИ, ДОМ 35, КВАРТИРА 81', '1193328000029', '3304026214', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (521, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ЭЛЛАДА"', '601505, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА ДИМИТРОВА, ДОМ 31, КВАРТИРА 21', '1083304000658', '3304016343', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (522, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ АО ВТЗ (№10 АО ВТЗ)', '600028 ВЛАДИМИРСКАЯ ОБЛАСТЬ ГОРОД ВЛАДИМИР УЛИЦА ЛАКИНА ДОМ 149А КВАРТИРА 47', '1153328001793', '3328003167', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (523, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ "ЛЕНИНА 42"', '600015, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, ДОМ 42', '1153327002267', '3327127628', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (524, 'ТОВАРИЩЕСТВО СОБСТВЕННИКОВ НЕДВИЖИМОСТИ-41', '600037, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ВЕРХНЯЯ ДУБРОВА, ДОМ 41', '1153327002707', '3327127988', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (525, 'УЧРЕЖДЕНИЕ ОБЩЕСТВЕННОГО ОБЪЕДИНЕНИЯ "ВЛАДИМИРСКИЙ ОБЛАСТНОЙ ЦЕНТР ПРОФСОЮЗОВ"', '600032, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 217', '1023303352973', '3329007904', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (526, 'УЧРЕЖДЕНИЕ ОБЩЕСТВЕННОГО ОБЪЕДИНЕНИЯ "УПРАВЛЕНИЕ ПО ХОЗЯЙСТВЕННОМУ ОБСЛУЖИВАНИЮ ОБЪЕДИНЕНИЯ ПРОФСОЮЗОВ"', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ГОРЬКОГО, 50', '1033302007815', '3328300508', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (527, 'УПРАВЛЕНИЕ ФЕДЕРАЛЬНОЙ СЛУЖБЫ ВОЙСК НАЦИОНАЛЬНОЙ ГВАРДИИ РОССИЙСКОЙ ФЕДЕРАЦИИ ПО ВЛАДИМИРСКОЙ ОБЛАСТИ', '600027, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СУЗДАЛЬСКИЙ, ДОМ 21Б', '1163328066880', '3328015437', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (528, 'УПРАВЛЕНИЕ ФЕДЕРАЛЬНОЙ СЛУЖБЫ ПО ВЕТЕРИНАРНОМУ И ФИТОСАНИТАРНОМУ НАДЗОРУ ПО ВЛАДИМИРСКОЙ ОБЛАСТИ', '600000, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА НОВО-ГОНЧАРНАЯ, ДОМ 2', '1053301538773', '3328103250', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (529, 'ЧАСТНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ПРОФЕССИОНАЛЬНОГО ОБРАЗОВАНИЯ УЧЕБНЫЙ ЦЕНТР "БИК"', '601910, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД КОВРОВ, УЛИЦА ПУГАЧЕВА, ДОМ 32', '1053301821066', '3305052489', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (530, 'ФЕДЕРАЛЬНОЕ АВТОНОМНОЕ УЧРЕЖДЕНИЕ МИНИСТЕРСТВА ОБОРОНЫ РОССИЙСКОЙ ФЕДЕРАЦИИ "ЦЕНТРАЛЬНЫЙ СПОРТИВНЫЙ КЛУБ АРМИИ"', '125167, ГОРОД МОСКВА, ПРОСПЕКТ ЛЕНИНГРАДСКИЙ, 39, 29', '1037714063078', '7714317863', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (531, 'ФЕДЕРАЛЬНОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ ЗДРАВООХРАНЕНИЯ "ЦЕНТР ГИГИЕНЫ И ЭПИДЕМИОЛОГИИ В ВЛАДИМИРСКОЙ ОБЛАСТИ"', '600005, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, УЛИЦА ТОКАРЕВА, 5', '1053301228243', '3327819890', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (532, 'ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ "ГЛАВНОЕ ВОЕННО-СТРОИТЕЛЬНОЕ УПРАВЛЕНИЕ № 5"', '410033, ОБЛАСТЬ САРАТОВСКАЯ, ГОРОД САРАТОВ, УЛИЦА СПАРТАКА, 4', '1026403045261', '6453050402', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (533, 'ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ "ГОСУДАРСТВЕННОЕ НАУЧНО-ПРОИЗВОДСТВЕННОЕ ПРЕДПРИЯТИЕ "КРОНА"', '600036, ОБЛАСТЬ ВЛАДИМИРСКАЯ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ЛЕНИНА, 73', '1023301286733', '3327101250', 3, 5, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (534, 'ООО "ГРАНДСЕРВИС"', '600022, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ВАСИЛИСИНА, ДОМ 13, ЭТАЖ 1, ПОМЕЩЕНИЕ 1, 1А, 1Б', '1083327002373', '3327837219', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (535, 'ООО "ГХЗ"', '601500, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА КАЛИНИНА, 28', '1123304000786', '3304022210', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (536, 'ООО "ДЕЛЬТА М"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОЕЗД ПРОМЫШЛЕННЫЙ, ДОМ 1, ЭТАЖ 2, ПОМЕЩЕНИЕ 1', '1063340023306', '3329040387', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (537, 'ООО "ЕЛЕНА"', '601900, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА АБЕЛЬМАНА, 124', '1063332011544', '3305055391', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (538, 'ООО "ЖИЛСТРОЙСТАНДАРТ"', '600901, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ГОРОДОК ИНСТИТУТСКИЙ (ЮРЬЕВЕЦ МКР.), ДОМ 3', '1183328007774', '3327140700', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (539, 'ООО "ЖСС"', '600017, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, ДОМ 22, ЭТАЖ ЦОКОЛЬ, ПОМЕЩЕНИЕ 16', '1193328003857', '3328022709', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (540, 'ООО "ЖЭУ - 1"', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДОБРОСЕЛЬСКАЯ, 195В', '1093340000115', '3329053548', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (541, 'ООО "ИНТРА-ШЕЙП"', '600001, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА НОВО-ЯМСКАЯ, ДОМ 79, ЛИТЕР Б ЭТАЖ 1, ПОМЕЩЕНИЕ 1А', '1173328003089', '3327136326', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (542, 'ООО "ИСТОРИЧЕСКИЙ ЦЕНТР"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА МИРА, 15Б, ОФИС 1', '1123328007186', '3328486732', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (543, 'ООО "ИФК"', '600033, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СКЛАДСКАЯ, 11', '1083327002450', '3327837297', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (544, 'ООО "КВАЗАР"', '601110, Владимирская область, Петушинский район, г Костерево, ул Писцова,50/13', '1033301809584', '3327317139', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (545, 'ООО "КВАРТАЛ"', '600021, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ПУШКАРСКАЯ, 46, ОФИС 415', '1053301251123', '3327821280', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (546, 'ООО "КОВРОВПРОЕКТ"', '601907, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД КОВРОВ, УЛИЦА ПЕРШУТОВА, 25', '1023301954103', '3305038029', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (547, 'ООО "КОМПАНИЯ "ВЕБ ЭВЕРЕСТ ЦЕНТР"', '600003, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА 1-Я ПИОНЕРСКАЯ, ДОМ 80Б, ЭТАЖ 4, ПОМЕЩЕНИЕ 9', '1033302002810', '3329026150', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (548, 'ООО "КОМСЕРВИС +"', '601967, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН КОВРОВСКИЙ, ПОСЕЛОК МЕЛЕХОВО, ПЕРЕУЛОК ШКОЛЬНЫЙ, ДОМ 21, ПОМЕЩЕНИЕ 14,15', '1083332002005', '3317012184', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (549, 'ООО "КОРОБЕЙНИКИ"', '601293, ВЛАДИМИРСКАЯ ОБЛ, СУЗДАЛЬСКИЙ Р-Н, СУЗДАЛЬ Г, ПАРИЖСКОЙ КОММУНЫ УЛ, 29, 1', '1083336000241', '3310005580', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (550, 'ООО "КРОКУС"', '600005, ВЛАДИМИРСКАЯ ОБЛ, ВЛАДИМИР Г, КРАСНОЗНАМЕННАЯ УЛ, 1', '1103340001379', '3329059853', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (551, 'ООО "КУРОРТ"', '423639, ТАТАРСТАН РЕСПУБЛИКА, РАЙОН ЕЛАБУЖСКИЙ, ГОРОД ЕЛАБУГА, УЛИЦА КАЗАНСКАЯ, ДОМ 4А, ЭТАЖ/ПОМЕЩ 0/33', '1172375025954', '2367000440', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (552, 'ООО "КЭПИТАЛ ГРУПП"', '123290, МОСКВА Г, МАГИСТРАЛЬНЫЙ 1-Й ТУП, 11, СТР.1, ОФИС 1', '1117746146847', '7714832286', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (553, 'ООО "МАРКЕТ-ЦЕНТР"', '600014, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА ДРУЖБЫ, ДОМ 64', '1023301463844', '3302013266', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (554, 'ООО "МАСЛА И СМАЗКИ"', '350912, КРАСНОДАРСКИЙ КРАЙ, ГОРОД КРАСНОДАР, УЛИЦА ИМ. ЕВДОКИИ БЕРШАНСКОЙ (ПАШКОВСКИЙ ЖИЛОЙ, ДОМ 345/11', '1122312000370', '2312188320', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (555, 'ООО "МЕЧТА"', '600017, Владимирская область, г Владимир, ул Горького,38', '1033302001842', '3302003395', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (556, 'ООО "МОДЕЛЬ БЕТОН"', '601012, ВЛАДИМИРСКАЯ ОБЛ, КИРЖАЧСКИЙ Р-Н, КИРЖАЧ Г, КОСМОНАВТОВ УЛ, ДОМ 1А, СТРОЕНИЕ 2', '1153316154452', '3316008428', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (557, 'ООО "МОЙ ДОМ"', '600031, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ СУЗДАЛЬСКИЙ, 3', '1053303616684', '3329034827', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (558, 'ООО "МОНОСТРОЙ"', '117452, МОСКВА Г, ЧЕРНОМОРСКИЙ Б-Р, ДОМ 17, КОРПУС 1, ЭТ 2 ПОМ II КОМ 5', '1033303401636', '3329011322', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (559, 'ООО "НЕФТЕРЕСУРС"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА КУЛИБИНА, ДОМ 10, ЭТАЖ 1, ОФИС 1', '1063328032680', '3328447557', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (560, 'ООО "НПО СТРОЙ"', '601915, ВЛАДИМИРСКАЯ ОБЛАСТЬ, Г КОВРОВ, УЛ КОМСОМОЛЬСКАЯ,99.', '1053301844221', '3305053250', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (561, 'ООО "ОКТОБЕРФЕСТ"', '601501, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ГУСЬ-ХРУСТАЛЬНЫЙ, УЛИЦА ИНТЕРНАЦИОНАЛЬНАЯ, ДОМ 40', '1123304001325', '3304022410', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (562, 'ООО "Орбита"', '600007, Владимирская область, г Владимир, ул Северная, д 63б, офис 7', '1123327001940', '3327110173', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (563, 'ООО "ОРИОН ПЛЮС"', '600028, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БАЛАКИРЕВА, ДОМ 47А, ОФИС 15', '1183328000184', '3327139221', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (564, 'ООО "ПАРНАС"', '600000, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ МОСКОВСКАЯ, ДОМ 14А, ЭТАЖ 1, ПОМЕЩЕНИЕ 1', '1193328009489', '3329096823', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (565, 'ООО "ПАРТНЕРЪ"', '600020, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА БОЛЬШАЯ НИЖЕГОРОДСКАЯ, 50, 24', '1033303409292', '3329028654', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (566, 'ООО "ПЛАНЕТА"', '140000, МОСКОВСКАЯ ОБЛАСТЬ, ГОРОД ЛЮБЕРЦЫ, УЛИЦА КРАСНАЯ, ДОМ 4, ЦОКОЛЬ ОФИС 14', '1055013006773', '5027106966', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (567, 'ООО "ПОЛИКЛИНИКА-АВТОПРИБОР"', '600005, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, ПРОСПЕКТ ОКТЯБРЬСКИЙ, ДОМ 27, СЕКЦИЯ/ ПОДЪЕЗД 3/3,4, ЭТАЖ/ПОМЕЩЕНИЕ 2/2', '1043303406937', '3329032851', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (568, 'ООО "ПРОДСЕРВИС"', '601130, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН ПЕТУШИНСКИЙ, ПОСЕЛОК ГОРОДИЩИ, УЛИЦА ЛЕНИНА, 12', '1053300638357', '3321021167', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (569, 'ООО "РЕАЛ"', '601261, ВЛАДИМИРСКАЯ ОБЛАСТЬ, РАЙОН СУЗДАЛЬСКИЙ, ПОСЕЛОК НОВЫЙ, УЛИЦА ЦЕНТРАЛЬНАЯ, 5', '1063336001684', '3310004642', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (570, 'ООО "РЕАЛСТРОЙИНВЕСТ-М"', '123100, МОСКВА Г, ЗВЕНИГОРОДСКАЯ 2-Я УЛ, ДОМ 12, СТРОЕНИЕ 1, ЭТ 2 ПОМ I КОМ 2-9', '1087746655370', '7703666510', 1, 6, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (571, 'ООО "РЕГИОН АВТО"', '600009, ВЛАДИМИРСКАЯ ОБЛАСТЬ, ГОРОД ВЛАДИМИР, УЛИЦА СУЗДАЛЬСКАЯ, ДОМ 11, ЭТАЖ 2, ОФИС 6', '1033302006264', '3328416870', 1, 6, NULL);

--
-- Data for table public.delegatelist (OID = 16485) (LIMIT 0,37)
--
INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (2, 'Карпова Татьяна Сергеевна', '+ 7 (4922) 37-87-12', 'от 26.08.2020', 1, 3, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (4, 'Корнева Анна Валерьевна', '+7 (4932) 58-91-37', '37/30-н/37-2020-1-180 от 22.01.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (5, 'Косарева Алёна Алексеевна', '+7 (4932) 58-90-13', '37/30-н/37-2020-1-181 от 22.01.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (6, 'Соколова Алла Юрьевна', '+7 (4932) 58-90-97', '37/30-н/37-2020-1-172 от 22.01.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (7, 'Косарева Алёна Алексеевна', '+7 (4932) 58-90-13', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (8, 'Корнева Анна Валерьевна', '+7 (4932) 58-91-37', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (9, 'Соколова Алла Юрьевна', '+7 (4932) 58-90-97', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (10, 'Косульникова Екатерина Михайловна', '+7 (4932) 58-90-52', '37/30-н/37-2020-4-683 от 26.08.2020', 1, 7, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (1, 'Соколова Алла Юрьевна', '+7 (4932) 58-90-97', '', 1, 3, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (11, 'Мухина Ольга Андреевна', '+7 (4932) 93-73-04 доб. 34-19', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (12, 'Мухина Ольга Андреевна', '+7 (4932) 93-73-04 доб. 34-19', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (13, 'Кочеткова Наталья Владимировна', '+7 (4932) 93-73-04 доб. 39-35', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (14, 'Кочеткова Наталья Владимировна', '+7 (4932) 93-73-04 доб. 39-35', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (15, 'Барашкина Юлия Павловна', '+7 (4932) 93-73-04 доб. 34-33', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (16, 'Барашкина Юлия Павловна', '+7 (4932) 93-73-04 доб. 34-33', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (17, 'Мышкина Мария Геннадьевна', '+7 (4932) 93-73-04 доб. 34-51', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (18, 'Мышкина Мария Геннадьевна', '+7 (4932) 93-73-04 доб. 34-51', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (19, 'Мигунова Вера Александровна', '+7 (4932) 93-73-04 доб. 34-17', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (20, 'Мигунова Вера Александровна', '+7 (4932) 93-73-04 доб. 34-17', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (21, 'Наумова Юлия Олеговна', '+7 (4932) 93-73-04 доб. 39-27', '37/30-н/37-2020-4-685 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (22, 'Наумова Юлия Олеговна', '+7 (4932) 93-73-04 доб. 39-27', '37/30-н/37-2020-6-673 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (23, 'Никулина Татьяна Николаевна', '+7 (4932) 93-73-24', '37/30-н/37-2020-4-683 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (24, 'Земскова Ксения Андреевна', '+7 (4932) 93-73-21', '37/30-н/37-2020-4-684 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (25, 'Курилов Александр Владиславович', '+7 (4932) 93-73-04 доб. 34-60', '37/30-н/37-2020-4-684 от 26.08.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (26, 'Андрианова Анна Алексеевна', '+7 (4922) 37-87-11 доб. 28-35', '480 от 27.12.2019', 1, 6, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (27, 'Савинова Марина Евгеньевна', '+7 (4922) 37-87-11 доб. 28-36', '473 от 27.12.2019', 1, 6, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (29, 'Солин Сергей Юрьевич', '37-87-12, внутр.(674) 28-44', '27 от 14.01.2020', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (30, 'Петруничева Ксения Николаевна', '37-87-11, внутр.(674) 28-37', '31 от 14.01.2020', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (31, 'Мочалова Екатерина Михайловна', '37-87-11, внутр. (674) 28-38', '25 от 14.01.2020', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (32, 'Бадьева Екатерина Александровна', '37-87-12, внутр. (674)28-43', '29 от 14.01.2020', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (33, 'Макарова Ирина Эдуардовна', '37-87-12, внутр.(674)28-41', '482 от 27.12.2019', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (34, 'Карпова Татьяна Сергеевна', '37-87-12, внутр. (674) 28-42', '475 от 27.12.2019', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (35, 'Никулина Татьяна Николаевна', '+7 (4932) 93-73-24', '37/30-н/37-2020-1-178 от 22.01.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (36, 'Земскова Ксения Андреевна', '+7 (4932) 93-73-21', '37/30-н/37-2020-6-674 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (37, 'Курилов Александр Владиславович', '+7 (4932) 93-73-04 доб. 34-60', '37/30-н/37-2020-6-674 от 31.07.2020', 1, 8, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (28, 'Хицкова Анна Алексеевна', '37-87-11, внутр. (674) 28-40', '28 от 14.01.2020', 3, 5, NULL);

INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (3, 'Косульникова Екатерина Михайловна', '+7 (4932) 58-90-52', '37/30-н/37-2020-1-179 от 22.01.2020', 1, 7, NULL);

--
-- Data for table public.paramlist (OID = 16495) (LIMIT 0,9)
--
INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (1, 'clientlist', 'clientname', 'наименование/ФИО клиента', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (2, 'clientlist', 'clientadres', 'адрес клиента', 'memo');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (3, 'clientlist', 'clientogrn', 'ОГРН клиента', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (4, 'clientlist', 'clientinn', 'ИНН клиента', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (5, 'banklist', 'bankname', 'наименование кред.организации', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (6, 'banklist', 'bankadres', 'адрес кред.организации', 'memo');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (7, 'delegatelist', 'delegatename', 'ФИО представителя', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (8, 'delegatelist', 'delegatephone', 'Телефон представителя', 'edit');

INSERT INTO paramlist (paramid, paramtable, paramname, paramcaption, paramtype)
VALUES (9, 'delegatelist', 'delegateorder', 'Номер и дата доверенности', 'edit');

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
-- Data for sequence public.banklist_bankid_seq (OID = 16415)
--
SELECT pg_catalog.setval('banklist_bankid_seq', 42, true);
--
-- Data for sequence public.documentlist_documentid_seq (OID = 16436)
--
SELECT pg_catalog.setval('documentlist_documentid_seq', 7, true);
--
-- Data for sequence public.templatelist_templateid_seq (OID = 16447)
--
SELECT pg_catalog.setval('templatelist_templateid_seq', 4, true);
--
-- Data for sequence public.templateparamlist_templateparamid_seq (OID = 16464)
--
SELECT pg_catalog.setval('templateparamlist_templateparamid_seq', 19, true);
--
-- Data for sequence public.clientlist_clientid_seq (OID = 16472)
--
SELECT pg_catalog.setval('clientlist_clientid_seq', 571, true);
--
-- Data for sequence public.delegatelist_delegateid_seq (OID = 16483)
--
SELECT pg_catalog.setval('delegatelist_delegateid_seq', 37, true);
--
-- Data for sequence public.paramlist_paramid_seq (OID = 16493)
--
SELECT pg_catalog.setval('paramlist_paramid_seq', 9, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
