-- SQL Manager Lite for PostgreSQL 6.1.2.53864
-- ---------------------------------------
-- Хост         : 10.24.0.64
-- База данных  : arlandbpg
-- Версия       : PostgreSQL 13.0, compiled by Visual C++ build 1914, 64-bit



SET search_path = public, pg_catalog;
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
-- Data for table public.banklist (OID = 16417) (LIMIT 0,13)
--
INSERT INTO banklist (bankid, bankname, bankadres, catalogid, personid, createpoint)
VALUES (3, 'ПАО "Сбербанк"', 'г. Владимир, Проспект Ленина, д. 36', 1, NULL, NULL);

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

--
-- Data for table public.documentlist (OID = 16438) (LIMIT 0,2)
--
INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, documenttypeid, casedate, casenumber, agentid, clientid, createpoint)
VALUES (2, 'Тестовый 1', 1, NULL, 1, 1, '2015-10-20', 'F-135-58-ND', 2, 1, '2020-10-18 19:02:01.830725');

INSERT INTO documentlist (documentid, documentname, catalogid, documentlink, personid, documenttypeid, casedate, casenumber, agentid, clientid, createpoint)
VALUES (3, 'Тестовый 2', 1, NULL, 1, 1, '2015-10-18', 'F-168_45-DF', 2, 2, '2020-10-18 19:02:40.206908');

--
-- Data for table public.templatelist (OID = 16449) (LIMIT 0,1)
--
INSERT INTO templatelist (templateid, templatename, catalogid, templatelink, personid, createpoint)
VALUES (4, 'Заявление в кред. орг. от АО ВКС', 1, '\\\\vla-ad02-fs01\\Work\\УПРДЗ\\Автоматизация\\Базашаблонов\\oripvladzakovks.docx', 4, '2020-10-20 15:53:47.292947');

--
-- Data for table public.clientlist (OID = 16474) (LIMIT 0,54)
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
VALUES (7, '"ФКУ КП-12 УФСИН России по Ивановской области"', '155828, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН КИНЕШЕМСКИЙ, СЕЛО ШИЛЕКША, УЛИЦА ЦЕНТРАЛЬНАЯ, 32', '1023701592001', '3713006811', 1, 8, NULL);

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
VALUES (25, 'АО "САВИНСКИЙ ТЕПЛОСЕРВИС"', '155710, ОБЛАСТЬ ИВАНОВСКАЯ, РАЙОН САВИНСКИЙ, ПОСЕЛОК САВИНО, УЛИЦА СОВЕТСКАЯ, Д. 24', '', '371102419', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (26, 'ОАО "Вичугская городская электросеть"', '155334, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ВИЧУГСКИЙ, ГОРОД ВИЧУГА, УЛИЦА ЛЕНИНГРАДСКАЯ, 26', '1043700000596', '3701006119', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (27, 'ООО "Промэнергосеть - Кохма"', '153510, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН ИВАНОВСКИЙ, ГОРОД КОХМА, УЛИЦА ИВАНОВСКАЯ, ДОМ 18, ЛИТЕР А, ПОМЕЩЕНИЕ 63', '1163702068606', '3711043800', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (28, 'ООО "Техносеть"', '153032, ИВАНОВСКАЯ ОБЛАСТЬ, ГОРОД ИВАНОВО, УЛИЦА СТАНКОСТРОИТЕЛЕЙ, ДОМ 1, ЛИТЕР А5, ПОМЕЩЕНИЕ 40', '1173702008435', '3702176071', 1, 8, NULL);

INSERT INTO clientlist (clientid, clientname, clientadres, clientogrn, clientinn, catalogid, personid, createpoint)
VALUES (29, 'МП "ЖКХ"', '155150, ИВАНОВСКАЯ ОБЛАСТЬ, РАЙОН КОМСОМОЛЬСКИЙ, ГОРОД КОМСОМОЛЬСК, УЛИЦА СОВЕТСКАЯ, ДОМ 7, ПОМЕЩЕНИЕ 1002', '1193702018553', '3704010748', 1, 8, NULL);

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

--
-- Data for table public.delegatelist (OID = 16485) (LIMIT 0,1)
--
INSERT INTO delegatelist (delegateid, delegatename, delegatephone, delegateorder, catalogid, personid, createpoint)
VALUES (1, 'Соколова Алла Юрьевна', '', '', 1, 3, NULL);

--
-- Data for table public.paramlist (OID = 16495) (LIMIT 0,6)
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

--
-- Data for sequence public.banklist_bankid_seq (OID = 16415)
--
SELECT pg_catalog.setval('banklist_bankid_seq', 15, true);
--
-- Data for sequence public.documentlist_documentid_seq (OID = 16436)
--
SELECT pg_catalog.setval('documentlist_documentid_seq', 1, false);
--
-- Data for sequence public.templatelist_templateid_seq (OID = 16447)
--
SELECT pg_catalog.setval('templatelist_templateid_seq', 4, true);
--
-- Data for sequence public.templateparamlist_templateparamid_seq (OID = 16464)
--
SELECT pg_catalog.setval('templateparamlist_templateparamid_seq', 1, false);
--
-- Data for sequence public.clientlist_clientid_seq (OID = 16472)
--
SELECT pg_catalog.setval('clientlist_clientid_seq', 57, true);
--
-- Data for sequence public.delegatelist_delegateid_seq (OID = 16483)
--
SELECT pg_catalog.setval('delegatelist_delegateid_seq', 1, true);
--
-- Data for sequence public.paramlist_paramid_seq (OID = 16493)
--
SELECT pg_catalog.setval('paramlist_paramid_seq', 6, true);
