--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-11-28 21:19:31

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
-- TOC entry 6 (class 2615 OID 16604)
-- Name: bgpmonsec_project; Type: SCHEMA; Schema: -; Owner: bgpmonsec_user
--

CREATE SCHEMA bgpmonsec_project;


ALTER SCHEMA bgpmonsec_project OWNER TO bgpmonsec_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 253 (class 1259 OID 16704)
-- Name: alerts; Type: TABLE; Schema: bgpmonsec_project; Owner: postgres
--

CREATE TABLE bgpmonsec_project.alerts (
    "ID" integer NOT NULL,
    router_id character varying,
    alert_type character varying,
    alert_name character varying,
    description character varying,
    "timestamp" timestamp without time zone,
    was_readed character varying
);


ALTER TABLE bgpmonsec_project.alerts OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16703)
-- Name: alerts_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: postgres
--

ALTER TABLE bgpmonsec_project.alerts ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."alerts_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16612)
-- Name: bgp_summary; Type: TABLE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

CREATE TABLE bgpmonsec_project.bgp_summary (
    router_id character varying NOT NULL,
    neighbor_ip character varying,
    state character varying,
    uptime character varying,
    flaps character varying,
    "timestamp" timestamp without time zone NOT NULL,
    "as" character varying,
    "ID" integer NOT NULL
);


ALTER TABLE bgpmonsec_project.bgp_summary OWNER TO bgpmonsec_user;

--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE bgp_summary; Type: COMMENT; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COMMENT ON TABLE bgpmonsec_project.bgp_summary IS 'Detalii sh ip bgp summary';


--
-- TOC entry 244 (class 1259 OID 16627)
-- Name: bgp_summary_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

ALTER TABLE bgpmonsec_project.bgp_summary ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."bgp_summary_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 16657)
-- Name: router_cpu_memory; Type: TABLE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

CREATE TABLE bgpmonsec_project.router_cpu_memory (
    "ID" integer NOT NULL,
    router_id character varying,
    cpu character varying,
    memory character varying,
    "timestamp" timestamp without time zone
);


ALTER TABLE bgpmonsec_project.router_cpu_memory OWNER TO bgpmonsec_user;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE router_cpu_memory; Type: COMMENT; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COMMENT ON TABLE bgpmonsec_project.router_cpu_memory IS 'ROUTER CPU and TEMPERATURE STORE';


--
-- TOC entry 246 (class 1259 OID 16656)
-- Name: router_cpu_memory_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

ALTER TABLE bgpmonsec_project.router_cpu_memory ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."router_cpu_memory_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 16605)
-- Name: router_details; Type: TABLE; Schema: bgpmonsec_project; Owner: postgres
--

CREATE TABLE bgpmonsec_project.router_details (
    router_id character varying NOT NULL,
    version character varying,
    memory character varying,
    "IP" character varying,
    hostname character varying,
    uptime character varying,
    ios character varying,
    serial character varying,
    model character varying
);


ALTER TABLE bgpmonsec_project.router_details OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16696)
-- Name: rpki_router_connection_config; Type: TABLE; Schema: bgpmonsec_project; Owner: postgres
--

CREATE TABLE bgpmonsec_project.rpki_router_connection_config (
    "ID" integer NOT NULL,
    router_id character varying NOT NULL,
    config_status character varying,
    rpki_server_connection_from_router character varying
);


ALTER TABLE bgpmonsec_project.rpki_router_connection_config OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16695)
-- Name: rpki_router_connection_config_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: postgres
--

ALTER TABLE bgpmonsec_project.rpki_router_connection_config ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."rpki_router_connection_config_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 16681)
-- Name: rpki_server; Type: TABLE; Schema: bgpmonsec_project; Owner: postgres
--

CREATE TABLE bgpmonsec_project.rpki_server (
    "ID" integer NOT NULL,
    name character varying,
    ip character varying,
    port character varying,
    refresh_timer character varying,
    web_port character varying
);


ALTER TABLE bgpmonsec_project.rpki_server OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16680)
-- Name: rpki_server_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: postgres
--

ALTER TABLE bgpmonsec_project.rpki_server ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."rpki_server_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 16619)
-- Name: sh_bgp_ip; Type: TABLE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

CREATE TABLE bgpmonsec_project.sh_bgp_ip (
    router_id character varying,
    network_with_mask character varying,
    mask character varying,
    metric character varying,
    locpref character varying,
    weight character varying,
    path character varying,
    next_hop character varying,
    "timestamp" timestamp without time zone,
    network character varying,
    "ID" integer NOT NULL,
    rpki_status character varying(10)
);


ALTER TABLE bgpmonsec_project.sh_bgp_ip OWNER TO bgpmonsec_user;

--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN sh_bgp_ip.rpki_status; Type: COMMENT; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COMMENT ON COLUMN bgpmonsec_project.sh_bgp_ip.rpki_status IS 'Statusul RPKI: Valid, Invalid, Unknown';


--
-- TOC entry 245 (class 1259 OID 16633)
-- Name: sh_bgp_ip_ID_seq; Type: SEQUENCE; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

ALTER TABLE bgpmonsec_project.sh_bgp_ip ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME bgpmonsec_project."sh_bgp_ip_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 16579)
-- Name: ROUTERS_INPUT; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public."ROUTERS_INPUT" (
    router_id character varying(255) NOT NULL,
    "IP" character varying,
    username character varying,
    password character varying,
    description character varying(1000),
    r_state character varying,
    id integer NOT NULL,
    downtime timestamp without time zone
);


ALTER TABLE public."ROUTERS_INPUT" OWNER TO bgpmonsec_user;

--
-- TOC entry 240 (class 1259 OID 16596)
-- Name: ROUTERS_INPUT_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public."ROUTERS_INPUT_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ROUTERS_INPUT_id_seq" OWNER TO bgpmonsec_user;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 240
-- Name: ROUTERS_INPUT_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public."ROUTERS_INPUT_id_seq" OWNED BY public."ROUTERS_INPUT".id;


--
-- TOC entry 219 (class 1259 OID 16412)
-- Name: account_routerinput; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.account_routerinput (
    id bigint NOT NULL,
    ip_address inet NOT NULL,
    protocol character varying(10) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.account_routerinput OWNER TO bgpmonsec_user;

--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: account_routerinput_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.account_routerinput_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_routerinput_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_routerinput_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.account_routerinput_id_seq OWNED BY public.account_routerinput.id;


--
-- TOC entry 225 (class 1259 OID 16437)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO bgpmonsec_user;

--
-- TOC entry 224 (class 1259 OID 16436)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 224
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 227 (class 1259 OID 16446)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO bgpmonsec_user;

--
-- TOC entry 226 (class 1259 OID 16445)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 223 (class 1259 OID 16430)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO bgpmonsec_user;

--
-- TOC entry 222 (class 1259 OID 16429)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 229 (class 1259 OID 16453)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO bgpmonsec_user;

--
-- TOC entry 231 (class 1259 OID 16462)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO bgpmonsec_user;

--
-- TOC entry 230 (class 1259 OID 16461)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 228 (class 1259 OID 16452)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 233 (class 1259 OID 16469)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO bgpmonsec_user;

--
-- TOC entry 232 (class 1259 OID 16468)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 235 (class 1259 OID 16528)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO bgpmonsec_user;

--
-- TOC entry 234 (class 1259 OID 16527)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 221 (class 1259 OID 16421)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO bgpmonsec_user;

--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 217 (class 1259 OID 16403)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO bgpmonsec_user;

--
-- TOC entry 216 (class 1259 OID 16402)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 236 (class 1259 OID 16557)
-- Name: django_session; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO bgpmonsec_user;

--
-- TOC entry 238 (class 1259 OID 16567)
-- Name: userprofile_profile; Type: TABLE; Schema: public; Owner: bgpmonsec_user
--

CREATE TABLE public.userprofile_profile (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    bio character varying(140) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.userprofile_profile OWNER TO bgpmonsec_user;

--
-- TOC entry 237 (class 1259 OID 16566)
-- Name: userprofile_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: bgpmonsec_user
--

CREATE SEQUENCE public.userprofile_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.userprofile_profile_id_seq OWNER TO bgpmonsec_user;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 237
-- Name: userprofile_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bgpmonsec_user
--

ALTER SEQUENCE public.userprofile_profile_id_seq OWNED BY public.userprofile_profile.id;


--
-- TOC entry 4793 (class 2604 OID 16597)
-- Name: ROUTERS_INPUT id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public."ROUTERS_INPUT" ALTER COLUMN id SET DEFAULT nextval('public."ROUTERS_INPUT_id_seq"'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16415)
-- Name: account_routerinput id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.account_routerinput ALTER COLUMN id SET DEFAULT nextval('public.account_routerinput_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 16440)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16449)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 16433)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16456)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 16465)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16472)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16531)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 16424)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 16406)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 16570)
-- Name: userprofile_profile id; Type: DEFAULT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.userprofile_profile ALTER COLUMN id SET DEFAULT nextval('public.userprofile_profile_id_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 16704)
-- Dependencies: 253
-- Data for Name: alerts; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: postgres
--

COPY bgpmonsec_project.alerts ("ID", router_id, alert_type, alert_name, description, "timestamp", was_readed) FROM stdin;
1	07112416161534109	RPKI Connection	RPKI Server Disconnected	The RPKI server connection for router 07112416161534109 is lost.	2024-11-28 21:07:25.257701	true
2	07112416161534109	RPKI Connection	RPKI Server Disconnected	The RPKI server connection for router 07112416161534109 is lost.	2024-11-28 21:07:35.308854	true
3	07112416161534109	RPKI Connection	RPKI Server Disconnected	The RPKI server connection for router 07112416161534109 is lost.	2024-11-28 21:07:55.854335	true
4	07112416161534109	RPKI Connection	RPKI Server Disconnected	The RPKI server connection for router 07112416161534109 is lost.	2024-11-28 21:08:06.002535	true
\.


--
-- TOC entry 5032 (class 0 OID 16612)
-- Dependencies: 242
-- Data for Name: bgp_summary; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COPY bgpmonsec_project.bgp_summary (router_id, neighbor_ip, state, uptime, flaps, "timestamp", "as", "ID") FROM stdin;
07112416161534109	192.168.10.1	4	00:06:31	0	2024-11-27 17:43:40.663775	14618	8599
07112416161534109	192.168.10.1	4	00:06:54	0	2024-11-27 17:44:03.570664	14618	8600
07112416161534109	192.168.10.1	4	00:07:24	0	2024-11-27 17:44:33.580037	14618	8601
07112416161534109	192.168.10.1	4	00:07:54	0	2024-11-27 17:45:03.563808	14618	8602
07112416161534109	192.168.10.1	4	00:08:24	0	2024-11-27 17:45:33.572239	14618	8603
07112416161534109	192.168.10.1	4	00:08:54	0	2024-11-27 17:46:03.575065	14618	8604
07112416161534109	192.168.10.1	4	00:10:10	0	2024-11-27 17:47:19.987665	14618	8605
07112416161534109	192.168.10.1	4	00:10:15	0	2024-11-27 17:47:24.919673	14618	8606
07112416161534109	192.168.10.1	4	00:10:45	0	2024-11-27 17:47:54.922367	14618	8607
07112416161534109	192.168.10.1	4	00:11:15	0	2024-11-27 17:48:24.929837	14618	8608
07112416161534109	192.168.10.1	4	00:11:45	0	2024-11-27 17:48:54.93057	14618	8609
07112416161534109	192.168.10.1	4	00:12:10	0	2024-11-27 17:49:20.035765	14618	8610
07112416161534109	192.168.10.1	4	00:12:40	0	2024-11-27 17:49:50.034453	14618	8611
07112416161534109	192.168.10.1	4	00:13:10	0	2024-11-27 17:50:20.035825	14618	8612
07112416161534109	192.168.10.1	4	00:13:18	0	2024-11-27 17:50:27.987227	14618	8613
07112416161534109	192.168.10.1	4	00:13:49	0	2024-11-27 17:50:58.505706	14618	8614
07112416161534109	192.168.10.1	4	00:13:49	0	2024-11-27 17:50:58.883512	14618	8615
07112416161534109	192.168.10.1	4	00:14:19	0	2024-11-27 17:51:28.879505	14618	8616
07112416161534109	192.168.10.1	4	00:14:49	0	2024-11-27 17:51:58.883559	14618	8617
07112416161534109	192.168.10.1	4	00:14:51	0	2024-11-27 17:52:00.90525	14618	8618
07112416161534109	192.168.10.1	4	00:15:07	0	2024-11-27 17:52:16.986487	14618	8619
07112416161534109	192.168.10.1	4	00:15:37	0	2024-11-27 17:52:46.979091	14618	8620
07112416161534109	192.168.10.1	4	00:16:02	0	2024-11-27 17:53:11.494439	14618	8621
07112416161534109	192.168.10.1	4	00:18:30	0	2024-11-27 17:55:39.815828	14618	8622
07112416161534109	192.168.10.1	4	00:18:50	0	2024-11-27 17:56:00.067925	14618	8623
07112416161534109	192.168.10.1	4	00:19:10	0	2024-11-27 17:56:20.384787	14618	8624
07112416161534109	192.168.10.1	4	00:19:19	0	2024-11-27 17:56:28.893686	14618	8625
07112416161534109	192.168.10.1	4	00:19:49	0	2024-11-27 17:56:58.892859	14618	8626
07112416161534109	192.168.10.1	4	00:20:20	0	2024-11-27 17:57:30.423256	14618	8627
07112416161534109	192.168.10.1	4	00:20:49	0	2024-11-27 17:57:58.888799	14618	8628
07112416161534109	192.168.10.1	4	00:21:04	0	2024-11-27 17:58:14.084397	14618	8629
07112416161534109	192.168.10.1	4	00:21:26	0	2024-11-27 17:58:35.684567	14618	8630
07112416161534109	192.168.10.1	4	00:21:57	0	2024-11-27 17:59:06.810903	14618	8631
07112416161534109	192.168.10.1	4	00:21:57	0	2024-11-27 17:59:06.842433	14618	8632
07112416161534109	192.168.10.1	4	00:22:29	0	2024-11-27 17:59:39.193194	14618	8633
07112416161534109	192.168.10.1	4	00:22:59	0	2024-11-27 18:00:09.190696	14618	8634
07112416161534109	192.168.10.1	4	00:23:29	0	2024-11-27 18:00:39.190649	14618	8635
07112416161534109	192.168.10.1	4	00:23:59	0	2024-11-27 18:01:09.187153	14618	8636
07112416161534109	192.168.10.1	4	00:24:29	0	2024-11-27 18:01:39.187386	14618	8637
07112416161534109	192.168.10.1	4	00:24:59	0	2024-11-27 18:02:09.209094	14618	8638
07112416161534109	192.168.10.1	4	00:25:26	0	2024-11-27 18:02:35.522104	14618	8639
07112416161534109	192.168.10.1	4	00:25:54	0	2024-11-27 18:03:03.447085	14618	8640
07112416161534109	192.168.10.1	4	00:26:07	0	2024-11-27 18:03:16.570003	14618	8641
07112416161534109	192.168.10.1	4	00:26:37	0	2024-11-27 18:03:46.570816	14618	8642
07112416161534109	192.168.10.1	4	00:27:07	0	2024-11-27 18:04:16.571046	14618	8643
07112416161534109	192.168.10.1	4	00:27:26	0	2024-11-27 18:04:36.359423	14618	8644
07112416161534109	192.168.10.1	4	00:27:56	0	2024-11-27 18:05:06.358796	14618	8645
07112416161534109	192.168.10.1	4	00:28:26	0	2024-11-27 18:05:36.366466	14618	8646
07112416161534109	192.168.10.1	4	00:28:56	0	2024-11-27 18:06:06.368386	14618	8647
07112416161534109	192.168.10.1	4	00:29:26	0	2024-11-27 18:06:36.364232	14618	8648
07112416161534109	192.168.10.1	4	00:29:56	0	2024-11-27 18:07:06.354794	14618	8649
07112416161534109	192.168.10.1	4	00:29:58	0	2024-11-27 18:07:07.490753	14618	8650
07112416161534109	192.168.10.1	4	00:30:28	0	2024-11-27 18:07:38.256812	14618	8651
07112416161534109	192.168.10.1	4	00:30:58	0	2024-11-27 18:08:08.257975	14618	8652
07112416161534109	192.168.10.1	4	00:31:28	0	2024-11-27 18:08:38.258771	14618	8653
07112416161534109	192.168.10.1	4	00:32:39	0	2024-11-27 18:09:49.26129	14618	8654
07112416161534109	192.168.10.1	4	00:32:55	0	2024-11-27 18:10:04.608449	14618	8655
07112416161534109	192.168.10.1	4	00:33:25	0	2024-11-27 18:10:34.611574	14618	8656
07112416161534109	192.168.10.1	4	00:33:55	0	2024-11-27 18:11:04.612065	14618	8657
07112416161534109	192.168.10.1	4	00:34:25	0	2024-11-27 18:11:34.615121	14618	8658
07112416161534109	192.168.10.1	4	00:34:55	0	2024-11-27 18:12:04.603713	14618	8659
07112416161534109	192.168.10.1	4	00:35:25	0	2024-11-27 18:12:34.614705	14618	8660
07112416161534109	192.168.10.1	4	00:35:53	0	2024-11-27 18:13:02.528561	14618	8661
07112416161534109	192.168.10.1	4	00:36:14	0	2024-11-27 18:13:24.39878	14618	8662
07112416161534109	192.168.10.1	4	00:36:28	0	2024-11-27 18:13:37.635986	14618	8663
07112416161534109	192.168.10.1	4	00:36:58	0	2024-11-27 18:14:07.640455	14618	8664
07112416161534109	192.168.10.1	4	00:37:28	0	2024-11-27 18:14:38.246897	14618	8665
07112416161534109	192.168.10.1	4	00:37:58	0	2024-11-27 18:15:08.255808	14618	8666
07112416161534109	192.168.10.1	4	00:38:48	0	2024-11-27 18:15:58.294039	14618	8667
07112416161534109	192.168.10.1	4	00:38:52	0	2024-11-27 18:16:01.643086	14618	8668
07112416161534109	192.168.10.1	4	00:39:22	0	2024-11-27 18:16:31.640219	14618	8669
07112416161534109	192.168.10.1	4	00:39:36	0	2024-11-27 18:16:46.220101	14618	8670
07112416161534109	192.168.10.1	4	00:40:06	0	2024-11-27 18:17:16.215666	14618	8671
07112416161534109	192.168.10.1	4	00:40:36	0	2024-11-27 18:17:46.253875	14618	8672
07112416161534109	192.168.10.1	4	00:41:06	0	2024-11-27 18:18:16.252586	14618	8673
07112416161534109	192.168.10.1	4	00:41:48	0	2024-11-27 18:18:58.263204	14618	8674
07112416161534109	192.168.10.1	4	00:42:48	0	2024-11-27 18:19:58.249336	14618	8675
07112416161534109	192.168.10.1	4	00:43:48	0	2024-11-27 18:20:58.261566	14618	8676
07112416161534109	192.168.10.1	4	00:44:48	0	2024-11-27 18:21:58.263363	14618	8677
07112416161534109	192.168.10.1	4	00:45:48	0	2024-11-27 18:22:58.25791	14618	8678
07112416161534109	192.168.10.1	4	00:46:48	0	2024-11-27 18:23:58.254433	14618	8679
07112416161534109	192.168.10.1	4	00:47:48	0	2024-11-27 18:24:58.262708	14618	8680
07112416161534109	192.168.10.1	4	00:48:48	0	2024-11-27 18:25:58.257631	14618	8681
07112416161534109	192.168.10.1	4	00:49:48	0	2024-11-27 18:26:58.254859	14618	8682
07112416161534109	192.168.10.1	4	00:50:48	0	2024-11-27 18:27:58.255539	14618	8683
07112416161534109	192.168.10.1	4	00:51:48	0	2024-11-27 18:28:58.255319	14618	8684
07112416161534109	192.168.10.1	4	00:52:48	0	2024-11-27 18:29:58.261166	14618	8685
07112416161534109	192.168.10.1	4	00:53:48	0	2024-11-27 18:30:58.259099	14618	8686
07112416161534109	192.168.10.1	4	00:54:48	0	2024-11-27 18:31:58.262881	14618	8687
07112416161534109	192.168.10.1	4	00:55:48	0	2024-11-27 18:32:58.254287	14618	8688
07112416161534109	192.168.10.1	4	00:56:48	0	2024-11-27 18:33:58.250249	14618	8689
07112416161534109	192.168.10.1	4	00:57:15	0	2024-11-27 18:34:25.105211	14618	8690
07112416161534109	192.168.10.1	4	00:57:16	0	2024-11-27 18:34:26.269972	14618	8691
07112416161534109	192.168.10.1	4	00:57:28	0	2024-11-27 18:34:37.981189	14618	8692
07112416161534109	192.168.10.1	4	01:48:00	0	2024-11-27 19:25:10.324811	14618	8693
07112416161534109	192.168.10.1	4	01:52:54	0	2024-11-27 19:30:03.760351	14618	8694
07112416161534109	192.168.10.1	4	02:27:41	0	2024-11-27 20:04:50.74954	14618	8695
07112416161534109	192.168.10.1	4	02:27:49	0	2024-11-27 20:04:59.168248	14618	8696
07112416161534109	192.168.10.1	4	02:30:29	0	2024-11-27 20:07:38.722184	14618	8697
07112416161534109	192.168.10.1	4	02:30:30	0	2024-11-27 20:07:39.920404	14618	8698
07112416161534109	192.168.10.1	4	02:30:37	0	2024-11-27 20:07:46.452958	14618	8699
07112416161534109	192.168.10.1	4	02:33:42	0	2024-11-27 20:10:52.350563	14618	8700
07112416161534109	192.168.10.1	4	02:33:47	0	2024-11-27 20:10:57.403809	14618	8701
07112416161534109	192.168.10.1	4	03:14:27	0	2024-11-27 20:51:36.597664	14618	8702
07112416161534109	192.168.10.1	4	03:14:30	0	2024-11-27 20:51:39.928078	14618	8703
07112416161534109	192.168.10.1	4	00:12:34	0	2024-11-28 17:44:29.862887	14618	8704
07112416161534109	192.168.10.1	4	02:28:38	0	2024-11-28 20:11:51.247991	14618	8705
28112417573395344	192.168.10.2	1	02:42:50	0	2024-11-28 20:26:36.119927	10	8706
\.


--
-- TOC entry 5037 (class 0 OID 16657)
-- Dependencies: 247
-- Data for Name: router_cpu_memory; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COPY bgpmonsec_project.router_cpu_memory ("ID", router_id, cpu, memory, "timestamp") FROM stdin;
1	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 17:08:11.394049
2	20072418145628243	6%	30.35MB/362.63MB : 8.37%	2024-07-23 17:08:17.520162
3	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 17:08:17.520162
4	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-23 17:08:17.520162
5	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:08:17.520162
6	20072418145628243	17%	30.43MB/362.63MB : 8.39%	2024-07-23 17:39:16.985043
7	20072418145628243	17%	30.44MB/362.63MB : 8.39%	2024-07-23 17:39:17.467491
8	20072418142931314	8%	30.45MB/362.63MB : 8.40%	2024-07-23 17:39:23.196397
9	20072418142931314	8%	30.46MB/362.63MB : 8.40%	2024-07-23 17:39:23.709068
10	28062414365385132	3%	30.62MB/362.63MB : 8.44%	2024-07-23 17:39:29.614181
11	28062414365385132	3%	30.63MB/362.63MB : 8.45%	2024-07-23 17:39:30.063698
12	28062414183645219	0%	336.70MB/1193.98MB : 28.20%	2024-07-23 17:39:35.066737
13	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 17:39:35.469327
14	20072418145628243	7%	30.40MB/362.63MB : 8.38%	2024-07-23 17:56:59.422503
15	20072418145628243	7%	30.44MB/362.63MB : 8.39%	2024-07-23 17:57:01.01159
16	20072418142931314	14%	30.41MB/362.63MB : 8.39%	2024-07-23 17:57:05.655841
17	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-23 17:57:07.262743
18	28062414365385132	10%	30.58MB/362.63MB : 8.43%	2024-07-23 17:57:11.865741
19	28062414365385132	10%	30.64MB/362.63MB : 8.45%	2024-07-23 17:57:13.491467
20	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:57:17.260462
21	20072418145628243	3%	30.39MB/362.63MB : 8.38%	2024-07-23 17:57:21.611553
22	20072418142931314	20%	30.42MB/362.63MB : 8.39%	2024-07-23 17:57:28.055103
23	28062414365385132	19%	30.55MB/362.63MB : 8.42%	2024-07-23 17:57:34.28659
24	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:57:39.699379
25	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 17:57:54.265827
26	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 17:58:00.441744
27	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 17:58:06.655025
28	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:58:12.036396
29	20072418145628243	9%	30.35MB/362.63MB : 8.37%	2024-07-23 17:58:21.403101
30	20072418145628243	3%	30.35MB/362.63MB : 8.37%	2024-07-23 17:58:35.774711
31	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 17:58:41.908483
32	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 17:58:48.119035
33	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 17:58:49.418346
34	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:58:53.514395
35	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 17:58:55.603165
36	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 17:59:01.836636
37	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:59:07.228187
38	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 17:59:15.421115
39	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 17:59:26.309409
40	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 17:59:32.448892
41	28062414365385132	5%	30.55MB/362.63MB : 8.42%	2024-07-23 17:59:38.664985
42	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 17:59:44.054958
43	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 17:59:44.656031
44	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-23 17:59:50.878525
45	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 17:59:57.099551
46	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:00:02.254243
47	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:00:02.485572
48	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:00:14.75072
49	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 18:00:21.001007
50	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 18:00:27.228511
51	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:00:32.624973
52	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:00:39.780161
53	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:00:45.976437
54	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:00:52.201083
55	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:00:57.588868
56	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:01:10.445969
57	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 18:01:16.678312
58	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:01:22.941842
59	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:01:28.353706
60	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:01:35.385666
61	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-23 18:01:41.586842
62	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:01:47.782703
63	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:01:53.168827
64	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:02:06.113126
65	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:02:12.334896
66	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:02:18.569244
67	28062414183645219	1%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:02:23.94225
68	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:02:30.389467
69	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:02:36.634111
70	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:02:42.885175
71	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:02:48.27864
72	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 18:03:01.283369
73	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:03:07.460333
74	28062414365385132	4%	30.55MB/362.63MB : 8.42%	2024-07-23 18:03:13.703044
75	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:03:19.090988
76	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 18:03:26.069437
77	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:03:32.236245
78	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:03:38.50674
79	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:03:43.915345
80	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:03:57.113228
81	20072418142931314	6%	30.39MB/362.63MB : 8.38%	2024-07-23 18:04:03.501134
82	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:04:09.729801
83	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:04:15.123725
84	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 18:04:21.321021
85	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:04:27.547137
86	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:04:33.720193
87	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:04:39.130709
88	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:04:52.434513
89	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:04:58.607124
90	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:05:04.826005
91	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:05:10.221193
92	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:05:15.883874
93	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:05:22.130955
94	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:05:28.34754
95	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:05:33.72678
96	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:05:47.635007
97	20072418145628243	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:06:00.7661
98	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:06:07.112565
99	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:06:10.908718
100	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:06:13.338342
101	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:06:17.141776
102	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:06:18.731991
103	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:06:23.348071
104	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:06:28.745185
105	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:06:56.743838
106	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-23 18:07:02.919161
107	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:07:06.133936
108	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:07:09.157273
109	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-23 18:07:12.371782
110	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:07:14.572316
111	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:07:18.557037
112	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:07:23.96205
113	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:07:51.475127
114	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:07:57.730247
115	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 18:08:01.141843
116	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:08:03.947077
117	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:08:07.426325
118	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:08:09.344981
119	28062414365385132	5%	30.55MB/362.63MB : 8.42%	2024-07-23 18:08:13.632482
120	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:08:19.03
121	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:08:46.566928
122	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:08:52.844935
123	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:08:56.81528
124	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:08:59.042404
125	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:09:03.004875
126	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:09:04.439
127	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-23 18:09:09.268891
128	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:09:14.668715
129	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:09:41.862835
130	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:09:48.050081
131	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:09:52.520303
132	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:09:54.253427
133	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:09:58.720915
134	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:10:05.01716
135	20072418145628243	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:10:06.421807
136	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:10:10.411251
137	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:10:12.608768
138	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-23 18:10:18.840515
139	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:10:24.238563
140	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:10:47.264741
141	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:10:53.464883
142	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:10:59.681636
143	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 18:11:01.475147
144	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:11:05.078884
145	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:11:07.805079
146	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:11:14.025907
147	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:11:19.432735
148	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:11:42.272928
149	20072418142931314	3%	30.38MB/362.63MB : 8.38%	2024-07-23 18:11:48.534172
150	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:11:54.762997
151	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 18:11:56.63657
152	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:12:00.194652
153	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:12:02.822361
154	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-23 18:12:09.043835
155	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:12:14.443098
156	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:12:37.411079
157	20072418142931314	4%	30.39MB/362.63MB : 8.38%	2024-07-23 18:12:43.645626
158	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:12:49.899108
159	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:12:52.264098
160	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:12:55.280412
161	20072418142931314	5%	30.38MB/362.63MB : 8.38%	2024-07-23 18:12:58.485029
162	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:13:04.697222
163	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:13:10.097137
164	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:13:32.691249
165	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:13:38.933824
166	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:13:45.169886
167	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:13:47.194285
168	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:13:50.581211
169	20072418142931314	5%	30.39MB/362.63MB : 8.38%	2024-07-23 18:13:53.457087
170	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:13:59.700343
171	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:14:05.07896
172	20072418145628243	9%	30.36MB/362.63MB : 8.37%	2024-07-23 18:14:28.000095
173	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:14:34.209612
174	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:14:40.450122
175	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:14:42.538804
176	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:14:45.857833
177	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:14:48.703999
178	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:14:54.917926
179	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:15:00.313913
180	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:15:22.955123
181	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:15:29.177943
182	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:15:35.402366
183	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:15:37.756972
184	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:15:40.803863
185	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:15:44.00774
186	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-23 18:15:50.20668
187	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:15:55.619906
188	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:16:18.053001
189	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:16:24.312524
190	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:16:30.554407
191	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:16:32.841361
192	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:16:35.943361
193	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-23 18:16:38.998791
194	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-23 18:16:45.25687
195	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:16:50.676502
196	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:17:13.011946
197	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:17:19.271028
198	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:17:25.503694
199	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:17:28.033326
200	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:17:30.892876
201	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:17:34.179115
202	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:17:40.380303
203	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:17:45.770431
204	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:18:08.664555
205	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:18:14.911621
206	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:18:21.161736
207	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:18:23.019258
208	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:18:26.562627
209	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-23 18:18:29.159539
210	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:18:35.398239
211	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:18:40.800538
212	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:19:04.172843
213	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:19:10.362371
214	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:19:16.551675
215	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:19:18.065246
216	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:19:21.940036
217	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:19:24.269573
218	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:19:30.458583
219	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:19:35.840172
220	20072418145628243	5%	30.36MB/362.63MB : 8.37%	2024-07-23 18:19:59.295242
221	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:20:05.48517
222	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:20:11.727023
223	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:20:13.623275
224	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:20:17.115768
225	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-23 18:20:19.902148
226	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 18:20:26.140016
227	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:20:31.519572
228	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:20:53.860686
229	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:20:59.980619
230	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:21:06.181016
231	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:21:08.886431
232	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:21:11.581879
233	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:21:15.084071
234	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:21:21.388533
235	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:21:26.766661
236	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:21:48.964767
237	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 18:21:55.209365
238	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 18:22:01.458484
239	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:22:03.438554
240	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:22:06.854227
241	20072418142931314	1%	30.39MB/362.63MB : 8.38%	2024-07-23 18:22:09.679735
242	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 18:22:16.023339
243	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:22:21.428128
244	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:22:43.646911
245	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:22:49.802982
246	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:22:56.06066
247	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 18:22:58.639743
248	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:23:01.436326
249	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:23:04.869881
250	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-23 18:23:11.063566
251	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:23:16.437612
252	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:23:38.274068
253	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:23:44.453616
254	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:23:50.670178
255	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:23:53.622587
256	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:23:56.075642
257	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:23:59.811534
258	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:24:06.036531
259	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:24:11.444321
260	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:24:33.278613
261	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:24:39.468955
262	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:24:45.70517
263	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:24:48.855412
264	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:24:51.093119
265	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:24:55.056335
266	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:25:01.305644
267	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:25:06.694331
268	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:25:28.860436
269	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:25:35.13102
270	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:25:41.341722
271	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:25:43.286028
272	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:25:46.734077
273	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:25:49.485197
274	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:25:55.695509
275	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:26:01.069887
276	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:26:23.95552
277	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:26:30.19103
278	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:26:36.43759
279	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:26:38.249355
280	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:26:41.826893
281	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:26:44.483922
282	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:26:50.718538
283	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:26:56.105297
284	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:27:19.650897
285	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:27:25.890403
286	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:27:32.130622
287	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:27:33.741566
288	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:27:37.516999
289	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:27:39.978209
290	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:27:46.173728
291	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:27:51.580892
292	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:28:14.709279
293	20072418142931314	10%	30.40MB/362.63MB : 8.38%	2024-07-23 18:28:20.921951
294	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:28:27.12986
295	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:28:29.034012
296	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:28:32.547449
297	20072418142931314	9%	30.40MB/362.63MB : 8.38%	2024-07-23 18:28:35.268972
298	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:28:41.522567
299	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:28:46.925197
300	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 18:29:09.971257
301	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:29:16.144695
302	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:29:22.403508
303	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:29:23.779059
304	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:29:27.819425
305	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-23 18:29:29.985103
306	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:29:36.191792
307	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:29:41.593869
308	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:30:05.462177
309	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 18:30:11.658283
310	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:30:17.884186
311	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:30:19.363324
312	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:30:23.280527
313	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 18:30:25.523749
314	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:30:31.746587
315	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:30:37.181811
316	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:31:00.063909
317	20072418142931314	8%	30.40MB/362.63MB : 8.38%	2024-07-23 18:31:06.35441
318	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:31:12.572357
319	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:31:14.228493
320	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:31:17.979053
321	20072418142931314	9%	30.39MB/362.63MB : 8.38%	2024-07-23 18:31:20.439099
322	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:31:26.664629
323	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:31:32.065649
324	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:31:55.212811
325	20072418142931314	9%	30.40MB/362.63MB : 8.38%	2024-07-23 18:32:01.420161
326	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:32:07.672518
327	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:32:09.855571
328	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:32:13.052892
329	20072418142931314	10%	30.40MB/362.63MB : 8.38%	2024-07-23 18:32:16.053875
330	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-23 18:32:22.280168
331	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:32:27.672846
332	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:32:50.294712
333	20072418142931314	10%	30.40MB/362.63MB : 8.38%	2024-07-23 18:32:56.542807
334	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-23 18:33:02.744998
335	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 18:33:05.408744
336	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:33:08.131732
337	20072418142931314	9%	30.40MB/362.63MB : 8.38%	2024-07-23 18:33:11.645957
338	20072418145628243	35%	30.43MB/362.63MB : 8.39%	2024-07-23 18:56:43.22754
339	20072418145628243	24%	30.44MB/362.63MB : 8.40%	2024-07-23 18:56:44.261474
340	20072418142931314	19%	30.42MB/362.63MB : 8.39%	2024-07-23 18:56:49.885758
341	20072418142931314	22%	30.47MB/362.63MB : 8.40%	2024-07-23 18:56:51.060785
342	28062414365385132	15%	30.62MB/362.63MB : 8.44%	2024-07-23 18:56:56.291183
343	28062414365385132	15%	30.64MB/362.63MB : 8.45%	2024-07-23 18:56:57.430069
344	28062414183645219	0%	336.65MB/1193.98MB : 28.20%	2024-07-23 18:57:01.807039
345	28062414183645219	1%	336.71MB/1193.98MB : 28.20%	2024-07-23 18:57:02.979433
346	20072418145628243	11%	30.41MB/362.63MB : 8.38%	2024-07-23 18:57:38.626757
347	20072418145628243	11%	30.44MB/362.63MB : 8.40%	2024-07-23 18:57:40.269391
348	20072418142931314	2%	30.43MB/362.63MB : 8.39%	2024-07-23 18:57:44.974723
349	20072418142931314	18%	30.48MB/362.63MB : 8.41%	2024-07-23 18:57:46.658007
350	28062414365385132	10%	30.59MB/362.63MB : 8.43%	2024-07-23 18:57:51.228857
351	28062414365385132	10%	30.64MB/362.63MB : 8.45%	2024-07-23 18:57:52.88557
352	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:57:56.685659
353	28062414183645219	3%	336.71MB/1193.98MB : 28.20%	2024-07-23 18:57:58.582824
354	20072418145628243	7%	30.39MB/362.63MB : 8.38%	2024-07-23 18:58:33.843141
355	20072418145628243	7%	30.44MB/362.63MB : 8.40%	2024-07-23 18:58:36.596027
356	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 18:58:40.040575
357	20072418142931314	15%	30.48MB/362.63MB : 8.40%	2024-07-23 18:58:42.779192
358	28062414365385132	9%	30.55MB/362.63MB : 8.43%	2024-07-23 18:58:46.324748
359	28062414365385132	9%	30.64MB/362.63MB : 8.45%	2024-07-23 18:58:49.016115
360	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:58:51.736881
361	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 18:58:54.413382
362	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-23 18:59:28.68915
363	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-23 18:59:32.183547
364	20072418142931314	3%	30.40MB/362.63MB : 8.38%	2024-07-23 18:59:34.997697
365	20072418142931314	15%	30.48MB/362.63MB : 8.41%	2024-07-23 18:59:38.383965
366	28062414365385132	11%	30.55MB/362.63MB : 8.43%	2024-07-23 18:59:41.510272
367	28062414365385132	11%	30.64MB/362.63MB : 8.45%	2024-07-23 18:59:44.604539
368	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 18:59:46.906285
369	28062414183645219	1%	336.71MB/1193.98MB : 28.20%	2024-07-23 18:59:50.000516
370	20072418145628243	5%	30.36MB/362.63MB : 8.37%	2024-07-23 19:00:24.066575
371	20072418145628243	5%	30.45MB/362.63MB : 8.40%	2024-07-23 19:00:27.145435
372	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 19:00:30.325239
373	20072418142931314	17%	30.48MB/362.63MB : 8.40%	2024-07-23 19:00:33.303619
374	28062414365385132	7%	30.55MB/362.63MB : 8.43%	2024-07-23 19:00:36.565266
375	28062414365385132	7%	30.64MB/362.63MB : 8.45%	2024-07-23 19:00:39.565648
376	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:00:41.964849
377	28062414183645219	1%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:00:44.983078
378	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:01:19.163514
379	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-23 19:01:22.196482
380	20072418142931314	2%	30.40MB/362.63MB : 8.38%	2024-07-23 19:01:25.349974
381	20072418142931314	14%	30.48MB/362.63MB : 8.41%	2024-07-23 19:01:28.368813
382	28062414365385132	6%	30.55MB/362.63MB : 8.43%	2024-07-23 19:01:31.553428
383	28062414365385132	6%	30.66MB/362.63MB : 8.45%	2024-07-23 19:01:34.588427
384	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:01:36.953689
385	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:01:39.987784
386	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:02:14.206537
387	20072418145628243	9%	30.45MB/362.63MB : 8.40%	2024-07-23 19:02:17.501904
388	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 19:02:20.438691
389	20072418142931314	15%	30.48MB/362.63MB : 8.40%	2024-07-23 19:02:23.735395
390	28062414365385132	6%	30.57MB/362.63MB : 8.43%	2024-07-23 19:02:26.659254
391	28062414365385132	6%	30.66MB/362.63MB : 8.46%	2024-07-23 19:02:29.985576
392	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:02:32.060521
393	28062414183645219	1%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:02:35.386987
394	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:03:09.145626
395	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-23 19:03:12.22369
396	20072418142931314	2%	30.40MB/362.63MB : 8.38%	2024-07-23 19:03:15.362557
397	20072418142931314	15%	30.48MB/362.63MB : 8.41%	2024-07-23 19:03:18.532926
398	28062414365385132	7%	30.57MB/362.63MB : 8.43%	2024-07-23 19:03:21.611767
399	28062414365385132	7%	30.66MB/362.63MB : 8.46%	2024-07-23 19:03:24.781714
400	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:03:27.00415
401	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:03:30.174835
402	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-23 19:04:04.447111
403	20072418145628243	6%	30.45MB/362.63MB : 8.40%	2024-07-23 19:04:07.523117
404	20072418142931314	15%	30.39MB/362.63MB : 8.38%	2024-07-23 19:04:10.711472
405	20072418142931314	15%	30.48MB/362.63MB : 8.40%	2024-07-23 19:04:13.809284
406	28062414365385132	7%	30.57MB/362.63MB : 8.43%	2024-07-23 19:04:16.963013
407	28062414365385132	7%	30.66MB/362.63MB : 8.45%	2024-07-23 19:04:20.067587
408	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:04:22.392286
409	28062414183645219	1%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:04:25.494987
410	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-23 19:04:59.350708
411	20072418145628243	8%	30.45MB/362.63MB : 8.40%	2024-07-23 19:05:03.112371
412	20072418142931314	3%	30.40MB/362.63MB : 8.38%	2024-07-23 19:05:05.651606
413	20072418142931314	10%	30.48MB/362.63MB : 8.41%	2024-07-23 19:05:09.368291
414	28062414365385132	7%	30.57MB/362.63MB : 8.43%	2024-07-23 19:05:11.871673
415	28062414365385132	7%	30.66MB/362.63MB : 8.45%	2024-07-23 19:05:15.588264
416	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:05:17.260946
417	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:05:20.990939
418	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:05:54.469385
419	20072418145628243	8%	30.45MB/362.63MB : 8.40%	2024-07-23 19:05:58.244506
420	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 19:06:00.736476
421	20072418142931314	10%	30.48MB/362.63MB : 8.40%	2024-07-23 19:06:04.38431
422	28062414365385132	7%	30.57MB/362.63MB : 8.43%	2024-07-23 19:06:06.99689
423	28062414365385132	7%	30.66MB/362.63MB : 8.45%	2024-07-23 19:06:10.613289
424	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:06:12.386867
425	28062414183645219	0%	336.71MB/1193.98MB : 28.20%	2024-07-23 19:06:15.998077
426	20072418145628243	11%	30.43MB/362.63MB : 8.39%	2024-07-23 19:06:48.758468
427	20072418145628243	11%	30.44MB/362.63MB : 8.40%	2024-07-23 19:06:49.207702
428	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-23 19:06:54.931668
429	20072418142931314	2%	30.47MB/362.63MB : 8.40%	2024-07-23 19:06:55.458341
430	28062414365385132	11%	30.65MB/362.63MB : 8.45%	2024-07-23 19:07:01.180064
431	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-23 19:07:06.083903
432	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:07:06.578956
433	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-23 19:07:12.379762
434	28062414365385132	6%	30.57MB/362.63MB : 8.43%	2024-07-23 19:07:18.622126
435	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:07:24.02108
436	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:07:44.506664
437	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-23 19:07:50.703058
438	28062414365385132	5%	30.57MB/362.63MB : 8.43%	2024-07-23 19:07:56.896818
439	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 19:08:01.864811
440	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:08:02.281912
441	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-23 19:08:08.05267
442	28062414365385132	4%	30.57MB/362.63MB : 8.43%	2024-07-23 19:08:14.244161
443	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:08:19.641044
444	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-23 19:08:39.481468
445	20072418142931314	2%	30.40MB/362.63MB : 8.38%	2024-07-23 19:08:45.657525
446	28062414365385132	7%	30.57MB/362.63MB : 8.43%	2024-07-23 19:08:51.893603
447	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-23 19:08:57.081444
448	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:08:57.283556
449	20072418142931314	8%	30.40MB/362.63MB : 8.38%	2024-07-23 19:09:03.254393
450	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-23 19:09:16.535307
451	20072418142931314	9%	30.40MB/362.63MB : 8.38%	2024-07-23 19:09:22.702148
452	28062414365385132	6%	30.57MB/362.63MB : 8.43%	2024-07-23 19:09:28.935519
453	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:09:33.836448
454	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:09:34.331672
455	20072418142931314	2%	30.34MB/362.63MB : 8.37%	2024-07-23 19:09:40.102284
456	28062414365385132	8%	30.53MB/362.63MB : 8.42%	2024-07-23 19:09:46.307721
457	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:09:51.709496
458	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-23 19:10:11.737155
459	20072418142931314	6%	30.34MB/362.63MB : 8.37%	2024-07-23 19:10:17.941244
460	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:10:24.183735
461	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:10:29.513868
462	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:10:29.590177
463	20072418142931314	2%	30.34MB/362.63MB : 8.37%	2024-07-23 19:10:35.699765
464	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:10:41.916363
465	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-23 19:10:47.302923
466	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-23 19:11:06.934391
467	20072418142931314	8%	30.34MB/362.63MB : 8.37%	2024-07-23 19:11:13.148939
468	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:11:19.38993
469	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:11:24.792717
470	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:11:25.133087
471	20072418142931314	10%	30.34MB/362.63MB : 8.37%	2024-07-23 19:11:31.498911
472	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:11:37.750704
473	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:11:43.151285
474	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-23 19:12:09.98537
475	20072418142931314	9%	30.34MB/362.63MB : 8.37%	2024-07-23 19:12:16.192703
476	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-23 19:12:20.4337
477	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:12:22.432831
478	20072418142931314	8%	30.34MB/362.63MB : 8.37%	2024-07-23 19:12:26.685645
479	28062414183645219	0%	336.51MB/1193.98MB : 28.18%	2024-07-23 19:12:27.892933
480	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:12:32.922875
481	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:12:38.316405
482	20072418145628243	3%	30.39MB/362.63MB : 8.38%	2024-07-23 19:16:01.507897
483	20072418145628243	3%	30.40MB/362.63MB : 8.38%	2024-07-23 19:16:02.204915
484	20072418142931314	12%	30.43MB/362.63MB : 8.39%	2024-07-23 19:16:07.762372
485	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-23 19:16:08.430066
486	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-23 19:16:13.994613
487	28062414365385132	6%	30.65MB/362.63MB : 8.45%	2024-07-23 19:16:14.861247
488	28062414183645219	0%	336.63MB/1193.98MB : 28.19%	2024-07-23 19:16:19.4069
489	28062414183645219	0%	336.64MB/1193.98MB : 28.20%	2024-07-23 19:16:20.25808
490	20072418145628243	12%	30.32MB/362.63MB : 8.36%	2024-07-23 19:16:50.496626
491	20072418142931314	9%	30.36MB/362.63MB : 8.37%	2024-07-23 19:16:56.655215
492	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-23 19:16:57.364841
493	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:17:02.917651
494	20072418142931314	9%	30.34MB/362.63MB : 8.37%	2024-07-23 19:17:03.644661
495	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:17:08.318107
496	28062414365385132	4%	30.53MB/362.63MB : 8.42%	2024-07-23 19:17:09.852286
497	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:17:15.254261
498	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-23 19:17:45.685685
499	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-23 19:17:51.90392
500	20072418145628243	4%	30.35MB/362.63MB : 8.37%	2024-07-23 19:17:52.105488
501	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:17:58.143508
502	20072418142931314	10%	30.34MB/362.63MB : 8.37%	2024-07-23 19:17:58.423256
503	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:18:03.536202
504	28062414365385132	4%	30.53MB/362.63MB : 8.42%	2024-07-23 19:18:04.617668
505	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:18:10.030539
506	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-23 19:18:41.342941
507	20072418145628243	7%	30.31MB/362.63MB : 8.36%	2024-07-23 19:18:46.513101
508	20072418142931314	9%	30.34MB/362.63MB : 8.37%	2024-07-23 19:18:47.612153
509	20072418142931314	9%	30.34MB/362.63MB : 8.37%	2024-07-23 19:18:52.673257
510	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:18:53.879281
511	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:18:58.885343
512	28062414183645219	1%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:19:04.302367
513	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:19:05.35571
514	20072418142931314	10%	30.34MB/362.63MB : 8.37%	2024-07-23 19:19:11.565921
515	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:19:17.836377
516	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:19:23.252612
517	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-23 19:19:42.19341
518	20072418142931314	8%	30.34MB/362.63MB : 8.37%	2024-07-23 19:19:48.444464
519	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:19:54.778474
520	28062414183645219	0%	336.58MB/1193.98MB : 28.19%	2024-07-23 19:20:00.205395
521	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-23 19:20:00.484844
522	20072418142931314	10%	30.34MB/362.63MB : 8.37%	2024-07-23 19:20:06.663312
523	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:20:12.918259
524	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:20:18.316735
525	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:20:37.580099
526	20072418142931314	6%	30.34MB/362.63MB : 8.37%	2024-07-23 19:20:43.780327
527	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:20:50.008081
528	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:20:55.41033
529	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:20:55.71934
530	20072418142931314	11%	30.34MB/362.63MB : 8.37%	2024-07-23 19:21:01.937707
531	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:21:08.144758
532	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:21:13.561431
533	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-23 19:21:32.826802
534	20072418142931314	3%	30.34MB/362.63MB : 8.37%	2024-07-23 19:21:39.077587
535	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:21:45.339418
536	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-23 19:21:50.116802
537	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:21:50.767224
538	20072418142931314	10%	30.34MB/362.63MB : 8.37%	2024-07-23 19:21:56.395359
539	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:22:02.619426
540	28062414183645219	1%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:22:08.022642
541	20072418145628243	11%	30.31MB/362.63MB : 8.36%	2024-07-23 19:22:27.423943
542	20072418145628243	11%	30.31MB/362.63MB : 8.36%	2024-07-23 19:22:31.708533
543	20072418142931314	7%	30.34MB/362.63MB : 8.37%	2024-07-23 19:22:33.720403
544	20072418142931314	12%	30.34MB/362.63MB : 8.37%	2024-07-23 19:22:37.936316
545	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:22:39.959519
546	28062414365385132	9%	30.53MB/362.63MB : 8.42%	2024-07-23 19:22:44.18381
547	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:22:45.389642
548	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-23 19:22:57.556896
549	20072418142931314	6%	30.34MB/362.63MB : 8.37%	2024-07-23 19:23:03.871377
550	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:23:13.505101
551	20072418142931314	2%	30.34MB/362.63MB : 8.37%	2024-07-23 19:23:19.713561
552	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-23 19:23:22.788502
553	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:23:25.97479
554	20072418142931314	5%	30.34MB/362.63MB : 8.37%	2024-07-23 19:23:29.014147
555	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:23:34.372808
556	28062414365385132	3%	30.53MB/362.63MB : 8.42%	2024-07-23 19:23:35.254476
557	20072418142931314	2%	30.34MB/362.63MB : 8.37%	2024-07-23 19:23:40.621004
558	28062414183645219	0%	336.51MB/1193.98MB : 28.18%	2024-07-23 19:23:40.667519
559	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:23:50.22916
560	20072418142931314	8%	30.34MB/362.63MB : 8.37%	2024-07-23 19:23:56.366547
561	28062414365385132	7%	30.53MB/362.63MB : 8.42%	2024-07-23 19:24:02.596765
562	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:24:08.040178
563	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:24:17.689778
564	20072418142931314	6%	30.34MB/362.63MB : 8.37%	2024-07-23 19:24:23.896178
565	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:24:30.112887
566	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:24:35.508523
567	20072418145628243	5%	30.32MB/362.63MB : 8.36%	2024-07-23 19:24:45.881906
568	20072418142931314	9%	30.34MB/362.63MB : 8.37%	2024-07-23 19:24:52.075826
569	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:24:58.290054
570	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:25:03.6856
571	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-23 19:25:12.873556
572	20072418142931314	3%	30.34MB/362.63MB : 8.37%	2024-07-23 19:25:19.111957
573	28062414365385132	2%	30.53MB/362.63MB : 8.42%	2024-07-23 19:25:25.35911
574	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:25:30.757751
575	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-23 19:25:41.605031
576	20072418142931314	6%	30.34MB/362.63MB : 8.37%	2024-07-23 19:25:47.754418
577	28062414365385132	6%	30.53MB/362.63MB : 8.42%	2024-07-23 19:25:53.987974
578	28062414183645219	0%	336.50MB/1193.98MB : 28.18%	2024-07-23 19:25:59.401145
579	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-23 19:26:08.073352
580	20072418142931314	3%	30.34MB/362.63MB : 8.37%	2024-07-23 19:26:14.297298
581	20072418145628243	2%	30.43MB/362.63MB : 8.39%	2024-07-28 13:58:08.430179
582	20072418145628243	2%	30.44MB/362.63MB : 8.39%	2024-07-28 13:58:09.265104
583	20072418142931314	43%	30.39MB/362.63MB : 8.38%	2024-07-28 13:58:15.377733
584	20072418142931314	43%	30.44MB/362.63MB : 8.39%	2024-07-28 13:58:16.638782
585	28062414365385132	2%	30.55MB/362.63MB : 8.43%	2024-07-28 13:58:21.841462
586	28062414365385132	19%	30.61MB/362.63MB : 8.44%	2024-07-28 13:58:23.01565
587	28062414183645219	0%	336.76MB/1193.98MB : 28.20%	2024-07-28 13:58:27.363861
588	28062414183645219	0%	336.76MB/1193.98MB : 28.21%	2024-07-28 13:58:28.410277
589	20072418145628243	2%	30.40MB/362.63MB : 8.38%	2024-07-28 13:59:04.030159
590	20072418145628243	13%	30.44MB/362.63MB : 8.40%	2024-07-28 13:59:05.447647
591	20072418142931314	22%	30.44MB/362.63MB : 8.39%	2024-07-28 13:59:10.311403
592	20072418142931314	22%	30.44MB/362.63MB : 8.40%	2024-07-28 13:59:11.79152
593	28062414365385132	3%	30.58MB/362.63MB : 8.43%	2024-07-28 13:59:16.554358
594	28062414365385132	13%	30.63MB/362.63MB : 8.45%	2024-07-28 13:59:18.063431
595	28062414183645219	0%	336.62MB/1193.98MB : 28.19%	2024-07-28 13:59:21.950841
596	28062414183645219	0%	336.76MB/1193.98MB : 28.21%	2024-07-28 13:59:23.460777
597	20072418145628243	2%	30.43MB/362.63MB : 8.39%	2024-07-28 13:59:59.343554
598	20072418145628243	12%	30.44MB/362.63MB : 8.40%	2024-07-28 14:00:00.301465
599	20072418142931314	15%	30.43MB/362.63MB : 8.39%	2024-07-28 14:00:05.592427
600	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 14:00:06.520877
601	28062414365385132	2%	30.62MB/362.63MB : 8.44%	2024-07-28 14:00:11.843377
602	28062414365385132	2%	30.63MB/362.63MB : 8.45%	2024-07-28 14:00:12.772565
603	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 14:00:17.242942
604	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:00:18.170435
605	20072418145628243	11%	30.41MB/362.63MB : 8.38%	2024-07-28 14:00:53.80132
606	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 14:00:55.346309
607	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-28 14:00:59.975068
608	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 14:01:01.539611
609	28062414365385132	5%	30.58MB/362.63MB : 8.43%	2024-07-28 14:01:06.215832
610	28062414365385132	5%	30.63MB/362.63MB : 8.45%	2024-07-28 14:01:07.77924
611	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:01:11.614437
612	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:01:13.17807
613	20072418145628243	3%	30.46MB/362.63MB : 8.40%	2024-07-28 14:01:48.355692
614	20072418145628243	19%	30.46MB/362.63MB : 8.40%	2024-07-28 14:01:49.702888
615	20072418142931314	12%	30.41MB/362.63MB : 8.39%	2024-07-28 14:01:54.625672
616	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 14:01:55.971097
617	28062414365385132	5%	30.59MB/362.63MB : 8.44%	2024-07-28 14:02:00.861074
618	28062414365385132	5%	30.63MB/362.63MB : 8.45%	2024-07-28 14:02:02.224001
619	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:02:06.249448
620	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:02:07.641705
621	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 14:02:42.857676
622	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 14:02:45.457072
623	20072418142931314	2%	30.36MB/362.63MB : 8.37%	2024-07-28 14:02:49.091753
624	20072418142931314	14%	30.45MB/362.63MB : 8.40%	2024-07-28 14:02:51.614902
625	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 14:02:55.280755
626	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-28 14:02:57.864378
627	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:03:00.680614
628	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:03:03.295251
629	20072418145628243	6%	30.37MB/362.63MB : 8.38%	2024-07-28 14:03:37.451096
630	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 14:03:40.500307
631	20072418142931314	2%	30.36MB/362.63MB : 8.37%	2024-07-28 14:03:43.74781
632	20072418142931314	17%	30.45MB/362.63MB : 8.40%	2024-07-28 14:03:46.671832
633	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 14:03:50.013287
634	28062414365385132	7%	30.63MB/362.63MB : 8.45%	2024-07-28 14:03:52.879294
635	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:03:55.397202
636	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:03:58.27244
637	20072418145628243	13%	30.38MB/362.63MB : 8.38%	2024-07-28 14:04:32.463364
638	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 14:04:35.866802
639	20072418142931314	3%	30.36MB/362.63MB : 8.37%	2024-07-28 14:04:38.635877
640	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 14:04:42.082633
641	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 14:04:44.876391
642	28062414365385132	7%	30.63MB/362.63MB : 8.45%	2024-07-28 14:04:48.384479
643	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:04:50.317277
644	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:04:53.793383
645	20072418145628243	5%	30.39MB/362.63MB : 8.38%	2024-07-28 14:05:28.161082
646	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 14:05:31.190342
647	20072418142931314	2%	30.36MB/362.63MB : 8.37%	2024-07-28 14:05:34.40351
648	20072418142931314	17%	30.45MB/362.63MB : 8.40%	2024-07-28 14:05:37.383121
649	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 14:05:40.69415
650	28062414365385132	16%	30.67MB/362.63MB : 8.46%	2024-07-28 14:05:43.662537
651	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:05:46.087644
652	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:05:49.05601
653	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 14:06:23.864218
654	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 14:06:25.922975
655	20072418142931314	3%	30.38MB/362.63MB : 8.38%	2024-07-28 14:06:30.114743
656	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 14:06:32.122779
657	28062414365385132	5%	30.56MB/362.63MB : 8.43%	2024-07-28 14:06:36.311207
658	28062414365385132	5%	30.63MB/362.63MB : 8.45%	2024-07-28 14:06:38.371408
659	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:06:41.726701
660	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:06:43.76393
661	20072418145628243	2%	30.44MB/362.63MB : 8.39%	2024-07-28 14:07:19.436824
662	20072418145628243	13%	30.49MB/362.63MB : 8.41%	2024-07-28 14:07:21.23087
663	20072418142931314	17%	30.38MB/362.63MB : 8.38%	2024-07-28 14:07:25.647317
664	20072418142931314	17%	30.45MB/362.63MB : 8.40%	2024-07-28 14:07:27.59554
665	28062414365385132	2%	30.56MB/362.63MB : 8.43%	2024-07-28 14:07:31.872512
666	28062414365385132	12%	30.63MB/362.63MB : 8.45%	2024-07-28 14:07:33.83338
667	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:07:37.290604
668	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:07:39.313533
669	20072418145628243	3%	30.41MB/362.63MB : 8.39%	2024-07-28 14:08:14.086358
670	20072418145628243	13%	30.46MB/362.63MB : 8.40%	2024-07-28 14:08:16.760336
671	20072418142931314	15%	30.36MB/362.63MB : 8.37%	2024-07-28 14:08:20.312181
672	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 14:08:23.017329
673	28062414365385132	3%	30.57MB/362.63MB : 8.43%	2024-07-28 14:08:26.528364
674	28062414365385132	12%	30.66MB/362.63MB : 8.45%	2024-07-28 14:08:29.267684
675	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:08:31.957675
676	28062414183645219	1%	336.94MB/1193.98MB : 28.22%	2024-07-28 14:08:34.725938
677	20072418145628243	2%	30.41MB/362.63MB : 8.39%	2024-07-28 14:09:09.393511
678	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 14:09:12.071311
679	20072418142931314	14%	30.36MB/362.63MB : 8.37%	2024-07-28 14:09:15.671053
680	20072418142931314	14%	30.45MB/362.63MB : 8.40%	2024-07-28 14:09:18.313895
681	28062414365385132	2%	30.59MB/362.63MB : 8.43%	2024-07-28 14:09:21.884312
682	28062414365385132	12%	30.68MB/362.63MB : 8.46%	2024-07-28 14:09:24.558076
683	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:09:27.393362
684	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:09:30.104222
685	20072418145628243	13%	30.41MB/362.63MB : 8.39%	2024-07-28 14:10:04.861569
686	20072418145628243	13%	30.46MB/362.63MB : 8.40%	2024-07-28 14:10:07.594242
687	20072418142931314	11%	30.36MB/362.63MB : 8.37%	2024-07-28 14:10:11.180888
688	20072418142931314	11%	30.45MB/362.63MB : 8.40%	2024-07-28 14:10:13.805748
689	28062414365385132	2%	30.57MB/362.63MB : 8.43%	2024-07-28 14:10:17.439796
690	28062414365385132	10%	30.66MB/362.63MB : 8.45%	2024-07-28 14:10:20.091087
691	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:10:22.875046
692	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:10:25.534321
693	20072418145628243	10%	30.41MB/362.63MB : 8.39%	2024-07-28 14:11:00.178336
694	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 14:11:02.374683
695	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-28 14:11:06.365139
696	20072418142931314	10%	30.45MB/362.63MB : 8.40%	2024-07-28 14:11:08.594087
697	28062414365385132	2%	30.59MB/362.63MB : 8.43%	2024-07-28 14:11:12.616715
698	28062414365385132	13%	30.68MB/362.63MB : 8.46%	2024-07-28 14:11:14.859505
699	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:11:18.046582
700	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:11:20.289132
701	20072418145628243	11%	30.41MB/362.63MB : 8.39%	2024-07-28 14:11:55.178617
702	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 14:11:56.942717
703	20072418142931314	14%	30.40MB/362.63MB : 8.38%	2024-07-28 14:12:01.46251
704	20072418142931314	14%	30.45MB/362.63MB : 8.40%	2024-07-28 14:12:03.129937
705	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 14:12:07.706977
706	28062414365385132	12%	30.66MB/362.63MB : 8.45%	2024-07-28 14:12:09.363219
707	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:12:13.10877
708	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:12:14.749963
709	20072418145628243	19%	30.49MB/362.63MB : 8.41%	2024-07-28 14:12:49.934166
710	20072418145628243	19%	30.49MB/362.63MB : 8.41%	2024-07-28 14:12:51.328178
711	20072418142931314	19%	30.40MB/362.63MB : 8.38%	2024-07-28 14:12:56.166917
712	20072418142931314	19%	30.45MB/362.63MB : 8.40%	2024-07-28 14:12:57.605484
713	28062414365385132	3%	30.64MB/362.63MB : 8.45%	2024-07-28 14:13:02.384489
714	28062414365385132	10%	30.68MB/362.63MB : 8.46%	2024-07-28 14:13:03.853289
715	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 14:13:07.7703
716	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:13:09.236154
717	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 14:13:44.863997
718	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 14:13:46.286919
719	20072418142931314	17%	30.44MB/362.63MB : 8.39%	2024-07-28 14:13:51.776727
720	20072418142931314	17%	30.46MB/362.63MB : 8.40%	2024-07-28 14:13:52.533909
721	28062414365385132	20%	30.65MB/362.63MB : 8.45%	2024-07-28 14:13:58.087165
722	28062414365385132	20%	30.66MB/362.63MB : 8.46%	2024-07-28 14:13:59.031021
723	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 14:14:03.464486
724	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:14:04.421843
725	20072418145628243	12%	30.48MB/362.63MB : 8.40%	2024-07-28 14:14:40.342621
726	20072418145628243	12%	30.49MB/362.63MB : 8.41%	2024-07-28 14:14:41.128837
727	20072418142931314	13%	30.44MB/362.63MB : 8.39%	2024-07-28 14:14:46.579317
728	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 14:14:47.553244
729	28062414365385132	2%	30.65MB/362.63MB : 8.45%	2024-07-28 14:14:52.825951
730	28062414365385132	13%	30.66MB/362.63MB : 8.46%	2024-07-28 14:14:53.786179
731	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 14:14:58.212074
732	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:14:59.169796
733	20072418145628243	12%	30.48MB/362.63MB : 8.40%	2024-07-28 14:15:35.041133
734	20072418145628243	12%	30.49MB/362.63MB : 8.41%	2024-07-28 14:15:35.919893
735	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 14:15:41.336842
736	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 14:15:42.265234
737	28062414365385132	2%	30.65MB/362.63MB : 8.45%	2024-07-28 14:15:47.58223
738	28062414365385132	12%	30.67MB/362.63MB : 8.46%	2024-07-28 14:15:48.500842
739	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 14:15:52.995529
740	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:15:53.970582
741	20072418145628243	11%	30.48MB/362.63MB : 8.40%	2024-07-28 14:16:30.056231
742	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 14:16:30.537187
743	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 14:16:36.292862
744	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 14:16:36.849143
745	28062414365385132	3%	30.65MB/362.63MB : 8.45%	2024-07-28 14:16:42.546165
746	28062414365385132	12%	30.66MB/362.63MB : 8.46%	2024-07-28 14:16:43.061561
747	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 14:16:47.955508
748	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 14:16:48.494295
749	20072418145628243	11%	30.48MB/362.63MB : 8.40%	2024-07-28 14:17:25.025967
750	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 14:17:25.691861
751	20072418142931314	15%	30.44MB/362.63MB : 8.39%	2024-07-28 14:17:31.261397
752	20072418145628243	3%	30.48MB/362.63MB : 8.40%	2024-07-28 15:35:13.490687
753	20072418145628243	3%	30.49MB/362.63MB : 8.41%	2024-07-28 15:35:14.24846
754	20072418142931314	2%	30.44MB/362.63MB : 8.39%	2024-07-28 15:35:19.70694
755	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 15:35:20.666431
756	28062414365385132	7%	30.65MB/362.63MB : 8.45%	2024-07-28 15:35:25.93822
757	28062414365385132	7%	30.67MB/362.63MB : 8.46%	2024-07-28 15:35:26.897444
758	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 15:35:31.339973
759	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:35:32.299619
760	20072418145628243	7%	30.48MB/362.63MB : 8.40%	2024-07-28 15:36:08.225961
761	20072418145628243	7%	30.49MB/362.63MB : 8.41%	2024-07-28 15:36:08.953075
762	20072418142931314	2%	30.44MB/362.63MB : 8.39%	2024-07-28 15:36:14.489366
763	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 15:36:15.185876
764	28062414365385132	8%	30.65MB/362.63MB : 8.45%	2024-07-28 15:36:20.737884
765	28062414365385132	8%	30.67MB/362.63MB : 8.46%	2024-07-28 15:36:21.418655
766	28062414183645219	1%	336.81MB/1193.98MB : 28.21%	2024-07-28 15:36:26.134933
767	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:36:26.832271
768	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 15:37:02.442931
769	20072418145628243	2%	30.37MB/362.63MB : 8.38%	2024-07-28 15:37:04.022952
770	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 15:37:08.63455
771	20072418142931314	9%	30.36MB/362.63MB : 8.37%	2024-07-28 15:37:10.275149
772	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:37:14.033598
773	28062414365385132	4%	30.58MB/362.63MB : 8.43%	2024-07-28 15:37:16.54102
774	20072418145628243	8%	30.37MB/362.63MB : 8.38%	2024-07-28 15:37:21.165399
775	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:37:21.922459
776	20072418145628243	6%	30.48MB/362.63MB : 8.40%	2024-07-28 15:37:58.021024
777	20072418145628243	6%	30.49MB/362.63MB : 8.41%	2024-07-28 15:37:58.48488
778	20072418142931314	3%	30.44MB/362.63MB : 8.39%	2024-07-28 15:38:04.25112
779	20072418142931314	3%	30.45MB/362.63MB : 8.40%	2024-07-28 15:38:04.732446
780	28062414365385132	10%	30.66MB/362.63MB : 8.45%	2024-07-28 15:38:10.476085
781	28062414365385132	10%	30.67MB/362.63MB : 8.46%	2024-07-28 15:38:10.955966
782	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 15:38:15.899748
783	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:38:16.364441
784	20072418145628243	14%	30.41MB/362.63MB : 8.39%	2024-07-28 15:38:52.273819
785	20072418145628243	14%	30.46MB/362.63MB : 8.40%	2024-07-28 15:38:53.327261
786	20072418142931314	10%	30.40MB/362.63MB : 8.38%	2024-07-28 15:38:58.520448
787	20072418142931314	10%	30.45MB/362.63MB : 8.40%	2024-07-28 15:38:59.594283
788	28062414365385132	10%	30.61MB/362.63MB : 8.44%	2024-07-28 15:39:04.747049
789	28062414365385132	10%	30.66MB/362.63MB : 8.46%	2024-07-28 15:39:05.831128
790	28062414183645219	0%	336.77MB/1193.98MB : 28.21%	2024-07-28 15:39:10.151934
791	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:39:11.249391
792	20072418145628243	10%	30.48MB/362.63MB : 8.40%	2024-07-28 15:39:47.129824
793	20072418145628243	10%	30.53MB/362.63MB : 8.42%	2024-07-28 15:39:48.072917
794	20072418142931314	7%	30.47MB/362.63MB : 8.40%	2024-07-28 15:39:53.349122
795	20072418142931314	7%	30.45MB/362.63MB : 8.40%	2024-07-28 15:39:54.308235
796	28062414365385132	16%	30.65MB/362.63MB : 8.45%	2024-07-28 15:39:59.612225
797	28062414365385132	16%	30.67MB/362.63MB : 8.46%	2024-07-28 15:40:00.509315
798	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 15:40:05.05908
799	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:40:05.926271
800	20072418145628243	11%	30.48MB/362.63MB : 8.40%	2024-07-28 15:40:41.830002
801	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 15:40:42.821958
802	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-28 15:40:48.03602
803	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 15:40:49.027292
804	28062414365385132	14%	30.65MB/362.63MB : 8.45%	2024-07-28 15:40:54.272606
805	28062414365385132	14%	30.68MB/362.63MB : 8.46%	2024-07-28 15:40:55.247862
806	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 15:40:59.660779
807	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:41:00.651611
808	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 15:41:36.334996
809	20072418145628243	12%	30.49MB/362.63MB : 8.41%	2024-07-28 15:41:38.176457
810	20072418142931314	9%	30.38MB/362.63MB : 8.38%	2024-07-28 15:41:42.540962
811	20072418142931314	9%	30.45MB/362.63MB : 8.40%	2024-07-28 15:41:44.443654
812	28062414365385132	11%	30.59MB/362.63MB : 8.44%	2024-07-28 15:41:48.793033
813	28062414365385132	11%	30.67MB/362.63MB : 8.46%	2024-07-28 15:41:50.708863
814	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:41:54.191999
815	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:41:56.110859
816	20072418145628243	8%	30.41MB/362.63MB : 8.39%	2024-07-28 15:42:31.338857
817	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 15:42:33.549719
818	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 15:42:37.494974
819	20072418142931314	8%	30.45MB/362.63MB : 8.40%	2024-07-28 15:42:39.770062
820	28062414365385132	11%	30.58MB/362.63MB : 8.43%	2024-07-28 15:42:43.73273
821	28062414365385132	11%	30.67MB/362.63MB : 8.46%	2024-07-28 15:42:46.008042
822	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:42:49.13415
823	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:42:51.41073
824	20072418145628243	8%	30.44MB/362.63MB : 8.39%	2024-07-28 15:43:26.691302
825	20072418145628243	8%	30.49MB/362.63MB : 8.41%	2024-07-28 15:43:29.25964
826	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 15:43:32.870826
827	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 15:43:35.456399
828	28062414365385132	7%	30.58MB/362.63MB : 8.43%	2024-07-28 15:43:39.109191
829	28062414365385132	7%	30.67MB/362.63MB : 8.46%	2024-07-28 15:43:41.648251
830	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:43:44.511059
831	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:43:47.048815
832	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 15:44:21.705474
833	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 15:44:24.32183
834	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 15:44:27.90916
835	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 15:44:30.568782
836	28062414365385132	7%	30.58MB/362.63MB : 8.43%	2024-07-28 15:44:34.124718
837	28062414365385132	7%	30.67MB/362.63MB : 8.46%	2024-07-28 15:44:36.772585
838	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:44:39.511022
839	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:44:42.16968
840	20072418145628243	7%	30.41MB/362.63MB : 8.39%	2024-07-28 15:45:16.758052
841	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:45:19.357037
842	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 15:45:22.97932
843	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 15:45:25.594587
844	28062414365385132	8%	30.58MB/362.63MB : 8.43%	2024-07-28 15:45:29.231949
845	28062414365385132	8%	30.67MB/362.63MB : 8.46%	2024-07-28 15:45:31.847412
846	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:45:34.63387
847	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:45:37.248189
848	20072418145628243	7%	30.41MB/362.63MB : 8.39%	2024-07-28 15:46:12.008546
849	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:46:14.234487
850	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 15:46:18.279219
851	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 15:46:20.42912
852	28062414365385132	7%	30.58MB/362.63MB : 8.43%	2024-07-28 15:46:24.499528
853	28062414365385132	7%	30.67MB/362.63MB : 8.46%	2024-07-28 15:46:27.332163
854	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:46:29.901813
855	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:46:32.71882
856	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-28 15:47:06.859295
857	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:47:09.845429
858	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 15:47:13.03128
859	20072418142931314	22%	30.47MB/362.63MB : 8.40%	2024-07-28 15:47:16.034533
860	28062414365385132	16%	30.61MB/362.63MB : 8.44%	2024-07-28 15:47:19.236699
861	28062414365385132	16%	30.66MB/362.63MB : 8.46%	2024-07-28 15:47:22.259289
862	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:47:24.642023
863	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:47:27.690238
864	20072418145628243	6%	30.37MB/362.63MB : 8.38%	2024-07-28 15:48:01.426647
865	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 15:48:04.461023
866	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 15:48:07.661884
867	20072418142931314	11%	30.45MB/362.63MB : 8.40%	2024-07-28 15:48:10.738417
868	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 15:48:13.904391
869	28062414365385132	6%	30.74MB/362.63MB : 8.48%	2024-07-28 15:48:16.981923
870	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:48:19.302753
871	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:48:22.428031
872	20072418145628243	12%	30.41MB/362.63MB : 8.39%	2024-07-28 15:48:56.4575
873	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 15:48:59.427886
874	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 15:49:02.709652
875	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 15:49:05.637691
876	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 15:49:08.998393
877	28062414365385132	6%	30.67MB/362.63MB : 8.46%	2024-07-28 15:49:11.860972
878	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:49:14.41551
879	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:49:17.262755
880	20072418145628243	23%	30.38MB/362.63MB : 8.38%	2024-07-28 15:49:50.906013
881	20072418145628243	23%	30.46MB/362.63MB : 8.40%	2024-07-28 15:49:53.9818
882	20072418142931314	15%	30.36MB/362.63MB : 8.37%	2024-07-28 15:49:57.156521
883	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 15:50:00.220269
884	28062414365385132	8%	30.58MB/362.63MB : 8.43%	2024-07-28 15:50:03.376313
885	28062414365385132	8%	30.67MB/362.63MB : 8.46%	2024-07-28 15:50:06.470681
886	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:50:08.776386
887	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:50:11.856682
888	20072418145628243	7%	30.39MB/362.63MB : 8.38%	2024-07-28 15:50:46.369553
889	20072418145628243	7%	30.50MB/362.63MB : 8.41%	2024-07-28 15:50:48.597486
890	20072418142931314	9%	30.36MB/362.63MB : 8.37%	2024-07-28 15:50:52.575606
891	20072418142931314	9%	30.46MB/362.63MB : 8.40%	2024-07-28 15:50:54.91345
892	28062414365385132	15%	30.58MB/362.63MB : 8.43%	2024-07-28 15:50:58.798577
893	28062414365385132	15%	30.67MB/362.63MB : 8.46%	2024-07-28 15:51:01.149377
894	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:51:04.201225
895	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:51:06.586798
896	20072418145628243	9%	30.41MB/362.63MB : 8.39%	2024-07-28 15:51:41.808915
897	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 15:51:43.977953
898	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-28 15:51:48.075463
899	20072418142931314	7%	30.48MB/362.63MB : 8.41%	2024-07-28 15:51:50.256273
900	28062414365385132	11%	30.58MB/362.63MB : 8.43%	2024-07-28 15:51:54.359071
901	28062414365385132	11%	30.72MB/362.63MB : 8.47%	2024-07-28 15:51:56.528565
902	28062414183645219	2%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:51:59.76604
903	28062414183645219	2%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:52:01.948459
904	20072418145628243	8%	30.41MB/362.63MB : 8.39%	2024-07-28 15:52:36.509094
905	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 15:52:38.846993
906	20072418142931314	8%	30.38MB/362.63MB : 8.38%	2024-07-28 15:52:42.704063
907	20072418142931314	8%	30.46MB/362.63MB : 8.40%	2024-07-28 15:52:45.070616
908	28062414365385132	11%	30.61MB/362.63MB : 8.44%	2024-07-28 15:52:48.921357
909	28062414365385132	11%	30.70MB/362.63MB : 8.47%	2024-07-28 15:52:51.304218
910	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:52:54.319615
911	28062414183645219	1%	336.92MB/1193.98MB : 28.22%	2024-07-28 15:52:56.703784
912	20072418145628243	10%	30.43MB/362.63MB : 8.39%	2024-07-28 15:53:31.720516
913	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 15:53:33.485237
914	20072418142931314	7%	30.39MB/362.63MB : 8.38%	2024-07-28 15:53:37.867481
915	20072418142931314	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:53:39.724819
916	28062414365385132	10%	30.62MB/362.63MB : 8.45%	2024-07-28 15:53:44.069084
917	28062414365385132	10%	30.70MB/362.63MB : 8.47%	2024-07-28 15:53:45.971778
918	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:53:49.465383
919	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:53:51.430857
920	20072418145628243	10%	30.43MB/362.63MB : 8.39%	2024-07-28 15:54:26.632975
921	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 15:54:28.378557
922	20072418142931314	8%	30.41MB/362.63MB : 8.39%	2024-07-28 15:54:32.895524
923	20072418142931314	8%	30.46MB/362.63MB : 8.40%	2024-07-28 15:54:34.566895
924	28062414365385132	12%	30.64MB/362.63MB : 8.45%	2024-07-28 15:54:39.145755
925	28062414365385132	12%	30.70MB/362.63MB : 8.47%	2024-07-28 15:54:40.81405
926	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:54:44.53537
927	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:54:46.20657
928	20072418145628243	7%	30.41MB/362.63MB : 8.39%	2024-07-28 15:55:21.476601
929	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:55:24.030902
930	20072418142931314	7%	30.38MB/362.63MB : 8.38%	2024-07-28 15:55:27.686441
931	20072418142931314	10%	30.46MB/362.63MB : 8.40%	2024-07-28 15:55:30.240425
932	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 15:55:33.894919
933	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 15:55:36.479366
934	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:55:39.294479
935	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:55:41.878963
936	20072418145628243	7%	30.41MB/362.63MB : 8.39%	2024-07-28 15:56:16.556177
937	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:56:19.264068
938	20072418142931314	7%	30.38MB/362.63MB : 8.38%	2024-07-28 15:56:22.696228
939	20072418142931314	11%	30.46MB/362.63MB : 8.40%	2024-07-28 15:56:25.403543
940	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 15:56:28.958276
941	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 15:56:31.681029
942	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:56:34.372512
943	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:56:37.099656
944	20072418145628243	6%	30.39MB/362.63MB : 8.38%	2024-07-28 15:57:11.581195
945	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:57:14.657795
946	20072418142931314	7%	30.38MB/362.63MB : 8.38%	2024-07-28 15:57:17.785102
947	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 15:57:20.942632
948	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 15:57:24.008093
949	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 15:57:27.151045
950	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:57:29.411904
951	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:57:32.556806
952	20072418145628243	8%	30.37MB/362.63MB : 8.38%	2024-07-28 15:58:06.586805
953	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 15:58:10.334213
954	20072418142931314	8%	30.38MB/362.63MB : 8.38%	2024-07-28 15:58:12.827844
955	20072418142931314	11%	30.46MB/362.63MB : 8.40%	2024-07-28 15:58:16.451033
956	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 15:58:19.081705
957	28062414365385132	6%	30.70MB/362.63MB : 8.47%	2024-07-28 15:58:22.688371
958	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:58:24.483722
959	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:58:28.07128
960	20072418145628243	6%	30.39MB/362.63MB : 8.38%	2024-07-28 15:59:02.318749
961	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 15:59:05.400721
962	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-28 15:59:08.545811
963	20072418142931314	17%	30.46MB/362.63MB : 8.40%	2024-07-28 15:59:11.611707
964	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 15:59:14.738079
965	28062414365385132	6%	30.70MB/362.63MB : 8.47%	2024-07-28 15:59:17.864582
966	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 15:59:20.123746
967	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 15:59:23.249637
968	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 15:59:58.057534
969	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 16:00:00.890719
970	20072418142931314	5%	30.38MB/362.63MB : 8.38%	2024-07-28 16:00:04.218166
971	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:00:07.142806
972	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 16:00:10.487788
973	28062414365385132	8%	30.70MB/362.63MB : 8.47%	2024-07-28 16:00:13.398708
974	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:00:15.90437
975	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:00:18.78173
976	20072418145628243	14%	30.40MB/362.63MB : 8.38%	2024-07-28 16:00:52.278423
977	20072418145628243	8%	30.49MB/362.63MB : 8.41%	2024-07-28 16:00:56.086106
978	20072418142931314	12%	30.38MB/362.63MB : 8.38%	2024-07-28 16:00:58.51781
979	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:01:02.309825
980	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 16:01:04.741761
981	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 16:01:08.536983
982	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:01:10.145437
983	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:01:13.922857
984	20072418145628243	5%	30.37MB/362.63MB : 8.38%	2024-07-28 16:01:47.004921
985	20072418145628243	14%	30.52MB/362.63MB : 8.41%	2024-07-28 16:01:50.240533
986	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 16:01:53.195427
987	20072418142931314	15%	30.46MB/362.63MB : 8.40%	2024-07-28 16:01:56.490492
988	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 16:01:59.462622
989	28062414365385132	8%	30.70MB/362.63MB : 8.47%	2024-07-28 16:02:02.714066
990	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:02:04.864778
991	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:02:08.116801
992	20072418145628243	6%	30.37MB/362.63MB : 8.38%	2024-07-28 16:02:41.883581
993	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 16:02:45.427858
994	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-28 16:02:48.121103
995	20072418142931314	12%	30.48MB/362.63MB : 8.41%	2024-07-28 16:02:51.713738
996	28062414365385132	10%	30.62MB/362.63MB : 8.45%	2024-07-28 16:02:54.329685
997	28062414365385132	10%	30.70MB/362.63MB : 8.47%	2024-07-28 16:02:57.9373
998	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:02:59.733545
999	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:03:03.342118
1000	20072418145628243	6%	30.45MB/362.63MB : 8.40%	2024-07-28 16:05:22.173723
1001	20072418145628243	6%	30.53MB/362.63MB : 8.42%	2024-07-28 16:05:23.688059
1002	20072418142931314	7%	30.46MB/362.63MB : 8.40%	2024-07-28 16:05:28.436132
1003	20072418142931314	7%	30.46MB/362.63MB : 8.40%	2024-07-28 16:05:30.044163
1004	28062414365385132	16%	30.65MB/362.63MB : 8.45%	2024-07-28 16:05:34.642002
1005	28062414365385132	16%	30.70MB/362.63MB : 8.47%	2024-07-28 16:05:36.267691
1006	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:05:40.02728
1007	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:05:41.65377
1008	20072418145628243	7%	30.43MB/362.63MB : 8.39%	2024-07-28 16:06:16.872369
1009	20072418145628243	7%	30.52MB/362.63MB : 8.41%	2024-07-28 16:06:18.620313
1010	20072418142931314	8%	30.42MB/362.63MB : 8.39%	2024-07-28 16:06:23.107085
1011	20072418142931314	8%	30.47MB/362.63MB : 8.40%	2024-07-28 16:06:24.821878
1012	28062414365385132	11%	30.65MB/362.63MB : 8.45%	2024-07-28 16:06:29.362516
1013	28062414365385132	11%	30.73MB/362.63MB : 8.47%	2024-07-28 16:06:31.034379
1014	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:06:34.760526
1015	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:06:36.431593
1016	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 16:07:11.710831
1017	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 16:07:14.109108
1018	20072418142931314	6%	30.38MB/362.63MB : 8.38%	2024-07-28 16:07:17.930867
1019	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:07:20.453658
1020	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 16:07:24.179562
1021	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 16:07:26.651782
1022	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:07:29.606084
1023	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:07:32.062267
1024	20072418145628243	7%	30.44MB/362.63MB : 8.39%	2024-07-28 16:08:07.425741
1025	20072418145628243	7%	30.49MB/362.63MB : 8.41%	2024-07-28 16:08:10.042326
1026	20072418142931314	13%	30.38MB/362.63MB : 8.38%	2024-07-28 16:08:13.656632
1027	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:08:16.236858
1028	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 16:08:19.873793
1029	28062414365385132	8%	30.70MB/362.63MB : 8.47%	2024-07-28 16:08:22.489495
1030	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:08:25.291967
1031	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:08:27.876711
1032	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 16:09:02.641272
1033	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 16:09:04.931578
1034	20072418142931314	7%	30.38MB/362.63MB : 8.38%	2024-07-28 16:09:08.783585
1035	20072418142931314	16%	30.50MB/362.63MB : 8.41%	2024-07-28 16:09:11.118411
1036	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 16:09:15.033238
1037	28062414365385132	6%	30.70MB/362.63MB : 8.47%	2024-07-28 16:09:17.371031
1038	28062414183645219	1%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:09:20.433895
1039	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:09:22.757882
1040	20072418145628243	6%	30.39MB/362.63MB : 8.38%	2024-07-28 16:09:57.185097
1041	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 16:10:00.344535
1042	20072418142931314	8%	30.38MB/362.63MB : 8.38%	2024-07-28 16:10:03.331175
1043	20072418142931314	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:10:06.501322
1044	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 16:10:09.546305
1045	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 16:10:12.745848
1046	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:10:14.958064
1047	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:10:18.160876
1048	20072418145628243	15%	30.39MB/362.63MB : 8.38%	2024-07-28 16:10:51.58755
1049	20072418145628243	9%	30.48MB/362.63MB : 8.41%	2024-07-28 16:10:55.371328
1050	20072418142931314	13%	30.38MB/362.63MB : 8.38%	2024-07-28 16:10:57.984785
1051	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:11:01.638437
1052	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 16:11:04.221618
1053	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 16:11:07.875929
1054	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:11:09.607174
1055	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:11:13.288473
1056	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-28 16:11:47.098259
1057	20072418145628243	19%	30.52MB/362.63MB : 8.41%	2024-07-28 16:11:49.945411
1058	20072418142931314	18%	30.37MB/362.63MB : 8.38%	2024-07-28 16:11:53.502959
1059	20072418142931314	18%	30.46MB/362.63MB : 8.40%	2024-07-28 16:11:56.209439
1060	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 16:11:59.731816
1061	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 16:12:02.452072
1062	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:12:05.12911
1063	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:12:07.863473
1064	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 16:12:42.833977
1065	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 16:12:44.892131
1066	20072418142931314	3%	30.41MB/362.63MB : 8.38%	2024-07-28 16:12:49.052301
1067	20072418142931314	17%	30.48MB/362.63MB : 8.41%	2024-07-28 16:12:51.159823
1068	28062414365385132	9%	30.64MB/362.63MB : 8.45%	2024-07-28 16:12:55.368423
1069	28062414365385132	9%	30.71MB/362.63MB : 8.47%	2024-07-28 16:12:57.548752
1070	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:13:00.767578
1071	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:13:02.942742
1072	20072418145628243	6%	30.43MB/362.63MB : 8.39%	2024-07-28 16:13:38.134337
1073	20072418145628243	8%	30.46MB/362.63MB : 8.40%	2024-07-28 16:13:39.884555
1074	20072418142931314	3%	30.41MB/362.63MB : 8.38%	2024-07-28 16:13:44.337618
1075	20072418142931314	16%	30.48MB/362.63MB : 8.41%	2024-07-28 16:13:46.04074
1076	28062414365385132	6%	30.65MB/362.63MB : 8.45%	2024-07-28 16:13:50.589315
1077	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:13:52.344849
1078	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:13:55.993022
1079	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:13:57.726377
1080	20072418145628243	3%	30.43MB/362.63MB : 8.39%	2024-07-28 16:14:33.010323
1081	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:14:34.744552
1082	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-28 16:14:39.17133
1083	20072418142931314	17%	30.46MB/362.63MB : 8.40%	2024-07-28 16:14:40.966613
1084	28062414365385132	6%	30.65MB/362.63MB : 8.45%	2024-07-28 16:14:45.393625
1085	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:14:47.189296
1086	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:14:50.780195
1087	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:14:52.576413
1088	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 16:15:27.822468
1089	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 16:15:30.111356
1090	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-28 16:15:34.043014
1091	20072418142931314	17%	30.46MB/362.63MB : 8.40%	2024-07-28 16:15:36.331831
1092	28062414365385132	6%	30.62MB/362.63MB : 8.44%	2024-07-28 16:15:40.273007
1093	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:15:42.579369
1094	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:15:45.674006
1095	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:15:47.962719
1096	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 16:16:23.081953
1097	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 16:16:25.153578
1098	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-28 16:16:29.286695
1099	20072418142931314	16%	30.46MB/362.63MB : 8.40%	2024-07-28 16:16:31.344484
1100	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-28 16:16:35.511425
1101	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:16:37.569073
1102	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:16:40.89886
1103	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:16:42.973576
1104	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-28 16:17:18.647123
1105	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 16:17:20.488552
1106	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-28 16:17:24.818845
1107	20072418142931314	17%	30.46MB/362.63MB : 8.40%	2024-07-28 16:17:26.6605
1108	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-28 16:17:31.057894
1109	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:17:32.870314
1110	28062414183645219	0%	336.69MB/1193.98MB : 28.20%	2024-07-28 16:17:36.445339
1111	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:17:38.270003
1112	20072418145628243	3%	30.44MB/362.63MB : 8.39%	2024-07-28 16:18:13.99386
1113	20072418145628243	3%	30.49MB/362.63MB : 8.41%	2024-07-28 16:18:15.061068
1114	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 16:18:20.245954
1115	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 16:18:21.312602
1116	28062414365385132	6%	30.65MB/362.63MB : 8.45%	2024-07-28 16:18:26.460823
1117	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:18:27.482474
1118	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:18:31.844749
1119	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:18:32.882726
1120	20072418145628243	3%	30.48MB/362.63MB : 8.40%	2024-07-28 16:19:08.754904
1121	20072418145628243	3%	30.49MB/362.63MB : 8.41%	2024-07-28 16:19:09.714898
1122	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 16:19:15.023821
1123	20072418142931314	18%	30.47MB/362.63MB : 8.40%	2024-07-28 16:19:15.90541
1124	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 16:19:21.246072
1125	28062414365385132	7%	30.71MB/362.63MB : 8.47%	2024-07-28 16:19:22.175643
1126	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:19:26.660619
1127	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:19:27.575277
1128	20072418145628243	3%	30.48MB/362.63MB : 8.40%	2024-07-28 16:20:03.495471
1129	20072418145628243	3%	30.49MB/362.63MB : 8.41%	2024-07-28 16:20:04.284568
1130	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 16:20:09.743458
1131	20072418142931314	16%	30.47MB/362.63MB : 8.40%	2024-07-28 16:20:10.485975
1132	28062414365385132	6%	30.70MB/362.63MB : 8.46%	2024-07-28 16:20:15.964412
1133	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 16:20:16.754383
1134	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:20:21.365728
1135	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:20:22.153391
1136	20072418145628243	5%	30.48MB/362.63MB : 8.40%	2024-07-28 16:20:58.154068
1137	20072418145628243	5%	30.49MB/362.63MB : 8.41%	2024-07-28 16:20:58.572126
1138	20072418142931314	2%	30.48MB/362.63MB : 8.40%	2024-07-28 16:21:04.391003
1139	20072418142931314	2%	30.49MB/362.63MB : 8.41%	2024-07-28 16:21:04.777877
1140	28062414365385132	11%	30.73MB/362.63MB : 8.47%	2024-07-28 16:21:10.705745
1141	28062414365385132	11%	30.74MB/362.63MB : 8.48%	2024-07-28 16:21:11.061706
1142	28062414183645219	0%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:21:16.140472
1143	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:21:16.481108
1144	20072418145628243	14%	30.48MB/362.63MB : 8.40%	2024-07-28 16:21:52.583901
1145	20072418145628243	14%	30.49MB/362.63MB : 8.41%	2024-07-28 16:21:52.922608
1146	20072418142931314	3%	30.45MB/362.63MB : 8.40%	2024-07-28 16:21:58.797472
1147	20072418142931314	3%	30.46MB/362.63MB : 8.40%	2024-07-28 16:21:59.137333
1148	28062414365385132	10%	30.73MB/362.63MB : 8.47%	2024-07-28 16:22:05.077634
1149	28062414365385132	10%	30.74MB/362.63MB : 8.48%	2024-07-28 16:22:05.418224
1150	28062414183645219	1%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:22:10.461827
1151	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:22:10.818488
1152	20072418145628243	14%	30.49MB/362.63MB : 8.41%	2024-07-28 16:22:46.769714
1153	20072418145628243	14%	30.51MB/362.63MB : 8.41%	2024-07-28 16:22:47.157071
1154	20072418142931314	22%	30.45MB/362.63MB : 8.40%	2024-07-28 16:22:53.072135
1155	20072418142931314	22%	30.46MB/362.63MB : 8.40%	2024-07-28 16:22:53.445034
1156	28062414365385132	12%	30.72MB/362.63MB : 8.47%	2024-07-28 16:22:59.345279
1157	28062414365385132	12%	30.74MB/362.63MB : 8.48%	2024-07-28 16:22:59.702033
1158	28062414183645219	1%	336.81MB/1193.98MB : 28.21%	2024-07-28 16:23:04.748217
1159	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:23:05.105691
1160	20072418145628243	11%	30.48MB/362.63MB : 8.40%	2024-07-28 16:23:41.468114
1161	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 16:23:41.499127
1162	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 16:23:47.812875
1163	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:23:47.828441
1164	28062414365385132	17%	30.71MB/362.63MB : 8.47%	2024-07-28 16:23:54.18183
1165	28062414365385132	17%	30.72MB/362.63MB : 8.47%	2024-07-28 16:23:54.197334
1166	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:23:59.582125
1167	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:23:59.644145
1168	20072418145628243	12%	30.48MB/362.63MB : 8.40%	2024-07-28 16:24:36.187722
1169	20072418145628243	12%	30.49MB/362.63MB : 8.41%	2024-07-28 16:24:36.263709
1170	20072418142931314	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:24:42.502387
1171	20072418142931314	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:24:42.532892
1172	28062414365385132	12%	30.73MB/362.63MB : 8.47%	2024-07-28 16:24:48.932161
1173	28062414365385132	12%	30.74MB/362.63MB : 8.48%	2024-07-28 16:24:48.932161
1174	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:24:54.35883
1175	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:24:54.373832
1176	20072418145628243	10%	30.48MB/362.63MB : 8.40%	2024-07-28 16:25:30.846955
1177	20072418145628243	10%	30.49MB/362.63MB : 8.41%	2024-07-28 16:25:30.877468
1178	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 16:25:37.178018
1179	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:25:37.209027
1180	28062414365385132	10%	30.74MB/362.63MB : 8.48%	2024-07-28 16:25:43.551523
1181	28062414365385132	10%	30.73MB/362.63MB : 8.47%	2024-07-28 16:25:43.551523
1182	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:25:48.988608
1183	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:25:49.000025
1184	20072418145628243	11%	30.48MB/362.63MB : 8.40%	2024-07-28 16:26:25.546719
1185	20072418145628243	11%	30.49MB/362.63MB : 8.41%	2024-07-28 16:26:25.592667
1186	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 16:26:31.877361
1187	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:26:31.892855
1188	28062414365385132	11%	30.73MB/362.63MB : 8.48%	2024-07-28 16:26:38.282687
1189	28062414365385132	11%	30.75MB/362.63MB : 8.48%	2024-07-28 16:26:38.31346
1190	28062414183645219	1%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:26:43.713448
1191	28062414183645219	1%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:26:43.72895
1192	20072418145628243	2%	30.48MB/362.63MB : 8.40%	2024-07-28 16:27:20.018103
1193	20072418145628243	2%	30.49MB/362.63MB : 8.41%	2024-07-28 16:27:20.095644
1194	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:27:26.398625
1195	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 16:27:26.398625
1196	28062414365385132	3%	30.73MB/362.63MB : 8.47%	2024-07-28 16:27:32.755728
1197	28062414365385132	3%	30.74MB/362.63MB : 8.48%	2024-07-28 16:27:32.771223
1198	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:27:38.171493
1199	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:27:38.18699
1200	20072418145628243	2%	30.48MB/362.63MB : 8.40%	2024-07-28 16:28:14.445563
1201	20072418145628243	2%	30.49MB/362.63MB : 8.41%	2024-07-28 16:28:14.523645
1202	20072418142931314	14%	30.45MB/362.63MB : 8.40%	2024-07-28 16:28:20.777258
1203	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 16:28:20.808383
1204	28062414365385132	3%	30.73MB/362.63MB : 8.47%	2024-07-28 16:28:27.137988
1205	28062414365385132	3%	30.74MB/362.63MB : 8.48%	2024-07-28 16:28:27.153919
1206	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:28:32.538962
1207	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:28:32.600286
1208	20072418145628243	3%	30.48MB/362.63MB : 8.40%	2024-07-28 16:29:09.10374
1209	20072418145628243	3%	30.49MB/362.63MB : 8.41%	2024-07-28 16:29:09.134736
1210	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 16:29:15.454174
1211	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 16:29:15.454174
1212	28062414365385132	5%	30.73MB/362.63MB : 8.47%	2024-07-28 16:29:21.832159
1213	28062414365385132	5%	30.74MB/362.63MB : 8.48%	2024-07-28 16:29:21.847656
1214	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:29:27.248931
1215	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:29:27.264466
1216	20072418145628243	2%	30.48MB/362.63MB : 8.40%	2024-07-28 16:30:03.502691
1217	20072418145628243	2%	30.49MB/362.63MB : 8.41%	2024-07-28 16:30:03.548928
1218	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 16:30:09.873962
1219	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 16:30:09.87346
1220	28062414365385132	8%	30.73MB/362.63MB : 8.48%	2024-07-28 16:30:16.267595
1221	28062414365385132	8%	30.75MB/362.63MB : 8.48%	2024-07-28 16:30:16.268088
1222	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:30:21.687872
1223	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:30:21.702133
1224	20072418145628243	6%	30.48MB/362.63MB : 8.40%	2024-07-28 16:30:57.975997
1225	20072418145628243	6%	30.49MB/362.63MB : 8.41%	2024-07-28 16:30:58.037702
1226	20072418142931314	3%	30.45MB/362.63MB : 8.40%	2024-07-28 16:31:04.261548
1227	20072418142931314	3%	30.46MB/362.63MB : 8.40%	2024-07-28 16:31:04.323169
1228	28062414365385132	9%	30.74MB/362.63MB : 8.48%	2024-07-28 16:31:10.649464
1229	28062414365385132	9%	30.73MB/362.63MB : 8.47%	2024-07-28 16:31:10.649464
1230	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:31:16.080733
1231	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:31:16.096241
1232	20072418145628243	18%	30.47MB/362.63MB : 8.40%	2024-07-28 16:31:52.748839
1233	20072418145628243	18%	30.48MB/362.63MB : 8.41%	2024-07-28 16:31:52.810845
1234	20072418142931314	8%	30.45MB/362.63MB : 8.40%	2024-07-28 16:31:59.126569
1235	20072418142931314	8%	30.46MB/362.63MB : 8.40%	2024-07-28 16:31:59.173087
1236	28062414365385132	10%	30.73MB/362.63MB : 8.47%	2024-07-28 16:32:05.535844
1237	28062414365385132	10%	30.74MB/362.63MB : 8.48%	2024-07-28 16:32:05.550839
1238	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:32:10.939168
1239	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:32:10.970172
1240	20072418145628243	10%	30.41MB/362.63MB : 8.39%	2024-07-28 16:32:47.389965
1241	20072418145628243	10%	30.42MB/362.63MB : 8.39%	2024-07-28 16:32:47.467744
1242	20072418142931314	15%	30.47MB/362.63MB : 8.40%	2024-07-28 16:32:53.891172
1243	20072418142931314	15%	30.48MB/362.63MB : 8.41%	2024-07-28 16:32:53.906726
1244	28062414365385132	15%	30.66MB/362.63MB : 8.46%	2024-07-28 16:33:00.267984
1245	28062414365385132	15%	30.68MB/362.63MB : 8.46%	2024-07-28 16:33:00.267984
1246	28062414183645219	0%	336.82MB/1193.98MB : 28.21%	2024-07-28 16:33:05.694293
1247	28062414183645219	0%	336.83MB/1193.98MB : 28.21%	2024-07-28 16:33:05.694293
1248	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:33:42.249556
1249	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:33:42.326827
1250	20072418142931314	11%	30.43MB/362.63MB : 8.39%	2024-07-28 16:33:48.576692
1251	20072418142931314	11%	30.44MB/362.63MB : 8.39%	2024-07-28 16:33:48.653257
1252	28062414365385132	13%	30.71MB/362.63MB : 8.47%	2024-07-28 16:33:54.959973
1253	28062414365385132	13%	30.72MB/362.63MB : 8.47%	2024-07-28 16:33:54.990479
1254	28062414183645219	1%	336.61MB/1193.98MB : 28.19%	2024-07-28 16:34:00.377698
1255	28062414183645219	1%	336.62MB/1193.98MB : 28.19%	2024-07-28 16:34:00.393195
1256	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 16:34:36.878963
1257	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:34:36.957029
1258	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:34:43.235422
1259	20072418142931314	12%	30.47MB/362.63MB : 8.40%	2024-07-28 16:34:43.250912
1260	28062414365385132	11%	30.71MB/362.63MB : 8.47%	2024-07-28 16:34:49.626076
1261	28062414365385132	11%	30.72MB/362.63MB : 8.47%	2024-07-28 16:34:49.626076
1262	28062414183645219	1%	336.61MB/1193.98MB : 28.19%	2024-07-28 16:34:55.070011
1263	28062414183645219	1%	336.62MB/1193.98MB : 28.19%	2024-07-28 16:34:55.070011
1264	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 16:35:32.340092
1265	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 16:35:32.340092
1266	20072418142931314	7%	30.47MB/362.63MB : 8.40%	2024-07-28 16:35:38.745587
1267	20072418142931314	7%	30.46MB/362.63MB : 8.40%	2024-07-28 16:35:38.745587
1268	28062414365385132	10%	30.67MB/362.63MB : 8.46%	2024-07-28 16:35:45.136039
1269	28062414365385132	10%	30.68MB/362.63MB : 8.46%	2024-07-28 16:35:45.152054
1270	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:35:50.551083
1271	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:35:50.597615
1272	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 16:36:27.094242
1273	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 16:36:27.171964
1274	20072418142931314	9%	30.46MB/362.63MB : 8.40%	2024-07-28 16:36:33.47387
1275	20072418142931314	9%	30.47MB/362.63MB : 8.40%	2024-07-28 16:36:33.535824
1276	28062414365385132	11%	30.67MB/362.63MB : 8.46%	2024-07-28 16:36:39.835638
1277	28062414365385132	11%	30.68MB/362.63MB : 8.46%	2024-07-28 16:36:39.865999
1278	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:36:45.251568
1279	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:36:45.267087
1280	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:37:21.548012
1281	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:37:21.639889
1282	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:37:27.913029
1283	20072418142931314	12%	30.47MB/362.63MB : 8.40%	2024-07-28 16:37:27.94404
1284	28062414365385132	11%	30.67MB/362.63MB : 8.46%	2024-07-28 16:37:34.301756
1285	28062414365385132	11%	30.68MB/362.63MB : 8.46%	2024-07-28 16:37:34.317259
1286	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:37:39.701334
1287	28062414183645219	0%	336.58MB/1193.98MB : 28.19%	2024-07-28 16:37:39.716835
1288	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:38:16.181345
1289	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:38:16.24346
1290	20072418142931314	12%	30.47MB/362.63MB : 8.40%	2024-07-28 16:38:22.587856
1291	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:38:22.587856
1292	28062414365385132	11%	30.67MB/362.63MB : 8.46%	2024-07-28 16:38:28.951854
1293	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 16:38:28.982392
1294	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:38:34.370653
1295	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:38:34.416447
1296	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 16:39:10.709657
1297	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:39:10.787242
1298	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 16:39:16.990763
1299	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-28 16:39:17.052852
1300	28062414365385132	11%	30.73MB/362.63MB : 8.47%	2024-07-28 16:39:23.377791
1301	28062414365385132	11%	30.74MB/362.63MB : 8.48%	2024-07-28 16:39:23.392793
1302	28062414183645219	1%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:39:28.793499
1303	28062414183645219	1%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:39:28.840002
1304	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:40:05.276836
1305	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:40:05.338626
1306	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 16:40:11.67976
1307	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-28 16:40:11.695764
1308	28062414365385132	12%	30.67MB/362.63MB : 8.46%	2024-07-28 16:40:18.168905
1309	28062414365385132	12%	30.68MB/362.63MB : 8.46%	2024-07-28 16:40:18.184404
1310	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:40:23.587165
1311	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:40:23.633351
1312	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 16:41:00.129468
1313	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 16:41:00.207131
1314	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 16:41:06.471308
1315	20072418142931314	12%	30.47MB/362.63MB : 8.40%	2024-07-28 16:41:06.486314
1316	28062414365385132	3%	30.67MB/362.63MB : 8.46%	2024-07-28 16:41:12.873651
1317	28062414365385132	3%	30.68MB/362.63MB : 8.46%	2024-07-28 16:41:12.873651
1318	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:41:18.335853
1319	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:41:18.335853
1320	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 16:41:54.897705
1321	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 16:41:54.959417
1322	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 16:42:01.261129
1323	20072418142931314	13%	30.47MB/362.63MB : 8.40%	2024-07-28 16:42:01.261129
1324	28062414365385132	2%	30.67MB/362.63MB : 8.46%	2024-07-28 16:42:07.621722
1325	28062414365385132	2%	30.68MB/362.63MB : 8.46%	2024-07-28 16:42:07.621722
1326	28062414183645219	0%	336.57MB/1193.98MB : 28.19%	2024-07-28 16:42:13.051973
1327	28062414183645219	0%	336.56MB/1193.98MB : 28.19%	2024-07-28 16:42:13.051973
1328	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:42:50.12045
1329	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 16:42:56.362584
1330	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:43:02.58593
1331	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:43:07.99931
1332	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 16:43:14.56616
1333	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 16:43:20.809312
1334	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:43:27.092992
1335	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:43:32.499233
1336	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:43:45.857298
1337	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 16:43:52.048514
1338	28062414365385132	16%	30.60MB/362.63MB : 8.44%	2024-07-28 16:43:58.299055
1339	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:44:03.703074
1340	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:44:09.882923
1341	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:44:16.121523
1342	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:44:22.373686
1343	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:44:27.771859
1344	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:44:40.860762
1345	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:44:47.02017
1346	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:44:53.257038
1347	28062414183645219	1%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:44:58.661332
1348	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:45:04.914945
1349	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 16:45:11.117263
1350	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:45:17.324172
1351	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:45:22.721626
1352	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 16:45:36.618232
1353	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 16:45:42.825489
1354	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:45:49.032727
1355	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:45:54.432605
1356	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:46:00.159406
1357	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:46:06.477137
1358	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:46:12.696247
1359	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:46:18.111204
1360	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:46:32.304116
1361	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 16:46:38.494193
1362	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:46:44.688634
1363	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:46:50.090989
1364	20072418145628243	9%	30.34MB/362.63MB : 8.37%	2024-07-28 16:46:54.964708
1365	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:47:01.134577
1366	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:47:07.325821
1367	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:47:12.707659
1368	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 16:47:27.688138
1369	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 16:47:33.829717
1370	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 16:47:40.055728
1371	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:47:45.454728
1372	20072418145628243	2%	30.41MB/362.63MB : 8.38%	2024-07-28 16:47:49.168685
1373	20072418142931314	20%	30.37MB/362.63MB : 8.38%	2024-07-28 16:47:55.515133
1374	28062414365385132	12%	30.60MB/362.63MB : 8.44%	2024-07-28 16:48:01.751261
1375	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:48:07.134444
1376	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 16:48:22.422834
1377	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 16:48:28.643804
1378	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:48:34.860968
1379	28062414183645219	1%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:48:40.262056
1380	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 16:48:44.50755
1381	20072418142931314	15%	30.35MB/362.63MB : 8.37%	2024-07-28 16:48:50.726892
1382	20072418145628243	2%	30.41MB/362.63MB : 8.38%	2024-07-28 16:48:59.573928
1383	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 16:49:05.84777
1384	28062414365385132	3%	30.60MB/362.63MB : 8.44%	2024-07-28 16:49:12.082953
1385	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:49:17.437421
1386	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:49:17.48441
1387	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 16:49:23.59488
1388	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 16:49:29.812046
1389	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:49:35.22866
1390	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:49:37.085435
1391	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:49:43.22898
1392	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:49:49.476707
1393	28062414183645219	1%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:49:54.879396
1394	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:50:12.439396
1395	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 16:50:18.767447
1396	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:50:25.032373
1397	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:50:30.430805
1398	20072418145628243	16%	30.41MB/362.63MB : 8.38%	2024-07-28 16:50:49.929906
1399	20072418142931314	14%	30.35MB/362.63MB : 8.37%	2024-07-28 16:50:56.193455
1400	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 16:51:02.47789
1401	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:51:07.438116
1402	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:51:07.855786
1403	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 16:51:13.644872
1404	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:51:19.86285
1405	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:51:25.253287
1406	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:51:44.872464
1407	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:51:51.148255
1408	28062414365385132	2%	30.63MB/362.63MB : 8.45%	2024-07-28 16:51:57.394435
1409	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:52:02.684695
1410	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:52:02.79285
1411	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 16:52:08.856262
1412	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 16:52:15.09028
1413	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:52:20.486069
1414	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 16:52:40.005686
1415	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:52:46.22403
1416	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 16:52:52.455716
1417	28062414183645219	0%	336.52MB/1193.98MB : 28.18%	2024-07-28 16:52:57.870203
1418	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 16:52:58.410705
1419	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 16:53:04.632225
1420	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 16:53:10.899438
1421	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:53:16.299267
1422	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:53:35.660261
1423	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 16:53:41.863251
1424	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 16:53:48.133432
1425	20072418145628243	12%	30.37MB/362.63MB : 8.38%	2024-07-28 16:53:53.008499
1426	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:53:53.519488
1427	20072418142931314	12%	30.35MB/362.63MB : 8.37%	2024-07-28 16:53:59.2626
1428	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 16:54:05.517101
1429	28062414183645219	0%	336.44MB/1193.98MB : 28.18%	2024-07-28 16:54:10.900419
1430	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:54:31.356843
1431	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:54:37.892014
1432	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 16:54:44.235143
1433	20072418145628243	5%	30.38MB/362.63MB : 8.38%	2024-07-28 16:54:48.11337
1434	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:54:49.631336
1435	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-28 16:54:54.442641
1436	28062414365385132	14%	30.60MB/362.63MB : 8.44%	2024-07-28 16:55:00.630019
1437	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:55:06.121171
1438	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:55:25.633303
1439	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:55:31.868087
1440	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 16:55:38.087028
1441	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 16:55:43.406141
1442	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:55:43.482662
1443	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:55:48.80404
1444	28062414365385132	10%	30.66MB/362.63MB : 8.46%	2024-07-28 16:55:55.007963
1445	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:56:00.989276
1446	20072418142931314	18%	30.35MB/362.63MB : 8.37%	2024-07-28 16:56:01.501603
1447	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 16:56:08.206994
1448	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 16:56:14.430857
1449	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 16:56:20.651504
1450	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:56:37.021437
1451	28062414183645219	0%	336.43MB/1193.98MB : 28.18%	2024-07-28 16:56:43.407125
1452	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 16:56:43.437656
1453	28062414365385132	7%	30.63MB/362.63MB : 8.45%	2024-07-28 16:56:49.671143
1454	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 16:56:51.168121
1455	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 16:56:55.86408
1456	28062414365385132	3%	30.62MB/362.63MB : 8.44%	2024-07-28 16:56:57.414054
1457	20072418142931314	12%	30.41MB/362.63MB : 8.39%	2024-07-28 16:57:03.74528
1458	28062414183645219	0%	336.53MB/1193.98MB : 28.19%	2024-07-28 16:57:28.314662
1459	28062414183645219	0%	336.66MB/1193.98MB : 28.20%	2024-07-28 16:57:31.358078
1460	28062414365385132	9%	30.63MB/362.63MB : 8.45%	2024-07-28 16:57:35.612395
1461	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 16:57:38.132924
1462	20072418142931314	9%	30.37MB/362.63MB : 8.37%	2024-07-28 16:57:42.047548
1463	28062414365385132	9%	30.60MB/362.63MB : 8.44%	2024-07-28 16:57:46.16293
1464	20072418145628243	3%	30.39MB/362.63MB : 8.38%	2024-07-28 16:57:49.072927
1465	20072418142931314	15%	30.39MB/362.63MB : 8.38%	2024-07-28 16:57:52.595511
1466	28062414365385132	14%	30.67MB/362.63MB : 8.46%	2024-07-28 17:11:58.107719
1467	28062414365385132	14%	30.68MB/362.63MB : 8.46%	2024-07-28 17:11:58.99035
1468	20072418145628243	11%	30.41MB/362.63MB : 8.38%	2024-07-28 17:12:11.25924
1469	20072418142931314	19%	30.35MB/362.63MB : 8.37%	2024-07-28 17:12:17.453401
1470	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 17:12:23.690062
1471	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:12:29.076316
1472	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 17:12:35.048659
1473	20072418142931314	9%	30.37MB/362.63MB : 8.37%	2024-07-28 17:12:41.235857
1474	28062414365385132	3%	30.60MB/362.63MB : 8.44%	2024-07-28 17:12:47.462655
1475	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:12:52.870978
1476	20072418145628243	10%	30.41MB/362.63MB : 8.38%	2024-07-28 17:12:53.64437
1477	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:13:03.5782
1478	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:13:07.55134
1479	20072418145628243	6%	30.35MB/362.63MB : 8.37%	2024-07-28 17:13:10.924213
1480	20072418145628243	6%	30.43MB/362.63MB : 8.39%	2024-07-28 17:13:13.991155
1481	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 17:13:17.161462
1482	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 17:13:20.212729
1483	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 17:13:23.399791
1484	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-28 17:13:26.449194
1485	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:14:00.53355
1486	20072418145628243	7%	30.43MB/362.63MB : 8.39%	2024-07-28 17:14:03.566481
1487	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:14:06.785648
1488	20072418142931314	9%	30.44MB/362.63MB : 8.39%	2024-07-28 17:14:09.817535
1489	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 17:14:13.018719
1490	28062414365385132	10%	30.68MB/362.63MB : 8.46%	2024-07-28 17:14:16.052065
1491	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:14:18.418196
1492	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:14:21.45188
1493	20072418145628243	18%	30.37MB/362.63MB : 8.38%	2024-07-28 17:14:55.167515
1494	20072418145628243	18%	30.46MB/362.63MB : 8.40%	2024-07-28 17:14:58.062151
1495	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:15:01.358428
1496	20072418142931314	10%	30.44MB/362.63MB : 8.39%	2024-07-28 17:15:04.268758
1497	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 17:15:07.596175
1498	28062414365385132	13%	30.69MB/362.63MB : 8.46%	2024-07-28 17:15:10.505767
1499	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:15:12.998549
1500	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:15:15.892148
1501	28062414183645219	0%	338.25MB/1193.98MB : 28.33%	2024-07-28 17:15:48.474058
1502	20072418145628243	6%	30.41MB/362.63MB : 8.38%	2024-07-28 17:15:52.995407
1503	28062414365385132	11%	30.60MB/362.63MB : 8.44%	2024-07-28 17:15:54.715254
1504	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:15:59.268911
1505	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:16:01.985611
1506	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 17:16:05.541669
1507	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 17:16:08.155038
1508	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:16:10.952672
1509	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:16:43.695879
1510	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:16:46.480368
1511	20072418145628243	21%	30.41MB/362.63MB : 8.38%	2024-07-28 17:16:50.548623
1512	20072418145628243	21%	30.46MB/362.63MB : 8.40%	2024-07-28 17:16:52.74832
1513	28062414365385132	11%	30.60MB/362.63MB : 8.44%	2024-07-28 17:16:56.819731
1514	28062414365385132	14%	30.68MB/362.63MB : 8.46%	2024-07-28 17:16:59.033243
1515	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 17:17:02.996654
1516	20072418142931314	11%	30.44MB/362.63MB : 8.39%	2024-07-28 17:17:05.273773
1517	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:17:38.472956
1518	20072418145628243	6%	30.38MB/362.63MB : 8.38%	2024-07-28 17:17:42.708618
1519	20072418145628243	8%	30.43MB/362.63MB : 8.39%	2024-07-28 17:17:45.803788
1520	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:17:48.09027
1521	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 17:17:52.036671
1522	28062414365385132	20%	30.72MB/362.63MB : 8.47%	2024-07-28 17:17:54.435277
1523	20072418142931314	16%	30.35MB/362.63MB : 8.37%	2024-07-28 17:17:58.32059
1524	20072418142931314	14%	30.44MB/362.63MB : 8.39%	2024-07-28 17:18:00.674111
1525	28062414183645219	1%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:18:33.784806
1526	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:18:36.138351
1527	20072418145628243	12%	30.40MB/362.63MB : 8.38%	2024-07-28 17:18:41.058641
1528	20072418145628243	12%	30.43MB/362.63MB : 8.39%	2024-07-28 17:18:42.823838
1529	28062414365385132	2%	30.63MB/362.63MB : 8.45%	2024-07-28 17:18:47.279796
1530	28062414365385132	14%	30.69MB/362.63MB : 8.46%	2024-07-28 17:18:49.10508
1531	20072418142931314	8%	30.37MB/362.63MB : 8.37%	2024-07-28 17:18:53.516184
1532	20072418145628243	2%	30.45MB/362.63MB : 8.40%	2024-07-28 17:19:04.646938
1533	20072418145628243	13%	30.46MB/362.63MB : 8.40%	2024-07-28 17:19:05.667706
1534	20072418142931314	13%	30.43MB/362.63MB : 8.39%	2024-07-28 17:19:10.83084
1535	20072418142931314	13%	30.44MB/362.63MB : 8.39%	2024-07-28 17:19:11.851784
1536	28062414365385132	3%	30.63MB/362.63MB : 8.45%	2024-07-28 17:19:17.038755
1537	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:19:25.478679
1538	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:19:26.314299
1539	20072418145628243	9%	30.45MB/362.63MB : 8.40%	2024-07-28 17:19:32.31047
1540	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 17:19:32.665828
1541	28062414365385132	10%	30.71MB/362.63MB : 8.47%	2024-07-28 17:19:38.60694
1542	28062414365385132	10%	30.72MB/362.63MB : 8.47%	2024-07-28 17:19:38.93286
1543	20072418142931314	3%	30.45MB/362.63MB : 8.40%	2024-07-28 17:19:44.886504
1544	20072418142931314	3%	30.46MB/362.63MB : 8.40%	2024-07-28 17:19:45.164725
1545	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:20:20.373869
1546	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:20:20.652392
1547	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 17:20:27.010485
1548	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:20:27.088235
1549	28062414365385132	12%	30.67MB/362.63MB : 8.46%	2024-07-28 17:20:33.368408
1550	28062414365385132	12%	30.68MB/362.63MB : 8.46%	2024-07-28 17:20:33.368408
1551	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 17:20:39.696221
1552	20072418142931314	2%	30.47MB/362.63MB : 8.40%	2024-07-28 17:20:39.727231
1553	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:21:15.177448
1554	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:21:15.238483
1555	28062414365385132	6%	30.69MB/362.63MB : 8.46%	2024-07-28 17:21:21.589192
1556	28062414365385132	6%	30.67MB/362.63MB : 8.46%	2024-07-28 17:21:21.589192
1557	20072418145628243	6%	30.45MB/362.63MB : 8.40%	2024-07-28 17:21:27.862524
1558	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 17:21:27.954345
1559	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 17:21:34.153298
1560	20072418142931314	2%	30.47MB/362.63MB : 8.40%	2024-07-28 17:21:34.214839
1561	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:22:09.640351
1562	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:22:09.701987
1563	28062414365385132	9%	30.67MB/362.63MB : 8.46%	2024-07-28 17:22:15.981486
1564	28062414365385132	9%	30.68MB/362.63MB : 8.46%	2024-07-28 17:22:16.013062
1565	20072418145628243	9%	30.45MB/362.63MB : 8.40%	2024-07-28 17:22:22.597305
1566	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 17:22:22.62786
1567	20072418142931314	3%	30.46MB/362.63MB : 8.40%	2024-07-28 17:22:28.92148
1568	20072418142931314	3%	30.47MB/362.63MB : 8.40%	2024-07-28 17:22:28.952009
1569	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:23:04.46732
1570	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:23:04.46732
1571	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 17:23:10.875587
1572	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 17:23:10.937144
1573	28062414365385132	3%	30.68MB/362.63MB : 8.46%	2024-07-28 17:23:17.296912
1574	28062414365385132	3%	30.67MB/362.63MB : 8.46%	2024-07-28 17:23:17.296912
1575	20072418142931314	12%	30.47MB/362.63MB : 8.40%	2024-07-28 17:23:23.718025
1576	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 17:23:23.718025
1577	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:23:59.247664
1578	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:23:59.263168
1579	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 17:24:05.620385
1580	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:24:05.698055
1581	28062414365385132	6%	30.67MB/362.63MB : 8.46%	2024-07-28 17:24:12.04628
1582	28062414365385132	6%	30.68MB/362.63MB : 8.46%	2024-07-28 17:24:12.04628
1583	20072418142931314	10%	30.47MB/362.63MB : 8.40%	2024-07-28 17:24:18.325499
1584	20072418142931314	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:24:18.325499
1585	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:24:53.851178
1586	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:24:53.86156
1587	28062414365385132	10%	30.67MB/362.63MB : 8.46%	2024-07-28 17:25:00.2161
1588	28062414365385132	10%	30.69MB/362.63MB : 8.46%	2024-07-28 17:25:00.215598
1589	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 17:25:07.245535
1590	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:25:07.277295
1591	20072418142931314	8%	30.46MB/362.63MB : 8.40%	2024-07-28 17:25:13.55997
1592	20072418142931314	8%	30.47MB/362.63MB : 8.40%	2024-07-28 17:25:13.60568
1593	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:25:49.121994
1594	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:25:49.137493
1595	28062414365385132	14%	30.67MB/362.63MB : 8.46%	2024-07-28 17:25:55.521762
1596	28062414365385132	14%	30.68MB/362.63MB : 8.46%	2024-07-28 17:25:55.552765
1597	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 17:26:01.950611
1598	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:26:02.012884
1599	20072418142931314	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:26:08.390063
1600	20072418142931314	10%	30.47MB/362.63MB : 8.40%	2024-07-28 17:26:08.421081
1601	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:26:43.873022
1602	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:26:43.950481
1603	20072418145628243	15%	30.48MB/362.63MB : 8.41%	2024-07-28 17:26:50.245629
1604	20072418145628243	15%	30.50MB/362.63MB : 8.41%	2024-07-28 17:26:50.322659
1605	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 17:26:56.817871
1606	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 17:26:56.833375
1607	20072418142931314	16%	30.46MB/362.63MB : 8.40%	2024-07-28 17:27:03.21615
1608	20072418142931314	16%	30.47MB/362.63MB : 8.40%	2024-07-28 17:27:03.21615
1609	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:27:19.608267
1610	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:27:27.277573
1611	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:27:33.527683
1612	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:27:38.707948
1613	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:27:39.698579
1614	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:27:46.078197
1615	28062414365385132	2%	30.61MB/362.63MB : 8.44%	2024-07-28 17:27:52.325668
1616	20072418142931314	10%	30.37MB/362.63MB : 8.38%	2024-07-28 17:27:58.583118
1617	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:28:15.167489
1618	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:28:22.202549
1619	28062414365385132	2%	30.61MB/362.63MB : 8.44%	2024-07-28 17:28:28.442456
1620	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:28:34.059528
1621	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:28:34.586485
1622	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 17:28:40.24814
1623	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:28:47.956607
1624	20072418142931314	4%	30.39MB/362.63MB : 8.38%	2024-07-28 17:28:54.175921
1625	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:29:10.075068
1626	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:29:17.132328
1627	28062414365385132	2%	30.61MB/362.63MB : 8.44%	2024-07-28 17:29:23.375865
1628	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:29:29.565361
1629	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:29:29.689455
1630	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:29:35.962978
1631	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 17:29:43.795387
1632	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:29:49.967034
1633	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:30:05.102549
1634	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:30:13.000665
1635	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:30:19.218309
1636	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:30:25.40387
1637	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:30:25.465733
1638	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:30:32.165704
1639	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 17:30:38.394311
1640	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:30:44.655395
1641	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:31:08.909681
1642	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:31:19.934054
1643	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:31:20.166526
1644	28062414365385132	9%	30.70MB/362.63MB : 8.47%	2024-07-28 17:31:26.171414
1645	28062414365385132	9%	30.71MB/362.63MB : 8.47%	2024-07-28 17:31:26.420234
1646	20072418145628243	9%	30.45MB/362.63MB : 8.40%	2024-07-28 17:31:32.811399
1647	20072418145628243	9%	30.46MB/362.63MB : 8.40%	2024-07-28 17:31:32.857905
1648	28072417303662518	2%	30.38MB/362.63MB : 8.38%	2024-07-28 17:31:38.985714
1649	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 17:31:39.001217
1650	20072418142931314	13%	30.47MB/362.63MB : 8.40%	2024-07-28 17:31:45.356657
1651	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 17:31:45.358165
1652	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:32:21.015086
1653	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:32:21.015086
1654	28062414365385132	2%	30.70MB/362.63MB : 8.47%	2024-07-28 17:32:27.378061
1655	28062414365385132	2%	30.71MB/362.63MB : 8.47%	2024-07-28 17:32:27.393579
1656	28072417303662518	2%	30.39MB/362.63MB : 8.38%	2024-07-28 17:32:33.566833
1657	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 17:32:33.582346
1658	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 17:32:39.75451
1659	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 17:32:39.785592
1660	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 17:32:46.072494
1661	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-28 17:32:46.072494
1662	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:33:21.587067
1663	28062414183645219	0%	338.32MB/1193.98MB : 28.34%	2024-07-28 17:33:21.633813
1664	28072417303662518	9%	30.39MB/362.63MB : 8.38%	2024-07-28 17:33:27.74763
1665	28072417303662518	9%	30.40MB/362.63MB : 8.38%	2024-07-28 17:33:27.779135
1666	20072418145628243	2%	30.45MB/362.63MB : 8.40%	2024-07-28 17:33:34.367695
1667	20072418145628243	2%	30.46MB/362.63MB : 8.40%	2024-07-28 17:33:34.399505
1668	28062414365385132	9%	30.70MB/362.63MB : 8.47%	2024-07-28 17:33:40.787547
1669	28062414365385132	9%	30.71MB/362.63MB : 8.47%	2024-07-28 17:33:40.787547
1670	20072418142931314	13%	30.47MB/362.63MB : 8.40%	2024-07-28 17:33:47.11511
1671	20072418142931314	13%	30.46MB/362.63MB : 8.40%	2024-07-28 17:33:47.12378
1672	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:34:22.721112
1673	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:34:22.736367
1674	28072417303662518	2%	30.39MB/362.63MB : 8.38%	2024-07-28 17:34:28.879088
1675	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 17:34:28.910108
1676	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 17:34:35.281709
1677	20072418145628243	12%	30.46MB/362.63MB : 8.40%	2024-07-28 17:34:35.359197
1678	28062414365385132	6%	30.70MB/362.63MB : 8.47%	2024-07-28 17:34:41.870461
1679	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 17:34:42.50539
1680	20072418142931314	13%	30.43MB/362.63MB : 8.39%	2024-07-28 17:34:48.116637
1681	20072418142931314	13%	30.44MB/362.63MB : 8.39%	2024-07-28 17:34:48.75405
1682	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:35:23.631145
1683	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:35:24.234532
1684	28072417303662518	2%	30.39MB/362.63MB : 8.38%	2024-07-28 17:35:29.643485
1685	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 17:35:30.231601
1686	28062414365385132	10%	30.70MB/362.63MB : 8.47%	2024-07-28 17:35:35.860774
1687	28062414365385132	10%	30.71MB/362.63MB : 8.47%	2024-07-28 17:35:36.463759
1688	20072418142931314	16%	30.43MB/362.63MB : 8.39%	2024-07-28 17:35:42.062798
1689	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 17:35:42.697994
1690	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-28 17:35:48.513553
1691	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 17:35:49.039626
1692	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:36:24.05131
1693	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:36:25.13319
1694	28072417303662518	9%	30.33MB/362.63MB : 8.36%	2024-07-28 17:36:30.079651
1695	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:36:30.513714
1696	28062414365385132	8%	30.70MB/362.63MB : 8.47%	2024-07-28 17:36:36.312346
1697	28062414365385132	8%	30.71MB/362.63MB : 8.47%	2024-07-28 17:36:36.744878
1698	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 17:36:42.681448
1699	20072418145628243	10%	30.46MB/362.63MB : 8.40%	2024-07-28 17:36:43.160422
1700	20072418142931314	3%	30.45MB/362.63MB : 8.40%	2024-07-28 17:36:48.863558
1701	20072418142931314	3%	30.47MB/362.63MB : 8.40%	2024-07-28 17:36:49.403675
1702	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:37:24.389617
1703	28062414183645219	1%	338.32MB/1193.98MB : 28.34%	2024-07-28 17:37:24.915
1704	28062414365385132	10%	30.70MB/362.63MB : 8.47%	2024-07-28 17:37:30.607068
1705	28062414365385132	10%	30.71MB/362.63MB : 8.47%	2024-07-28 17:37:31.133741
1706	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:37:37.148675
1707	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 17:37:37.566187
1708	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 17:37:43.5992
1709	20072418145628243	4%	30.35MB/362.63MB : 8.37%	2024-07-28 17:37:44.505816
1710	20072418142931314	2%	30.43MB/362.63MB : 8.39%	2024-07-28 17:37:50.064339
1711	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 17:37:51.016035
1712	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:38:12.65885
1713	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:38:19.953076
1714	20072418145628243	11%	30.45MB/362.63MB : 8.40%	2024-07-28 17:38:26.250798
1715	20072418145628243	11%	30.46MB/362.63MB : 8.40%	2024-07-28 17:38:26.715294
1716	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:38:32.109316
1717	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 17:38:32.295367
1718	28062414365385132	11%	30.70MB/362.63MB : 8.47%	2024-07-28 17:38:38.334688
1719	28062414365385132	11%	30.71MB/362.63MB : 8.47%	2024-07-28 17:38:38.551514
1720	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 17:38:44.377987
1721	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:38:44.764994
1722	20072418142931314	11%	30.37MB/362.63MB : 8.38%	2024-07-28 17:38:50.630237
1723	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:39:08.585736
1724	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:39:09.357886
1725	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:39:15.359366
1726	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:39:16.475376
1727	20072418145628243	7%	30.37MB/362.63MB : 8.37%	2024-07-28 17:39:22.335902
1728	28062414365385132	3%	30.61MB/362.63MB : 8.44%	2024-07-28 17:39:22.737957
1729	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 17:39:28.550975
1730	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:39:28.782408
1731	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 17:39:34.759431
1732	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 17:39:35.050268
1733	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:39:50.752877
1734	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:39:57.879884
1735	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:40:03.884613
1736	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:40:10.09024
1737	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:40:10.554217
1738	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:40:16.371773
1739	28072417303662518	8%	30.33MB/362.63MB : 8.36%	2024-07-28 17:40:16.603818
1740	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:40:23.588619
1741	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:40:29.806093
1742	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 17:40:35.998591
1743	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:40:52.012317
1744	28072417303662518	10%	30.33MB/362.63MB : 8.36%	2024-07-28 17:40:58.012474
1745	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:41:39.889551
1746	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:41:40.692454
1747	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 17:41:45.920686
1748	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:41:47.839745
1749	28062414365385132	3%	30.61MB/362.63MB : 8.44%	2024-07-28 17:41:52.136167
1750	28072417303662518	11%	30.32MB/362.63MB : 8.36%	2024-07-28 17:41:53.87067
1751	20072418145628243	9%	30.34MB/362.63MB : 8.37%	2024-07-28 17:41:58.85086
1752	28062414365385132	15%	30.61MB/362.63MB : 8.44%	2024-07-28 17:42:00.104571
1753	20072418142931314	13%	30.40MB/362.63MB : 8.38%	2024-07-28 17:42:05.01102
1754	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 17:42:06.275801
1755	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:42:36.233749
1756	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:42:40.498449
1757	28072417303662518	10%	30.37MB/362.63MB : 8.37%	2024-07-28 17:42:42.248063
1758	28072417303662518	22%	30.33MB/362.63MB : 8.37%	2024-07-28 17:42:46.488521
1759	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-28 17:42:49.105642
1760	20072418145628243	15%	30.43MB/362.63MB : 8.39%	2024-07-28 17:42:52.988575
1761	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:42:55.326149
1762	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:42:59.223333
1763	28062414365385132	7%	30.70MB/362.63MB : 8.47%	2024-07-28 17:43:01.560482
1764	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 17:43:05.460151
1765	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:43:37.119342
1766	20072418145628243	6%	30.39MB/362.63MB : 8.38%	2024-07-28 17:43:42.611605
1767	20072418145628243	6%	30.43MB/362.63MB : 8.39%	2024-07-28 17:43:44.09649
1768	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:43:48.008843
1769	28072417303662518	12%	30.32MB/362.63MB : 8.36%	2024-07-28 17:43:50.144239
1770	28072417303662518	12%	30.40MB/362.63MB : 8.38%	2024-07-28 17:43:54.043148
1771	28062414365385132	13%	30.63MB/362.63MB : 8.45%	2024-07-28 17:43:56.393345
1772	28062414365385132	8%	30.70MB/362.63MB : 8.47%	2024-07-28 17:44:00.296121
1773	20072418142931314	19%	30.35MB/362.63MB : 8.37%	2024-07-28 17:44:02.613058
1774	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-28 17:44:06.578834
1775	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:44:38.145217
1776	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:44:42.074639
1777	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:44:44.175783
1778	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 17:44:48.098738
1779	20072418145628243	7%	30.38MB/362.63MB : 8.38%	2024-07-28 17:44:51.918782
1780	20072418145628243	17%	30.43MB/362.63MB : 8.39%	2024-07-28 17:44:54.670243
1781	28062414365385132	16%	30.61MB/362.63MB : 8.44%	2024-07-28 17:44:58.167377
1782	28062414365385132	16%	30.70MB/362.63MB : 8.47%	2024-07-28 17:45:00.903528
1783	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:45:04.366179
1784	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 17:45:07.242552
1785	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:45:39.861359
1786	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:45:42.723053
1787	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 17:45:45.908661
1788	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 17:45:48.755909
1789	28062414365385132	2%	30.66MB/362.63MB : 8.45%	2024-07-28 17:45:52.174206
1790	28062414365385132	21%	30.73MB/362.63MB : 8.47%	2024-07-28 17:45:55.1915
1791	20072418145628243	11%	30.38MB/362.63MB : 8.38%	2024-07-28 17:45:59.399253
1792	20072418145628243	13%	30.43MB/362.63MB : 8.39%	2024-07-28 17:46:02.42786
1793	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:46:05.62886
1794	20072418142931314	10%	30.44MB/362.63MB : 8.39%	2024-07-28 17:46:08.632168
1795	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:46:41.110141
1796	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:46:44.110853
1797	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:46:47.168501
1798	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 17:46:50.139793
1799	28062414365385132	15%	30.61MB/362.63MB : 8.44%	2024-07-28 17:46:53.44163
1800	28062414365385132	15%	30.72MB/362.63MB : 8.47%	2024-07-28 17:46:56.411143
1801	20072418145628243	11%	30.38MB/362.63MB : 8.38%	2024-07-28 17:47:00.868418
1802	20072418145628243	11%	30.43MB/362.63MB : 8.39%	2024-07-28 17:47:03.48124
1803	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:47:07.038817
1804	20072418142931314	10%	30.44MB/362.63MB : 8.39%	2024-07-28 17:47:09.71289
1805	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:47:42.515316
1806	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:47:45.208423
1807	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 17:47:48.746924
1808	28072417303662518	13%	30.32MB/362.63MB : 8.36%	2024-07-28 17:47:51.236537
1809	20072418145628243	15%	30.41MB/362.63MB : 8.38%	2024-07-28 17:47:55.273207
1810	28062414365385132	13%	30.61MB/362.63MB : 8.44%	2024-07-28 17:47:57.45321
1811	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 17:48:01.30582
1812	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:48:05.29538
1813	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 17:48:07.554958
1814	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-28 17:48:11.508779
1815	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:48:43.041679
1816	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 17:48:47.015109
1817	28072417303662518	2%	30.34MB/362.63MB : 8.37%	2024-07-28 17:48:49.091462
1818	28072417303662518	14%	30.42MB/362.63MB : 8.39%	2024-07-28 17:48:53.049361
1819	20072418145628243	15%	30.34MB/362.63MB : 8.37%	2024-07-28 17:48:55.308803
1820	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 17:49:00.488636
1821	28062414365385132	11%	30.61MB/362.63MB : 8.44%	2024-07-28 17:49:01.556055
1822	28062414365385132	9%	30.61MB/362.63MB : 8.44%	2024-07-28 17:49:06.720001
1823	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 17:49:07.710375
1824	20072418142931314	10%	30.37MB/362.63MB : 8.38%	2024-07-28 17:49:12.968886
1825	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:49:43.192426
1826	28062414183645219	0%	338.25MB/1193.98MB : 28.33%	2024-07-28 17:49:48.447777
1827	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:49:50.564113
1828	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 17:49:54.487429
1829	28072417303662518	17%	30.43MB/362.63MB : 8.39%	2024-07-28 17:49:56.648474
1830	28062414365385132	6%	30.61MB/362.63MB : 8.44%	2024-07-28 17:50:00.715993
1831	28062414365385132	6%	30.70MB/362.63MB : 8.47%	2024-07-28 17:50:02.910831
1832	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:50:08.465365
1833	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 17:50:09.192315
1834	20072418142931314	12%	30.37MB/362.63MB : 8.38%	2024-07-28 17:50:14.712631
1835	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:50:45.314368
1836	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 17:50:50.199259
1837	28062414183645219	1%	338.32MB/1193.98MB : 28.34%	2024-07-28 17:50:50.771079
1838	28062414365385132	14%	30.70MB/362.63MB : 8.47%	2024-07-28 17:50:56.687848
1839	28062414365385132	14%	30.72MB/362.63MB : 8.47%	2024-07-28 17:50:57.074737
1840	20072418145628243	7%	30.45MB/362.63MB : 8.40%	2024-07-28 17:51:03.122966
1841	20072418145628243	7%	30.46MB/362.63MB : 8.40%	2024-07-28 17:51:03.200171
1842	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:51:09.121998
1843	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:51:09.415737
1844	20072418142931314	9%	30.36MB/362.63MB : 8.37%	2024-07-28 17:51:15.361151
1845	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:51:44.901752
1846	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:51:50.868519
1847	28062414365385132	15%	30.63MB/362.63MB : 8.45%	2024-07-28 17:51:51.224203
1848	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:51:56.920959
1849	20072418145628243	15%	30.37MB/362.63MB : 8.38%	2024-07-28 17:51:57.802753
1850	28062414365385132	7%	30.61MB/362.63MB : 8.44%	2024-07-28 17:52:03.155228
1851	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 17:52:03.836834
1852	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:52:10.121378
1853	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 17:52:10.384764
1854	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 17:52:16.683079
1855	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:52:45.618255
1856	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:52:52.173376
1857	20072418145628243	8%	30.41MB/362.63MB : 8.38%	2024-07-28 17:52:52.668898
1858	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:52:58.209132
1859	28062414365385132	12%	30.61MB/362.63MB : 8.44%	2024-07-28 17:52:58.905771
1860	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 17:53:04.950644
1861	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:53:05.445964
1862	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:53:11.124797
1863	28062414365385132	3%	30.61MB/362.63MB : 8.44%	2024-07-28 17:53:11.650128
1864	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:53:17.809909
1865	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 17:53:46.583155
1866	28072417303662518	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:53:52.642301
1867	28062414183645219	1%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:53:53.291501
1868	28062414365385132	16%	30.60MB/362.63MB : 8.44%	2024-07-28 17:53:58.982173
1869	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 17:54:00.606424
1870	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-28 17:54:06.332611
1871	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:54:06.657674
1872	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 17:54:12.569202
1873	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 17:54:12.923476
1874	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 17:54:19.183893
1875	28062414183645219	0%	338.25MB/1193.98MB : 28.33%	2024-07-28 17:54:48.045946
1876	28072417303662518	10%	30.33MB/362.63MB : 8.36%	2024-07-28 17:54:54.048342
1877	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:54:54.667968
1878	20072418145628243	12%	30.44MB/362.63MB : 8.39%	2024-07-28 17:55:00.689334
1879	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 17:55:01.046074
1880	28062414365385132	2%	30.69MB/362.63MB : 8.46%	2024-07-28 17:55:06.984686
1881	28062414365385132	2%	30.71MB/362.63MB : 8.47%	2024-07-28 17:55:07.340963
1882	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 17:55:13.232897
1883	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 17:55:13.435155
1884	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 17:55:19.695454
1885	28062414183645219	1%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:55:48.740768
1886	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 17:55:54.808592
1887	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:55:55.180003
1888	28062414365385132	7%	30.70MB/362.63MB : 8.46%	2024-07-28 17:56:01.108421
1889	28062414365385132	7%	30.71MB/362.63MB : 8.47%	2024-07-28 17:56:01.479468
1890	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:56:07.496956
1891	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 17:56:08.31711
1892	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 17:56:14.548674
1893	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:56:14.920298
1894	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:56:21.168658
1895	28062414183645219	1%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:56:50.0314
1896	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 17:56:56.316137
1897	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:56:56.641451
1898	28072417303662518	10%	30.33MB/362.63MB : 8.36%	2024-07-28 17:57:02.670701
1899	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 17:57:03.010374
1900	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 17:57:09.061381
1901	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:57:09.77324
1902	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:57:15.311754
1903	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 17:57:16.008976
1904	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 17:57:22.231004
1905	28062414183645219	1%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:57:50.808581
1906	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:57:56.86368
1907	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:57:57.743982
1908	28062414365385132	9%	30.60MB/362.63MB : 8.44%	2024-07-28 17:58:03.187108
1909	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 17:58:05.15096
1910	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 17:58:09.986491
1911	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 17:58:11.4072
1912	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:58:16.222187
1913	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 17:58:17.414577
1914	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 17:58:23.635695
1915	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:58:51.725729
1916	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 17:58:57.761243
1917	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:58:59.108629
1918	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 17:59:05.068323
1919	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 17:59:05.175674
1920	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 17:59:11.332707
1921	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 17:59:12.475722
1922	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 17:59:17.581107
1923	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 17:59:18.721125
1924	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 17:59:24.952255
1925	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 17:59:53.049312
1926	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 17:59:59.303553
1927	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:00:00.460925
1928	20072418145628243	12%	30.44MB/362.63MB : 8.39%	2024-07-28 18:00:06.400219
1929	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 18:00:06.894942
1930	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:00:12.573027
1931	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:00:13.161034
1932	28072417303662518	2%	30.39MB/362.63MB : 8.38%	2024-07-28 18:00:18.607579
1933	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 18:00:18.900087
1934	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 18:00:25.134068
1935	28072417303662518	9%	30.33MB/362.63MB : 8.36%	2024-07-28 18:00:54.747355
1936	28072417303662518	8%	30.33MB/362.63MB : 8.36%	2024-07-28 18:01:01.3048
1937	20072418145628243	10%	30.34MB/362.63MB : 8.37%	2024-07-28 18:01:02.511921
1938	28062414183645219	0%	338.25MB/1193.98MB : 28.33%	2024-07-28 18:01:06.707786
1939	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:01:07.915396
1940	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 18:01:13.978998
1941	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:01:14.148262
1942	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:01:20.241185
1943	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:01:20.520098
1944	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 18:01:26.566291
1945	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:01:56.020353
1946	28072417303662518	10%	30.39MB/362.63MB : 8.38%	2024-07-28 18:02:02.047463
1947	28072417303662518	10%	30.40MB/362.63MB : 8.38%	2024-07-28 18:02:02.712171
1948	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:02:08.156823
1949	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 18:02:09.440428
1950	28062414365385132	11%	30.65MB/362.63MB : 8.45%	2024-07-28 18:02:14.373741
1951	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 18:02:15.707413
1952	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:02:21.707249
1953	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:02:21.878158
1954	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:02:27.899588
1955	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:02:57.364885
1956	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:03:03.39589
1957	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:03:05.066019
1958	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:03:09.629234
1959	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:03:11.099445
1960	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:03:15.630075
1961	28062414365385132	3%	30.60MB/362.63MB : 8.44%	2024-07-28 18:03:17.332683
1962	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:03:23.240283
1963	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 18:03:23.565717
1964	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:03:29.441837
1965	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 18:03:59.049976
1966	28072417303662518	15%	30.39MB/362.63MB : 8.38%	2024-07-28 18:04:05.051627
1967	28072417303662518	15%	30.40MB/362.63MB : 8.38%	2024-07-28 18:04:05.577185
1968	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 18:04:10.967792
1969	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:04:11.247418
1970	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 18:04:17.189604
1971	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:04:18.505146
1972	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-28 18:04:24.231193
1973	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:04:24.788531
1974	20072418142931314	9%	30.37MB/362.63MB : 8.37%	2024-07-28 18:04:30.464992
1975	28062414365385132	14%	30.60MB/362.63MB : 8.44%	2024-07-28 18:05:01.162529
1976	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:05:05.945875
1977	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:05:06.566176
1978	20072418145628243	10%	30.44MB/362.63MB : 8.39%	2024-07-28 18:05:12.633414
1979	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 18:05:12.726365
1980	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:05:18.74587
1981	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:05:18.869837
1982	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:05:24.944223
1983	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:05:24.944223
1984	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:05:31.176642
1985	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:06:00.422554
1986	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:06:06.658251
1987	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:06:07.986859
1988	28072417303662518	5%	30.36MB/362.63MB : 8.37%	2024-07-28 18:06:12.670863
1989	28072417303662518	5%	30.42MB/362.63MB : 8.39%	2024-07-28 18:06:14.034112
1990	28062414365385132	11%	30.65MB/362.63MB : 8.45%	2024-07-28 18:06:18.886387
1991	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 18:06:20.310722
1992	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:06:26.021485
1993	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:06:26.562146
1994	20072418142931314	8%	30.37MB/362.63MB : 8.37%	2024-07-28 18:06:32.270711
1995	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:07:02.061421
1996	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:07:07.75424
1997	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:07:08.294605
1998	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:07:13.769081
1999	20072418145628243	2%	30.34MB/362.63MB : 8.37%	2024-07-28 18:07:15.007389
2000	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:07:21.08193
2001	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:07:21.729823
2002	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 18:07:27.317503
2003	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:07:27.948875
2004	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 18:07:34.125472
2005	28072417303662518	5%	30.33MB/362.63MB : 8.36%	2024-07-28 18:08:03.463888
2006	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:08:08.859196
2007	28062414183645219	0%	338.32MB/1193.98MB : 28.33%	2024-07-28 18:08:09.587487
2008	20072418145628243	11%	30.37MB/362.63MB : 8.38%	2024-07-28 18:08:15.125339
2009	20072418145628243	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:08:16.192324
2010	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:08:21.375187
2011	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:08:22.225294
2012	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:08:27.563215
2013	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:08:28.496859
2014	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 18:08:34.728082
2015	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:09:03.065524
2016	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:09:09.314402
2017	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:09:10.239589
2018	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:09:16.259906
2019	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:09:16.2912
2020	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:09:22.337064
2021	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:09:23.637571
2022	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 18:09:28.534741
2023	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:09:29.92581
2024	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 18:09:36.23792
2025	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:10:04.0256
2026	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:10:10.049127
2027	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:10:11.705447
2028	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:10:16.974573
2029	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:10:17.725195
2030	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:10:23.222123
2031	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:10:24.474817
2032	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 18:10:29.397817
2033	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:10:30.789202
2034	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:10:36.997534
2035	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:11:04.944548
2036	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:11:10.931797
2037	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:11:12.465113
2038	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:11:17.15523
2039	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:11:20.329365
2040	20072418145628243	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:11:24.072871
2041	28062414365385132	3%	30.60MB/362.63MB : 8.44%	2024-07-28 18:11:26.563708
2042	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:11:30.242542
2043	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:11:32.549566
2044	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 18:11:38.817366
2045	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:12:05.72076
2046	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:12:11.755902
2047	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:12:14.324781
2048	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:12:18.54559
2049	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:12:20.322122
2050	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:12:24.763463
2051	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:12:27.703669
2052	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:12:31.032056
2053	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:12:33.925004
2054	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:12:40.19399
2055	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:13:06.545681
2056	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:13:12.598863
2057	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:13:15.686072
2058	28062414365385132	8%	30.61MB/362.63MB : 8.44%	2024-07-28 18:13:18.913252
2059	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:13:21.75996
2060	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:13:26.885837
2061	28062414365385132	4%	30.61MB/362.63MB : 8.44%	2024-07-28 18:13:27.95287
2062	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:13:33.123914
2063	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:13:35.044189
2064	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:13:41.293815
2065	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:14:08.625946
2066	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:14:14.682382
2067	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:14:16.777334
2068	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:14:21.970592
2069	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:14:22.822604
2070	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:14:28.189449
2071	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:14:29.707746
2072	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 18:14:34.363075
2073	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:14:35.923079
2074	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:14:42.093533
2075	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:15:09.838385
2076	28072417303662518	8%	30.33MB/362.63MB : 8.36%	2024-07-28 18:15:15.922978
2077	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:15:17.576659
2078	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:15:22.168179
2079	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:15:23.579208
2080	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:15:29.752866
2081	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:15:29.799376
2082	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:15:35.983891
2083	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:15:36.936834
2084	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:15:43.184848
2085	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:16:11.471957
2086	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:16:17.505192
2087	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:16:18.664777
2088	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:16:23.759014
2089	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:16:24.687756
2090	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:16:30.831521
2091	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:16:30.939079
2092	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:16:36.991549
2093	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:16:38.137155
2094	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 18:16:44.406705
2095	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:17:12.522637
2096	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:17:19.930293
2097	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:17:20.41398
2098	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:17:26.433089
2099	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:17:27.2228
2100	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:17:32.615989
2101	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:17:33.280012
2102	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 18:17:38.818341
2103	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:17:39.500263
2104	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:17:45.750831
2105	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:18:14.307471
2106	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:18:21.213213
2107	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:18:21.616566
2108	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:18:27.651853
2109	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 18:18:28.393694
2110	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:18:33.886645
2111	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 18:18:34.504239
2112	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:18:40.20045
2113	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:18:40.756298
2114	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 18:18:46.972409
2115	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:19:15.697987
2116	28072417303662518	11%	30.32MB/362.63MB : 8.36%	2024-07-28 18:19:21.747499
2117	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:19:22.490987
2118	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:19:28.524437
2119	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:19:28.694964
2120	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:19:34.893502
2121	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:19:35.900171
2122	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:19:41.096505
2123	28062414365385132	3%	30.60MB/362.63MB : 8.44%	2024-07-28 18:19:42.116937
2124	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:19:48.348865
2125	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:20:16.656209
2126	28072417303662518	5%	30.33MB/362.63MB : 8.36%	2024-07-28 18:20:22.692138
2127	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:20:23.868751
2128	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:20:28.883142
2129	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 18:20:29.905116
2130	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:20:36.172308
2131	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:20:36.512186
2132	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 18:20:42.744789
2133	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:20:43.81048
2134	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 18:20:50.011128
2135	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:21:18.222889
2136	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:21:24.23945
2137	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:21:25.505919
2138	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:21:31.565261
2139	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:21:32.08
2140	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:21:38.381761
2141	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:21:38.521057
2142	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:21:44.598774
2143	28062414365385132	9%	30.62MB/362.63MB : 8.44%	2024-07-28 18:21:44.784338
2144	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 18:21:51.01319
2145	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:22:20.068023
2146	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:22:26.495528
2147	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:22:27.810017
2148	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:22:33.823895
2149	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:22:33.854834
2150	28072417303662518	7%	30.32MB/362.63MB : 8.36%	2024-07-28 18:22:39.861639
2151	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:22:40.109325
2152	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:22:46.096249
2153	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 18:22:46.329416
2154	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:22:52.35107
2155	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:23:21.796474
2156	28072417303662518	9%	30.33MB/362.63MB : 8.36%	2024-07-28 18:23:27.812402
2157	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:23:27.812402
2158	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:23:33.823273
2159	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:23:35.106137
2160	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:23:41.155677
2161	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:23:41.310508
2162	28062414365385132	4%	30.60MB/362.63MB : 8.44%	2024-07-28 18:23:47.420981
2163	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:23:47.607503
2164	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 18:23:53.639658
2165	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:24:23.122079
2166	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:24:29.125879
2167	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:24:33.118068
2168	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 18:24:35.365609
2169	20072418145628243	11%	30.37MB/362.63MB : 8.38%	2024-07-28 18:24:40.367103
2170	20072418145628243	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:24:42.44245
2171	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 18:24:46.402743
2172	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:24:48.470944
2173	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 18:24:52.761854
2174	20072418142931314	8%	30.43MB/362.63MB : 8.39%	2024-07-28 18:24:54.728121
2175	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:25:28.261659
2176	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:25:30.210313
2177	20072418145628243	11%	30.37MB/362.63MB : 8.38%	2024-07-28 18:25:35.347416
2178	20072418145628243	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:25:38.055765
2179	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:25:41.56273
2180	28062414365385132	8%	30.69MB/362.63MB : 8.46%	2024-07-28 18:25:44.270961
2181	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:25:47.567873
2182	28072417303662518	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:25:50.291576
2183	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 18:25:53.805597
2184	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 18:25:56.589215
2185	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:26:29.289276
2186	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:26:32.055249
2187	20072418145628243	8%	30.37MB/362.63MB : 8.38%	2024-07-28 18:26:36.742157
2188	20072418145628243	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:26:39.201154
2189	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:26:42.818781
2190	28072417303662518	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:26:45.230152
2191	28062414365385132	10%	30.60MB/362.63MB : 8.44%	2024-07-28 18:26:49.035973
2192	28062414365385132	10%	30.69MB/362.63MB : 8.46%	2024-07-28 18:26:51.480773
2193	20072418142931314	15%	30.35MB/362.63MB : 8.37%	2024-07-28 18:26:55.315436
2194	20072418142931314	15%	30.44MB/362.63MB : 8.39%	2024-07-28 18:26:57.773388
2195	28062414183645219	0%	338.18MB/1193.98MB : 28.32%	2024-07-28 18:27:30.815021
2196	28062414183645219	0%	338.32MB/1193.98MB : 28.33%	2024-07-28 18:27:33.291122
2197	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:27:36.835274
2198	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 18:27:39.312685
2199	20072418145628243	2%	30.39MB/362.63MB : 8.38%	2024-07-28 18:27:44.154659
2200	20072418145628243	13%	30.42MB/362.63MB : 8.39%	2024-07-28 18:27:45.904837
2201	28062414365385132	6%	30.64MB/362.63MB : 8.45%	2024-07-28 18:27:50.387138
2202	28062414365385132	6%	30.69MB/362.63MB : 8.46%	2024-07-28 18:27:52.136339
2203	20072418142931314	14%	30.37MB/362.63MB : 8.37%	2024-07-28 18:27:56.608982
2204	20072418142931314	14%	30.48MB/362.63MB : 8.40%	2024-07-28 18:27:58.467167
2205	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:28:32.132882
2206	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:28:33.989817
2207	20072418145628243	2%	30.37MB/362.63MB : 8.38%	2024-07-28 18:28:39.162065
2208	20072418145628243	12%	30.42MB/362.63MB : 8.39%	2024-07-28 18:28:41.514267
2209	28072417303662518	12%	30.33MB/362.63MB : 8.36%	2024-07-28 18:28:45.196929
2210	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 18:28:47.563883
2211	28062414365385132	3%	30.64MB/362.63MB : 8.45%	2024-07-28 18:28:51.464427
2212	28062414365385132	20%	30.69MB/362.63MB : 8.46%	2024-07-28 18:28:54.016011
2213	20072418142931314	8%	30.37MB/362.63MB : 8.37%	2024-07-28 18:28:57.635803
2214	20072418142931314	8%	30.44MB/362.63MB : 8.39%	2024-07-28 18:29:00.190903
2215	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:29:33.131891
2216	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:29:35.681988
2217	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:29:39.147859
2218	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:29:41.701269
2219	20072418145628243	8%	30.37MB/362.63MB : 8.38%	2024-07-28 18:29:46.401832
2220	20072418145628243	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:29:48.592954
2221	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:29:52.645075
2222	28062414365385132	12%	30.64MB/362.63MB : 8.45%	2024-07-28 18:29:56.929294
2223	20072418142931314	8%	30.43MB/362.63MB : 8.39%	2024-07-28 18:29:58.829935
2224	20072418142931314	19%	30.35MB/362.63MB : 8.37%	2024-07-28 18:30:03.144956
2225	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:30:30.389511
2226	28062414183645219	0%	338.32MB/1193.98MB : 28.34%	2024-07-28 18:30:31.193205
2227	28072417303662518	8%	30.33MB/362.63MB : 8.36%	2024-07-28 18:30:36.496973
2228	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 18:30:38.38453
2229	20072418145628243	8%	30.34MB/362.63MB : 8.37%	2024-07-28 18:30:43.424051
2230	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:30:44.398929
2231	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 18:30:49.668828
2232	28062414365385132	11%	30.71MB/362.63MB : 8.47%	2024-07-28 18:30:50.673264
2233	20072418142931314	25%	30.48MB/362.63MB : 8.41%	2024-07-28 18:30:55.985264
2234	20072418142931314	25%	30.50MB/362.63MB : 8.41%	2024-07-28 18:30:57.065564
2235	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:31:31.646336
2236	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:31:32.63738
2237	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:31:37.894462
2238	20072418145628243	2%	30.41MB/362.63MB : 8.39%	2024-07-28 18:31:39.67242
2239	28072417303662518	3%	30.33MB/362.63MB : 8.36%	2024-07-28 18:31:43.912859
2240	28062414365385132	14%	30.60MB/362.63MB : 8.44%	2024-07-28 18:31:45.926061
2241	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:31:51.18088
2242	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:31:52.195326
2243	20072418142931314	11%	30.37MB/362.63MB : 8.38%	2024-07-28 18:31:57.380553
2244	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 18:31:58.24559
2245	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:32:33.016945
2246	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:32:34.438743
2247	28062414183645219	1%	338.29MB/1193.98MB : 28.33%	2024-07-28 18:32:39.839305
2248	20072418145628243	10%	30.35MB/362.63MB : 8.37%	2024-07-28 18:32:40.196014
2249	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:32:46.225964
2250	20072418145628243	11%	30.34MB/362.63MB : 8.37%	2024-07-28 18:32:47.030893
2251	20072418142931314	16%	30.35MB/362.63MB : 8.37%	2024-07-28 18:32:52.50995
2252	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:32:53.252085
2253	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:32:58.758202
2254	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 18:32:59.470027
2255	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:33:34.246608
2256	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:33:34.993236
2257	28072417303662518	11%	30.39MB/362.63MB : 8.38%	2024-07-28 18:33:40.296676
2258	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 18:33:41.132854
2259	28062414365385132	3%	30.71MB/362.63MB : 8.47%	2024-07-28 18:33:46.546081
2260	28062414365385132	3%	30.72MB/362.63MB : 8.47%	2024-07-28 18:33:47.36638
2261	20072418145628243	6%	30.39MB/362.63MB : 8.38%	2024-07-28 18:33:52.904948
2262	20072418145628243	6%	30.46MB/362.63MB : 8.40%	2024-07-28 18:33:54.252956
2263	20072418142931314	3%	30.48MB/362.63MB : 8.41%	2024-07-28 18:33:59.171354
2264	20072418142931314	24%	30.44MB/362.63MB : 8.40%	2024-07-28 18:34:00.500946
2265	28062414183645219	0%	338.27MB/1193.98MB : 28.33%	2024-07-28 18:34:34.662387
2266	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:34:36.005356
2267	28072417303662518	10%	30.36MB/362.63MB : 8.37%	2024-07-28 18:34:40.692638
2268	28072417303662518	10%	30.42MB/362.63MB : 8.39%	2024-07-28 18:34:42.021937
2269	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-28 18:34:47.624762
2270	20072418145628243	7%	30.43MB/362.63MB : 8.39%	2024-07-28 18:34:48.708989
2271	28062414365385132	12%	30.69MB/362.63MB : 8.46%	2024-07-28 18:34:53.91181
2272	28062414365385132	12%	30.71MB/362.63MB : 8.47%	2024-07-28 18:34:54.934069
2273	20072418142931314	25%	30.45MB/362.63MB : 8.40%	2024-07-28 18:35:00.208308
2274	20072418142931314	25%	30.46MB/362.63MB : 8.40%	2024-07-28 18:35:01.18297
2275	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:35:35.72042
2276	28062414183645219	0%	338.32MB/1193.98MB : 28.34%	2024-07-28 18:35:36.726147
2277	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 18:35:41.738362
2278	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:35:42.743104
2279	20072418145628243	3%	30.44MB/362.63MB : 8.39%	2024-07-28 18:35:48.864273
2280	20072418145628243	3%	30.45MB/362.63MB : 8.40%	2024-07-28 18:35:49.486553
2281	28062414365385132	15%	30.69MB/362.63MB : 8.46%	2024-07-28 18:35:55.075965
2282	28062414365385132	15%	30.71MB/362.63MB : 8.47%	2024-07-28 18:35:55.679418
2283	20072418142931314	26%	30.52MB/362.63MB : 8.42%	2024-07-28 18:36:01.243716
2284	20072418142931314	26%	30.45MB/362.63MB : 8.40%	2024-07-28 18:36:01.939876
2285	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 18:36:36.731014
2286	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:36:37.429347
2287	28062414365385132	2%	30.69MB/362.63MB : 8.46%	2024-07-28 18:36:42.966788
2288	28062414365385132	13%	30.71MB/362.63MB : 8.47%	2024-07-28 18:36:43.631456
2289	28072417303662518	2%	30.44MB/362.63MB : 8.39%	2024-07-28 18:36:49.040325
2290	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 18:36:49.704936
2291	20072418145628243	20%	30.46MB/362.63MB : 8.40%	2024-07-28 18:36:55.377409
2292	20072418145628243	20%	30.49MB/362.63MB : 8.41%	2024-07-28 18:36:55.810773
2293	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 18:45:01.441474
2294	28062414365385132	13%	30.61MB/362.63MB : 8.44%	2024-07-28 18:45:51.082828
2295	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:45:56.487741
2296	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:45:57.987482
2297	28072417303662518	7%	30.36MB/362.63MB : 8.37%	2024-07-28 18:46:02.505256
2298	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 18:46:04.035863
2299	20072418145628243	2%	30.39MB/362.63MB : 8.38%	2024-07-28 18:46:09.575751
2300	20072418145628243	11%	30.43MB/362.63MB : 8.39%	2024-07-28 18:46:10.969328
2301	20072418142931314	14%	30.57MB/362.63MB : 8.43%	2024-07-28 18:46:15.750085
2302	20072418142931314	14%	30.62MB/362.63MB : 8.44%	2024-07-28 18:46:17.17085
2303	28062414183645219	0%	338.17MB/1193.98MB : 28.32%	2024-07-28 18:46:47.47552
2304	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 18:46:51.247633
2305	28062414365385132	13%	30.60MB/362.63MB : 8.44%	2024-07-28 18:46:53.724038
2306	28062414365385132	13%	30.69MB/362.63MB : 8.46%	2024-07-28 18:46:57.500602
2307	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:46:59.793664
2308	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 18:47:03.524129
2309	20072418145628243	5%	30.34MB/362.63MB : 8.37%	2024-07-28 18:47:07.065693
2310	20072418145628243	8%	30.43MB/362.63MB : 8.39%	2024-07-28 18:47:10.192141
2311	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 18:47:13.318641
2312	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 18:47:16.410223
2313	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:47:48.807582
2314	28072417303662518	18%	30.32MB/362.63MB : 8.36%	2024-07-28 18:47:52.584654
2315	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 18:47:54.873909
2316	20072418145628243	12%	30.37MB/362.63MB : 8.38%	2024-07-28 18:48:00.057066
2317	20072418145628243	12%	30.43MB/362.63MB : 8.39%	2024-07-28 18:48:02.823673
2318	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-28 18:48:06.288742
2319	28062414365385132	12%	30.64MB/362.63MB : 8.45%	2024-07-28 18:48:09.088567
2320	28062414365385132	12%	30.69MB/362.63MB : 8.46%	2024-07-28 18:48:12.505011
2321	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-28 18:48:15.332323
2322	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:48:17.883579
2323	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:48:50.821243
2324	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:48:53.389736
2325	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:48:57.074087
2326	28062414365385132	12%	30.69MB/362.63MB : 8.46%	2024-07-28 18:48:59.643838
2327	20072418145628243	3%	30.37MB/362.63MB : 8.38%	2024-07-28 18:49:04.194059
2328	20072418145628243	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:49:06.748539
2329	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 18:49:10.277661
2330	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:49:12.815284
2331	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-28 18:49:16.435752
2332	20072418142931314	10%	30.45MB/362.63MB : 8.40%	2024-07-28 18:49:19.080996
2333	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:49:51.935852
2334	28072417303662518	19%	30.35MB/362.63MB : 8.37%	2024-07-28 18:49:55.247202
2335	28072417303662518	19%	30.40MB/362.63MB : 8.38%	2024-07-28 18:49:57.98202
2336	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:50:00.675012
2337	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:50:05.348352
2338	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 18:50:06.896426
2339	28062414365385132	11%	30.60MB/362.63MB : 8.44%	2024-07-28 18:50:11.615791
2340	20072418145628243	4%	30.34MB/362.63MB : 8.37%	2024-07-28 18:50:14.058957
2341	20072418142931314	7%	30.36MB/362.63MB : 8.37%	2024-07-28 18:50:17.834291
2342	20072418142931314	7%	30.45MB/362.63MB : 8.40%	2024-07-28 18:50:20.32194
2343	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:50:53.335154
2344	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 18:50:56.672007
2345	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 18:50:59.529585
2346	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:51:02.094583
2347	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:51:05.758298
2348	20072418145628243	2%	30.37MB/362.63MB : 8.38%	2024-07-28 18:51:10.01348
2349	20072418145628243	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:51:13.094734
2350	28062414365385132	7%	30.63MB/362.63MB : 8.45%	2024-07-28 18:51:16.263876
2351	20072418142931314	3%	30.36MB/362.63MB : 8.37%	2024-07-28 18:51:19.21979
2352	20072418142931314	15%	30.45MB/362.63MB : 8.40%	2024-07-28 18:51:22.487483
2353	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:51:54.709245
2354	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:51:57.958626
2355	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:52:00.744897
2356	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 18:52:03.996392
2357	20072418145628243	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:52:08.576872
2358	28062414365385132	5%	30.60MB/362.63MB : 8.44%	2024-07-28 18:52:10.185072
2359	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:52:14.829214
2360	20072418145628243	7%	30.34MB/362.63MB : 8.37%	2024-07-28 18:52:17.487561
2361	20072418142931314	10%	30.36MB/362.63MB : 8.37%	2024-07-28 18:52:20.985133
2362	20072418142931314	10%	30.45MB/362.63MB : 8.40%	2024-07-28 18:52:23.786913
2363	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:52:56.503083
2364	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:52:59.354143
2365	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:53:02.529861
2366	28072417303662518	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:53:05.394028
2367	28062414365385132	8%	30.60MB/362.63MB : 8.44%	2024-07-28 18:53:08.783551
2368	28062414365385132	8%	30.69MB/362.63MB : 8.46%	2024-07-28 18:53:11.662865
2369	20072418145628243	8%	30.37MB/362.63MB : 8.38%	2024-07-28 18:53:16.078591
2370	20072418145628243	8%	30.42MB/362.63MB : 8.39%	2024-07-28 18:53:19.221019
2371	20072418142931314	8%	30.36MB/362.63MB : 8.37%	2024-07-28 18:53:22.272354
2372	20072418142931314	10%	30.46MB/362.63MB : 8.40%	2024-07-28 18:53:25.418379
2373	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:53:57.758448
2374	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:54:00.947157
2375	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:54:03.890031
2376	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 18:54:07.029382
2377	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:54:10.145021
2378	28062414365385132	9%	30.69MB/362.63MB : 8.46%	2024-07-28 18:54:13.272169
2379	20072418145628243	6%	30.37MB/362.63MB : 8.38%	2024-07-28 18:54:17.856366
2380	20072418145628243	9%	30.42MB/362.63MB : 8.39%	2024-07-28 18:54:20.101652
2381	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:54:24.160023
2382	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 18:54:26.345296
2383	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:54:59.655141
2384	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:55:01.855495
2385	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:55:05.883871
2386	28062414365385132	9%	30.69MB/362.63MB : 8.46%	2024-07-28 18:55:08.116658
2387	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:55:11.894281
2388	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 18:55:14.128721
2389	20072418145628243	2%	30.37MB/362.63MB : 8.38%	2024-07-28 18:55:19.312266
2390	20072418145628243	12%	30.42MB/362.63MB : 8.39%	2024-07-28 18:55:21.882345
2391	20072418142931314	15%	30.35MB/362.63MB : 8.37%	2024-07-28 18:55:25.546308
2392	20072418142931314	15%	30.44MB/362.63MB : 8.39%	2024-07-28 18:55:28.11959
2393	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:56:01.054603
2394	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:56:03.606446
2395	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 18:56:07.092848
2396	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 18:56:09.663594
2397	20072418145628243	2%	30.39MB/362.63MB : 8.38%	2024-07-28 18:56:14.539982
2398	20072418145628243	14%	30.43MB/362.63MB : 8.39%	2024-07-28 18:56:16.289141
2399	28062414365385132	7%	30.64MB/362.63MB : 8.45%	2024-07-28 18:56:20.807366
2400	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 18:56:22.513525
2401	20072418142931314	10%	30.39MB/362.63MB : 8.38%	2024-07-28 18:56:27.06975
2402	20072418142931314	10%	30.44MB/362.63MB : 8.39%	2024-07-28 18:56:28.775529
2403	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:57:02.574571
2404	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:57:04.295797
2405	28072417303662518	3%	30.34MB/362.63MB : 8.37%	2024-07-28 18:57:08.608441
2406	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 18:57:10.328503
2407	28062414365385132	7%	30.64MB/362.63MB : 8.45%	2024-07-28 18:57:14.837758
2408	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 18:57:17.114981
2409	20072418145628243	6%	30.37MB/362.63MB : 8.38%	2024-07-28 18:57:22.272485
2410	20072418145628243	6%	30.42MB/362.63MB : 8.39%	2024-07-28 18:57:24.859411
2411	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 18:57:28.501721
2412	20072418142931314	11%	30.44MB/362.63MB : 8.39%	2024-07-28 18:57:31.100724
2413	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:58:03.996186
2414	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:58:06.614758
2415	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 18:58:10.009083
2416	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 18:58:12.643532
2417	28062414365385132	6%	30.60MB/362.63MB : 8.44%	2024-07-28 18:58:16.240524
2418	28062414365385132	9%	30.69MB/362.63MB : 8.46%	2024-07-28 18:58:18.901269
2419	20072418145628243	5%	30.37MB/362.63MB : 8.38%	2024-07-28 18:58:23.533152
2420	20072418145628243	10%	30.42MB/362.63MB : 8.39%	2024-07-28 18:58:26.137507
2421	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 18:58:29.782139
2422	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 18:58:32.394104
2423	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 18:59:05.92793
2424	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 18:59:08.545746
2425	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 18:59:11.349138
2426	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 18:59:13.968989
2427	20072418145628243	4%	30.37MB/362.63MB : 8.38%	2024-07-28 18:59:18.549655
2428	20072418145628243	12%	30.43MB/362.63MB : 8.39%	2024-07-28 18:59:21.12214
2429	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 18:59:24.778696
2430	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 18:59:27.367622
2431	20072418142931314	14%	30.35MB/362.63MB : 8.37%	2024-07-28 18:59:31.103414
2432	20072418142931314	14%	30.44MB/362.63MB : 8.39%	2024-07-28 18:59:33.566222
2433	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:00:06.610206
2434	28062414183645219	1%	338.36MB/1193.98MB : 28.34%	2024-07-28 19:00:09.074092
2435	20072418145628243	3%	30.37MB/362.63MB : 8.38%	2024-07-28 19:00:13.715619
2436	20072418145628243	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:00:15.789676
2437	28062414365385132	7%	30.62MB/362.63MB : 8.44%	2024-07-28 19:00:19.916236
2438	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 19:00:22.022983
2439	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 19:00:25.973638
2440	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 19:00:28.080476
2441	20072418142931314	8%	30.37MB/362.63MB : 8.37%	2024-07-28 19:00:32.27247
2442	20072418142931314	8%	30.44MB/362.63MB : 8.39%	2024-07-28 19:00:34.334245
2443	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:01:07.778199
2444	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:01:09.823833
2445	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 19:01:13.791249
2446	28072417303662518	10%	30.42MB/362.63MB : 8.39%	2024-07-28 19:01:15.882088
2447	28062414365385132	5%	30.64MB/362.63MB : 8.45%	2024-07-28 19:01:20.029165
2448	28062414365385132	5%	30.69MB/362.63MB : 8.46%	2024-07-28 19:01:22.118637
2449	20072418145628243	7%	30.39MB/362.63MB : 8.38%	2024-07-28 19:01:27.290665
2450	20072418145628243	7%	30.42MB/362.63MB : 8.39%	2024-07-28 19:01:28.656484
2451	20072418142931314	4%	30.39MB/362.63MB : 8.38%	2024-07-28 19:01:33.579002
2452	20072418142931314	4%	30.44MB/362.63MB : 8.40%	2024-07-28 19:01:35.033449
2453	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:02:09.055249
2454	28062414183645219	1%	338.36MB/1193.98MB : 28.34%	2024-07-28 19:02:10.555547
2455	20072418145628243	10%	30.37MB/362.63MB : 8.38%	2024-07-28 19:02:15.764536
2456	20072418145628243	10%	30.42MB/362.63MB : 8.39%	2024-07-28 19:02:18.122472
2457	28072417303662518	8%	30.33MB/362.63MB : 8.36%	2024-07-28 19:02:21.827003
2458	28072417303662518	8%	30.42MB/362.63MB : 8.39%	2024-07-28 19:02:24.163838
2459	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 19:02:28.052099
2460	28062414365385132	14%	30.69MB/362.63MB : 8.46%	2024-07-28 19:02:30.37896
2461	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:02:34.264561
2462	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 19:02:36.586934
2463	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:03:09.736753
2464	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:03:12.123264
2465	28072417303662518	12%	30.33MB/362.63MB : 8.36%	2024-07-28 19:03:15.806126
2466	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:03:18.192447
2467	20072418145628243	3%	30.39MB/362.63MB : 8.38%	2024-07-28 19:03:23.397799
2468	20072418145628243	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:03:25.149503
2469	28062414365385132	11%	30.62MB/362.63MB : 8.44%	2024-07-28 19:03:29.605673
2470	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 19:03:31.373922
2471	20072418142931314	14%	30.37MB/362.63MB : 8.37%	2024-07-28 19:03:35.887701
2472	20072418142931314	14%	30.44MB/362.63MB : 8.39%	2024-07-28 19:03:37.673329
2473	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:04:11.434533
2474	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:04:13.173128
2475	28072417303662518	7%	30.36MB/362.63MB : 8.37%	2024-07-28 19:04:17.474614
2476	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 19:04:19.238387
2477	20072418145628243	13%	30.44MB/362.63MB : 8.39%	2024-07-28 19:04:25.052386
2478	20072418145628243	13%	30.45MB/362.63MB : 8.40%	2024-07-28 19:04:25.608149
2479	28062414365385132	6%	30.69MB/362.63MB : 8.46%	2024-07-28 19:04:31.316929
2480	28062414365385132	6%	30.71MB/362.63MB : 8.47%	2024-07-28 19:04:31.842461
2481	20072418142931314	14%	30.45MB/362.63MB : 8.40%	2024-07-28 19:04:37.539772
2482	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-28 19:04:38.067037
2483	28062414183645219	0%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:05:13.041324
2484	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:05:13.569126
2485	20072418145628243	3%	30.44MB/362.63MB : 8.39%	2024-07-28 19:05:19.602978
2486	20072418145628243	12%	30.45MB/362.63MB : 8.40%	2024-07-28 19:05:20.129555
2487	28062414365385132	10%	30.69MB/362.63MB : 8.46%	2024-07-28 19:05:25.844936
2488	28062414365385132	10%	30.71MB/362.63MB : 8.47%	2024-07-28 19:05:26.370328
2489	28072417303662518	10%	30.39MB/362.63MB : 8.38%	2024-07-28 19:05:31.90092
2490	28072417303662518	10%	30.40MB/362.63MB : 8.38%	2024-07-28 19:05:32.396689
2491	20072418142931314	9%	30.45MB/362.63MB : 8.40%	2024-07-28 19:05:38.176126
2492	20072418142931314	9%	30.47MB/362.63MB : 8.40%	2024-07-28 19:05:38.687334
2493	28062414183645219	1%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:06:13.6711
2494	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:06:14.198364
2495	28072417303662518	2%	30.39MB/362.63MB : 8.38%	2024-07-28 19:06:19.746915
2496	28072417303662518	13%	30.40MB/362.63MB : 8.38%	2024-07-28 19:06:20.227773
2497	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 19:06:26.031081
2498	28062414365385132	7%	30.71MB/362.63MB : 8.47%	2024-07-28 19:06:26.510084
2499	20072418145628243	10%	30.44MB/362.63MB : 8.39%	2024-07-28 19:06:32.46909
2500	20072418145628243	10%	30.45MB/362.63MB : 8.40%	2024-07-28 19:06:33.165828
2501	20072418142931314	3%	30.43MB/362.63MB : 8.39%	2024-07-28 19:06:38.69246
2502	20072418142931314	3%	30.44MB/362.63MB : 8.40%	2024-07-28 19:06:39.435311
2503	28062414183645219	0%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:07:14.190841
2504	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:07:14.949607
2505	20072418145628243	10%	30.39MB/362.63MB : 8.38%	2024-07-28 19:07:20.490567
2506	20072418145628243	10%	30.43MB/362.63MB : 8.39%	2024-07-28 19:07:21.975923
2507	28062414365385132	3%	30.64MB/362.63MB : 8.45%	2024-07-28 19:07:26.716565
2508	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 19:07:28.232097
2509	28072417303662518	6%	30.36MB/362.63MB : 8.37%	2024-07-28 19:07:32.755994
2510	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 19:07:34.226523
2511	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-28 19:07:39.024997
2512	20072418142931314	15%	30.44MB/362.63MB : 8.40%	2024-07-28 19:07:40.510001
2513	20072418145628243	9%	30.38MB/362.63MB : 8.38%	2024-07-28 19:08:15.74769
2514	20072418145628243	9%	30.43MB/362.63MB : 8.39%	2024-07-28 19:08:18.426872
2515	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:08:21.150374
2516	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:08:23.827549
2517	28062414365385132	2%	30.60MB/362.63MB : 8.44%	2024-07-28 19:08:27.404227
2518	28062414365385132	11%	30.69MB/362.63MB : 8.46%	2024-07-28 19:08:30.080999
2519	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 19:08:33.454551
2520	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 19:08:36.113965
2521	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:08:39.675353
2522	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 19:08:42.338597
2523	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:09:15.164868
2524	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:09:17.811422
2525	20072418145628243	5%	30.37MB/362.63MB : 8.38%	2024-07-28 19:09:22.487958
2526	20072418145628243	5%	30.43MB/362.63MB : 8.39%	2024-07-28 19:09:25.149893
2527	28072417303662518	4%	30.33MB/362.63MB : 8.36%	2024-07-28 19:09:28.506507
2528	28072417303662518	9%	30.42MB/362.63MB : 8.39%	2024-07-28 19:09:31.167642
2529	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 19:09:34.729062
2530	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 19:09:37.407469
2531	20072418142931314	13%	30.35MB/362.63MB : 8.37%	2024-07-28 19:09:41.015329
2532	20072418142931314	13%	30.44MB/362.63MB : 8.39%	2024-07-28 19:09:43.647393
2533	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-28 19:10:18.214568
2534	20072418145628243	9%	30.42MB/362.63MB : 8.39%	2024-07-28 19:10:21.046829
2535	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:10:23.612202
2536	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:10:26.441742
2537	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 19:10:29.64147
2538	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:10:32.484254
2539	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 19:10:35.902829
2540	28062414365385132	9%	30.69MB/362.63MB : 8.46%	2024-07-28 19:10:38.702691
2541	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:10:42.062593
2542	20072418142931314	9%	30.44MB/362.63MB : 8.39%	2024-07-28 19:10:44.924528
2543	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:11:17.549828
2544	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:11:20.410483
2545	28062414365385132	7%	30.60MB/362.63MB : 8.44%	2024-07-28 19:11:23.816284
2546	28062414365385132	7%	30.69MB/362.63MB : 8.46%	2024-07-28 19:11:26.636559
2547	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 19:11:29.88786
2548	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 19:11:32.640483
2549	20072418145628243	7%	30.37MB/362.63MB : 8.38%	2024-07-28 19:11:37.213202
2550	20072418145628243	7%	30.42MB/362.63MB : 8.39%	2024-07-28 19:11:39.26756
2551	20072418142931314	6%	30.37MB/362.63MB : 8.37%	2024-07-28 19:11:43.457431
2552	20072418142931314	10%	30.44MB/362.63MB : 8.39%	2024-07-28 19:11:45.527091
2553	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:12:18.971084
2554	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:12:21.058552
2555	28062414365385132	5%	30.64MB/362.63MB : 8.45%	2024-07-28 19:12:25.189872
2556	28062414365385132	5%	30.69MB/362.63MB : 8.46%	2024-07-28 19:12:26.706679
2557	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 19:12:32.49252
2558	20072418145628243	6%	30.43MB/362.63MB : 8.39%	2024-07-28 19:12:33.451744
2559	28072417303662518	2%	30.40MB/362.63MB : 8.38%	2024-07-28 19:12:38.505327
2560	28072417303662518	2%	30.42MB/362.63MB : 8.39%	2024-07-28 19:12:39.446085
2561	20072418142931314	3%	30.43MB/362.63MB : 8.39%	2024-07-28 19:12:44.721281
2562	20072418142931314	17%	30.44MB/362.63MB : 8.40%	2024-07-28 19:12:45.696664
2563	28062414183645219	0%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:13:20.191745
2564	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:13:21.197173
2565	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 19:13:26.207078
2566	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 19:13:27.244287
2567	20072418145628243	4%	30.44MB/362.63MB : 8.39%	2024-07-28 19:13:33.226753
2568	20072418145628243	4%	30.45MB/362.63MB : 8.40%	2024-07-28 19:13:33.923768
2569	28062414365385132	12%	30.71MB/362.63MB : 8.47%	2024-07-28 19:13:39.430169
2570	28062414365385132	12%	30.72MB/362.63MB : 8.47%	2024-07-28 19:13:40.31095
2571	20072418142931314	15%	30.43MB/362.63MB : 8.39%	2024-07-28 19:13:45.64799
2572	20072418142931314	15%	30.44MB/362.63MB : 8.39%	2024-07-28 19:13:46.60739
2573	28062414183645219	0%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:14:21.155151
2574	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:14:22.083687
2575	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-28 19:14:27.643049
2576	20072418145628243	7%	30.41MB/362.63MB : 8.39%	2024-07-28 19:14:28.709663
2577	28062414365385132	12%	30.57MB/362.63MB : 8.43%	2024-07-28 19:14:33.859102
2578	28062414365385132	12%	30.62MB/362.63MB : 8.45%	2024-07-28 19:14:34.940957
2579	28072417303662518	11%	30.39MB/362.63MB : 8.38%	2024-07-28 19:14:39.919815
2580	28072417303662518	11%	30.41MB/362.63MB : 8.39%	2024-07-28 19:14:40.955877
2581	20072418142931314	14%	30.39MB/362.63MB : 8.38%	2024-07-28 19:14:46.136136
2582	20072418142931314	14%	30.44MB/362.63MB : 8.40%	2024-07-28 19:14:47.222078
2583	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:15:22.694799
2584	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:15:25.430517
2585	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:15:28.955195
2586	28062414365385132	7%	30.63MB/362.63MB : 8.45%	2024-07-28 19:15:31.645057
2587	28072417303662518	11%	30.35MB/362.63MB : 8.37%	2024-07-28 19:15:34.983083
2588	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 19:15:37.672713
2589	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-28 19:15:42.29561
2590	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 19:15:44.429812
2591	20072418142931314	5%	30.36MB/362.63MB : 8.37%	2024-07-28 19:15:48.516662
2592	20072418142931314	12%	30.44MB/362.63MB : 8.40%	2024-07-28 19:15:50.66823
2593	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:16:23.979498
2594	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:16:26.223262
2595	28072417303662518	10%	30.33MB/362.63MB : 8.37%	2024-07-28 19:16:30.060484
2596	28072417303662518	10%	30.42MB/362.63MB : 8.39%	2024-07-28 19:16:32.348741
2597	20072418145628243	6%	30.38MB/362.63MB : 8.38%	2024-07-28 19:16:37.484782
2598	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 19:16:39.278173
2599	28062414365385132	11%	30.56MB/362.63MB : 8.43%	2024-07-28 19:16:43.733451
2600	28062414365385132	11%	30.63MB/362.63MB : 8.45%	2024-07-28 19:16:45.515863
2601	20072418142931314	3%	30.39MB/362.63MB : 8.38%	2024-07-28 19:16:49.995462
2602	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 19:16:51.835356
2603	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:17:26.085094
2604	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:17:27.323286
2605	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:17:33.453748
2606	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:17:33.546981
2607	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:17:39.576631
2608	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:17:39.715324
2609	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:17:45.997131
2610	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:17:47.281867
2611	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:17:51.426034
2612	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 19:17:53.500177
2613	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:18:27.599793
2614	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:18:29.023439
2615	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-28 19:18:34.516424
2616	20072418145628243	13%	30.41MB/362.63MB : 8.39%	2024-07-28 19:18:35.583242
2617	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:18:40.813917
2618	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:18:41.81995
2619	28062414365385132	4%	30.55MB/362.63MB : 8.42%	2024-07-28 19:18:47.019351
2620	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:18:47.855615
2621	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:18:52.404331
2622	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:18:54.102087
2623	28062414183645219	0%	338.21MB/1193.98MB : 28.33%	2024-07-28 19:19:27.876178
2624	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:19:29.594875
2625	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-28 19:19:34.729855
2626	20072418145628243	13%	30.41MB/362.63MB : 8.39%	2024-07-28 19:19:37.282914
2627	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:19:40.975484
2628	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:19:43.328854
2629	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:19:47.021928
2630	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:19:49.590128
2631	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:19:53.273897
2632	20072418142931314	21%	30.44MB/362.63MB : 8.40%	2024-07-28 19:19:55.810841
2633	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:20:28.806881
2634	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:20:31.282881
2635	28072417303662518	2%	30.33MB/362.63MB : 8.36%	2024-07-28 19:20:34.842107
2636	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:20:37.348425
2637	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-28 19:20:42.095463
2638	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 19:20:43.76586
2639	28062414365385132	11%	30.58MB/362.63MB : 8.43%	2024-07-28 19:20:48.29835
2640	28062414365385132	11%	30.63MB/362.63MB : 8.45%	2024-07-28 19:20:50.064102
2641	20072418142931314	2%	30.39MB/362.63MB : 8.38%	2024-07-28 19:20:54.501267
2642	20072418142931314	23%	30.48MB/362.63MB : 8.41%	2024-07-28 19:20:56.420446
2643	28072417303662518	11%	30.33MB/362.63MB : 8.36%	2024-07-28 19:21:30.591866
2644	28072417303662518	11%	30.42MB/362.63MB : 8.39%	2024-07-28 19:21:32.54234
2645	20072418145628243	6%	30.36MB/362.63MB : 8.37%	2024-07-28 19:21:37.679248
2646	20072418145628243	6%	30.41MB/362.63MB : 8.39%	2024-07-28 19:21:39.473147
2647	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:21:43.077114
2648	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:21:44.88309
2649	28062414365385132	10%	30.58MB/362.63MB : 8.43%	2024-07-28 19:21:49.30639
2650	28062414365385132	10%	30.63MB/362.63MB : 8.45%	2024-07-28 19:21:51.099539
2651	20072418142931314	23%	30.37MB/362.63MB : 8.37%	2024-07-28 19:21:55.555698
2652	20072418142931314	23%	30.44MB/362.63MB : 8.39%	2024-07-28 19:21:57.44321
2653	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:22:31.02965
2654	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:22:32.946883
2655	28072417303662518	6%	30.33MB/362.63MB : 8.36%	2024-07-28 19:22:37.045106
2656	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 19:22:39.010653
2657	20072418145628243	2%	30.36MB/362.63MB : 8.37%	2024-07-28 19:22:44.116195
2658	20072418145628243	13%	30.41MB/362.63MB : 8.39%	2024-07-28 19:22:45.97059
2659	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 19:22:50.32888
2660	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-28 19:22:52.216427
2661	20072418142931314	15%	30.37MB/362.63MB : 8.37%	2024-07-28 19:22:56.561888
2662	20072418142931314	15%	30.52MB/362.63MB : 8.42%	2024-07-28 19:22:58.496706
2663	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:23:11.497465
2664	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:23:17.806022
2665	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:23:26.448067
2666	28072417303662518	10%	30.39MB/362.63MB : 8.38%	2024-07-28 19:23:32.556665
2667	28072417303662518	10%	30.40MB/362.63MB : 8.38%	2024-07-28 19:23:32.680119
2668	20072418145628243	2%	30.40MB/362.63MB : 8.38%	2024-07-28 19:23:38.817836
2669	20072418145628243	2%	30.41MB/362.63MB : 8.39%	2024-07-28 19:23:38.910739
2670	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:23:45.010321
2671	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:23:45.164711
2672	20072418142931314	11%	30.36MB/362.63MB : 8.37%	2024-07-28 19:23:51.216778
2673	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:23:51.405537
2674	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:23:56.800092
2675	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:24:08.115023
2676	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:24:14.134413
2677	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:24:21.326549
2678	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 19:24:27.554556
2679	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:24:32.303363
2680	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:24:33.757728
2681	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:24:39.146664
2682	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:24:40.966512
2683	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 19:24:45.465698
2684	28062414365385132	6%	30.63MB/362.63MB : 8.45%	2024-07-28 19:24:47.210361
2685	28072417303662518	15%	30.35MB/362.63MB : 8.37%	2024-07-28 19:24:51.665214
2686	28072417303662518	15%	30.40MB/362.63MB : 8.38%	2024-07-28 19:24:53.240304
2687	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:24:57.863731
2688	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:25:00.573418
2689	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:25:06.776442
2690	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:25:34.001705
2691	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:25:41.100477
2692	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:25:42.925592
2693	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:25:47.252448
2694	28062414183645219	0%	338.33MB/1193.98MB : 28.34%	2024-07-28 19:25:48.333512
2695	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:25:53.525349
2696	20072418145628243	12%	30.32MB/362.63MB : 8.36%	2024-07-28 19:25:55.847547
2697	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:25:58.941761
2698	28062414365385132	12%	30.54MB/362.63MB : 8.42%	2024-07-28 19:26:02.100635
2699	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 19:26:08.277047
2700	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:26:34.425665
2701	28062414365385132	5%	30.54MB/362.63MB : 8.42%	2024-07-28 19:26:40.662374
2702	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:26:43.788146
2703	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:26:46.693859
2704	28072417303662518	17%	30.50MB/362.63MB : 8.41%	2024-07-28 19:26:49.831282
2705	20072418145628243	4%	30.39MB/362.63MB : 8.38%	2024-07-28 19:26:53.375291
2706	20072418145628243	20%	30.41MB/362.63MB : 8.39%	2024-07-28 19:26:57.181807
2707	20072418142931314	3%	30.37MB/362.63MB : 8.38%	2024-07-28 19:26:59.657115
2708	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:27:03.433724
2709	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:27:09.631321
2710	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:27:35.140131
2711	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:27:41.3566
2712	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:27:45.11672
2713	28072417303662518	7%	30.33MB/362.63MB : 8.36%	2024-07-28 19:27:47.405794
2714	20072418145628243	16%	30.39MB/362.63MB : 8.38%	2024-07-28 19:27:51.738124
2715	20072418145628243	16%	30.41MB/362.63MB : 8.39%	2024-07-28 19:27:54.509058
2716	28072417303662518	15%	30.33MB/362.63MB : 8.37%	2024-07-28 19:27:57.791509
2717	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:28:00.806309
2718	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:28:04.055675
2719	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:28:10.260547
2720	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:28:37.705127
2721	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:28:43.089008
2722	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:28:46.402472
2723	28072417303662518	8%	30.44MB/362.63MB : 8.39%	2024-07-28 19:28:49.098412
2724	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:28:51.820907
2725	28062414365385132	15%	30.54MB/362.63MB : 8.42%	2024-07-28 19:28:55.348465
2726	28062414365385132	15%	30.63MB/362.63MB : 8.45%	2024-07-28 19:28:58.069226
2727	20072418142931314	18%	30.35MB/362.63MB : 8.37%	2024-07-28 19:29:01.530697
2728	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:29:05.243617
2729	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:29:11.357339
2730	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:29:37.011521
2731	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:29:44.455342
2732	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:29:47.470726
2733	28062414365385132	5%	30.54MB/362.63MB : 8.42%	2024-07-28 19:29:50.67325
2734	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:29:52.898065
2735	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:29:56.708213
2736	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:30:00.636181
2737	20072418142931314	18%	30.35MB/362.63MB : 8.37%	2024-07-28 19:30:02.941
2738	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 19:30:06.854184
2739	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:30:13.09002
2740	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:30:38.431209
2741	28062414365385132	9%	30.54MB/362.63MB : 8.42%	2024-07-28 19:30:44.72996
2742	28062414183645219	0%	338.29MB/1193.98MB : 28.33%	2024-07-28 19:30:48.5741
2743	28072417303662518	15%	30.39MB/362.63MB : 8.38%	2024-07-28 19:30:50.893128
2744	28072417303662518	15%	30.40MB/362.63MB : 8.38%	2024-07-28 19:30:54.572539
2745	20072418145628243	15%	30.32MB/362.63MB : 8.36%	2024-07-28 19:30:57.986163
2746	20072418145628243	8%	30.41MB/362.63MB : 8.39%	2024-07-28 19:31:01.511297
2747	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:31:04.233773
2748	20072418142931314	15%	30.44MB/362.63MB : 8.39%	2024-07-28 19:31:07.731003
2749	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:31:13.948503
2750	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:31:39.748591
2751	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:31:46.897718
2752	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:31:49.546423
2753	28062414365385132	14%	30.55MB/362.63MB : 8.42%	2024-07-28 19:31:53.272923
2754	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:31:55.591106
2755	28072417303662518	7%	30.42MB/362.63MB : 8.39%	2024-07-28 19:31:59.271632
2756	28062414365385132	4%	30.55MB/362.63MB : 8.42%	2024-07-28 19:32:01.827958
2757	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:32:05.558523
2758	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:32:08.779538
2759	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:32:14.953977
2760	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:32:41.060174
2761	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:32:47.081202
2762	28072417303662518	17%	30.42MB/362.63MB : 8.39%	2024-07-28 19:32:51.1481
2763	20072418145628243	4%	30.36MB/362.63MB : 8.37%	2024-07-28 19:32:53.358074
2764	20072418145628243	16%	30.33MB/362.63MB : 8.36%	2024-07-28 19:32:58.525486
2765	28062414365385132	16%	30.54MB/362.63MB : 8.42%	2024-07-28 19:32:59.577781
2766	20072418142931314	2%	30.43MB/362.63MB : 8.39%	2024-07-28 19:33:04.750775
2767	20072418142931314	16%	30.44MB/362.63MB : 8.40%	2024-07-28 19:33:05.802698
2768	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:33:10.959113
2769	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:33:16.360456
2770	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:33:41.31474
2771	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:33:47.346957
2772	28072417303662518	8%	30.31MB/362.63MB : 8.36%	2024-07-28 19:33:52.508287
2773	28062414365385132	16%	30.58MB/362.63MB : 8.43%	2024-07-28 19:33:53.605414
2774	20072418145628243	7%	30.40MB/362.63MB : 8.38%	2024-07-28 19:33:59.415364
2775	20072418145628243	13%	30.41MB/362.63MB : 8.39%	2024-07-28 19:34:00.048964
2776	20072418142931314	16%	30.43MB/362.63MB : 8.39%	2024-07-28 19:34:05.728041
2777	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 19:34:06.316923
2778	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 19:34:11.963999
2779	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:34:17.337343
2780	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:34:41.796706
2781	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:34:48.873737
2782	28072417303662518	12%	30.37MB/362.63MB : 8.37%	2024-07-28 19:34:53.526438
2783	28072417303662518	12%	30.42MB/362.63MB : 8.39%	2024-07-28 19:34:54.903746
2784	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 19:35:01.130095
2785	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:35:01.392402
2786	20072418142931314	12%	30.45MB/362.63MB : 8.40%	2024-07-28 19:35:07.439802
2787	20072418142931314	12%	30.46MB/362.63MB : 8.40%	2024-07-28 19:35:07.594492
2788	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 19:35:13.84376
2789	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:35:19.244628
2790	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:35:42.958484
2791	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 19:35:49.190571
2792	28072417303662518	12%	30.39MB/362.63MB : 8.38%	2024-07-28 19:35:55.328461
2793	28072417303662518	12%	30.40MB/362.63MB : 8.38%	2024-07-28 19:35:55.405193
2794	20072418145628243	15%	30.40MB/362.63MB : 8.38%	2024-07-28 19:36:01.516189
2795	20072418145628243	15%	30.41MB/362.63MB : 8.39%	2024-07-28 19:36:01.964666
2796	20072418142931314	13%	30.45MB/362.63MB : 8.40%	2024-07-28 19:36:07.717768
2797	20072418142931314	13%	30.47MB/362.63MB : 8.40%	2024-07-28 19:36:08.103343
2798	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:36:14.335251
2799	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:36:19.735013
2800	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:36:43.203158
2801	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 19:36:49.243517
2802	28072417303662518	15%	30.31MB/362.63MB : 8.36%	2024-07-28 19:36:55.861239
2803	20072418145628243	10%	30.32MB/362.63MB : 8.36%	2024-07-28 19:36:57.177741
2804	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:37:03.220054
2805	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 19:37:03.390728
2806	20072418142931314	2%	30.45MB/362.63MB : 8.40%	2024-07-28 19:37:09.442864
2807	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 19:37:09.581592
2808	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 19:37:15.644751
2809	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:37:21.043608
2810	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:37:45.074564
2811	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:37:52.328183
2812	28072417303662518	6%	30.38MB/362.63MB : 8.38%	2024-07-28 19:37:57.189577
2813	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 19:37:58.397447
2814	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:38:04.321714
2815	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:38:04.661097
2816	20072418142931314	16%	30.45MB/362.63MB : 8.40%	2024-07-28 19:38:10.544616
2817	20072418142931314	16%	30.47MB/362.63MB : 8.40%	2024-07-28 19:38:10.87138
2818	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 19:38:16.792564
2819	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:38:22.1889
2820	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:38:46.370924
2821	28072417303662518	14%	30.31MB/362.63MB : 8.36%	2024-07-28 19:38:52.428825
2822	28072417303662518	7%	30.31MB/362.63MB : 8.36%	2024-07-28 19:38:58.336256
2823	20072418145628243	10%	30.32MB/362.63MB : 8.36%	2024-07-28 19:38:59.326619
2824	20072418145628243	7%	30.33MB/362.63MB : 8.36%	2024-07-28 19:39:05.467369
2825	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 19:39:05.575893
2826	20072418142931314	14%	30.46MB/362.63MB : 8.40%	2024-07-28 19:39:11.746615
2827	20072418142931314	14%	30.47MB/362.63MB : 8.40%	2024-07-28 19:39:11.824368
2828	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 19:39:17.951835
2829	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:39:23.351566
2830	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:39:47.314986
2831	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:39:53.606774
2832	28072417303662518	10%	30.33MB/362.63MB : 8.37%	2024-07-28 19:39:59.525063
2833	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 19:39:59.9125
2834	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:40:05.942887
2835	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:40:07.397786
2836	20072418142931314	14%	30.39MB/362.63MB : 8.38%	2024-07-28 19:40:12.209789
2837	20072418142931314	14%	30.44MB/362.63MB : 8.39%	2024-07-28 19:40:13.598638
2838	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:40:19.818058
2839	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:40:25.238965
2840	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:40:47.671582
2841	28072417303662518	11%	30.33MB/362.63MB : 8.37%	2024-07-28 19:40:53.718721
2842	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 19:40:59.962763
2843	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:41:00.737
2844	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:41:06.805093
2845	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:41:07.269375
2846	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:41:13.012063
2847	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 19:41:13.507717
2848	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:41:19.69887
2849	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:41:25.869688
2850	28072417303662518	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:41:49.654343
2851	20072418145628243	13%	30.32MB/362.63MB : 8.36%	2024-07-28 19:41:57.70412
2852	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:42:02.11444
2853	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:42:03.959164
2854	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:42:09.377527
2855	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 19:42:10.16781
2856	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:42:15.564845
2857	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:42:15.580345
2858	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 19:42:21.844752
2859	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:42:27.231042
2860	28072417303662518	14%	30.31MB/362.63MB : 8.36%	2024-07-28 19:42:51.682066
2861	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:42:58.848613
2862	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 19:43:03.654632
2863	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 19:43:05.35398
2864	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:43:09.716418
2865	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 19:43:11.635558
2866	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:43:15.122415
2867	28062414183645219	0%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:43:17.027158
2868	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:43:22.866082
2869	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:43:29.137275
2870	20072418145628243	4%	30.36MB/362.63MB : 8.37%	2024-07-28 19:43:53.362808
2871	20072418142931314	12%	30.35MB/362.63MB : 8.37%	2024-07-28 19:43:59.538764
2872	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:44:04.627513
2873	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:44:05.78776
2874	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:44:10.633122
2875	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:44:11.189716
2876	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:44:16.851357
2877	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:44:17.254588
2878	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:44:24.091815
2879	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:44:30.312963
2880	28072417303662518	3%	30.36MB/362.63MB : 8.37%	2024-07-28 19:44:53.541647
2881	20072418145628243	11%	30.33MB/362.63MB : 8.36%	2024-07-28 19:45:00.692162
2882	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:45:05.807667
2883	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:45:06.907296
2884	28062414365385132	2%	30.58MB/362.63MB : 8.43%	2024-07-28 19:45:12.016131
2885	28062414365385132	11%	30.63MB/362.63MB : 8.45%	2024-07-28 19:45:13.131015
2886	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 19:45:18.032561
2887	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:45:18.526299
2888	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:45:25.032155
2889	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:45:31.312657
2890	28072417303662518	10%	30.33MB/362.63MB : 8.37%	2024-07-28 19:45:54.643051
2891	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:46:01.9456
2892	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:46:06.839631
2893	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:46:08.185368
2894	28062414365385132	11%	30.59MB/362.63MB : 8.44%	2024-07-28 19:46:13.071703
2895	28062414365385132	11%	30.63MB/362.63MB : 8.45%	2024-07-28 19:46:14.464504
2896	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:46:19.135956
2897	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:46:19.862764
2898	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:46:26.857181
2899	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:46:33.046558
2900	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:46:56.003305
2901	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:47:03.478004
2902	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:47:09.204999
2903	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:47:09.638188
2904	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 19:47:15.847708
2905	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:47:16.822988
2906	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:47:21.232893
2907	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:47:23.105244
2908	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 19:47:29.385915
2909	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:47:34.799399
2910	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:47:57.398476
2911	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:48:04.492096
2912	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:48:10.668586
2913	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:48:10.915291
2914	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 19:48:16.916225
2915	20072418145628243	4%	30.32MB/362.63MB : 8.36%	2024-07-28 19:48:18.804526
2916	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:48:22.317324
2917	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:48:25.019283
2918	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:48:31.213272
2919	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:48:36.653492
2920	28062414365385132	17%	30.54MB/362.63MB : 8.42%	2024-07-28 19:48:58.714986
2921	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:49:04.081362
2922	28072417303662518	10%	30.34MB/362.63MB : 8.37%	2024-07-28 19:49:10.072192
2923	28072417303662518	10%	30.42MB/362.63MB : 8.39%	2024-07-28 19:49:12.81343
2924	20072418145628243	7%	30.36MB/362.63MB : 8.37%	2024-07-28 19:49:17.809016
2925	20072418145628243	9%	30.41MB/362.63MB : 8.39%	2024-07-28 19:49:20.57686
2926	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:49:23.961754
2927	20072418142931314	17%	30.44MB/362.63MB : 8.39%	2024-07-28 19:49:26.792318
2928	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:49:33.023512
2929	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:49:38.423435
2930	28062414183645219	1%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:49:59.50759
2931	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:50:07.090033
2932	28072417303662518	3%	30.37MB/362.63MB : 8.37%	2024-07-28 19:50:13.12641
2933	28072417303662518	3%	30.42MB/362.63MB : 8.39%	2024-07-28 19:50:14.517288
2934	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:50:19.344364
2935	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:50:21.850927
2936	20072418142931314	14%	30.35MB/362.63MB : 8.37%	2024-07-28 19:50:25.548981
2937	20072418142931314	14%	30.44MB/362.63MB : 8.39%	2024-07-28 19:50:28.02671
2938	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:50:34.253529
2939	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:50:39.64559
2940	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:51:01.647426
2941	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:51:07.043309
2942	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:51:14.463433
2943	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:51:15.129635
2944	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:51:20.695867
2945	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:51:21.174626
2946	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:51:26.97689
2947	28062414365385132	4%	30.54MB/362.63MB : 8.42%	2024-07-28 19:51:27.409641
2948	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:51:34.497932
2949	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:51:40.790271
2950	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:52:02.479471
2951	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:52:10.19991
2952	28072417303662518	11%	30.40MB/362.63MB : 8.38%	2024-07-28 19:52:16.25067
2953	28072417303662518	11%	30.41MB/362.63MB : 8.39%	2024-07-28 19:52:17.133772
2954	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 19:52:22.485375
2955	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 19:52:24.482553
2956	20072418142931314	3%	30.37MB/362.63MB : 8.37%	2024-07-28 19:52:28.7503
2957	20072418142931314	18%	30.44MB/362.63MB : 8.39%	2024-07-28 19:52:30.702185
2958	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 19:52:36.983467
2959	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:52:42.382953
2960	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:53:04.260254
2961	20072418145628243	5%	30.32MB/362.63MB : 8.36%	2024-07-28 19:53:12.040027
2962	28072417303662518	3%	30.39MB/362.63MB : 8.38%	2024-07-28 19:53:18.071055
2963	28072417303662518	3%	30.40MB/362.63MB : 8.38%	2024-07-28 19:53:18.534724
2964	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:53:24.308864
2965	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:53:25.732636
2966	20072418142931314	16%	30.39MB/362.63MB : 8.38%	2024-07-28 19:53:30.496721
2967	20072418142931314	16%	30.44MB/362.63MB : 8.39%	2024-07-28 19:53:31.950434
2968	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:53:38.196484
2969	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:53:43.587625
2970	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:54:06.615271
2971	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:54:13.913142
2972	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 19:54:19.715687
2973	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:54:20.180841
2974	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:54:25.116234
2975	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 19:54:26.415023
2976	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:54:31.818465
2977	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 19:54:32.266869
2978	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:54:38.497857
2979	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 19:54:44.668365
2980	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:55:07.360166
2981	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:55:13.371648
2982	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 19:55:19.59083
2983	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:55:20.163341
2984	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:55:26.228335
2985	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:55:26.739829
2986	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 19:55:32.989529
2987	20072418145628243	6%	30.33MB/362.63MB : 8.36%	2024-07-28 19:55:33.422392
2988	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:55:39.660401
2989	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 19:55:45.846002
2990	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:56:08.51104
2991	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:56:14.532722
2992	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 19:56:21.124258
2993	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:56:21.357542
2994	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:56:27.365662
2995	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:56:28.957917
2996	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 19:56:33.599236
2997	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:56:35.023721
2998	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 19:56:41.258348
2999	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 19:56:47.518513
3000	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:57:09.702694
3001	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:57:17.045884
3002	20072418142931314	8%	30.43MB/362.63MB : 8.39%	2024-07-28 19:57:23.265194
3003	20072418142931314	8%	30.44MB/362.63MB : 8.39%	2024-07-28 19:57:23.821232
3004	28062414365385132	11%	30.62MB/362.63MB : 8.44%	2024-07-28 19:57:29.500048
3005	28062414365385132	11%	30.63MB/362.63MB : 8.45%	2024-07-28 19:57:30.026144
3006	28062414183645219	1%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:57:34.915487
3007	28062414183645219	1%	338.35MB/1193.98MB : 28.34%	2024-07-28 19:57:35.42604
3008	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:57:41.478704
3009	20072418145628243	5%	30.32MB/362.63MB : 8.36%	2024-07-28 19:57:48.161185
3010	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 19:58:11.044556
3011	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 19:58:17.880688
3012	20072418142931314	2%	30.46MB/362.63MB : 8.40%	2024-07-28 19:58:24.119629
3013	20072418142931314	2%	30.47MB/362.63MB : 8.40%	2024-07-28 19:58:24.42854
3014	28062414365385132	9%	30.62MB/362.63MB : 8.44%	2024-07-28 19:58:30.392508
3015	28062414365385132	9%	30.63MB/362.63MB : 8.45%	2024-07-28 19:58:30.670899
3016	28062414183645219	0%	338.34MB/1193.98MB : 28.34%	2024-07-28 19:58:35.792598
3017	28062414183645219	0%	338.36MB/1193.98MB : 28.34%	2024-07-28 19:58:36.08705
3018	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 19:58:42.102994
3019	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 19:58:48.925145
3020	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:59:11.271723
3021	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:59:17.511514
3022	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 19:59:23.532134
3023	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 19:59:24.4615
3024	20072418145628243	11%	30.43MB/362.63MB : 8.39%	2024-07-28 19:59:30.437185
3025	20072418145628243	11%	30.44MB/362.63MB : 8.39%	2024-07-28 19:59:30.499183
3026	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 19:59:36.566688
3027	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 19:59:36.690657
3028	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 19:59:42.84802
3029	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 19:59:49.118709
3030	28072417303662518	5%	30.33MB/362.63MB : 8.37%	2024-07-28 20:00:12.887938
3031	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:00:18.271884
3032	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:00:24.513108
3033	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:00:24.652593
3034	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:00:30.643225
3035	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:00:31.664632
3036	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 20:00:37.887632
3037	20072418145628243	4%	30.33MB/362.63MB : 8.36%	2024-07-28 20:00:38.382158
3038	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:00:44.650726
3039	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:00:50.919223
3040	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:01:15.633626
3041	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:01:21.681017
3042	28062414183645219	1%	338.34MB/1193.98MB : 28.34%	2024-07-28 20:01:26.403047
3043	28062414183645219	1%	338.36MB/1193.98MB : 28.34%	2024-07-28 20:01:27.084282
3044	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:01:32.423564
3045	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:01:33.304277
3046	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:01:38.626358
3047	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:01:39.556346
3048	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:01:45.888753
3049	20072418142931314	11%	30.37MB/362.63MB : 8.37%	2024-07-28 20:01:52.171031
3050	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:02:15.650992
3051	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:02:21.041171
3052	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:02:27.652051
3053	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:02:28.131077
3054	28062414365385132	8%	30.55MB/362.63MB : 8.42%	2024-07-28 20:02:34.402117
3055	20072418145628243	8%	30.33MB/362.63MB : 8.36%	2024-07-28 20:02:34.959468
3056	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 20:02:40.654404
3057	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:02:41.011297
3058	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 20:02:47.216352
3059	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:02:53.435548
3060	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:03:16.953682
3061	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:03:22.352944
3062	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 20:03:28.376453
3063	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:03:28.919036
3064	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 20:03:34.989792
3065	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:03:35.638332
3066	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:03:41.909546
3067	20072418145628243	8%	30.33MB/362.63MB : 8.36%	2024-07-28 20:03:42.373265
3068	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:03:48.6268
3069	20072418142931314	3%	30.36MB/362.63MB : 8.37%	2024-07-28 20:03:54.789095
3070	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:04:17.392865
3071	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:04:24.234619
3072	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:04:30.292115
3073	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:04:30.292115
3074	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-28 20:04:36.519229
3075	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:04:38.240651
3076	20072418142931314	7%	30.35MB/362.63MB : 8.37%	2024-07-28 20:04:42.763421
3077	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:04:44.263289
3078	28062414365385132	14%	30.55MB/362.63MB : 8.42%	2024-07-28 20:04:50.812796
3079	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 20:04:56.990891
3080	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:05:18.234463
3081	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:05:25.260813
3082	28062414365385132	3%	30.54MB/362.63MB : 8.42%	2024-07-28 20:05:31.456617
3083	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:05:32.46444
3084	28072417303662518	6%	30.41MB/362.63MB : 8.39%	2024-07-28 20:05:37.460986
3085	28072417303662518	6%	30.42MB/362.63MB : 8.39%	2024-07-28 20:05:38.468532
3086	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 20:05:43.683404
3087	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:05:44.672756
3088	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:05:51.96121
3089	20072418142931314	8%	30.39MB/362.63MB : 8.38%	2024-07-28 20:05:58.168692
3090	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:06:19.778983
3091	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:06:25.181082
3092	28062414365385132	5%	30.54MB/362.63MB : 8.42%	2024-07-28 20:06:31.388278
3093	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:06:33.646635
3094	20072418145628243	3%	30.36MB/362.63MB : 8.37%	2024-07-28 20:06:38.776424
3095	20072418145628243	10%	30.41MB/362.63MB : 8.39%	2024-07-28 20:06:41.358596
3096	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:06:45.038955
3097	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:06:47.590717
3098	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:06:53.683631
3099	20072418142931314	2%	30.38MB/362.63MB : 8.38%	2024-07-28 20:06:59.890671
3100	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:07:21.103645
3101	20072418145628243	4%	30.32MB/362.63MB : 8.36%	2024-07-28 20:07:28.489295
3102	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 20:07:34.692349
3103	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 20:07:36.102151
3104	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:07:40.92843
3105	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:07:43.500186
3106	28062414183645219	0%	338.22MB/1193.98MB : 28.33%	2024-07-28 20:07:46.333631
3107	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:07:49.674973
3108	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:07:55.895598
3109	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:08:01.307352
3110	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:08:22.449446
3111	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:08:29.136252
3112	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:08:35.376273
3113	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:08:37.434436
3114	28062414365385132	5%	30.54MB/362.63MB : 8.42%	2024-07-28 20:08:41.59144
3115	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:08:44.742251
3116	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:08:46.987688
3117	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:08:50.991747
3118	28062414365385132	3%	30.58MB/362.63MB : 8.43%	2024-07-28 20:08:57.320366
3119	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:09:02.725609
3120	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:09:22.492592
3121	28072417303662518	4%	30.33MB/362.63MB : 8.37%	2024-07-28 20:09:28.540706
3122	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:09:36.389545
3123	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 20:09:38.835007
3124	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:09:42.688394
3125	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 20:09:45.785649
3126	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:09:48.944168
3127	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 20:09:51.994596
3128	28062414365385132	3%	30.58MB/362.63MB : 8.43%	2024-07-28 20:09:58.289712
3129	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:10:03.671613
3130	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:10:25.079542
3131	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:10:32.800995
3132	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 20:10:39.024633
3133	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:10:39.812217
3134	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:10:45.254203
3135	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:10:47.530235
3136	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:10:50.672461
3137	20072418142931314	4%	30.35MB/362.63MB : 8.37%	2024-07-28 20:10:53.738344
3138	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:11:00.033284
3139	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:11:05.462505
3140	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:11:26.212435
3141	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:11:32.443749
3142	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:11:39.750407
3143	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:11:41.681502
3144	28072417303662518	8%	30.42MB/362.63MB : 8.39%	2024-07-28 20:11:45.759013
3145	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 20:11:48.792042
3146	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 20:11:52.088487
3147	20072418142931314	11%	30.44MB/362.63MB : 8.39%	2024-07-28 20:11:54.999035
3148	28062414365385132	15%	30.54MB/362.63MB : 8.42%	2024-07-28 20:12:01.221953
3149	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:12:06.618343
3150	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:12:27.578383
3151	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 20:12:33.597719
3152	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:12:41.31305
3153	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:12:42.081924
3154	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:12:47.569435
3155	28072417303662518	4%	30.33MB/362.63MB : 8.37%	2024-07-28 20:12:48.094361
3156	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:12:53.772112
3157	20072418145628243	14%	30.32MB/362.63MB : 8.36%	2024-07-28 20:12:54.762044
3158	28062414365385132	12%	30.54MB/362.63MB : 8.42%	2024-07-28 20:13:00.983743
3159	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:13:07.261497
3160	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:13:29.252271
3161	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:13:36.072041
3162	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:13:42.139771
3163	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:13:42.759147
3164	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:13:48.388415
3165	20072418145628243	11%	30.36MB/362.63MB : 8.37%	2024-07-28 20:13:49.889912
3166	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 20:13:54.56285
3167	28072417303662518	15%	30.32MB/362.63MB : 8.36%	2024-07-28 20:13:55.922573
3168	28062414365385132	11%	30.54MB/362.63MB : 8.42%	2024-07-28 20:14:02.17194
3169	20072418142931314	5%	30.35MB/362.63MB : 8.37%	2024-07-28 20:14:08.39578
3170	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:14:30.671513
3171	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:14:37.818699
3172	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:14:44.00676
3173	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:14:44.501574
3174	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 20:14:50.269102
3175	20072418145628243	8%	30.36MB/362.63MB : 8.37%	2024-07-28 20:14:51.568518
3176	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:14:55.662657
3177	20072418142931314	18%	30.37MB/362.63MB : 8.38%	2024-07-28 20:14:57.921139
3178	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:15:04.153617
3179	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:15:09.549179
3180	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:15:31.165092
3181	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:15:38.51087
3182	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:15:45.005492
3183	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:15:45.066817
3184	20072418145628243	16%	30.39MB/362.63MB : 8.38%	2024-07-28 20:15:51.223503
3185	28062414365385132	8%	30.54MB/362.63MB : 8.42%	2024-07-28 20:15:51.270034
3186	28072417303662518	16%	30.33MB/362.63MB : 8.37%	2024-07-28 20:15:57.300492
3187	20072418142931314	16%	30.43MB/362.63MB : 8.39%	2024-07-28 20:15:57.579527
3188	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:16:03.483693
3189	20072418142931314	2%	30.35MB/362.63MB : 8.37%	2024-07-28 20:16:09.620723
3190	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:16:33.075487
3191	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:16:39.110629
3192	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:16:45.138995
3193	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 20:16:46.297828
3194	28072417303662518	16%	30.31MB/362.63MB : 8.36%	2024-07-28 20:16:51.160317
3195	28062414365385132	2%	30.54MB/362.63MB : 8.42%	2024-07-28 20:16:52.575463
3196	20072418145628243	12%	30.32MB/362.63MB : 8.36%	2024-07-28 20:16:58.310028
3197	20072418142931314	6%	30.37MB/362.63MB : 8.37%	2024-07-28 20:16:58.788997
3198	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:17:04.545222
3199	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:17:10.769459
3200	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:17:34.29101
3201	20072418145628243	6%	30.32MB/362.63MB : 8.36%	2024-07-28 20:17:41.968247
3202	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:17:46.300565
3203	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:17:47.985722
3204	20072418145628243	14%	30.32MB/362.63MB : 8.36%	2024-07-28 20:17:52.761225
3205	28062414365385132	11%	30.58MB/362.63MB : 8.43%	2024-07-28 20:17:54.184297
3206	28072417303662518	10%	30.33MB/362.63MB : 8.37%	2024-07-28 20:17:58.789425
3207	20072418142931314	6%	30.35MB/362.63MB : 8.37%	2024-07-28 20:18:00.346371
3208	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:18:05.122162
3209	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:18:11.38222
3210	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:18:35.829674
3211	28062414365385132	3%	30.55MB/362.63MB : 8.42%	2024-07-28 20:18:42.052721
3212	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:18:46.881468
3213	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:18:48.754056
3214	28062414365385132	12%	30.55MB/362.63MB : 8.42%	2024-07-28 20:18:53.118579
3215	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:18:54.850906
3216	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 20:19:00.552655
3217	20072418142931314	20%	30.35MB/362.63MB : 8.37%	2024-07-28 20:19:01.16863
3218	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:19:06.566272
3219	20072418142931314	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:19:12.813962
3220	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:19:36.66458
3221	20072418145628243	2%	30.32MB/362.63MB : 8.36%	2024-07-28 20:19:43.791418
3222	28062414183645219	0%	338.42MB/1193.98MB : 28.34%	2024-07-28 20:19:48.308067
3223	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 20:19:49.884565
3224	20072418145628243	13%	30.32MB/362.63MB : 8.36%	2024-07-28 20:19:55.639836
3225	28062414365385132	9%	30.55MB/362.63MB : 8.42%	2024-07-28 20:19:56.305819
3226	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:20:01.674726
3227	20072418142931314	20%	30.35MB/362.63MB : 8.37%	2024-07-28 20:20:02.524127
3228	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 20:20:07.905908
3229	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:20:14.136773
3230	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:20:38.679453
3231	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:20:45.638169
3232	28072417303662518	3%	30.36MB/362.63MB : 8.37%	2024-07-28 20:20:50.267404
3233	20072418142931314	19%	30.36MB/362.63MB : 8.37%	2024-07-28 20:20:56.186694
3234	20072418145628243	11%	30.32MB/362.63MB : 8.36%	2024-07-28 20:20:57.531376
3235	28062414365385132	11%	30.55MB/362.63MB : 8.42%	2024-07-28 20:21:02.387024
3236	20072418142931314	11%	30.35MB/362.63MB : 8.37%	2024-07-28 20:21:03.779636
3237	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:21:07.782886
3238	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 20:21:10.002552
3239	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:21:15.415881
3240	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 20:21:43.909528
3241	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:21:49.309684
3242	20072418145628243	11%	30.38MB/362.63MB : 8.38%	2024-07-28 20:21:52.046166
3243	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 20:21:55.556492
3244	20072418142931314	19%	30.35MB/362.63MB : 8.37%	2024-07-28 20:21:58.265087
3245	20072418142931314	12%	30.44MB/362.63MB : 8.39%	2024-07-28 20:22:01.763385
3246	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:22:04.454559
3247	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 20:22:09.175988
3248	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:22:09.839694
3249	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:22:15.8867
3250	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:22:45.457876
3251	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 20:22:51.665826
3252	28072417303662518	15%	30.33MB/362.63MB : 8.37%	2024-07-28 20:22:52.066564
3253	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:22:57.064252
3254	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:22:59.833106
3255	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:23:03.114172
3256	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 20:23:06.067008
3257	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:23:10.459491
3258	28062414365385132	2%	30.55MB/362.63MB : 8.42%	2024-07-28 20:23:12.316711
3259	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:23:17.757357
3260	28072417303662518	8%	30.33MB/362.63MB : 8.37%	2024-07-28 20:23:46.559279
3261	20072418145628243	12%	30.36MB/362.63MB : 8.37%	2024-07-28 20:23:52.711575
3262	28072417303662518	13%	30.33MB/362.63MB : 8.37%	2024-07-28 20:23:53.886135
3263	20072418142931314	15%	30.35MB/362.63MB : 8.37%	2024-07-28 20:23:58.98965
3264	20072418145628243	8%	30.32MB/362.63MB : 8.36%	2024-07-28 20:24:00.844038
3265	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 20:24:05.189064
3266	20072418142931314	9%	30.35MB/362.63MB : 8.37%	2024-07-28 20:24:07.0143
3267	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:24:10.587826
3268	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:24:13.230612
3269	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:24:18.629308
3270	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:24:46.825328
3271	20072418145628243	6%	30.38MB/362.63MB : 8.38%	2024-07-28 20:24:53.239404
3272	28072417303662518	11%	30.33MB/362.63MB : 8.37%	2024-07-28 20:24:54.781047
3273	20072418142931314	13%	30.35MB/362.63MB : 8.37%	2024-07-28 20:24:59.538316
3274	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:25:02.629742
3275	28062414365385132	6%	30.58MB/362.63MB : 8.43%	2024-07-28 20:25:05.749808
3276	20072418142931314	3%	30.35MB/362.63MB : 8.37%	2024-07-28 20:25:08.82877
3277	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:25:11.166551
3278	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:25:15.084276
3279	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:25:20.501545
3280	28072417303662518	5%	30.33MB/362.63MB : 8.37%	2024-07-28 20:25:47.290778
3281	20072418145628243	8%	30.35MB/362.63MB : 8.37%	2024-07-28 20:25:53.97259
3282	28072417303662518	7%	30.33MB/362.63MB : 8.37%	2024-07-28 20:25:56.631498
3283	20072418142931314	19%	30.35MB/362.63MB : 8.37%	2024-07-28 20:26:00.162811
3284	20072418145628243	6%	30.34MB/362.63MB : 8.37%	2024-07-28 20:26:03.272301
3285	28062414365385132	7%	30.54MB/362.63MB : 8.42%	2024-07-28 20:26:06.428542
3286	20072418142931314	15%	30.35MB/362.63MB : 8.37%	2024-07-28 20:26:09.506172
3287	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:26:11.859601
3288	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:26:15.722195
3289	28062414183645219	1%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:26:21.105004
3290	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 20:26:47.357073
3291	20072418145628243	11%	30.32MB/362.63MB : 8.36%	2024-07-28 20:26:54.081171
3292	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 20:26:56.587356
3293	28072417303662518	11%	30.33MB/362.63MB : 8.37%	2024-07-28 20:27:00.099575
3294	20072418145628243	3%	30.32MB/362.63MB : 8.36%	2024-07-28 20:27:03.67756
3295	28062414365385132	6%	30.55MB/362.63MB : 8.42%	2024-07-28 20:27:06.303085
3296	28072417303662518	2%	30.33MB/362.63MB : 8.37%	2024-07-28 20:27:09.741327
3297	20072418142931314	13%	30.35MB/362.63MB : 8.37%	2024-07-28 20:27:12.464394
3298	28062414365385132	7%	30.55MB/362.63MB : 8.42%	2024-07-28 20:27:16.006014
3299	20072418142931314	10%	30.35MB/362.63MB : 8.37%	2024-07-28 20:27:22.186553
3300	28062414183645219	0%	338.31MB/1193.98MB : 28.33%	2024-07-28 20:27:47.984783
3301	28072417303662518	10%	30.33MB/362.63MB : 8.37%	2024-07-28 20:27:54.053266
3302	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:27:57.690644
3303	28062414365385132	6%	30.54MB/362.63MB : 8.42%	2024-07-28 20:28:00.316118
3304	28072417303662518	3%	30.33MB/362.63MB : 8.37%	2024-07-28 20:28:03.703966
3305	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:28:07.548039
3306	28062414365385132	15%	30.55MB/362.63MB : 8.42%	2024-07-28 20:28:09.925065
3307	20072418142931314	4%	30.44MB/362.63MB : 8.39%	2024-07-28 20:28:13.879485
3308	20072418145628243	7%	30.32MB/362.63MB : 8.36%	2024-07-28 20:28:17.543583
3309	20072418142931314	4%	30.37MB/362.63MB : 8.38%	2024-07-28 20:28:23.794615
3310	28062414183645219	1%	338.31MB/1193.98MB : 28.33%	2024-07-28 20:28:49.409668
3311	28072417303662518	6%	30.33MB/362.63MB : 8.37%	2024-07-28 20:28:55.464735
3312	28062414183645219	0%	338.30MB/1193.98MB : 28.33%	2024-07-28 20:28:59.302858
3313	07112416161534109	1%	328.23MB/2136.98MB : 15.36%	2024-11-07 16:17:17.568959
3314	07112416161534109	0%	328.23MB/2136.98MB : 15.36%	2024-11-07 16:17:40.069429
3315	07112416161534109	0%	328.23MB/2136.98MB : 15.36%	2024-11-07 16:18:34.961238
3316	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:19:39.503153
3317	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:20:34.401928
3318	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:21:39.0115
3319	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:22:33.879049
3320	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:23:38.438044
3321	07112416161534109	0%	328.36MB/2136.98MB : 15.37%	2024-11-07 16:24:33.392104
3322	07112416161534109	0%	328.74MB/2136.98MB : 15.38%	2024-11-07 16:25:58.955304
3323	07112416161534109	0%	328.74MB/2136.98MB : 15.38%	2024-11-07 16:27:14.959014
3324	07112416161534109	0%	328.74MB/2136.98MB : 15.38%	2024-11-07 16:27:37.363574
3325	07112416161534109	0%	328.74MB/2136.98MB : 15.38%	2024-11-07 16:28:32.331248
3326	07112416161534109	0%	328.80MB/2136.98MB : 15.39%	2024-11-07 16:29:36.785779
3327	07112416161534109	0%	328.80MB/2136.98MB : 15.39%	2024-11-07 16:30:31.801694
3328	07112416161534109	0%	328.80MB/2136.98MB : 15.39%	2024-11-07 16:31:36.198765
3329	07112416161534109	0%	328.80MB/2136.98MB : 15.39%	2024-11-07 16:32:31.294993
3330	07112416161534109	0%	328.80MB/2136.98MB : 15.39%	2024-11-07 16:33:35.661896
3331	07112416161534109	0%	328.86MB/2136.98MB : 15.39%	2024-11-07 16:35:33.876465
3332	07112416161534109	0%	328.86MB/2136.98MB : 15.39%	2024-11-07 16:36:17.233172
3333	07112416161534109	0%	328.86MB/2136.98MB : 15.39%	2024-11-07 16:36:51.242492
3334	07112416161534109	0%	328.86MB/2136.98MB : 15.39%	2024-11-07 16:37:06.5683
3335	07112416161534109	0%	328.86MB/2136.98MB : 15.39%	2024-11-07 16:38:29.669201
3336	07112416161534109	0%	328.99MB/2136.98MB : 15.39%	2024-11-07 16:39:06.012462
3337	07112416161534109	0%	328.99MB/2136.98MB : 15.39%	2024-11-07 16:40:29.124448
3338	07112416161534109	0%	329.05MB/2136.98MB : 15.40%	2024-11-07 16:41:05.459384
3339	07112416161534109	0%	331.85MB/2136.98MB : 15.53%	2024-11-07 16:42:28.607846
3340	07112416161534109	0%	331.85MB/2136.98MB : 15.53%	2024-11-07 16:43:25.947399
3341	07112416161534109	0%	331.38MB/2136.98MB : 15.51%	2024-11-07 16:48:50.708478
3342	07112416161534109	0%	331.22MB/2136.98MB : 15.50%	2024-11-07 16:49:12.02029
3343	07112416161534109	0%	331.22MB/2136.98MB : 15.50%	2024-11-07 16:49:25.989425
3344	07112416161534109	0%	331.06MB/2136.98MB : 15.49%	2024-11-07 16:50:50.441676
3345	07112416161534109	0%	331.06MB/2136.98MB : 15.49%	2024-11-07 16:51:04.440544
3346	07112416161534109	0%	331.06MB/2136.98MB : 15.49%	2024-11-07 16:52:28.844383
3347	07112416161534109	0%	331.06MB/2136.98MB : 15.49%	2024-11-07 16:52:42.850425
3348	07112416161534109	0%	331.06MB/2136.98MB : 15.49%	2024-11-07 16:53:04.115006
3349	07112416161534109	0%	332.32MB/2136.98MB : 15.55%	2024-11-07 17:08:52.506211
3350	07112416161534109	0%	332.33MB/2136.98MB : 15.55%	2024-11-07 17:08:53.386953
3351	07112416161534109	1%	332.69MB/2136.98MB : 15.57%	2024-11-07 17:09:27.803332
3352	07112416161534109	1%	332.70MB/2136.98MB : 15.57%	2024-11-07 17:09:28.712868
3353	07112416161534109	1%	332.76MB/2136.98MB : 15.57%	2024-11-07 17:10:03.084442
3354	07112416161534109	1%	332.77MB/2136.98MB : 15.57%	2024-11-07 17:10:04.012988
3355	07112416161534109	0%	332.76MB/2136.98MB : 15.57%	2024-11-07 17:10:38.386035
3356	07112416161534109	0%	332.77MB/2136.98MB : 15.57%	2024-11-07 17:10:39.311563
3357	07112416161534109	0%	332.88MB/2136.98MB : 15.58%	2024-11-07 17:11:13.686455
3358	07112416161534109	0%	332.89MB/2136.98MB : 15.58%	2024-11-07 17:11:14.601183
3359	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:11:48.979563
3360	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:11:49.916409
3361	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:12:24.278481
3362	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:12:25.223218
3363	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:12:59.569965
3364	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:13:00.511185
3365	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:13:34.881984
3366	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:13:35.841587
3367	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:14:10.211094
3368	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:14:11.168476
3369	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:14:45.51908
3370	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:14:46.494321
3371	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:15:20.841376
3372	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:15:21.798589
3373	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:15:56.14787
3374	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:15:57.075829
3375	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:16:31.458629
3376	07112416161534109	1%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:16:32.386272
3377	07112416161534109	0%	333.13MB/2136.98MB : 15.59%	2024-11-07 17:17:06.775475
3378	07112416161534109	1%	333.14MB/2136.98MB : 15.59%	2024-11-07 17:17:07.687189
3379	07112416161534109	1%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:17:42.100961
3380	07112416161534109	1%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:17:42.996862
3381	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:18:17.386944
3382	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:18:18.312787
3383	07112416161534109	1%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:18:52.70774
3384	07112416161534109	1%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:18:53.605678
3385	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:19:28.025795
3386	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:19:28.906829
3387	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:20:03.298125
3388	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:20:04.211208
3389	07112416161534109	1%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:20:38.590447
3390	07112416161534109	1%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:20:39.550665
3391	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:21:13.889521
3392	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:21:14.848004
3393	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:21:49.192455
3394	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:21:50.134623
3395	07112416161534109	0%	333.07MB/2136.98MB : 15.59%	2024-11-07 17:22:24.517266
3396	07112416161534109	0%	333.08MB/2136.98MB : 15.59%	2024-11-07 17:22:25.415535
3397	07112416161534109	0%	333.13MB/2136.98MB : 15.59%	2024-11-07 17:22:59.814227
3398	07112416161534109	0%	333.14MB/2136.98MB : 15.59%	2024-11-07 17:23:00.726442
3399	07112416161534109	0%	333.13MB/2136.98MB : 15.59%	2024-11-07 17:23:35.104021
3400	07112416161534109	0%	333.14MB/2136.98MB : 15.59%	2024-11-07 17:23:36.0158
3401	07112416161534109	0%	333.13MB/2136.98MB : 15.59%	2024-11-07 17:24:10.474514
3402	07112416161534109	0%	333.14MB/2136.98MB : 15.59%	2024-11-07 17:24:11.307042
3403	07112416161534109	0%	333.13MB/2136.98MB : 15.59%	2024-11-07 17:24:45.777677
3404	07112416161534109	0%	333.14MB/2136.98MB : 15.59%	2024-11-07 17:24:46.61107
3405	07112416161534109	0%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:25:21.052401
3406	07112416161534109	0%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:25:21.897705
3407	07112416161534109	0%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:25:56.32877
3408	07112416161534109	1%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:25:57.178534
3409	07112416161534109	0%	333.34MB/2136.98MB : 15.60%	2024-11-07 17:26:31.615721
3410	07112416161534109	1%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:26:32.464857
3411	07112416161534109	0%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:27:06.916709
3412	07112416161534109	0%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:27:07.752756
3413	07112416161534109	1%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:27:42.226718
3414	07112416161534109	1%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:27:43.060962
3415	07112416161534109	0%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:28:17.529262
3416	07112416161534109	0%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:28:18.351536
3417	07112416161534109	1%	333.25MB/2136.98MB : 15.59%	2024-11-07 17:28:52.88989
3418	07112416161534109	1%	333.27MB/2136.98MB : 15.60%	2024-11-07 17:28:53.663053
3419	07112416161534109	1%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:29:28.163203
3420	07112416161534109	1%	333.33MB/2136.98MB : 15.60%	2024-11-07 17:29:28.981881
3421	07112416161534109	0%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:30:03.512254
3422	07112416161534109	0%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:30:04.26887
3423	07112416161534109	1%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:30:38.803657
3424	07112416161534109	1%	333.33MB/2136.98MB : 15.60%	2024-11-07 17:30:39.560391
3425	07112416161534109	1%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:31:14.100694
3426	07112416161534109	1%	333.33MB/2136.98MB : 15.60%	2024-11-07 17:31:14.872239
3427	07112416161534109	0%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:31:49.383436
3428	07112416161534109	0%	333.33MB/2136.98MB : 15.60%	2024-11-07 17:31:50.184473
3429	07112416161534109	0%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:32:24.701623
3430	07112416161534109	0%	333.33MB/2136.98MB : 15.60%	2024-11-07 17:32:25.489605
3431	07112416161534109	0%	333.32MB/2136.98MB : 15.60%	2024-11-07 17:33:00.00585
3432	07112416161534109	0%	333.39MB/2136.98MB : 15.60%	2024-11-07 17:33:00.810095
3433	07112416161534109	0%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:33:35.294622
3434	07112416161534109	0%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:33:36.113909
3435	07112416161534109	0%	333.47MB/2136.98MB : 15.60%	2024-11-07 17:34:10.622858
3436	07112416161534109	0%	333.48MB/2136.98MB : 15.61%	2024-11-07 17:34:11.393925
3437	07112416161534109	0%	333.47MB/2136.98MB : 15.60%	2024-11-07 17:34:45.973176
3438	07112416161534109	0%	333.48MB/2136.98MB : 15.61%	2024-11-07 17:34:46.73232
3439	07112416161534109	0%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:35:21.293356
3440	07112416161534109	1%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:35:22.05252
3441	07112416161534109	0%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:35:56.5954
3442	07112416161534109	0%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:35:57.369031
3443	07112416161534109	0%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:36:31.900492
3444	07112416161534109	1%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:36:32.640926
3445	07112416161534109	0%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:37:07.186896
3446	07112416161534109	0%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:37:07.911641
3447	07112416161534109	1%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:37:42.48421
3448	07112416161534109	1%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:37:43.19169
3449	07112416161534109	1%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:38:17.784414
3450	07112416161534109	1%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:38:18.479075
3451	07112416161534109	1%	333.44MB/2136.98MB : 15.60%	2024-11-07 17:38:53.065105
3452	07112416161534109	1%	333.45MB/2136.98MB : 15.60%	2024-11-07 17:38:53.773946
3453	07112416161534109	0%	333.50MB/2136.98MB : 15.61%	2024-11-07 17:39:28.344949
3454	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:39:29.055772
3455	07112416161534109	1%	333.50MB/2136.98MB : 15.61%	2024-11-07 17:40:03.677713
3456	07112416161534109	1%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:40:04.355947
3457	07112416161534109	0%	333.50MB/2136.98MB : 15.61%	2024-11-07 17:40:38.953407
3458	07112416161534109	0%	333.51MB/2136.98MB : 15.61%	2024-11-07 17:40:39.646253
3459	07112416161534109	0%	333.50MB/2136.98MB : 15.61%	2024-11-07 17:41:14.293072
3460	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:41:14.943614
3461	07112416161534109	0%	333.50MB/2136.98MB : 15.61%	2024-11-07 17:41:49.571574
3462	07112416161534109	0%	333.51MB/2136.98MB : 15.61%	2024-11-07 17:41:50.219026
3463	07112416161534109	0%	333.51MB/2136.98MB : 15.61%	2024-11-07 17:42:24.928899
3464	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:42:25.515619
3465	07112416161534109	1%	333.51MB/2136.98MB : 15.61%	2024-11-07 17:43:00.247808
3466	07112416161534109	1%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:43:00.819704
3467	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:43:35.51029
3468	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:43:36.111345
3469	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:44:10.816022
3470	07112416161534109	0%	333.65MB/2136.98MB : 15.61%	2024-11-07 17:44:11.420251
3471	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:44:46.11754
3472	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:44:46.748647
3473	07112416161534109	0%	333.69MB/2136.98MB : 15.62%	2024-11-07 17:45:21.468776
3474	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:45:22.117062
3475	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:45:56.759038
3476	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:45:57.438061
3477	07112416161534109	1%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:46:32.050668
3478	07112416161534109	1%	333.65MB/2136.98MB : 15.61%	2024-11-07 17:46:32.778508
3479	07112416161534109	1%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:47:07.366944
3480	07112416161534109	1%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:47:08.075987
3481	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:47:42.666527
3482	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:47:43.350074
3483	07112416161534109	0%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:48:17.952432
3484	07112416161534109	0%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:48:18.63831
3485	07112416161534109	1%	333.63MB/2136.98MB : 15.61%	2024-11-07 17:48:53.235778
3486	07112416161534109	1%	333.64MB/2136.98MB : 15.61%	2024-11-07 17:48:53.961175
3487	07112416161534109	0%	333.69MB/2136.98MB : 15.62%	2024-11-07 17:49:28.528796
3488	07112416161534109	0%	333.70MB/2136.98MB : 15.62%	2024-11-07 17:49:29.255536
3489	07112416161534109	1%	333.69MB/2136.98MB : 15.62%	2024-11-07 17:50:03.863167
3490	07112416161534109	1%	333.79MB/2136.98MB : 15.62%	2024-11-07 17:50:04.588144
3491	07112416161534109	1%	333.55MB/2136.98MB : 15.61%	2024-11-07 17:50:39.179855
3492	07112416161534109	1%	333.56MB/2136.98MB : 15.61%	2024-11-07 17:50:39.934782
3493	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:51:14.47328
3494	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:51:15.217107
3495	07112416161534109	1%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:51:49.758872
3496	07112416161534109	1%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:51:50.51907
3497	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:52:25.072286
3498	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:52:25.814416
3499	07112416161534109	0%	333.52MB/2136.98MB : 15.61%	2024-11-07 17:53:00.364784
3500	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:53:01.12251
3501	07112416161534109	0%	333.53MB/2136.98MB : 15.61%	2024-11-07 17:53:35.687419
3502	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:53:36.414019
3503	07112416161534109	0%	333.53MB/2136.98MB : 15.61%	2024-11-07 17:54:10.963056
3504	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:54:11.73458
3505	07112416161534109	0%	333.53MB/2136.98MB : 15.61%	2024-11-07 17:54:46.272373
3506	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:54:47.026772
3507	07112416161534109	0%	333.53MB/2136.98MB : 15.61%	2024-11-07 17:55:21.601724
3508	07112416161534109	0%	333.54MB/2136.98MB : 15.61%	2024-11-07 17:55:22.35892
3509	07112416161534109	0%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:55:56.993669
3510	07112416161534109	1%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:55:57.689521
3511	07112416161534109	1%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:56:32.292519
3512	07112416161534109	1%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:56:32.98693
3513	07112416161534109	1%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:57:07.586437
3514	07112416161534109	1%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:57:08.281682
3515	07112416161534109	0%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:57:42.877998
3516	07112416161534109	0%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:57:43.557337
3517	07112416161534109	0%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:58:18.203482
3518	07112416161534109	0%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:58:18.83961
3519	07112416161534109	1%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:58:53.522985
3520	07112416161534109	1%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:58:54.108946
3521	07112416161534109	1%	333.59MB/2136.98MB : 15.61%	2024-11-07 17:59:28.854447
3522	07112416161534109	1%	333.60MB/2136.98MB : 15.61%	2024-11-07 17:59:29.410728
3523	07112416161534109	0%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:00:04.135518
3524	07112416161534109	0%	333.66MB/2136.98MB : 15.61%	2024-11-07 18:00:04.694646
3525	07112416161534109	0%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:00:39.472339
3526	07112416161534109	0%	333.66MB/2136.98MB : 15.61%	2024-11-07 18:00:39.996444
3527	07112416161534109	0%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:01:14.754232
3528	07112416161534109	0%	333.66MB/2136.98MB : 15.61%	2024-11-07 18:01:15.262441
3529	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:01:50.046169
3530	07112416161534109	0%	333.72MB/2136.98MB : 15.62%	2024-11-07 18:01:50.573793
3531	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:02:25.333036
3532	07112416161534109	0%	333.72MB/2136.98MB : 15.62%	2024-11-07 18:02:25.860403
3533	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:03:00.643485
3534	07112416161534109	0%	333.72MB/2136.98MB : 15.62%	2024-11-07 18:03:01.199655
3535	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:03:35.927707
3536	07112416161534109	0%	333.72MB/2136.98MB : 15.62%	2024-11-07 18:03:36.484345
3537	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:04:11.218009
3538	07112416161534109	0%	333.79MB/2136.98MB : 15.62%	2024-11-07 18:04:11.804488
3539	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:04:46.526795
3540	07112416161534109	0%	333.79MB/2136.98MB : 15.62%	2024-11-07 18:04:47.099204
3541	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:06:44.028405
3542	07112416161534109	0%	333.79MB/2136.98MB : 15.62%	2024-11-07 18:06:44.880248
3543	07112416161534109	1%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:07:09.279567
3544	07112416161534109	1%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:07:19.357489
3545	07112416161534109	0%	333.65MB/2136.98MB : 15.61%	2024-11-07 18:07:44.583017
3546	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:07:54.670603
3547	07112416161534109	0%	333.85MB/2136.98MB : 15.62%	2024-11-07 18:07:57.200817
3548	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:08:29.970187
3549	07112416161534109	0%	333.85MB/2136.98MB : 15.62%	2024-11-07 18:08:32.485317
3550	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:09:05.291993
3551	07112416161534109	1%	333.85MB/2136.98MB : 15.62%	2024-11-07 18:09:07.81023
3552	07112416161534109	1%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:09:22.546283
3553	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:09:40.645628
3554	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:09:57.856242
3555	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:10:15.916703
3556	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:10:33.162069
3557	07112416161534109	1%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:10:51.204005
3558	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:11:08.476874
3559	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:11:26.496194
3560	07112416161534109	1%	333.80MB/2136.98MB : 15.62%	2024-11-07 18:11:38.843039
3561	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:12:01.797653
3562	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:12:14.142091
3563	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:12:37.091961
3564	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:12:49.4336
3565	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:13:12.422459
3566	07112416161534109	1%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:13:24.751691
3567	07112416161534109	0%	333.71MB/2136.98MB : 15.62%	2024-11-07 18:13:47.697265
3568	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:14:00.077198
3569	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:14:22.98667
3570	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:14:35.336387
3571	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:14:58.308363
3572	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:15:10.666254
3573	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:15:33.654023
3574	07112416161534109	0%	333.77MB/2136.98MB : 15.62%	2024-11-07 18:15:45.985096
3575	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:16:08.949259
3576	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:16:21.312935
3577	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:16:44.266339
3578	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:16:56.626242
3579	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:17:19.566046
3580	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:17:31.907663
3581	07112416161534109	0%	333.83MB/2136.98MB : 15.62%	2024-11-07 18:17:54.847511
3582	07112416161534109	1%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:18:07.206295
3583	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:18:30.160194
3584	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:18:42.582361
3585	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:19:05.437304
3586	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:19:17.864628
3587	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:19:40.755915
3588	07112416161534109	0%	333.90MB/2136.98MB : 15.62%	2024-11-07 18:19:53.158794
3589	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:20:16.048427
3590	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:20:28.465246
3591	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:20:51.431426
3592	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:21:03.765448
3593	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:21:26.755303
3594	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:21:39.053296
3595	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:22:02.047609
3596	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:22:14.430516
3597	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:22:37.343192
3598	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:22:49.736467
3599	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:23:12.648175
3600	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:23:25.019818
3601	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:23:47.997189
3602	07112416161534109	0%	333.96MB/2136.98MB : 15.63%	2024-11-07 18:24:00.367467
3603	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:24:23.302888
3604	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:24:35.720925
3605	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:24:58.632566
3606	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:25:11.107695
3607	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:25:33.965883
3608	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:25:46.41366
3609	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:26:09.270277
3610	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:26:21.753089
3611	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:26:44.548353
3612	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:26:57.040132
3613	07112416161534109	1%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:27:19.836595
3614	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:27:32.411385
3615	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:27:55.198221
3616	07112416161534109	0%	334.02MB/2136.98MB : 15.63%	2024-11-07 18:28:07.723648
3617	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:28:30.537997
3618	07112416161534109	1%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:28:43.031947
3619	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:29:05.825737
3620	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:29:18.359334
3621	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:29:41.120245
3622	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:29:53.672487
3623	07112416161534109	0%	334.08MB/2136.98MB : 15.63%	2024-11-07 18:30:16.420958
3624	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:30:28.966557
3625	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:30:51.73286
3626	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:31:04.248335
3627	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:31:27.012983
3628	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:31:39.513167
3629	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:32:02.30791
3630	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:32:14.831826
3631	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:32:37.615123
3632	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:32:50.092553
3633	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:33:12.900447
3634	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:33:25.386966
3635	07112416161534109	1%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:33:48.178411
3636	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:34:00.6679
3637	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:34:23.466048
3638	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:34:35.978697
3639	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:34:58.74824
3640	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:35:11.305616
3641	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:35:34.031025
3642	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:35:46.638693
3643	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:36:09.335689
3644	07112416161534109	0%	334.15MB/2136.98MB : 15.64%	2024-11-07 18:36:21.914735
3645	07112416161534109	0%	334.21MB/2136.98MB : 15.64%	2024-11-07 18:36:44.655777
3646	07112416161534109	0%	334.21MB/2136.98MB : 15.64%	2024-11-07 18:36:57.227641
3647	07112416161534109	0%	334.21MB/2136.98MB : 15.64%	2024-11-07 18:37:19.935431
3648	07112416161534109	0%	322.97MB/2136.98MB : 15.11%	2024-11-24 15:23:33.057602
3649	07112416161534109	0%	322.99MB/2136.98MB : 15.11%	2024-11-24 15:23:33.985734
3650	07112416161534109	0%	323.36MB/2136.98MB : 15.13%	2024-11-24 15:24:08.369109
3651	07112416161534109	0%	323.37MB/2136.98MB : 15.13%	2024-11-24 15:24:09.237214
3652	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:24:43.645929
3653	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:24:44.544837
3654	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:25:18.920558
3655	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:25:19.820392
3656	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:25:54.199358
3657	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:25:55.079839
3658	07112416161534109	1%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:26:29.481428
3659	07112416161534109	1%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:26:30.378614
3660	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:27:04.755899
3661	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:27:05.638661
3662	07112416161534109	1%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:27:40.03781
3663	07112416161534109	1%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:27:40.936417
3664	07112416161534109	1%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:28:15.298823
3665	07112416161534109	1%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:28:16.19251
3666	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:28:50.591421
3667	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:28:51.474787
3668	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:29:25.866338
3669	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:29:26.71596
3670	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:30:01.139122
3671	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:30:01.990269
3672	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:30:36.442813
3673	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:30:37.245351
3674	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:31:11.704604
3675	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:31:12.507141
3676	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:31:46.973567
3677	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:31:47.777856
3678	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:32:22.231753
3679	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:32:23.033653
3680	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:32:57.524926
3681	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:32:58.29551
3682	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:33:32.788246
3683	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:33:33.606273
3684	07112416161534109	0%	323.33MB/2136.98MB : 15.13%	2024-11-24 15:34:08.075053
3685	07112416161534109	0%	323.34MB/2136.98MB : 15.13%	2024-11-24 15:34:08.88093
3686	07112416161534109	0%	324.90MB/2136.98MB : 15.20%	2024-11-24 15:34:43.332513
3687	07112416161534109	0%	324.91MB/2136.98MB : 15.20%	2024-11-24 15:34:44.166985
3688	07112416161534109	0%	325.85MB/2136.98MB : 15.25%	2024-11-24 15:35:18.602022
3689	07112416161534109	1%	325.86MB/2136.98MB : 15.25%	2024-11-24 15:35:19.483052
3690	07112416161534109	0%	325.84MB/2136.98MB : 15.25%	2024-11-24 15:35:53.862627
3691	07112416161534109	0%	325.86MB/2136.98MB : 15.25%	2024-11-24 15:35:54.745373
3692	07112416161534109	0%	325.85MB/2136.98MB : 15.25%	2024-11-24 15:36:29.165417
3693	07112416161534109	0%	325.86MB/2136.98MB : 15.25%	2024-11-24 15:36:30.000779
3694	07112416161534109	1%	325.91MB/2136.98MB : 15.25%	2024-11-24 15:37:04.46189
3695	07112416161534109	1%	325.92MB/2136.98MB : 15.25%	2024-11-24 15:37:05.297442
3696	07112416161534109	1%	325.99MB/2136.98MB : 15.25%	2024-11-24 15:42:05.150667
3697	07112416161534109	1%	326.01MB/2136.98MB : 15.26%	2024-11-24 15:42:05.955972
3698	07112416161534109	0%	325.99MB/2136.98MB : 15.25%	2024-11-24 15:42:40.428811
3699	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:42:46.378265
3700	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:43:15.727179
3701	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:43:21.666375
3702	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:43:51.016993
3703	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:43:58.138456
3704	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:44:22.470976
3705	07112416161534109	0%	326.01MB/2136.98MB : 15.26%	2024-11-24 15:44:26.281606
3706	07112416161534109	0%	325.87MB/2136.98MB : 15.25%	2024-11-24 15:44:35.270118
3707	07112416161534109	0%	326.18MB/2136.98MB : 15.26%	2024-11-24 15:45:01.547475
3708	07112416161534109	0%	326.12MB/2136.98MB : 15.26%	2024-11-24 15:45:10.568166
3709	07112416161534109	0%	326.12MB/2136.98MB : 15.26%	2024-11-24 15:45:36.821061
3710	07112416161534109	0%	326.12MB/2136.98MB : 15.26%	2024-11-24 15:45:45.85432
3711	07112416161534109	0%	326.12MB/2136.98MB : 15.26%	2024-11-24 15:46:12.079879
3712	07112416161534109	0%	326.12MB/2136.98MB : 15.26%	2024-11-24 15:46:21.131777
3713	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:46:47.558001
3714	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:46:58.562218
3715	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:47:22.866335
3716	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:47:33.886334
3717	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:47:58.163802
3718	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:48:09.160523
3719	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:48:33.543882
3720	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:48:44.456679
3721	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:49:08.810525
3722	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:49:19.741875
3723	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:49:44.112001
3724	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:49:55.006141
3725	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:50:19.391366
3726	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:50:30.257101
3727	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:50:54.671825
3728	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:51:05.536531
3729	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:51:29.94711
3730	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:51:40.822162
3731	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:52:05.209376
3732	07112416161534109	0%	326.24MB/2136.98MB : 15.27%	2024-11-24 15:52:16.111599
3733	07112416161534109	1%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:52:40.474109
3734	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:52:51.383178
3735	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:53:15.759776
3736	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:53:26.647918
3737	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:53:51.028965
3738	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:54:01.929798
3739	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:54:26.31834
3740	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:54:37.19201
3741	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:55:01.56822
3742	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:55:12.542888
3743	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:55:36.871934
3744	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:55:47.915965
3745	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:56:12.199435
3746	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:56:23.187489
3747	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:56:47.479998
3748	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:56:58.488296
3749	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:57:22.751676
3750	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:57:33.751605
3751	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:57:58.052078
3752	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:58:09.050595
3753	07112416161534109	0%	326.31MB/2136.98MB : 15.27%	2024-11-24 15:58:33.326196
3754	07112416161534109	0%	326.56MB/2136.98MB : 15.28%	2024-11-24 15:58:44.332756
3755	07112416161534109	0%	326.62MB/2136.98MB : 15.28%	2024-11-24 15:58:56.845394
3756	07112416161534109	0%	326.62MB/2136.98MB : 15.28%	2024-11-24 15:59:08.566289
3757	07112416161534109	1%	326.75MB/2136.98MB : 15.29%	2024-11-24 15:59:36.010261
3758	07112416161534109	1%	326.62MB/2136.98MB : 15.28%	2024-11-24 15:59:40.332351
3759	07112416161534109	0%	326.62MB/2136.98MB : 15.28%	2024-11-24 16:00:11.300349
3760	07112416161534109	1%	326.62MB/2136.98MB : 15.28%	2024-11-24 16:00:19.241713
3761	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:00:31.357181
3762	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:00:46.55626
3763	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:01:06.626505
3764	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:01:21.835502
3765	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:01:41.903295
3766	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:01:57.110708
3767	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:02:17.175775
3768	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:02:32.387815
3769	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:02:48.356714
3770	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:03:07.659931
3771	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:03:23.638671
3772	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:03:42.941422
3773	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-24 16:03:58.935541
3774	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:04:18.220824
3775	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:04:34.186974
3776	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:04:53.480447
3777	07112416161534109	1%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:05:09.448523
3778	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:05:28.78813
3779	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:05:44.720957
3780	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:06:04.086524
3781	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-24 16:06:11.414297
3782	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:06:39.365815
3783	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:06:46.672877
3784	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:07:14.642629
3785	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:07:21.979982
3786	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:07:49.933144
3787	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:07:57.250278
3788	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:08:25.227979
3789	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:08:32.539863
3790	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:09:00.498634
3791	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:09:07.856724
3792	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:09:35.760216
3793	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:09:43.118797
3794	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:10:11.077675
3795	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-24 16:10:18.385611
3796	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:10:46.336564
3797	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:10:53.650861
3798	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:11:04.232979
3799	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:11:21.601461
3800	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:11:39.513721
3801	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:11:56.888089
3802	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:12:05.693113
3803	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:12:32.143797
3804	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:12:41.021566
3805	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:13:07.423003
3806	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:13:16.261984
3807	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:13:42.683204
3808	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:13:51.524349
3809	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:14:17.982858
3810	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:14:26.782118
3811	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:14:53.255896
3812	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:15:02.044205
3813	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:15:28.516876
3814	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:15:37.331666
3815	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:16:03.786622
3816	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-24 16:16:10.795193
3817	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:16:33.651467
3818	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:16:39.048329
3819	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:16:44.910362
3820	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:16:54.980256
3821	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:17:14.313255
3822	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:17:30.296169
3823	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:17:49.596229
3824	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:18:05.571348
3825	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:18:24.861346
3826	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:18:40.834971
3827	07112416161534109	1%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:19:00.124344
3828	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:19:16.118094
3829	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:19:35.389492
3830	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:19:51.402167
3831	07112416161534109	1%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:20:10.666451
3832	07112416161534109	0%	327.00MB/2136.98MB : 15.30%	2024-11-24 16:20:26.685975
3833	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:20:45.974069
3834	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:21:01.973752
3835	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:21:21.273265
3836	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:21:37.245628
3837	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:21:56.536918
3838	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:22:12.539085
3839	07112416161534109	0%	327.12MB/2136.98MB : 15.31%	2024-11-24 16:22:31.822098
3840	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:22:47.831075
3841	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:23:07.097017
3842	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:23:23.13023
3843	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:23:42.383279
3844	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:23:58.401587
3845	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:24:17.666156
3846	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:24:33.674876
3847	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:24:52.947411
3848	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:25:08.941918
3849	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:25:28.225014
3850	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:25:44.235845
3851	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:26:03.522013
3852	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:26:19.50335
3853	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:26:38.79636
3854	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:26:54.772923
3855	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:27:14.098893
3856	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:27:28.623476
3857	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:27:49.384513
3858	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:28:03.982876
3859	07112416161534109	0%	327.18MB/2136.98MB : 15.31%	2024-11-24 16:28:21.14249
3860	07112416161534109	1%	327.32MB/2136.98MB : 15.32%	2024-11-24 16:28:24.663146
3861	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:28:56.415781
3862	07112416161534109	0%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:28:59.937666
3863	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:29:31.689809
3864	07112416161534109	0%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:29:35.193743
3865	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:30:06.953489
3866	07112416161534109	0%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:30:10.472213
3867	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:30:42.219691
3868	07112416161534109	0%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:30:45.738403
3869	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:31:17.52374
3870	07112416161534109	1%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:31:21.042466
3871	07112416161534109	1%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:31:24.010394
3872	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:31:56.333198
3873	07112416161534109	0%	327.39MB/2136.98MB : 15.32%	2024-11-24 16:31:59.306611
3874	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:32:12.586917
3875	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:32:25.626205
3876	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:32:31.605993
3877	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:33:00.927295
3878	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:33:06.869363
3879	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:33:36.287731
3880	07112416161534109	1%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:33:42.141946
3881	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:34:11.57664
3882	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:34:17.451392
3883	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:34:32.059329
3884	07112416161534109	0%	327.25MB/2136.98MB : 15.31%	2024-11-24 16:34:52.718719
3885	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:35:07.33734
3886	07112416161534109	0%	327.44MB/2136.98MB : 15.32%	2024-11-24 16:35:27.396287
3887	07112416161534109	0%	327.45MB/2136.98MB : 15.32%	2024-11-24 16:35:28.030397
3888	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:35:42.502984
3889	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:35:56.229351
3890	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:36:03.319826
3891	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:36:31.205194
3892	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:36:38.593737
3893	07112416161534109	0%	327.31MB/2136.98MB : 15.32%	2024-11-24 16:36:54.126642
3894	07112416161534109	0%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:37:13.858169
3895	07112416161534109	0%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:37:18.381965
3896	07112416161534109	0%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:37:49.177588
3897	07112416161534109	0%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:37:53.690139
3898	07112416161534109	1%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:38:24.461971
3899	07112416161534109	1%	327.56MB/2136.98MB : 15.33%	2024-11-24 16:38:28.969131
3900	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:38:52.174561
3901	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:38:59.766227
3902	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:39:27.467258
3903	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:39:35.023003
3904	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:39:46.231265
3905	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:40:10.379878
3906	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:40:21.503267
3907	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:40:45.646137
3908	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:40:56.779557
3909	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:41:20.917337
3910	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:41:32.060306
3911	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:41:56.175133
3912	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:42:07.350838
3913	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-24 16:42:31.44091
3914	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:42:42.605206
3915	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:43:06.72802
3916	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:43:17.967901
3917	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:43:41.992112
3918	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:43:53.258584
3919	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:44:17.269379
3920	07112416161534109	0%	327.75MB/2136.98MB : 15.34%	2024-11-24 16:44:28.532245
3921	07112416161534109	0%	327.81MB/2136.98MB : 15.34%	2024-11-24 16:44:52.551554
3922	07112416161534109	0%	327.81MB/2136.98MB : 15.34%	2024-11-24 16:45:03.80392
3923	07112416161534109	0%	327.81MB/2136.98MB : 15.34%	2024-11-24 16:45:27.854955
3924	07112416161534109	0%	327.87MB/2136.98MB : 15.34%	2024-11-24 16:45:39.085585
3925	07112416161534109	0%	322.59MB/2136.98MB : 15.10%	2024-11-24 16:48:05.702441
3926	07112416161534109	0%	323.14MB/2136.98MB : 15.12%	2024-11-24 16:48:24.490165
3927	07112416161534109	0%	323.15MB/2136.98MB : 15.12%	2024-11-24 16:48:40.986915
3928	07112416161534109	0%	323.53MB/2136.98MB : 15.14%	2024-11-24 16:48:59.767832
3929	07112416161534109	0%	323.58MB/2136.98MB : 15.14%	2024-11-24 16:49:16.304904
3930	07112416161534109	0%	323.64MB/2136.98MB : 15.14%	2024-11-24 16:49:35.058199
3931	07112416161534109	0%	323.73MB/2136.98MB : 15.15%	2024-11-24 16:49:51.5844
3932	07112416161534109	1%	323.73MB/2136.98MB : 15.15%	2024-11-24 16:50:10.338858
3933	07112416161534109	0%	323.73MB/2136.98MB : 15.15%	2024-11-24 16:50:26.88562
3934	07112416161534109	0%	323.73MB/2136.98MB : 15.15%	2024-11-24 16:50:45.61773
3935	07112416161534109	0%	323.73MB/2136.98MB : 15.15%	2024-11-24 16:51:02.202026
3936	07112416161534109	1%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:51:20.894047
3937	07112416161534109	0%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:51:37.488944
3938	07112416161534109	0%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:51:56.236478
3939	07112416161534109	0%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:52:12.76977
3940	07112416161534109	0%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:52:31.487138
3941	07112416161534109	0%	323.74MB/2136.98MB : 15.15%	2024-11-24 16:52:48.075428
3942	07112416161534109	0%	323.76MB/2136.98MB : 15.15%	2024-11-24 16:53:06.776743
3943	07112416161534109	0%	323.76MB/2136.98MB : 15.15%	2024-11-24 16:53:23.339715
3944	07112416161534109	0%	323.76MB/2136.98MB : 15.15%	2024-11-24 16:53:42.057375
3945	07112416161534109	0%	323.76MB/2136.98MB : 15.15%	2024-11-24 16:53:58.598308
3946	07112416161534109	0%	323.76MB/2136.98MB : 15.15%	2024-11-24 16:54:17.335079
3947	07112416161534109	1%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:54:33.874024
3948	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:54:52.629752
3949	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:55:09.174554
3950	07112416161534109	0%	324.00MB/2136.98MB : 15.16%	2024-11-24 16:55:27.925475
3951	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:55:44.460229
3952	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:56:03.202699
3953	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:56:19.736738
3954	07112416161534109	0%	323.89MB/2136.98MB : 15.16%	2024-11-24 16:56:38.466286
3955	07112416161534109	0%	323.89MB/2136.98MB : 15.16%	2024-11-24 16:56:55.020776
3956	07112416161534109	0%	323.89MB/2136.98MB : 15.16%	2024-11-24 16:57:13.747401
3957	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:57:30.294739
3958	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:57:49.023981
3959	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:58:05.565835
3960	07112416161534109	0%	323.88MB/2136.98MB : 15.16%	2024-11-24 16:58:24.31277
3961	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 16:58:40.840299
3962	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 16:58:59.620782
3963	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 16:59:16.107659
3964	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 16:59:34.900115
3965	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 16:59:51.375662
3966	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:00:10.207694
3967	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:00:26.702036
3968	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:00:45.552156
3969	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:01:02.004255
3970	07112416161534109	1%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:01:20.817485
3971	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:01:37.279839
3972	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:01:56.098902
3973	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:02:12.539288
3974	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:02:31.378936
3975	07112416161534109	0%	324.01MB/2136.98MB : 15.16%	2024-11-24 17:02:47.822384
3976	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:03:06.669176
3977	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:03:23.099667
3978	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:03:42.028482
3979	07112416161534109	0%	323.95MB/2136.98MB : 15.16%	2024-11-24 17:03:58.470569
3980	07112416161534109	0%	323.94MB/2136.98MB : 15.16%	2024-11-24 17:04:17.318809
3981	07112416161534109	0%	323.94MB/2136.98MB : 15.16%	2024-11-24 17:04:33.912831
3982	07112416161534109	0%	323.94MB/2136.98MB : 15.16%	2024-11-24 17:04:52.618953
3983	07112416161534109	0%	323.94MB/2136.98MB : 15.16%	2024-11-24 17:05:09.222564
3984	07112416161534109	0%	324.00MB/2136.98MB : 15.16%	2024-11-24 17:05:27.900584
3985	07112416161534109	0%	324.00MB/2136.98MB : 15.16%	2024-11-24 17:05:44.509767
3986	07112416161534109	0%	324.00MB/2136.98MB : 15.16%	2024-11-24 17:06:03.189368
3987	07112416161534109	0%	324.00MB/2136.98MB : 15.16%	2024-11-24 17:06:19.820758
3988	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:06:38.462333
3989	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:06:55.104037
3990	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:07:13.737696
3991	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:07:30.377359
3992	07112416161534109	1%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:07:49.032265
3993	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:08:05.658357
3994	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:08:24.285707
3995	07112416161534109	1%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:08:40.93741
3996	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:08:59.58943
3997	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:09:16.233424
3998	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:09:35.082019
3999	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:09:51.496723
4000	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:10:10.348043
4001	07112416161534109	0%	324.06MB/2136.98MB : 15.16%	2024-11-24 17:10:26.778909
4002	07112416161534109	1%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:10:45.641067
4003	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:11:02.027588
4004	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:11:20.923961
4005	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:11:37.338984
4006	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:11:56.171916
4007	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:12:12.605482
4008	07112416161534109	0%	324.12MB/2136.98MB : 15.17%	2024-11-24 17:12:31.46236
4009	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:12:47.915396
4010	07112416161534109	1%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:13:06.744346
4011	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:13:23.197075
4012	07112416161534109	1%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:13:42.020885
4013	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:13:58.501835
4014	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:14:17.33479
4015	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:14:33.805252
4016	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:14:52.649256
4017	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:15:09.069665
4018	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:15:27.927443
4019	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:15:44.341745
4020	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:16:03.208969
4021	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:16:19.66807
4022	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:16:38.457472
4023	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:16:54.93565
4024	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:17:13.851527
4025	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:17:30.201515
4026	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:17:49.171408
4027	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:18:05.496048
4028	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:18:24.472049
4029	07112416161534109	0%	324.19MB/2136.98MB : 15.17%	2024-11-24 17:18:40.768922
4030	07112416161534109	0%	324.31MB/2136.98MB : 15.18%	2024-11-24 17:18:59.767378
4031	07112416161534109	0%	323.44MB/2136.98MB : 15.14%	2024-11-27 17:03:58.048468
4032	07112416161534109	0%	323.46MB/2136.98MB : 15.14%	2024-11-27 17:03:58.745163
4033	07112416161534109	0%	323.77MB/2136.98MB : 15.15%	2024-11-27 17:04:33.312265
4034	07112416161534109	0%	323.78MB/2136.98MB : 15.15%	2024-11-27 17:04:34.025701
4035	07112416161534109	0%	323.89MB/2136.98MB : 15.16%	2024-11-27 17:05:08.602586
4036	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:05:09.284151
4037	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:05:43.872549
4038	07112416161534109	0%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:05:44.550953
4039	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:06:19.141147
4040	07112416161534109	1%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:06:19.823079
4041	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:06:54.433793
4042	07112416161534109	1%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:06:55.099853
4043	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:07:29.71933
4044	07112416161534109	0%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:07:30.369481
4045	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:08:04.97137
4046	07112416161534109	0%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:08:05.635816
4047	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:08:40.259703
4048	07112416161534109	0%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:08:40.894251
4049	07112416161534109	1%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:09:15.543733
4050	07112416161534109	1%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:09:16.178238
4051	07112416161534109	0%	323.91MB/2136.98MB : 15.16%	2024-11-27 17:09:50.830857
4052	07112416161534109	0%	323.92MB/2136.98MB : 15.16%	2024-11-27 17:09:51.497299
4053	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:10:26.104504
4054	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:10:26.753966
4055	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:11:01.386855
4056	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:11:02.021069
4057	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:11:36.667493
4058	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:11:37.318031
4059	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:12:11.974067
4060	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:12:12.592714
4061	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:12:47.260975
4062	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:12:47.927377
4063	07112416161534109	0%	324.04MB/2136.98MB : 15.16%	2024-11-27 17:13:22.540726
4064	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:13:23.206379
4065	07112416161534109	0%	324.03MB/2136.98MB : 15.16%	2024-11-27 17:13:57.807697
4066	07112416161534109	0%	324.05MB/2136.98MB : 15.16%	2024-11-27 17:13:58.489317
4067	07112416161534109	0%	324.10MB/2136.98MB : 15.17%	2024-11-27 17:14:33.091048
4068	07112416161534109	0%	324.11MB/2136.98MB : 15.17%	2024-11-27 17:14:33.787842
4069	07112416161534109	0%	324.10MB/2136.98MB : 15.17%	2024-11-27 17:15:08.359211
4070	07112416161534109	0%	324.11MB/2136.98MB : 15.17%	2024-11-27 17:15:09.05547
4071	07112416161534109	0%	324.10MB/2136.98MB : 15.17%	2024-11-27 17:15:43.63309
4072	07112416161534109	0%	324.11MB/2136.98MB : 15.17%	2024-11-27 17:15:44.328812
4073	07112416161534109	0%	324.16MB/2136.98MB : 15.17%	2024-11-27 17:16:18.898034
4074	07112416161534109	0%	324.17MB/2136.98MB : 15.17%	2024-11-27 17:16:19.625927
4075	07112416161534109	0%	324.16MB/2136.98MB : 15.17%	2024-11-27 17:16:54.165086
4076	07112416161534109	0%	324.17MB/2136.98MB : 15.17%	2024-11-27 17:16:54.873707
4077	07112416161534109	0%	324.16MB/2136.98MB : 15.17%	2024-11-27 17:17:29.447463
4078	07112416161534109	1%	324.17MB/2136.98MB : 15.17%	2024-11-27 17:17:30.128164
4079	07112416161534109	0%	324.16MB/2136.98MB : 15.17%	2024-11-27 17:18:04.741849
4080	07112416161534109	0%	324.17MB/2136.98MB : 15.17%	2024-11-27 17:18:05.545292
4081	07112416161534109	1%	324.16MB/2136.98MB : 15.17%	2024-11-27 17:18:40.003053
4082	07112416161534109	1%	324.17MB/2136.98MB : 15.17%	2024-11-27 17:18:40.792987
4083	07112416161534109	0%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:19:15.270503
4084	07112416161534109	0%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:19:16.055597
4085	07112416161534109	1%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:19:50.580582
4086	07112416161534109	1%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:19:51.339487
4087	07112416161534109	0%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:20:25.865337
4088	07112416161534109	0%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:20:26.6055
4089	07112416161534109	0%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:21:01.142141
4090	07112416161534109	0%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:21:01.884631
4091	07112416161534109	0%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:21:36.415344
4092	07112416161534109	0%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:21:37.156335
4093	07112416161534109	0%	324.18MB/2136.98MB : 15.17%	2024-11-27 17:22:11.709741
4094	07112416161534109	0%	324.20MB/2136.98MB : 15.17%	2024-11-27 17:22:12.423139
4095	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:22:46.967904
4096	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:22:47.709145
4097	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:23:22.257394
4098	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:23:22.98493
4099	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:23:57.55125
4100	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:23:58.279591
4101	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:24:32.859188
4102	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:24:33.612581
4103	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:25:08.143998
4104	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:25:08.901166
4105	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:25:43.425704
4106	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:25:44.183938
4107	07112416161534109	0%	324.25MB/2136.98MB : 15.17%	2024-11-27 17:26:18.697924
4108	07112416161534109	0%	324.26MB/2136.98MB : 15.17%	2024-11-27 17:26:19.456329
4109	07112416161534109	0%	324.31MB/2136.98MB : 15.18%	2024-11-27 17:26:53.989033
4110	07112416161534109	0%	324.32MB/2136.98MB : 15.18%	2024-11-27 17:26:54.733427
4111	07112416161534109	0%	324.31MB/2136.98MB : 15.18%	2024-11-27 17:27:29.273623
4112	07112416161534109	0%	324.32MB/2136.98MB : 15.18%	2024-11-27 17:27:30.028237
4113	07112416161534109	0%	324.31MB/2136.98MB : 15.18%	2024-11-27 17:28:04.602026
4114	07112416161534109	1%	324.32MB/2136.98MB : 15.18%	2024-11-27 17:28:05.31597
4115	07112416161534109	0%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:28:39.877965
4116	07112416161534109	0%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:28:40.590423
4117	07112416161534109	0%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:29:15.145759
4118	07112416161534109	0%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:29:15.875025
4119	07112416161534109	0%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:29:50.43344
4120	07112416161534109	0%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:29:51.161146
4121	07112416161534109	1%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:30:25.716996
4122	07112416161534109	1%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:30:26.459002
4123	07112416161534109	0%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:31:01.025769
4124	07112416161534109	0%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:31:01.736944
4125	07112416161534109	1%	324.37MB/2136.98MB : 15.18%	2024-11-27 17:31:36.304274
4126	07112416161534109	1%	324.38MB/2136.98MB : 15.18%	2024-11-27 17:31:37.032597
4127	07112416161534109	0%	324.43MB/2136.98MB : 15.18%	2024-11-27 17:32:11.586824
4128	07112416161534109	0%	324.45MB/2136.98MB : 15.18%	2024-11-27 17:32:12.283069
4129	07112416161534109	0%	324.43MB/2136.98MB : 15.18%	2024-11-27 17:32:46.86587
4130	07112416161534109	0%	324.45MB/2136.98MB : 15.18%	2024-11-27 17:32:47.609184
4131	07112416161534109	0%	324.50MB/2136.98MB : 15.18%	2024-11-27 17:33:22.112275
4132	07112416161534109	0%	324.51MB/2136.98MB : 15.19%	2024-11-27 17:33:22.902078
4133	07112416161534109	0%	324.50MB/2136.98MB : 15.18%	2024-11-27 17:33:57.384599
4134	07112416161534109	0%	324.51MB/2136.98MB : 15.19%	2024-11-27 17:33:58.189308
4135	07112416161534109	0%	324.52MB/2136.98MB : 15.19%	2024-11-27 17:34:32.644477
4136	07112416161534109	0%	324.53MB/2136.98MB : 15.19%	2024-11-27 17:34:33.464927
4137	07112416161534109	0%	324.83MB/2136.98MB : 15.20%	2024-11-27 17:35:07.919976
4138	07112416161534109	0%	324.84MB/2136.98MB : 15.20%	2024-11-27 17:35:08.73944
4139	07112416161534109	0%	324.83MB/2136.98MB : 15.20%	2024-11-27 17:35:43.240629
4140	07112416161534109	0%	324.84MB/2136.98MB : 15.20%	2024-11-27 17:35:44.060801
4141	07112416161534109	0%	324.83MB/2136.98MB : 15.20%	2024-11-27 17:36:18.515592
4142	07112416161534109	0%	324.84MB/2136.98MB : 15.20%	2024-11-27 17:36:19.334622
4143	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:36:53.787332
4144	07112416161534109	0%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:36:54.606248
4145	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:37:29.07619
4146	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:37:29.8805
4147	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:38:04.372806
4148	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:38:05.161237
4149	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:38:39.649895
4150	07112416161534109	0%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:38:40.485533
4151	07112416161534109	1%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:39:14.917159
4152	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:39:15.782739
4153	07112416161534109	1%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:39:50.191142
4154	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:39:51.055111
4155	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:40:25.472697
4156	07112416161534109	0%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:40:26.32328
4157	07112416161534109	0%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:41:00.751444
4158	07112416161534109	0%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:41:01.585217
4159	07112416161534109	1%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:41:36.026144
4160	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:41:36.863664
4161	07112416161534109	1%	324.97MB/2136.98MB : 15.21%	2024-11-27 17:42:11.320518
4162	07112416161534109	1%	324.98MB/2136.98MB : 15.21%	2024-11-27 17:42:12.125818
4163	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:42:46.599624
4164	07112416161534109	0%	325.11MB/2136.98MB : 15.21%	2024-11-27 17:42:47.391893
4165	07112416161534109	0%	325.09MB/2136.98MB : 15.21%	2024-11-27 17:43:21.887875
4166	07112416161534109	0%	325.11MB/2136.98MB : 15.21%	2024-11-27 17:43:22.660737
4167	07112416161534109	0%	325.09MB/2136.98MB : 15.21%	2024-11-27 17:43:57.1417
4168	07112416161534109	0%	325.11MB/2136.98MB : 15.21%	2024-11-27 17:43:57.929643
4169	07112416161534109	0%	325.09MB/2136.98MB : 15.21%	2024-11-27 17:44:32.418168
4170	07112416161534109	0%	325.09MB/2136.98MB : 15.21%	2024-11-27 17:44:33.191006
4171	07112416161534109	0%	325.09MB/2136.98MB : 15.21%	2024-11-27 17:45:07.711784
4172	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:45:08.484017
4173	07112416161534109	0%	325.08MB/2136.98MB : 15.21%	2024-11-27 17:45:42.980554
4174	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:45:43.739134
4175	07112416161534109	0%	325.08MB/2136.98MB : 15.21%	2024-11-27 17:46:18.244212
4176	07112416161534109	0%	325.08MB/2136.98MB : 15.21%	2024-11-27 17:47:19.563618
4177	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:47:20.259266
4178	07112416161534109	1%	325.08MB/2136.98MB : 15.21%	2024-11-27 17:47:54.84154
4179	07112416161534109	1%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:47:55.55367
4180	07112416161534109	1%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:48:30.11892
4181	07112416161534109	1%	325.16MB/2136.98MB : 15.22%	2024-11-27 17:48:30.829414
4182	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:49:05.382546
4183	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-27 17:49:06.123639
4184	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:49:23.011858
4185	07112416161534109	1%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:49:40.672841
4186	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:49:58.265869
4187	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:50:15.95296
4188	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:50:30.91346
4189	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:50:51.240571
4190	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-27 17:51:02.931123
4191	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:51:26.525754
4192	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:51:38.184489
4193	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:52:01.7929
4194	07112416161534109	1%	325.16MB/2136.98MB : 15.22%	2024-11-27 17:52:05.24653
4195	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:52:20.112909
4196	07112416161534109	0%	325.02MB/2136.98MB : 15.21%	2024-11-27 17:52:35.029838
4197	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-27 17:52:37.057452
4198	07112416161534109	0%	324.96MB/2136.98MB : 15.21%	2024-11-27 17:53:04.903741
4199	07112416161534109	0%	324.96MB/2136.98MB : 15.21%	2024-11-27 17:53:12.342151
4200	07112416161534109	1%	325.22MB/2136.98MB : 15.22%	2024-11-27 17:53:15.813364
4201	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 17:55:41.366542
4202	07112416161534109	0%	325.28MB/2136.98MB : 15.22%	2024-11-27 17:55:42.045235
4203	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:56:03.696599
4204	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:56:16.632998
4205	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:56:24.11708
4206	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:56:31.769947
4207	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:56:51.881792
4208	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:57:07.036581
4209	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:57:17.465981
4210	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:57:27.172576
4211	07112416161534109	1%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:57:34.791593
4212	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:58:02.436554
4213	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 17:58:16.055529
4214	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 17:58:36.737216
4215	07112416161534109	0%	325.28MB/2136.98MB : 15.22%	2024-11-27 17:58:37.709579
4216	07112416161534109	1%	325.32MB/2136.98MB : 15.22%	2024-11-27 17:59:11.14972
4217	07112416161534109	1%	325.29MB/2136.98MB : 15.22%	2024-11-27 17:59:13.005997
4218	07112416161534109	0%	325.28MB/2136.98MB : 15.22%	2024-11-27 17:59:23.013401
4219	07112416161534109	0%	325.29MB/2136.98MB : 15.22%	2024-11-27 17:59:23.722973
4220	07112416161534109	1%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:59:43.018814
4221	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 17:59:58.293652
4222	07112416161534109	0%	325.15MB/2136.98MB : 15.22%	2024-11-27 18:00:08.314025
4223	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-27 18:00:33.562176
4224	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:00:43.585137
4225	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:01:08.843476
4226	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:01:18.868498
4227	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:01:44.116379
4228	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:01:54.135982
4229	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:02:08.440361
4230	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:02:19.385193
4231	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:02:37.217041
4232	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:02:54.654665
4233	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:03:06.312882
4234	07112416161534109	1%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:03:20.286583
4235	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:03:29.937085
4236	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:03:55.550458
4237	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:04:05.213951
4238	07112416161534109	0%	325.27MB/2136.98MB : 15.22%	2024-11-27 18:04:30.870782
4239	07112416161534109	2%	325.51MB/2136.98MB : 15.23%	2024-11-27 18:04:40.462938
4240	07112416161534109	2%	325.53MB/2136.98MB : 15.23%	2024-11-27 18:04:40.524577
4241	07112416161534109	1%	325.40MB/2136.98MB : 15.23%	2024-11-27 18:05:15.778527
4242	07112416161534109	1%	325.42MB/2136.98MB : 15.23%	2024-11-27 18:05:15.793525
4243	07112416161534109	0%	325.40MB/2136.98MB : 15.23%	2024-11-27 18:05:51.053699
4244	07112416161534109	0%	325.41MB/2136.98MB : 15.23%	2024-11-27 18:05:51.08486
4245	07112416161534109	1%	325.40MB/2136.98MB : 15.23%	2024-11-27 18:06:26.357747
4246	07112416161534109	1%	325.41MB/2136.98MB : 15.23%	2024-11-27 18:06:26.373077
4247	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:07:01.643149
4248	07112416161534109	0%	325.47MB/2136.98MB : 15.23%	2024-11-27 18:07:01.673699
4249	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:07:36.929267
4250	07112416161534109	0%	325.48MB/2136.98MB : 15.23%	2024-11-27 18:07:36.960224
4251	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:08:12.225383
4252	07112416161534109	0%	325.47MB/2136.98MB : 15.23%	2024-11-27 18:08:12.24013
4253	07112416161534109	1%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:08:47.531998
4254	07112416161534109	1%	325.47MB/2136.98MB : 15.23%	2024-11-27 18:08:47.563001
4255	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:09:22.814492
4256	07112416161534109	0%	325.47MB/2136.98MB : 15.23%	2024-11-27 18:09:22.829993
4257	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:09:58.12104
4258	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:10:04.276722
4259	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:10:33.38867
4260	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:10:39.557135
4261	07112416161534109	0%	325.41MB/2136.98MB : 15.23%	2024-11-27 18:11:08.651123
4262	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:11:14.841739
4263	07112416161534109	1%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:11:43.913513
4264	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:11:50.122573
4265	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:12:19.192974
4266	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:12:25.381244
4267	07112416161534109	0%	325.33MB/2136.98MB : 15.22%	2024-11-27 18:12:54.441518
4268	07112416161534109	0%	325.39MB/2136.98MB : 15.23%	2024-11-27 18:13:02.566243
4269	07112416161534109	0%	325.39MB/2136.98MB : 15.23%	2024-11-27 18:13:28.52548
4270	07112416161534109	0%	325.53MB/2136.98MB : 15.23%	2024-11-27 18:13:29.743862
4271	07112416161534109	0%	325.39MB/2136.98MB : 15.23%	2024-11-27 18:14:03.820667
4272	07112416161534109	1%	325.53MB/2136.98MB : 15.23%	2024-11-27 18:14:05.025177
4273	07112416161534109	0%	325.39MB/2136.98MB : 15.23%	2024-11-27 18:14:39.077793
4274	07112416161534109	1%	325.53MB/2136.98MB : 15.23%	2024-11-27 18:14:40.29821
4275	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:15:14.346239
4276	07112416161534109	1%	325.60MB/2136.98MB : 15.24%	2024-11-27 18:15:15.567678
4277	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:15:46.689234
4278	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:15:50.827224
4279	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:16:04.952308
4280	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:16:26.084585
4281	07112416161534109	1%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:16:40.228819
4282	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:16:49.399175
4283	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:17:01.356698
4284	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:17:24.667962
4285	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:17:36.657759
4286	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:17:59.93952
4287	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:18:11.917242
4288	07112416161534109	0%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:18:35.212054
4289	07112416161534109	1%	325.46MB/2136.98MB : 15.23%	2024-11-27 18:18:47.186601
4290	07112416161534109	0%	325.89MB/2136.98MB : 15.25%	2024-11-27 18:19:10.510573
4291	07112416161534109	0%	325.96MB/2136.98MB : 15.25%	2024-11-27 18:19:22.47372
4292	07112416161534109	0%	326.02MB/2136.98MB : 15.26%	2024-11-27 18:19:45.790533
4293	07112416161534109	0%	326.02MB/2136.98MB : 15.26%	2024-11-27 18:19:57.732761
4294	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:20:21.057015
4295	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:20:32.995779
4296	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:20:56.320527
4297	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:21:08.271545
4298	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:21:31.592132
4299	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:21:43.559094
4300	07112416161534109	2%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:22:06.857757
4301	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:22:18.806921
4302	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:22:42.117659
4303	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:22:54.072641
4304	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:23:17.418444
4305	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:23:29.335989
4306	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:23:52.699127
4307	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:24:04.604039
4308	07112416161534109	0%	326.15MB/2136.98MB : 15.26%	2024-11-27 18:24:27.987406
4309	07112416161534109	0%	326.15MB/2136.98MB : 15.26%	2024-11-27 18:24:39.886155
4310	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:25:03.282907
4311	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:25:15.166912
4312	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:25:38.568744
4313	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:25:50.433522
4314	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:26:13.843169
4315	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:26:25.694303
4316	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:26:49.11749
4317	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:27:00.971248
4318	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:27:24.384728
4319	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:27:36.235101
4320	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:27:59.659485
4321	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:28:11.526263
4322	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:28:34.940521
4323	07112416161534109	0%	326.21MB/2136.98MB : 15.26%	2024-11-27 18:28:46.802707
4324	07112416161534109	1%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:29:10.208686
4325	07112416161534109	0%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:29:22.08065
4326	07112416161534109	0%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:29:45.497173
4327	07112416161534109	0%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:29:57.356549
4328	07112416161534109	0%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:30:20.754953
4329	07112416161534109	0%	326.21MB/2136.98MB : 15.27%	2024-11-27 18:30:32.620159
4330	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:30:56.014864
4331	07112416161534109	1%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:31:07.879491
4332	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:31:31.297965
4333	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:31:43.167462
4334	07112416161534109	1%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:32:06.572305
4335	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:32:18.436089
4336	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:32:41.845799
4337	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:32:53.69608
4338	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:33:17.1119
4339	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:33:28.973985
4340	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:33:52.386694
4341	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:34:04.226152
4342	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:34:26.639034
4343	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:34:39.485011
4344	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:35:01.908994
4345	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:35:14.76327
4346	07112416161534109	0%	326.34MB/2136.98MB : 15.27%	2024-11-27 18:35:37.182289
4347	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:35:50.038194
4348	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:36:12.462021
4349	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:36:25.332967
4350	07112416161534109	0%	326.33MB/2136.98MB : 15.27%	2024-11-27 18:36:47.760453
4351	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:37:00.623523
4352	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:37:23.063839
4353	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:37:35.89376
4354	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:37:58.340283
4355	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:38:11.157475
4356	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:38:33.623252
4357	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:38:46.439803
4358	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:39:08.902996
4359	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:39:21.714736
4360	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:39:44.170351
4361	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:39:56.985374
4362	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:40:19.431566
4363	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:40:32.297588
4364	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:40:47.586757
4365	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:41:07.578854
4366	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:41:22.879471
4367	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:41:42.86272
4368	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:41:58.16778
4369	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:42:18.156688
4370	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:42:33.447533
4371	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:42:53.445627
4372	07112416161534109	0%	326.46MB/2136.98MB : 15.28%	2024-11-27 18:43:08.72015
4373	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:43:28.713228
4374	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:43:44.004741
4375	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:44:03.960844
4376	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:44:19.290124
4377	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:44:39.233552
4378	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:44:54.588939
4379	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:45:14.511836
4380	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:45:29.864243
4381	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:45:49.78882
4382	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:46:05.135381
4383	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:46:25.068859
4384	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:46:40.429941
4385	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:47:00.387073
4386	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:47:15.688217
4387	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:47:35.64764
4388	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:47:50.965506
4389	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:48:10.909852
4390	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:48:26.230583
4391	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:48:46.176702
4392	07112416161534109	0%	326.52MB/2136.98MB : 15.28%	2024-11-27 18:49:01.518837
4393	07112416161534109	0%	326.77MB/2136.98MB : 15.29%	2024-11-27 18:49:21.457638
4394	07112416161534109	0%	326.77MB/2136.98MB : 15.29%	2024-11-27 18:49:36.811499
4395	07112416161534109	0%	326.90MB/2136.98MB : 15.30%	2024-11-27 18:49:56.721225
4396	07112416161534109	0%	326.90MB/2136.98MB : 15.30%	2024-11-27 18:50:12.072668
4397	07112416161534109	0%	326.90MB/2136.98MB : 15.30%	2024-11-27 18:50:31.988395
4398	07112416161534109	0%	326.90MB/2136.98MB : 15.30%	2024-11-27 18:50:47.350093
4399	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:51:07.246188
4400	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:51:22.630522
4401	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:51:42.544005
4402	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:51:57.917083
4403	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:52:17.845127
4404	07112416161534109	0%	326.96MB/2136.98MB : 15.30%	2024-11-27 18:52:33.20502
4405	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:52:53.162748
4406	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:53:08.48997
4407	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:53:28.430144
4408	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:53:43.76114
4409	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:54:03.704199
4410	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:54:19.034759
4411	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:54:38.979655
4412	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:54:54.297586
4413	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:55:14.262975
4414	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:55:29.586114
4415	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:55:49.525894
4416	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:56:04.856755
4417	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:56:24.825942
4418	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:56:40.124709
4419	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:57:00.126914
4420	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:57:15.396492
4421	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:57:35.40947
4422	07112416161534109	0%	327.02MB/2136.98MB : 15.30%	2024-11-27 18:57:50.671484
4423	07112416161534109	0%	328.59MB/2136.98MB : 15.38%	2024-11-27 18:58:10.690704
4424	07112416161534109	0%	328.59MB/2136.98MB : 15.38%	2024-11-27 18:58:26.075647
4425	07112416161534109	0%	328.59MB/2136.98MB : 15.38%	2024-11-27 18:58:45.965571
4426	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 18:59:01.359183
4427	07112416161534109	1%	328.72MB/2136.98MB : 15.38%	2024-11-27 18:59:21.236239
4428	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 18:59:36.664807
4429	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 18:59:56.529389
4430	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:00:11.968218
4431	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:00:31.826392
4432	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:00:47.28888
4433	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:01:07.115012
4434	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:01:22.603684
4435	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:01:42.411457
4436	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:01:57.910648
4437	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:02:17.731394
4438	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:02:33.217634
4439	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:02:53.022279
4440	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:03:08.49272
4441	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:03:28.29595
4442	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:03:43.767308
4443	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:04:03.558465
4444	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:04:19.05148
4445	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:04:38.826673
4446	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:04:54.324697
4447	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:05:14.084572
4448	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:05:29.605707
4449	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:05:49.365899
4450	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:06:04.890429
4451	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:06:24.659726
4452	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:06:40.166074
4453	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:06:59.932667
4454	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:07:15.445271
4455	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:07:35.1927
4456	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:07:50.725926
4457	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:08:10.478433
4458	07112416161534109	1%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:08:25.968556
4459	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:08:45.745382
4460	07112416161534109	0%	328.72MB/2136.98MB : 15.38%	2024-11-27 19:09:01.235031
4461	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:09:21.024222
4462	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:09:36.503126
4463	07112416161534109	1%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:09:56.313467
4464	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:10:11.768732
4465	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:10:31.597009
4466	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:10:47.024997
4467	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:11:06.881037
4468	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:11:22.314461
4469	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:11:42.174243
4470	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:11:57.620641
4471	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:12:17.449611
4472	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:12:32.902216
4473	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:12:52.716397
4474	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:13:08.196817
4475	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:13:27.995582
4476	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:13:43.459872
4477	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:14:03.271144
4478	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:14:18.739897
4479	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:14:38.549717
4480	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:14:54.018073
4481	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:15:13.865818
4482	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:15:29.294965
4483	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:15:49.173923
4484	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:16:04.576328
4485	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:16:20.845349
4486	07112416161534109	0%	328.92MB/2136.98MB : 15.39%	2024-11-27 19:16:24.461028
4487	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:16:44.021995
4488	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:16:59.740429
4489	07112416161534109	0%	328.78MB/2136.98MB : 15.39%	2024-11-27 19:17:19.303074
4490	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:17:35.010067
4491	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:17:42.076873
4492	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:18:10.322327
4493	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:18:17.37383
4494	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:18:45.602148
4495	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:18:52.663729
4496	07112416161534109	0%	328.85MB/2136.98MB : 15.39%	2024-11-27 19:19:20.877693
4497	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:19:27.9653
4498	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:19:56.178854
4499	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:20:03.242101
4500	07112416161534109	1%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:20:31.453742
4501	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:20:38.513006
4502	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:21:06.746287
4503	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:21:13.828946
4504	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:21:42.043637
4505	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:21:49.130047
4506	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:22:17.307866
4507	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:22:24.419218
4508	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:22:52.555119
4509	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:22:59.69324
4510	07112416161534109	0%	328.91MB/2136.98MB : 15.39%	2024-11-27 19:23:27.83294
4511	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:23:34.970789
4512	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:24:03.086679
4513	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:24:10.249431
4514	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:24:38.370748
4515	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:24:45.542266
4516	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:25:07.723228
4517	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:25:13.641331
4518	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:25:43.002986
4519	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:25:48.930623
4520	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:26:18.287194
4521	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:26:24.225932
4522	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:26:48.626282
4523	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:26:58.32376
4524	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:26:59.542078
4525	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:27:33.61147
4526	07112416161534109	1%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:27:34.816941
4527	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:27:44.109815
4528	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:28:07.318007
4529	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:28:10.080035
4530	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:28:24.227043
4531	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:28:45.358751
4532	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:28:59.518196
4533	07112416161534109	1%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:29:20.664106
4534	07112416161534109	0%	328.97MB/2136.98MB : 15.39%	2024-11-27 19:29:34.776296
4535	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:29:55.936403
4536	07112416161534109	1%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:30:10.046543
4537	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:30:31.226302
4538	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:30:45.319321
4539	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:31:06.503151
4540	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:31:20.580112
4541	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:31:41.763681
4542	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:31:55.845601
4543	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:32:17.075525
4544	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:32:31.130748
4545	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:32:40.903394
4546	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:32:52.337019
4547	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:33:08.292649
4548	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:33:27.610371
4549	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:33:43.582649
4550	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:34:02.882204
4551	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:34:18.86591
4552	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:34:38.176808
4553	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:34:54.171692
4554	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:35:13.494318
4555	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:35:29.45895
4556	07112416161534109	0%	329.03MB/2136.98MB : 15.40%	2024-11-27 19:35:48.757085
4557	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:36:04.759924
4558	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:36:24.042461
4559	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:36:40.039165
4560	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:36:59.315852
4561	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:37:15.326004
4562	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:37:34.613623
4563	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:37:51.554489
4564	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:38:09.892041
4565	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:38:19.118388
4566	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:38:36.276129
4567	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:38:45.167631
4568	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:38:58.540504
4569	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:39:15.446237
4570	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:39:20.452043
4571	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:39:50.722891
4572	07112416161534109	0%	329.10MB/2136.98MB : 15.40%	2024-11-27 19:39:55.741097
4573	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:40:26.051665
4574	07112416161534109	1%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:40:31.076166
4575	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:41:01.382911
4576	07112416161534109	1%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:41:06.400817
4577	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:41:36.696355
4578	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:41:41.686059
4579	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:42:11.977321
4580	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:42:16.969143
4581	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:42:47.252322
4582	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:42:52.255968
4583	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:43:22.525082
4584	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:43:27.499711
4585	07112416161534109	0%	329.22MB/2136.98MB : 15.41%	2024-11-27 19:43:57.816806
4586	07112416161534109	0%	329.28MB/2136.98MB : 15.41%	2024-11-27 19:44:02.759327
4587	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:44:33.095641
4588	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:44:38.024441
4589	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:45:08.388678
4590	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:45:13.301221
4591	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:45:43.658143
4592	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:45:48.584479
4593	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:46:18.948681
4594	07112416161534109	1%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:46:23.863569
4595	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:46:54.237167
4596	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:46:59.149587
4597	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:47:29.527872
4598	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:47:34.435066
4599	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:48:04.81307
4600	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:48:09.724157
4601	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:48:40.102854
4602	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:48:45.005746
4603	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:49:15.407568
4604	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:49:20.323643
4605	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:49:50.70291
4606	07112416161534109	0%	329.11MB/2136.98MB : 15.40%	2024-11-27 19:49:55.646279
4607	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:50:25.982039
4608	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:50:30.946553
4609	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:51:01.252212
4610	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:51:06.210961
4611	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:51:36.541718
4612	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:51:41.503014
4613	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:52:11.790453
4614	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:52:16.745889
4615	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:52:47.066491
4616	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:52:52.016077
4617	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:53:22.353081
4618	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:53:27.3671
4619	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:53:57.624576
4620	07112416161534109	1%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:54:02.65684
4621	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:54:32.899994
4622	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:54:37.926138
4623	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:55:08.206873
4624	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:55:13.211222
4625	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:55:43.515471
4626	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:55:48.520976
4627	07112416161534109	0%	329.18MB/2136.98MB : 15.40%	2024-11-27 19:56:18.840647
4628	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:56:23.874843
4629	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:56:54.105728
4630	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:56:59.175246
4631	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:57:11.389393
4632	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:57:34.48626
4633	07112416161534109	0%	329.38MB/2136.98MB : 15.41%	2024-11-27 19:57:38.254453
4634	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:57:57.797031
4635	07112416161534109	0%	329.24MB/2136.98MB : 15.41%	2024-11-27 19:58:09.782057
4636	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:58:27.480858
4637	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:58:35.655138
4638	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:58:45.083358
4639	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:59:10.92973
4640	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:59:20.377254
4641	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:59:44.914536
4642	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 19:59:55.667618
4643	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:00:20.237176
4644	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:00:30.958813
4645	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:00:55.595798
4646	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:01:06.251569
4647	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:01:30.878319
4648	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:01:37.542606
4649	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:01:41.568992
4650	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:02:12.84557
4651	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:02:16.842838
4652	07112416161534109	0%	329.36MB/2136.98MB : 15.41%	2024-11-27 20:02:26.319882
4653	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:02:52.131921
4654	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:03:01.605472
4655	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:03:16.301275
4656	07112416161534109	1%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:03:25.849748
4657	07112416161534109	1%	329.56MB/2136.98MB : 15.42%	2024-11-27 20:03:27.408014
4658	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:03:33.301834
4659	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:03:39.520321
4660	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:04:02.708601
4661	07112416161534109	1%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:04:19.22175
4662	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:04:37.986556
4663	07112416161534109	1%	329.56MB/2136.98MB : 15.42%	2024-11-27 20:04:40.540391
4664	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:04:49.451568
4665	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:05:13.269348
4666	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:05:24.746499
4667	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:05:48.534139
4668	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:06:00.026454
4669	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:06:23.814084
4670	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:06:35.307642
4671	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:06:59.102058
4672	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:07:10.586352
4673	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:07:34.382861
4674	07112416161534109	1%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:07:45.868701
4675	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:08:09.661294
4676	07112416161534109	0%	329.43MB/2136.98MB : 15.42%	2024-11-27 20:08:21.152568
4677	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:08:44.955667
4678	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:08:56.448969
4679	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:09:20.229274
4680	07112416161534109	0%	329.49MB/2136.98MB : 15.42%	2024-11-27 20:09:27.821902
4681	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:09:55.50745
4682	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:10:03.141205
4683	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:10:14.507358
4684	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:10:30.791284
4685	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:10:49.775034
4686	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:11:06.078033
4687	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:11:25.045394
4688	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:11:41.364883
4689	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:12:00.361775
4690	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:12:16.610467
4691	07112416161534109	0%	329.53MB/2136.98MB : 15.42%	2024-11-27 20:12:35.620671
4692	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:12:51.904276
4693	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:13:10.8931
4694	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:13:27.201118
4695	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:13:46.165468
4696	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:14:02.479416
4697	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:14:21.455642
4698	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:14:37.764463
4699	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:14:56.768137
4700	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:15:13.06414
4701	07112416161534109	1%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:15:32.126901
4702	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:15:48.44511
4703	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:16:07.450472
4704	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:16:23.909076
4705	07112416161534109	0%	329.65MB/2136.98MB : 15.43%	2024-11-27 20:16:42.754577
4706	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:16:59.282362
4707	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:17:18.048848
4708	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:17:34.564378
4709	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:17:53.324999
4710	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:18:09.894274
4711	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:18:28.637775
4712	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:18:45.22338
4713	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:19:03.922735
4714	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:19:20.503929
4715	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:19:39.22377
4716	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:19:55.790946
4717	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:20:14.500512
4718	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:20:31.09972
4719	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:20:49.773899
4720	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:21:06.397771
4721	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:21:25.073009
4722	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:21:41.682148
4723	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:22:00.440433
4724	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:22:16.97185
4725	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:22:35.73582
4726	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:22:52.25865
4727	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:23:11.013489
4728	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:23:27.532747
4729	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:23:46.29882
4730	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:24:02.816858
4731	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:24:21.585817
4732	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:24:38.076515
4733	07112416161534109	0%	329.78MB/2136.98MB : 15.43%	2024-11-27 20:24:56.870546
4734	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:25:13.396594
4735	07112416161534109	0%	329.84MB/2136.98MB : 15.43%	2024-11-27 20:25:32.165901
4736	07112416161534109	0%	329.90MB/2136.98MB : 15.44%	2024-11-27 20:25:48.672984
4737	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:26:07.443093
4738	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:26:23.964082
4739	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:26:42.726576
4740	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:26:59.256523
4741	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:27:18.01449
4742	07112416161534109	0%	332.12MB/2136.98MB : 15.54%	2024-11-27 20:27:34.521138
4743	07112416161534109	0%	332.12MB/2136.98MB : 15.54%	2024-11-27 20:27:53.334508
4744	07112416161534109	0%	332.12MB/2136.98MB : 15.54%	2024-11-27 20:28:09.851595
4745	07112416161534109	0%	332.12MB/2136.98MB : 15.54%	2024-11-27 20:28:28.686819
4746	07112416161534109	0%	332.12MB/2136.98MB : 15.54%	2024-11-27 20:28:45.158112
4747	07112416161534109	0%	331.56MB/2136.98MB : 15.52%	2024-11-27 20:29:04.000067
4748	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:29:20.48839
4749	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:29:39.283647
4750	07112416161534109	1%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:29:55.769704
4751	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:30:14.60169
4752	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:30:31.076029
4753	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:30:49.914121
4754	07112416161534109	0%	331.62MB/2136.98MB : 15.52%	2024-11-27 20:31:06.364413
4755	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:31:25.190218
4756	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:31:41.635512
4757	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:32:00.475364
4758	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:32:16.930997
4759	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:32:35.758975
4760	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:32:52.22001
4761	07112416161534109	0%	331.61MB/2136.98MB : 15.52%	2024-11-27 20:33:11.018846
4762	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:33:27.500877
4763	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:33:46.304847
4764	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:34:02.821785
4765	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:34:21.584619
4766	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:34:38.08086
4767	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:34:56.869446
4768	07112416161534109	0%	331.68MB/2136.98MB : 15.52%	2024-11-27 20:35:13.360967
4769	07112416161534109	0%	331.93MB/2136.98MB : 15.53%	2024-11-27 20:35:32.149901
4770	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:35:48.659936
4771	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:36:07.431086
4772	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:36:23.932529
4773	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:36:42.758281
4774	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:36:59.195443
4775	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:37:18.050536
4776	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:37:34.491713
4777	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:37:53.321408
4778	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:38:09.762803
4779	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:38:28.613591
4780	07112416161534109	0%	331.99MB/2136.98MB : 15.54%	2024-11-27 20:38:45.032935
4781	07112416161534109	0%	332.06MB/2136.98MB : 15.54%	2024-11-27 20:39:03.8991
4782	07112416161534109	2%	332.06MB/2136.98MB : 15.54%	2024-11-27 20:39:20.345045
4783	07112416161534109	0%	332.06MB/2136.98MB : 15.54%	2024-11-27 20:39:39.177153
4784	07112416161534109	1%	332.06MB/2136.98MB : 15.54%	2024-11-27 20:39:55.672215
4785	07112416161534109	0%	332.06MB/2136.98MB : 15.54%	2024-11-27 20:40:14.534963
4786	07112416161534109	0%	332.05MB/2136.98MB : 15.54%	2024-11-27 20:40:30.973639
4787	07112416161534109	0%	332.08MB/2136.98MB : 15.54%	2024-11-27 20:40:49.847668
4788	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:41:06.254383
4789	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:41:25.160596
4790	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:41:41.534881
4791	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:42:00.440944
4792	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:42:16.800968
4793	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:42:35.766519
4794	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:42:52.083428
4795	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:43:11.051824
4796	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:43:27.359044
4797	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:43:46.34646
4798	07112416161534109	0%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:44:02.638744
4799	07112416161534109	1%	332.14MB/2136.98MB : 15.54%	2024-11-27 20:44:21.652765
4800	07112416161534109	0%	332.15MB/2136.98MB : 15.54%	2024-11-27 20:44:37.921039
4801	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:44:56.94669
4802	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:45:13.205254
4803	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:45:32.249526
4804	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:45:48.485823
4805	07112416161534109	1%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:46:07.651274
4806	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:46:23.803756
4807	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:46:42.971516
4808	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:46:59.1523
4809	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:47:18.32913
4810	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:47:34.515925
4811	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:47:53.614928
4812	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:48:09.861384
4813	07112416161534109	0%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:48:28.918102
4814	07112416161534109	1%	332.21MB/2136.98MB : 15.55%	2024-11-27 20:48:45.163689
4815	07112416161534109	0%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:49:04.217328
4816	07112416161534109	1%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:49:20.446747
4817	07112416161534109	0%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:49:39.478207
4818	07112416161534109	0%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:49:55.730201
4819	07112416161534109	0%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:50:14.793875
4820	07112416161534109	1%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:50:31.045875
4821	07112416161534109	0%	332.27MB/2136.98MB : 15.55%	2024-11-27 20:50:50.074147
4822	07112416161534109	0%	332.52MB/2136.98MB : 15.56%	2024-11-27 20:51:06.367706
4823	07112416161534109	1%	332.65MB/2136.98MB : 15.57%	2024-11-27 20:51:31.097694
4824	07112416161534109	1%	332.71MB/2136.98MB : 15.57%	2024-11-27 20:51:41.69193
4825	07112416161534109	0%	332.71MB/2136.98MB : 15.57%	2024-11-27 20:52:10.060984
4826	07112416161534109	0%	332.71MB/2136.98MB : 15.57%	2024-11-27 20:52:16.979096
4827	07112416161534109	0%	332.71MB/2136.98MB : 15.57%	2024-11-27 20:52:45.358923
4828	07112416161534109	0%	332.71MB/2136.98MB : 15.57%	2024-11-27 20:52:52.253331
4829	07112416161534109	1%	324.76MB/2136.98MB : 15.20%	2024-11-28 17:32:30.05389
4830	07112416161534109	1%	324.78MB/2136.98MB : 15.20%	2024-11-28 17:32:30.890591
4831	07112416161534109	0%	325.05MB/2136.98MB : 15.21%	2024-11-28 17:33:05.334022
4832	07112416161534109	0%	325.06MB/2136.98MB : 15.21%	2024-11-28 17:33:06.149488
4833	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:33:40.610575
4834	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:33:41.428871
4835	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-28 17:34:15.891878
4836	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 17:34:16.697262
4837	07112416161534109	0%	325.14MB/2136.98MB : 15.22%	2024-11-28 17:34:51.157947
4838	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 17:34:51.962289
4839	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:35:26.438558
4840	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:35:27.225981
4841	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:36:01.736843
4842	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:36:02.52587
4843	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:36:37.011101
4844	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:36:37.832478
4845	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:37:12.302284
4846	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:37:13.12399
4847	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 17:37:47.556151
4848	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:37:48.391054
4849	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:38:22.856624
4850	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:38:23.6843
4851	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:38:58.132398
4852	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:38:59.001944
4853	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:39:33.442315
4854	07112416161534109	1%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:39:34.279927
4855	07112416161534109	0%	325.14MB/2136.98MB : 15.21%	2024-11-28 17:40:08.71225
4856	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:40:09.789971
4857	07112416161534109	0%	325.14MB/2136.98MB : 15.21%	2024-11-28 17:40:43.996188
4858	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:40:45.07422
4859	07112416161534109	0%	325.14MB/2136.98MB : 15.21%	2024-11-28 17:41:19.271311
4860	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:41:20.354592
4861	07112416161534109	1%	325.15MB/2136.98MB : 15.22%	2024-11-28 17:41:54.539703
4862	07112416161534109	1%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:41:55.637148
4863	07112416161534109	1%	325.06MB/2136.98MB : 15.21%	2024-11-28 17:42:29.817563
4864	07112416161534109	1%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:42:30.930599
4865	07112416161534109	1%	325.14MB/2136.98MB : 15.21%	2024-11-28 17:43:05.102292
4866	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:43:06.250587
4867	07112416161534109	1%	325.05MB/2136.98MB : 15.21%	2024-11-28 17:43:40.414626
4868	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:43:41.559447
4869	07112416161534109	0%	325.05MB/2136.98MB : 15.21%	2024-11-28 17:44:15.711777
4870	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:44:16.884079
4871	07112416161534109	0%	325.11MB/2136.98MB : 15.21%	2024-11-28 17:44:51.009277
4872	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:44:52.18432
4873	07112416161534109	0%	325.11MB/2136.98MB : 15.21%	2024-11-28 17:45:26.33588
4874	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:45:27.465137
4875	07112416161534109	0%	325.20MB/2136.98MB : 15.22%	2024-11-28 17:46:01.677432
4876	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:46:02.76179
4877	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:46:36.93399
4878	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:46:38.058998
4879	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 17:47:12.404874
4880	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:47:13.403346
4881	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:47:47.68648
4882	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:47:48.721783
4883	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:48:23.006872
4884	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:48:24.042652
4885	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:48:58.28212
4886	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:48:59.364529
4887	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:49:33.573173
4888	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:49:34.636887
4889	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:50:08.861302
4890	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:50:09.928218
4891	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:50:44.136402
4892	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:50:45.234532
4893	07112416161534109	1%	325.24MB/2136.98MB : 15.22%	2024-11-28 17:51:19.498666
4894	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:51:20.50197
4895	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:51:54.762237
4896	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:51:56.059523
4897	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 17:52:08.448712
4898	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:52:09.204634
4899	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 17:52:43.734341
4900	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 17:52:44.504901
4901	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:53:19.026214
4902	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:53:19.78103
4903	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:53:54.346289
4904	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:53:55.042803
4905	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:54:29.606222
4906	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:54:30.334168
4907	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:55:04.898658
4908	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:55:05.611134
4909	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:55:40.164562
4910	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:55:40.888082
4911	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:56:15.4545
4912	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:56:16.166545
4913	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:56:50.765288
4914	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:56:51.476258
4915	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:57:26.096694
4916	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:57:26.791183
4917	28112417573395344	7%	30.18MB/362.63MB : 8.32%	2024-11-28 17:58:02.204501
4918	28112417573395344	7%	30.20MB/362.63MB : 8.33%	2024-11-28 17:58:03.034152
4919	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:58:07.392189
4920	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:58:08.242985
4921	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:58:42.660094
4922	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:58:43.542119
4923	28112417573395344	2%	30.20MB/362.63MB : 8.33%	2024-11-28 17:58:48.698337
4924	28112417573395344	2%	30.21MB/362.63MB : 8.33%	2024-11-28 17:58:49.57969
4925	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 17:59:23.958487
4926	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 17:59:24.851966
4927	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 17:59:29.972423
4928	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 17:59:30.898424
4929	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:00:05.243531
4930	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:00:06.172543
4931	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:00:11.27158
4932	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:00:12.167319
4933	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:00:46.677261
4934	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:00:47.541947
4935	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 18:00:52.775878
4936	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:00:53.639131
4937	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:01:28.194869
4938	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:01:29.028143
4939	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:01:34.23824
4940	28112417573395344	15%	30.18MB/362.63MB : 8.32%	2024-11-28 18:01:35.118561
4941	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:02:09.560533
4942	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:02:10.426902
4943	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 18:02:15.618713
4944	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:02:16.464532
4945	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:02:50.950164
4946	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:02:51.770428
4947	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 18:02:57.009308
4948	28112417573395344	7%	30.18MB/362.63MB : 8.32%	2024-11-28 18:02:57.830449
4949	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:03:33.113606
4950	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:03:33.933177
4951	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:03:38.315942
4952	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:03:39.149686
4953	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:04:13.602713
4954	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:04:14.484338
4955	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 18:04:19.594848
4956	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:04:20.552858
4957	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:04:54.87241
4958	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:04:55.832868
4959	28112417573395344	10%	30.17MB/362.63MB : 8.32%	2024-11-28 18:05:00.904062
4960	28112417573395344	10%	30.18MB/362.63MB : 8.32%	2024-11-28 18:05:01.846791
4961	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 18:05:37.064432
4962	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:05:37.915526
4963	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:05:42.281699
4964	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:05:43.133387
4965	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:06:17.572076
4966	07112416161534109	0%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:06:18.453434
4967	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:06:23.60633
4968	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:06:24.533118
4969	07112416161534109	0%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:06:58.902977
4970	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:06:59.81754
4971	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 18:07:04.941486
4972	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:07:05.823778
4973	07112416161534109	1%	325.18MB/2136.98MB : 15.22%	2024-11-28 18:07:40.237815
4974	07112416161534109	1%	325.19MB/2136.98MB : 15.22%	2024-11-28 18:07:41.089296
4975	28112417573395344	10%	30.17MB/362.63MB : 8.32%	2024-11-28 18:07:46.24789
4976	28112417573395344	10%	30.18MB/362.63MB : 8.32%	2024-11-28 18:07:47.112186
4977	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:08:21.589175
4978	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:08:22.400188
4979	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 18:08:27.682646
4980	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:08:28.534869
4981	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:09:02.961184
4982	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:09:03.812897
4983	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:09:09.01266
4984	28112417573395344	13%	30.18MB/362.63MB : 8.32%	2024-11-28 18:09:09.865546
4985	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:09:44.265758
4986	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:09:45.177686
4987	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 18:09:50.311355
4988	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:09:51.226402
4989	07112416161534109	1%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:10:25.587839
4990	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:10:26.513706
4991	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:10:31.586716
4992	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:10:32.544351
4993	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:11:06.91956
4994	07112416161534109	0%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:11:07.816853
4995	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:11:12.956768
4996	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:11:13.880685
4997	07112416161534109	0%	325.24MB/2136.98MB : 15.22%	2024-11-28 18:11:48.243968
4998	07112416161534109	1%	325.25MB/2136.98MB : 15.22%	2024-11-28 18:11:49.157569
4999	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:11:54.268674
5000	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:11:55.21408
5001	07112416161534109	1%	326.12MB/2136.98MB : 15.26%	2024-11-28 18:12:29.536948
5002	07112416161534109	1%	326.13MB/2136.98MB : 15.26%	2024-11-28 18:12:30.494798
5003	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 18:12:35.585894
5004	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:12:36.531586
5005	07112416161534109	1%	326.05MB/2136.98MB : 15.26%	2024-11-28 18:13:10.85244
5006	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:13:11.936338
5007	28112417573395344	6%	30.14MB/362.63MB : 8.31%	2024-11-28 18:13:16.875178
5008	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:13:17.942234
5009	07112416161534109	0%	326.05MB/2136.98MB : 15.26%	2024-11-28 18:13:52.151963
5010	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:13:53.282966
5011	28112417573395344	2%	30.14MB/362.63MB : 8.31%	2024-11-28 18:13:58.171147
5012	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:13:59.333971
5013	07112416161534109	0%	325.97MB/2136.98MB : 15.25%	2024-11-28 18:14:33.449943
5014	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:14:34.735115
5015	28112417573395344	2%	30.13MB/362.63MB : 8.31%	2024-11-28 18:14:39.490551
5016	28112417573395344	13%	30.18MB/362.63MB : 8.32%	2024-11-28 18:14:40.807023
5017	07112416161534109	1%	325.97MB/2136.98MB : 15.25%	2024-11-28 18:15:14.771564
5018	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:15:16.113558
5019	28112417573395344	11%	30.13MB/362.63MB : 8.31%	2024-11-28 18:15:20.793712
5020	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:15:22.140587
5021	28112417573395344	6%	30.13MB/362.63MB : 8.31%	2024-11-28 18:15:56.924811
5022	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:15:58.240043
5023	07112416161534109	0%	325.97MB/2136.98MB : 15.25%	2024-11-28 18:16:02.116968
5024	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:16:03.507007
5025	07112416161534109	0%	325.97MB/2136.98MB : 15.25%	2024-11-28 18:16:37.410596
5026	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:16:38.803435
5027	28112417573395344	2%	30.13MB/362.63MB : 8.31%	2024-11-28 18:16:43.433971
5028	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:16:44.822166
5029	07112416161534109	0%	325.97MB/2136.98MB : 15.25%	2024-11-28 18:17:18.725629
5030	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:17:20.119537
5031	28112417573395344	9%	30.17MB/362.63MB : 8.32%	2024-11-28 18:17:24.759645
5032	28112417573395344	9%	30.18MB/362.63MB : 8.32%	2024-11-28 18:17:25.550003
5033	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:18:00.06267
5034	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:18:00.821867
5035	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:18:06.073219
5036	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:18:06.894533
5037	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:18:41.343974
5038	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:18:42.179071
5039	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 18:18:47.351458
5040	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:18:48.219718
5041	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:19:22.64928
5042	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:19:23.485591
5043	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:19:28.671657
5044	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:19:29.491319
5045	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:20:03.956598
5046	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:20:04.777882
5047	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:20:10.007236
5048	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:20:10.841275
5049	07112416161534109	1%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:20:45.296398
5050	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:20:46.14728
5051	28112417573395344	10%	30.17MB/362.63MB : 8.32%	2024-11-28 18:20:51.300118
5052	28112417573395344	10%	30.18MB/362.63MB : 8.32%	2024-11-28 18:20:52.168322
5053	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:21:26.652348
5054	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:21:27.441676
5055	28112417573395344	5%	30.17MB/362.63MB : 8.32%	2024-11-28 18:21:32.704975
5056	28112417573395344	5%	30.18MB/362.63MB : 8.32%	2024-11-28 18:21:33.507836
5057	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:22:08.052822
5058	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:22:08.811237
5059	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:22:14.091788
5060	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:22:14.927803
5061	07112416161534109	0%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:22:49.369651
5062	07112416161534109	0%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:22:50.220972
5063	28112417573395344	13%	30.17MB/362.63MB : 8.32%	2024-11-28 18:22:55.421446
5064	28112417573395344	13%	30.18MB/362.63MB : 8.32%	2024-11-28 18:22:56.273361
5065	07112416161534109	1%	326.10MB/2136.98MB : 15.26%	2024-11-28 18:23:30.714535
5066	07112416161534109	1%	326.11MB/2136.98MB : 15.26%	2024-11-28 18:23:31.566744
5067	28112417573395344	9%	30.17MB/362.63MB : 8.32%	2024-11-28 18:23:36.744593
5068	28112417573395344	9%	30.18MB/362.63MB : 8.32%	2024-11-28 18:23:37.594199
5069	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:24:12.075467
5070	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:24:12.894533
5071	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:24:18.096949
5072	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:24:18.933313
5073	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:24:53.393037
5074	07112416161534109	1%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:24:54.213452
5075	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:24:59.433728
5076	28112417573395344	14%	30.18MB/362.63MB : 8.32%	2024-11-28 18:25:00.286311
5077	07112416161534109	1%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:25:34.726124
5078	07112416161534109	1%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:25:35.624781
5079	28112417573395344	10%	30.17MB/362.63MB : 8.32%	2024-11-28 18:25:40.76254
5080	28112417573395344	10%	30.18MB/362.63MB : 8.32%	2024-11-28 18:25:41.661431
5081	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:26:16.053353
5082	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:26:16.987254
5083	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 18:26:22.156039
5084	28112417573395344	7%	30.18MB/362.63MB : 8.32%	2024-11-28 18:26:23.110793
5085	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:26:57.427248
5086	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:26:58.400675
5087	28112417573395344	3%	30.17MB/362.63MB : 8.32%	2024-11-28 18:27:03.468653
5088	28112417573395344	3%	30.18MB/362.63MB : 8.32%	2024-11-28 18:27:04.426066
5089	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:27:38.775623
5090	07112416161534109	1%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:27:39.719561
5091	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:27:44.865997
5092	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:27:45.780896
5093	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:28:20.149277
5094	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:28:21.031479
5095	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:28:26.189647
5096	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:28:27.027632
5097	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:29:01.483988
5098	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:29:02.302478
5099	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 18:29:07.543102
5100	28112417573395344	6%	30.18MB/362.63MB : 8.32%	2024-11-28 18:29:08.39316
5101	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:29:42.830989
5102	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:29:43.672029
5103	28112417573395344	1%	30.17MB/362.63MB : 8.32%	2024-11-28 18:29:48.954446
5104	28112417573395344	14%	30.18MB/362.63MB : 8.32%	2024-11-28 18:29:49.819842
5105	07112416161534109	1%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:30:24.253778
5106	07112416161534109	1%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:30:25.105877
5107	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:30:30.311286
5108	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:30:31.14742
5109	07112416161534109	1%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:31:05.622731
5110	07112416161534109	1%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:31:06.443909
5111	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 18:31:11.682148
5112	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 18:31:12.533209
5113	28112417573395344	2%	30.17MB/362.63MB : 8.32%	2024-11-28 18:31:47.822058
5114	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 18:31:48.689915
5115	07112416161534109	0%	325.16MB/2136.98MB : 15.22%	2024-11-28 18:31:53.004795
5116	07112416161534109	0%	325.17MB/2136.98MB : 15.22%	2024-11-28 18:31:53.91681
5117	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:32:22.232236
5118	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:32:28.283302
5119	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:32:28.298468
5120	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:32:34.322356
5121	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:32:48.609375
5122	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:32:54.612616
5123	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:33:10.417341
5124	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:33:15.610276
5125	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:33:29.892276
5126	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:33:35.976392
5127	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:33:50.882672
5128	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:33:56.889591
5129	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:34:11.260639
5130	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 18:34:17.307598
5131	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:34:32.202121
5132	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:34:38.261939
5133	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:34:52.635376
5134	28112417573395344	1%	30.09MB/362.63MB : 8.30%	2024-11-28 18:34:58.678599
5135	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:35:13.620499
5136	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:35:19.725406
5137	28112417573395344	9%	30.13MB/362.63MB : 8.31%	2024-11-28 18:35:34.792947
5138	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:35:40.051313
5139	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:35:55.007257
5140	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:36:01.034785
5141	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:36:15.338871
5142	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:36:21.367399
5143	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:36:36.323083
5144	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:36:42.340419
5145	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:36:56.66195
5146	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:37:02.67576
5147	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:37:17.609156
5148	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:37:23.625208
5149	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:37:37.970919
5150	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:37:43.99681
5151	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:37:58.886233
5152	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:38:04.903418
5153	07112416161534109	1%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:38:19.261271
5154	28112417573395344	10%	30.09MB/362.63MB : 8.30%	2024-11-28 18:38:25.372391
5155	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:38:41.017274
5156	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:38:46.246059
5157	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:39:00.656749
5158	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:39:06.67485
5159	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:39:21.5236
5160	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:39:27.574579
5161	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:39:42.83538
5162	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:39:48.042065
5163	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:40:02.850845
5164	28112417573395344	1%	30.09MB/362.63MB : 8.30%	2024-11-28 18:40:08.874818
5165	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:40:23.368118
5166	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:40:29.382902
5167	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:40:44.174444
5168	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:40:50.192217
5169	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:41:04.739412
5170	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:41:10.744251
5171	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:41:25.464897
5172	28112417573395344	11%	30.09MB/362.63MB : 8.30%	2024-11-28 18:41:31.809765
5173	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:41:46.097298
5174	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 18:41:52.095525
5175	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:42:07.195416
5176	28112417573395344	3%	30.14MB/362.63MB : 8.31%	2024-11-28 18:42:13.208062
5177	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:42:27.428356
5178	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:42:33.432905
5179	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:42:48.544828
5180	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:42:54.54136
5181	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:43:08.749053
5182	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:43:14.750068
5183	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:43:29.829845
5184	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:43:35.877372
5185	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:43:50.882034
5186	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:43:56.095749
5187	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:44:11.217655
5188	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:44:17.219947
5189	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:44:27.006081
5190	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:44:33.029721
5191	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:44:52.480876
5192	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:44:58.475478
5193	07112416161534109	0%	325.03MB/2136.98MB : 15.21%	2024-11-28 18:45:08.335395
5194	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:45:14.360015
5195	07112416161534109	0%	325.10MB/2136.98MB : 15.21%	2024-11-28 18:45:33.753993
5196	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:45:39.749135
5197	07112416161534109	1%	325.10MB/2136.98MB : 15.21%	2024-11-28 18:45:49.642504
5198	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:45:55.635286
5199	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:46:15.048672
5200	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:46:21.068191
5201	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:46:30.909536
5202	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 18:46:36.897786
5203	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:46:57.149816
5204	07112416161534109	0%	327.32MB/2136.98MB : 15.32%	2024-11-28 18:47:02.423276
5205	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:47:13.003234
5206	07112416161534109	0%	327.32MB/2136.98MB : 15.32%	2024-11-28 18:47:18.224543
5207	07112416161534109	0%	327.32MB/2136.98MB : 15.32%	2024-11-28 18:47:37.729129
5208	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:47:43.783846
5209	07112416161534109	0%	327.38MB/2136.98MB : 15.32%	2024-11-28 18:47:53.508174
5210	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:47:59.546802
5211	07112416161534109	0%	327.38MB/2136.98MB : 15.32%	2024-11-28 18:48:19.132257
5212	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:48:25.120783
5213	07112416161534109	0%	327.44MB/2136.98MB : 15.32%	2024-11-28 18:48:34.435845
5214	28112417573395344	11%	30.09MB/362.63MB : 8.30%	2024-11-28 18:48:40.44178
5215	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:49:01.250887
5216	07112416161534109	0%	327.44MB/2136.98MB : 15.32%	2024-11-28 18:49:06.469948
5217	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 18:49:16.556251
5218	07112416161534109	0%	327.44MB/2136.98MB : 15.32%	2024-11-28 18:49:21.740363
5219	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:49:42.571365
5220	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:49:47.783077
5221	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:49:57.880971
5222	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:50:03.079453
5223	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:50:23.094066
5224	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:50:29.147942
5225	07112416161534109	0%	326.75MB/2136.98MB : 15.29%	2024-11-28 18:50:38.372657
5226	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:50:44.393758
5227	07112416161534109	0%	327.57MB/2136.98MB : 15.33%	2024-11-28 18:51:04.495403
5228	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:51:10.541847
5229	07112416161534109	0%	327.82MB/2136.98MB : 15.34%	2024-11-28 18:51:19.69269
5230	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:51:25.721082
5231	07112416161534109	0%	327.88MB/2136.98MB : 15.34%	2024-11-28 18:51:45.862867
5232	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:51:51.915118
5233	07112416161534109	0%	327.88MB/2136.98MB : 15.34%	2024-11-28 18:52:00.996892
5234	07112416161534109	0%	327.88MB/2136.98MB : 15.34%	2024-11-28 18:52:12.340072
5235	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:52:18.358511
5236	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:52:28.000767
5237	07112416161534109	0%	327.88MB/2136.98MB : 15.34%	2024-11-28 18:52:33.20227
5238	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:52:53.691389
5239	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:52:59.715162
5240	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:53:08.486336
5241	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:53:14.529784
5242	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:53:35.058793
5243	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:53:42.174338
5244	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:53:48.188214
5245	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 18:53:50.644947
5246	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:53:55.875114
5247	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:54:23.48247
5248	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:54:29.519802
5249	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:54:31.145039
5250	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:54:37.177678
5251	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:55:04.820131
5252	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:55:10.855015
5253	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:55:12.4641
5254	28112417573395344	3%	30.09MB/362.63MB : 8.30%	2024-11-28 18:55:18.502888
5255	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:55:46.134988
5256	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:55:52.18832
5257	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:55:53.799217
5258	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:55:59.817962
5259	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:56:27.505149
5260	28112417573395344	3%	30.09MB/362.63MB : 8.30%	2024-11-28 18:56:33.545888
5261	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:56:35.141937
5262	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:56:41.210257
5263	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:57:08.82111
5264	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:57:14.817495
5265	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:57:16.490884
5266	28112417573395344	8%	30.09MB/362.63MB : 8.30%	2024-11-28 18:57:22.513878
5267	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:57:50.093088
5268	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:57:56.101558
5269	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:57:57.802866
5270	28112417573395344	4%	30.09MB/362.63MB : 8.30%	2024-11-28 18:58:03.823753
5271	07112416161534109	0%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:58:31.377072
5272	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 18:58:37.406949
5273	07112416161534109	1%	327.95MB/2136.98MB : 15.35%	2024-11-28 18:58:39.124937
5274	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 18:58:45.148539
5275	07112416161534109	0%	328.07MB/2136.98MB : 15.35%	2024-11-28 18:59:12.709891
5276	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 18:59:18.73815
5277	07112416161534109	1%	328.07MB/2136.98MB : 15.35%	2024-11-28 18:59:20.455914
5278	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 18:59:26.465683
5279	07112416161534109	0%	328.07MB/2136.98MB : 15.35%	2024-11-28 18:59:54.0296
5280	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:00:00.058411
5281	07112416161534109	1%	328.07MB/2136.98MB : 15.35%	2024-11-28 19:00:01.745794
5282	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 19:00:07.786845
5283	07112416161534109	0%	328.07MB/2136.98MB : 15.35%	2024-11-28 19:00:35.405589
5284	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:00:41.431503
5285	07112416161534109	0%	328.01MB/2136.98MB : 15.35%	2024-11-28 19:00:43.086664
5286	28112417573395344	3%	30.09MB/362.63MB : 8.30%	2024-11-28 19:00:49.064232
5287	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:01:16.710643
5288	28112417573395344	4%	30.09MB/362.63MB : 8.30%	2024-11-28 19:01:22.74268
5289	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:01:24.340111
5290	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:01:30.378938
5291	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:01:58.034432
5292	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:02:04.023063
5293	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:02:05.6161
5294	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:02:11.619155
5295	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:02:40.108785
5296	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:02:45.312321
5297	07112416161534109	0%	328.16MB/2136.98MB : 15.36%	2024-11-28 19:02:46.908072
5298	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:02:52.928071
5299	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:03:20.636505
5300	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:03:26.670345
5301	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:03:28.218277
5302	28112417573395344	4%	30.09MB/362.63MB : 8.30%	2024-11-28 19:03:34.254254
5303	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:04:01.934928
5304	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:04:07.994843
5305	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:04:09.556635
5306	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:04:15.5932
5307	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:04:43.259563
5308	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:04:49.298003
5309	07112416161534109	0%	328.02MB/2136.98MB : 15.35%	2024-11-28 19:04:50.908041
5310	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:04:56.890464
5311	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:05:24.606145
5312	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:05:30.595166
5313	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:05:32.190841
5314	28112417573395344	3%	30.09MB/362.63MB : 8.30%	2024-11-28 19:05:38.231646
5315	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:06:05.879299
5316	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 19:06:11.857389
5317	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:06:13.588764
5318	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:06:19.615173
5319	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:06:47.219484
5320	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:06:53.25534
5321	07112416161534109	1%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:06:54.955163
5322	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:07:01.010944
5323	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:07:28.577815
5324	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:07:34.630553
5325	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:07:36.288498
5326	28112417573395344	5%	30.09MB/362.63MB : 8.30%	2024-11-28 19:07:42.264107
5327	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:08:09.900105
5328	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:08:15.905872
5329	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:08:17.626061
5330	28112417573395344	3%	30.09MB/362.63MB : 8.30%	2024-11-28 19:08:23.628786
5331	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:08:51.178093
5332	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:08:57.199714
5333	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:08:58.919596
5334	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:09:04.961394
5335	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:09:32.502063
5336	28112417573395344	2%	30.09MB/362.63MB : 8.30%	2024-11-28 19:09:38.525283
5337	07112416161534109	1%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:09:40.244613
5338	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 19:09:46.299179
5339	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:10:13.838952
5340	28112417573395344	7%	30.09MB/362.63MB : 8.30%	2024-11-28 19:10:19.882536
5341	07112416161534109	0%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:10:21.572561
5342	07112416161534109	2%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:21:57.552812
5343	28112417573395344	3%	30.17MB/362.63MB : 8.32%	2024-11-28 19:22:03.694772
5344	07112416161534109	1%	328.14MB/2136.98MB : 15.36%	2024-11-28 19:22:06.362949
5345	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 19:22:12.388342
5346	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:22:39.066691
5347	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 19:22:45.147869
5348	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:22:47.92851
5349	28112417573395344	3%	30.17MB/362.63MB : 8.32%	2024-11-28 19:22:54.005186
5350	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:23:20.522812
5351	28112417573395344	9%	30.17MB/362.63MB : 8.32%	2024-11-28 19:23:26.657719
5352	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:23:29.317153
5353	28112417573395344	7%	30.18MB/362.63MB : 8.32%	2024-11-28 19:23:35.346517
5354	07112416161534109	1%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:24:02.009323
5355	28112417573395344	4%	30.11MB/362.63MB : 8.30%	2024-11-28 19:24:08.136948
5356	07112416161534109	1%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:24:10.687647
5357	28112417573395344	6%	30.11MB/362.63MB : 8.30%	2024-11-28 19:24:16.743488
5358	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:24:43.518221
5359	28112417573395344	1%	30.11MB/362.63MB : 8.30%	2024-11-28 19:24:49.578161
5360	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:24:52.155275
5361	28112417573395344	2%	30.11MB/362.63MB : 8.30%	2024-11-28 19:24:58.190867
5362	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:25:24.866371
5363	28112417573395344	7%	30.11MB/362.63MB : 8.30%	2024-11-28 19:25:30.89019
5364	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:25:33.532072
5365	28112417573395344	3%	30.11MB/362.63MB : 8.30%	2024-11-28 19:25:39.595074
5366	07112416161534109	1%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:26:06.253662
5367	28112417573395344	5%	30.11MB/362.63MB : 8.30%	2024-11-28 19:26:12.286241
5368	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:26:14.929723
5369	28112417573395344	7%	30.11MB/362.63MB : 8.30%	2024-11-28 19:26:21.006206
5370	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:26:47.652756
5371	28112417573395344	2%	30.11MB/362.63MB : 8.30%	2024-11-28 19:26:54.551137
5372	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:26:56.360433
5373	28112417573395344	7%	30.11MB/362.63MB : 8.30%	2024-11-28 19:27:02.384593
5374	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:27:29.823841
5375	28112417573395344	6%	30.11MB/362.63MB : 8.30%	2024-11-28 19:27:35.852903
5376	07112416161534109	1%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:27:37.684894
5377	28112417573395344	3%	30.11MB/362.63MB : 8.30%	2024-11-28 19:27:43.698612
5378	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:28:11.189896
5379	28112417573395344	6%	30.11MB/362.63MB : 8.30%	2024-11-28 19:28:17.217576
5380	07112416161534109	0%	328.20MB/2136.98MB : 15.36%	2024-11-28 19:28:19.017198
5381	28112417573395344	7%	30.11MB/362.63MB : 8.30%	2024-11-28 19:28:25.024497
5382	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:28:52.557809
5383	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:28:58.604702
5384	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:29:00.305592
5385	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:29:06.314117
5386	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:29:33.889061
5387	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:29:39.900481
5388	28112417573395344	11%	30.19MB/362.63MB : 8.33%	2024-11-28 19:29:42.442542
5389	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:29:47.652697
5390	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:30:15.236066
5391	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:30:21.285591
5392	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:30:23.024372
5393	28112417573395344	4%	30.10MB/362.63MB : 8.30%	2024-11-28 19:30:29.063892
5394	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:30:56.590571
5395	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:31:02.608237
5396	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:31:04.360153
5397	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:31:10.649835
5398	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:31:37.895641
5399	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:31:43.984847
5400	28112417573395344	13%	30.19MB/362.63MB : 8.33%	2024-11-28 19:31:46.735008
5401	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:31:51.959974
5402	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:32:19.274533
5403	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:32:25.305769
5404	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:32:27.270149
5405	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:32:33.280573
5406	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:33:00.583187
5407	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:33:06.578233
5408	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:33:08.515821
5409	28112417573395344	3%	30.10MB/362.63MB : 8.30%	2024-11-28 19:33:14.520658
5410	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:33:41.902285
5411	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:33:47.954407
5412	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:33:49.813311
5413	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:33:55.854701
5414	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:34:23.310985
5415	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:34:29.337887
5416	07112416161534109	0%	328.33MB/2136.98MB : 15.36%	2024-11-28 19:34:31.16609
5417	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:34:37.184593
5418	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:35:04.635103
5419	28112417573395344	16%	30.10MB/362.63MB : 8.30%	2024-11-28 19:35:10.706374
5420	28112417573395344	16%	30.19MB/362.63MB : 8.33%	2024-11-28 19:35:13.287822
5421	07112416161534109	0%	328.53MB/2136.98MB : 15.37%	2024-11-28 19:35:18.495827
5422	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:35:46.000298
5423	28112417573395344	10%	30.10MB/362.63MB : 8.30%	2024-11-28 19:35:52.219458
5424	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:35:53.781383
5425	28112417573395344	4%	30.10MB/362.63MB : 8.30%	2024-11-28 19:35:59.831511
5426	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:36:27.496349
5427	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:36:33.499811
5428	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:36:35.108424
5429	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:36:41.132444
5430	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:37:08.783807
5431	28112417573395344	10%	30.10MB/362.63MB : 8.30%	2024-11-28 19:37:15.016035
5432	07112416161534109	1%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:37:16.626544
5433	28112417573395344	8%	30.10MB/362.63MB : 8.30%	2024-11-28 19:37:22.674571
5434	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:37:50.298784
5435	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:37:56.336403
5436	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:37:57.978187
5437	28112417573395344	3%	30.10MB/362.63MB : 8.30%	2024-11-28 19:38:03.998194
5438	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:38:31.611117
5439	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:38:37.635482
5440	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:38:39.30513
5441	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:38:45.292903
5442	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:39:12.947641
5443	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:39:19.015144
5444	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:39:20.591917
5445	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:39:26.603144
5446	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:39:54.336193
5447	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:40:00.371581
5448	07112416161534109	0%	328.45MB/2136.98MB : 15.37%	2024-11-28 19:40:01.872547
5449	28112417573395344	8%	30.10MB/362.63MB : 8.30%	2024-11-28 19:40:07.919684
5450	07112416161534109	0%	328.46MB/2136.98MB : 15.37%	2024-11-28 19:40:35.68032
5451	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:40:41.696304
5452	07112416161534109	0%	328.65MB/2136.98MB : 15.38%	2024-11-28 19:41:29.296285
5453	07112416161534109	0%	328.66MB/2136.98MB : 15.38%	2024-11-28 19:41:30.218583
5454	28112417573395344	12%	30.18MB/362.63MB : 8.32%	2024-11-28 19:41:35.4024
5455	28112417573395344	12%	30.19MB/362.63MB : 8.33%	2024-11-28 19:41:36.310653
5456	28112417573395344	15%	30.14MB/362.63MB : 8.31%	2024-11-28 19:42:03.314991
5457	07112416161534109	0%	328.52MB/2136.98MB : 15.37%	2024-11-28 19:42:08.510544
5458	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:42:26.638387
5459	07112416161534109	0%	328.52MB/2136.98MB : 15.37%	2024-11-28 19:42:31.85165
5460	07112416161534109	0%	328.65MB/2136.98MB : 15.38%	2024-11-28 19:42:41.157148
5461	07112416161534109	1%	328.66MB/2136.98MB : 15.38%	2024-11-28 19:42:42.117024
5462	28112417573395344	10%	30.18MB/362.63MB : 8.32%	2024-11-28 19:42:47.202378
5463	28112417573395344	10%	30.19MB/362.63MB : 8.33%	2024-11-28 19:42:48.163763
5464	07112416161534109	0%	326.84MB/2136.98MB : 15.29%	2024-11-28 19:43:53.854597
5465	07112416161534109	0%	326.90MB/2136.98MB : 15.30%	2024-11-28 19:43:54.939203
5466	28112417573395344	2%	30.15MB/362.63MB : 8.32%	2024-11-28 19:43:59.866462
5467	28112417573395344	11%	30.19MB/362.63MB : 8.33%	2024-11-28 19:44:00.991824
5468	07112416161534109	0%	327.41MB/2136.98MB : 15.32%	2024-11-28 19:45:06.611802
5469	07112416161534109	0%	327.47MB/2136.98MB : 15.32%	2024-11-28 19:45:07.738942
5470	28112417573395344	5%	30.14MB/362.63MB : 8.31%	2024-11-28 19:45:12.815638
5471	28112417573395344	5%	30.19MB/362.63MB : 8.33%	2024-11-28 19:45:13.740701
5472	07112416161534109	0%	327.33MB/2136.98MB : 15.32%	2024-11-28 19:45:23.151585
5473	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:45:29.189666
5474	28112417573395344	11%	30.18MB/362.63MB : 8.32%	2024-11-28 19:46:21.603525
5475	28112417573395344	11%	30.19MB/362.63MB : 8.33%	2024-11-28 19:46:22.500139
5476	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:46:26.79947
5477	07112416161534109	0%	327.59MB/2136.98MB : 15.33%	2024-11-28 19:46:27.697151
5478	07112416161534109	1%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:47:33.600065
5479	07112416161534109	1%	327.59MB/2136.98MB : 15.33%	2024-11-28 19:47:34.421805
5480	28112417573395344	2%	30.18MB/362.63MB : 8.32%	2024-11-28 19:47:39.643205
5481	28112417573395344	13%	30.19MB/362.63MB : 8.33%	2024-11-28 19:47:40.494304
5482	07112416161534109	0%	327.57MB/2136.98MB : 15.33%	2024-11-28 19:48:23.819906
5483	28112417573395344	5%	30.10MB/362.63MB : 8.30%	2024-11-28 19:48:29.83957
5484	07112416161534109	0%	327.51MB/2136.98MB : 15.33%	2024-11-28 19:48:46.380092
5485	28112417573395344	5%	30.10MB/362.63MB : 8.30%	2024-11-28 19:48:53.287699
5486	07112416161534109	0%	327.51MB/2136.98MB : 15.33%	2024-11-28 19:49:36.544017
5487	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:49:42.554187
5488	07112416161534109	0%	327.51MB/2136.98MB : 15.33%	2024-11-28 19:49:59.958612
5489	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:50:06.027536
5490	07112416161534109	0%	327.51MB/2136.98MB : 15.33%	2024-11-28 19:50:49.227615
5491	28112417573395344	8%	30.10MB/362.63MB : 8.30%	2024-11-28 19:50:55.592165
5492	07112416161534109	0%	327.51MB/2136.98MB : 15.33%	2024-11-28 19:51:12.768242
5493	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:51:18.795308
5494	07112416161534109	1%	327.52MB/2136.98MB : 15.33%	2024-11-28 19:52:02.347728
5495	28112417573395344	2%	30.10MB/362.63MB : 8.30%	2024-11-28 19:52:08.395335
5496	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:52:26.336668
5497	07112416161534109	0%	327.52MB/2136.98MB : 15.33%	2024-11-28 19:52:31.56553
5498	07112416161534109	0%	327.52MB/2136.98MB : 15.33%	2024-11-28 19:53:15.11689
5499	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:53:21.220226
5500	07112416161534109	0%	327.52MB/2136.98MB : 15.33%	2024-11-28 19:53:38.328986
5501	28112417573395344	1%	30.10MB/362.63MB : 8.30%	2024-11-28 19:53:44.314005
5502	07112416161534109	0%	327.64MB/2136.98MB : 15.33%	2024-11-28 19:54:27.891354
5503	28112417573395344	1%	30.10MB/362.63MB : 8.30%	2024-11-28 19:54:33.879824
5504	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:54:51.061876
5505	28112417573395344	6%	30.10MB/362.63MB : 8.30%	2024-11-28 19:54:57.074627
5506	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:55:40.585141
5507	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:55:46.643766
5508	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:56:03.762043
5509	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:56:09.808063
5510	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:56:53.329974
5511	28112417573395344	1%	30.10MB/362.63MB : 8.30%	2024-11-28 19:56:59.347009
5512	07112416161534109	0%	327.58MB/2136.98MB : 15.33%	2024-11-28 19:57:16.454808
5513	28112417573395344	7%	30.10MB/362.63MB : 8.30%	2024-11-28 19:57:22.515679
5514	07112416161534109	0%	327.68MB/2136.98MB : 15.33%	2024-11-28 19:58:07.355673
5515	28112417573395344	14%	30.12MB/362.63MB : 8.31%	2024-11-28 19:58:13.388028
5516	28112417573395344	8%	30.12MB/362.63MB : 8.31%	2024-11-28 19:58:30.1421
5517	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 19:58:35.377233
5518	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 19:59:20.025437
5519	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 19:59:26.038633
5520	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 19:59:42.099776
5521	28112417573395344	4%	30.12MB/362.63MB : 8.31%	2024-11-28 19:59:48.119505
5522	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:00:32.698047
5523	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:00:38.753725
5524	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:00:54.784876
5525	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:01:00.840062
5526	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:01:45.465063
5527	28112417573395344	8%	30.12MB/362.63MB : 8.31%	2024-11-28 20:01:51.532297
5528	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:02:07.538158
5529	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:02:14.384992
5530	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:02:58.222527
5531	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:03:04.265174
5532	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:03:22.413342
5533	28112417573395344	3%	30.12MB/362.63MB : 8.31%	2024-11-28 20:03:28.423143
5534	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-28 20:04:10.954584
5535	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 20:04:17.025004
5536	07112416161534109	0%	326.81MB/2136.98MB : 15.29%	2024-11-28 20:04:35.136205
5537	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:04:41.112724
5538	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:05:23.6976
5539	28112417573395344	8%	30.12MB/362.63MB : 8.31%	2024-11-28 20:05:29.719205
5540	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:05:47.836052
5541	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:05:53.863468
5542	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:06:36.460287
5543	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 20:06:42.493921
5544	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:07:00.577005
5545	28112417573395344	8%	30.12MB/362.63MB : 8.31%	2024-11-28 20:07:06.649994
5546	07112416161534109	0%	326.80MB/2136.98MB : 15.29%	2024-11-28 20:07:49.181276
5547	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:07:55.230331
5548	07112416161534109	0%	326.74MB/2136.98MB : 15.29%	2024-11-28 20:08:13.426344
5549	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:08:19.464352
5550	07112416161534109	1%	326.74MB/2136.98MB : 15.29%	2024-11-28 20:09:01.97456
5551	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 20:09:08.015893
5552	07112416161534109	0%	326.74MB/2136.98MB : 15.29%	2024-11-28 20:09:26.967924
5553	28112417573395344	14%	30.12MB/362.63MB : 8.31%	2024-11-28 20:09:32.982169
5554	07112416161534109	0%	326.74MB/2136.98MB : 15.29%	2024-11-28 20:10:14.72692
5555	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:10:20.81535
5556	07112416161534109	0%	326.74MB/2136.98MB : 15.29%	2024-11-28 20:10:39.846636
5557	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:10:45.914548
5558	07112416161534109	1%	326.88MB/2136.98MB : 15.30%	2024-11-28 20:11:27.628536
5559	28112417573395344	6%	30.15MB/362.63MB : 8.32%	2024-11-28 20:11:33.640866
5560	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:11:52.644319
5561	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:11:58.675997
5562	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:12:41.167463
5563	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:12:46.461252
5564	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:13:05.474276
5565	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 20:13:11.503472
5566	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:13:53.188043
5567	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:13:59.228252
5568	28112417573395344	1%	30.12MB/362.63MB : 8.31%	2024-11-28 20:14:19.111803
5569	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:14:24.346236
5570	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:15:06.737378
5571	07112416161534109	1%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:15:11.954437
5572	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:15:24.297439
5573	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:15:30.330033
5574	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:15:31.117005
5575	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:15:37.127841
5576	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:15:41.277451
5577	28112417573395344	6%	30.12MB/362.63MB : 8.31%	2024-11-28 20:15:47.31224
5578	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:16:44.026606
5579	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:16:50.082759
5580	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:16:54.057194
5581	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:17:00.119136
5582	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:17:56.846814
5583	28112417573395344	5%	30.12MB/362.63MB : 8.31%	2024-11-28 20:18:02.88053
5584	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:18:06.779562
5585	28112417573395344	5%	30.12MB/362.63MB : 8.31%	2024-11-28 20:18:12.801497
5586	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:19:09.589381
5587	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:19:15.623995
5588	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:19:19.634506
5589	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:19:25.658448
5590	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:19:38.073268
5591	28112417573395344	1%	30.12MB/362.63MB : 8.31%	2024-11-28 20:19:44.0613
5592	07112416161534109	1%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:20:22.341578
5593	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:20:28.403861
5594	07112416161534109	0%	326.93MB/2136.98MB : 15.30%	2024-11-28 20:20:50.69891
5595	28112417573395344	8%	30.12MB/362.63MB : 8.31%	2024-11-28 20:20:56.749799
5596	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-28 20:21:18.244868
5597	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:21:24.254066
5598	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-28 20:21:35.076886
5599	28112417573395344	7%	30.12MB/362.63MB : 8.31%	2024-11-28 20:21:41.13548
5600	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:22:24.060196
5601	07112416161534109	1%	326.87MB/2136.98MB : 15.30%	2024-11-28 20:22:29.27647
5602	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:22:48.651505
5603	07112416161534109	0%	326.87MB/2136.98MB : 15.30%	2024-11-28 20:22:53.892211
5604	07112416161534109	0%	326.69MB/2136.98MB : 15.29%	2024-11-28 20:23:35.994989
5605	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:23:42.046775
5606	07112416161534109	0%	326.69MB/2136.98MB : 15.29%	2024-11-28 20:24:00.723695
5607	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:24:06.758085
5608	07112416161534109	0%	326.69MB/2136.98MB : 15.29%	2024-11-28 20:24:14.482633
5609	28112417573395344	11%	30.08MB/362.63MB : 8.30%	2024-11-28 20:24:20.506314
5610	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:25:14.31408
5611	07112416161534109	0%	327.47MB/2136.98MB : 15.32%	2024-11-28 20:25:19.512627
5612	07112416161534109	0%	327.47MB/2136.98MB : 15.32%	2024-11-28 20:25:28.12811
5613	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:25:34.131046
5614	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 20:26:27.014358
5615	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:26:32.210047
5616	28112417573395344	14%	30.12MB/362.63MB : 8.31%	2024-11-28 20:26:41.684804
5617	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:26:46.885499
5618	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:27:38.925948
5619	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:27:44.958621
5620	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:27:53.56573
5621	28112417573395344	2%	30.12MB/362.63MB : 8.31%	2024-11-28 20:27:59.844039
5622	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:28:52.449978
5623	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:28:57.783299
5624	28112417573395344	9%	30.08MB/362.63MB : 8.30%	2024-11-28 20:29:07.416277
5625	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:29:12.628053
5626	28112417573395344	13%	30.09MB/362.63MB : 8.30%	2024-11-28 20:30:05.537141
5627	07112416161534109	1%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:30:10.73436
5628	28112417573395344	6%	30.09MB/362.63MB : 8.30%	2024-11-28 20:30:20.142917
5629	07112416161534109	0%	327.53MB/2136.98MB : 15.33%	2024-11-28 20:30:25.351799
5630	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:31:18.243
5631	28112417573395344	1%	30.16MB/362.63MB : 8.32%	2024-11-28 20:42:54.895479
5632	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 20:42:55.744721
5633	07112416161534109	0%	327.78MB/2136.98MB : 15.34%	2024-11-28 20:43:00.091616
5634	07112416161534109	0%	327.79MB/2136.98MB : 15.34%	2024-11-28 20:43:00.942764
5635	07112416161534109	1%	327.78MB/2136.98MB : 15.34%	2024-11-28 20:44:06.841051
5636	07112416161534109	1%	327.79MB/2136.98MB : 15.34%	2024-11-28 20:44:07.58336
5637	28112417573395344	6%	30.16MB/362.63MB : 8.32%	2024-11-28 20:44:12.874371
5638	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 20:44:13.71188
5639	07112416161534109	0%	327.79MB/2136.98MB : 15.34%	2024-11-28 20:45:19.576981
5640	07112416161534109	0%	327.85MB/2136.98MB : 15.34%	2024-11-28 20:45:20.643666
5641	28112417573395344	12%	30.13MB/362.63MB : 8.31%	2024-11-28 20:45:26.597821
5642	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 20:45:27.650467
5643	07112416161534109	1%	327.79MB/2136.98MB : 15.34%	2024-11-28 20:46:33.349381
5644	07112416161534109	1%	327.85MB/2136.98MB : 15.34%	2024-11-28 20:46:34.419306
5645	28112417573395344	2%	30.13MB/362.63MB : 8.31%	2024-11-28 20:46:39.356964
5646	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 20:46:40.45463
5647	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:47:36.689811
5648	28112417573395344	5%	30.08MB/362.63MB : 8.30%	2024-11-28 20:47:42.692163
5649	28112417573395344	8%	30.08MB/362.63MB : 8.30%	2024-11-28 20:47:46.866362
5650	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:47:52.074455
5651	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:48:01.723073
5652	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:48:06.907961
5653	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:48:59.653872
5654	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:49:04.865563
5655	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:49:14.380771
5656	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:49:19.573052
5657	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:50:11.523936
5658	28112417573395344	5%	30.08MB/362.63MB : 8.30%	2024-11-28 20:50:17.564449
5659	07112416161534109	0%	327.71MB/2136.98MB : 15.34%	2024-11-28 20:50:26.330987
5660	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:50:33.29989
5661	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:50:52.014931
5662	28112417573395344	10%	30.08MB/362.63MB : 8.30%	2024-11-28 20:50:58.062409
5663	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:51:24.227414
5664	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:51:29.053365
5665	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 20:51:30.27604
5666	28112417573395344	10%	30.08MB/362.63MB : 8.30%	2024-11-28 20:51:35.131134
5667	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:52:37.986139
5668	07112416161534109	0%	327.98MB/2136.98MB : 15.35%	2024-11-28 20:52:41.840159
5669	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 20:52:44.023677
5670	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 20:52:47.83118
5671	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 20:53:51.590204
5672	28112417573395344	8%	30.17MB/362.63MB : 8.32%	2024-11-28 20:53:55.366707
5673	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:53:56.791151
5674	07112416161534109	0%	327.98MB/2136.98MB : 15.35%	2024-11-28 20:54:00.842785
5675	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:55:03.443637
5676	07112416161534109	1%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:55:07.51356
5677	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 20:55:09.450963
5678	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 20:55:13.509804
5679	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:56:18.237606
5680	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 20:56:21.043748
5681	07112416161534109	0%	327.84MB/2136.98MB : 15.34%	2024-11-28 20:56:23.431264
5682	07112416161534109	0%	327.98MB/2136.98MB : 15.35%	2024-11-28 20:56:26.237421
5683	07112416161534109	0%	328.15MB/2136.98MB : 15.36%	2024-11-28 20:57:30.13896
5684	07112416161534109	1%	328.29MB/2136.98MB : 15.36%	2024-11-28 20:57:32.954413
5685	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 20:57:36.206505
5686	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 20:57:39.053695
5687	07112416161534109	0%	328.27MB/2136.98MB : 15.36%	2024-11-28 20:58:42.911782
5688	07112416161534109	0%	328.41MB/2136.98MB : 15.37%	2024-11-28 20:58:45.782272
5689	28112417573395344	2%	30.08MB/362.63MB : 8.30%	2024-11-28 20:58:49.643657
5690	28112417573395344	16%	30.17MB/362.63MB : 8.32%	2024-11-28 20:58:51.796938
5691	07112416161534109	0%	328.27MB/2136.98MB : 15.36%	2024-11-28 20:59:56.373682
5692	07112416161534109	0%	328.41MB/2136.98MB : 15.37%	2024-11-28 20:59:58.510189
5693	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 21:00:02.376524
5694	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 21:00:04.544895
5695	07112416161534109	0%	328.27MB/2136.98MB : 15.36%	2024-11-28 21:01:09.070962
5696	07112416161534109	1%	328.41MB/2136.98MB : 15.37%	2024-11-28 21:01:12.325786
5697	28112417573395344	10%	30.08MB/362.63MB : 8.30%	2024-11-28 21:01:15.189504
5698	28112417573395344	10%	30.17MB/362.63MB : 8.32%	2024-11-28 21:01:18.358451
5699	07112416161534109	0%	328.27MB/2136.98MB : 15.36%	2024-11-28 21:02:21.89236
5700	07112416161534109	0%	328.41MB/2136.98MB : 15.37%	2024-11-28 21:02:25.15549
5701	28112417573395344	6%	30.08MB/362.63MB : 8.30%	2024-11-28 21:02:27.949776
5702	28112417573395344	8%	30.17MB/362.63MB : 8.32%	2024-11-28 21:02:31.158987
5703	07112416161534109	0%	328.27MB/2136.98MB : 15.36%	2024-11-28 21:03:34.579716
5704	07112416161534109	0%	328.40MB/2136.98MB : 15.37%	2024-11-28 21:03:45.742017
5705	07112416161534109	1%	328.41MB/2136.98MB : 15.37%	2024-11-28 21:03:46.640668
5706	28112417573395344	11%	30.16MB/362.63MB : 8.32%	2024-11-28 21:03:51.746538
5707	28112417573395344	11%	30.17MB/362.63MB : 8.32%	2024-11-28 21:03:52.689949
5708	28112417573395344	2%	30.16MB/362.63MB : 8.32%	2024-11-28 21:04:59.26817
5709	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 21:05:00.258152
5710	07112416161534109	0%	328.58MB/2136.98MB : 15.38%	2024-11-28 21:05:04.461927
5711	07112416161534109	0%	328.61MB/2136.98MB : 15.38%	2024-11-28 21:05:05.470481
5712	07112416161534109	0%	328.52MB/2136.98MB : 15.37%	2024-11-28 21:06:11.17465
5713	07112416161534109	0%	328.58MB/2136.98MB : 15.38%	2024-11-28 21:06:12.209941
5714	28112417573395344	6%	30.16MB/362.63MB : 8.32%	2024-11-28 21:06:17.586971
5715	28112417573395344	6%	30.17MB/362.63MB : 8.32%	2024-11-28 21:06:18.624704
5716	07112416161534109	1%	328.57MB/2136.98MB : 15.38%	2024-11-28 21:06:58.832979
5717	07112416161534109	1%	328.58MB/2136.98MB : 15.38%	2024-11-28 21:06:59.839993
5718	28112417573395344	2%	30.16MB/362.63MB : 8.32%	2024-11-28 21:07:04.875184
5719	28112417573395344	12%	30.17MB/362.63MB : 8.32%	2024-11-28 21:07:05.862488
5720	28112417573395344	12%	30.08MB/362.63MB : 8.30%	2024-11-28 21:07:30.376836
5721	07112416161534109	0%	328.44MB/2136.98MB : 15.37%	2024-11-28 21:07:35.57591
5722	07112416161534109	0%	328.44MB/2136.98MB : 15.37%	2024-11-28 21:08:11.58304
5723	28112417573395344	7%	30.08MB/362.63MB : 8.30%	2024-11-28 21:08:17.587214
5724	07112416161534109	0%	328.57MB/2136.98MB : 15.38%	2024-11-28 21:10:47.311
5725	07112416161534109	0%	328.58MB/2136.98MB : 15.38%	2024-11-28 21:10:48.25714
5726	28112417573395344	7%	30.16MB/362.63MB : 8.32%	2024-11-28 21:10:53.308637
5727	28112417573395344	7%	30.17MB/362.63MB : 8.32%	2024-11-28 21:10:54.278112
\.


--
-- TOC entry 5031 (class 0 OID 16605)
-- Dependencies: 241
-- Data for Name: router_details; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: postgres
--

COPY bgpmonsec_project.router_details (router_id, version, memory, "IP", hostname, uptime, ios, serial, model) FROM stdin;
28062414425068998	12.4(24)T5	491520K/32768K	1.1.1.5	SP3E	28 minutes	tftp://255.255.255.255/unknown	4279256517	7206VXR
20072418142931314	12.4(24)T5	491520K/32768K	1.1.1.3	SP2E	6 hours, 37 minutes	tftp://255.255.255.255/unknown	4279256517	7206VXR
28062414183645219	16.7.1	1222774K/3075K	192.168.0.1	SP1	N/A	bootflash:packages.conf	99C6T8B1XET	CSR1000V
28072417303662518	12.4(24)T5	491520K/32768K	1.1.1.5	SP3E	N/A	tftp://255.255.255.255/unknown	4279256517	7206VXR
20072418145628243	12.4(24)T5	491520K/32768K	1.1.1.2	SP1E	4 hours, 56 minutes	tftp://255.255.255.255/unknown	4279256517	7206VXR
28112417573395344	12.4(24)T5	491520K/32768K	1.1.1.2	R1	2 hours, 46 minutes	tftp://255.255.255.255/unknown	4279256517	7206VXR
07112416161534109	16.7.1	2188406K/3075K	192.168.0.9	SP1	2 hours, 46 minutes	bootflash:packages.conf	9J9MRT8FP8R	CSR1000V
28062414365385132	12.4(24)T5	491520K/32768K	1.1.1.4	SP2	6 hours, 34 minutes	tftp://255.255.255.255/unknown	4279256517	7206VXR
\.


--
-- TOC entry 5041 (class 0 OID 16696)
-- Dependencies: 251
-- Data for Name: rpki_router_connection_config; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: postgres
--

COPY bgpmonsec_project.rpki_router_connection_config ("ID", router_id, config_status, rpki_server_connection_from_router) FROM stdin;
1	1234	123	123
7	07112416161534109	Configured	Disconnected
2	28112417573395344	Not Supported	No Connection
\.


--
-- TOC entry 5039 (class 0 OID 16681)
-- Dependencies: 249
-- Data for Name: rpki_server; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: postgres
--

COPY bgpmonsec_project.rpki_server ("ID", name, ip, port, refresh_timer, web_port) FROM stdin;
\.


--
-- TOC entry 5033 (class 0 OID 16619)
-- Dependencies: 243
-- Data for Name: sh_bgp_ip; Type: TABLE DATA; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

COPY bgpmonsec_project.sh_bgp_ip (router_id, network_with_mask, mask, metric, locpref, weight, path, next_hop, "timestamp", network, "ID", rpki_status) FROM stdin;
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:04.612065	1.29.153.0	14654	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:04.612065	5.0.0.0	14655	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:04.612065	5.22.155.0	14656	\N
07112416161534109	5.22.155.0/24	24	0	0	14618	i	192.168.10.1	2024-11-27 18:11:04.612065	5.22.155.0	14657	\N
07112416161534109	87.8.54.0/24	24	0	32768	i		0.0.0.0	2024-11-27 18:11:04.612065	87.8.54.0	14658	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:34.615121	1.29.153.0	14659	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:34.615121	5.0.0.0	14660	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:11:34.615121	5.22.155.0	14661	\N
07112416161534109	5.22.155.0/24	24	0	0	14618	i	192.168.10.1	2024-11-27 18:11:34.615121	5.22.155.0	14662	\N
07112416161534109	87.8.54.0/24	24	0	32768	i		0.0.0.0	2024-11-27 18:11:34.615121	87.8.54.0	14663	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:04.603713	1.29.153.0	14664	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:04.603713	5.0.0.0	14665	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:04.603713	5.22.155.0	14666	\N
07112416161534109	5.22.155.0/24	24	0	0	14618	i	192.168.10.1	2024-11-27 18:12:04.603713	5.22.155.0	14667	\N
07112416161534109	87.8.54.0/24	24	0	32768	i		0.0.0.0	2024-11-27 18:12:04.603713	87.8.54.0	14668	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:34.614705	1.29.153.0	14669	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:34.614705	5.0.0.0	14670	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:12:34.614705	5.22.155.0	14671	\N
07112416161534109	5.22.155.0/24	24	0	0	14618	i	192.168.10.1	2024-11-27 18:12:34.614705	5.22.155.0	14672	\N
07112416161534109	87.8.54.0/24	24	0	32768	i		0.0.0.0	2024-11-27 18:12:34.614705	87.8.54.0	14673	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:02.528561	1.29.153.0	14674	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:02.528561	5.0.0.0	14675	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:02.528561	5.22.155.0	14676	\N
07112416161534109	5.22.155.0/24	24	0	0	14618	i	192.168.10.1	2024-11-27 18:13:02.528561	5.22.155.0	14677	\N
07112416161534109	87.8.54.0/24	24	0	32768	i		0.0.0.0	2024-11-27 18:13:02.528561	87.8.54.0	14678	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:24.39878	1.29.153.0	14679	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:24.39878	5.0.0.0	14680	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:24.39878	5.22.155.0	14681	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:24.39878	5.22.155.0	14682	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:13:24.39878	87.8.54.0	14683	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:37.635986	1.29.153.0	14684	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:37.635986	5.0.0.0	14685	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:37.635986	5.22.155.0	14686	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:13:37.635986	5.22.155.0	14687	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:13:37.635986	87.8.54.0	14688	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:07.640455	1.29.153.0	14689	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:07.640455	5.0.0.0	14690	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:07.640455	5.22.155.0	14691	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:07.640455	5.22.155.0	14692	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:14:07.640455	87.8.54.0	14693	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:38.246897	1.29.153.0	14694	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:38.246897	5.0.0.0	14695	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:38.246897	5.22.155.0	14696	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:14:38.246897	5.22.155.0	14697	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:14:38.246897	87.8.54.0	14698	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:08.255808	1.29.153.0	14699	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:08.255808	5.0.0.0	14700	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:08.255808	5.22.155.0	14701	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:08.255808	5.22.155.0	14702	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:15:08.255808	87.8.54.0	14703	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:58.294039	1.29.153.0	14704	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:58.294039	5.0.0.0	14705	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:58.294039	5.22.155.0	14706	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:15:58.294039	5.22.155.0	14707	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:15:58.294039	87.8.54.0	14708	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:01.643086	1.29.153.0	14709	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:01.643086	5.0.0.0	14710	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:01.643086	5.22.155.0	14711	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:01.643086	5.22.155.0	14712	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:16:01.643086	87.8.54.0	14713	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:31.640219	1.29.153.0	14714	\N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:31.640219	5.0.0.0	14715	\N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:31.640219	5.22.155.0	14716	\N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:31.640219	5.22.155.0	14717	\N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:16:31.640219	87.8.54.0	14718	\N
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:46.220101	1.29.153.0	14719	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:46.220101	5.0.0.0	14720	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:46.220101	5.22.155.0	14721	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:16:46.220101	5.22.155.0	14722	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:16:46.220101	87.8.54.0	14723	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:16.215666	1.29.153.0	14724	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:16.215666	5.0.0.0	14725	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:16.215666	5.22.155.0	14726	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:16.215666	5.22.155.0	14727	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:17:16.215666	87.8.54.0	14728	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:46.253875	1.29.153.0	14729	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:46.253875	5.0.0.0	14730	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:46.253875	5.22.155.0	14731	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:17:46.253875	5.22.155.0	14732	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:17:46.253875	87.8.54.0	14733	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:16.252586	1.29.153.0	14734	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:16.252586	5.0.0.0	14735	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:16.252586	5.22.155.0	14736	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:16.252586	5.22.155.0	14737	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:18:16.252586	87.8.54.0	14738	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:58.263204	1.29.153.0	14739	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:58.263204	5.0.0.0	14740	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:58.263204	5.22.155.0	14741	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:18:58.263204	5.22.155.0	14742	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:18:58.263204	87.8.54.0	14743	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:19:58.249336	1.29.153.0	14744	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:19:58.249336	5.0.0.0	14745	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:19:58.249336	5.22.155.0	14746	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:19:58.249336	5.22.155.0	14747	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:19:58.249336	87.8.54.0	14748	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:20:58.261566	1.29.153.0	14749	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:20:58.261566	5.0.0.0	14750	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:20:58.261566	5.22.155.0	14751	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:20:58.261566	5.22.155.0	14752	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:20:58.261566	87.8.54.0	14753	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:21:58.263363	1.29.153.0	14754	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:21:58.263363	5.0.0.0	14755	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:21:58.263363	5.22.155.0	14756	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:21:58.263363	5.22.155.0	14757	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:21:58.263363	87.8.54.0	14758	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:22:58.25791	1.29.153.0	14759	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:22:58.25791	5.0.0.0	14760	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:22:58.25791	5.22.155.0	14761	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:22:58.25791	5.22.155.0	14762	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:22:58.25791	87.8.54.0	14763	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:23:58.254433	1.29.153.0	14764	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:23:58.254433	5.0.0.0	14765	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:23:58.254433	5.22.155.0	14766	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:23:58.254433	5.22.155.0	14767	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:23:58.254433	87.8.54.0	14768	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:24:58.262708	1.29.153.0	14769	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:24:58.262708	5.0.0.0	14770	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:24:58.262708	5.22.155.0	14771	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:24:58.262708	5.22.155.0	14772	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:24:58.262708	87.8.54.0	14773	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:25:58.257631	1.29.153.0	14774	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:25:58.257631	5.0.0.0	14775	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:25:58.257631	5.22.155.0	14776	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:25:58.257631	5.22.155.0	14777	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:25:58.257631	87.8.54.0	14778	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:26:58.254859	1.29.153.0	14779	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:26:58.254859	5.0.0.0	14780	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:26:58.254859	5.22.155.0	14781	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:26:58.254859	5.22.155.0	14782	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:26:58.254859	87.8.54.0	14783	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:27:58.255539	1.29.153.0	14784	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:27:58.255539	5.0.0.0	14785	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:27:58.255539	5.22.155.0	14786	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:27:58.255539	5.22.155.0	14787	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:27:58.255539	87.8.54.0	14788	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:28:58.255319	1.29.153.0	14789	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:28:58.255319	5.0.0.0	14790	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:28:58.255319	5.22.155.0	14791	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:28:58.255319	5.22.155.0	14792	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:28:58.255319	87.8.54.0	14793	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:29:58.261166	1.29.153.0	14794	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:29:58.261166	5.0.0.0	14795	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:29:58.261166	5.22.155.0	14796	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:29:58.261166	5.22.155.0	14797	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:29:58.261166	87.8.54.0	14798	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:30:58.259099	1.29.153.0	14799	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:30:58.259099	5.0.0.0	14800	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:30:58.259099	5.22.155.0	14801	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:30:58.259099	5.22.155.0	14802	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:30:58.259099	87.8.54.0	14803	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:31:58.262881	1.29.153.0	14804	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:31:58.262881	5.0.0.0	14805	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:31:58.262881	5.22.155.0	14806	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:31:58.262881	5.22.155.0	14807	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:31:58.262881	87.8.54.0	14808	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:32:58.254287	1.29.153.0	14809	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:32:58.254287	5.0.0.0	14810	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:32:58.254287	5.22.155.0	14811	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:32:58.254287	5.22.155.0	14812	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:32:58.254287	87.8.54.0	14813	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:33:58.250249	1.29.153.0	14814	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:33:58.250249	5.0.0.0	14815	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:33:58.250249	5.22.155.0	14816	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:33:58.250249	5.22.155.0	14817	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:33:58.250249	87.8.54.0	14818	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:25.105211	1.29.153.0	14819	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:25.105211	5.0.0.0	14820	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:25.105211	5.22.155.0	14821	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:25.105211	5.22.155.0	14822	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:34:25.105211	87.8.54.0	14823	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:26.269972	1.29.153.0	14824	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:26.269972	5.0.0.0	14825	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:26.269972	5.22.155.0	14826	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:26.269972	5.22.155.0	14827	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:34:26.269972	87.8.54.0	14828	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:37.981189	1.29.153.0	14829	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:37.981189	5.0.0.0	14830	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:37.981189	5.22.155.0	14831	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 18:34:37.981189	5.22.155.0	14832	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 18:34:37.981189	87.8.54.0	14833	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 19:25:10.324811	1.29.153.0	14834	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 19:25:10.324811	5.0.0.0	14835	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 19:25:10.324811	5.22.155.0	14836	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 19:25:10.324811	5.22.155.0	14837	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 19:25:10.324811	87.8.54.0	14838	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 19:30:03.760351	1.29.153.0	14839	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 19:30:03.760351	5.0.0.0	14840	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 19:30:03.760351	5.22.155.0	14841	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 19:30:03.760351	5.22.155.0	14842	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 19:30:03.760351	87.8.54.0	14843	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:50.74954	1.29.153.0	14844	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:50.74954	5.0.0.0	14845	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:50.74954	5.22.155.0	14846	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:50.74954	5.22.155.0	14847	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:04:50.74954	87.8.54.0	14848	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:59.168248	1.29.153.0	14849	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:59.168248	5.0.0.0	14850	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:59.168248	5.22.155.0	14851	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:04:59.168248	5.22.155.0	14852	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:04:59.168248	87.8.54.0	14853	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:38.722184	1.29.153.0	14854	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:38.722184	5.0.0.0	14855	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:38.722184	5.22.155.0	14856	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:38.722184	5.22.155.0	14857	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:07:38.722184	87.8.54.0	14858	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:39.920404	1.29.153.0	14859	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:39.920404	5.0.0.0	14860	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:39.920404	5.22.155.0	14861	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:39.920404	5.22.155.0	14862	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:07:39.920404	87.8.54.0	14863	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:46.452958	1.29.153.0	14864	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:46.452958	5.0.0.0	14865	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:46.452958	5.22.155.0	14866	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:07:46.452958	5.22.155.0	14867	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:07:46.452958	87.8.54.0	14868	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:52.350563	1.29.153.0	14869	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:52.350563	5.0.0.0	14870	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:52.350563	5.22.155.0	14871	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:52.350563	5.22.155.0	14872	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:10:52.350563	87.8.54.0	14873	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:57.403809	1.29.153.0	14874	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:57.403809	5.0.0.0	14875	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:57.403809	5.22.155.0	14876	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:10:57.403809	5.22.155.0	14877	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:10:57.403809	87.8.54.0	14878	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:36.597664	1.29.153.0	14879	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:36.597664	5.0.0.0	14880	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:36.597664	5.22.155.0	14881	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:36.597664	5.22.155.0	14882	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:51:36.597664	87.8.54.0	14883	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:39.928078	1.29.153.0	14884	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:39.928078	5.0.0.0	14885	I
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:39.928078	5.22.155.0	14886	I
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-27 20:51:39.928078	5.22.155.0	14887	V
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-27 20:51:39.928078	87.8.54.0	14888	V
07112416161534109	1.29.153.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-28 17:44:29.862887	1.29.153.0	14889	N
07112416161534109	5.0.0.0/19	19	0	0	0	14618 i	192.168.10.1	2024-11-28 17:44:29.862887	5.0.0.0	14890	N
07112416161534109	5.22.155.0/25	25	0	0	0	14618 i	192.168.10.1	2024-11-28 17:44:29.862887	5.22.155.0	14891	N
07112416161534109	5.22.155.0/24	24	0	0	0	14618 i	192.168.10.1	2024-11-28 17:44:29.862887	5.22.155.0	14892	N
07112416161534109	87.8.54.0/24	24	0	0	32768	i	0.0.0.0	2024-11-28 17:44:29.862887	87.8.54.0	14893	V
\.


--
-- TOC entry 5029 (class 0 OID 16579)
-- Dependencies: 239
-- Data for Name: ROUTERS_INPUT; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public."ROUTERS_INPUT" (router_id, "IP", username, password, description, r_state, id, downtime) FROM stdin;
28112417573395344	1.1.1.2	admin	cisco	R2	active	8	\N
07112416161534109	192.168.0.9	admin	cisco	rr	active	7	\N
\.


--
-- TOC entry 5009 (class 0 OID 16412)
-- Dependencies: 219
-- Data for Name: account_routerinput; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.account_routerinput (id, ip_address, protocol, username, password) FROM stdin;
\.


--
-- TOC entry 5015 (class 0 OID 16437)
-- Dependencies: 225
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 5017 (class 0 OID 16446)
-- Dependencies: 227
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5013 (class 0 OID 16430)
-- Dependencies: 223
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add router input	7	add_routerinput
26	Can change router input	7	change_routerinput
27	Can delete router input	7	delete_routerinput
28	Can view router input	7	view_routerinput
29	Can add profile	8	add_profile
30	Can change profile	8	change_profile
31	Can delete profile	8	delete_profile
32	Can view profile	8	view_profile
\.


--
-- TOC entry 5019 (class 0 OID 16453)
-- Dependencies: 229
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$VYufkf7o561yr2ZXBbimAP$5frmCMHTkBBwQx/XRpADUX09tctcHJixt0x09RO5Ntw=	2024-07-28 15:36:39.067596+03	f	vasile	vasile	bistricianu		f	t	2024-07-28 15:36:38.852853+03
3	pbkdf2_sha256$260000$5kNe8tUWA5QU41BUe4JrnO$iB8WpXL7J1H+2Ey0hJmWtC0aeN0rjLQXIFFE+TSjlFo=	2024-07-28 20:19:47.804862+03	f	vas	admin2	bistri		f	t	2024-07-28 20:19:47.607656+03
1	pbkdf2_sha256$260000$HSdFzP777RpmeNxAtfRWOI$N9wO+NPFkqTCYv9U16dCsg0r87nh4s47UihX9360bLU=	2024-11-24 15:21:53.038147+02	f	admin	admin	admin		f	t	2024-06-28 13:58:46.647468+03
\.


--
-- TOC entry 5021 (class 0 OID 16462)
-- Dependencies: 231
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 5023 (class 0 OID 16469)
-- Dependencies: 233
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 5025 (class 0 OID 16528)
-- Dependencies: 235
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 5011 (class 0 OID 16421)
-- Dependencies: 221
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	account	routerinput
8	userprofile	profile
\.


--
-- TOC entry 5007 (class 0 OID 16403)
-- Dependencies: 217
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	account	0001_initial	2024-06-28 13:58:01.656756+03
2	contenttypes	0001_initial	2024-06-28 13:58:01.671394+03
3	auth	0001_initial	2024-06-28 13:58:01.789066+03
4	admin	0001_initial	2024-06-28 13:58:01.812156+03
5	admin	0002_logentry_remove_auto_add	2024-06-28 13:58:01.819265+03
6	admin	0003_logentry_add_action_flag_choices	2024-06-28 13:58:01.825868+03
7	contenttypes	0002_remove_content_type_name	2024-06-28 13:58:01.840884+03
8	auth	0002_alter_permission_name_max_length	2024-06-28 13:58:01.847489+03
9	auth	0003_alter_user_email_max_length	2024-06-28 13:58:01.854404+03
10	auth	0004_alter_user_username_opts	2024-06-28 13:58:01.861345+03
11	auth	0005_alter_user_last_login_null	2024-06-28 13:58:01.86926+03
12	auth	0006_require_contenttypes_0002	2024-06-28 13:58:01.873885+03
13	auth	0007_alter_validators_add_error_messages	2024-06-28 13:58:01.890017+03
14	auth	0008_alter_user_username_max_length	2024-06-28 13:58:01.900501+03
15	auth	0009_alter_user_last_name_max_length	2024-06-28 13:58:01.906898+03
16	auth	0010_alter_group_name_max_length	2024-06-28 13:58:01.915432+03
17	auth	0011_update_proxy_permissions	2024-06-28 13:58:01.921981+03
18	auth	0012_alter_user_first_name_max_length	2024-06-28 13:58:01.929308+03
19	sessions	0001_initial	2024-06-28 13:58:01.943105+03
20	userprofile	0001_initial	2024-06-28 13:58:01.959427+03
\.


--
-- TOC entry 5026 (class 0 OID 16557)
-- Dependencies: 236
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
0we4pt9h7czj35mu7iih4c57hyree4wp	.eJxVjEEOwiAQRe_C2hAHygAu3fcMZAqMVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hTuIiQJx-t4niI9cdpDvVW5Ox1XWZJ7kr8qBdji3l5_Vw_w4K9fKtteeBhjM4NMjKg4_ZoLeaLSAoQgvOWDsYH7VTnB2gSo4RIybDBrV4fwClJjZW:1sN9JW:V6DV3sY5fXpPXfq11riDRA9khPMw9kLkLZb1bimIhk4	2024-07-12 13:58:46.856146+03
w4fghpibmwjmv5uetmhlfz4ezobzu941	.eJxVjEEOwiAQRe_C2hAHygAu3fcMZAqMVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hTuIiQJx-t4niI9cdpDvVW5Ox1XWZJ7kr8qBdji3l5_Vw_w4K9fKtteeBhjM4NMjKg4_ZoLeaLSAoQgvOWDsYH7VTnB2gSo4RIybDBrV4fwClJjZW:1sY61C:xfW0N5zw9e1Tvih24zkE0g-5CPGJbeq6MKinsTgrLzI	2024-08-11 18:41:06.908907+03
dzmp4dpq3dqvs0ymexsul9a91j9baar9	.eJxVjDsOwyAQBe9CHSG-BqdM7zOghV2CkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYkV2ZZpffLUJ6Uj0APqDeG0-trssc-aHwk3Y-NaTX7XT_Dgr0stfeZCWUH6OXo88oI9pBSqczDk4Y0pp2pnOS3hEgUDRklLWWIBsnsmafL9QdN-Q:1sY7Yh:QKwYLlW5_NGQbF_lqgQeSfR2nvgzPtKHyWIl-tIIW8k	2024-08-11 20:19:47.806365+03
h6mzbve143zo8sbmkl6xl8fjki3ey04a	.eJxVjEEOwiAQRe_C2hAHygAu3fcMZAqMVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hTuIiQJx-t4niI9cdpDvVW5Ox1XWZJ7kr8qBdji3l5_Vw_w4K9fKtteeBhjM4NMjKg4_ZoLeaLSAoQgvOWDsYH7VTnB2gSo4RIybDBrV4fwClJjZW:1t94d9:JZWigAE4jZhLM0J_kL5qXMUWuG_7A57qVRfgCjC7iZg	2024-11-21 17:41:07.034922+02
a9kt7yl7bdp45l4bcknf3s19xihfbfkt	.eJxVjEEOwiAQRe_C2hAHygAu3fcMZAqMVA0kpV0Z765NutDtf-_9lwi0rSVsPS9hTuIiQJx-t4niI9cdpDvVW5Ox1XWZJ7kr8qBdji3l5_Vw_w4K9fKtteeBhjM4NMjKg4_ZoLeaLSAoQgvOWDsYH7VTnB2gSo4RIybDBrV4fwClJjZW:1tFCYj:NIL2lHgyUo7_JPo_a8d3975BO1rpWcoRVcPx9fnhGiA	2024-12-08 15:21:53.04103+02
\.


--
-- TOC entry 5028 (class 0 OID 16567)
-- Dependencies: 238
-- Data for Name: userprofile_profile; Type: TABLE DATA; Schema: public; Owner: bgpmonsec_user
--

COPY public.userprofile_profile (id, image, bio, user_id) FROM stdin;
2	Default/default.png		2
1	Profiles/logo.png	test	1
3	Default/default.png		3
\.


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 252
-- Name: alerts_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: postgres
--

SELECT pg_catalog.setval('bgpmonsec_project."alerts_ID_seq"', 4, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 244
-- Name: bgp_summary_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('bgpmonsec_project."bgp_summary_ID_seq"', 8706, true);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 246
-- Name: router_cpu_memory_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('bgpmonsec_project."router_cpu_memory_ID_seq"', 5727, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 250
-- Name: rpki_router_connection_config_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: postgres
--

SELECT pg_catalog.setval('bgpmonsec_project."rpki_router_connection_config_ID_seq"', 617, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 248
-- Name: rpki_server_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: postgres
--

SELECT pg_catalog.setval('bgpmonsec_project."rpki_server_ID_seq"', 1, false);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 245
-- Name: sh_bgp_ip_ID_seq; Type: SEQUENCE SET; Schema: bgpmonsec_project; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('bgpmonsec_project."sh_bgp_ip_ID_seq"', 14893, true);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 240
-- Name: ROUTERS_INPUT_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public."ROUTERS_INPUT_id_seq"', 8, true);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 218
-- Name: account_routerinput_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.account_routerinput_id_seq', 1, false);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 224
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 220
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 237
-- Name: userprofile_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bgpmonsec_user
--

SELECT pg_catalog.setval('public.userprofile_profile_id_seq', 3, true);


--
-- TOC entry 4850 (class 2606 OID 16611)
-- Name: router_details router_details_pkey; Type: CONSTRAINT; Schema: bgpmonsec_project; Owner: postgres
--

ALTER TABLE ONLY bgpmonsec_project.router_details
    ADD CONSTRAINT router_details_pkey PRIMARY KEY (router_id);


--
-- TOC entry 4852 (class 2606 OID 16702)
-- Name: rpki_router_connection_config unique_router_id; Type: CONSTRAINT; Schema: bgpmonsec_project; Owner: postgres
--

ALTER TABLE ONLY bgpmonsec_project.rpki_router_connection_config
    ADD CONSTRAINT unique_router_id UNIQUE (router_id);


--
-- TOC entry 4848 (class 2606 OID 16585)
-- Name: ROUTERS_INPUT ROUTERS_INPUT_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public."ROUTERS_INPUT"
    ADD CONSTRAINT "ROUTERS_INPUT_pkey" PRIMARY KEY (router_id);


--
-- TOC entry 4798 (class 2606 OID 16419)
-- Name: account_routerinput account_routerinput_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.account_routerinput
    ADD CONSTRAINT account_routerinput_pkey PRIMARY KEY (id);


--
-- TOC entry 4810 (class 2606 OID 16555)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4815 (class 2606 OID 16485)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4818 (class 2606 OID 16451)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4812 (class 2606 OID 16442)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 16476)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4807 (class 2606 OID 16435)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 16467)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 16500)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4820 (class 2606 OID 16458)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 16474)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4835 (class 2606 OID 16514)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4823 (class 2606 OID 16550)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4838 (class 2606 OID 16536)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4800 (class 2606 OID 16428)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4802 (class 2606 OID 16426)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 16410)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 16563)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4845 (class 2606 OID 16572)
-- Name: userprofile_profile userprofile_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.userprofile_profile
    ADD CONSTRAINT userprofile_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 4808 (class 1259 OID 16556)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4813 (class 1259 OID 16496)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4816 (class 1259 OID 16497)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4803 (class 1259 OID 16482)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4824 (class 1259 OID 16512)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4827 (class 1259 OID 16511)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4830 (class 1259 OID 16526)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4833 (class 1259 OID 16525)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4821 (class 1259 OID 16551)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4836 (class 1259 OID 16547)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4839 (class 1259 OID 16548)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4840 (class 1259 OID 16565)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4843 (class 1259 OID 16564)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4846 (class 1259 OID 16578)
-- Name: userprofile_profile_user_id_f37c6bb1; Type: INDEX; Schema: public; Owner: bgpmonsec_user
--

CREATE INDEX userprofile_profile_user_id_f37c6bb1 ON public.userprofile_profile USING btree (user_id);


--
-- TOC entry 4854 (class 2606 OID 16491)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4855 (class 2606 OID 16486)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4853 (class 2606 OID 16477)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4856 (class 2606 OID 16506)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4857 (class 2606 OID 16501)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4858 (class 2606 OID 16520)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4859 (class 2606 OID 16515)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4860 (class 2606 OID 16537)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4861 (class 2606 OID 16542)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4862 (class 2606 OID 16573)
-- Name: userprofile_profile userprofile_profile_user_id_f37c6bb1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bgpmonsec_user
--

ALTER TABLE ONLY public.userprofile_profile
    ADD CONSTRAINT userprofile_profile_user_id_f37c6bb1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA bgpmonsec_project; Type: ACL; Schema: -; Owner: bgpmonsec_user
--

GRANT ALL ON SCHEMA bgpmonsec_project TO postgres WITH GRANT OPTION;


-- Completed on 2024-11-28 21:19:32

--
-- PostgreSQL database dump complete
--

