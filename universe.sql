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
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    black_holes_id integer NOT NULL,
    distance_from_earth_in_millions_of_light_years numeric(12,7),
    name character varying(50) NOT NULL
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_black_holes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_holes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_holes_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_holes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_holes_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    year_of_discovery integer,
    distance_from_earth_in_millions_of_years numeric(6,2)
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
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    planet_id integer,
    distance_from_planet_in_thousands_of_kilometers integer,
    has_water boolean
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
    name character varying(50) NOT NULL,
    amount_of_moons integer,
    distance_from_earth_in_light_years numeric(12,7),
    description text,
    year_of_discovery integer,
    has_water boolean,
    star_id integer
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
    name character varying(50) NOT NULL,
    distance_from_earth_in_light_years numeric(15,7),
    description text,
    year_of_discovery integer,
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
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_black_holes_id_seq'::regclass);


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
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES (1, 10400.0000000, 'TON 618');
INSERT INTO public.black_holes VALUES (2, 2.5000000, 'Messier 31');
INSERT INTO public.black_holes VALUES (3, 6.0500000, 'RX J1121-1231');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky WAy', 'Milky WAY is the birthplace of human and home to planet Earth. With its barred spirals it is probably the most commonly known galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'Cigar Galaxy, rather uncommon name for a galaxy, originated in the shape of said galaxy, which heavily resembles a cigar', 1774, 12.00);
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda is the closest galaxy to the Milky Way, which is the home galaxy of human specie and is one of many spiral galaxies', 965, 4500.00);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 'The Eye of God galaxy is named after its structural appearance and is basically a prototype for multi-arm spiral galaxies', 1784, 8.50);
INSERT INTO public.galaxy VALUES (5, 'Hockey Stick Galaxy', 'The Hockey Stick Galaxy, also known as The Crowbar Galaxy, gained its name thanks to the enlogated and curved appearance.', 2005, 30.00);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 'Hoags Object is of subtype Hoag-type, and may in fact be a polar-ring galaxy with the ring in the plane of rotation of central object', 1950, 612.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Callisto', 1610, 5, 1883, false);
INSERT INTO public.moon VALUES (3, 'Tethys', 1684, 6, 295, false);
INSERT INTO public.moon VALUES (4, 'Triton', 1846, 8, 355, false);
INSERT INTO public.moon VALUES (5, 'Moon', NULL, 1, 384, false);
INSERT INTO public.moon VALUES (6, 'Titania', 1787, 7, 436, false);
INSERT INTO public.moon VALUES (7, 'Oberon', 1787, 7, 584, false);
INSERT INTO public.moon VALUES (8, 'Ganymede', 1610, 5, 1070, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1789, 6, 238, false);
INSERT INTO public.moon VALUES (10, 'Deimos', 1877, 4, 23, false);
INSERT INTO public.moon VALUES (11, 'Phobos', 1877, 4, 9, false);
INSERT INTO public.moon VALUES (12, 'Umbriel', 1851, 7, 266, false);
INSERT INTO public.moon VALUES (13, 'Io', 1610, 5, 422, false);
INSERT INTO public.moon VALUES (14, 'Europa', 1610, 5, 671, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1671, 5, 3561, false);
INSERT INTO public.moon VALUES (16, 'Rhae', 1672, 6, 527, false);
INSERT INTO public.moon VALUES (17, 'Proteus', 1989, 8, 118, false);
INSERT INTO public.moon VALUES (18, 'Miranda', 1948, 7, 129, false);
INSERT INTO public.moon VALUES (19, 'Himalia', 1905, 5, 11461, false);
INSERT INTO public.moon VALUES (20, 'Sinope', 1914, 5, 23939, false);
INSERT INTO public.moon VALUES (2, 'Titan', 1200, 6, 1655, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, 'Earth is the third planet from the star called sun and is the home to the all known life in the universe.', NULL, true, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 0.0000270, 'Venus is the second planet from earth with the similar size like the one of the earth and it is speculated that this planet once hosted a life friendly ecosystem.', 1610, false, 6);
INSERT INTO public.planet VALUES (3, 'Mercury', 0, 0.0000060, 'Mercury is the smallest planet of our system of the celestial bodies.', 1610, false, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 0.0000260, 'Mars is the fourth planet in the solar system of Sun and is most likely the best candidate for the human conquest of other planets thanks to his position in the habitable zone.', 1610, true, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 0.0000890, 'Jupiter, or by some called a failed star, thanks to his size, is the biggest planet of our solar system and the most dominant one with the amount of different moons and satelites in his orbit.', 1610, false, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 0.0001400, 'Saturn is the second biggest planet in our solar system and with its ring is one of the most interesting aswell.', 1610, false, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 0.0001100, 'Uranus, named after one of the many greek gods, is the seventh planet from our sun.', 1781, false, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 0.0004600, 'The eighth planet called Neptune is the farthest one in our solar system and is one of the gas giants and one of the cold gas giants of our system.', 1846, false, 6);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', NULL, 1400.0000000, 'Probably the most earth-like planet, Kepler-452b is a super-earth planet.', 2015, true, 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri B', NULL, 4.2400000, 'Proxima Centauri B is a planet in the Proxima Centauri solar system, which is the closest solar system to our sun. It is another super-earth planet and one of the best candidates for interstellar expeditions.', 2016, true, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', NULL, 557.7000000, 'One of the super-earth planets that exist throught out our universe is located in the constellation of swan and is more or less the same size as earth.', 2014, true, 8);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', NULL, 40.0000000, 'TRAPPIST-1e is a rock planet located only 40 light years away from our planet in the Aquarius constellation.', 2017, true, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4.3600000, 'Alpha Centauri A is one of the three stars that form the the star-group named Alpha Centauri and is the biggest of the three.', 1689, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri C', 4.3600000, 'Alpha Centauri B is one of the three stars that from the star-group named Alpha Centauri and is the smallest of the group.', 1915, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 4.3600000, 'Alha Centauri B is one of the three stars that form the the star-group named Alpha Centauri and is the second biggest of the group.', 1689, 2);
INSERT INTO public.star VALUES (6, 'Sun', 0.0000160, 'The sun is the home star of the human kind and the most commonly known star in the world as every human eye has the opportunity to lay its sight upon such object every day of their existence.', NULL, 2);
INSERT INTO public.star VALUES (1, 'Alpheratz', 97.0000000, 'Planet known aswell as Alpha Andromedae is one of the stars in the Andromeda Galaxy', 1928, 2);
INSERT INTO public.star VALUES (2, 'Mirach', 199.0000000, 'Known aswell as Beta Andromeda is one of the most prominent stars in the Andromeda Galaxy', 1928, 2);
INSERT INTO public.star VALUES (7, 'Kepler-452', 1400000.0000000, 'A small brown dwarf located in the constellation of swan.', NULL, 2);
INSERT INTO public.star VALUES (8, 'Kepler-186', 492.5000000, 'Kepler-186 has a similar description as Kepler-452, a small brown dwarf located in the constelation of swan. On the other hand it is much more closer to our solar system and is of the type M1-type dwarf.', NULL, 2);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 39.4600000, 'TRAPPIST-1 is ultra cool red dwarf of the spectral type M8V, located in the Aquarius constelation.', NULL, 2);


--
-- Name: black_holes_black_holes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_holes_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: black_holes black_holes_black_holes_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_black_holes_id_key UNIQUE (black_holes_id);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


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
-- PostgreSQL database dump complete
--

