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
    name character varying(30) NOT NULL,
    distance_from_earth_in_au integer,
    description text,
    age_in_millions_of_years numeric(5,1)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    age_in_millions_of_years numeric(5,1)
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
    distance_from_earth_in_au integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    star_id integer,
    age_in_millions_of_years numeric(5,1),
    name character varying(30) NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_au integer,
    galaxy_id integer,
    description text,
    age_in_millions_of_years numeric(5,1)
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Echo', 40, 'Bright blue galaxy', 500.2);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 'Creamy colored spinner', 460.2);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 130, 'Red/yellow colored stars fill this galaxy, perhaps planets are iron rich.', 460.2);
INSERT INTO public.galaxy VALUES (4, 'Error Way', 404, 'Rumored galaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Maxi', 125, 'Galaxy with planets that show signs of life', NULL);
INSERT INTO public.galaxy VALUES (6, 'Robingrif', 666, 'Galaxy with planets that show signs of life', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Moon of Earth', 348.2);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Moon of Mars', 348.2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Moon of Mars', 348.2);
INSERT INTO public.moon VALUES (4, 'Dia', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (5, 'Io', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (6, 'Carme', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (7, 'Autonoe', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (8, 'Carpo', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (9, 'Ersa', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (10, 'Europa', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (11, 'Kale', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (12, 'Kore', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (13, 'Leda', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (14, 'Pandia', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (15, 'Metis', 5, 'Moon of Jupiter', 348.2);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Moon of Uranus', 348.2);
INSERT INTO public.moon VALUES (17, 'Cupid', 7, 'Moon of Uranus', 348.2);
INSERT INTO public.moon VALUES (18, 'Juliet', 7, 'Moon of Uranus', 348.2);
INSERT INTO public.moon VALUES (19, 'Mab', 7, 'Moon of Uranus', 348.2);
INSERT INTO public.moon VALUES (20, 'Puck', 7, 'Moon of Uranus', 348.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 1, true, true, 'Third planet of this galaxy', 1, 348.2, 'Earth');
INSERT INTO public.planet VALUES (2, 1, false, true, 'Second planet of this galaxy', 1, 348.2, 'Venus');
INSERT INTO public.planet VALUES (1, 1, false, true, 'First planet of this galaxy', 1, 348.2, 'Mercury');
INSERT INTO public.planet VALUES (4, 2, false, true, 'Fourth planet of this galaxy', 1, 348.2, 'Mars');
INSERT INTO public.planet VALUES (5, 3, false, true, 'Fifth planet of this galaxy', 1, 348.2, 'Jupiter');
INSERT INTO public.planet VALUES (6, 4, false, true, 'Sixth planet of this galaxy', 1, 348.2, 'Saturn');
INSERT INTO public.planet VALUES (7, 5, false, true, 'Seventh planet of this galaxy', 1, 348.2, 'Uranus');
INSERT INTO public.planet VALUES (8, 6, false, true, 'Eighth planet of this galaxy', 1, 348.2, 'Neptune');
INSERT INTO public.planet VALUES (9, 21948, true, true, 'Citadel planet of this galaxy where alien races meet to trade', 5, 954.7, 'Ja-zan');
INSERT INTO public.planet VALUES (10, 20748, false, true, 'Cold deserted planet', 5, 32.0, 'Nxt-78');
INSERT INTO public.planet VALUES (11, 21402, false, true, 'Red planet ravaged by nuclear warfare', 5, 139.6, 'Czar');
INSERT INTO public.planet VALUES (12, 21406, true, true, 'Renewal planet of Czar', 5, 8.0, 'Czar-2');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Gas Giant', 'A giant planet mainly made up of gas');
INSERT INTO public.planet_types VALUES (2, 'Super Earth', 'A potentially rocky world, bigger than Earth.');
INSERT INTO public.planet_types VALUES (3, 'Terrestial', 'A rocky world outside of our solar system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 2, 'The source of heat for the milky way', 521.2);
INSERT INTO public.star VALUES (2, 'North Star', 1, 2, 'Star used to guide travelers', 381.2);
INSERT INTO public.star VALUES (3, 'Little Dipper', 20, 2, 'Pop Culture star', 281.2);
INSERT INTO public.star VALUES (4, 'Big Dipper', 15, 2, 'Pop Culture star', 181.2);
INSERT INTO public.star VALUES (5, 'Aphex', 60, 1, 'Mysterious celestial object', NULL);
INSERT INTO public.star VALUES (6, 'Nify', 100, 3, 'Mysterious celestial object', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

