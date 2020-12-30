--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12rc1

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

--
-- Name: bosluk_sil(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bosluk_sil() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."detay" = LTRIM(NEW."detay");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.bosluk_sil() OWNER TO postgres;

--
-- Name: firma_listele(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.firma_listele()
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 SELECT * FROM firma;
	END; 
	$$;


ALTER PROCEDURE public.firma_listele() OWNER TO postgres;

--
-- Name: ililce(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ililce()
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	END; 
	$$;


ALTER PROCEDURE public.ililce() OWNER TO postgres;

--
-- Name: ililce_lis(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ililce_lis() RETURNS void
    LANGUAGE sql
    AS $$
	 SELECT sehir_adi,ilce_adi FROM "iller" INNER JOIN "ilce" ON public."iller"."il_id" = "ilce"."il_id"
	$$;


ALTER FUNCTION public.ililce_lis() OWNER TO postgres;

--
-- Name: isim_buyult(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.isim_buyult() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."yetkili_adi" = UPPER(NEW."yetkili_adi");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.isim_buyult() OWNER TO postgres;

--
-- Name: tarih_guncelle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tarih_guncelle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN

    UPDATE "fatura_bilgi" SET tarih = CURRENT_DATE WHERE "fatura_bilgi_id" = NEW."fatura_bilgi_id";

    RETURN NEW;
END;

$$;


ALTER FUNCTION public.tarih_guncelle() OWNER TO postgres;

--
-- Name: toplam_kisi(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.toplam_kisi()
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	END; 
	$$;


ALTER PROCEDURE public.toplam_kisi() OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: Kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kisi" (
    id integer NOT NULL,
    "kisiTipi" integer NOT NULL
);


ALTER TABLE public."Kisi" OWNER TO postgres;

--
-- Name: Kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kisi_id_seq" OWNER TO postgres;

--
-- Name: Kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kisi_id_seq" OWNED BY public."Kisi".id;


--
-- Name: musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri (
    id integer NOT NULL,
    ad character varying(2044) NOT NULL,
    soyad character varying(2044) NOT NULL,
    tcno integer NOT NULL,
    email character varying(2044) NOT NULL,
    sehir character varying(2044) NOT NULL,
    ilce character varying(2044) NOT NULL,
    adres character varying(2044) NOT NULL,
    telefon integer
);


ALTER TABLE public.musteri OWNER TO postgres;

--
-- Name: Musteri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Musteri_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Musteri_id_seq" OWNER TO postgres;

--
-- Name: Musteri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Musteri_id_seq" OWNED BY public.musteri.id;


--
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    id integer NOT NULL,
    ad character varying(2044) NOT NULL,
    soyad character varying(2044) NOT NULL,
    telefon text NOT NULL,
    tcno integer NOT NULL,
    email character varying(2044) NOT NULL,
    sehir character varying(2044) NOT NULL,
    ilce character varying(2044) NOT NULL,
    adres character varying(2044)
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- Name: Personel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Personel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Personel_id_seq" OWNER TO postgres;

--
-- Name: Personel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Personel_id_seq" OWNED BY public.personel.id;


--
-- Name: banka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banka (
    banka_id integer NOT NULL,
    banka_adi character varying(2044) NOT NULL,
    sube character varying(2044) NOT NULL,
    iban character varying(2044) NOT NULL,
    hesap_no bigint NOT NULL,
    yetkili_no integer NOT NULL
);


ALTER TABLE public.banka OWNER TO postgres;

--
-- Name: banka_banka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banka_banka_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banka_banka_id_seq OWNER TO postgres;

--
-- Name: banka_banka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banka_banka_id_seq OWNED BY public.banka.banka_id;


--
-- Name: banka_hesap_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banka_hesap_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banka_hesap_no_seq OWNER TO postgres;

--
-- Name: banka_hesap_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banka_hesap_no_seq OWNED BY public.banka.hesap_no;


--
-- Name: fatura_bilgi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fatura_bilgi (
    fatura_bilgi_id integer NOT NULL,
    sira_no integer NOT NULL,
    tarih date NOT NULL,
    teslim_alan character varying(2044) NOT NULL,
    teslim_eden character varying(2044) NOT NULL,
    stok integer NOT NULL
);


ALTER TABLE public.fatura_bilgi OWNER TO postgres;

--
-- Name: fatura_bilgi_fatura_bilgi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fatura_bilgi_fatura_bilgi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fatura_bilgi_fatura_bilgi_id_seq OWNER TO postgres;

--
-- Name: fatura_bilgi_fatura_bilgi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fatura_bilgi_fatura_bilgi_id_seq OWNED BY public.fatura_bilgi.fatura_bilgi_id;


--
-- Name: fatura_detay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fatura_detay (
    fatura_urun_id integer NOT NULL,
    miktar integer NOT NULL,
    fiyat integer NOT NULL,
    tutar integer NOT NULL,
    fatura_id integer NOT NULL,
    urun_id integer NOT NULL
);


ALTER TABLE public.fatura_detay OWNER TO postgres;

--
-- Name: fatura_detay_fatura_urun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fatura_detay_fatura_urun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fatura_detay_fatura_urun_id_seq OWNER TO postgres;

--
-- Name: fatura_detay_fatura_urun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fatura_detay_fatura_urun_id_seq OWNED BY public.fatura_detay.fatura_urun_id;


--
-- Name: firma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firma (
    firma_id integer NOT NULL,
    ad character varying(2044) NOT NULL,
    "yetkili_statü" character varying(2044) NOT NULL,
    yetkili_adi character varying(2044) NOT NULL,
    telefon integer NOT NULL,
    email character varying(2044) NOT NULL,
    banka_id integer NOT NULL,
    sehir character varying(2044) NOT NULL
);


ALTER TABLE public.firma OWNER TO postgres;

--
-- Name: firma_firma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firma_firma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firma_firma_id_seq OWNER TO postgres;

--
-- Name: firma_firma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firma_firma_id_seq OWNED BY public.firma.firma_id;


--
-- Name: firma_hareketler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firma_hareketler (
    hareket_id integer NOT NULL,
    urun_id integer NOT NULL,
    adet integer NOT NULL,
    personel_id integer NOT NULL,
    firma_id integer NOT NULL,
    fiyat integer NOT NULL,
    tarih date NOT NULL
);


ALTER TABLE public.firma_hareketler OWNER TO postgres;

--
-- Name: firma_hareketler_hareket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firma_hareketler_hareket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firma_hareketler_hareket_id_seq OWNER TO postgres;

--
-- Name: firma_hareketler_hareket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firma_hareketler_hareket_id_seq OWNED BY public.firma_hareketler.hareket_id;


--
-- Name: gider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gider (
    gider_id integer NOT NULL,
    elektrik character varying(2044) NOT NULL,
    su character varying(2044) NOT NULL,
    "doğalgaz" character varying(2044) NOT NULL,
    internet character varying(2044) NOT NULL,
    ekstra character varying(2044) NOT NULL
);


ALTER TABLE public.gider OWNER TO postgres;

--
-- Name: gider_gider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gider_gider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gider_gider_id_seq OWNER TO postgres;

--
-- Name: gider_gider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gider_gider_id_seq OWNED BY public.gider.gider_id;


--
-- Name: gider_not; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gider_not (
    gider_not_id integer NOT NULL,
    not_id integer NOT NULL,
    gider_id integer NOT NULL
);


ALTER TABLE public.gider_not OWNER TO postgres;

--
-- Name: gider_not_gider_not_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gider_not_gider_not_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gider_not_gider_not_id_seq OWNER TO postgres;

--
-- Name: gider_not_gider_not_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gider_not_gider_not_id_seq OWNED BY public.gider_not.gider_not_id;


--
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    ilce_id integer NOT NULL,
    ilce_adi character varying(2044) NOT NULL,
    il_id integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- Name: ilce_ilce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilce_ilce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilce_ilce_id_seq OWNER TO postgres;

--
-- Name: ilce_ilce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilce_ilce_id_seq OWNED BY public.ilce.ilce_id;


--
-- Name: iller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iller (
    il_id integer NOT NULL,
    sehir_adi character varying(2044) NOT NULL
);


ALTER TABLE public.iller OWNER TO postgres;

--
-- Name: iller_il_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iller_il_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iller_il_seq OWNER TO postgres;

--
-- Name: iller_il_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iller_il_seq OWNED BY public.iller.il_id;


--
-- Name: musteri_hareketler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri_hareketler (
    hareket_id integer NOT NULL,
    urun_id integer NOT NULL,
    adet integer NOT NULL,
    personel_id integer NOT NULL,
    musteri_id integer NOT NULL,
    fiyat integer NOT NULL,
    fatura_id integer NOT NULL
);


ALTER TABLE public.musteri_hareketler OWNER TO postgres;

--
-- Name: musteri_hareketler_hareket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musteri_hareketler_hareket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musteri_hareketler_hareket_id_seq OWNER TO postgres;

--
-- Name: musteri_hareketler_hareket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musteri_hareketler_hareket_id_seq OWNED BY public.musteri_hareketler.hareket_id;


--
-- Name: not; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."not" (
    not_id integer NOT NULL,
    tarih date NOT NULL,
    baslik character varying(2044) NOT NULL,
    detay character varying(2044) NOT NULL,
    olusturan_kisi character varying(2044) NOT NULL
);


ALTER TABLE public."not" OWNER TO postgres;

--
-- Name: not_not_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.not_not_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.not_not_id_seq OWNER TO postgres;

--
-- Name: not_not_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.not_not_id_seq OWNED BY public."not".not_id;


--
-- Name: not_personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.not_personel (
    not_personel_id integer NOT NULL,
    not_id integer NOT NULL,
    personel_id integer NOT NULL
);


ALTER TABLE public.not_personel OWNER TO postgres;

--
-- Name: not_personel_not_personel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.not_personel_not_personel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.not_personel_not_personel_id_seq OWNER TO postgres;

--
-- Name: not_personel_not_personel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.not_personel_not_personel_id_seq OWNED BY public.not_personel.not_personel_id;


--
-- Name: stok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stok (
    stok_id integer NOT NULL,
    stok_turu integer NOT NULL,
    stok_adedi integer NOT NULL
);


ALTER TABLE public.stok OWNER TO postgres;

--
-- Name: stok_stok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stok_stok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stok_stok_id_seq OWNER TO postgres;

--
-- Name: stok_stok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stok_stok_id_seq OWNED BY public.stok.stok_id;


--
-- Name: urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urun (
    urun_id integer NOT NULL,
    urun_ad character varying(2044) NOT NULL,
    marka character varying(2044) NOT NULL,
    model character varying(2044) NOT NULL,
    "yıl" integer NOT NULL,
    adet integer NOT NULL,
    "alış_fiyat" integer NOT NULL,
    "satış_fiyat" integer NOT NULL
);


ALTER TABLE public.urun OWNER TO postgres;

--
-- Name: urun_urun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urun_urun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urun_urun_id_seq OWNER TO postgres;

--
-- Name: urun_urun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urun_urun_id_seq OWNED BY public.urun.urun_id;


--
-- Name: Kisi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi" ALTER COLUMN id SET DEFAULT nextval('public."Kisi_id_seq"'::regclass);


--
-- Name: banka banka_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banka ALTER COLUMN banka_id SET DEFAULT nextval('public.banka_banka_id_seq'::regclass);


--
-- Name: banka hesap_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banka ALTER COLUMN hesap_no SET DEFAULT nextval('public.banka_hesap_no_seq'::regclass);


--
-- Name: fatura_bilgi fatura_bilgi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_bilgi ALTER COLUMN fatura_bilgi_id SET DEFAULT nextval('public.fatura_bilgi_fatura_bilgi_id_seq'::regclass);


--
-- Name: fatura_detay fatura_urun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_detay ALTER COLUMN fatura_urun_id SET DEFAULT nextval('public.fatura_detay_fatura_urun_id_seq'::regclass);


--
-- Name: firma firma_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma ALTER COLUMN firma_id SET DEFAULT nextval('public.firma_firma_id_seq'::regclass);


--
-- Name: firma_hareketler hareket_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_hareketler ALTER COLUMN hareket_id SET DEFAULT nextval('public.firma_hareketler_hareket_id_seq'::regclass);


--
-- Name: gider gider_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider ALTER COLUMN gider_id SET DEFAULT nextval('public.gider_gider_id_seq'::regclass);


--
-- Name: gider_not gider_not_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider_not ALTER COLUMN gider_not_id SET DEFAULT nextval('public.gider_not_gider_not_id_seq'::regclass);


--
-- Name: ilce ilce_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce ALTER COLUMN ilce_id SET DEFAULT nextval('public.ilce_ilce_id_seq'::regclass);


--
-- Name: iller il_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller ALTER COLUMN il_id SET DEFAULT nextval('public.iller_il_seq'::regclass);


--
-- Name: musteri id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri ALTER COLUMN id SET DEFAULT nextval('public."Musteri_id_seq"'::regclass);


--
-- Name: musteri_hareketler hareket_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_hareketler ALTER COLUMN hareket_id SET DEFAULT nextval('public.musteri_hareketler_hareket_id_seq'::regclass);


--
-- Name: not not_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."not" ALTER COLUMN not_id SET DEFAULT nextval('public.not_not_id_seq'::regclass);


--
-- Name: not_personel not_personel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.not_personel ALTER COLUMN not_personel_id SET DEFAULT nextval('public.not_personel_not_personel_id_seq'::regclass);


--
-- Name: personel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel ALTER COLUMN id SET DEFAULT nextval('public."Personel_id_seq"'::regclass);


--
-- Name: stok stok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok ALTER COLUMN stok_id SET DEFAULT nextval('public.stok_stok_id_seq'::regclass);


--
-- Name: urun urun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun ALTER COLUMN urun_id SET DEFAULT nextval('public.urun_urun_id_seq'::regclass);


--
-- Data for Name: Kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kisi" VALUES
	(1, 2),
	(2, 3),
	(3, 7),
	(4, 13),
	(5, 1),
	(6, 15);


--
-- Data for Name: banka; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.banka VALUES
	(1, 'agbank', 'Akatlar', '234234', 1, 5),
	(2, 'iz bankası', 'Tutuklar', '23423423', 2, 3),
	(3, 'Kapı Kredi', 'Tutunamayalar', '56153133', 3, 14),
	(4, 'İcraat Bankası', 'Tutanlar', '613513279', 4, 22),
	(5, 'Laranti Bankası', 'Merkez', '42', 5, 1);


--
-- Data for Name: fatura_bilgi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fatura_bilgi VALUES
	(1, 2, '1920-02-12', 'Ali', 'Veli', 4),
	(2, 7, '1940-06-14', '49', '50', 14),
	(3, 5, '1960-08-08', 'Demet', 'Akbağ', 3),
	(4, 9, '1980-10-10', 'Fatih ', 'Terim', 50);


--
-- Data for Name: fatura_detay; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fatura_detay VALUES
	(1, 2, 5, 10, 1, 1),
	(2, 5, 2, 10, 2, 2),
	(3, 3, 30, 90, 3, 3);


--
-- Data for Name: firma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.firma VALUES
	(1, 'CBU Tech', 'CEO', 'Oguz', 523423, 'oguz@cbu.com', 1, 'Sakarya'),
	(2, 'İshkembe Studios', 'Çalışan', 'Baha', 23423432, 'baha@ishkembe.com', 2, 'Sakarya'),
	(3, 'microsoft', 'Yazılımcı', 'Bill kapı', 123123123, 'bilo@hotmail.com', 3, 'Kars');


--
-- Data for Name: firma_hareketler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.firma_hareketler VALUES
	(1, 1, 30, 4, 1, 50, '1990-12-12'),
	(2, 2, 40, 5, 2, 70, '2000-12-12'),
	(3, 3, 50, 6, 3, 90, '2010-12-14');


--
-- Data for Name: gider; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gider VALUES
	(1, '100', '120', '0', '55', '300'),
	(2, '120', '100', '120', '70', '200'),
	(3, '150', '150', '300', '120', '400');


--
-- Data for Name: gider_not; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gider_not VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);


--
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilce VALUES
	(1, 'Serdivan', 54),
	(2, 'Ürgüp', 50),
	(3, 'Kartal', 34),
	(4, 'Ümraniye', 34);


--
-- Data for Name: iller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.iller VALUES
	(34, 'İstanbul'),
	(54, 'Sakarya'),
	(41, 'Kocaeli'),
	(35, 'İzmir'),
	(50, 'Nevşehir');


--
-- Data for Name: musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteri VALUES
	(1, 'Murtaza', 'Keltaza', 55555555, 'murto@hotmail.com', 'İstanbul', 'Kadıköy', 'bahariye mah.', NULL),
	(2, 'Arda', 'Arca', 44444444, 'arda@yahoo.com', 'İstanbul', 'Beşiktaş', 'dikilitaş mah.', NULL),
	(3, 'Hak', 'Kah', 1231321, 'hakah@gmail.com', 'Hakkari', 'Merkez', 'merkez mah.', NULL);


--
-- Data for Name: musteri_hareketler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteri_hareketler VALUES
	(1, 1, 50, 4, 1, 20, 1),
	(2, 2, 60, 5, 2, 60, 2),
	(3, 3, 70, 6, 3, 500, 3);


--
-- Data for Name: not; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."not" VALUES
	(1, '1999-12-07', 'Önemli', 'çok ama çok önemli', 'Çalışan1'),
	(2, '1999-08-17', 'Satma', '42 nolu müşteriye bişey satma', 'çalışan2'),
	(3, '2001-01-30', 'Saygı', '14 nolu müşteriye saygılı davran', 'çalışan3');


--
-- Data for Name: not_personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.not_personel VALUES
	(1, 1, 5),
	(2, 2, 6),
	(3, 3, 4);


--
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personel VALUES
	(4, 'Efe', 'Fikret', '02161232424', 5555556, 'fiko@gmail.com', 'İstanbul', 'Maltepe', NULL),
	(5, 'Ufuk', 'Kurt', '02123215050', 5555557, 'ek@mali.com', 'İstanbul', 'Üsküdar', NULL),
	(6, 'Nisa', 'Can', '026412352', 5555558, 'nisa@gmail.com', 'Kocaeli', 'Karamürsel', NULL);


--
-- Data for Name: stok; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stok VALUES
	(1, 3, 500),
	(2, 14, 100000),
	(3, 2, 50),
	(4, 9, 167);


--
-- Data for Name: urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.urun VALUES
	(1, 'Sakız', 'oreo', '2020', 2020, 15, 3, 4),
	(2, 'Mouse', 'Everst', 'SGM X7', 2020, 1, 1, 50),
	(3, 'Cerrahi Maske', 'Farketmiyor', 'Klasik', 2020, 999999, 1, 5);


--
-- Name: Kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kisi_id_seq"', 8, true);


--
-- Name: Musteri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Musteri_id_seq"', 2, true);


--
-- Name: Personel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Personel_id_seq"', 1, false);


--
-- Name: banka_banka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banka_banka_id_seq', 5, true);


--
-- Name: banka_hesap_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banka_hesap_no_seq', 5, true);


--
-- Name: fatura_bilgi_fatura_bilgi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fatura_bilgi_fatura_bilgi_id_seq', 4, true);


--
-- Name: fatura_detay_fatura_urun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fatura_detay_fatura_urun_id_seq', 3, true);


--
-- Name: firma_firma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firma_firma_id_seq', 1, true);


--
-- Name: firma_hareketler_hareket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firma_hareketler_hareket_id_seq', 3, true);


--
-- Name: gider_gider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gider_gider_id_seq', 3, true);


--
-- Name: gider_not_gider_not_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gider_not_gider_not_id_seq', 3, true);


--
-- Name: ilce_ilce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilce_ilce_id_seq', 1, false);


--
-- Name: iller_il_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iller_il_seq', 1, false);


--
-- Name: musteri_hareketler_hareket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musteri_hareketler_hareket_id_seq', 3, true);


--
-- Name: not_not_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.not_not_id_seq', 2, true);


--
-- Name: not_personel_not_personel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.not_personel_not_personel_id_seq', 3, true);


--
-- Name: stok_stok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stok_stok_id_seq', 4, true);


--
-- Name: urun_urun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urun_urun_id_seq', 3, true);


--
-- Name: Kisi Kisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi"
    ADD CONSTRAINT "Kisi_pkey" PRIMARY KEY (id);


--
-- Name: musteri Musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT "Musteri_pkey" PRIMARY KEY (id);


--
-- Name: personel Personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "Personel_pkey" PRIMARY KEY (id);


--
-- Name: banka banka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banka
    ADD CONSTRAINT banka_pkey PRIMARY KEY (banka_id);


--
-- Name: fatura_bilgi fatura_bilgi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_bilgi
    ADD CONSTRAINT fatura_bilgi_pkey PRIMARY KEY (fatura_bilgi_id);


--
-- Name: fatura_detay fatura_detay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_detay
    ADD CONSTRAINT fatura_detay_pkey PRIMARY KEY (fatura_urun_id);


--
-- Name: firma_hareketler firma_hareketler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_hareketler
    ADD CONSTRAINT firma_hareketler_pkey PRIMARY KEY (hareket_id);


--
-- Name: firma firma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma
    ADD CONSTRAINT firma_pkey PRIMARY KEY (firma_id);


--
-- Name: gider_not gider_not_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider_not
    ADD CONSTRAINT gider_not_pkey PRIMARY KEY (gider_not_id);


--
-- Name: gider gider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider
    ADD CONSTRAINT gider_pkey PRIMARY KEY (gider_id);


--
-- Name: ilce ilce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT ilce_pkey PRIMARY KEY (ilce_id);


--
-- Name: iller iller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller
    ADD CONSTRAINT iller_pkey PRIMARY KEY (il_id);


--
-- Name: musteri_hareketler musteri_hareketler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_hareketler
    ADD CONSTRAINT musteri_hareketler_pkey PRIMARY KEY (hareket_id);


--
-- Name: not_personel not_personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.not_personel
    ADD CONSTRAINT not_personel_pkey PRIMARY KEY (not_personel_id);


--
-- Name: not not_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."not"
    ADD CONSTRAINT not_pkey PRIMARY KEY (not_id);


--
-- Name: stok stok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stok
    ADD CONSTRAINT stok_pkey PRIMARY KEY (stok_id);


--
-- Name: urun urun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urun
    ADD CONSTRAINT urun_pkey PRIMARY KEY (urun_id);


--
-- Name: not bosluk_sil; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER bosluk_sil BEFORE INSERT ON public."not" FOR EACH ROW EXECUTE PROCEDURE public.bosluk_sil();


--
-- Name: firma isim_buyult; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER isim_buyult BEFORE INSERT ON public.firma FOR EACH ROW EXECUTE PROCEDURE public.isim_buyult();


--
-- Name: fatura_bilgi tarih_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tarih_guncelle BEFORE INSERT ON public.fatura_bilgi FOR EACH ROW EXECUTE PROCEDURE public.tarih_guncelle();


--
-- Name: musteri lnk_Kisi_Musteri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT "lnk_Kisi_Musteri" FOREIGN KEY (id) REFERENCES public."Kisi"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personel lnk_Kisi_Personel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "lnk_Kisi_Personel" FOREIGN KEY (id) REFERENCES public."Kisi"(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musteri_hareketler lnk_Musteri_musteri_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_hareketler
    ADD CONSTRAINT "lnk_Musteri_musteri_hareketler" FOREIGN KEY (musteri_id) REFERENCES public.musteri(id) MATCH FULL;


--
-- Name: firma_hareketler lnk_Personel_firma_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_hareketler
    ADD CONSTRAINT "lnk_Personel_firma_hareketler" FOREIGN KEY (personel_id) REFERENCES public.personel(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musteri_hareketler lnk_Personel_musteri_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_hareketler
    ADD CONSTRAINT "lnk_Personel_musteri_hareketler" FOREIGN KEY (personel_id) REFERENCES public.personel(id) MATCH FULL;


--
-- Name: not_personel lnk_Personel_not_personel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.not_personel
    ADD CONSTRAINT "lnk_Personel_not_personel" FOREIGN KEY (personel_id) REFERENCES public.personel(id) MATCH FULL;


--
-- Name: firma lnk_banka_firma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma
    ADD CONSTRAINT lnk_banka_firma FOREIGN KEY (banka_id) REFERENCES public.banka(banka_id) MATCH FULL;


--
-- Name: fatura_detay lnk_fatura_bilgi_fatura_detay; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_detay
    ADD CONSTRAINT lnk_fatura_bilgi_fatura_detay FOREIGN KEY (fatura_id) REFERENCES public.fatura_bilgi(fatura_bilgi_id) MATCH FULL;


--
-- Name: firma_hareketler lnk_firma_firma_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_hareketler
    ADD CONSTRAINT lnk_firma_firma_hareketler FOREIGN KEY (firma_id) REFERENCES public.firma(firma_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: gider_not lnk_gider_gider_not; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider_not
    ADD CONSTRAINT lnk_gider_gider_not FOREIGN KEY (gider_id) REFERENCES public.gider(gider_id) MATCH FULL;


--
-- Name: ilce lnk_iller_ilce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT lnk_iller_ilce FOREIGN KEY (il_id) REFERENCES public.iller(il_id) MATCH FULL;


--
-- Name: gider_not lnk_not_gider_not; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gider_not
    ADD CONSTRAINT lnk_not_gider_not FOREIGN KEY (not_id) REFERENCES public."not"(not_id) MATCH FULL;


--
-- Name: not_personel lnk_not_not_personel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.not_personel
    ADD CONSTRAINT lnk_not_not_personel FOREIGN KEY (not_id) REFERENCES public."not"(not_id) MATCH FULL;


--
-- Name: fatura_detay lnk_urun_fatura_detay; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura_detay
    ADD CONSTRAINT lnk_urun_fatura_detay FOREIGN KEY (urun_id) REFERENCES public.urun(urun_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: firma_hareketler lnk_urun_firma_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_hareketler
    ADD CONSTRAINT lnk_urun_firma_hareketler FOREIGN KEY (urun_id) REFERENCES public.urun(urun_id) MATCH FULL;


--
-- Name: musteri_hareketler lnk_urun_musteri_hareketler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri_hareketler
    ADD CONSTRAINT lnk_urun_musteri_hareketler FOREIGN KEY (urun_id) REFERENCES public.urun(urun_id) MATCH FULL;


--
-- PostgreSQL database dump complete
--

