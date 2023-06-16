--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(20),
    age_in_million_of_years numeric,
    star_type character varying(20),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    planet_types character varying(20) NOT NULL,
    has_life boolean NOT NULL,
    galaxy_type character varying
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric,
    galaxy_type character varying(20),
    star_type character varying(10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: the_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.the_universe (
    the_universe_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.the_universe OWNER TO freecodecamp;

--
-- Name: the_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.the_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.the_universe_id_seq OWNER TO freecodecamp;

--
-- Name: the_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.the_universe_id_seq OWNED BY public.the_universe.the_universe_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: the_universe the_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.the_universe ALTER COLUMN the_universe_id SET DEFAULT nextval('public.the_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Barred spiral', NULL, 'white dwarf', NULL);
INSERT INTO public.galaxy VALUES (2, 'yeti', 'Galax 2', NULL, 'star 1', NULL);
INSERT INTO public.galaxy VALUES (3, 'maze shine', 'Galax 2', NULL, 'star 3', NULL);
INSERT INTO public.galaxy VALUES (4, 'dust star', 'Galax 3', NULL, 'star 1', NULL);
INSERT INTO public.galaxy VALUES (5, 'epoch', 'Galax 1', NULL, 'star 1', NULL);
INSERT INTO public.galaxy VALUES (6, 'uroy', 'Galax 3', NULL, 'star 2', NULL);
INSERT INTO public.galaxy VALUES (7, 'daxstarlus', 'Galax 2', NULL, 'star 3', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MOON', 3, true, NULL);
INSERT INTO public.moon VALUES (2, 'metis', 5, false, false);
INSERT INTO public.moon VALUES (3, 'Kore', 5, false, false);
INSERT INTO public.moon VALUES (4, 'Carpo', 5, false, false);
INSERT INTO public.moon VALUES (5, 'Herse', 5, false, false);
INSERT INTO public.moon VALUES (6, 'Helike', 5, false, false);
INSERT INTO public.moon VALUES (7, 'Arche', 5, false, false);
INSERT INTO public.moon VALUES (8, 'leda', 5, false, false);
INSERT INTO public.moon VALUES (9, 'Eupheme', 5, false, false);
INSERT INTO public.moon VALUES (10, 'Pandia', 5, false, false);
INSERT INTO public.moon VALUES (11, 'valetudo', 5, false, false);
INSERT INTO public.moon VALUES (12, 'ersa', 5, false, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 6, true, false);
INSERT INTO public.moon VALUES (14, 'Dione', 6, true, false);
INSERT INTO public.moon VALUES (15, 'Titan', 6, true, false);
INSERT INTO public.moon VALUES (16, 'Rhea', 6, true, false);
INSERT INTO public.moon VALUES (17, 'lapetus', 6, true, false);
INSERT INTO public.moon VALUES (18, 'Telesto', 6, false, false);
INSERT INTO public.moon VALUES (19, 'Atlas', 6, false, false);
INSERT INTO public.moon VALUES (20, 'Pan', 6, false, false);
INSERT INTO public.moon VALUES (21, 'Yimir', 6, false, false);
INSERT INTO public.moon VALUES (22, 'Tarvos', 6, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Hot', false, 'Galax 1');
INSERT INTO public.planet VALUES (2, 'Mars', 'Hot', true, 'Galax 1');
INSERT INTO public.planet VALUES (3, 'Earth', 'Warm', true, 'Galax 2');
INSERT INTO public.planet VALUES (4, 'Venus', 'HOT', false, 'Galax 2');
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Warm', false, 'Galax 2');
INSERT INTO public.planet VALUES (6, 'Saturn', 'COLD', false, 'Galax 2');
INSERT INTO public.planet VALUES (7, 'Neptune', 'Cold', false, 'Galax 2');
INSERT INTO public.planet VALUES (8, 'Saturn', 'Cold', false, 'Galax 3');
INSERT INTO public.planet VALUES (9, 'UB 40', 'Cold', false, 'Galax 2');
INSERT INTO public.planet VALUES (10, 'Uranus', 'Cold', false, 'Galax 3');
INSERT INTO public.planet VALUES (11, 'Ringed', 'Cold', false, 'Galax 3');
INSERT INTO public.planet VALUES (12, 'Orion', 'Cold', false, 'Galax 1');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'lazer', true, 202736379, 'Galax 3', 'Star 1');
INSERT INTO public.star VALUES (2, 'Etta', true, 533762709, 'Galax 2', 'Star 3');
INSERT INTO public.star VALUES (3, 'Shine', false, 537329333300, 'Galax 1', 'Star 2');
INSERT INTO public.star VALUES (4, 'Gaze', true, 4428722872, 'Galax 3', 'Star 2');
INSERT INTO public.star VALUES (5, 'Volver', false, 356728290, 'Galaxy 1', 'Star 1');
INSERT INTO public.star VALUES (6, 'Lhsu', true, 78292730000, 'Galax 2', 'Star 2');
INSERT INTO public.star VALUES (7, 'latgi', true, 7808252651, 'Galax 3', 'Star 3');


--
-- Data for Name: the_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.the_universe VALUES (1, 1, 3, 2, 2, 'Zues');
INSERT INTO public.the_universe VALUES (2, 2, 3, 5, 4, 'Milk wax');
INSERT INTO public.the_universe VALUES (3, 3, 2, 3, 6, 'Wakanda');
INSERT INTO public.the_universe VALUES (4, 2, 4, 4, 7, 'Losess');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: the_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.the_universe_id_seq', 4, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: the_universe the_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.the_universe
    ADD CONSTRAINT the_universe_pkey PRIMARY KEY (the_universe_id);


--
-- Name: the_universe the_universe_the_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.the_universe
    ADD CONSTRAINT the_universe_the_universe_id_key UNIQUE (the_universe_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

