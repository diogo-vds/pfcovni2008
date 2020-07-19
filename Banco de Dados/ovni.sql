--
-- PostgreSQL database dump
--

-- Started on 2008-11-01 21:19:34

SET client_encoding = 'LATIN9';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2788 (class 1262 OID 43072)
-- Name: ovni; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ovni WITH TEMPLATE = template0 ENCODING = 'LATIN9';


ALTER DATABASE ovni OWNER TO postgres;

\connect ovni

SET client_encoding = 'LATIN9';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 2789 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 973 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 843 (class 0 OID 0)
-- Name: cube; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE cube;


--
-- TOC entry 18 (class 1255 OID 43074)
-- Dependencies: 5 843
-- Name: cube_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_in(cstring) RETURNS cube
    AS '$libdir/cube', 'cube_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_in(cstring) OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 43075)
-- Dependencies: 5 843
-- Name: cube_out(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_out(cube) RETURNS cstring
    AS '$libdir/cube', 'cube_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_out(cube) OWNER TO postgres;

--
-- TOC entry 842 (class 1247 OID 43073)
-- Dependencies: 5 19 18
-- Name: cube; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE cube (
    INTERNALLENGTH = variable,
    INPUT = cube_in,
    OUTPUT = cube_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.cube OWNER TO postgres;

--
-- TOC entry 2791 (class 0 OID 0)
-- Dependencies: 842
-- Name: TYPE cube; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE cube IS 'multi-dimensional cube ''(FLOAT-1, FLOAT-2, ..., FLOAT-N), (FLOAT-1, FLOAT-2, ..., FLOAT-N)''';


--
-- TOC entry 855 (class 0 OID 0)
-- Name: ean13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ean13;


--
-- TOC entry 20 (class 1255 OID 43078)
-- Dependencies: 5 855
-- Name: ean13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_in(cstring) RETURNS ean13
    AS '$libdir/isn', 'ean13_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_in(cstring) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 43079)
-- Dependencies: 5 855
-- Name: ean13_out(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(ean13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(ean13) OWNER TO postgres;

--
-- TOC entry 854 (class 1247 OID 43077)
-- Dependencies: 5 20 21
-- Name: ean13; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ean13 (
    INTERNALLENGTH = 8,
    INPUT = ean13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.ean13 OWNER TO postgres;

--
-- TOC entry 2792 (class 0 OID 0)
-- Dependencies: 854
-- Name: TYPE ean13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ean13 IS 'International European Article Number (EAN13)';


--
-- TOC entry 858 (class 0 OID 0)
-- Name: gtsq; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsq;


--
-- TOC entry 22 (class 1255 OID 43082)
-- Dependencies: 5 858
-- Name: gtsq_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_in(cstring) RETURNS gtsq
    AS '$libdir/tsearch2', 'gtsq_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_in(cstring) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 43083)
-- Dependencies: 5 858
-- Name: gtsq_out(gtsq); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_out(gtsq) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsq_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_out(gtsq) OWNER TO postgres;

--
-- TOC entry 857 (class 1247 OID 43081)
-- Dependencies: 5 23 22
-- Name: gtsq; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsq (
    INTERNALLENGTH = 8,
    INPUT = gtsq_in,
    OUTPUT = gtsq_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.gtsq OWNER TO postgres;

--
-- TOC entry 861 (class 0 OID 0)
-- Name: gtsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsvector;


--
-- TOC entry 24 (class 1255 OID 43086)
-- Dependencies: 5 861
-- Name: gtsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_in(cstring) RETURNS gtsvector
    AS '$libdir/tsearch2', 'gtsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 43087)
-- Dependencies: 5 861
-- Name: gtsvector_out(gtsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_out(gtsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_out(gtsvector) OWNER TO postgres;

--
-- TOC entry 860 (class 1247 OID 43085)
-- Dependencies: 24 25 5
-- Name: gtsvector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsvector (
    INTERNALLENGTH = variable,
    INPUT = gtsvector_in,
    OUTPUT = gtsvector_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.gtsvector OWNER TO postgres;

--
-- TOC entry 864 (class 0 OID 0)
-- Name: intbig_gkey; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE intbig_gkey;


--
-- TOC entry 26 (class 1255 OID 43090)
-- Dependencies: 5 864
-- Name: _intbig_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _intbig_in(cstring) RETURNS intbig_gkey
    AS '$libdir/_int', '_intbig_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_in(cstring) OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 43091)
-- Dependencies: 5 864
-- Name: _intbig_out(intbig_gkey); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _intbig_out(intbig_gkey) RETURNS cstring
    AS '$libdir/_int', '_intbig_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_out(intbig_gkey) OWNER TO postgres;

--
-- TOC entry 863 (class 1247 OID 43089)
-- Dependencies: 26 5 27
-- Name: intbig_gkey; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE intbig_gkey (
    INTERNALLENGTH = variable,
    INPUT = _intbig_in,
    OUTPUT = _intbig_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.intbig_gkey OWNER TO postgres;

--
-- TOC entry 867 (class 0 OID 0)
-- Name: isbn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn;


--
-- TOC entry 28 (class 1255 OID 43094)
-- Dependencies: 5 867
-- Name: isbn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn_in(cstring) RETURNS isbn
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn_in(cstring) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 43095)
-- Dependencies: 5 867
-- Name: isn_out(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(isbn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(isbn) OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 43093)
-- Dependencies: 29 5 28
-- Name: isbn; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn (
    INTERNALLENGTH = 8,
    INPUT = isbn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.isbn OWNER TO postgres;

--
-- TOC entry 2793 (class 0 OID 0)
-- Dependencies: 866
-- Name: TYPE isbn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE isbn IS 'International Standard Book Number (ISBN)';


--
-- TOC entry 870 (class 0 OID 0)
-- Name: isbn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn13;


--
-- TOC entry 30 (class 1255 OID 43098)
-- Dependencies: 5 870
-- Name: ean13_out(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(isbn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(isbn13) OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 43099)
-- Dependencies: 5 870
-- Name: isbn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13_in(cstring) RETURNS isbn13
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 869 (class 1247 OID 43097)
-- Dependencies: 32 30 5
-- Name: isbn13; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn13 (
    INTERNALLENGTH = 8,
    INPUT = isbn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.isbn13 OWNER TO postgres;

--
-- TOC entry 2794 (class 0 OID 0)
-- Dependencies: 869
-- Name: TYPE isbn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE isbn13 IS 'International Standard Book Number 13 (ISBN13)';


--
-- TOC entry 873 (class 0 OID 0)
-- Name: ismn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn;


--
-- TOC entry 33 (class 1255 OID 43102)
-- Dependencies: 5 873
-- Name: ismn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn_in(cstring) RETURNS ismn
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn_in(cstring) OWNER TO postgres;

--
-- TOC entry 34 (class 1255 OID 43103)
-- Dependencies: 5 873
-- Name: isn_out(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(ismn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(ismn) OWNER TO postgres;

--
-- TOC entry 872 (class 1247 OID 43101)
-- Dependencies: 5 34 33
-- Name: ismn; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn (
    INTERNALLENGTH = 8,
    INPUT = ismn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.ismn OWNER TO postgres;

--
-- TOC entry 2795 (class 0 OID 0)
-- Dependencies: 872
-- Name: TYPE ismn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ismn IS 'International Standard Music Number (ISMN)';


--
-- TOC entry 876 (class 0 OID 0)
-- Name: ismn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn13;


--
-- TOC entry 35 (class 1255 OID 43106)
-- Dependencies: 5 876
-- Name: ean13_out(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(ismn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(ismn13) OWNER TO postgres;

--
-- TOC entry 36 (class 1255 OID 43107)
-- Dependencies: 5 876
-- Name: ismn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13_in(cstring) RETURNS ismn13
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 875 (class 1247 OID 43105)
-- Dependencies: 36 35 5
-- Name: ismn13; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn13 (
    INTERNALLENGTH = 8,
    INPUT = ismn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.ismn13 OWNER TO postgres;

--
-- TOC entry 2796 (class 0 OID 0)
-- Dependencies: 875
-- Name: TYPE ismn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ismn13 IS 'International Standard Music Number 13 (ISMN13)';


--
-- TOC entry 879 (class 0 OID 0)
-- Name: issn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn;


--
-- TOC entry 37 (class 1255 OID 43110)
-- Dependencies: 5 879
-- Name: isn_out(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(issn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(issn) OWNER TO postgres;

--
-- TOC entry 38 (class 1255 OID 43111)
-- Dependencies: 5 879
-- Name: issn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn_in(cstring) RETURNS issn
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn_in(cstring) OWNER TO postgres;

--
-- TOC entry 878 (class 1247 OID 43109)
-- Dependencies: 5 37 38
-- Name: issn; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn (
    INTERNALLENGTH = 8,
    INPUT = issn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.issn OWNER TO postgres;

--
-- TOC entry 2797 (class 0 OID 0)
-- Dependencies: 878
-- Name: TYPE issn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE issn IS 'International Standard Serial Number (ISSN)';


--
-- TOC entry 882 (class 0 OID 0)
-- Name: issn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn13;


--
-- TOC entry 39 (class 1255 OID 43114)
-- Dependencies: 5 882
-- Name: ean13_out(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(issn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(issn13) OWNER TO postgres;

--
-- TOC entry 40 (class 1255 OID 43115)
-- Dependencies: 5 882
-- Name: issn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13_in(cstring) RETURNS issn13
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 881 (class 1247 OID 43113)
-- Dependencies: 5 39 40
-- Name: issn13; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn13 (
    INTERNALLENGTH = 8,
    INPUT = issn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.issn13 OWNER TO postgres;

--
-- TOC entry 2798 (class 0 OID 0)
-- Dependencies: 881
-- Name: TYPE issn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE issn13 IS 'International Standard Serial Number 13 (ISSN13)';


--
-- TOC entry 885 (class 0 OID 0)
-- Name: query_int; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE query_int;


--
-- TOC entry 41 (class 1255 OID 43118)
-- Dependencies: 5 885
-- Name: bqarr_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bqarr_in(cstring) RETURNS query_int
    AS '$libdir/_int', 'bqarr_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_in(cstring) OWNER TO postgres;

--
-- TOC entry 42 (class 1255 OID 43119)
-- Dependencies: 5 885
-- Name: bqarr_out(query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bqarr_out(query_int) RETURNS cstring
    AS '$libdir/_int', 'bqarr_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_out(query_int) OWNER TO postgres;

--
-- TOC entry 884 (class 1247 OID 43117)
-- Dependencies: 5 42 41
-- Name: query_int; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE query_int (
    INTERNALLENGTH = variable,
    INPUT = bqarr_in,
    OUTPUT = bqarr_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.query_int OWNER TO postgres;

--
-- TOC entry 888 (class 0 OID 0)
-- Name: tsquery; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsquery;


--
-- TOC entry 43 (class 1255 OID 43122)
-- Dependencies: 5 888
-- Name: tsquery_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_in(cstring) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_in(cstring) OWNER TO postgres;

--
-- TOC entry 44 (class 1255 OID 43123)
-- Dependencies: 5 888
-- Name: tsquery_out(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_out(tsquery) RETURNS cstring
    AS '$libdir/tsearch2', 'tsquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_out(tsquery) OWNER TO postgres;

--
-- TOC entry 887 (class 1247 OID 43121)
-- Dependencies: 43 44 5
-- Name: tsquery; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsquery (
    INTERNALLENGTH = variable,
    INPUT = tsquery_in,
    OUTPUT = tsquery_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.tsquery OWNER TO postgres;

--
-- TOC entry 891 (class 0 OID 0)
-- Name: tsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsvector;


--
-- TOC entry 45 (class 1255 OID 43126)
-- Dependencies: 5 891
-- Name: tsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_in(cstring) RETURNS tsvector
    AS '$libdir/tsearch2', 'tsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 46 (class 1255 OID 43127)
-- Dependencies: 5 891
-- Name: tsvector_out(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_out(tsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'tsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_out(tsvector) OWNER TO postgres;

--
-- TOC entry 890 (class 1247 OID 43125)
-- Dependencies: 45 46 5
-- Name: tsvector; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsvector (
    INTERNALLENGTH = variable,
    INPUT = tsvector_in,
    OUTPUT = tsvector_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.tsvector OWNER TO postgres;

--
-- TOC entry 894 (class 0 OID 0)
-- Name: upc; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE upc;


--
-- TOC entry 47 (class 1255 OID 43130)
-- Dependencies: 5 894
-- Name: isn_out(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(upc) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(upc) OWNER TO postgres;

--
-- TOC entry 48 (class 1255 OID 43131)
-- Dependencies: 5 894
-- Name: upc_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc_in(cstring) RETURNS upc
    AS '$libdir/isn', 'upc_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc_in(cstring) OWNER TO postgres;

--
-- TOC entry 893 (class 1247 OID 43129)
-- Dependencies: 48 47 5
-- Name: upc; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE upc (
    INTERNALLENGTH = 8,
    INPUT = upc_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.upc OWNER TO postgres;

--
-- TOC entry 2799 (class 0 OID 0)
-- Dependencies: 893
-- Name: TYPE upc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE upc IS 'Universal Product Code (UPC)';


--
-- TOC entry 896 (class 1247 OID 43134)
-- Dependencies: 2225
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dblink_pkey_results AS (
	"position" integer,
	colname text
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

--
-- TOC entry 49 (class 1255 OID 43135)
-- Dependencies: 5 842
-- Name: cube_dim(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_dim(cube) RETURNS integer
    AS '$libdir/cube', 'cube_dim'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_dim(cube) OWNER TO postgres;

--
-- TOC entry 50 (class 1255 OID 43136)
-- Dependencies: 842 5 842
-- Name: cube_distance(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_distance(cube, cube) RETURNS double precision
    AS '$libdir/cube', 'cube_distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_distance(cube, cube) OWNER TO postgres;

--
-- TOC entry 51 (class 1255 OID 43137)
-- Dependencies: 5 842
-- Name: cube_is_point(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_is_point(cube) RETURNS boolean
    AS '$libdir/cube', 'cube_is_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_is_point(cube) OWNER TO postgres;

--
-- TOC entry 52 (class 1255 OID 43138)
-- Dependencies: 5
-- Name: earth(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth() RETURNS double precision
    AS $$SELECT '6378168'::float8$$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.earth() OWNER TO postgres;

--
-- TOC entry 897 (class 1247 OID 43139)
-- Dependencies: 898 899 900 19 842 5
-- Name: earth; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN earth AS cube
	CONSTRAINT not_3d CHECK ((cube_dim(VALUE) <= 3))
	CONSTRAINT not_point CHECK (cube_is_point(VALUE))
	CONSTRAINT on_surface CHECK ((abs(((cube_distance(VALUE, '(0)'::cube) / earth()) - (1)::double precision)) < (0.00000099999999999999995)::double precision));


ALTER DOMAIN public.earth OWNER TO postgres;

--
-- TOC entry 901 (class 1247 OID 43144)
-- Dependencies: 2226
-- Name: statinfo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


ALTER TYPE public.statinfo OWNER TO postgres;

--
-- TOC entry 902 (class 1247 OID 43146)
-- Dependencies: 2227
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE public.tablefunc_crosstab_2 OWNER TO postgres;

--
-- TOC entry 903 (class 1247 OID 43148)
-- Dependencies: 2228
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


ALTER TYPE public.tablefunc_crosstab_3 OWNER TO postgres;

--
-- TOC entry 904 (class 1247 OID 43150)
-- Dependencies: 2229
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


ALTER TYPE public.tablefunc_crosstab_4 OWNER TO postgres;

--
-- TOC entry 905 (class 1247 OID 43152)
-- Dependencies: 2230
-- Name: tokenout; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


ALTER TYPE public.tokenout OWNER TO postgres;

--
-- TOC entry 906 (class 1247 OID 43154)
-- Dependencies: 2231
-- Name: tokentype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


ALTER TYPE public.tokentype OWNER TO postgres;

--
-- TOC entry 907 (class 1247 OID 43156)
-- Dependencies: 2232
-- Name: tsdebug; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsdebug AS (
	ts_name text,
	tok_type text,
	description text,
	token text,
	dict_name text[],
	tsvector tsvector
);


ALTER TYPE public.tsdebug OWNER TO postgres;

--
-- TOC entry 53 (class 1255 OID 43157)
-- Dependencies: 5
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public._get_parser_from_curcfg() OWNER TO postgres;

--
-- TOC entry 54 (class 1255 OID 43158)
-- Dependencies: 5
-- Name: _int_contained(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_contained(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contained(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 2800 (class 0 OID 0)
-- Dependencies: 54
-- Name: FUNCTION _int_contained(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_contained(integer[], integer[]) IS 'contained in';


--
-- TOC entry 55 (class 1255 OID 43159)
-- Dependencies: 5
-- Name: _int_contains(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_contains(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contains(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 2801 (class 0 OID 0)
-- Dependencies: 55
-- Name: FUNCTION _int_contains(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_contains(integer[], integer[]) IS 'contains';


--
-- TOC entry 56 (class 1255 OID 43160)
-- Dependencies: 5
-- Name: _int_different(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_different(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_different'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_different(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 2802 (class 0 OID 0)
-- Dependencies: 56
-- Name: FUNCTION _int_different(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_different(integer[], integer[]) IS 'different';


--
-- TOC entry 57 (class 1255 OID 43161)
-- Dependencies: 5
-- Name: _int_inter(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_inter(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_inter(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 58 (class 1255 OID 43162)
-- Dependencies: 5
-- Name: _int_overlap(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_overlap(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_overlap(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 2803 (class 0 OID 0)
-- Dependencies: 58
-- Name: FUNCTION _int_overlap(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_overlap(integer[], integer[]) IS 'overlaps';


--
-- TOC entry 59 (class 1255 OID 43163)
-- Dependencies: 5
-- Name: _int_same(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_same(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_same(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 2804 (class 0 OID 0)
-- Dependencies: 59
-- Name: FUNCTION _int_same(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_same(integer[], integer[]) IS 'same as';


--
-- TOC entry 60 (class 1255 OID 43164)
-- Dependencies: 5
-- Name: _int_union(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_union(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_union(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 61 (class 1255 OID 43165)
-- Dependencies: 5
-- Name: armor(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION armor(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pg_armor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.armor(bytea) OWNER TO postgres;

--
-- TOC entry 62 (class 1255 OID 43166)
-- Dependencies: 5 884
-- Name: boolop(integer[], query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION boolop(integer[], query_int) RETURNS boolean
    AS '$libdir/_int', 'boolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.boolop(integer[], query_int) OWNER TO postgres;

--
-- TOC entry 2805 (class 0 OID 0)
-- Dependencies: 62
-- Name: FUNCTION boolop(integer[], query_int); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION boolop(integer[], query_int) IS 'boolean operation with array';


--
-- TOC entry 63 (class 1255 OID 43167)
-- Dependencies: 854 854 5
-- Name: btean13cmp(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 64 (class 1255 OID 43168)
-- Dependencies: 5 869 854
-- Name: btean13cmp(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 65 (class 1255 OID 43169)
-- Dependencies: 875 854 5
-- Name: btean13cmp(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 66 (class 1255 OID 43170)
-- Dependencies: 881 5 854
-- Name: btean13cmp(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 67 (class 1255 OID 43171)
-- Dependencies: 5 854 866
-- Name: btean13cmp(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 68 (class 1255 OID 43172)
-- Dependencies: 5 872 854
-- Name: btean13cmp(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 69 (class 1255 OID 43173)
-- Dependencies: 878 5 854
-- Name: btean13cmp(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, issn) OWNER TO postgres;

--
-- TOC entry 70 (class 1255 OID 43174)
-- Dependencies: 854 5 893
-- Name: btean13cmp(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, upc) OWNER TO postgres;

--
-- TOC entry 71 (class 1255 OID 43175)
-- Dependencies: 869 869 5
-- Name: btisbn13cmp(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 72 (class 1255 OID 43176)
-- Dependencies: 869 5 854
-- Name: btisbn13cmp(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 73 (class 1255 OID 43177)
-- Dependencies: 5 869 866
-- Name: btisbn13cmp(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 74 (class 1255 OID 43178)
-- Dependencies: 5 866 866
-- Name: btisbncmp(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 75 (class 1255 OID 43179)
-- Dependencies: 854 866 5
-- Name: btisbncmp(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 76 (class 1255 OID 43180)
-- Dependencies: 869 5 866
-- Name: btisbncmp(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 77 (class 1255 OID 43181)
-- Dependencies: 875 875 5
-- Name: btismn13cmp(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 78 (class 1255 OID 43182)
-- Dependencies: 854 875 5
-- Name: btismn13cmp(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 79 (class 1255 OID 43183)
-- Dependencies: 5 875 872
-- Name: btismn13cmp(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 80 (class 1255 OID 43184)
-- Dependencies: 872 5 872
-- Name: btismncmp(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 81 (class 1255 OID 43185)
-- Dependencies: 5 854 872
-- Name: btismncmp(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 82 (class 1255 OID 43186)
-- Dependencies: 5 875 872
-- Name: btismncmp(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 83 (class 1255 OID 43187)
-- Dependencies: 881 5 881
-- Name: btissn13cmp(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 84 (class 1255 OID 43188)
-- Dependencies: 5 854 881
-- Name: btissn13cmp(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 85 (class 1255 OID 43189)
-- Dependencies: 878 881 5
-- Name: btissn13cmp(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, issn) OWNER TO postgres;

--
-- TOC entry 86 (class 1255 OID 43190)
-- Dependencies: 5 878 878
-- Name: btissncmp(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, issn) OWNER TO postgres;

--
-- TOC entry 87 (class 1255 OID 43191)
-- Dependencies: 5 854 878
-- Name: btissncmp(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, ean13) OWNER TO postgres;

--
-- TOC entry 88 (class 1255 OID 43192)
-- Dependencies: 881 878 5
-- Name: btissncmp(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, issn13) OWNER TO postgres;

--
-- TOC entry 89 (class 1255 OID 43193)
-- Dependencies: 893 893 5
-- Name: btupccmp(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btupccmp(upc, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btupccmp(upc, upc) OWNER TO postgres;

--
-- TOC entry 90 (class 1255 OID 43194)
-- Dependencies: 854 5 893
-- Name: btupccmp(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btupccmp(upc, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btupccmp(upc, ean13) OWNER TO postgres;

--
-- TOC entry 91 (class 1255 OID 43195)
-- Dependencies: 890 5 890 890
-- Name: concat(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION concat(tsvector, tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'concat'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.concat(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 92 (class 1255 OID 43196)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer, text) OWNER TO postgres;

--
-- TOC entry 93 (class 1255 OID 43197)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer) OWNER TO postgres;

--
-- TOC entry 94 (class 1255 OID 43198)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer, text) OWNER TO postgres;

--
-- TOC entry 95 (class 1255 OID 43199)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer) OWNER TO postgres;

--
-- TOC entry 96 (class 1255 OID 43200)
-- Dependencies: 5
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text) OWNER TO postgres;

--
-- TOC entry 97 (class 1255 OID 43201)
-- Dependencies: 5
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, integer) OWNER TO postgres;

--
-- TOC entry 98 (class 1255 OID 43202)
-- Dependencies: 5
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, text) OWNER TO postgres;

--
-- TOC entry 99 (class 1255 OID 43203)
-- Dependencies: 5 902
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab2(text) OWNER TO postgres;

--
-- TOC entry 100 (class 1255 OID 43204)
-- Dependencies: 903 5
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab3(text) OWNER TO postgres;

--
-- TOC entry 101 (class 1255 OID 43205)
-- Dependencies: 5 904
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab4(text) OWNER TO postgres;

--
-- TOC entry 102 (class 1255 OID 43206)
-- Dependencies: 5
-- Name: crypt(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crypt(text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_crypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.crypt(text, text) OWNER TO postgres;

--
-- TOC entry 103 (class 1255 OID 43207)
-- Dependencies: 5 842
-- Name: cube(double precision[], double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision[], double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision[], double precision[]) OWNER TO postgres;

--
-- TOC entry 104 (class 1255 OID 43208)
-- Dependencies: 842 5
-- Name: cube(double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision[]) OWNER TO postgres;

--
-- TOC entry 105 (class 1255 OID 43209)
-- Dependencies: 842 5
-- Name: cube(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(text) RETURNS cube
    AS '$libdir/cube', 'cube'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(text) OWNER TO postgres;

--
-- TOC entry 2806 (class 0 OID 0)
-- Dependencies: 105
-- Name: FUNCTION cube(text); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube(text) IS 'convert text to cube';


--
-- TOC entry 106 (class 1255 OID 43210)
-- Dependencies: 5 842
-- Name: cube(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision) OWNER TO postgres;

--
-- TOC entry 107 (class 1255 OID 43211)
-- Dependencies: 842 5
-- Name: cube(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 108 (class 1255 OID 43212)
-- Dependencies: 842 842 5
-- Name: cube(cube, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(cube, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(cube, double precision) OWNER TO postgres;

--
-- TOC entry 109 (class 1255 OID 43213)
-- Dependencies: 5 842 842
-- Name: cube(cube, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(cube, double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(cube, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 110 (class 1255 OID 43214)
-- Dependencies: 5 842 842
-- Name: cube_cmp(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_cmp(cube, cube) RETURNS integer
    AS '$libdir/cube', 'cube_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_cmp(cube, cube) OWNER TO postgres;

--
-- TOC entry 2807 (class 0 OID 0)
-- Dependencies: 110
-- Name: FUNCTION cube_cmp(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_cmp(cube, cube) IS 'btree comparison function';


--
-- TOC entry 111 (class 1255 OID 43215)
-- Dependencies: 5 842 842
-- Name: cube_contained(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_contained(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_contained(cube, cube) OWNER TO postgres;

--
-- TOC entry 2808 (class 0 OID 0)
-- Dependencies: 111
-- Name: FUNCTION cube_contained(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_contained(cube, cube) IS 'contained in';


--
-- TOC entry 112 (class 1255 OID 43216)
-- Dependencies: 5 842 842
-- Name: cube_contains(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_contains(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_contains(cube, cube) OWNER TO postgres;

--
-- TOC entry 2809 (class 0 OID 0)
-- Dependencies: 112
-- Name: FUNCTION cube_contains(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_contains(cube, cube) IS 'contains';


--
-- TOC entry 113 (class 1255 OID 43217)
-- Dependencies: 5 842 842
-- Name: cube_enlarge(cube, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_enlarge(cube, double precision, integer) RETURNS cube
    AS '$libdir/cube', 'cube_enlarge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_enlarge(cube, double precision, integer) OWNER TO postgres;

--
-- TOC entry 114 (class 1255 OID 43218)
-- Dependencies: 5 842 842
-- Name: cube_eq(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_eq(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_eq(cube, cube) OWNER TO postgres;

--
-- TOC entry 2810 (class 0 OID 0)
-- Dependencies: 114
-- Name: FUNCTION cube_eq(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_eq(cube, cube) IS 'same as';


--
-- TOC entry 115 (class 1255 OID 43219)
-- Dependencies: 5 842 842
-- Name: cube_ge(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ge(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ge(cube, cube) OWNER TO postgres;

--
-- TOC entry 2811 (class 0 OID 0)
-- Dependencies: 115
-- Name: FUNCTION cube_ge(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_ge(cube, cube) IS 'greater than or equal to';


--
-- TOC entry 116 (class 1255 OID 43220)
-- Dependencies: 5 842 842
-- Name: cube_gt(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_gt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_gt(cube, cube) OWNER TO postgres;

--
-- TOC entry 2812 (class 0 OID 0)
-- Dependencies: 116
-- Name: FUNCTION cube_gt(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_gt(cube, cube) IS 'greater than';


--
-- TOC entry 117 (class 1255 OID 43221)
-- Dependencies: 5 842 842 842
-- Name: cube_inter(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_inter(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_inter(cube, cube) OWNER TO postgres;

--
-- TOC entry 118 (class 1255 OID 43222)
-- Dependencies: 5 842 842
-- Name: cube_le(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_le(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_le(cube, cube) OWNER TO postgres;

--
-- TOC entry 2813 (class 0 OID 0)
-- Dependencies: 118
-- Name: FUNCTION cube_le(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_le(cube, cube) IS 'lower than or equal to';


--
-- TOC entry 119 (class 1255 OID 43223)
-- Dependencies: 5 842
-- Name: cube_ll_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ll_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ll_coord'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ll_coord(cube, integer) OWNER TO postgres;

--
-- TOC entry 120 (class 1255 OID 43224)
-- Dependencies: 5 842 842
-- Name: cube_lt(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_lt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_lt(cube, cube) OWNER TO postgres;

--
-- TOC entry 2814 (class 0 OID 0)
-- Dependencies: 120
-- Name: FUNCTION cube_lt(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_lt(cube, cube) IS 'lower than';


--
-- TOC entry 121 (class 1255 OID 43225)
-- Dependencies: 5 842 842
-- Name: cube_ne(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ne(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ne(cube, cube) OWNER TO postgres;

--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 121
-- Name: FUNCTION cube_ne(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_ne(cube, cube) IS 'different';


--
-- TOC entry 122 (class 1255 OID 43226)
-- Dependencies: 5 842 842
-- Name: cube_overlap(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_overlap(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_overlap(cube, cube) OWNER TO postgres;

--
-- TOC entry 2816 (class 0 OID 0)
-- Dependencies: 122
-- Name: FUNCTION cube_overlap(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_overlap(cube, cube) IS 'overlaps';


--
-- TOC entry 123 (class 1255 OID 43227)
-- Dependencies: 5 842
-- Name: cube_size(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_size(cube) RETURNS double precision
    AS '$libdir/cube', 'cube_size'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_size(cube) OWNER TO postgres;

--
-- TOC entry 124 (class 1255 OID 43228)
-- Dependencies: 5 842 842
-- Name: cube_subset(cube, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_subset(cube, integer[]) RETURNS cube
    AS '$libdir/cube', 'cube_subset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_subset(cube, integer[]) OWNER TO postgres;

--
-- TOC entry 125 (class 1255 OID 43229)
-- Dependencies: 5 842 842 842
-- Name: cube_union(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_union(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_union(cube, cube) OWNER TO postgres;

--
-- TOC entry 126 (class 1255 OID 43230)
-- Dependencies: 5 842
-- Name: cube_ur_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ur_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ur_coord'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ur_coord(cube, integer) OWNER TO postgres;

--
-- TOC entry 127 (class 1255 OID 43231)
-- Dependencies: 5
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- TOC entry 128 (class 1255 OID 43232)
-- Dependencies: 5
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 129 (class 1255 OID 43233)
-- Dependencies: 5
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- TOC entry 130 (class 1255 OID 43234)
-- Dependencies: 5
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- TOC entry 131 (class 1255 OID 43235)
-- Dependencies: 5
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_delete'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- TOC entry 132 (class 1255 OID 43236)
-- Dependencies: 5
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_insert'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 133 (class 1255 OID 43237)
-- Dependencies: 5
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_update'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 134 (class 1255 OID 43238)
-- Dependencies: 5
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_cancel_query(text) RETURNS text
    AS '$libdir/dblink', 'dblink_cancel_query'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- TOC entry 135 (class 1255 OID 43239)
-- Dependencies: 5
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- TOC entry 136 (class 1255 OID 43240)
-- Dependencies: 5
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- TOC entry 137 (class 1255 OID 43241)
-- Dependencies: 5
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- TOC entry 138 (class 1255 OID 43242)
-- Dependencies: 5
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 139 (class 1255 OID 43243)
-- Dependencies: 5
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- TOC entry 140 (class 1255 OID 43244)
-- Dependencies: 5
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- TOC entry 141 (class 1255 OID 43245)
-- Dependencies: 5
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_current_query() RETURNS text
    AS '$libdir/dblink', 'dblink_current_query'
    LANGUAGE c;


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- TOC entry 142 (class 1255 OID 43246)
-- Dependencies: 5
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect() RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- TOC entry 143 (class 1255 OID 43247)
-- Dependencies: 5
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- TOC entry 144 (class 1255 OID 43248)
-- Dependencies: 5
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_error_message(text) RETURNS text
    AS '$libdir/dblink', 'dblink_error_message'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- TOC entry 145 (class 1255 OID 43249)
-- Dependencies: 5
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- TOC entry 146 (class 1255 OID 43250)
-- Dependencies: 5
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 147 (class 1255 OID 43251)
-- Dependencies: 5
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- TOC entry 148 (class 1255 OID 43252)
-- Dependencies: 5
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- TOC entry 149 (class 1255 OID 43253)
-- Dependencies: 5
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- TOC entry 150 (class 1255 OID 43254)
-- Dependencies: 5
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 151 (class 1255 OID 43255)
-- Dependencies: 5
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- TOC entry 152 (class 1255 OID 43256)
-- Dependencies: 5
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 153 (class 1255 OID 43257)
-- Dependencies: 5
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_connections() RETURNS text[]
    AS '$libdir/dblink', 'dblink_get_connections'
    LANGUAGE c;


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- TOC entry 154 (class 1255 OID 43258)
-- Dependencies: 5 896
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_pkey(text) RETURNS SETOF dblink_pkey_results
    AS '$libdir/dblink', 'dblink_get_pkey'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- TOC entry 155 (class 1255 OID 43259)
-- Dependencies: 5
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- TOC entry 156 (class 1255 OID 43260)
-- Dependencies: 5
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- TOC entry 157 (class 1255 OID 43261)
-- Dependencies: 5
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_is_busy(text) RETURNS integer
    AS '$libdir/dblink', 'dblink_is_busy'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- TOC entry 158 (class 1255 OID 43262)
-- Dependencies: 5
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- TOC entry 159 (class 1255 OID 43263)
-- Dependencies: 5
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 160 (class 1255 OID 43264)
-- Dependencies: 5
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- TOC entry 161 (class 1255 OID 43265)
-- Dependencies: 5
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- TOC entry 162 (class 1255 OID 43266)
-- Dependencies: 5
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_send_query(text, text) RETURNS integer
    AS '$libdir/dblink', 'dblink_send_query'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

--
-- TOC entry 163 (class 1255 OID 43267)
-- Dependencies: 5
-- Name: dearmor(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dearmor(text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_dearmor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dearmor(text) OWNER TO postgres;

--
-- TOC entry 164 (class 1255 OID 43268)
-- Dependencies: 5
-- Name: decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.decrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 165 (class 1255 OID 43269)
-- Dependencies: 5
-- Name: decrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.decrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 166 (class 1255 OID 43270)
-- Dependencies: 5
-- Name: dex_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'dex_init'
    LANGUAGE c;


ALTER FUNCTION public.dex_init(internal) OWNER TO postgres;

--
-- TOC entry 167 (class 1255 OID 43271)
-- Dependencies: 5
-- Name: dex_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'dex_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dex_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 168 (class 1255 OID 43272)
-- Dependencies: 5
-- Name: digest(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION digest(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.digest(text, text) OWNER TO postgres;

--
-- TOC entry 169 (class 1255 OID 43273)
-- Dependencies: 5
-- Name: digest(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION digest(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.digest(bytea, text) OWNER TO postgres;

--
-- TOC entry 170 (class 1255 OID 43274)
-- Dependencies: 5 854
-- Name: ean13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13(text) RETURNS ean13
    AS '$libdir/isn', 'ean13_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13(text) OWNER TO postgres;

--
-- TOC entry 171 (class 1255 OID 43275)
-- Dependencies: 5 842 897
-- Name: earth_box(earth, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth_box(earth, double precision) RETURNS cube
    AS $_$SELECT cube_enlarge($1, gc_to_sec($2), 3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.earth_box(earth, double precision) OWNER TO postgres;

--
-- TOC entry 172 (class 1255 OID 43276)
-- Dependencies: 5 897 897
-- Name: earth_distance(earth, earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth_distance(earth, earth) RETURNS double precision
    AS $_$SELECT sec_to_gc(cube_distance($1, $2))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.earth_distance(earth, earth) OWNER TO postgres;

--
-- TOC entry 173 (class 1255 OID 43277)
-- Dependencies: 5
-- Name: encrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.encrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 174 (class 1255 OID 43278)
-- Dependencies: 5
-- Name: encrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.encrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 175 (class 1255 OID 43279)
-- Dependencies: 5 890 887
-- Name: exectsq(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION exectsq(tsvector, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'exectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.exectsq(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 175
-- Name: FUNCTION exectsq(tsvector, tsquery); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION exectsq(tsvector, tsquery) IS 'boolean operation with text index';


--
-- TOC entry 176 (class 1255 OID 43280)
-- Dependencies: 5
-- Name: g_cube_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_compress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_compress(internal) OWNER TO postgres;

--
-- TOC entry 177 (class 1255 OID 43281)
-- Dependencies: 5 842
-- Name: g_cube_consistent(internal, cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_consistent(internal, cube, integer) RETURNS boolean
    AS '$libdir/cube', 'g_cube_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_consistent(internal, cube, integer) OWNER TO postgres;

--
-- TOC entry 178 (class 1255 OID 43282)
-- Dependencies: 5
-- Name: g_cube_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_decompress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_decompress(internal) OWNER TO postgres;

--
-- TOC entry 179 (class 1255 OID 43283)
-- Dependencies: 5
-- Name: g_cube_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_cube_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 180 (class 1255 OID 43284)
-- Dependencies: 5
-- Name: g_cube_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_picksplit(internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 181 (class 1255 OID 43285)
-- Dependencies: 5 842 842
-- Name: g_cube_same(cube, cube, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_same(cube, cube, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_same'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_same(cube, cube, internal) OWNER TO postgres;

--
-- TOC entry 182 (class 1255 OID 43286)
-- Dependencies: 5 842
-- Name: g_cube_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_union(internal, internal) RETURNS cube
    AS '$libdir/cube', 'g_cube_union'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 183 (class 1255 OID 43287)
-- Dependencies: 5
-- Name: g_int_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_int_compress(internal) OWNER TO postgres;

--
-- TOC entry 184 (class 1255 OID 43288)
-- Dependencies: 5
-- Name: g_int_consistent(internal, integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_consistent(internal, integer[], integer) RETURNS boolean
    AS '$libdir/_int', 'g_int_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_int_consistent(internal, integer[], integer) OWNER TO postgres;

--
-- TOC entry 185 (class 1255 OID 43289)
-- Dependencies: 5
-- Name: g_int_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_int_decompress(internal) OWNER TO postgres;

--
-- TOC entry 186 (class 1255 OID 43290)
-- Dependencies: 5
-- Name: g_int_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_int_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 187 (class 1255 OID 43291)
-- Dependencies: 5
-- Name: g_int_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_int_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 188 (class 1255 OID 43292)
-- Dependencies: 5
-- Name: g_int_same(integer[], integer[], internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_same(integer[], integer[], internal) RETURNS internal
    AS '$libdir/_int', 'g_int_same'
    LANGUAGE c;


ALTER FUNCTION public.g_int_same(integer[], integer[], internal) OWNER TO postgres;

--
-- TOC entry 189 (class 1255 OID 43293)
-- Dependencies: 5
-- Name: g_int_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_int_union'
    LANGUAGE c;


ALTER FUNCTION public.g_int_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 190 (class 1255 OID 43294)
-- Dependencies: 5
-- Name: g_intbig_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_compress(internal) OWNER TO postgres;

--
-- TOC entry 191 (class 1255 OID 43295)
-- Dependencies: 5
-- Name: g_intbig_consistent(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_consistent(internal, internal, integer) RETURNS boolean
    AS '$libdir/_int', 'g_intbig_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_consistent(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 192 (class 1255 OID 43296)
-- Dependencies: 5
-- Name: g_intbig_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_decompress(internal) OWNER TO postgres;

--
-- TOC entry 193 (class 1255 OID 43297)
-- Dependencies: 5
-- Name: g_intbig_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_intbig_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 194 (class 1255 OID 43298)
-- Dependencies: 5
-- Name: g_intbig_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 195 (class 1255 OID 43299)
-- Dependencies: 5
-- Name: g_intbig_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_same(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_same'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_same(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 196 (class 1255 OID 43300)
-- Dependencies: 5
-- Name: g_intbig_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_intbig_union'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 197 (class 1255 OID 43301)
-- Dependencies: 5
-- Name: gc_to_sec(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gc_to_sec(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/earth() > pi() THEN 2*earth() ELSE 2*earth()*sin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.gc_to_sec(double precision) OWNER TO postgres;

--
-- TOC entry 198 (class 1255 OID 43302)
-- Dependencies: 5
-- Name: gen_random_bytes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_random_bytes(integer) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_random_bytes'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_random_bytes(integer) OWNER TO postgres;

--
-- TOC entry 199 (class 1255 OID 43303)
-- Dependencies: 5
-- Name: gen_salt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_salt(text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_salt(text) OWNER TO postgres;

--
-- TOC entry 200 (class 1255 OID 43304)
-- Dependencies: 5
-- Name: gen_salt(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_salt(text, integer) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt_rounds'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_salt(text, integer) OWNER TO postgres;

--
-- TOC entry 201 (class 1255 OID 43305)
-- Dependencies: 5
-- Name: geo_distance(point, point); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geo_distance(point, point) RETURNS double precision
    AS '$libdir/earthdistance', 'geo_distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geo_distance(point, point) OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 43306)
-- Dependencies: 5 890 887
-- Name: get_covers(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_covers(tsvector, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'get_covers'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_covers(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 203 (class 1255 OID 43307)
-- Dependencies: 5
-- Name: get_timetravel(name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_timetravel(name) RETURNS integer
    AS '$libdir/timetravel', 'get_timetravel'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_timetravel(name) OWNER TO postgres;

--
-- TOC entry 204 (class 1255 OID 43308)
-- Dependencies: 5 887
-- Name: gin_extract_tsquery(tsquery, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsquery(tsquery, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsquery'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsquery(tsquery, internal, internal) OWNER TO postgres;

--
-- TOC entry 205 (class 1255 OID 43309)
-- Dependencies: 5 890
-- Name: gin_extract_tsvector(tsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsvector(tsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsvector'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsvector(tsvector, internal) OWNER TO postgres;

--
-- TOC entry 206 (class 1255 OID 43310)
-- Dependencies: 5 887
-- Name: gin_ts_consistent(internal, internal, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_ts_consistent(internal, internal, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'gin_ts_consistent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_ts_consistent(internal, internal, tsquery) OWNER TO postgres;

--
-- TOC entry 207 (class 1255 OID 43311)
-- Dependencies: 5
-- Name: ginint4_consistent(internal, smallint, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ginint4_consistent(internal, smallint, internal) RETURNS internal
    AS '$libdir/_int', 'ginint4_consistent'
    LANGUAGE c;


ALTER FUNCTION public.ginint4_consistent(internal, smallint, internal) OWNER TO postgres;

--
-- TOC entry 208 (class 1255 OID 43312)
-- Dependencies: 5
-- Name: ginint4_queryextract(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ginint4_queryextract(internal, internal, smallint) RETURNS internal
    AS '$libdir/_int', 'ginint4_queryextract'
    LANGUAGE c;


ALTER FUNCTION public.ginint4_queryextract(internal, internal, smallint) OWNER TO postgres;

--
-- TOC entry 209 (class 1255 OID 43313)
-- Dependencies: 5
-- Name: gtsq_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_compress(internal) OWNER TO postgres;

--
-- TOC entry 210 (class 1255 OID 43314)
-- Dependencies: 5 857
-- Name: gtsq_consistent(gtsq, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_consistent(gtsq, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsq_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_consistent(gtsq, internal, integer) OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 43315)
-- Dependencies: 5
-- Name: gtsq_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_decompress(internal) OWNER TO postgres;

--
-- TOC entry 212 (class 1255 OID 43316)
-- Dependencies: 5
-- Name: gtsq_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 213 (class 1255 OID 43317)
-- Dependencies: 5
-- Name: gtsq_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 43318)
-- Dependencies: 5 857 857
-- Name: gtsq_same(gtsq, gtsq, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_same(gtsq, gtsq, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_same(gtsq, gtsq, internal) OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 43319)
-- Dependencies: 5
-- Name: gtsq_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_union(bytea, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsq_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_union(bytea, internal) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 43320)
-- Dependencies: 5
-- Name: gtsvector_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_compress(internal) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 43321)
-- Dependencies: 5 860
-- Name: gtsvector_consistent(gtsvector, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_consistent(gtsvector, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsvector_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_consistent(gtsvector, internal, integer) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 43322)
-- Dependencies: 5
-- Name: gtsvector_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_decompress(internal) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 43323)
-- Dependencies: 5
-- Name: gtsvector_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 43324)
-- Dependencies: 5
-- Name: gtsvector_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 43325)
-- Dependencies: 5 860 860
-- Name: gtsvector_same(gtsvector, gtsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_same(gtsvector, gtsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_same(gtsvector, gtsvector, internal) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 43326)
-- Dependencies: 5
-- Name: gtsvector_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_union(internal, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 43327)
-- Dependencies: 5 854
-- Name: hashean13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashean13(ean13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashean13(ean13) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 43328)
-- Dependencies: 5 866
-- Name: hashisbn(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashisbn(isbn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashisbn(isbn) OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 43329)
-- Dependencies: 5 869
-- Name: hashisbn13(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashisbn13(isbn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashisbn13(isbn13) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 43330)
-- Dependencies: 5 872
-- Name: hashismn(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashismn(ismn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashismn(ismn) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 43331)
-- Dependencies: 5 875
-- Name: hashismn13(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashismn13(ismn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashismn13(ismn13) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 43332)
-- Dependencies: 5 878
-- Name: hashissn(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashissn(issn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashissn(issn) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 43333)
-- Dependencies: 5 881
-- Name: hashissn13(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashissn13(issn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashissn13(issn13) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 43334)
-- Dependencies: 5 893
-- Name: hashupc(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashupc(upc) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashupc(upc) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 43335)
-- Dependencies: 5 887
-- Name: headline(oid, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 43336)
-- Dependencies: 5 887
-- Name: headline(oid, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 43337)
-- Dependencies: 5 887
-- Name: headline(text, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 43338)
-- Dependencies: 5 887
-- Name: headline(text, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 43339)
-- Dependencies: 5 887
-- Name: headline(text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 43340)
-- Dependencies: 5 887
-- Name: headline(text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 43341)
-- Dependencies: 5
-- Name: hmac(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hmac(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.hmac(text, text, text) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 43342)
-- Dependencies: 5
-- Name: hmac(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hmac(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.hmac(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 43343)
-- Dependencies: 5
-- Name: icount(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION icount(integer[]) RETURNS integer
    AS '$libdir/_int', 'icount'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.icount(integer[]) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 43344)
-- Dependencies: 5
-- Name: idx(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION idx(integer[], integer) RETURNS integer
    AS '$libdir/_int', 'idx'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.idx(integer[], integer) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 43345)
-- Dependencies: 5
-- Name: insert_username(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insert_username() RETURNS "trigger"
    AS '$libdir/insert_username', 'insert_username'
    LANGUAGE c;


ALTER FUNCTION public.insert_username() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 43346)
-- Dependencies: 5
-- Name: int_agg_final_array(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_agg_final_array(integer[]) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_final_array'
    LANGUAGE c;


ALTER FUNCTION public.int_agg_final_array(integer[]) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 43347)
-- Dependencies: 5
-- Name: int_agg_state(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_agg_state(integer[], integer) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_state'
    LANGUAGE c;


ALTER FUNCTION public.int_agg_state(integer[], integer) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 43348)
-- Dependencies: 5
-- Name: int_array_enum(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_array_enum(integer[]) RETURNS SETOF integer
    AS '$libdir/int_aggregate', 'int_enum'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.int_array_enum(integer[]) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 43349)
-- Dependencies: 5
-- Name: intarray_del_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_del_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_del_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_del_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 43350)
-- Dependencies: 5
-- Name: intarray_push_array(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_push_array(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_array'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_array(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 43351)
-- Dependencies: 5
-- Name: intarray_push_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_push_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 43352)
-- Dependencies: 5
-- Name: intset(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset(integer) RETURNS integer[]
    AS '$libdir/_int', 'intset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset(integer) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 43353)
-- Dependencies: 5
-- Name: intset_subtract(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset_subtract(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intset_subtract'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_subtract(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 43354)
-- Dependencies: 5
-- Name: intset_union_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset_union_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intset_union_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_union_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 43355)
-- Dependencies: 5 854
-- Name: is_valid(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ean13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ean13) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 43356)
-- Dependencies: 5 869
-- Name: is_valid(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(isbn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(isbn13) OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 43357)
-- Dependencies: 5 875
-- Name: is_valid(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ismn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ismn13) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 43358)
-- Dependencies: 5 881
-- Name: is_valid(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(issn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(issn13) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 43359)
-- Dependencies: 5 866
-- Name: is_valid(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(isbn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(isbn) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 43360)
-- Dependencies: 5 872
-- Name: is_valid(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ismn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ismn) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 43361)
-- Dependencies: 5 878
-- Name: is_valid(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(issn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(issn) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 43362)
-- Dependencies: 5 893
-- Name: is_valid(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(upc) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(upc) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 43363)
-- Dependencies: 5 866 854
-- Name: isbn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn(ean13) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn(ean13) OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 43364)
-- Dependencies: 5 866
-- Name: isbn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn(text) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn(text) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 43365)
-- Dependencies: 5 869 854
-- Name: isbn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13(ean13) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13(ean13) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 43366)
-- Dependencies: 5 869
-- Name: isbn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13(text) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13(text) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 43367)
-- Dependencies: 5 872 854
-- Name: ismn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn(ean13) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn(ean13) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 43368)
-- Dependencies: 5 872
-- Name: ismn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn(text) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn(text) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 43369)
-- Dependencies: 5 875 854
-- Name: ismn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13(ean13) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13(ean13) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 43370)
-- Dependencies: 5 875
-- Name: ismn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13(text) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13(text) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 43371)
-- Dependencies: 5
-- Name: isn_weak(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_weak(boolean) RETURNS boolean
    AS '$libdir/isn', 'accept_weak_input'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_weak(boolean) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 43372)
-- Dependencies: 5
-- Name: isn_weak(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_weak() RETURNS boolean
    AS '$libdir/isn', 'weak_input_status'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_weak() OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 43373)
-- Dependencies: 5 854 854
-- Name: isneq(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 43374)
-- Dependencies: 5 854 869
-- Name: isneq(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 43375)
-- Dependencies: 5 854 875
-- Name: isneq(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 43376)
-- Dependencies: 5 854 881
-- Name: isneq(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 43377)
-- Dependencies: 5 854 866
-- Name: isneq(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 43378)
-- Dependencies: 5 854 872
-- Name: isneq(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 43379)
-- Dependencies: 5 854 878
-- Name: isneq(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, issn) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 43380)
-- Dependencies: 5 854 893
-- Name: isneq(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, upc) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 43381)
-- Dependencies: 5 869 869
-- Name: isneq(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 43382)
-- Dependencies: 5 869 866
-- Name: isneq(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 43383)
-- Dependencies: 5 869 854
-- Name: isneq(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 43384)
-- Dependencies: 5 866 866
-- Name: isneq(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 281 (class 1255 OID 43385)
-- Dependencies: 5 866 869
-- Name: isneq(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 43386)
-- Dependencies: 5 866 854
-- Name: isneq(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 43387)
-- Dependencies: 5 875 875
-- Name: isneq(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 43388)
-- Dependencies: 5 875 872
-- Name: isneq(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 43389)
-- Dependencies: 5 875 854
-- Name: isneq(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 43390)
-- Dependencies: 5 872 872
-- Name: isneq(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 43391)
-- Dependencies: 5 872 875
-- Name: isneq(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 43392)
-- Dependencies: 5 872 854
-- Name: isneq(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 43393)
-- Dependencies: 5 881 881
-- Name: isneq(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 43394)
-- Dependencies: 5 881 878
-- Name: isneq(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, issn) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 43395)
-- Dependencies: 5 881 854
-- Name: isneq(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 43396)
-- Dependencies: 5 878 878
-- Name: isneq(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, issn) OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 43397)
-- Dependencies: 5 878 881
-- Name: isneq(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, issn13) OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 43398)
-- Dependencies: 5 878 854
-- Name: isneq(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, ean13) OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 43399)
-- Dependencies: 893 5 893
-- Name: isneq(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(upc, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(upc, upc) OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 43400)
-- Dependencies: 854 893 5
-- Name: isneq(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(upc, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(upc, ean13) OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 43401)
-- Dependencies: 854 5 854
-- Name: isnge(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 43402)
-- Dependencies: 5 854 869
-- Name: isnge(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 43403)
-- Dependencies: 5 875 854
-- Name: isnge(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 43404)
-- Dependencies: 5 881 854
-- Name: isnge(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 43405)
-- Dependencies: 5 866 854
-- Name: isnge(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 43406)
-- Dependencies: 5 872 854
-- Name: isnge(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 43407)
-- Dependencies: 5 878 854
-- Name: isnge(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, issn) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 43408)
-- Dependencies: 5 893 854
-- Name: isnge(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, upc) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 43409)
-- Dependencies: 5 869 869
-- Name: isnge(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 43410)
-- Dependencies: 5 866 869
-- Name: isnge(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 43411)
-- Dependencies: 5 854 869
-- Name: isnge(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 43412)
-- Dependencies: 866 5 866
-- Name: isnge(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 43413)
-- Dependencies: 5 866 869
-- Name: isnge(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 43414)
-- Dependencies: 866 854 5
-- Name: isnge(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 43415)
-- Dependencies: 5 875 875
-- Name: isnge(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 43416)
-- Dependencies: 5 872 875
-- Name: isnge(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 43417)
-- Dependencies: 5 854 875
-- Name: isnge(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 43418)
-- Dependencies: 5 872 872
-- Name: isnge(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 43419)
-- Dependencies: 872 5 875
-- Name: isnge(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 43420)
-- Dependencies: 5 872 854
-- Name: isnge(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 43421)
-- Dependencies: 881 881 5
-- Name: isnge(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 43422)
-- Dependencies: 5 878 881
-- Name: isnge(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, issn) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 43423)
-- Dependencies: 5 854 881
-- Name: isnge(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 43424)
-- Dependencies: 5 878 878
-- Name: isnge(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, issn) OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 43425)
-- Dependencies: 5 881 878
-- Name: isnge(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, issn13) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 43426)
-- Dependencies: 854 878 5
-- Name: isnge(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, ean13) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 43427)
-- Dependencies: 893 5 893
-- Name: isnge(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(upc, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(upc, upc) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 43428)
-- Dependencies: 5 893 854
-- Name: isnge(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(upc, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(upc, ean13) OWNER TO postgres;

--
-- TOC entry 325 (class 1255 OID 43429)
-- Dependencies: 854 854 5
-- Name: isngt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 326 (class 1255 OID 43430)
-- Dependencies: 5 869 854
-- Name: isngt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 327 (class 1255 OID 43431)
-- Dependencies: 5 875 854
-- Name: isngt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 328 (class 1255 OID 43432)
-- Dependencies: 5 881 854
-- Name: isngt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 329 (class 1255 OID 43433)
-- Dependencies: 5 866 854
-- Name: isngt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 43434)
-- Dependencies: 5 872 854
-- Name: isngt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 43435)
-- Dependencies: 5 878 854
-- Name: isngt(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, issn) OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 43436)
-- Dependencies: 5 893 854
-- Name: isngt(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, upc) OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 43437)
-- Dependencies: 5 869 869
-- Name: isngt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 43438)
-- Dependencies: 5 866 869
-- Name: isngt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 43439)
-- Dependencies: 5 854 869
-- Name: isngt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 43440)
-- Dependencies: 5 866 866
-- Name: isngt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 43441)
-- Dependencies: 869 5 866
-- Name: isngt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 43442)
-- Dependencies: 5 866 854
-- Name: isngt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 339 (class 1255 OID 43443)
-- Dependencies: 875 875 5
-- Name: isngt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 340 (class 1255 OID 43444)
-- Dependencies: 5 872 875
-- Name: isngt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 341 (class 1255 OID 43445)
-- Dependencies: 5 854 875
-- Name: isngt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 342 (class 1255 OID 43446)
-- Dependencies: 5 872 872
-- Name: isngt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 343 (class 1255 OID 43447)
-- Dependencies: 5 875 872
-- Name: isngt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 344 (class 1255 OID 43448)
-- Dependencies: 854 5 872
-- Name: isngt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 345 (class 1255 OID 43449)
-- Dependencies: 5 881 881
-- Name: isngt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 346 (class 1255 OID 43450)
-- Dependencies: 881 878 5
-- Name: isngt(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, issn) OWNER TO postgres;

--
-- TOC entry 347 (class 1255 OID 43451)
-- Dependencies: 5 854 881
-- Name: isngt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 348 (class 1255 OID 43452)
-- Dependencies: 5 878 878
-- Name: isngt(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, issn) OWNER TO postgres;

--
-- TOC entry 349 (class 1255 OID 43453)
-- Dependencies: 5 881 878
-- Name: isngt(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, issn13) OWNER TO postgres;

--
-- TOC entry 350 (class 1255 OID 43454)
-- Dependencies: 5 854 878
-- Name: isngt(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, ean13) OWNER TO postgres;

--
-- TOC entry 351 (class 1255 OID 43455)
-- Dependencies: 5 893 893
-- Name: isngt(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(upc, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(upc, upc) OWNER TO postgres;

--
-- TOC entry 352 (class 1255 OID 43456)
-- Dependencies: 893 5 854
-- Name: isngt(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(upc, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(upc, ean13) OWNER TO postgres;

--
-- TOC entry 353 (class 1255 OID 43457)
-- Dependencies: 854 5 854
-- Name: isnle(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 354 (class 1255 OID 43458)
-- Dependencies: 5 854 869
-- Name: isnle(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 355 (class 1255 OID 43459)
-- Dependencies: 854 875 5
-- Name: isnle(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 356 (class 1255 OID 43460)
-- Dependencies: 5 881 854
-- Name: isnle(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 357 (class 1255 OID 43461)
-- Dependencies: 5 866 854
-- Name: isnle(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 358 (class 1255 OID 43462)
-- Dependencies: 5 872 854
-- Name: isnle(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 359 (class 1255 OID 43463)
-- Dependencies: 5 878 854
-- Name: isnle(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, issn) OWNER TO postgres;

--
-- TOC entry 360 (class 1255 OID 43464)
-- Dependencies: 854 5 893
-- Name: isnle(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, upc) OWNER TO postgres;

--
-- TOC entry 361 (class 1255 OID 43465)
-- Dependencies: 5 869 869
-- Name: isnle(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 362 (class 1255 OID 43466)
-- Dependencies: 869 866 5
-- Name: isnle(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 363 (class 1255 OID 43467)
-- Dependencies: 5 854 869
-- Name: isnle(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 43468)
-- Dependencies: 5 866 866
-- Name: isnle(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 365 (class 1255 OID 43469)
-- Dependencies: 5 869 866
-- Name: isnle(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 366 (class 1255 OID 43470)
-- Dependencies: 854 5 866
-- Name: isnle(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 367 (class 1255 OID 43471)
-- Dependencies: 875 5 875
-- Name: isnle(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 368 (class 1255 OID 43472)
-- Dependencies: 872 5 875
-- Name: isnle(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 369 (class 1255 OID 43473)
-- Dependencies: 5 875 854
-- Name: isnle(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 370 (class 1255 OID 43474)
-- Dependencies: 872 872 5
-- Name: isnle(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 43475)
-- Dependencies: 5 875 872
-- Name: isnle(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 43476)
-- Dependencies: 5 854 872
-- Name: isnle(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 373 (class 1255 OID 43477)
-- Dependencies: 5 881 881
-- Name: isnle(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 43478)
-- Dependencies: 5 878 881
-- Name: isnle(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, issn) OWNER TO postgres;

--
-- TOC entry 375 (class 1255 OID 43479)
-- Dependencies: 5 854 881
-- Name: isnle(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 43480)
-- Dependencies: 878 5 878
-- Name: isnle(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, issn) OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 43481)
-- Dependencies: 5 878 881
-- Name: isnle(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, issn13) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 43482)
-- Dependencies: 878 854 5
-- Name: isnle(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, ean13) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 43483)
-- Dependencies: 5 893 893
-- Name: isnle(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(upc, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(upc, upc) OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 43484)
-- Dependencies: 893 854 5
-- Name: isnle(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(upc, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(upc, ean13) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 43485)
-- Dependencies: 854 854 5
-- Name: isnlt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 43486)
-- Dependencies: 869 854 5
-- Name: isnlt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 43487)
-- Dependencies: 875 854 5
-- Name: isnlt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 43488)
-- Dependencies: 854 881 5
-- Name: isnlt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 43489)
-- Dependencies: 866 5 854
-- Name: isnlt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 43490)
-- Dependencies: 872 854 5
-- Name: isnlt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 43491)
-- Dependencies: 878 5 854
-- Name: isnlt(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, issn) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 43492)
-- Dependencies: 5 854 893
-- Name: isnlt(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, upc) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 43493)
-- Dependencies: 5 869 869
-- Name: isnlt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 43494)
-- Dependencies: 866 5 869
-- Name: isnlt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 43495)
-- Dependencies: 869 854 5
-- Name: isnlt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 43496)
-- Dependencies: 866 866 5
-- Name: isnlt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 43497)
-- Dependencies: 869 5 866
-- Name: isnlt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 43498)
-- Dependencies: 866 5 854
-- Name: isnlt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 43499)
-- Dependencies: 5 875 875
-- Name: isnlt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 43500)
-- Dependencies: 5 872 875
-- Name: isnlt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 43501)
-- Dependencies: 854 5 875
-- Name: isnlt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 43502)
-- Dependencies: 5 872 872
-- Name: isnlt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 43503)
-- Dependencies: 5 875 872
-- Name: isnlt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 43504)
-- Dependencies: 872 5 854
-- Name: isnlt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 43505)
-- Dependencies: 5 881 881
-- Name: isnlt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 43506)
-- Dependencies: 881 5 878
-- Name: isnlt(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, issn) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 43507)
-- Dependencies: 881 854 5
-- Name: isnlt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 404 (class 1255 OID 43508)
-- Dependencies: 878 878 5
-- Name: isnlt(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, issn) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 43509)
-- Dependencies: 5 881 878
-- Name: isnlt(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, issn13) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 43510)
-- Dependencies: 854 5 878
-- Name: isnlt(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, ean13) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 43511)
-- Dependencies: 893 5 893
-- Name: isnlt(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(upc, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(upc, upc) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 43512)
-- Dependencies: 5 854 893
-- Name: isnlt(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(upc, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(upc, ean13) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 43513)
-- Dependencies: 5 854 854
-- Name: isnne(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 43514)
-- Dependencies: 5 869 854
-- Name: isnne(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 43515)
-- Dependencies: 854 5 875
-- Name: isnne(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 43516)
-- Dependencies: 5 881 854
-- Name: isnne(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 43517)
-- Dependencies: 5 866 854
-- Name: isnne(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 43518)
-- Dependencies: 854 5 872
-- Name: isnne(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 43519)
-- Dependencies: 878 5 854
-- Name: isnne(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, issn) OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 43520)
-- Dependencies: 893 854 5
-- Name: isnne(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, upc) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 43521)
-- Dependencies: 869 5 869
-- Name: isnne(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 43522)
-- Dependencies: 5 869 866
-- Name: isnne(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 43523)
-- Dependencies: 869 5 854
-- Name: isnne(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 43524)
-- Dependencies: 5 866 866
-- Name: isnne(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 43525)
-- Dependencies: 5 866 869
-- Name: isnne(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 43526)
-- Dependencies: 5 866 854
-- Name: isnne(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 43527)
-- Dependencies: 5 875 875
-- Name: isnne(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 43528)
-- Dependencies: 5 875 872
-- Name: isnne(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 43529)
-- Dependencies: 5 875 854
-- Name: isnne(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 43530)
-- Dependencies: 5 872 872
-- Name: isnne(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 43531)
-- Dependencies: 872 875 5
-- Name: isnne(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 43532)
-- Dependencies: 5 872 854
-- Name: isnne(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 43533)
-- Dependencies: 5 881 881
-- Name: isnne(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 43534)
-- Dependencies: 5 881 878
-- Name: isnne(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, issn) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 43535)
-- Dependencies: 5 881 854
-- Name: isnne(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 43536)
-- Dependencies: 5 878 878
-- Name: isnne(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, issn) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 43537)
-- Dependencies: 5 878 881
-- Name: isnne(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, issn13) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 43538)
-- Dependencies: 5 878 854
-- Name: isnne(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, ean13) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 43539)
-- Dependencies: 5 893 893
-- Name: isnne(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(upc, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(upc, upc) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 43540)
-- Dependencies: 5 893 854
-- Name: isnne(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(upc, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(upc, ean13) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 43541)
-- Dependencies: 5 878 854
-- Name: issn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn(ean13) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn(ean13) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 43542)
-- Dependencies: 5 878
-- Name: issn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn(text) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn(text) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 43543)
-- Dependencies: 5 881 854
-- Name: issn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13(ean13) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13(ean13) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 43544)
-- Dependencies: 5 881
-- Name: issn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13(text) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13(text) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 43545)
-- Dependencies: 897 5
-- Name: latitude(earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION latitude(earth) RETURNS double precision
    AS $_$SELECT CASE WHEN cube_ll_coord($1, 3)/earth() < -1 THEN -90::float8 WHEN cube_ll_coord($1, 3)/earth() > 1 THEN 90::float8 ELSE degrees(asin(cube_ll_coord($1, 3)/earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.latitude(earth) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 43546)
-- Dependencies: 5 890
-- Name: length(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length(tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_length'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length(tsvector) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 43547)
-- Dependencies: 5
-- Name: lexize(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(oid, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(oid, text) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 43548)
-- Dependencies: 5
-- Name: lexize(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text, text) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 43549)
-- Dependencies: 5
-- Name: lexize(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_bycurrent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 43550)
-- Dependencies: 5 897
-- Name: ll_to_earth(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ll_to_earth(double precision, double precision) RETURNS earth
    AS $_$SELECT cube(cube(cube(earth()*cos(radians($1))*cos(radians($2))),earth()*cos(radians($1))*sin(radians($2))),earth()*sin(radians($1)))::earth$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.ll_to_earth(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 43551)
-- Dependencies: 5 897
-- Name: longitude(earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION longitude(earth) RETURNS double precision
    AS $_$SELECT degrees(atan2(cube_ll_coord($1, 2), cube_ll_coord($1, 1)))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.longitude(earth) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 43552)
-- Dependencies: 854 5 854
-- Name: make_valid(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ean13) RETURNS ean13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ean13) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 43553)
-- Dependencies: 5 869 869
-- Name: make_valid(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(isbn13) RETURNS isbn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(isbn13) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 43554)
-- Dependencies: 875 875 5
-- Name: make_valid(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ismn13) RETURNS ismn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ismn13) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 43555)
-- Dependencies: 881 5 881
-- Name: make_valid(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(issn13) RETURNS issn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(issn13) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 43556)
-- Dependencies: 5 866 866
-- Name: make_valid(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(isbn) RETURNS isbn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(isbn) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 43557)
-- Dependencies: 872 5 872
-- Name: make_valid(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ismn) RETURNS ismn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ismn) OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 43558)
-- Dependencies: 5 878 878
-- Name: make_valid(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(issn) RETURNS issn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(issn) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 43559)
-- Dependencies: 893 893 5
-- Name: make_valid(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(upc) RETURNS upc
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(upc) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 43560)
-- Dependencies: 5
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    AS '$libdir/tablefunc', 'normal_rand'
    LANGUAGE c STRICT;


ALTER FUNCTION public.normal_rand(integer, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 43561)
-- Dependencies: 887 5
-- Name: numnode(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numnode(tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_numnode'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numnode(tsquery) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 43562)
-- Dependencies: 5 973
-- Name: operacao_avaliaratendimento(character, bigint, text, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_avaliaratendimento(character, bigint, text, bigint) RETURNS character varying
    AS $_$
DECLARE
	cTipo			alias for $1;
	bCodigo			alias for $2;
	sAvaliacao		alias for $3;
	lUsuario		alias for $4;
	Status 			varchar(30);
BEGIN	
	IF(cTipo ='I') THEN 

		IF((SELECT _codigo FROM AvaliarAtendimento WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Atendimento já Cadastrado';
		ELSE
			INSERT INTO AvaliarAtendimento(_avaliacao,_usuario,_dataavaliacao)
			VALUES (sAvaliacao,lUsuario,(select current_date));
			Status = 'SUCESSO';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_avaliaratendimento(character, bigint, text, bigint) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 43563)
-- Dependencies: 5 973
-- Name: operacao_conteudo(character, bigint, bigint, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_conteudo(character, bigint, bigint, integer, text) RETURNS character varying
    AS $_$
DECLARE
	cTipo			alias for $1;
	bCodigo			alias for $2;
	bProduto		alias for $3;
	iCaracteristica		alias for $4;
	sDescricao		alias for $5;
	Status 			varchar(30);
BEGIN	
	IF(Tipo ='I') THEN 

		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Caracteristica já Cadastrado';
		ELSE
			INSERT INTO ConteudoProduto(_produto,_caracttipoproduto,_descricao)
			VALUES (bProduto,iCaracteristica,sDescricao);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	IF (Tipo ='A') THEN 	
		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE ConteudoProduto SET _produto = bProduto, _caracteristica = iCaracteristica, _descricao = sDescricao
			WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Produto não Encontrado';
		END IF;
	END IF; 

	IF (Tipo ='E') THEN		
		IF((SELECT _codigo FROM ConteudoProduto WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM ConteudoProduto WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Produto não Encontrado';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_conteudo(character, bigint, bigint, integer, text) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 43564)
-- Dependencies: 5 973
-- Name: operacao_empresa(bigint, character varying, character varying, bigint, bigint, bigint, integer, integer, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_empresa(bigint, character varying, character varying, bigint, bigint, bigint, integer, integer, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) RETURNS character varying
    AS $_$
DECLARE
	  codigo 		alias for $1;
	  nomefantasia 		alias for $2;
	  razaosocial 		alias for $3;
	  cnpj  		alias for $4;
	  inscrestadual 	alias for $5;
	  inscrmunicipal 	alias for $6;
	  ddd			alias for $7;
	  telefoneprincipal  	alias for $8;
	  dddfax		alias for $9;
	  fax		  	alias for $10;
	  cep 			alias for $11;
	  endereco 		alias for $12;
	  numero 		alias for $13;
	  complemento 		alias for $14;
	  bairro 		alias for $15;
	  municipio 		alias for $16;
	  estado 		alias for $17;
	  pais 			alias for $18;
	  
          Status 		varchar(30);
BEGIN
	
		IF((SELECT COUNT(*) FROM DADOSEMPRESA) = 0) THEN

			INSERT INTO dadosempresa(
				    _codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, 
				    _inscrmunicipal, _ddd,_telefoneprincipal, _cep, _endereco, _numero, 
				    _complemento, _bairro, _municipio, _estado, _pais,_dddfax,_fax)

			    VALUES (codigo, nomefantasia, razaosocial, cnpj, inscrestadual, 
				    inscrmunicipal, ddd,telefoneprincipal, cep, endereco, numero, 
				    complemento, bairro, municipio, estado, pais,dddfax,fax);

			    Status = 'SUCESSO';
		ELSE
			UPDATE dadosempresa
			   SET  _nomefantasia= nomefantasia, _razaosocial=razaosocial, _cnpj=cnpj, _inscrestadual=inscrestadual, 
			       _inscrmunicipal=inscrmunicipal, _telefoneprincipal=telefoneprincipal, _cep=cep, _endereco=endereco, 
			       _numero=numero, _complemento=complemento, _bairro=bairro, _municipio=municipio, _estado=estado, 
			       _pais=pais,_ddd=ddd,_dddfax=dddfax,_fax=fax
			 WHERE _codigo = codigo;

			Status = 'SUCESSO';

		END IF;

			

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_empresa(bigint, character varying, character varying, bigint, bigint, bigint, integer, integer, integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 607 (class 1255 OID 43565)
-- Dependencies: 5 973
-- Name: operacao_endereco(character varying, character varying, bigint, character varying, text, integer, integer, text, text, text, text, text, text, text, integer, bigint, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_endereco(character varying, character varying, bigint, character varying, text, integer, integer, text, text, text, text, text, text, text, integer, bigint, boolean) RETURNS character varying
    AS $_$
DECLARE
	cTipo			alias for $1;
	cTpObjeto		alias for $2;
	bCodigo			alias for $3;
	iCep			alias for $4;
	sRua			alias for $5;
	iNumero			alias for $6;
	iCaixaPostal		alias for $7;	
	sComplemento		alias for $8;
	sBairro			alias for $9;
	sMunicipio		alias for $10;
	sEstado			alias for $11;
	sPais			alias for $12;
	sNomeReceptor		alias for $13;
	sReferenciaEntrega	alias for $14;
	iTipoEndereco		alias for $15;
	bCodigoObjeto		alias for $16;
	bEndCelular		alias for $17;
	cEndCelular		boolean = false;
	Status 			varchar(30);
BEGIN	
	IF(cTipo ='I') THEN 
		IF(cTpObjeto ='F') THEN
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
				Status = 'FRACASSO';	
				RAISE EXCEPTION 'Endereco do Fornecedor já Cadastrado';
			ELSE	
				IF(bEndCelular = true) THEN
					UPDATE Endereco SET _celular = false
					WHERE _fornecedor = bCodigoObjeto;
				END IF;
				INSERT INTO Endereco(_cep,_rua,_numero,_caixapostal,_complemento,_bairro,_municipio,_estado,_pais,_nomereceptor,_referenciaentrega,_tipoendereco,_fornecedor,_celular)
				VALUES (iCep,sRua,iNumero,iCaixaPostal,sComplemento,sBairro,sMunicipio,sEstado,sPais,sNomeReceptor,sReferenciaEntrega,iTipoEndereco,bCodigoObjeto,bEndCelular);
				Status = 'SUCESSO';
			END IF;
		ELSE
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN	
				Status = 'FRACASSO';	
				RAISE EXCEPTION 'Endereco do Usuario já Cadastrado';
			ELSE		
				IF(bEndCelular = true) THEN
					UPDATE Endereco SET _celular = false
					WHERE _usuario = bCodigoObjeto;
				END IF;

				IF((select count(1) from endereco where _usuario = bCodigoObjeto and _celular = true)= 0) THEN
					cEndCelular = true;
				ELSE
					cEndCelular = false;	
				END IF;

				INSERT INTO Endereco(_cep,_rua,_numero,_caixapostal,_complemento,_bairro,_municipio,_estado,_pais,_nomereceptor,_referenciaentrega,_tipoendereco,_usuario,_celular)
				VALUES (iCep,sRua,iNumero,iCaixaPostal,sComplemento,sBairro,sMunicipio,sEstado,sPais,sNomeReceptor,sReferenciaEntrega,iTipoEndereco,bCodigoObjeto,cEndCelular);
				Status = 'SUCESSO';
			END IF;
		END IF;
	END IF; 

	IF (cTipo ='A') THEN 	
		IF(cTpObjeto ='F') THEN
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
				IF(bEndCelular = true) THEN
					UPDATE Endereco SET _celular = false
					WHERE _fornecedor = bCodigoObjeto;
				END IF;
				UPDATE Endereco SET _cep = iCep, _rua = sRua, _numero = iNumero, _caixapostal = iCaixaPostal, _complemento = sComplemento, _bairro = sBairro, _municipio = sMunicipio, 
						    _estado = sEstado, _pais = sPais, _nomereceptor = sNomeReceptor, _referenciaentrega = sReferenciaEntrega, _celular = bEndCelular
				WHERE _codigo = bCodigo;
				Status = 'SUCESSO';
			ELSE
				Status = 'FRACASSO';
				RAISE EXCEPTION 'Endereco do Fornecedor não Encontrado';
			END IF;
		ELSE
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN
					UPDATE Endereco SET _celular = false
					WHERE _usuario = bCodigoObjeto;
				UPDATE Endereco SET _cep = iCep, _rua = sRua, _numero = iNumero, _caixapostal = iCaixaPostal, _complemento = sComplemento, _bairro = sBairro, _municipio = sMunicipio, 
						    _estado = sEstado, _pais = sPais, _nomereceptor = sNomeReceptor, _referenciaentrega = sReferenciaEntrega, _celular = bEndCelular
				WHERE _codigo = bCodigo;
				Status = 'SUCESSO';
			ELSE
				Status = 'FRACASSO';
				RAISE EXCEPTION 'Endereco do Usuario não Encontrado';
			END IF;
		END IF;
	END IF; 

	IF (cTipo ='E') THEN
			IF((SELECT _codigo FROM Endereco WHERE _codigo = bCodigo) = bCodigo) THEN					
				DELETE FROM Endereco WHERE _codigo = bCodigo;
				Status = 'SUCESSO';
			ELSE
				Status = 'FRACASSO';
				RAISE EXCEPTION 'Endereco nao Encontrado';
			END IF;		
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_endereco(character varying, character varying, bigint, character varying, text, integer, integer, text, text, text, text, text, text, text, integer, bigint, boolean) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 43566)
-- Dependencies: 973 5
-- Name: operacao_fornecedor(character, bigint, text, text, bigint, bigint, bigint, bigint, text, text, integer, integer, integer, integer, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_fornecedor(character, bigint, text, text, bigint, bigint, bigint, bigint, text, text, integer, integer, integer, integer, integer, integer, text) RETURNS character varying
    AS $_$
DECLARE
	cTipo 			alias for $1;
	bCodigo  		alias for $2;
	vNomeFantasia  		alias for $3;
	vRazaoSocial		alias for $4;
	bCnpj 			alias for $5;
	bInscrEstadual		alias for $6;
	bCEI			alias for $7;
	bInscrMunicipal		alias for $8;
	vContato		alias for $9;
	vCargo			alias for $10;
	iDDD			alias for $11;
	iTelefonePrincipal	alias for $12;
	iRamal			alias for $13;
	iTelefoneOpcional	alias for $14;
	iFax			alias for $15;
	iCelular		alias for $16;
	vEmail			alias for $17;	
	Status 			varchar(30);
BEGIN
	
	IF(cTipo ='I') THEN 

		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Fornecedor já Cadastrado';
		ELSE
			INSERT INTO Fornecedores(_codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, _cei, _inscrmunicipal, _contato, _cargo, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _email)
			VALUES (bCodigo, vNomeFantasia, vRazaoSocial, bCnpj, bInscrEstadual, bCEI, bInscrMunicipal, vContato, vCargo, iDDD, iTelefonePrincipal, iRamal, iTelefoneOpcional, iFax, iCelular, vEmail);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	IF (cTipo ='A') THEN 	
		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Fornecedores SET _nomefantasia = vNomeFantasia, _razaosocial = vRazaoSocial, _cnpj = bCnpj, _cei = bCEI, _inscrestadual = bInscrEstadual, 
				_inscrmunicipal = bInscrMunicipal, _contato = vContato, _cargo = vCargo, _ddd = iDDD, _telefoneprincipal = iTelefonePrincipal, _telefoneopcional = iTelefoneOpcional, _fax = iFax, _celular = iCelular, _email = vEmail
			WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Fornecedor não Encontrado';
		END IF;
	END IF; 

	IF (cTipo ='E') THEN		
		IF((SELECT _codigo FROM Fornecedores WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Fornecedores WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Fornecedor não Encontrado';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_fornecedor(character, bigint, text, text, bigint, bigint, bigint, bigint, text, text, integer, integer, integer, integer, integer, integer, text) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 43567)
-- Dependencies: 973 5
-- Name: operacao_gerarpedidosms(character, bigint, bigint, bigint, double precision, double precision, double precision, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_gerarpedidosms(character, bigint, bigint, bigint, double precision, double precision, double precision, bigint) RETURNS character varying
    AS $_$
DECLARE
	cTipo				alias for $1;
	bCodigo				alias for $2;
	bProduto			alias for $3;
	bUsuario			alias for $4;
	dValorTotal			alias for $5;
	dValorFrete			alias for $6;
	dValorCompra			alias for $7;
	bEndereco			alias for $8;
	Status 				varchar(30);
	
BEGIN	
	IF(cTipo ='I') THEN 

		IF((SELECT _codigo FROM pedidosms WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Pedido já Cadastrado';
		ELSE
			INSERT INTO pedidosms(_codigo,_usuario,_produto,_statuspedido,_valortotal,_frete,_datapedido,_valorcompra,_endereco)
			VALUES (bCodigo,bUsuario,bProduto,(select _codigo from tipostatuspedido where _descricao = 'AGUARDANDO PAGAMENTO'),dValorTotal,dValorFrete,(select current_date),dValorCompra,bEndereco);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_gerarpedidosms(character, bigint, bigint, bigint, double precision, double precision, double precision, bigint) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 43568)
-- Dependencies: 5 973
-- Name: operacao_produtos(character, bigint, text, real, real, text, integer, integer, integer, text, text, integer, text, text, integer, integer, integer, bigint, text, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_produtos(character, bigint, text, real, real, text, integer, integer, integer, text, text, integer, text, text, integer, integer, integer, bigint, text, integer, integer) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodigo  	alias for $2;
	sTitulo  	alias for $3;
	fPesoKG		alias for $4;
	fValor		alias for $5;
	sUnidade 	alias for $6;
	iIpi		alias for $7;
	iIcms		alias for $8;
	iClassFiscal	alias for $9;
	sProcedencia	alias for $10;
	sPaisOrigem	alias for $11;
	iAnoLancamento	alias for $12;
	sAutorArtista	alias for $13;
	sIdioma		alias for $14;
	iTipoProduto	alias for $15;
	iGenero		alias for $16;
	iCategoria	alias for $17;
	bFornecedor	alias for $18;
	sResumo		alias for $19;
	iVendas		alias for $20;
	iVisitas	alias for $21;
	Status 		varchar(30);
BEGIN
	
	IF(Tipo ='I') THEN 

		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Produto já Cadastrado';
		ELSE
			INSERT INTO Produtos(_titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas)
			VALUES (sTitulo, fPesoKG, fValor, sUnidade, iIpi, iIcms, iClassFiscal, sProcedencia, sPaisOrigem, iAnoLancamento, sAutorArtista, sIdioma, iTipoProduto, iGenero, iCategoria, bFornecedor, sResumo, iVendas, iVisitas);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	IF (Tipo ='A') THEN 	
		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Produtos SET _titulo = sTitulo, _pesokg = fPesoKG, _valor = fValor, _unidade = sUnidade, _ipi = iIpi, _icms = iIcms, _classfiscal = iClassFiscal, _procedencia = sProcedencia, _paisorigem = sPaisOrigem, _anolancamento = iAnoLancamento,
				_autorartista = sAutorArtista, _idioma = sIdioma, _tipoproduto = iTipoProduto, _genero = iGenero, _categoria = iCategoria, _fornecedor = bFornecedor, _resumo = sResumo, _vendas = iVendas, _visitas = iVisitas
			WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Produto não Encontrado';
		END IF;
	END IF; 

	IF (Tipo ='E') THEN		
		IF((SELECT _codigo FROM Produtos WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Produtos WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Produto não Encontrado';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_produtos(character, bigint, text, real, real, text, integer, integer, integer, text, text, integer, text, text, integer, integer, integer, bigint, text, integer, integer) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 44345)
-- Dependencies: 973 5
-- Name: operacao_promocao(date, bigint, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_promocao(date, bigint, double precision) RETURNS character varying
    AS $_$
DECLARE
	dData		alias for $1;
	bCodProd	alias for $2;
	fValorPromo	alias for $3;

BEGIN	
	IF((SELECT COUNT(1) FROM promocao WHERE _produto = bCodProd) > 0 ) THEN
		UPDATE promocao SET _valorpromocao = fValorPromo, _datatermino = dData WHERE _produto = bCodProd;
	ELSE
		INSERT INTO promocao(_datatermino, _produto, _valorpromocao) VALUES (dData, bCodProd, fValorPromo);
	END IF;
	
	return 'OK';
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_promocao(date, bigint, double precision) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 43569)
-- Dependencies: 973 5
-- Name: operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer, date) RETURNS character varying
    AS $_$
DECLARE
	cTipo 			alias for $1;
	bCodigo  		alias for $2;
	iTipoUsuario		alias for $3;
	sNome			alias for $4;
	bCPF  			alias for $5;
	bRG			alias for $6;
	sOrgaoEmissor		alias for $7;
	sNaturalidade		alias for $8;
	dDataNascimento		alias for $9;
	sSexo			alias for $10;
	sEmail			alias for $11;
	sSenha			alias for $12;
	iDDD			alias for $13;
	iTelefonePrincipal	alias for $14;
	iRamal			alias for $15;
	iTelefoneOpcional	alias for $16;
	iFax			alias for $17;
	iCelular		alias for $18;
	dDataUltimoAcesso	alias for $19;
	Status 		varchar(30);
BEGIN
	
	IF(cTipo ='I') THEN 

		IF((SELECT COUNT(*) FROM Usuario WHERE _email = sEmail) = 1) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Usuario já Cadastrado';
		ELSE
			INSERT INTO Usuario(_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso)
			VALUES (bCodigo, iTipoUsuario, sNome, bCPF, bRG, sOrgaoEmissor, sNaturalidade, dDataNascimento, sSexo, sEmail, sSenha, iDDD, iTelefonePrincipal, iRamal, iTelefoneOpcional, iFax, iCelular, dDataUltimoAcesso);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	IF (cTipo ='A') THEN 	
		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Usuario SET _tipousuario = iTipoUsuario, _nome = sNome, _cpf = bCPF, _rg = bRG, _orgaoemissor = sOrgaoEmissor, _naturalidade = sNaturalidade, 
				_datanascimento = dDataNascimento, _sexo = sSexo, _email = sEmail,_ddd = iDDD, _telefoneprincipal = iTelefonePrincipal, _ramal = iRamal, 
				_telefoneopcional = iTelefoneOpcional, _fax = iFax, _celular = iCelular, _dataultimoacesso = dDataUltimoAcesso
			WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Usuario não Encontrado';
		END IF;
	END IF; 

	IF (cTipo ='E') THEN		
		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN					
			DELETE FROM Usuario WHERE _codigo = bCodigo;
			Status = 'SUCESSO';
		ELSE
			Status = 'FRACASSO';
			RAISE EXCEPTION 'Usuario não Encontrado';
		END IF;
	END IF; 

	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer, date) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 43570)
-- Dependencies: 905 5
-- Name: parse(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(oid, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(oid, text) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 43571)
-- Dependencies: 905 5
-- Name: parse(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text, text) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 43572)
-- Dependencies: 905 5
-- Name: parse(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 43573)
-- Dependencies: 5
-- Name: pg_buffercache_pages(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_buffercache_pages() RETURNS SETOF record
    AS '$libdir/pg_buffercache', 'pg_buffercache_pages'
    LANGUAGE c;


ALTER FUNCTION public.pg_buffercache_pages() OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 43574)
-- Dependencies: 5
-- Name: pg_freespacemap_pages(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_freespacemap_pages() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_pages'
    LANGUAGE c;


ALTER FUNCTION public.pg_freespacemap_pages() OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 43575)
-- Dependencies: 5
-- Name: pg_freespacemap_relations(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_freespacemap_relations() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_relations'
    LANGUAGE c;


ALTER FUNCTION public.pg_freespacemap_relations() OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 43576)
-- Dependencies: 5
-- Name: pgp_key_id(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_key_id(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_key_id_w'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_key_id(bytea) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 43577)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 43578)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 43579)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea, text, text) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 43580)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 43581)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 43582)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text, text) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 43583)
-- Dependencies: 5
-- Name: pgp_pub_encrypt(text, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt(text, bytea) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 43584)
-- Dependencies: 5
-- Name: pgp_pub_encrypt(text, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt(text, bytea, text) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 43585)
-- Dependencies: 5
-- Name: pgp_pub_encrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 43586)
-- Dependencies: 5
-- Name: pgp_pub_encrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 43587)
-- Dependencies: 5
-- Name: pgp_sym_decrypt(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt(bytea, text) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 43588)
-- Dependencies: 5
-- Name: pgp_sym_decrypt(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 43589)
-- Dependencies: 5
-- Name: pgp_sym_decrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt_bytea(bytea, text) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 43590)
-- Dependencies: 5
-- Name: pgp_sym_decrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt_bytea(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 43591)
-- Dependencies: 5
-- Name: pgp_sym_encrypt(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt(text, text) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 43592)
-- Dependencies: 5
-- Name: pgp_sym_encrypt(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt(text, text, text) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 43593)
-- Dependencies: 5
-- Name: pgp_sym_encrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt_bytea(bytea, text) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 43594)
-- Dependencies: 5
-- Name: pgp_sym_encrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt_bytea(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 43595)
-- Dependencies: 887 5
-- Name: plainto_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 43596)
-- Dependencies: 5 887
-- Name: plainto_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 43597)
-- Dependencies: 887 5
-- Name: plainto_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 43598)
-- Dependencies: 5
-- Name: prsd_end(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_end(internal) RETURNS void
    AS '$libdir/tsearch2', 'prsd_end'
    LANGUAGE c;


ALTER FUNCTION public.prsd_end(internal) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 43599)
-- Dependencies: 5
-- Name: prsd_getlexeme(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_getlexeme(internal, internal, internal) RETURNS integer
    AS '$libdir/tsearch2', 'prsd_getlexeme'
    LANGUAGE c;


ALTER FUNCTION public.prsd_getlexeme(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 43600)
-- Dependencies: 5
-- Name: prsd_headline(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_headline(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_headline'
    LANGUAGE c;


ALTER FUNCTION public.prsd_headline(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 43601)
-- Dependencies: 5
-- Name: prsd_lextype(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_lextype(internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_lextype'
    LANGUAGE c;


ALTER FUNCTION public.prsd_lextype(internal) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 43602)
-- Dependencies: 5
-- Name: prsd_start(internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_start(internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_start'
    LANGUAGE c;


ALTER FUNCTION public.prsd_start(internal, integer) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 43603)
-- Dependencies: 884 5
-- Name: querytree(query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION querytree(query_int) RETURNS text
    AS '$libdir/_int', 'querytree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.querytree(query_int) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 43604)
-- Dependencies: 887 5
-- Name: querytree(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION querytree(tsquery) RETURNS text
    AS '$libdir/tsearch2', 'tsquerytree'
    LANGUAGE c STRICT;


ALTER FUNCTION public.querytree(tsquery) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 43605)
-- Dependencies: 887 890 5
-- Name: rank(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 43606)
-- Dependencies: 890 5 887
-- Name: rank(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 43607)
-- Dependencies: 887 890 5
-- Name: rank(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 43608)
-- Dependencies: 887 5 890
-- Name: rank(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 43609)
-- Dependencies: 887 890 5
-- Name: rank_cd(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 43610)
-- Dependencies: 890 887 5
-- Name: rank_cd(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 43611)
-- Dependencies: 5 890 887
-- Name: rank_cd(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 43612)
-- Dependencies: 890 5 887
-- Name: rank_cd(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 43613)
-- Dependencies: 5 884
-- Name: rboolop(query_int, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rboolop(query_int, integer[]) RETURNS boolean
    AS '$libdir/_int', 'rboolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rboolop(query_int, integer[]) OWNER TO postgres;

--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 505
-- Name: FUNCTION rboolop(query_int, integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION rboolop(query_int, integer[]) IS 'boolean operation with array';


--
-- TOC entry 506 (class 1255 OID 43614)
-- Dependencies: 5
-- Name: reset_tsearch(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reset_tsearch() RETURNS void
    AS '$libdir/tsearch2', 'reset_tsearch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.reset_tsearch() OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 43615)
-- Dependencies: 5 887 887
-- Name: rewrite(tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, text) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 43616)
-- Dependencies: 887 5 887 887 887
-- Name: rewrite(tsquery, tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite_query'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 43617)
-- Dependencies: 5 887 887 889
-- Name: rewrite_accum(tsquery, tsquery[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_accum(tsquery, tsquery[]) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_accum'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_accum(tsquery, tsquery[]) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 43618)
-- Dependencies: 5 887 887
-- Name: rewrite_finish(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_finish(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_finish'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_finish(tsquery) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 43619)
-- Dependencies: 5 887 890
-- Name: rexectsq(tsquery, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rexectsq(tsquery, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'rexectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rexectsq(tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 511
-- Name: FUNCTION rexectsq(tsquery, tsvector); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION rexectsq(tsquery, tsvector) IS 'boolean operation with text index';


--
-- TOC entry 512 (class 1255 OID 43620)
-- Dependencies: 5
-- Name: sec_to_gc(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sec_to_gc(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/(2*earth()) > 1 THEN pi()*earth() ELSE 2*earth()*asin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.sec_to_gc(double precision) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 43621)
-- Dependencies: 5
-- Name: set_curcfg(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(integer) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 43622)
-- Dependencies: 5
-- Name: set_curcfg(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(text) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 43623)
-- Dependencies: 5
-- Name: set_curdict(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(integer) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 43624)
-- Dependencies: 5
-- Name: set_curdict(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(text) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 43625)
-- Dependencies: 5
-- Name: set_curprs(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(integer) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 43626)
-- Dependencies: 5
-- Name: set_curprs(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(text) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 43627)
-- Dependencies: 5
-- Name: set_timetravel(name, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_timetravel(name, integer) RETURNS integer
    AS '$libdir/timetravel', 'set_timetravel'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_timetravel(name, integer) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 43628)
-- Dependencies: 890 5 890
-- Name: setweight(tsvector, "char"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setweight(tsvector, "char") RETURNS tsvector
    AS '$libdir/tsearch2', 'setweight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setweight(tsvector, "char") OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 43629)
-- Dependencies: 5
-- Name: show_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION show_curcfg() RETURNS oid
    AS '$libdir/tsearch2', 'show_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.show_curcfg() OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 43630)
-- Dependencies: 5
-- Name: snb_en_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_en_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_en_init'
    LANGUAGE c;


ALTER FUNCTION public.snb_en_init(internal) OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 43631)
-- Dependencies: 5
-- Name: snb_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'snb_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.snb_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 43632)
-- Dependencies: 5
-- Name: snb_ru_init_koi8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_koi8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_koi8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_koi8(internal) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 43633)
-- Dependencies: 5
-- Name: snb_ru_init_utf8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_utf8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_utf8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_utf8(internal) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 43634)
-- Dependencies: 5
-- Name: sort(integer[], text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort(integer[], text) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[], text) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 43635)
-- Dependencies: 5
-- Name: sort(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[]) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 43636)
-- Dependencies: 5
-- Name: sort_asc(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort_asc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_asc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_asc(integer[]) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 43637)
-- Dependencies: 5
-- Name: sort_desc(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort_desc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_desc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_desc(integer[]) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 43638)
-- Dependencies: 5
-- Name: spell_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'spell_init'
    LANGUAGE c;


ALTER FUNCTION public.spell_init(internal) OWNER TO postgres;

--
-- TOC entry 531 (class 1255 OID 43639)
-- Dependencies: 5
-- Name: spell_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'spell_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.spell_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 43640)
-- Dependencies: 5
-- Name: ssl_client_cert_present(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_cert_present() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_client_cert_present'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_cert_present() OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 43641)
-- Dependencies: 5
-- Name: ssl_client_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn() OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 43642)
-- Dependencies: 5
-- Name: ssl_client_dn_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn_field(text) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 43643)
-- Dependencies: 5
-- Name: ssl_client_serial(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_serial() RETURNS numeric
    AS '$libdir/sslinfo', 'ssl_client_serial'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_serial() OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 43644)
-- Dependencies: 5
-- Name: ssl_is_used(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_is_used() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_is_used'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_is_used() OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 43645)
-- Dependencies: 5
-- Name: ssl_issuer_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_dn() OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 43646)
-- Dependencies: 5
-- Name: ssl_issuer_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_field(text) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 43647)
-- Dependencies: 5 901
-- Name: stat(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text) OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 43648)
-- Dependencies: 5 901
-- Name: stat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text, text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text, text) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 43649)
-- Dependencies: 5 890 890
-- Name: strip(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION strip(tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'strip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.strip(tsvector) OWNER TO postgres;

--
-- TOC entry 542 (class 1255 OID 43650)
-- Dependencies: 5
-- Name: subarray(integer[], integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subarray(integer[], integer, integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer, integer) OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 43651)
-- Dependencies: 5
-- Name: subarray(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subarray(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 43652)
-- Dependencies: 5
-- Name: syn_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'syn_init'
    LANGUAGE c;


ALTER FUNCTION public.syn_init(internal) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 43653)
-- Dependencies: 5
-- Name: syn_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'syn_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.syn_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 43654)
-- Dependencies: 5 854
-- Name: text(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ean13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ean13) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 43655)
-- Dependencies: 5 869
-- Name: text(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(isbn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(isbn13) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 43656)
-- Dependencies: 5 875
-- Name: text(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ismn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ismn13) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 43657)
-- Dependencies: 5 881
-- Name: text(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(issn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(issn13) OWNER TO postgres;

--
-- TOC entry 550 (class 1255 OID 43658)
-- Dependencies: 5 866
-- Name: text(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(isbn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(isbn) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 43659)
-- Dependencies: 5 872
-- Name: text(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ismn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ismn) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 43660)
-- Dependencies: 5 878
-- Name: text(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(issn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(issn) OWNER TO postgres;

--
-- TOC entry 553 (class 1255 OID 43661)
-- Dependencies: 893 5
-- Name: text(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(upc) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(upc) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 43662)
-- Dependencies: 5
-- Name: thesaurus_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_init'
    LANGUAGE c;


ALTER FUNCTION public.thesaurus_init(internal) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 43663)
-- Dependencies: 5
-- Name: thesaurus_lexize(internal, internal, integer, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_lexize(internal, internal, integer, internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.thesaurus_lexize(internal, internal, integer, internal) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 43664)
-- Dependencies: 5
-- Name: timetravel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION timetravel() RETURNS "trigger"
    AS '$libdir/timetravel', 'timetravel'
    LANGUAGE c;


ALTER FUNCTION public.timetravel() OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 43665)
-- Dependencies: 5 887
-- Name: to_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 43666)
-- Dependencies: 887 5
-- Name: to_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 43667)
-- Dependencies: 887 5
-- Name: to_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 43668)
-- Dependencies: 890 5
-- Name: to_tsvector(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(oid, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(oid, text) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 43669)
-- Dependencies: 890 5
-- Name: to_tsvector(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text, text) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 43670)
-- Dependencies: 890 5
-- Name: to_tsvector(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 43671)
-- Dependencies: 5 906
-- Name: token_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(integer) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(integer) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 43672)
-- Dependencies: 906 5
-- Name: token_type(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(text) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(text) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 43673)
-- Dependencies: 5 906
-- Name: token_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type() RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type() OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 43674)
-- Dependencies: 907 5
-- Name: ts_debug(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ts_debug(text) RETURNS SETOF tsdebug
    AS $_$
select 
        m.ts_name,
        t.alias as tok_type,
        t.descr as description,
        p.token,
        m.dict_name,
        strip(to_tsvector(p.token)) as tsvector
from
        parse( _get_parser_from_curcfg(), $1 ) as p,
        token_type() as t,
        pg_ts_cfgmap as m,
        pg_ts_cfg as c
where
        t.tokid=p.tokid and
        t.alias = m.tok_alias and 
        m.ts_name=c.ts_name and 
        c.oid=show_curcfg() 
$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.ts_debug(text) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 43675)
-- Dependencies: 5
-- Name: tsearch2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsearch2() RETURNS "trigger"
    AS '$libdir/tsearch2', 'tsearch2'
    LANGUAGE c;


ALTER FUNCTION public.tsearch2() OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 43676)
-- Dependencies: 887 5 887
-- Name: tsq_mcontained(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontained(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontained(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 43677)
-- Dependencies: 5 887 887
-- Name: tsq_mcontains(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontains(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontains(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 43678)
-- Dependencies: 5 887 887 887
-- Name: tsquery_and(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_and(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_and'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_and(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 43679)
-- Dependencies: 887 887 5
-- Name: tsquery_cmp(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_cmp(tsquery, tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_cmp(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 43680)
-- Dependencies: 5 887 887
-- Name: tsquery_eq(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_eq(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_eq(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 43681)
-- Dependencies: 887 5 887
-- Name: tsquery_ge(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ge(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ge(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 574 (class 1255 OID 43682)
-- Dependencies: 887 5 887
-- Name: tsquery_gt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_gt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_gt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 43683)
-- Dependencies: 887 5 887
-- Name: tsquery_le(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_le(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_le(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 43684)
-- Dependencies: 887 5 887
-- Name: tsquery_lt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_lt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_lt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 43685)
-- Dependencies: 5 887 887
-- Name: tsquery_ne(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ne(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ne(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 43686)
-- Dependencies: 5 887 887
-- Name: tsquery_not(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_not(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_not'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_not(tsquery) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 43687)
-- Dependencies: 887 887 887 5
-- Name: tsquery_or(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_or(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_or'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_or(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 43688)
-- Dependencies: 5 890 890
-- Name: tsvector_cmp(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_cmp(tsvector, tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_cmp(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 43689)
-- Dependencies: 890 890 5
-- Name: tsvector_eq(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_eq(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_eq(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 43690)
-- Dependencies: 5 890 890
-- Name: tsvector_ge(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ge(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ge(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 43691)
-- Dependencies: 890 890 5
-- Name: tsvector_gt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_gt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_gt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 43692)
-- Dependencies: 890 890 5
-- Name: tsvector_le(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_le(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_le(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 43693)
-- Dependencies: 890 5 890
-- Name: tsvector_lt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_lt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_lt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 43694)
-- Dependencies: 890 890 5
-- Name: tsvector_ne(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ne(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ne(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 43695)
-- Dependencies: 5
-- Name: uniq(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION uniq(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'uniq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.uniq(integer[]) OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 43696)
-- Dependencies: 854 5 893
-- Name: upc(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc(ean13) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc(ean13) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 43697)
-- Dependencies: 893 5
-- Name: upc(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc(text) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc(text) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 43698)
-- Dependencies: 5
-- Name: xml_encode_special_chars(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_encode_special_chars(text) RETURNS text
    AS '$libdir/pgxml', 'xml_encode_special_chars'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_encode_special_chars(text) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 43699)
-- Dependencies: 5
-- Name: xml_is_well_formed(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_is_well_formed(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_is_well_formed(text) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 43700)
-- Dependencies: 5
-- Name: xml_valid(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_valid(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_valid(text) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 43701)
-- Dependencies: 5
-- Name: xpath_bool(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_bool(text, text) RETURNS boolean
    AS '$libdir/pgxml', 'xpath_bool'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_bool(text, text) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 43702)
-- Dependencies: 5
-- Name: xpath_list(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_list'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text, text) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 43703)
-- Dependencies: 5
-- Name: xpath_list(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text) RETURNS text
    AS $_$SELECT xpath_list($1,$2,',')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 43704)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_nodeset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text, text) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 43705)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'','')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 43706)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'',$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 43707)
-- Dependencies: 5
-- Name: xpath_number(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_number(text, text) RETURNS real
    AS '$libdir/pgxml', 'xpath_number'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_number(text, text) OWNER TO postgres;

--
-- TOC entry 600 (class 1255 OID 43708)
-- Dependencies: 5
-- Name: xpath_string(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_string(text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_string'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_string(text, text) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 43709)
-- Dependencies: 5
-- Name: xpath_table(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_table(text, text, text, text, text) RETURNS SETOF record
    AS '$libdir/pgxml', 'xpath_table'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.xpath_table(text, text, text, text, text) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 43710)
-- Dependencies: 5
-- Name: xslt_process(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c STRICT;


ALTER FUNCTION public.xslt_process(text, text, text) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 43711)
-- Dependencies: 5
-- Name: xslt_process(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xslt_process(text, text) OWNER TO postgres;

--
-- TOC entry 974 (class 1255 OID 43712)
-- Dependencies: 243 5 242
-- Name: int_array_aggregate(integer); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE int_array_aggregate(integer) (
    SFUNC = int_agg_state,
    STYPE = integer[],
    FINALFUNC = int_agg_final_array
);


ALTER AGGREGATE public.int_array_aggregate(integer) OWNER TO postgres;

--
-- TOC entry 975 (class 1255 OID 43713)
-- Dependencies: 509 510 5 887 889
-- Name: rewrite(tsquery[]); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE rewrite(tsquery[]) (
    SFUNC = rewrite_accum,
    STYPE = tsquery,
    FINALFUNC = rewrite_finish
);


ALTER AGGREGATE public.rewrite(tsquery[]) OWNER TO postgres;

--
-- TOC entry 1642 (class 2617 OID 43714)
-- Dependencies: 887 5 578 887
-- Name: !!; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR !! (
    PROCEDURE = tsquery_not,
    RIGHTARG = tsquery
);


ALTER OPERATOR public.!! (NONE, tsquery) OWNER TO postgres;

--
-- TOC entry 1643 (class 2617 OID 43715)
-- Dependencies: 239 5
-- Name: #; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR # (
    PROCEDURE = icount,
    RIGHTARG = integer[]
);


ALTER OPERATOR public.# (NONE, integer[]) OWNER TO postgres;

--
-- TOC entry 1644 (class 2617 OID 43716)
-- Dependencies: 240 5
-- Name: #; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR # (
    PROCEDURE = idx,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.# (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1645 (class 2617 OID 43717)
-- Dependencies: 57 5
-- Name: &; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR & (
    PROCEDURE = _int_inter,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &
);


ALTER OPERATOR public.& (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1646 (class 2617 OID 43718)
-- Dependencies: 842 122 5 842
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = cube_overlap,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = &&,
    RESTRICT = areasel,
    JOIN = areajoinsel
);


ALTER OPERATOR public.&& (cube, cube) OWNER TO postgres;

--
-- TOC entry 1647 (class 2617 OID 43719)
-- Dependencies: 5 58
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = _int_overlap,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1648 (class 2617 OID 43720)
-- Dependencies: 887 5 570 887 887
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = tsquery_and,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.&& (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1649 (class 2617 OID 43721)
-- Dependencies: 5 247
-- Name: +; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.+ (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1650 (class 2617 OID 43722)
-- Dependencies: 5 246
-- Name: +; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_array,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = +
);


ALTER OPERATOR public.+ (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1651 (class 2617 OID 43723)
-- Dependencies: 5 245
-- Name: -; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR - (
    PROCEDURE = intarray_del_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.- (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1652 (class 2617 OID 43724)
-- Dependencies: 249 5
-- Name: -; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR - (
    PROCEDURE = intset_subtract,
    LEFTARG = integer[],
    RIGHTARG = integer[]
);


ALTER OPERATOR public.- (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1653 (class 2617 OID 43727)
-- Dependencies: 842 842 120 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = cube_lt,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (cube, cube) OWNER TO postgres;

--
-- TOC entry 1654 (class 2617 OID 43730)
-- Dependencies: 381 5 854 854
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1655 (class 2617 OID 43733)
-- Dependencies: 854 382 869 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1656 (class 2617 OID 43736)
-- Dependencies: 854 391 869 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1657 (class 2617 OID 43739)
-- Dependencies: 383 875 854 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1658 (class 2617 OID 43742)
-- Dependencies: 854 397 5 875
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1659 (class 2617 OID 43745)
-- Dependencies: 384 5 881 854
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1660 (class 2617 OID 43748)
-- Dependencies: 5 403 854 881
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1661 (class 2617 OID 43751)
-- Dependencies: 5 854 385 866
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1662 (class 2617 OID 43754)
-- Dependencies: 866 394 854 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1663 (class 2617 OID 43757)
-- Dependencies: 854 872 386 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1664 (class 2617 OID 43760)
-- Dependencies: 854 400 5 872
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1665 (class 2617 OID 43763)
-- Dependencies: 387 5 854 878
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1666 (class 2617 OID 43766)
-- Dependencies: 854 5 878 406
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1667 (class 2617 OID 43769)
-- Dependencies: 854 5 893 388
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1668 (class 2617 OID 43772)
-- Dependencies: 5 408 854 893
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1669 (class 2617 OID 43775)
-- Dependencies: 5 389 869 869
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1670 (class 2617 OID 43778)
-- Dependencies: 866 5 869 390
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1671 (class 2617 OID 43781)
-- Dependencies: 869 5 866 393
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1672 (class 2617 OID 43784)
-- Dependencies: 866 866 5 392
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1673 (class 2617 OID 43787)
-- Dependencies: 5 395 875 875
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1674 (class 2617 OID 43790)
-- Dependencies: 875 5 396 872
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1675 (class 2617 OID 43793)
-- Dependencies: 399 875 872 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1676 (class 2617 OID 43796)
-- Dependencies: 398 5 872 872
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1677 (class 2617 OID 43799)
-- Dependencies: 881 401 5 881
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1678 (class 2617 OID 43802)
-- Dependencies: 402 878 881 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1679 (class 2617 OID 43805)
-- Dependencies: 5 878 881 405
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1680 (class 2617 OID 43808)
-- Dependencies: 5 878 878 404
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (issn, issn) OWNER TO postgres;

--
-- TOC entry 1681 (class 2617 OID 43811)
-- Dependencies: 407 893 893 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (upc, upc) OWNER TO postgres;

--
-- TOC entry 1682 (class 2617 OID 43814)
-- Dependencies: 890 890 585 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = tsvector_lt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1683 (class 2617 OID 43817)
-- Dependencies: 887 887 576 5
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = tsquery_lt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1684 (class 2617 OID 43818)
-- Dependencies: 842 842 118 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = cube_le,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (cube, cube) OWNER TO postgres;

--
-- TOC entry 1685 (class 2617 OID 43819)
-- Dependencies: 854 353 5 854
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1686 (class 2617 OID 43820)
-- Dependencies: 854 354 5 869
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1687 (class 2617 OID 43821)
-- Dependencies: 5 854 363 869
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1688 (class 2617 OID 43822)
-- Dependencies: 854 5 355 875
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1689 (class 2617 OID 43823)
-- Dependencies: 854 5 369 875
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1690 (class 2617 OID 43824)
-- Dependencies: 854 881 356 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1691 (class 2617 OID 43825)
-- Dependencies: 375 854 881 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1692 (class 2617 OID 43826)
-- Dependencies: 866 854 5 357
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1693 (class 2617 OID 43827)
-- Dependencies: 854 866 5 366
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1694 (class 2617 OID 43828)
-- Dependencies: 5 854 872 358
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1695 (class 2617 OID 43829)
-- Dependencies: 5 872 854 372
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1696 (class 2617 OID 43830)
-- Dependencies: 5 854 878 359
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1697 (class 2617 OID 43831)
-- Dependencies: 5 878 854 378
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1698 (class 2617 OID 43832)
-- Dependencies: 893 360 854 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1699 (class 2617 OID 43833)
-- Dependencies: 854 380 5 893
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1700 (class 2617 OID 43834)
-- Dependencies: 869 5 361 869
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1701 (class 2617 OID 43835)
-- Dependencies: 869 5 362 866
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1702 (class 2617 OID 43836)
-- Dependencies: 866 5 365 869
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1703 (class 2617 OID 43837)
-- Dependencies: 866 5 364 866
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1704 (class 2617 OID 43838)
-- Dependencies: 875 5 367 875
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1705 (class 2617 OID 43839)
-- Dependencies: 368 872 875 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1706 (class 2617 OID 43840)
-- Dependencies: 5 371 875 872
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1707 (class 2617 OID 43841)
-- Dependencies: 5 370 872 872
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1708 (class 2617 OID 43842)
-- Dependencies: 373 5 881 881
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1709 (class 2617 OID 43843)
-- Dependencies: 5 374 878 881
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1710 (class 2617 OID 43844)
-- Dependencies: 5 377 881 878
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1711 (class 2617 OID 43845)
-- Dependencies: 376 5 878 878
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (issn, issn) OWNER TO postgres;

--
-- TOC entry 1712 (class 2617 OID 43846)
-- Dependencies: 379 5 893 893
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (upc, upc) OWNER TO postgres;

--
-- TOC entry 1713 (class 2617 OID 43847)
-- Dependencies: 584 5 890 890
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = tsvector_le,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1714 (class 2617 OID 43848)
-- Dependencies: 887 887 575 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = tsquery_le,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1715 (class 2617 OID 43850)
-- Dependencies: 842 842 121 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = cube_ne,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (cube, cube) OWNER TO postgres;

--
-- TOC entry 1716 (class 2617 OID 43852)
-- Dependencies: 409 5 854 854
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1718 (class 2617 OID 43853)
-- Dependencies: 419 854 869 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1717 (class 2617 OID 43855)
-- Dependencies: 410 869 854 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1720 (class 2617 OID 43857)
-- Dependencies: 854 5 875 425
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1719 (class 2617 OID 43859)
-- Dependencies: 875 411 5 854
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1722 (class 2617 OID 43861)
-- Dependencies: 431 5 881 854
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1721 (class 2617 OID 43863)
-- Dependencies: 5 412 881 854
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1724 (class 2617 OID 43865)
-- Dependencies: 854 5 866 422
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1723 (class 2617 OID 43867)
-- Dependencies: 5 413 854 866
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1726 (class 2617 OID 43869)
-- Dependencies: 854 5 872 428
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1725 (class 2617 OID 43871)
-- Dependencies: 414 5 854 872
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1728 (class 2617 OID 43873)
-- Dependencies: 878 854 434 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1727 (class 2617 OID 43875)
-- Dependencies: 854 878 415 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1730 (class 2617 OID 43877)
-- Dependencies: 5 893 436 854
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1729 (class 2617 OID 43879)
-- Dependencies: 5 854 893 416
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1731 (class 2617 OID 43882)
-- Dependencies: 869 5 417 869
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1733 (class 2617 OID 43883)
-- Dependencies: 866 421 869 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1732 (class 2617 OID 43885)
-- Dependencies: 866 418 869 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1734 (class 2617 OID 43888)
-- Dependencies: 420 866 866 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1735 (class 2617 OID 43890)
-- Dependencies: 875 875 423 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1737 (class 2617 OID 43891)
-- Dependencies: 5 427 872 875
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1736 (class 2617 OID 43893)
-- Dependencies: 5 424 872 875
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1738 (class 2617 OID 43896)
-- Dependencies: 872 5 872 426
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1739 (class 2617 OID 43898)
-- Dependencies: 881 429 881 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1741 (class 2617 OID 43899)
-- Dependencies: 878 433 5 881
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1740 (class 2617 OID 43901)
-- Dependencies: 5 881 878 430
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1742 (class 2617 OID 43904)
-- Dependencies: 432 878 878 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (issn, issn) OWNER TO postgres;

--
-- TOC entry 1743 (class 2617 OID 43906)
-- Dependencies: 435 893 893 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (upc, upc) OWNER TO postgres;

--
-- TOC entry 1744 (class 2617 OID 43908)
-- Dependencies: 890 586 890 5
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1745 (class 2617 OID 43910)
-- Dependencies: 577 5 887 887
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = tsquery_ne,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1746 (class 2617 OID 43912)
-- Dependencies: 842 5 842 111
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = cube_contained,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (cube, cube) OWNER TO postgres;

--
-- TOC entry 1747 (class 2617 OID 43914)
-- Dependencies: 5 54
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1748 (class 2617 OID 43916)
-- Dependencies: 887 887 5 568
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1749 (class 2617 OID 43917)
-- Dependencies: 201 5
-- Name: <@>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@> (
    PROCEDURE = geo_distance,
    LEFTARG = point,
    RIGHTARG = point,
    COMMUTATOR = <@>
);


ALTER OPERATOR public.<@> (point, point) OWNER TO postgres;

--
-- TOC entry 1750 (class 2617 OID 43849)
-- Dependencies: 842 114 5 842
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = cube_eq,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (cube, cube) OWNER TO postgres;

--
-- TOC entry 1751 (class 2617 OID 43851)
-- Dependencies: 269 854 5 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1753 (class 2617 OID 43854)
-- Dependencies: 854 270 869 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1752 (class 2617 OID 43856)
-- Dependencies: 279 5 869 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1755 (class 2617 OID 43858)
-- Dependencies: 271 5 854 875
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1754 (class 2617 OID 43860)
-- Dependencies: 875 285 5 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1757 (class 2617 OID 43862)
-- Dependencies: 272 881 854 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1756 (class 2617 OID 43864)
-- Dependencies: 291 5 881 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1759 (class 2617 OID 43866)
-- Dependencies: 854 5 866 273
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1758 (class 2617 OID 43868)
-- Dependencies: 854 5 282 866
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1761 (class 2617 OID 43870)
-- Dependencies: 274 5 872 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1760 (class 2617 OID 43872)
-- Dependencies: 288 872 5 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1763 (class 2617 OID 43874)
-- Dependencies: 5 878 275 854
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1762 (class 2617 OID 43876)
-- Dependencies: 5 294 854 878
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1765 (class 2617 OID 43878)
-- Dependencies: 276 893 854 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1764 (class 2617 OID 43880)
-- Dependencies: 854 5 893 296
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1766 (class 2617 OID 43881)
-- Dependencies: 5 869 869 277
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1768 (class 2617 OID 43884)
-- Dependencies: 866 869 5 278
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1767 (class 2617 OID 43886)
-- Dependencies: 5 866 869 281
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1769 (class 2617 OID 43887)
-- Dependencies: 5 866 866 280
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1770 (class 2617 OID 43889)
-- Dependencies: 5 875 875 283
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1772 (class 2617 OID 43892)
-- Dependencies: 875 284 872 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1771 (class 2617 OID 43894)
-- Dependencies: 872 287 875 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1773 (class 2617 OID 43895)
-- Dependencies: 286 5 872 872
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1774 (class 2617 OID 43897)
-- Dependencies: 5 881 881 289
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1776 (class 2617 OID 43900)
-- Dependencies: 881 878 290 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1775 (class 2617 OID 43902)
-- Dependencies: 293 878 881 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1777 (class 2617 OID 43903)
-- Dependencies: 292 5 878 878
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (issn, issn) OWNER TO postgres;

--
-- TOC entry 1778 (class 2617 OID 43905)
-- Dependencies: 893 295 5 893
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.= (upc, upc) OWNER TO postgres;

--
-- TOC entry 1779 (class 2617 OID 43907)
-- Dependencies: 581 5 890 890
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = tsvector_eq,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1780 (class 2617 OID 43909)
-- Dependencies: 887 887 5 572
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = tsquery_eq,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1781 (class 2617 OID 43725)
-- Dependencies: 116 842 842 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = cube_gt,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (cube, cube) OWNER TO postgres;

--
-- TOC entry 1782 (class 2617 OID 43728)
-- Dependencies: 5 854 325 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1783 (class 2617 OID 43731)
-- Dependencies: 5 869 854 335
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1784 (class 2617 OID 43734)
-- Dependencies: 869 5 854 326
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1785 (class 2617 OID 43737)
-- Dependencies: 854 875 341 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1786 (class 2617 OID 43740)
-- Dependencies: 5 854 875 327
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1787 (class 2617 OID 43743)
-- Dependencies: 881 347 5 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1788 (class 2617 OID 43746)
-- Dependencies: 854 328 881 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1789 (class 2617 OID 43749)
-- Dependencies: 854 866 5 338
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1790 (class 2617 OID 43752)
-- Dependencies: 866 329 5 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1791 (class 2617 OID 43755)
-- Dependencies: 872 854 344 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1792 (class 2617 OID 43758)
-- Dependencies: 854 330 872 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1793 (class 2617 OID 43761)
-- Dependencies: 350 878 5 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1794 (class 2617 OID 43764)
-- Dependencies: 878 5 331 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1795 (class 2617 OID 43767)
-- Dependencies: 854 893 5 352
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1796 (class 2617 OID 43770)
-- Dependencies: 5 332 893 854
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1797 (class 2617 OID 43773)
-- Dependencies: 869 333 5 869
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1798 (class 2617 OID 43776)
-- Dependencies: 866 869 337 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1799 (class 2617 OID 43779)
-- Dependencies: 866 334 5 869
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1800 (class 2617 OID 43782)
-- Dependencies: 5 866 866 336
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1801 (class 2617 OID 43785)
-- Dependencies: 5 339 875 875
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1802 (class 2617 OID 43788)
-- Dependencies: 5 872 875 343
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1803 (class 2617 OID 43791)
-- Dependencies: 875 340 872 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1804 (class 2617 OID 43794)
-- Dependencies: 872 5 342 872
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1805 (class 2617 OID 43797)
-- Dependencies: 881 5 345 881
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1806 (class 2617 OID 43800)
-- Dependencies: 5 881 349 878
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1807 (class 2617 OID 43803)
-- Dependencies: 881 878 346 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1808 (class 2617 OID 43806)
-- Dependencies: 5 878 348 878
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (issn, issn) OWNER TO postgres;

--
-- TOC entry 1809 (class 2617 OID 43809)
-- Dependencies: 893 351 893 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (upc, upc) OWNER TO postgres;

--
-- TOC entry 1810 (class 2617 OID 43812)
-- Dependencies: 890 890 5 583
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = tsvector_gt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1811 (class 2617 OID 43815)
-- Dependencies: 887 887 5 574
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = tsquery_gt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1812 (class 2617 OID 43726)
-- Dependencies: 115 842 842 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = cube_ge,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (cube, cube) OWNER TO postgres;

--
-- TOC entry 1813 (class 2617 OID 43729)
-- Dependencies: 854 297 5 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, ean13) OWNER TO postgres;

--
-- TOC entry 1814 (class 2617 OID 43732)
-- Dependencies: 854 869 298 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 1815 (class 2617 OID 43735)
-- Dependencies: 307 854 5 869
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 1816 (class 2617 OID 43738)
-- Dependencies: 299 854 875 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 1817 (class 2617 OID 43741)
-- Dependencies: 875 313 854 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 1818 (class 2617 OID 43744)
-- Dependencies: 881 300 5 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, issn13) OWNER TO postgres;

--
-- TOC entry 1819 (class 2617 OID 43747)
-- Dependencies: 5 881 854 319
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn13, ean13) OWNER TO postgres;

--
-- TOC entry 1820 (class 2617 OID 43750)
-- Dependencies: 5 866 301 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, isbn) OWNER TO postgres;

--
-- TOC entry 1821 (class 2617 OID 43753)
-- Dependencies: 5 854 310 866
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn, ean13) OWNER TO postgres;

--
-- TOC entry 1822 (class 2617 OID 43756)
-- Dependencies: 872 302 5 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, ismn) OWNER TO postgres;

--
-- TOC entry 1823 (class 2617 OID 43759)
-- Dependencies: 872 5 316 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn, ean13) OWNER TO postgres;

--
-- TOC entry 1824 (class 2617 OID 43762)
-- Dependencies: 878 5 854 303
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, issn) OWNER TO postgres;

--
-- TOC entry 1825 (class 2617 OID 43765)
-- Dependencies: 854 322 5 878
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn, ean13) OWNER TO postgres;

--
-- TOC entry 1826 (class 2617 OID 43768)
-- Dependencies: 304 893 854 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ean13, upc) OWNER TO postgres;

--
-- TOC entry 1827 (class 2617 OID 43771)
-- Dependencies: 324 5 893 854
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (upc, ean13) OWNER TO postgres;

--
-- TOC entry 1828 (class 2617 OID 43774)
-- Dependencies: 869 869 5 305
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 1829 (class 2617 OID 43777)
-- Dependencies: 869 866 5 306
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 1830 (class 2617 OID 43780)
-- Dependencies: 869 866 5 309
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 1831 (class 2617 OID 43783)
-- Dependencies: 866 866 5 308
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (isbn, isbn) OWNER TO postgres;

--
-- TOC entry 1832 (class 2617 OID 43786)
-- Dependencies: 5 311 875 875
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 1833 (class 2617 OID 43789)
-- Dependencies: 872 312 5 875
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 1834 (class 2617 OID 43792)
-- Dependencies: 315 875 872 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 1835 (class 2617 OID 43795)
-- Dependencies: 5 314 872 872
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (ismn, ismn) OWNER TO postgres;

--
-- TOC entry 1836 (class 2617 OID 43798)
-- Dependencies: 881 317 881 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn13, issn13) OWNER TO postgres;

--
-- TOC entry 1837 (class 2617 OID 43801)
-- Dependencies: 318 5 881 878
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn13, issn) OWNER TO postgres;

--
-- TOC entry 1838 (class 2617 OID 43804)
-- Dependencies: 881 321 878 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn, issn13) OWNER TO postgres;

--
-- TOC entry 1839 (class 2617 OID 43807)
-- Dependencies: 878 878 320 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (issn, issn) OWNER TO postgres;

--
-- TOC entry 1840 (class 2617 OID 43810)
-- Dependencies: 893 323 893 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (upc, upc) OWNER TO postgres;

--
-- TOC entry 1841 (class 2617 OID 43813)
-- Dependencies: 582 890 890 5
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = tsvector_ge,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1842 (class 2617 OID 43816)
-- Dependencies: 5 573 887 887
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = tsquery_ge,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1843 (class 2617 OID 43919)
-- Dependencies: 112 5 842 842
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = cube_contains,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (cube, cube) OWNER TO postgres;

--
-- TOC entry 1844 (class 2617 OID 43921)
-- Dependencies: 5 55
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1845 (class 2617 OID 43923)
-- Dependencies: 569 5 887 887
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1846 (class 2617 OID 43911)
-- Dependencies: 842 842 112 5
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = cube_contains,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (cube, cube) OWNER TO postgres;

--
-- TOC entry 1847 (class 2617 OID 43913)
-- Dependencies: 55 5
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1848 (class 2617 OID 43915)
-- Dependencies: 887 5 887 569
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1849 (class 2617 OID 43925)
-- Dependencies: 5 62 884
-- Name: @@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@ (
    PROCEDURE = boolop,
    LEFTARG = integer[],
    RIGHTARG = query_int,
    COMMUTATOR = ~~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (integer[], query_int) OWNER TO postgres;

--
-- TOC entry 1851 (class 2617 OID 43926)
-- Dependencies: 890 175 887 5
-- Name: @@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 1850 (class 2617 OID 43927)
-- Dependencies: 5 887 890 511
-- Name: @@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@ (tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 1853 (class 2617 OID 43928)
-- Dependencies: 887 5 890 175
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@@ (tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 1852 (class 2617 OID 43929)
-- Dependencies: 890 887 5 511
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @@@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@@@ (tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 1854 (class 2617 OID 43930)
-- Dependencies: 5 250
-- Name: |; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR | (
    PROCEDURE = intset_union_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.| (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1855 (class 2617 OID 43931)
-- Dependencies: 60 5
-- Name: |; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR | (
    PROCEDURE = _int_union,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = |
);


ALTER OPERATOR public.| (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1856 (class 2617 OID 43932)
-- Dependencies: 890 91 890 5 890
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);


ALTER OPERATOR public.|| (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 1857 (class 2617 OID 43933)
-- Dependencies: 887 5 887 579 887
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = tsquery_or,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ||,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.|| (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1858 (class 2617 OID 43918)
-- Dependencies: 111 5 842 842
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = cube_contained,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (cube, cube) OWNER TO postgres;

--
-- TOC entry 1859 (class 2617 OID 43920)
-- Dependencies: 54 5
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1860 (class 2617 OID 43922)
-- Dependencies: 887 887 568 5
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 1861 (class 2617 OID 43924)
-- Dependencies: 884 505 5
-- Name: ~~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~~ (
    PROCEDURE = rboolop,
    LEFTARG = query_int,
    RIGHTARG = integer[],
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~~ (query_int, integer[]) OWNER TO postgres;

--
-- TOC entry 1964 (class 2616 OID 43934)
-- Dependencies: 1653 110 842 1684 1750 1812 1781 5
-- Name: cube_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS cube_ops
    DEFAULT FOR TYPE cube USING btree AS
    OPERATOR 1 <(cube,cube) ,
    OPERATOR 2 <=(cube,cube) ,
    OPERATOR 3 =(cube,cube) ,
    OPERATOR 4 >=(cube,cube) ,
    OPERATOR 5 >(cube,cube) ,
    FUNCTION 1 cube_cmp(cube,cube);


ALTER OPERATOR CLASS public.cube_ops USING btree OWNER TO postgres;

--
-- TOC entry 1965 (class 2616 OID 43935)
-- Dependencies: 68 63 70 69 67 66 65 64 1782 1796 1794 1792 1790 1788 1786 1784 1813 1826 1824 1822 1820 1818 1816 1814 1751 1765 1763 1761 1759 1757 1755 1753 1685 1698 1696 1694 1692 1690 1688 1686 1654 1667 1665 1663 1661 1659 1657 1655 854 5
-- Name: ean13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ean13_ops
    DEFAULT FOR TYPE ean13 USING btree AS
    OPERATOR 1 <(ean13,isbn13) ,
    OPERATOR 1 <(ean13,ismn13) ,
    OPERATOR 1 <(ean13,issn13) ,
    OPERATOR 1 <(ean13,isbn) ,
    OPERATOR 1 <(ean13,ismn) ,
    OPERATOR 1 <(ean13,issn) ,
    OPERATOR 1 <(ean13,upc) ,
    OPERATOR 1 <(ean13,ean13) ,
    OPERATOR 2 <=(ean13,isbn13) ,
    OPERATOR 2 <=(ean13,ismn13) ,
    OPERATOR 2 <=(ean13,issn13) ,
    OPERATOR 2 <=(ean13,isbn) ,
    OPERATOR 2 <=(ean13,ismn) ,
    OPERATOR 2 <=(ean13,issn) ,
    OPERATOR 2 <=(ean13,upc) ,
    OPERATOR 2 <=(ean13,ean13) ,
    OPERATOR 3 =(ean13,isbn13) ,
    OPERATOR 3 =(ean13,ismn13) ,
    OPERATOR 3 =(ean13,issn13) ,
    OPERATOR 3 =(ean13,isbn) ,
    OPERATOR 3 =(ean13,ismn) ,
    OPERATOR 3 =(ean13,issn) ,
    OPERATOR 3 =(ean13,upc) ,
    OPERATOR 3 =(ean13,ean13) ,
    OPERATOR 4 >=(ean13,isbn13) ,
    OPERATOR 4 >=(ean13,ismn13) ,
    OPERATOR 4 >=(ean13,issn13) ,
    OPERATOR 4 >=(ean13,isbn) ,
    OPERATOR 4 >=(ean13,ismn) ,
    OPERATOR 4 >=(ean13,issn) ,
    OPERATOR 4 >=(ean13,upc) ,
    OPERATOR 4 >=(ean13,ean13) ,
    OPERATOR 5 >(ean13,isbn13) ,
    OPERATOR 5 >(ean13,ismn13) ,
    OPERATOR 5 >(ean13,issn13) ,
    OPERATOR 5 >(ean13,isbn) ,
    OPERATOR 5 >(ean13,ismn) ,
    OPERATOR 5 >(ean13,issn) ,
    OPERATOR 5 >(ean13,upc) ,
    OPERATOR 5 >(ean13,ean13) ,
    FUNCTION 1 btean13cmp(ean13,isbn13) ,
    FUNCTION 1 btean13cmp(ean13,ismn13) ,
    FUNCTION 1 btean13cmp(ean13,issn13) ,
    FUNCTION 1 btean13cmp(ean13,isbn) ,
    FUNCTION 1 btean13cmp(ean13,ismn) ,
    FUNCTION 1 btean13cmp(ean13,issn) ,
    FUNCTION 1 btean13cmp(ean13,upc) ,
    FUNCTION 1 btean13cmp(ean13,ean13);


ALTER OPERATOR CLASS public.ean13_ops USING btree OWNER TO postgres;

--
-- TOC entry 1966 (class 2616 OID 43936)
-- Dependencies: 223 1751 854 5
-- Name: ean13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ean13_ops
    DEFAULT FOR TYPE ean13 USING hash AS
    OPERATOR 1 =(ean13,ean13) ,
    FUNCTION 1 hashean13(ean13);


ALTER OPERATOR CLASS public.ean13_ops USING hash OWNER TO postgres;

--
-- TOC entry 1967 (class 2616 OID 43937)
-- Dependencies: 205 206 5 890 1851 1853 204
-- Name: gin_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gin_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gin AS
    STORAGE text ,
    OPERATOR 1 @@(tsvector,tsquery) ,
    OPERATOR 2 @@@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 bttextcmp(text,text) ,
    FUNCTION 2 gin_extract_tsvector(tsvector,internal) ,
    FUNCTION 3 gin_extract_tsquery(tsquery,internal,internal) ,
    FUNCTION 4 gin_ts_consistent(internal,internal,tsquery);


ALTER OPERATOR CLASS public.gin_tsvector_ops USING gin OWNER TO postgres;

--
-- TOC entry 1968 (class 2616 OID 43938)
-- Dependencies: 189 184 1849 1859 1844 1747 1847 1647 5 188 185 186 187 183
-- Name: gist__int_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist__int_ops
    DEFAULT FOR TYPE integer[] USING gist AS
    OPERATOR 3 &&(integer[],integer[]) ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) ,
    OPERATOR 8 <@(integer[],integer[]) ,
    OPERATOR 13 @(integer[],integer[]) ,
    OPERATOR 14 ~(integer[],integer[]) ,
    OPERATOR 20 @@(integer[],query_int) ,
    FUNCTION 1 g_int_consistent(internal,integer[],integer) ,
    FUNCTION 2 g_int_union(internal,internal) ,
    FUNCTION 3 g_int_compress(internal) ,
    FUNCTION 4 g_int_decompress(internal) ,
    FUNCTION 5 g_int_penalty(internal,internal,internal) ,
    FUNCTION 6 g_int_picksplit(internal,internal) ,
    FUNCTION 7 g_int_same(integer[],integer[],internal);


ALTER OPERATOR CLASS public.gist__int_ops USING gist OWNER TO postgres;

--
-- TOC entry 1969 (class 2616 OID 43939)
-- Dependencies: 195 1747 1847 1647 863 5 1859 1849 191 196 190 192 193 194 1844
-- Name: gist__intbig_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist__intbig_ops
    FOR TYPE integer[] USING gist AS
    STORAGE intbig_gkey ,
    OPERATOR 3 &&(integer[],integer[]) RECHECK ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) RECHECK ,
    OPERATOR 8 <@(integer[],integer[]) RECHECK ,
    OPERATOR 13 @(integer[],integer[]) RECHECK ,
    OPERATOR 14 ~(integer[],integer[]) RECHECK ,
    OPERATOR 20 @@(integer[],query_int) RECHECK ,
    FUNCTION 1 g_intbig_consistent(internal,internal,integer) ,
    FUNCTION 2 g_intbig_union(internal,internal) ,
    FUNCTION 3 g_intbig_compress(internal) ,
    FUNCTION 4 g_intbig_decompress(internal) ,
    FUNCTION 5 g_intbig_penalty(internal,internal,internal) ,
    FUNCTION 6 g_intbig_picksplit(internal,internal) ,
    FUNCTION 7 g_intbig_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist__intbig_ops USING gist OWNER TO postgres;

--
-- TOC entry 1970 (class 2616 OID 43940)
-- Dependencies: 176 181 180 179 178 182 177 1858 1843 1746 1846 1750 1646 842 5
-- Name: gist_cube_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_cube_ops
    DEFAULT FOR TYPE cube USING gist AS
    OPERATOR 3 &&(cube,cube) ,
    OPERATOR 6 =(cube,cube) ,
    OPERATOR 7 @>(cube,cube) ,
    OPERATOR 8 <@(cube,cube) ,
    OPERATOR 13 @(cube,cube) ,
    OPERATOR 14 ~(cube,cube) ,
    FUNCTION 1 g_cube_consistent(internal,cube,integer) ,
    FUNCTION 2 g_cube_union(internal,internal) ,
    FUNCTION 3 g_cube_compress(internal) ,
    FUNCTION 4 g_cube_decompress(internal) ,
    FUNCTION 5 g_cube_penalty(internal,internal,internal) ,
    FUNCTION 6 g_cube_picksplit(internal,internal) ,
    FUNCTION 7 g_cube_same(cube,cube,internal);


ALTER OPERATOR CLASS public.gist_cube_ops USING gist OWNER TO postgres;

--
-- TOC entry 1971 (class 2616 OID 43941)
-- Dependencies: 209 215 210 1860 1845 1748 1848 857 5 887 214 213 212 211
-- Name: gist_tp_tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_tp_tsquery_ops
    DEFAULT FOR TYPE tsquery USING gist AS
    STORAGE gtsq ,
    OPERATOR 7 @>(tsquery,tsquery) RECHECK ,
    OPERATOR 8 <@(tsquery,tsquery) RECHECK ,
    OPERATOR 13 @(tsquery,tsquery) RECHECK ,
    OPERATOR 14 ~(tsquery,tsquery) RECHECK ,
    FUNCTION 1 gtsq_consistent(gtsq,internal,integer) ,
    FUNCTION 2 gtsq_union(bytea,internal) ,
    FUNCTION 3 gtsq_compress(internal) ,
    FUNCTION 4 gtsq_decompress(internal) ,
    FUNCTION 5 gtsq_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsq_picksplit(internal,internal) ,
    FUNCTION 7 gtsq_same(gtsq,gtsq,internal);


ALTER OPERATOR CLASS public.gist_tp_tsquery_ops USING gist OWNER TO postgres;

--
-- TOC entry 1972 (class 2616 OID 43942)
-- Dependencies: 221 219 218 216 222 217 1851 860 890 5 220
-- Name: gist_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gist AS
    STORAGE gtsvector ,
    OPERATOR 1 @@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 gtsvector_consistent(gtsvector,internal,integer) ,
    FUNCTION 2 gtsvector_union(internal,internal) ,
    FUNCTION 3 gtsvector_compress(internal) ,
    FUNCTION 4 gtsvector_decompress(internal) ,
    FUNCTION 5 gtsvector_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsvector_picksplit(internal,internal) ,
    FUNCTION 7 gtsvector_same(gtsvector,gtsvector,internal);


ALTER OPERATOR CLASS public.gist_tsvector_ops USING gist OWNER TO postgres;

--
-- TOC entry 1973 (class 2616 OID 43943)
-- Dependencies: 1687 1670 1656 869 5 71 73 72 1797 1799 1783 1828 1829 1815 1766 1768 1752 1700 1701 1669
-- Name: isbn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn13_ops
    DEFAULT FOR TYPE isbn13 USING btree AS
    OPERATOR 1 <(isbn13,ean13) ,
    OPERATOR 1 <(isbn13,isbn) ,
    OPERATOR 1 <(isbn13,isbn13) ,
    OPERATOR 2 <=(isbn13,ean13) ,
    OPERATOR 2 <=(isbn13,isbn) ,
    OPERATOR 2 <=(isbn13,isbn13) ,
    OPERATOR 3 =(isbn13,ean13) ,
    OPERATOR 3 =(isbn13,isbn) ,
    OPERATOR 3 =(isbn13,isbn13) ,
    OPERATOR 4 >=(isbn13,ean13) ,
    OPERATOR 4 >=(isbn13,isbn) ,
    OPERATOR 4 >=(isbn13,isbn13) ,
    OPERATOR 5 >(isbn13,ean13) ,
    OPERATOR 5 >(isbn13,isbn) ,
    OPERATOR 5 >(isbn13,isbn13) ,
    FUNCTION 1 btisbn13cmp(isbn13,ean13) ,
    FUNCTION 1 btisbn13cmp(isbn13,isbn) ,
    FUNCTION 1 btisbn13cmp(isbn13,isbn13);


ALTER OPERATOR CLASS public.isbn13_ops USING btree OWNER TO postgres;

--
-- TOC entry 1974 (class 2616 OID 43944)
-- Dependencies: 869 5 1766 225
-- Name: isbn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn13_ops
    DEFAULT FOR TYPE isbn13 USING hash AS
    OPERATOR 1 =(isbn13,isbn13) ,
    FUNCTION 1 hashisbn13(isbn13);


ALTER OPERATOR CLASS public.isbn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 1975 (class 2616 OID 43945)
-- Dependencies: 1821 74 76 75 1800 1798 1789 1831 1830 1769 1767 1758 1703 1702 1693 1672 1671 1662 866 5
-- Name: isbn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn_ops
    DEFAULT FOR TYPE isbn USING btree AS
    OPERATOR 1 <(isbn,ean13) ,
    OPERATOR 1 <(isbn,isbn13) ,
    OPERATOR 1 <(isbn,isbn) ,
    OPERATOR 2 <=(isbn,ean13) ,
    OPERATOR 2 <=(isbn,isbn13) ,
    OPERATOR 2 <=(isbn,isbn) ,
    OPERATOR 3 =(isbn,ean13) ,
    OPERATOR 3 =(isbn,isbn13) ,
    OPERATOR 3 =(isbn,isbn) ,
    OPERATOR 4 >=(isbn,ean13) ,
    OPERATOR 4 >=(isbn,isbn13) ,
    OPERATOR 4 >=(isbn,isbn) ,
    OPERATOR 5 >(isbn,ean13) ,
    OPERATOR 5 >(isbn,isbn13) ,
    OPERATOR 5 >(isbn,isbn) ,
    FUNCTION 1 btisbncmp(isbn,ean13) ,
    FUNCTION 1 btisbncmp(isbn,isbn13) ,
    FUNCTION 1 btisbncmp(isbn,isbn);


ALTER OPERATOR CLASS public.isbn_ops USING btree OWNER TO postgres;

--
-- TOC entry 1976 (class 2616 OID 43946)
-- Dependencies: 5 224 866 1769
-- Name: isbn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn_ops
    DEFAULT FOR TYPE isbn USING hash AS
    OPERATOR 1 =(isbn,isbn) ,
    FUNCTION 1 hashisbn(isbn);


ALTER OPERATOR CLASS public.isbn_ops USING hash OWNER TO postgres;

--
-- TOC entry 1977 (class 2616 OID 43947)
-- Dependencies: 5 77 1673 1674 1658 875 1785 1803 1801 78 79 1832 1833 1817 1770 1772 1754 1704 1705 1689
-- Name: ismn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn13_ops
    DEFAULT FOR TYPE ismn13 USING btree AS
    OPERATOR 1 <(ismn13,ean13) ,
    OPERATOR 1 <(ismn13,ismn) ,
    OPERATOR 1 <(ismn13,ismn13) ,
    OPERATOR 2 <=(ismn13,ean13) ,
    OPERATOR 2 <=(ismn13,ismn) ,
    OPERATOR 2 <=(ismn13,ismn13) ,
    OPERATOR 3 =(ismn13,ean13) ,
    OPERATOR 3 =(ismn13,ismn) ,
    OPERATOR 3 =(ismn13,ismn13) ,
    OPERATOR 4 >=(ismn13,ean13) ,
    OPERATOR 4 >=(ismn13,ismn) ,
    OPERATOR 4 >=(ismn13,ismn13) ,
    OPERATOR 5 >(ismn13,ean13) ,
    OPERATOR 5 >(ismn13,ismn) ,
    OPERATOR 5 >(ismn13,ismn13) ,
    FUNCTION 1 btismn13cmp(ismn13,ean13) ,
    FUNCTION 1 btismn13cmp(ismn13,ismn) ,
    FUNCTION 1 btismn13cmp(ismn13,ismn13);


ALTER OPERATOR CLASS public.ismn13_ops USING btree OWNER TO postgres;

--
-- TOC entry 1978 (class 2616 OID 43948)
-- Dependencies: 875 1770 5 227
-- Name: ismn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn13_ops
    DEFAULT FOR TYPE ismn13 USING hash AS
    OPERATOR 1 =(ismn13,ismn13) ,
    FUNCTION 1 hashismn13(ismn13);


ALTER OPERATOR CLASS public.ismn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 1979 (class 2616 OID 43949)
-- Dependencies: 5 80 82 81 1804 1802 1791 1835 1834 1823 1773 1771 1760 1707 1706 1695 1676 1675 1664 872
-- Name: ismn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn_ops
    DEFAULT FOR TYPE ismn USING btree AS
    OPERATOR 1 <(ismn,ean13) ,
    OPERATOR 1 <(ismn,ismn13) ,
    OPERATOR 1 <(ismn,ismn) ,
    OPERATOR 2 <=(ismn,ean13) ,
    OPERATOR 2 <=(ismn,ismn13) ,
    OPERATOR 2 <=(ismn,ismn) ,
    OPERATOR 3 =(ismn,ean13) ,
    OPERATOR 3 =(ismn,ismn13) ,
    OPERATOR 3 =(ismn,ismn) ,
    OPERATOR 4 >=(ismn,ean13) ,
    OPERATOR 4 >=(ismn,ismn13) ,
    OPERATOR 4 >=(ismn,ismn) ,
    OPERATOR 5 >(ismn,ean13) ,
    OPERATOR 5 >(ismn,ismn13) ,
    OPERATOR 5 >(ismn,ismn) ,
    FUNCTION 1 btismncmp(ismn,ean13) ,
    FUNCTION 1 btismncmp(ismn,ismn13) ,
    FUNCTION 1 btismncmp(ismn,ismn);


ALTER OPERATOR CLASS public.ismn_ops USING btree OWNER TO postgres;

--
-- TOC entry 1980 (class 2616 OID 43950)
-- Dependencies: 1773 226 5 872
-- Name: ismn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn_ops
    DEFAULT FOR TYPE ismn USING hash AS
    OPERATOR 1 =(ismn,ismn) ,
    FUNCTION 1 hashismn(ismn);


ALTER OPERATOR CLASS public.ismn_ops USING hash OWNER TO postgres;

--
-- TOC entry 1981 (class 2616 OID 43951)
-- Dependencies: 1678 1677 1691 1709 5 881 1660 83 85 84 1805 1807 1787 1836 1837 1819 1774 1776 1756 1708
-- Name: issn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn13_ops
    DEFAULT FOR TYPE issn13 USING btree AS
    OPERATOR 1 <(issn13,ean13) ,
    OPERATOR 1 <(issn13,issn) ,
    OPERATOR 1 <(issn13,issn13) ,
    OPERATOR 2 <=(issn13,ean13) ,
    OPERATOR 2 <=(issn13,issn) ,
    OPERATOR 2 <=(issn13,issn13) ,
    OPERATOR 3 =(issn13,ean13) ,
    OPERATOR 3 =(issn13,issn) ,
    OPERATOR 3 =(issn13,issn13) ,
    OPERATOR 4 >=(issn13,ean13) ,
    OPERATOR 4 >=(issn13,issn) ,
    OPERATOR 4 >=(issn13,issn13) ,
    OPERATOR 5 >(issn13,ean13) ,
    OPERATOR 5 >(issn13,issn) ,
    OPERATOR 5 >(issn13,issn13) ,
    FUNCTION 1 btissn13cmp(issn13,ean13) ,
    FUNCTION 1 btissn13cmp(issn13,issn) ,
    FUNCTION 1 btissn13cmp(issn13,issn13);


ALTER OPERATOR CLASS public.issn13_ops USING btree OWNER TO postgres;

--
-- TOC entry 1982 (class 2616 OID 43952)
-- Dependencies: 881 1774 5 229
-- Name: issn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn13_ops
    DEFAULT FOR TYPE issn13 USING hash AS
    OPERATOR 1 =(issn13,issn13) ,
    FUNCTION 1 hashissn13(issn13);


ALTER OPERATOR CLASS public.issn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 1983 (class 2616 OID 43953)
-- Dependencies: 88 87 1808 1806 1793 1839 1838 1825 1777 1775 1762 1711 1710 1697 1680 1666 1679 878 5 86
-- Name: issn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn_ops
    DEFAULT FOR TYPE issn USING btree AS
    OPERATOR 1 <(issn,ean13) ,
    OPERATOR 1 <(issn,issn13) ,
    OPERATOR 1 <(issn,issn) ,
    OPERATOR 2 <=(issn,ean13) ,
    OPERATOR 2 <=(issn,issn13) ,
    OPERATOR 2 <=(issn,issn) ,
    OPERATOR 3 =(issn,ean13) ,
    OPERATOR 3 =(issn,issn13) ,
    OPERATOR 3 =(issn,issn) ,
    OPERATOR 4 >=(issn,ean13) ,
    OPERATOR 4 >=(issn,issn13) ,
    OPERATOR 4 >=(issn,issn) ,
    OPERATOR 5 >(issn,ean13) ,
    OPERATOR 5 >(issn,issn13) ,
    OPERATOR 5 >(issn,issn) ,
    FUNCTION 1 btissncmp(issn,ean13) ,
    FUNCTION 1 btissncmp(issn,issn13) ,
    FUNCTION 1 btissncmp(issn,issn);


ALTER OPERATOR CLASS public.issn_ops USING btree OWNER TO postgres;

--
-- TOC entry 1984 (class 2616 OID 43954)
-- Dependencies: 878 228 1777 5
-- Name: issn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn_ops
    DEFAULT FOR TYPE issn USING hash AS
    OPERATOR 1 =(issn,issn) ,
    FUNCTION 1 hashissn(issn);


ALTER OPERATOR CLASS public.issn_ops USING hash OWNER TO postgres;

--
-- TOC entry 1985 (class 2616 OID 43955)
-- Dependencies: 1683 5 887 571 1811 1842 1780 1714
-- Name: tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS tsquery_ops
    DEFAULT FOR TYPE tsquery USING btree AS
    OPERATOR 1 <(tsquery,tsquery) ,
    OPERATOR 2 <=(tsquery,tsquery) ,
    OPERATOR 3 =(tsquery,tsquery) ,
    OPERATOR 4 >=(tsquery,tsquery) ,
    OPERATOR 5 >(tsquery,tsquery) ,
    FUNCTION 1 tsquery_cmp(tsquery,tsquery);


ALTER OPERATOR CLASS public.tsquery_ops USING btree OWNER TO postgres;

--
-- TOC entry 1986 (class 2616 OID 43956)
-- Dependencies: 1841 1810 580 890 1682 1713 5 1779
-- Name: tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS tsvector_ops
    DEFAULT FOR TYPE tsvector USING btree AS
    OPERATOR 1 <(tsvector,tsvector) ,
    OPERATOR 2 <=(tsvector,tsvector) ,
    OPERATOR 3 =(tsvector,tsvector) ,
    OPERATOR 4 >=(tsvector,tsvector) ,
    OPERATOR 5 >(tsvector,tsvector) ,
    FUNCTION 1 tsvector_cmp(tsvector,tsvector);


ALTER OPERATOR CLASS public.tsvector_ops USING btree OWNER TO postgres;

--
-- TOC entry 1987 (class 2616 OID 43957)
-- Dependencies: 1712 5 893 1668 1681 1699 1764 1778 1827 1840 1795 1809 90 89
-- Name: upc_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS upc_ops
    DEFAULT FOR TYPE upc USING btree AS
    OPERATOR 1 <(upc,ean13) ,
    OPERATOR 1 <(upc,upc) ,
    OPERATOR 2 <=(upc,ean13) ,
    OPERATOR 2 <=(upc,upc) ,
    OPERATOR 3 =(upc,ean13) ,
    OPERATOR 3 =(upc,upc) ,
    OPERATOR 4 >=(upc,ean13) ,
    OPERATOR 4 >=(upc,upc) ,
    OPERATOR 5 >(upc,ean13) ,
    OPERATOR 5 >(upc,upc) ,
    FUNCTION 1 btupccmp(upc,ean13) ,
    FUNCTION 1 btupccmp(upc,upc);


ALTER OPERATOR CLASS public.upc_ops USING btree OWNER TO postgres;

--
-- TOC entry 1988 (class 2616 OID 43958)
-- Dependencies: 1778 5 893 230
-- Name: upc_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS upc_ops
    DEFAULT FOR TYPE upc USING hash AS
    OPERATOR 1 =(upc,upc) ,
    FUNCTION 1 hashupc(upc);


ALTER OPERATOR CLASS public.upc_ops USING hash OWNER TO postgres;

SET search_path = pg_catalog;

--
-- TOC entry 2638 (class 2605 OID 43959)
-- Dependencies: 259 259 854 866
-- Name: CAST (public.ean13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.isbn) WITH FUNCTION public.isbn(public.ean13);


--
-- TOC entry 2639 (class 2605 OID 43960)
-- Dependencies: 261 869 261 854
-- Name: CAST (public.ean13 AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.isbn13) WITH FUNCTION public.isbn13(public.ean13);


--
-- TOC entry 2640 (class 2605 OID 43961)
-- Dependencies: 263 872 263 854
-- Name: CAST (public.ean13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.ismn) WITH FUNCTION public.ismn(public.ean13);


--
-- TOC entry 2641 (class 2605 OID 43962)
-- Dependencies: 265 854 875 265
-- Name: CAST (public.ean13 AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.ismn13) WITH FUNCTION public.ismn13(public.ean13);


--
-- TOC entry 2642 (class 2605 OID 43963)
-- Dependencies: 437 854 878 437
-- Name: CAST (public.ean13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.issn) WITH FUNCTION public.issn(public.ean13);


--
-- TOC entry 2643 (class 2605 OID 43964)
-- Dependencies: 439 854 881 439
-- Name: CAST (public.ean13 AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.issn13) WITH FUNCTION public.issn13(public.ean13);


--
-- TOC entry 2637 (class 2605 OID 43965)
-- Dependencies: 546 854 546
-- Name: CAST (public.ean13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS text) WITH FUNCTION public.text(public.ean13);


--
-- TOC entry 2644 (class 2605 OID 43966)
-- Dependencies: 588 854 893 588
-- Name: CAST (public.ean13 AS public.upc); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.upc) WITH FUNCTION public.upc(public.ean13);


--
-- TOC entry 2646 (class 2605 OID 43967)
-- Dependencies: 866 854
-- Name: CAST (public.isbn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2647 (class 2605 OID 43968)
-- Dependencies: 866 869
-- Name: CAST (public.isbn AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS public.isbn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2645 (class 2605 OID 43969)
-- Dependencies: 550 866 550
-- Name: CAST (public.isbn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS text) WITH FUNCTION public.text(public.isbn);


--
-- TOC entry 2649 (class 2605 OID 43970)
-- Dependencies: 854 869
-- Name: CAST (public.isbn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2650 (class 2605 OID 43971)
-- Dependencies: 869 866
-- Name: CAST (public.isbn13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS public.isbn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2648 (class 2605 OID 43972)
-- Dependencies: 547 869 547
-- Name: CAST (public.isbn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS text) WITH FUNCTION public.text(public.isbn13);


--
-- TOC entry 2652 (class 2605 OID 43973)
-- Dependencies: 872 854
-- Name: CAST (public.ismn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2653 (class 2605 OID 43974)
-- Dependencies: 875 872
-- Name: CAST (public.ismn AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS public.ismn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2651 (class 2605 OID 43975)
-- Dependencies: 551 872 551
-- Name: CAST (public.ismn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS text) WITH FUNCTION public.text(public.ismn);


--
-- TOC entry 2655 (class 2605 OID 43976)
-- Dependencies: 854 875
-- Name: CAST (public.ismn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2656 (class 2605 OID 43977)
-- Dependencies: 875 872
-- Name: CAST (public.ismn13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS public.ismn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2654 (class 2605 OID 43978)
-- Dependencies: 548 875 548
-- Name: CAST (public.ismn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS text) WITH FUNCTION public.text(public.ismn13);


--
-- TOC entry 2658 (class 2605 OID 43979)
-- Dependencies: 878 854
-- Name: CAST (public.issn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2659 (class 2605 OID 43980)
-- Dependencies: 881 878
-- Name: CAST (public.issn AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS public.issn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2657 (class 2605 OID 43981)
-- Dependencies: 552 552 878
-- Name: CAST (public.issn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS text) WITH FUNCTION public.text(public.issn);


--
-- TOC entry 2661 (class 2605 OID 43982)
-- Dependencies: 881 854
-- Name: CAST (public.issn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2662 (class 2605 OID 43983)
-- Dependencies: 881 878
-- Name: CAST (public.issn13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS public.issn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2660 (class 2605 OID 43984)
-- Dependencies: 549 881 549
-- Name: CAST (public.issn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS text) WITH FUNCTION public.text(public.issn13);


--
-- TOC entry 2456 (class 2605 OID 43985)
-- Dependencies: 105 105 842
-- Name: CAST (text AS public.cube); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.cube) WITH FUNCTION public.cube(text) AS ASSIGNMENT;


--
-- TOC entry 2457 (class 2605 OID 43986)
-- Dependencies: 170 170 854
-- Name: CAST (text AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ean13) WITH FUNCTION public.ean13(text);


--
-- TOC entry 2458 (class 2605 OID 43987)
-- Dependencies: 260 260 866
-- Name: CAST (text AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.isbn) WITH FUNCTION public.isbn(text);


--
-- TOC entry 2459 (class 2605 OID 43988)
-- Dependencies: 262 869 262
-- Name: CAST (text AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.isbn13) WITH FUNCTION public.isbn13(text);


--
-- TOC entry 2460 (class 2605 OID 43989)
-- Dependencies: 264 264 872
-- Name: CAST (text AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ismn) WITH FUNCTION public.ismn(text);


--
-- TOC entry 2461 (class 2605 OID 43990)
-- Dependencies: 266 875 266
-- Name: CAST (text AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ismn13) WITH FUNCTION public.ismn13(text);


--
-- TOC entry 2462 (class 2605 OID 43991)
-- Dependencies: 438 438 878
-- Name: CAST (text AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.issn) WITH FUNCTION public.issn(text);


--
-- TOC entry 2463 (class 2605 OID 43992)
-- Dependencies: 440 440 881
-- Name: CAST (text AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.issn13) WITH FUNCTION public.issn13(text);


--
-- TOC entry 2464 (class 2605 OID 43993)
-- Dependencies: 589 893 589
-- Name: CAST (text AS public.upc); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.upc) WITH FUNCTION public.upc(text);


--
-- TOC entry 2664 (class 2605 OID 43994)
-- Dependencies: 854 893
-- Name: CAST (public.upc AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.upc AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2663 (class 2605 OID 43995)
-- Dependencies: 553 553 893
-- Name: CAST (public.upc AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.upc AS text) WITH FUNCTION public.text(public.upc);


SET search_path = public, pg_catalog;

--
-- TOC entry 2233 (class 1259 OID 43996)
-- Dependencies: 5
-- Name: sq_avaliacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_avaliacao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_avaliacao OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2234 (class 1259 OID 43998)
-- Dependencies: 2665 5
-- Name: avaliacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE avaliacao (
    _codigo bigint DEFAULT nextval('sq_avaliacao'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _avaliacao character varying(300) NOT NULL,
    _usuario bigint NOT NULL
);


ALTER TABLE public.avaliacao OWNER TO postgres;

--
-- TOC entry 2235 (class 1259 OID 44001)
-- Dependencies: 5
-- Name: sq_avaliaratendimento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_avaliaratendimento
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_avaliaratendimento OWNER TO postgres;

--
-- TOC entry 2236 (class 1259 OID 44003)
-- Dependencies: 2666 5
-- Name: avaliaratendimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE avaliaratendimento (
    _codigo integer DEFAULT nextval('sq_avaliaratendimento'::regclass) NOT NULL,
    _avaliacao character varying(2000) NOT NULL,
    _usuario integer NOT NULL,
    _dataavaliacao date
);


ALTER TABLE public.avaliaratendimento OWNER TO postgres;

--
-- TOC entry 2237 (class 1259 OID 44009)
-- Dependencies: 5
-- Name: sq_boleto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_boleto
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_boleto OWNER TO postgres;

--
-- TOC entry 2238 (class 1259 OID 44011)
-- Dependencies: 2667 2668 5
-- Name: boleto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE boleto (
    _codigo integer DEFAULT nextval('sq_boleto'::regclass) NOT NULL,
    _valor real NOT NULL,
    _valorboleto real NOT NULL,
    _nossonumero integer DEFAULT 666,
    _numeropedido bigint NOT NULL,
    _usuario bigint NOT NULL,
    _datavencimento date NOT NULL,
    _dataprocessamento date NOT NULL,
    _cedente character varying(20) NOT NULL,
    _linhadigitavel character varying(100) NOT NULL,
    _aprovado boolean
);


ALTER TABLE public.boleto OWNER TO postgres;

--
-- TOC entry 2239 (class 1259 OID 44015)
-- Dependencies: 5
-- Name: sq_caracttipoproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_caracttipoproduto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_caracttipoproduto OWNER TO postgres;

--
-- TOC entry 2240 (class 1259 OID 44017)
-- Dependencies: 2669 5
-- Name: caracttipoproduto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE caracttipoproduto (
    _codigo integer DEFAULT nextval('sq_caracttipoproduto'::regclass) NOT NULL,
    _descricao character varying(20) NOT NULL,
    _tipoproduto integer NOT NULL
);


ALTER TABLE public.caracttipoproduto OWNER TO postgres;

--
-- TOC entry 2241 (class 1259 OID 44020)
-- Dependencies: 5
-- Name: sq_categoria; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_categoria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_categoria OWNER TO postgres;

--
-- TOC entry 2242 (class 1259 OID 44022)
-- Dependencies: 2670 5
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    _codigo integer DEFAULT nextval('sq_categoria'::regclass) NOT NULL,
    _descricao character varying(40) NOT NULL,
    _genero integer NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 2243 (class 1259 OID 44025)
-- Dependencies: 5
-- Name: sq_conteudoproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_conteudoproduto
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_conteudoproduto OWNER TO postgres;

--
-- TOC entry 2244 (class 1259 OID 44027)
-- Dependencies: 2671 5
-- Name: conteudoproduto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conteudoproduto (
    _codigo bigint DEFAULT nextval('sq_conteudoproduto'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _caracttipoproduto bigint NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.conteudoproduto OWNER TO postgres;

--
-- TOC entry 2245 (class 1259 OID 44030)
-- Dependencies: 5
-- Name: sq_dadoscartao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_dadoscartao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_dadoscartao OWNER TO postgres;

--
-- TOC entry 2246 (class 1259 OID 44032)
-- Dependencies: 2672 5
-- Name: dadoscartao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dadoscartao (
    _codigo bigint DEFAULT nextval('sq_dadoscartao'::regclass) NOT NULL,
    _numerocartao bigint NOT NULL,
    _codigoseguranca integer NOT NULL,
    _anovalidade integer NOT NULL,
    _mesvalidade integer NOT NULL,
    _nomeimpresso character varying(50) NOT NULL,
    _parcelas integer NOT NULL,
    _pedidodesktopwap bigint NOT NULL,
    _valortotal double precision,
    _tentativas integer,
    _aprovado boolean
);


ALTER TABLE public.dadoscartao OWNER TO postgres;

--
-- TOC entry 2247 (class 1259 OID 44035)
-- Dependencies: 5
-- Name: dadosempresa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dadosempresa (
    _codigo bigint NOT NULL,
    _nomefantasia character varying(100) NOT NULL,
    _razaosocial character varying(100) NOT NULL,
    _cnpj bigint NOT NULL,
    _inscrestadual bigint,
    _inscrmunicipal bigint,
    _telefoneprincipal integer,
    _cep character varying(8) NOT NULL,
    _endereco character varying(100),
    _numero character varying(30),
    _complemento character varying(50),
    _bairro character varying(40),
    _municipio character varying(50),
    _estado character varying(2),
    _pais character varying(30),
    _ddd integer,
    _dddfax integer,
    _fax integer
);


ALTER TABLE public.dadosempresa OWNER TO postgres;

--
-- TOC entry 2248 (class 1259 OID 44037)
-- Dependencies: 5
-- Name: sq_endereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_endereco
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_endereco OWNER TO postgres;

--
-- TOC entry 2249 (class 1259 OID 44039)
-- Dependencies: 2673 5
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE endereco (
    _codigo bigint DEFAULT nextval('sq_endereco'::regclass) NOT NULL,
    _cep character varying(8) NOT NULL,
    _rua character varying(200) NOT NULL,
    _numero numeric(4,0) NOT NULL,
    _caixapostal numeric(10,0),
    _complemento character varying(150),
    _bairro character varying(50) NOT NULL,
    _municipio character varying(20) NOT NULL,
    _estado character varying(15) NOT NULL,
    _pais character varying(15) NOT NULL,
    _nomereceptor character varying(15),
    _referenciaentrega character varying(150),
    _tipoendereco integer NOT NULL,
    _fornecedor bigint,
    _usuario bigint,
    _ultimo boolean,
    _celular boolean
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- TOC entry 2250 (class 1259 OID 44042)
-- Dependencies: 5
-- Name: sq_estoque; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_estoque
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_estoque OWNER TO postgres;

--
-- TOC entry 2251 (class 1259 OID 44044)
-- Dependencies: 2674 5
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estoque (
    _codigo bigint DEFAULT nextval('sq_estoque'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _quantidadedisponivel integer NOT NULL,
    _quantidadeestoque integer NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- TOC entry 2252 (class 1259 OID 44047)
-- Dependencies: 5
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fornecedores (
    _codigo bigint NOT NULL,
    _nomefantasia character varying(20) NOT NULL,
    _razaosocial character varying(30) NOT NULL,
    _cnpj bigint NOT NULL,
    _inscrestadual bigint,
    _cei bigint,
    _inscrmunicipal bigint,
    _contato character varying(15),
    _cargo character varying(20),
    _ddd integer,
    _telefoneprincipal integer,
    _ramal integer,
    _telefoneopcional integer,
    _fax integer,
    _celular integer,
    _email character varying(25)
);


ALTER TABLE public.fornecedores OWNER TO postgres;

--
-- TOC entry 2253 (class 1259 OID 44049)
-- Dependencies: 5
-- Name: sq_genero; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_genero
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_genero OWNER TO postgres;

--
-- TOC entry 2254 (class 1259 OID 44051)
-- Dependencies: 2675 5
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genero (
    _codigo integer DEFAULT nextval('sq_genero'::regclass) NOT NULL,
    _descricao character varying(30) NOT NULL,
    _tipoproduto integer NOT NULL
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 2255 (class 1259 OID 44054)
-- Dependencies: 5
-- Name: sq_historico; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_historico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_historico OWNER TO postgres;

--
-- TOC entry 2256 (class 1259 OID 44056)
-- Dependencies: 2676 5
-- Name: historico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE historico (
    _codigo bigint DEFAULT nextval('sq_historico'::regclass) NOT NULL,
    _tipohistorico integer NOT NULL,
    _usuario bigint NOT NULL,
    _data date NOT NULL,
    _descricao character varying(200) NOT NULL
);


ALTER TABLE public.historico OWNER TO postgres;

--
-- TOC entry 2257 (class 1259 OID 44059)
-- Dependencies: 5
-- Name: sq_imagem; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_imagem
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_imagem OWNER TO postgres;

--
-- TOC entry 2258 (class 1259 OID 44061)
-- Dependencies: 2677 5
-- Name: imagem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE imagem (
    _codigo bigint DEFAULT nextval('sq_imagem'::regclass) NOT NULL,
    _url character varying NOT NULL,
    _produto bigint NOT NULL
);


ALTER TABLE public.imagem OWNER TO postgres;

--
-- TOC entry 2259 (class 1259 OID 44067)
-- Dependencies: 5
-- Name: sq_item; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_item
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_item OWNER TO postgres;

--
-- TOC entry 2260 (class 1259 OID 44069)
-- Dependencies: 2678 5
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    _codigo bigint DEFAULT nextval('sq_item'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _pedidodesktopwap integer NOT NULL,
    _quantidade integer NOT NULL,
    _valortotal double precision,
    _valorfrete double precision
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 2261 (class 1259 OID 44072)
-- Dependencies: 5
-- Name: sq_movimento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_movimento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_movimento OWNER TO postgres;

--
-- TOC entry 2262 (class 1259 OID 44074)
-- Dependencies: 2679 5
-- Name: movimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movimento (
    _codigo bigint DEFAULT nextval('sq_movimento'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _tipomovimento bigint NOT NULL,
    _quantidade integer NOT NULL
);


ALTER TABLE public.movimento OWNER TO postgres;

--
-- TOC entry 2263 (class 1259 OID 44077)
-- Dependencies: 5
-- Name: pedidodesktopwap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedidodesktopwap (
    _codigo bigint NOT NULL,
    _usuario bigint NOT NULL,
    _tipostatuspedido integer NOT NULL,
    _formapagamento integer NOT NULL,
    _datapedido date NOT NULL,
    _datapagamento date,
    _totalpedido double precision,
    _horapagamento time without time zone,
    _horapedido time without time zone,
    _parcelas integer,
    _codigoendereco bigint,
    _codigorastreamento character varying(20)
);


ALTER TABLE public.pedidodesktopwap OWNER TO postgres;

--
-- TOC entry 2264 (class 1259 OID 44079)
-- Dependencies: 5
-- Name: pedidosms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedidosms (
    _codigo bigint NOT NULL,
    _usuario bigint NOT NULL,
    _produto bigint NOT NULL,
    _statuspedido integer NOT NULL,
    _valortotal double precision NOT NULL,
    _frete double precision NOT NULL,
    _datapedido date NOT NULL,
    _valorcompra double precision NOT NULL,
    _endereco bigint NOT NULL
);


ALTER TABLE public.pedidosms OWNER TO postgres;

--
-- TOC entry 2265 (class 1259 OID 44081)
-- Dependencies: 2369 5
-- Name: pg_buffercache; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_buffercache AS
    SELECT p.bufferid, p.relfilenode, p.reltablespace, p.reldatabase, p.relblocknumber, p.isdirty FROM pg_buffercache_pages() p(bufferid integer, relfilenode oid, reltablespace oid, reldatabase oid, relblocknumber bigint, isdirty boolean);


ALTER TABLE public.pg_buffercache OWNER TO postgres;

--
-- TOC entry 2266 (class 1259 OID 44084)
-- Dependencies: 2370 5
-- Name: pg_freespacemap_pages; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_freespacemap_pages AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.relblocknumber, p.bytes FROM pg_freespacemap_pages() p(reltablespace oid, reldatabase oid, relfilenode oid, relblocknumber bigint, bytes integer);


ALTER TABLE public.pg_freespacemap_pages OWNER TO postgres;

--
-- TOC entry 2267 (class 1259 OID 44087)
-- Dependencies: 2371 5
-- Name: pg_freespacemap_relations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_freespacemap_relations AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.avgrequest, p.interestingpages, p.storedpages, p.nextpage FROM pg_freespacemap_relations() p(reltablespace oid, reldatabase oid, relfilenode oid, avgrequest integer, interestingpages integer, storedpages integer, nextpage integer);


ALTER TABLE public.pg_freespacemap_relations OWNER TO postgres;

--
-- TOC entry 2268 (class 1259 OID 44090)
-- Dependencies: 5
-- Name: sq_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_produto
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_produto OWNER TO postgres;

--
-- TOC entry 2269 (class 1259 OID 44092)
-- Dependencies: 2680 2681 5
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produtos (
    _codigo bigint DEFAULT nextval('sq_produto'::regclass) NOT NULL,
    _titulo character varying(20) NOT NULL,
    _pesokg real NOT NULL,
    _valor real NOT NULL,
    _unidade character varying(2) NOT NULL,
    _ipi integer NOT NULL,
    _icms integer NOT NULL,
    _classfiscal integer NOT NULL,
    _procedencia character varying(15),
    _paisorigem character varying(10),
    _anolancamento integer,
    _autorartista character varying(20) NOT NULL,
    _idioma character varying(10),
    _tipoproduto integer NOT NULL,
    _genero integer NOT NULL,
    _categoria integer,
    _fornecedor bigint NOT NULL,
    _resumo character varying(200) NOT NULL,
    _vendas integer NOT NULL,
    _visitas integer NOT NULL,
    _status boolean DEFAULT true
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 2270 (class 1259 OID 44096)
-- Dependencies: 5
-- Name: sq_promocao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_promocao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_promocao OWNER TO postgres;

--
-- TOC entry 2271 (class 1259 OID 44098)
-- Dependencies: 2682 5
-- Name: promocao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE promocao (
    _codigo bigint DEFAULT nextval('sq_promocao'::regclass) NOT NULL,
    _datatermino date,
    _produto bigint NOT NULL,
    _valorpromocao real
);


ALTER TABLE public.promocao OWNER TO postgres;

--
-- TOC entry 2272 (class 1259 OID 44101)
-- Dependencies: 5
-- Name: sq_fornecedores; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_fornecedores
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_fornecedores OWNER TO postgres;

--
-- TOC entry 2273 (class 1259 OID 44103)
-- Dependencies: 5
-- Name: sq_pedidodesktopwap; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_pedidodesktopwap
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_pedidodesktopwap OWNER TO postgres;

--
-- TOC entry 2274 (class 1259 OID 44105)
-- Dependencies: 5
-- Name: sq_pedidosms; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_pedidosms
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_pedidosms OWNER TO postgres;

--
-- TOC entry 2275 (class 1259 OID 44107)
-- Dependencies: 5
-- Name: sq_tipobandeiracartao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipobandeiracartao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipobandeiracartao OWNER TO postgres;

--
-- TOC entry 2276 (class 1259 OID 44109)
-- Dependencies: 5
-- Name: sq_tipoendereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoendereco
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoendereco OWNER TO postgres;

--
-- TOC entry 2277 (class 1259 OID 44111)
-- Dependencies: 5
-- Name: sq_tipoformapagamento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoformapagamento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoformapagamento OWNER TO postgres;

--
-- TOC entry 2278 (class 1259 OID 44113)
-- Dependencies: 5
-- Name: sq_tipohistorico; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipohistorico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipohistorico OWNER TO postgres;

--
-- TOC entry 2279 (class 1259 OID 44115)
-- Dependencies: 5
-- Name: sq_tipomovimento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipomovimento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipomovimento OWNER TO postgres;

--
-- TOC entry 2280 (class 1259 OID 44117)
-- Dependencies: 5
-- Name: sq_tipoproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoproduto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoproduto OWNER TO postgres;

--
-- TOC entry 2281 (class 1259 OID 44119)
-- Dependencies: 5
-- Name: sq_tipopromocao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipopromocao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipopromocao OWNER TO postgres;

--
-- TOC entry 2282 (class 1259 OID 44121)
-- Dependencies: 5
-- Name: sq_tipostatuspedido; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipostatuspedido
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipostatuspedido OWNER TO postgres;

--
-- TOC entry 2283 (class 1259 OID 44123)
-- Dependencies: 5
-- Name: sq_tipousuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipousuario
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipousuario OWNER TO postgres;

--
-- TOC entry 2284 (class 1259 OID 44125)
-- Dependencies: 5
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuario
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_usuario OWNER TO postgres;

--
-- TOC entry 2285 (class 1259 OID 44127)
-- Dependencies: 2683 5
-- Name: tipobandeiracartao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipobandeiracartao (
    _codigo integer DEFAULT nextval('sq_tipobandeiracartao'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipobandeiracartao OWNER TO postgres;

--
-- TOC entry 2286 (class 1259 OID 44130)
-- Dependencies: 2684 5
-- Name: tipoendereco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoendereco (
    _codigo integer DEFAULT nextval('sq_tipoendereco'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipoendereco OWNER TO postgres;

--
-- TOC entry 2287 (class 1259 OID 44133)
-- Dependencies: 2685 5
-- Name: tipoformapagamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoformapagamento (
    _codigo integer DEFAULT nextval('sq_tipoformapagamento'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL,
    _tef boolean,
    _taxa numeric,
    _ativo boolean
);


ALTER TABLE public.tipoformapagamento OWNER TO postgres;

--
-- TOC entry 2288 (class 1259 OID 44139)
-- Dependencies: 2686 5
-- Name: tipohistorico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipohistorico (
    _codigo integer DEFAULT nextval('sq_tipohistorico'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipohistorico OWNER TO postgres;

--
-- TOC entry 2289 (class 1259 OID 44142)
-- Dependencies: 2687 5
-- Name: tipomovimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipomovimento (
    _codigo bigint DEFAULT nextval('sq_tipomovimento'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipomovimento OWNER TO postgres;

--
-- TOC entry 2290 (class 1259 OID 44145)
-- Dependencies: 2688 5
-- Name: tipoproduto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoproduto (
    _codigo integer DEFAULT nextval('sq_tipoproduto'::regclass) NOT NULL,
    _descricao character varying(20) NOT NULL
);


ALTER TABLE public.tipoproduto OWNER TO postgres;

--
-- TOC entry 2291 (class 1259 OID 44148)
-- Dependencies: 2689 5
-- Name: tipopromocao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipopromocao (
    _codigo bigint DEFAULT nextval('sq_tipopromocao'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipopromocao OWNER TO postgres;

--
-- TOC entry 2292 (class 1259 OID 44151)
-- Dependencies: 2690 5
-- Name: tipostatuspedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipostatuspedido (
    _codigo integer DEFAULT nextval('sq_tipostatuspedido'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipostatuspedido OWNER TO postgres;

--
-- TOC entry 2293 (class 1259 OID 44154)
-- Dependencies: 2691 5
-- Name: tipousuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipousuario (
    _codigo bigint DEFAULT nextval('sq_tipousuario'::regclass) NOT NULL,
    _descricao character varying(30) NOT NULL,
    _nivelacesso numeric(2,0) NOT NULL
);


ALTER TABLE public.tipousuario OWNER TO postgres;

--
-- TOC entry 2294 (class 1259 OID 44157)
-- Dependencies: 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    _codigo bigint NOT NULL,
    _tipousuario integer NOT NULL,
    _nome character varying(50) NOT NULL,
    _cpf bigint NOT NULL,
    _rg bigint NOT NULL,
    _orgaoemissor character varying(10),
    _naturalidade character varying(20),
    _datanascimento date,
    _sexo character varying(1) NOT NULL,
    _email character varying(30) NOT NULL,
    _senha character varying(50) NOT NULL,
    _ddd integer,
    _telefoneprincipal integer,
    _ramal integer,
    _telefoneopcional integer,
    _fax integer,
    _celular integer,
    _dataultimoacesso date,
    _recebepromocoes boolean
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2693 (class 2606 OID 44160)
-- Dependencies: 2234 2234
-- Name: avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2695 (class 2606 OID 44162)
-- Dependencies: 2236 2236
-- Name: avaliaratendimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT avaliaratendimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2701 (class 2606 OID 44164)
-- Dependencies: 2240 2240
-- Name: caracttipoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT caracttipoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2705 (class 2606 OID 44166)
-- Dependencies: 2242 2242
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2709 (class 2606 OID 44168)
-- Dependencies: 2244 2244
-- Name: conteudoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2713 (class 2606 OID 44170)
-- Dependencies: 2247 2247
-- Name: dadosempresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dadosempresa
    ADD CONSTRAINT dadosempresa_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2715 (class 2606 OID 44172)
-- Dependencies: 2249 2249
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2721 (class 2606 OID 44174)
-- Dependencies: 2252 2252
-- Name: fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2723 (class 2606 OID 44176)
-- Dependencies: 2254 2254
-- Name: genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2727 (class 2606 OID 44178)
-- Dependencies: 2256 2256
-- Name: historico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2729 (class 2606 OID 44180)
-- Dependencies: 2258 2258
-- Name: imagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imagem
    ADD CONSTRAINT imagem_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2731 (class 2606 OID 44182)
-- Dependencies: 2260 2260
-- Name: item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2733 (class 2606 OID 44184)
-- Dependencies: 2262 2262
-- Name: movimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2735 (class 2606 OID 44186)
-- Dependencies: 2263 2263
-- Name: pedidodesktopwap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2737 (class 2606 OID 44188)
-- Dependencies: 2264 2264
-- Name: pedidosms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2699 (class 2606 OID 44190)
-- Dependencies: 2238 2238
-- Name: pk_boleto_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY boleto
    ADD CONSTRAINT pk_boleto_codigo PRIMARY KEY (_codigo);


--
-- TOC entry 2711 (class 2606 OID 44192)
-- Dependencies: 2246 2246
-- Name: pk_dadocartao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dadoscartao
    ADD CONSTRAINT pk_dadocartao PRIMARY KEY (_codigo);


--
-- TOC entry 2743 (class 2606 OID 44340)
-- Dependencies: 2271 2271
-- Name: pk_promocao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT pk_promocao PRIMARY KEY (_codigo);


--
-- TOC entry 2739 (class 2606 OID 44194)
-- Dependencies: 2269 2269
-- Name: produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2745 (class 2606 OID 44196)
-- Dependencies: 2285 2285
-- Name: tipobandeiracartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipobandeiracartao
    ADD CONSTRAINT tipobandeiracartao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2747 (class 2606 OID 44198)
-- Dependencies: 2286 2286
-- Name: tipoendereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoendereco
    ADD CONSTRAINT tipoendereco_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2749 (class 2606 OID 44200)
-- Dependencies: 2287 2287
-- Name: tipoformapagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoformapagamento
    ADD CONSTRAINT tipoformapagamento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2751 (class 2606 OID 44202)
-- Dependencies: 2288 2288
-- Name: tipohistorico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipohistorico
    ADD CONSTRAINT tipohistorico_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2753 (class 2606 OID 44204)
-- Dependencies: 2289 2289
-- Name: tipomovimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipomovimento
    ADD CONSTRAINT tipomovimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2755 (class 2606 OID 44206)
-- Dependencies: 2290 2290
-- Name: tipoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoproduto
    ADD CONSTRAINT tipoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2757 (class 2606 OID 44208)
-- Dependencies: 2291 2291
-- Name: tipopromocao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipopromocao
    ADD CONSTRAINT tipopromocao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2759 (class 2606 OID 44210)
-- Dependencies: 2292 2292
-- Name: tipostatuspedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipostatuspedido
    ADD CONSTRAINT tipostatuspedido_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2761 (class 2606 OID 44212)
-- Dependencies: 2293 2293
-- Name: tipousuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2697 (class 2606 OID 44214)
-- Dependencies: 2236 2236 2236
-- Name: uk_avaliacaoatendimento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT uk_avaliacaoatendimento UNIQUE (_usuario, _dataavaliacao);


--
-- TOC entry 2703 (class 2606 OID 44216)
-- Dependencies: 2240 2240 2240
-- Name: uk_caracttipoproduto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT uk_caracttipoproduto UNIQUE (_descricao, _tipoproduto);


--
-- TOC entry 2707 (class 2606 OID 44218)
-- Dependencies: 2242 2242 2242
-- Name: uk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT uk_categoria UNIQUE (_descricao, _genero);


--
-- TOC entry 2717 (class 2606 OID 44220)
-- Dependencies: 2249 2249 2249
-- Name: uk_enderecofornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT uk_enderecofornecedor UNIQUE (_tipoendereco, _fornecedor);


--
-- TOC entry 2719 (class 2606 OID 44222)
-- Dependencies: 2249 2249 2249
-- Name: uk_enderecousuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT uk_enderecousuario UNIQUE (_tipoendereco, _usuario);


--
-- TOC entry 2725 (class 2606 OID 44224)
-- Dependencies: 2254 2254 2254
-- Name: uk_genero; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT uk_genero UNIQUE (_descricao, _tipoproduto);


--
-- TOC entry 2741 (class 2606 OID 44226)
-- Dependencies: 2269 2269 2269 2269 2269
-- Name: uk_produto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT uk_produto UNIQUE (_titulo, _autorartista, _anolancamento, _tipoproduto);


--
-- TOC entry 2763 (class 2606 OID 44228)
-- Dependencies: 2294 2294
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2764 (class 2606 OID 44229)
-- Dependencies: 2236 2762 2294
-- Name: avaliaratendimento__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT avaliaratendimento__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo);


--
-- TOC entry 2765 (class 2606 OID 44234)
-- Dependencies: 2240 2754 2290
-- Name: caracttipoproduto__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT caracttipoproduto__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2766 (class 2606 OID 44239)
-- Dependencies: 2722 2242 2254
-- Name: categoria__genero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria__genero_fkey FOREIGN KEY (_genero) REFERENCES genero(_codigo);


--
-- TOC entry 2767 (class 2606 OID 44244)
-- Dependencies: 2244 2240 2700
-- Name: conteudoproduto__caracttipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto__caracttipoproduto_fkey FOREIGN KEY (_caracttipoproduto) REFERENCES caracttipoproduto(_codigo);


--
-- TOC entry 2768 (class 2606 OID 44249)
-- Dependencies: 2244 2269 2738
-- Name: conteudoproduto__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2769 (class 2606 OID 44254)
-- Dependencies: 2249 2720 2252
-- Name: endereco__fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__fornecedor_fkey FOREIGN KEY (_fornecedor) REFERENCES fornecedores(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2770 (class 2606 OID 44259)
-- Dependencies: 2746 2286 2249
-- Name: endereco__tipoendereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__tipoendereco_fkey FOREIGN KEY (_tipoendereco) REFERENCES tipoendereco(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2771 (class 2606 OID 44264)
-- Dependencies: 2249 2294 2762
-- Name: endereco__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2772 (class 2606 OID 44269)
-- Dependencies: 2254 2290 2754
-- Name: genero__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT genero__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2773 (class 2606 OID 44274)
-- Dependencies: 2750 2288 2256
-- Name: historico__tipohistorico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT historico__tipohistorico_fkey FOREIGN KEY (_tipohistorico) REFERENCES tipohistorico(_codigo);


--
-- TOC entry 2774 (class 2606 OID 44279)
-- Dependencies: 2258 2269 2738
-- Name: imagem__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagem
    ADD CONSTRAINT imagem__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2775 (class 2606 OID 44284)
-- Dependencies: 2260 2263 2734
-- Name: item__pedidodesktopwap_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item__pedidodesktopwap_fkey FOREIGN KEY (_pedidodesktopwap) REFERENCES pedidodesktopwap(_codigo);


--
-- TOC entry 2776 (class 2606 OID 44289)
-- Dependencies: 2289 2262 2752
-- Name: movimento__tipomovimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento__tipomovimento_fkey FOREIGN KEY (_tipomovimento) REFERENCES tipomovimento(_codigo);


--
-- TOC entry 2777 (class 2606 OID 44294)
-- Dependencies: 2287 2263 2748
-- Name: pedidodesktopwap__formapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap__formapagamento_fkey FOREIGN KEY (_formapagamento) REFERENCES tipoformapagamento(_codigo);


--
-- TOC entry 2778 (class 2606 OID 44299)
-- Dependencies: 2292 2263 2758
-- Name: pedidodesktopwap__tipostatuspedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap__tipostatuspedido_fkey FOREIGN KEY (_tipostatuspedido) REFERENCES tipostatuspedido(_codigo);


--
-- TOC entry 2779 (class 2606 OID 44304)
-- Dependencies: 2738 2269 2264
-- Name: pedidosms__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2780 (class 2606 OID 44309)
-- Dependencies: 2292 2758 2264
-- Name: pedidosms__statuspedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__statuspedido_fkey FOREIGN KEY (_statuspedido) REFERENCES tipostatuspedido(_codigo);


--
-- TOC entry 2781 (class 2606 OID 44314)
-- Dependencies: 2762 2294 2264
-- Name: pedidosms__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo);


--
-- TOC entry 2782 (class 2606 OID 44319)
-- Dependencies: 2269 2704 2242
-- Name: produtos__categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__categoria_fkey FOREIGN KEY (_categoria) REFERENCES categoria(_codigo);


--
-- TOC entry 2783 (class 2606 OID 44324)
-- Dependencies: 2254 2269 2722
-- Name: produtos__genero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__genero_fkey FOREIGN KEY (_genero) REFERENCES genero(_codigo);


--
-- TOC entry 2784 (class 2606 OID 44329)
-- Dependencies: 2290 2269 2754
-- Name: produtos__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2785 (class 2606 OID 44334)
-- Dependencies: 2293 2760 2294
-- Name: usuario__tipousuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario__tipousuario_fkey FOREIGN KEY (_tipousuario) REFERENCES tipousuario(_codigo);


--
-- TOC entry 2790 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2818 (class 0 OID 0)
-- Dependencies: 604
-- Name: pg_buffercache_pages(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM postgres;
GRANT ALL ON FUNCTION pg_buffercache_pages() TO postgres;


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 605
-- Name: pg_freespacemap_pages(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM postgres;
GRANT ALL ON FUNCTION pg_freespacemap_pages() TO postgres;


--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 606
-- Name: pg_freespacemap_relations(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM postgres;
GRANT ALL ON FUNCTION pg_freespacemap_relations() TO postgres;


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 2265
-- Name: pg_buffercache; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_buffercache FROM PUBLIC;
REVOKE ALL ON TABLE pg_buffercache FROM postgres;
GRANT ALL ON TABLE pg_buffercache TO postgres;


--
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 2266
-- Name: pg_freespacemap_pages; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_freespacemap_pages FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_pages FROM postgres;
GRANT ALL ON TABLE pg_freespacemap_pages TO postgres;


--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 2267
-- Name: pg_freespacemap_relations; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_freespacemap_relations FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_relations FROM postgres;
GRANT ALL ON TABLE pg_freespacemap_relations TO postgres;


-- Completed on 2008-11-01 21:19:45

--
-- PostgreSQL database dump complete
--

