--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    description character varying(60),
    size integer NOT NULL,
    created_at timestamp without time zone,
    galaxy_type text
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
    description character varying(60),
    size integer NOT NULL,
    is_spherical boolean,
    planet_id integer,
    created_at timestamp without time zone
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
    name character varying(30) NOT NULL,
    description character varying(60),
    size integer NOT NULL,
    is_spherical boolean,
    has_life boolean,
    distance_from_earth numeric(12,2),
    star_id integer,
    created_at timestamp without time zone,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    created_at timestamp without time zone
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(60),
    size integer NOT NULL,
    is_spherical boolean,
    created_at timestamp without time zone,
    galaxy_id integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy which has life in whole of the universe', 120, '2026-01-30 00:00:00', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 100, '2026-01-30 00:00:00', NULL);
INSERT INTO public.galaxy VALUES (3, 'Galaxy-150', NULL, 150, '2026-01-30 00:00:00', NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward', NULL, 110, '2026-01-30 00:00:00', NULL);
INSERT INTO public.galaxy VALUES (5, 'Eye of God', NULL, 190, '2026-01-30 00:00:00', NULL);
INSERT INTO public.galaxy VALUES (6, 'New', NULL, 100, '2026-01-30 00:00:00', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 12, true, 3, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 20, true, 2, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 25, true, 2, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 60, true, 6, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 40, true, 6, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (6, 'Lo', NULL, 30, true, 6, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (7, 'Europa', NULL, 20, true, 6, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 20, true, 6, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (16, 'Titan', NULL, 40, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (17, 'Rhea', NULL, 30, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (18, 'Lapetus', NULL, 20, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (19, 'Dione', NULL, 40, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (20, 'Enceladus', NULL, 30, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (21, 'Mimas', NULL, 20, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (22, 'Tethys', NULL, 40, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (23, 'Hyperion', NULL, 30, true, 4, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (24, 'Titania', NULL, 20, true, 5, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (25, 'Oberon', NULL, 40, true, 5, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (26, 'Umbriel', NULL, 30, true, 5, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (27, 'Ariel', NULL, 20, true, 5, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (28, 'Triton', NULL, 40, true, 7, '2026-01-30 00:00:00');
INSERT INTO public.moon VALUES (29, 'Charon', NULL, 30, true, 8, '2026-01-30 00:00:00');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 20, true, false, 12000.30, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, 40, true, false, 11500.55, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 35, true, false, 0.00, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', NULL, 65, true, false, 10000.40, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, 60, true, false, 15000.50, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (6, 'Jupiter', NULL, 90, true, false, 34000.50, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, 15, true, false, 75000.50, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (8, 'Pluto', NULL, 10, true, false, 950000.50, 1, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (9, 'Wasp', NULL, 50, true, false, 450000.50, 2, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (10, 'Kepler', NULL, 60, true, false, 670000.50, 2, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (11, 'Lappy', NULL, 80, true, false, 870000.50, 3, '2026-01-30 00:00:00', NULL);
INSERT INTO public.planet VALUES (12, 'Happy', NULL, 30, true, false, 767600.70, 3, '2026-01-30 00:00:00', NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Rocky', NULL, NULL);
INSERT INTO public.planet_type VALUES (2, 'Gas', NULL, NULL);
INSERT INTO public.planet_type VALUES (3, 'Ice', NULL, NULL);
INSERT INTO public.planet_type VALUES (4, 'Exotic', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 50, true, '2026-01-30 00:00:00', 1);
INSERT INTO public.star VALUES (2, 'Lynx', NULL, 70, false, '2026-01-30 00:00:00', 2);
INSERT INTO public.star VALUES (3, 'Crux', NULL, 60, false, '2026-01-30 00:00:00', 2);
INSERT INTO public.star VALUES (4, 'Cancer', NULL, 40, true, '2026-01-30 00:00:00', 1);
INSERT INTO public.star VALUES (5, 'Leo', NULL, 55, true, '2026-01-30 00:00:00', 2);
INSERT INTO public.star VALUES (6, 'Taurus', NULL, 65, false, '2026-01-30 00:00:00', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

