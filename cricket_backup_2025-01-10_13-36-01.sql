--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
-- Dumped by pg_dump version 16.6 (Debian 16.6-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: batsmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batsmen (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    runs integer NOT NULL,
    average numeric(5,2) NOT NULL
);


ALTER TABLE public.batsmen OWNER TO postgres;

--
-- Name: batsmen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.batsmen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.batsmen_id_seq OWNER TO postgres;

--
-- Name: batsmen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.batsmen_id_seq OWNED BY public.batsmen.id;


--
-- Name: bowlers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bowlers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    wickets integer NOT NULL,
    economy numeric(5,2) NOT NULL
);


ALTER TABLE public.bowlers OWNER TO postgres;

--
-- Name: bowlers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bowlers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bowlers_id_seq OWNER TO postgres;

--
-- Name: bowlers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bowlers_id_seq OWNED BY public.bowlers.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    role character varying(10) NOT NULL,
    runs integer,
    average numeric(5,2) DEFAULT NULL::numeric,
    wickets integer,
    economy numeric(5,2) DEFAULT NULL::numeric,
    CONSTRAINT players_check CHECK (((((role)::text = 'Batsman'::text) AND (runs IS NOT NULL) AND (average IS NOT NULL) AND (wickets IS NULL) AND (economy IS NULL)) OR (((role)::text = 'Bowler'::text) AND (wickets IS NOT NULL) AND (economy IS NOT NULL) AND (runs IS NULL) AND (average IS NULL)))),
    CONSTRAINT players_role_check CHECK (((role)::text = ANY ((ARRAY['Batsman'::character varying, 'Bowler'::character varying])::text[])))
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: batsmen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batsmen ALTER COLUMN id SET DEFAULT nextval('public.batsmen_id_seq'::regclass);


--
-- Name: bowlers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bowlers ALTER COLUMN id SET DEFAULT nextval('public.bowlers_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Data for Name: batsmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batsmen (id, name, runs, average) FROM stdin;
1	Virat Kohli	12000	55.75
2	Rohit Sharma	10000	48.20
3	Joe Root	11000	52.68
\.


--
-- Data for Name: bowlers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bowlers (id, name, wickets, economy) FROM stdin;
1	Jasprit Bumrah	250	4.75
2	Rashid Khan	300	3.90
3	Pat Cummins	200	4.45
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, name, role, runs, average, wickets, economy) FROM stdin;
1	Virat Kohli	Batsman	12000	55.75	\N	\N
2	Rohit Sharma	Batsman	10000	48.20	\N	\N
3	Joe Root	Batsman	11000	52.68	\N	\N
4	Jasprit Bumrah	Bowler	\N	\N	250	4.75
5	Rashid Khan	Bowler	\N	\N	300	3.90
6	Pat Cummins	Bowler	\N	\N	200	4.45
\.


--
-- Name: batsmen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.batsmen_id_seq', 3, true);


--
-- Name: bowlers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bowlers_id_seq', 3, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 6, true);


--
-- Name: batsmen batsmen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batsmen
    ADD CONSTRAINT batsmen_pkey PRIMARY KEY (id);


--
-- Name: bowlers bowlers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bowlers
    ADD CONSTRAINT bowlers_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

