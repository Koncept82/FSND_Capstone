--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer,
    gender character varying(8) NOT NULL
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_id_seq OWNER TO postgres;

--
-- Name: actors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_id_seq OWNED BY public.actors.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    release_date timestamp without time zone,
    actor_id integer
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: actors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN id SET DEFAULT nextval('public.actors_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (id, name, age, gender) FROM stdin;
1	Denzel Washington	65	male
2	Tom Cruise	58	male
3	Leonardo DiCaprio	45	male
4	Samule L Jackson	71	male
5	Morgan Freeman	83	male
6	Will Smith	51	male
7	Matt Damon	49	male
8	Brad Pitt	56	male
9	Dwayne Johnson	48	male
10	George Clooney	59	male
11	Bruce Willis	65	male
12	Mark Wahlberg	49	male
13	Ryan Reynolds	43	male
14	Liam Neeson	68	male
15	Robert Downey Jr.	55	male
16	Adam Sandler	53	male
17	Vin Diesel	53	male
18	Jason Statham	53	male
19	Jackie Chan	66	male
20	Donnie Yen	57	male
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, title, release_date, actor_id) FROM stdin;
1	Die Hard	1989-02-03 01:01:00	11
2	Furious 7	2015-04-03 01:01:00	17
3	Hobbs & Shaw	2019-07-13 01:00:00	9
4	Slumdog Millionaire	2008-11-12 01:00:00	13
5	Inception	2010-07-13 00:01:00	3
6	Gladiator	2000-05-05 00:01:00	7
7	Saving Private Ryan	1998-07-24 00:00:10	4
8	Titanic	1997-12-19 00:00:01	8
9	Top Gun	1986-10-03 00:01:00	2
10	Rush Hour	1998-09-18 00:01:00	19
11	Ip Man	2010-07-14 00:00:01	20
12	Ocean Eleven	2001-12-07 01:00:00	1
13	The Pursuit of Happyness	2006-12-15 01:00:00	6
14	Forrest Gump	1994-07-06 00:01:00	12
15	Taken	2008-09-26 00:01:00	14
\.


--
-- Name: actors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_id_seq', 20, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 15, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: movies movies_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(id);


--
-- PostgreSQL database dump complete
--

