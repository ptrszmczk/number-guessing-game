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
    user_id integer,
    guesses integer,
    correct_number integer
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
    name character varying(22)
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

INSERT INTO public.games VALUES (1, 1, 10, 20);
INSERT INTO public.games VALUES (2, 1, 11, 21);
INSERT INTO public.games VALUES (3, 1, 12, 22);
INSERT INTO public.games VALUES (4, 2, 13, 23);
INSERT INTO public.games VALUES (5, 6, 12, 367);
INSERT INTO public.games VALUES (6, 7, 201, 200);
INSERT INTO public.games VALUES (7, 7, 176, 175);
INSERT INTO public.games VALUES (8, 1, 6, 40);
INSERT INTO public.games VALUES (9, 10, 109, 108);
INSERT INTO public.games VALUES (10, 11, 165, 164);
INSERT INTO public.games VALUES (11, 11, 79, 78);
INSERT INTO public.games VALUES (12, 13, 215, 214);
INSERT INTO public.games VALUES (13, 12, 27, 24);
INSERT INTO public.games VALUES (14, 17, 115, 114);
INSERT INTO public.games VALUES (15, 16, 117, 114);
INSERT INTO public.games VALUES (16, 19, 138, 137);
INSERT INTO public.games VALUES (17, 19, 62, 61);
INSERT INTO public.games VALUES (18, 18, 234, 231);
INSERT INTO public.games VALUES (19, 18, 200, 198);
INSERT INTO public.games VALUES (20, 20, 9, 264);
INSERT INTO public.games VALUES (21, 20, 18, 344);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Antek');
INSERT INTO public.users VALUES (2, 'Edek');
INSERT INTO public.users VALUES (3, 'Marek');
INSERT INTO public.users VALUES (4, 'user_1675693885769');
INSERT INTO public.users VALUES (5, 'user_1675693885768');
INSERT INTO public.users VALUES (6, 'Bozena');
INSERT INTO public.users VALUES (7, 'user_1675694981456');
INSERT INTO public.users VALUES (8, 'user_1675694981455');
INSERT INTO public.users VALUES (9, 'Darek');
INSERT INTO public.users VALUES (10, 'user_1675695100262');
INSERT INTO public.users VALUES (11, 'user_1675695100261');
INSERT INTO public.users VALUES (12, 'user_1675695544068');
INSERT INTO public.users VALUES (13, 'user_1675695544067');
INSERT INTO public.users VALUES (14, 'user_1675695790506');
INSERT INTO public.users VALUES (15, 'user_1675695790505');
INSERT INTO public.users VALUES (16, 'user_1675695914660');
INSERT INTO public.users VALUES (17, 'user_1675695914659');
INSERT INTO public.users VALUES (18, 'user_1675696125015');
INSERT INTO public.users VALUES (19, 'user_1675696125014');
INSERT INTO public.users VALUES (20, 'Piotr');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


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

