--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title text NOT NULL,
    likes integer DEFAULT 0,
    date date NOT NULL,
    image text NOT NULL,
    text text
);


ALTER TABLE public.articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    cat_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    item_number integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    image character varying(59) NOT NULL,
    price numeric(6,2) NOT NULL,
    discount numeric(5,2) NOT NULL,
    instock integer DEFAULT 0,
    cat_id integer,
    CONSTRAINT products_price_check CHECK ((price > (0)::numeric))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_like_articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_like_articles (
    article_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_like_articles OWNER TO postgres;

--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articles VALUES (3, 'All About Vitamin B', 2, '2022-10-22', '3.jpg', 'Although here at Young Living we’re mostly known for our high-quality essential oils, we also offer a variety of food supplements and place great importance on knowing that our insides are cared for just as much as our outsides. With that in mind, in this blog, we’ll be talking about Vitamin B and all its brilliant benefits, helping you to learn how to ensure you’re getting enough Vitamin B and understanding how it can work alongside your daily life.');
INSERT INTO public.articles VALUES (4, 'Summer BBQ Recipes', 32, '2022-10-22', '4.jpg', 'Here at Young Living, we love using inventive ways to create recipes in the kitchen using our Plus essential oils.Thanks to their deliciously fruity and herby flavours, our Plus oils can be used to create tasty dishes in every season,from light and bright salad dressings to hearty casseroles and indulgent baked goods. However, as we’re enjoying the summer sunshine and are firmly in BBQ season.');
INSERT INTO public.articles VALUES (5, '6 Fun Ways to Use <br> Essential Oils for Children', 1, '2022-10-23', '5.jpg', 'When it comes to essential oils, Young Living understands the importance of creating products that the whole family can enjoy. If you’re a keen user of oils yourself, you may want to introduce Young Living’s collection to your little ones, so in this blog, we’ll be taking you through some of our favourites from Young Living’s child friendly KidScents range, while explaining the ways to safely use diluted essential oils for children.');
INSERT INTO public.articles VALUES (7, 'Essential Oils for Summer<br> with Young Living', 10, '2022-10-24', '7.jpg', 'When the weather heats up, there’s no better time to explore Young Living’s top tips on essential oils for the summer season. Whether you’re simply on the hunt for summery scents, are looking for inspiration on inventive uses for your favourite oils or are hoping to find out more about how to use essential oils safely on sunny days, this is the blog post for you. So, let’s get started!');
INSERT INTO public.articles VALUES (1, 'Using essential oils for hair:<br> 3 DIY recipes you need to try', 29, '2022-10-21', '1.jpg', 'Walk into any beauty store and you’ll find shelves stocked with hair products with overwhelming ingredients lists. But taking care of your hair doesn’t need to be complicated.In this blog, you will find out how to use essential oils to keep your hair looking and feeling healthy.You’ll also find tips on which essential oils are best for your hair, as well as some DIY recipes for different hair care needs.');
INSERT INTO public.articles VALUES (2, 'How to Use Palmarosa <br> Essential Oil', 44, '2022-10-21', '2.jpg', 'With its soothing and stimulating aroma, Palmarosa essential oil is an ultimate favourite for lovers of all things beauty. Praised for its ability to rejuvenate healthy-looking skin, Palmarosa is created by steam distilling Cymbopogon martini, one of several aromatic flowering grasses that belong to the Poaceae family. Native to India and Indochina, this plant is closely related to lemongrass, and provides a green, delicate, and wonderfully fresh fragrance that can be added to everything from perfumes to facial serums.');
INSERT INTO public.articles VALUES (6, '5 Top Tips on Washing <br> Fruits & Vegetables', 36, '2022-10-21', '6.jpg', 'If you’re anything like us at Young Living, you love enjoying a balanced diet filled with delicious fruits and vegetables.Whether you’re prepping your fruit and veg for sweet breakfast smoothies, hearty lunchtime salads or light and refreshing evening dishes, learning the best way to clean and prep your ingredients is always the first step to creating any delicious meal. In this blog, we’ll be taking you through our top 5 tips on how to best wash fruits and vegetables, helping you to ensure that your favourite healthy ingredients are as clean as they are tasty from now on!');


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES (1, 'Skin Care');
INSERT INTO public.category VALUES (2, 'Health');
INSERT INTO public.category VALUES (3, 'Wellness');
INSERT INTO public.category VALUES (4, 'Scent');
INSERT INTO public.category VALUES (5, 'Dental Care');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (23801, 'Thieves Chest Rub', 'Thieves® Chest Rub uses plant power to deliver over-the-counter strength to temporarily relieve cough and congestion with the soothing aroma and power of camphor, menthol, and eucalyptus.', 'thieves_chestrub.jfif', 39.49, 30.00, 42, 2);
INSERT INTO public.products VALUES (5764, 'AgilEase', 'AgilEase® promotes joint health by supporting healthy cartilage, joint flexibility and mobility, and the body’s healthy response to inflammation after exercise.', 'AgilEase_F9F4EE.jpg', 69.74, 53.00, 18, 2);
INSERT INTO public.products VALUES (3297, 'ART Gentle Cleanser', 'ART® Gentle Cleanser uses a gentle foaming action to help clear away dirt and impurities with skin-loving premium essential oils sure to leave your face refreshed and radiant.', 'art_gentle.jfif', 49.67, 37.75, 72, 1);
INSERT INTO public.products VALUES (23802, 'Cool Mint CBD Oil', 'Cool Mint CBD Oil uses a combination of potent CBD with Spearmint and Peppermint essential oils for a cooling sensation to refresh and invigorate you on even the busiest days', 'Cool_Mint_CBD_Oil_-_500mg_28472_JPEG.jpg', 113.49, 86.25, 42, 2);
INSERT INTO public.products VALUES (3597, 'Eucalyptus Blue Essential Oil', 'Eucalyptus Blue essential oil is obtained from botanicals that are grown and distilled at the Finca Botanica Farm and Distillery in Chongon, Ecuador.', '3597.jfif', 29.25, 22.25, 99, 4);
INSERT INTO public.products VALUES (12134, 'Cypress Essential Oil', 'Cypress essential oil has a clean, evergreen aroma that can be used aromatically to create an ambience of security and grounding.', 'Cypress_15ml_US_Website_2021.jfif', 29.25, 22.25, 99, 4);
INSERT INTO public.products VALUES (36285, 'BLOOM Essential Oil', 'BLOOM essential oil blend combines Vetiver, Blue Cypress, Davana, Royal Hawaiian Sandalwood™, Clove, Jasmine, Carrot Seed,Spearmint, Geranium, and Sacred Frankincense', 'SILO_Balance_TONER_Convention_2022_US_and_CA_Skava__1_.jfif', 47.37, 36.00, 31, 1);
INSERT INTO public.products VALUES (4994, 'Basil Essential Oil', 'Basil essential oil refreshes the mind when inhaled and soothes fatigued muscles when massaged into the skin.', 'Basil_15ml_US_Website_2022.jfif', 37.50, 28.50, 21, 4);
INSERT INTO public.products VALUES (5360, 'ART Refreshing Toner', 'ART® Refreshing Toner is made with premium essential oils and natural ingredients to help balance skin’s pH, sweep away impurities, refresh skin, and reduce the appearance of pores.', 'ARTRefreshingToner_Silo_US_2016_F9F4EE.jpg', 36.51, 27.75, 5, 1);
INSERT INTO public.products VALUES (12124, 'Breathe Again Roll-On', 'Breathe Again™ Roll-On combines Copaiba, Myrtle, and Peppermint with four different types of Eucalyptus —including Eucalyptus Blue—to create a powerful, invigorating experience', 'BreatheAgain_10mlTube_US_website_2021.jfif', 37.50, 28.50, 21, 3);
INSERT INTO public.products VALUES (30291, 'BLOOM Brightening Cleanse', 'BLOOM Brightening Cleanser is a naturally derived facial wash that reveals radiant skin and leaves your face feeling fresh and smooth.', 'Bloom_Brightening_Cleanser_30291_JPEG_F9F4EE.jpg', 51.97, 39.50, 49, 1);
INSERT INTO public.products VALUES (3039, 'Thieves AromaBright Toothpaste', 'Thieves® AromaBright™ Toothpaste brushes away buildup and helps support strong and healthy-looking teeth with all-natural ingredients that are gentle on teeth and enamel.', 'thieves_aromabright_4oz_silo_2020_f9f4ee_3039.jpg', 15.19, 12.00, 123, 5);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Robert', 'Baumgartner');
INSERT INTO public.users VALUES (2, 'Anna', 'Bolika');


--
-- Data for Name: users_like_articles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (cat_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (item_number);


--
-- Name: users_like_articles users_like_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_like_articles
    ADD CONSTRAINT users_like_articles_pkey PRIMARY KEY (article_id, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: products products_category_cat_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_cat_id_fk FOREIGN KEY (cat_id) REFERENCES public.category(cat_id);


--
-- Name: users_like_articles users_like_articles_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_like_articles
    ADD CONSTRAINT users_like_articles_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_like_articles users_like_articles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_like_articles
    ADD CONSTRAINT users_like_articles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

