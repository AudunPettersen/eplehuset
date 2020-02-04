--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: bestilling; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.bestilling (
    bestillingid integer NOT NULL,
    dato date NOT NULL,
    kundeid integer NOT NULL
);


ALTER TABLE public.bestilling OWNER TO eple;

--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.bestilling_bestillingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bestilling_bestillingid_seq OWNER TO eple;

--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.bestilling_bestillingid_seq OWNED BY public.bestilling.bestillingid;


--
-- Name: kategori; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.kategori (
    kategoriid integer NOT NULL,
    kategorinavn text NOT NULL
);


ALTER TABLE public.kategori OWNER TO eple;

--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.kategori_kategoriid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_kategoriid_seq OWNER TO eple;

--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.kategori_kategoriid_seq OWNED BY public.kategori.kategoriid;


--
-- Name: kunde; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.kunde (
    kundeid integer NOT NULL,
    fornavn text NOT NULL,
    etternavn text NOT NULL,
    adresse text,
    epost text,
    tlf text,
    kjonn text,
    userid integer NOT NULL
);


ALTER TABLE public.kunde OWNER TO eple;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.kunde_kundeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kunde_kundeid_seq OWNER TO eple;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.kunde_kundeid_seq OWNED BY public.kunde.kundeid;


--
-- Name: linje; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.linje (
    linjeid integer NOT NULL,
    antall integer DEFAULT 1,
    vareid integer NOT NULL,
    bestillingid integer NOT NULL
);


ALTER TABLE public.linje OWNER TO eple;

--
-- Name: linje_linjeid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.linje_linjeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linje_linjeid_seq OWNER TO eple;

--
-- Name: linje_linjeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.linje_linjeid_seq OWNED BY public.linje.linjeid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username text NOT NULL,
    role text DEFAULT 'user'::text,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO eple;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO eple;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: vare; Type: TABLE; Schema: public; Owner: eple
--

CREATE TABLE public.vare (
    vareid integer NOT NULL,
    varenavn text NOT NULL,
    pris integer DEFAULT 0,
    bilde text,
    kategoriid integer NOT NULL
);


ALTER TABLE public.vare OWNER TO eple;

--
-- Name: vare_vareid_seq; Type: SEQUENCE; Schema: public; Owner: eple
--

CREATE SEQUENCE public.vare_vareid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vare_vareid_seq OWNER TO eple;

--
-- Name: vare_vareid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eple
--

ALTER SEQUENCE public.vare_vareid_seq OWNED BY public.vare.vareid;


--
-- Name: bestilling bestillingid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.bestilling ALTER COLUMN bestillingid SET DEFAULT nextval('public.bestilling_bestillingid_seq'::regclass);


--
-- Name: kategori kategoriid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kategori ALTER COLUMN kategoriid SET DEFAULT nextval('public.kategori_kategoriid_seq'::regclass);


--
-- Name: kunde kundeid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kunde ALTER COLUMN kundeid SET DEFAULT nextval('public.kunde_kundeid_seq'::regclass);


