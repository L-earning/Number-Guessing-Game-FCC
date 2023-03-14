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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (34, 13, 35);
INSERT INTO public.games VALUES (35, 969, 36);
INSERT INTO public.games VALUES (36, 300, 36);
INSERT INTO public.games VALUES (37, 858, 37);
INSERT INTO public.games VALUES (38, 286, 37);
INSERT INTO public.games VALUES (39, 824, 36);
INSERT INTO public.games VALUES (40, 132, 36);
INSERT INTO public.games VALUES (41, 96, 36);
INSERT INTO public.games VALUES (42, 12, 35);
INSERT INTO public.games VALUES (43, 904, 38);
INSERT INTO public.games VALUES (44, 968, 38);
INSERT INTO public.games VALUES (45, 737, 39);
INSERT INTO public.games VALUES (46, 81, 39);
INSERT INTO public.games VALUES (47, 627, 38);
INSERT INTO public.games VALUES (48, 629, 38);
INSERT INTO public.games VALUES (49, 60, 38);
INSERT INTO public.games VALUES (50, 166, 40);
INSERT INTO public.games VALUES (51, 196, 40);
INSERT INTO public.games VALUES (52, 386, 41);
INSERT INTO public.games VALUES (53, 466, 41);
INSERT INTO public.games VALUES (54, 367, 40);
INSERT INTO public.games VALUES (55, 490, 40);
INSERT INTO public.games VALUES (56, 914, 40);
INSERT INTO public.games VALUES (57, 687, 42);
INSERT INTO public.games VALUES (58, 229, 42);
INSERT INTO public.games VALUES (59, 490, 43);
INSERT INTO public.games VALUES (60, 497, 43);
INSERT INTO public.games VALUES (61, 747, 42);
INSERT INTO public.games VALUES (62, 448, 42);
INSERT INTO public.games VALUES (63, 334, 42);
INSERT INTO public.games VALUES (64, 75, 44);
INSERT INTO public.games VALUES (65, 767, 44);
INSERT INTO public.games VALUES (66, 413, 45);
INSERT INTO public.games VALUES (67, 343, 45);
INSERT INTO public.games VALUES (68, 43, 44);
INSERT INTO public.games VALUES (69, 787, 44);
INSERT INTO public.games VALUES (70, 356, 44);
INSERT INTO public.games VALUES (71, 955, 46);
INSERT INTO public.games VALUES (72, 284, 46);
INSERT INTO public.games VALUES (73, 27, 47);
INSERT INTO public.games VALUES (74, 54, 47);
INSERT INTO public.games VALUES (75, 525, 46);
INSERT INTO public.games VALUES (76, 532, 46);
INSERT INTO public.games VALUES (77, 803, 46);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (35, 'linn');
INSERT INTO public.users VALUES (36, 'user_1678813110416');
INSERT INTO public.users VALUES (37, 'user_1678813110415');
INSERT INTO public.users VALUES (38, 'user_1678813140930');
INSERT INTO public.users VALUES (39, 'user_1678813140929');
INSERT INTO public.users VALUES (40, 'user_1678813240101');
INSERT INTO public.users VALUES (41, 'user_1678813240100');
INSERT INTO public.users VALUES (42, 'user_1678813307392');
INSERT INTO public.users VALUES (43, 'user_1678813307391');
INSERT INTO public.users VALUES (44, 'user_1678813313884');
INSERT INTO public.users VALUES (45, 'user_1678813313883');
INSERT INTO public.users VALUES (46, 'user_1678813343636');
INSERT INTO public.users VALUES (47, 'user_1678813343635');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 77, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 47, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

