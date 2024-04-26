--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    description text,
    main_stars integer NOT NULL,
    name character varying(20),
    constellations_id integer NOT NULL
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    description text NOT NULL,
    star_count_in_billions integer NOT NULL,
    distance_in_light_years real
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    description text NOT NULL,
    gravity_in_meters_second_squared numeric(3,3) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL,
    description text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    age_in_millions_of_years integer NOT NULL,
    corona_temperature_in_kelvin integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES ('One of the coolest names for a constellation.', 5, 'Cassiopeia', 1);
INSERT INTO public.constellations VALUES ('The water-carrier.', 10, 'Aquarius', 2);
INSERT INTO public.constellations VALUES ('The GOAT.', 9, 'Capricornus', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The galaxy that harbours Earth, our home.', 100, 0);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 1, 2.537);
INSERT INTO public.galaxy VALUES (3, 'Bear Claw Galaxy', 'The galaxy with the most memorable name ever.', 7, 2.2e+07);
INSERT INTO public.galaxy VALUES (4, 'Antennae Galaxies', 'Two galaxies interacting with eachother, which is cute.', 45, 5);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Also known as the Sleeping Beauty galaxy.', 17, 100);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'It has a black hole that is 70 million times the mass of the Sun.', 12000000, 250);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite the Earth has.', 0.622, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon #1.', 0.005, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon #2.', 0.003, 2);
INSERT INTO public.moon VALUES (4, 'Metis', 'One of the many moons of Jupiter.', 0.800, 6);
INSERT INTO public.moon VALUES (5, 'Io', 'One of the many moons of Jupiter.', 0.796, 6);
INSERT INTO public.moon VALUES (6, 'Europa', 'One of the many moons of Jupiter.', 0.314, 6);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'One of the many moons of Jupiter.', 0.428, 6);
INSERT INTO public.moon VALUES (8, 'Callisto', 'One of the many moons of Jupiter.', 0.235, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 'One of the many moons of Saturn.', 0.064, 7);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'One of the many moons of Saturn.', 0.113, 7);
INSERT INTO public.moon VALUES (11, 'Tethys', 'One of the many moons of Saturn.', 0.146, 7);
INSERT INTO public.moon VALUES (12, 'Dione', 'One of the many moons of Saturn.', 0.232, 7);
INSERT INTO public.moon VALUES (13, 'Rhea', 'One of the many moons of Saturn.', 0.264, 7);
INSERT INTO public.moon VALUES (14, 'Titan', 'One of the many moons of Saturn.', 0.352, 7);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'One of the many moons of Saturn.', 0.223, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 'One of the many moons of Neptune.', 0.779, 4);
INSERT INTO public.moon VALUES (17, 'Proteus', 'One of the many moons of Neptune.', 0.023, 4);
INSERT INTO public.moon VALUES (18, 'Nereid', 'One of the many moons of Neptune.', 0.075, 4);
INSERT INTO public.moon VALUES (19, 'Hippocamp', 'One of the many moons of Neptune.', 0.415, 4);
INSERT INTO public.moon VALUES (20, 'Larissa', 'One of the many moons of Neptune.', 0.001, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4543, true, true, 'The only known planet to harbour life.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4600, false, true, 'Confirmed to have water pretty recently.', 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 4503, false, true, 'The closest planet to Earth.', 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 4503, false, true, 'The only planet of our solar system not visible through the naked eye.', 1);
INSERT INTO public.planet VALUES (5, 'Venus', 4503, false, false, 'The second planet to have the least amount of craters.', 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 4603, false, false, 'The largest planet in our solar system.', 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 4503, false, false, 'Rings for days!', 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 4503, false, true, 'The chilliest planet of our solar system.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4503, false, true, 'Really small buddy!', 1);
INSERT INTO public.planet VALUES (10, 'WASP-39b', 1500, false, true, 'Also known as the hot Saturn.', 7);
INSERT INTO public.planet VALUES (11, 'Dimidium', 6100, false, true, 'The first exoplanet found to be orbiting a main sequence star.', 8);
INSERT INTO public.planet VALUES (12, 'WASP-103b', 5455, false, true, 'Also known as the Rugby ball planet.', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', 10, 3500, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 230, 9940, 2);
INSERT INTO public.star VALUES (1, 'Sun', 4500, 5772, 2);
INSERT INTO public.star VALUES (4, 'Polaris', 45, 7200, 2);
INSERT INTO public.star VALUES (5, 'Antares', 15, 3500, 2);
INSERT INTO public.star VALUES (6, 'UY Scuti', 6, 3365, 2);
INSERT INTO public.star VALUES (7, 'WASP-39', 76, 5485, 2);
INSERT INTO public.star VALUES (8, '51 Pegasi', 6100, 5571, 2);
INSERT INTO public.star VALUES (9, 'WASP-103', 1800, 6110, 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 9, true);


--
-- Name: constellations constellations_constellations_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_constellations_id_key UNIQUE (constellations_id);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


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
-- Name: star star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