--
-- Name: linje linjeid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.linje ALTER COLUMN linjeid SET DEFAULT nextval('public.linje_linjeid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Name: vare vareid; Type: DEFAULT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.vare ALTER COLUMN vareid SET DEFAULT nextval('public.vare_vareid_seq'::regclass);


--
-- Data for Name: bestilling; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.bestilling (bestillingid, dato, kundeid) FROM stdin;
21	2020-01-29	15
22	2010-01-01	15
\.


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.kategori (kategoriid, kategorinavn) FROM stdin;
29	Watch
30	iPhone
31	Macbook
32	iPad
\.


--
-- Data for Name: kunde; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.kunde (kundeid, fornavn, etternavn, adresse, epost, tlf, kjonn, userid) FROM stdin;
15	admin	admin	\N	\N	\N	\N	1
17	Audun	Pettersen	Brakahaug 4	audun1@gmail.com	98123131	m	5
18	Kristian	Reinertsen	Svehaug 4	kristian@gmail.com	33482094	m	6
\.


--
-- Data for Name: linje; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.linje (linjeid, antall, vareid, bestillingid) FROM stdin;
55	1	51	21
56	2	41	21
57	2	41	22
58	1	40	22
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.users (userid, username, role, password) FROM stdin;
1	admin	admin	4122cb13c7a474c1976c9706ae36521d
5	audunpettersen	user	202cb962ac59075b964b07152d234b70
6	kristianreinertsen	user	202cb962ac59075b964b07152d234b70
\.


--
-- Data for Name: vare; Type: TABLE DATA; Schema: public; Owner: eple
--

COPY public.vare (vareid, varenavn, pris, bilde, kategoriid) FROM stdin;
39	iPhone XS	8000	iPhoneXS.png	30
40	Macbook Pro	11500	macbook.png	31
41	iPad Pro	8000	ipad.png	32
51	Apple Watch Pro	3500	watch.png	29
53	iPhone 11	10500	iphone-11.png	30
\.


--
-- Name: bestilling_bestillingid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.bestilling_bestillingid_seq', 22, true);


--
-- Name: kategori_kategoriid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.kategori_kategoriid_seq', 32, true);


--
-- Name: kunde_kundeid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.kunde_kundeid_seq', 18, true);


--
-- Name: linje_linjeid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.linje_linjeid_seq', 58, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.users_userid_seq', 6, true);


--
-- Name: vare_vareid_seq; Type: SEQUENCE SET; Schema: public; Owner: eple
--

SELECT pg_catalog.setval('public.vare_vareid_seq', 53, true);


--
-- Name: bestilling bestilling_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.bestilling
    ADD CONSTRAINT bestilling_pkey PRIMARY KEY (bestillingid);


--
-- Name: kategori kategori_kategorinavn_key; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_kategorinavn_key UNIQUE (kategorinavn);


--
-- Name: kategori kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT kategori_pkey PRIMARY KEY (kategoriid);


--
-- Name: kunde kunde_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_pkey PRIMARY KEY (kundeid);


--
-- Name: kunde kunde_userid_key; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_userid_key UNIQUE (userid);


--
-- Name: linje linje_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.linje
    ADD CONSTRAINT linje_pkey PRIMARY KEY (linjeid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vare vare_pkey; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.vare
    ADD CONSTRAINT vare_pkey PRIMARY KEY (vareid);


--
-- Name: vare vare_varenavn_key; Type: CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.vare
    ADD CONSTRAINT vare_varenavn_key UNIQUE (varenavn);


--
-- Name: bestilling bestilling_kundeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.bestilling
    ADD CONSTRAINT bestilling_kundeid_fkey FOREIGN KEY (kundeid) REFERENCES public.kunde(kundeid);


--
-- Name: kunde kunde_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- Name: linje linje_bestillingid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.linje
    ADD CONSTRAINT linje_bestillingid_fkey FOREIGN KEY (bestillingid) REFERENCES public.bestilling(bestillingid);


--
-- Name: linje linje_vareid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.linje
    ADD CONSTRAINT linje_vareid_fkey FOREIGN KEY (vareid) REFERENCES public.vare(vareid);


--
-- Name: vare vare_kategoriid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: eple
--

ALTER TABLE ONLY public.vare
    ADD CONSTRAINT vare_kategoriid_fkey FOREIGN KEY (kategoriid) REFERENCES public.kategori(kategoriid);


--
-- Name: TABLE bestilling; Type: ACL; Schema: public; Owner: eple
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.bestilling TO PUBLIC;


--
-- Name: TABLE kategori; Type: ACL; Schema: public; Owner: eple
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.kategori TO PUBLIC;


--
-- Name: TABLE linje; Type: ACL; Schema: public; Owner: eple
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.linje TO PUBLIC;


--
-- Name: TABLE vare; Type: ACL; Schema: public; Owner: eple
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.vare TO PUBLIC;


--
-- PostgreSQL database dump complete
--

