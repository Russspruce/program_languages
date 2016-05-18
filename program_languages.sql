--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: careers; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE careers (
    id integer NOT NULL,
    title character varying,
    description character varying
);


ALTER TABLE careers OWNER TO "Guest";

--
-- Name: careers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE careers_id_seq OWNER TO "Guest";

--
-- Name: careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE careers_id_seq OWNED BY careers.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying,
    example character varying,
    description character varying,
    date character varying,
    webpage character varying
);


ALTER TABLE languages OWNER TO "Guest";

--
-- Name: languages_careers; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_careers (
    id integer NOT NULL,
    language_id integer,
    career_id integer
);


ALTER TABLE languages_careers OWNER TO "Guest";

--
-- Name: languages_careers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_careers_id_seq OWNER TO "Guest";

--
-- Name: languages_careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_careers_id_seq OWNED BY languages_careers.id;


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO "Guest";

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: languages_programs; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_programs (
    id integer NOT NULL,
    language_id integer,
    program_id integer
);


ALTER TABLE languages_programs OWNER TO "Guest";

--
-- Name: languages_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_programs_id_seq OWNER TO "Guest";

--
-- Name: languages_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_programs_id_seq OWNED BY languages_programs.id;


--
-- Name: languages_types; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_types (
    id integer NOT NULL,
    language_id integer,
    type_id integer
);


ALTER TABLE languages_types OWNER TO "Guest";

--
-- Name: languages_types_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_types_id_seq OWNER TO "Guest";

--
-- Name: languages_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_types_id_seq OWNED BY languages_types.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying,
    description character varying,
    url character varying
);


ALTER TABLE programs OWNER TO "Guest";

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE programs_id_seq OWNER TO "Guest";

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE types (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE types OWNER TO "Guest";

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE types_id_seq OWNER TO "Guest";

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY careers ALTER COLUMN id SET DEFAULT nextval('careers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_careers ALTER COLUMN id SET DEFAULT nextval('languages_careers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_programs ALTER COLUMN id SET DEFAULT nextval('languages_programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_types ALTER COLUMN id SET DEFAULT nextval('languages_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Data for Name: careers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY careers (id, title, description) FROM stdin;
1	career 1	dfsf
\.


--
-- Name: careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('careers_id_seq', 1, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages (id, name, example, description, date, webpage) FROM stdin;
1	Test 1	example 1	description 1	date 1	\N
2	Test 2	example 2	description 2	date 2	\N
3	Test 3	example 3	description 3	date 3	\N
4	Language 1	Example 1	Description 1	2016-05-04	http://google.com
\.


--
-- Data for Name: languages_careers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_careers (id, language_id, career_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
\.


--
-- Name: languages_careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_careers_id_seq', 4, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_id_seq', 4, true);


--
-- Data for Name: languages_programs; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_programs (id, language_id, program_id) FROM stdin;
3	1	1
4	4	1
5	4	2
\.


--
-- Name: languages_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_programs_id_seq', 5, true);


--
-- Data for Name: languages_types; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_types (id, language_id, type_id) FROM stdin;
2	2	4
11	1	1
12	2	1
13	4	1
\.


--
-- Name: languages_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_types_id_seq', 13, true);


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY programs (id, name, description, url) FROM stdin;
1	Program 1		
2	Program 2		
3	Program 3		
\.


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('programs_id_seq', 3, true);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY types (id, name, description) FROM stdin;
1	type 1	fsadfsafdsfas
4	type 1	
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('types_id_seq', 4, true);


--
-- Name: careers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (id);


--
-- Name: languages_careers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_careers
    ADD CONSTRAINT languages_careers_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: languages_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_programs
    ADD CONSTRAINT languages_programs_pkey PRIMARY KEY (id);


--
-- Name: languages_types_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_types
    ADD CONSTRAINT languages_types_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

