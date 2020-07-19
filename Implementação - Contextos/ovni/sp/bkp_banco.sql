--
-- PostgreSQL database dump
--

-- Started on 2008-10-19 20:57:17

SET client_encoding = 'LATIN9';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 1101 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

--CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 957 (class 0 OID 0)
-- Name: cube; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE cube;


--
-- TOC entry 18 (class 1255 OID 27834)
-- Dependencies: 5 957
-- Name: cube_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_in(cstring) RETURNS cube
    AS '$libdir/cube', 'cube_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_in(cstring) OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 27835)
-- Dependencies: 5 957
-- Name: cube_out(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_out(cube) RETURNS cstring
    AS '$libdir/cube', 'cube_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_out(cube) OWNER TO postgres;

--
-- TOC entry 956 (class 1247 OID 27833)
-- Dependencies: 18 5 19
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
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 956
-- Name: TYPE cube; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE cube IS 'multi-dimensional cube ''(FLOAT-1, FLOAT-2, ..., FLOAT-N), (FLOAT-1, FLOAT-2, ..., FLOAT-N)''';


--
-- TOC entry 969 (class 0 OID 0)
-- Name: ean13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ean13;


--
-- TOC entry 20 (class 1255 OID 27838)
-- Dependencies: 5 969
-- Name: ean13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_in(cstring) RETURNS ean13
    AS '$libdir/isn', 'ean13_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_in(cstring) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 27839)
-- Dependencies: 5 969
-- Name: ean13_out(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(ean13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(ean13) OWNER TO postgres;

--
-- TOC entry 968 (class 1247 OID 27837)
-- Dependencies: 20 21 5
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
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 968
-- Name: TYPE ean13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ean13 IS 'International European Article Number (EAN13)';


--
-- TOC entry 972 (class 0 OID 0)
-- Name: gtsq; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsq;


--
-- TOC entry 22 (class 1255 OID 27842)
-- Dependencies: 5 972
-- Name: gtsq_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_in(cstring) RETURNS gtsq
    AS '$libdir/tsearch2', 'gtsq_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_in(cstring) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 27843)
-- Dependencies: 5 972
-- Name: gtsq_out(gtsq); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_out(gtsq) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsq_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_out(gtsq) OWNER TO postgres;

--
-- TOC entry 971 (class 1247 OID 27841)
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
-- TOC entry 975 (class 0 OID 0)
-- Name: gtsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE gtsvector;


--
-- TOC entry 24 (class 1255 OID 27846)
-- Dependencies: 5 975
-- Name: gtsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_in(cstring) RETURNS gtsvector
    AS '$libdir/tsearch2', 'gtsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 27847)
-- Dependencies: 5 975
-- Name: gtsvector_out(gtsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_out(gtsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_out(gtsvector) OWNER TO postgres;

--
-- TOC entry 974 (class 1247 OID 27845)
-- Dependencies: 5 25 24
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
-- TOC entry 978 (class 0 OID 0)
-- Name: intbig_gkey; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE intbig_gkey;


--
-- TOC entry 26 (class 1255 OID 27850)
-- Dependencies: 5 978
-- Name: _intbig_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _intbig_in(cstring) RETURNS intbig_gkey
    AS '$libdir/_int', '_intbig_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_in(cstring) OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 27851)
-- Dependencies: 5 978
-- Name: _intbig_out(intbig_gkey); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _intbig_out(intbig_gkey) RETURNS cstring
    AS '$libdir/_int', '_intbig_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._intbig_out(intbig_gkey) OWNER TO postgres;

--
-- TOC entry 977 (class 1247 OID 27849)
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
-- TOC entry 981 (class 0 OID 0)
-- Name: isbn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn;


--
-- TOC entry 28 (class 1255 OID 27854)
-- Dependencies: 5 981
-- Name: isbn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn_in(cstring) RETURNS isbn
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn_in(cstring) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 27855)
-- Dependencies: 5 981
-- Name: isn_out(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(isbn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(isbn) OWNER TO postgres;

--
-- TOC entry 980 (class 1247 OID 27853)
-- Dependencies: 5 28 29
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
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 980
-- Name: TYPE isbn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE isbn IS 'International Standard Book Number (ISBN)';


--
-- TOC entry 984 (class 0 OID 0)
-- Name: isbn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE isbn13;


--
-- TOC entry 30 (class 1255 OID 27858)
-- Dependencies: 5 984
-- Name: ean13_out(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(isbn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(isbn13) OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 27859)
-- Dependencies: 5 984
-- Name: isbn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13_in(cstring) RETURNS isbn13
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 983 (class 1247 OID 27857)
-- Dependencies: 32 5 30
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
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 983
-- Name: TYPE isbn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE isbn13 IS 'International Standard Book Number 13 (ISBN13)';


--
-- TOC entry 987 (class 0 OID 0)
-- Name: ismn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn;


--
-- TOC entry 33 (class 1255 OID 27862)
-- Dependencies: 5 987
-- Name: ismn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn_in(cstring) RETURNS ismn
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn_in(cstring) OWNER TO postgres;

--
-- TOC entry 34 (class 1255 OID 27863)
-- Dependencies: 5 987
-- Name: isn_out(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(ismn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(ismn) OWNER TO postgres;

--
-- TOC entry 986 (class 1247 OID 27861)
-- Dependencies: 34 5 33
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
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 986
-- Name: TYPE ismn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ismn IS 'International Standard Music Number (ISMN)';


--
-- TOC entry 990 (class 0 OID 0)
-- Name: ismn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ismn13;


--
-- TOC entry 35 (class 1255 OID 27866)
-- Dependencies: 5 990
-- Name: ean13_out(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(ismn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(ismn13) OWNER TO postgres;

--
-- TOC entry 36 (class 1255 OID 27867)
-- Dependencies: 5 990
-- Name: ismn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13_in(cstring) RETURNS ismn13
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 989 (class 1247 OID 27865)
-- Dependencies: 5 36 35
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
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 989
-- Name: TYPE ismn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE ismn13 IS 'International Standard Music Number 13 (ISMN13)';


--
-- TOC entry 993 (class 0 OID 0)
-- Name: issn; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn;


--
-- TOC entry 37 (class 1255 OID 27870)
-- Dependencies: 5 993
-- Name: isn_out(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(issn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(issn) OWNER TO postgres;

--
-- TOC entry 38 (class 1255 OID 27871)
-- Dependencies: 5 993
-- Name: issn_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn_in(cstring) RETURNS issn
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn_in(cstring) OWNER TO postgres;

--
-- TOC entry 992 (class 1247 OID 27869)
-- Dependencies: 37 38 5
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
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 992
-- Name: TYPE issn; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE issn IS 'International Standard Serial Number (ISSN)';


--
-- TOC entry 996 (class 0 OID 0)
-- Name: issn13; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE issn13;


--
-- TOC entry 39 (class 1255 OID 27874)
-- Dependencies: 5 996
-- Name: ean13_out(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13_out(issn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13_out(issn13) OWNER TO postgres;

--
-- TOC entry 40 (class 1255 OID 27875)
-- Dependencies: 5 996
-- Name: issn13_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13_in(cstring) RETURNS issn13
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13_in(cstring) OWNER TO postgres;

--
-- TOC entry 995 (class 1247 OID 27873)
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
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 995
-- Name: TYPE issn13; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE issn13 IS 'International Standard Serial Number 13 (ISSN13)';


--
-- TOC entry 999 (class 0 OID 0)
-- Name: lquery; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE lquery;


--
-- TOC entry 41 (class 1255 OID 27878)
-- Dependencies: 5 999
-- Name: lquery_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lquery_in(cstring) RETURNS lquery
    AS '$libdir/ltree', 'lquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lquery_in(cstring) OWNER TO postgres;

--
-- TOC entry 42 (class 1255 OID 27879)
-- Dependencies: 5 999
-- Name: lquery_out(lquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lquery_out(lquery) RETURNS cstring
    AS '$libdir/ltree', 'lquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lquery_out(lquery) OWNER TO postgres;

--
-- TOC entry 998 (class 1247 OID 27877)
-- Dependencies: 41 42 5
-- Name: lquery; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE lquery (
    INTERNALLENGTH = variable,
    INPUT = lquery_in,
    OUTPUT = lquery_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.lquery OWNER TO postgres;

--
-- TOC entry 1002 (class 0 OID 0)
-- Name: ltree; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltree;


--
-- TOC entry 43 (class 1255 OID 27882)
-- Dependencies: 5 1002
-- Name: ltree_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_in(cstring) RETURNS ltree
    AS '$libdir/ltree', 'ltree_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_in(cstring) OWNER TO postgres;

--
-- TOC entry 44 (class 1255 OID 27883)
-- Dependencies: 5 1002
-- Name: ltree_out(ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_out(ltree) RETURNS cstring
    AS '$libdir/ltree', 'ltree_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_out(ltree) OWNER TO postgres;

--
-- TOC entry 1001 (class 1247 OID 27881)
-- Dependencies: 44 5 43
-- Name: ltree; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltree (
    INTERNALLENGTH = variable,
    INPUT = ltree_in,
    OUTPUT = ltree_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltree OWNER TO postgres;

--
-- TOC entry 1005 (class 0 OID 0)
-- Name: ltree_gist; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltree_gist;


--
-- TOC entry 45 (class 1255 OID 27886)
-- Dependencies: 5 1005
-- Name: ltree_gist_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_gist_in(cstring) RETURNS ltree_gist
    AS '$libdir/ltree', 'ltree_gist_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_gist_in(cstring) OWNER TO postgres;

--
-- TOC entry 46 (class 1255 OID 27887)
-- Dependencies: 5 1005
-- Name: ltree_gist_out(ltree_gist); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_gist_out(ltree_gist) RETURNS cstring
    AS '$libdir/ltree', 'ltree_gist_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_gist_out(ltree_gist) OWNER TO postgres;

--
-- TOC entry 1004 (class 1247 OID 27885)
-- Dependencies: 46 5 45
-- Name: ltree_gist; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltree_gist (
    INTERNALLENGTH = variable,
    INPUT = ltree_gist_in,
    OUTPUT = ltree_gist_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.ltree_gist OWNER TO postgres;

--
-- TOC entry 1008 (class 0 OID 0)
-- Name: ltxtquery; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltxtquery;


--
-- TOC entry 47 (class 1255 OID 27890)
-- Dependencies: 5 1008
-- Name: ltxtq_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltxtq_in(cstring) RETURNS ltxtquery
    AS '$libdir/ltree', 'ltxtq_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltxtq_in(cstring) OWNER TO postgres;

--
-- TOC entry 48 (class 1255 OID 27891)
-- Dependencies: 5 1008
-- Name: ltxtq_out(ltxtquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltxtq_out(ltxtquery) RETURNS cstring
    AS '$libdir/ltree', 'ltxtq_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltxtq_out(ltxtquery) OWNER TO postgres;

--
-- TOC entry 1007 (class 1247 OID 27889)
-- Dependencies: 5 48 47
-- Name: ltxtquery; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ltxtquery (
    INTERNALLENGTH = variable,
    INPUT = ltxtq_in,
    OUTPUT = ltxtq_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.ltxtquery OWNER TO postgres;

--
-- TOC entry 1011 (class 0 OID 0)
-- Name: query_int; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE query_int;


--
-- TOC entry 49 (class 1255 OID 27894)
-- Dependencies: 5 1011
-- Name: bqarr_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bqarr_in(cstring) RETURNS query_int
    AS '$libdir/_int', 'bqarr_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_in(cstring) OWNER TO postgres;

--
-- TOC entry 50 (class 1255 OID 27895)
-- Dependencies: 5 1011
-- Name: bqarr_out(query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bqarr_out(query_int) RETURNS cstring
    AS '$libdir/_int', 'bqarr_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bqarr_out(query_int) OWNER TO postgres;

--
-- TOC entry 1010 (class 1247 OID 27893)
-- Dependencies: 50 49 5
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
-- TOC entry 1014 (class 0 OID 0)
-- Name: seg; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE seg;


--
-- TOC entry 51 (class 1255 OID 27898)
-- Dependencies: 5 1014
-- Name: seg_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_in(cstring) RETURNS seg
    AS '$libdir/seg', 'seg_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_in(cstring) OWNER TO postgres;

--
-- TOC entry 52 (class 1255 OID 27899)
-- Dependencies: 5 1014
-- Name: seg_out(seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_out(seg) RETURNS cstring
    AS '$libdir/seg', 'seg_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_out(seg) OWNER TO postgres;

--
-- TOC entry 1013 (class 1247 OID 27897)
-- Dependencies: 52 51 5
-- Name: seg; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE seg (
    INTERNALLENGTH = 12,
    INPUT = seg_in,
    OUTPUT = seg_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.seg OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 1013
-- Name: TYPE seg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE seg IS 'floating point interval ''FLOAT .. FLOAT'', ''.. FLOAT'', ''FLOAT ..'' or ''FLOAT''';


--
-- TOC entry 1017 (class 0 OID 0)
-- Name: tsquery; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsquery;


--
-- TOC entry 53 (class 1255 OID 27902)
-- Dependencies: 5 1017
-- Name: tsquery_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_in(cstring) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_in(cstring) OWNER TO postgres;

--
-- TOC entry 54 (class 1255 OID 27903)
-- Dependencies: 5 1017
-- Name: tsquery_out(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_out(tsquery) RETURNS cstring
    AS '$libdir/tsearch2', 'tsquery_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsquery_out(tsquery) OWNER TO postgres;

--
-- TOC entry 1016 (class 1247 OID 27901)
-- Dependencies: 5 54 53
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
-- TOC entry 1020 (class 0 OID 0)
-- Name: tsvector; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tsvector;


--
-- TOC entry 55 (class 1255 OID 27906)
-- Dependencies: 5 1020
-- Name: tsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_in(cstring) RETURNS tsvector
    AS '$libdir/tsearch2', 'tsvector_in'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_in(cstring) OWNER TO postgres;

--
-- TOC entry 56 (class 1255 OID 27907)
-- Dependencies: 5 1020
-- Name: tsvector_out(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_out(tsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'tsvector_out'
    LANGUAGE c STRICT;


ALTER FUNCTION public.tsvector_out(tsvector) OWNER TO postgres;

--
-- TOC entry 1019 (class 1247 OID 27905)
-- Dependencies: 55 56 5
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
-- TOC entry 1023 (class 0 OID 0)
-- Name: upc; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE upc;


--
-- TOC entry 57 (class 1255 OID 27910)
-- Dependencies: 5 1023
-- Name: isn_out(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_out(upc) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_out(upc) OWNER TO postgres;

--
-- TOC entry 58 (class 1255 OID 27911)
-- Dependencies: 5 1023
-- Name: upc_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc_in(cstring) RETURNS upc
    AS '$libdir/isn', 'upc_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc_in(cstring) OWNER TO postgres;

--
-- TOC entry 1022 (class 1247 OID 27909)
-- Dependencies: 58 5 57
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
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 1022
-- Name: TYPE upc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE upc IS 'Universal Product Code (UPC)';


--
-- TOC entry 1025 (class 1247 OID 27914)
-- Dependencies: 2422
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dblink_pkey_results AS (
	"position" integer,
	colname text
);


ALTER TYPE public.dblink_pkey_results OWNER TO postgres;

--
-- TOC entry 59 (class 1255 OID 27915)
-- Dependencies: 5 956
-- Name: cube_dim(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_dim(cube) RETURNS integer
    AS '$libdir/cube', 'cube_dim'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_dim(cube) OWNER TO postgres;

--
-- TOC entry 60 (class 1255 OID 27916)
-- Dependencies: 956 5 956
-- Name: cube_distance(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_distance(cube, cube) RETURNS double precision
    AS '$libdir/cube', 'cube_distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_distance(cube, cube) OWNER TO postgres;

--
-- TOC entry 61 (class 1255 OID 27917)
-- Dependencies: 5 956
-- Name: cube_is_point(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_is_point(cube) RETURNS boolean
    AS '$libdir/cube', 'cube_is_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_is_point(cube) OWNER TO postgres;

--
-- TOC entry 62 (class 1255 OID 27918)
-- Dependencies: 5
-- Name: earth(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth() RETURNS double precision
    AS $$SELECT '6378168'::float8$$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.earth() OWNER TO postgres;

--
-- TOC entry 1026 (class 1247 OID 27919)
-- Dependencies: 1027 1028 1029 19 956 5
-- Name: earth; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN earth AS cube
	CONSTRAINT not_3d CHECK ((cube_dim(VALUE) <= 3))
	CONSTRAINT not_point CHECK (cube_is_point(VALUE))
	CONSTRAINT on_surface CHECK ((abs(((cube_distance(VALUE, '(0)'::cube) / earth()) - (1)::double precision)) < (0.00000099999999999999995)::double precision));


ALTER DOMAIN public.earth OWNER TO postgres;

--
-- TOC entry 1030 (class 1247 OID 27924)
-- Dependencies: 2423
-- Name: statinfo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


ALTER TYPE public.statinfo OWNER TO postgres;

--
-- TOC entry 1031 (class 1247 OID 27926)
-- Dependencies: 2424
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


ALTER TYPE public.tablefunc_crosstab_2 OWNER TO postgres;

--
-- TOC entry 1032 (class 1247 OID 27928)
-- Dependencies: 2425
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
-- TOC entry 1033 (class 1247 OID 27930)
-- Dependencies: 2426
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
-- TOC entry 1034 (class 1247 OID 27932)
-- Dependencies: 2427
-- Name: tokenout; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


ALTER TYPE public.tokenout OWNER TO postgres;

--
-- TOC entry 1035 (class 1247 OID 27934)
-- Dependencies: 2428
-- Name: tokentype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


ALTER TYPE public.tokentype OWNER TO postgres;

--
-- TOC entry 1036 (class 1247 OID 27936)
-- Dependencies: 2429
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
-- TOC entry 63 (class 1255 OID 27937)
-- Dependencies: 5
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public._get_parser_from_curcfg() OWNER TO postgres;

--
-- TOC entry 64 (class 1255 OID 27938)
-- Dependencies: 5
-- Name: _int_contained(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_contained(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contained(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 64
-- Name: FUNCTION _int_contained(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_contained(integer[], integer[]) IS 'contained in';


--
-- TOC entry 65 (class 1255 OID 27939)
-- Dependencies: 5
-- Name: _int_contains(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_contains(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_contains(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 65
-- Name: FUNCTION _int_contains(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_contains(integer[], integer[]) IS 'contains';


--
-- TOC entry 66 (class 1255 OID 27940)
-- Dependencies: 5
-- Name: _int_different(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_different(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_different'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_different(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 66
-- Name: FUNCTION _int_different(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_different(integer[], integer[]) IS 'different';


--
-- TOC entry 67 (class 1255 OID 27941)
-- Dependencies: 5
-- Name: _int_inter(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_inter(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_inter(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 68 (class 1255 OID 27942)
-- Dependencies: 5
-- Name: _int_overlap(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_overlap(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_overlap(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 68
-- Name: FUNCTION _int_overlap(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_overlap(integer[], integer[]) IS 'overlaps';


--
-- TOC entry 69 (class 1255 OID 27943)
-- Dependencies: 5
-- Name: _int_same(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_same(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_same(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 69
-- Name: FUNCTION _int_same(integer[], integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION _int_same(integer[], integer[]) IS 'same as';


--
-- TOC entry 70 (class 1255 OID 27944)
-- Dependencies: 5
-- Name: _int_union(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _int_union(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._int_union(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 71 (class 1255 OID 27945)
-- Dependencies: 5 1000 1003
-- Name: _lt_q_regex(ltree[], lquery[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _lt_q_regex(ltree[], lquery[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._lt_q_regex(ltree[], lquery[]) OWNER TO postgres;

--
-- TOC entry 72 (class 1255 OID 27946)
-- Dependencies: 1003 5 1000
-- Name: _lt_q_rregex(lquery[], ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _lt_q_rregex(lquery[], ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._lt_q_rregex(lquery[], ltree[]) OWNER TO postgres;

--
-- TOC entry 73 (class 1255 OID 27947)
-- Dependencies: 1001 1003 998 5
-- Name: _ltq_extract_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltq_extract_regex(ltree[], lquery) RETURNS ltree
    AS '$libdir/ltree', '_ltq_extract_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_extract_regex(ltree[], lquery) OWNER TO postgres;

--
-- TOC entry 74 (class 1255 OID 27948)
-- Dependencies: 998 1003 5
-- Name: _ltq_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltq_regex(ltree[], lquery) RETURNS boolean
    AS '$libdir/ltree', '_ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_regex(ltree[], lquery) OWNER TO postgres;

--
-- TOC entry 75 (class 1255 OID 27949)
-- Dependencies: 1003 5 998
-- Name: _ltq_rregex(lquery, ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltq_rregex(lquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltq_rregex(lquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 76 (class 1255 OID 27950)
-- Dependencies: 5
-- Name: _ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_compress'
    LANGUAGE c;


ALTER FUNCTION public._ltree_compress(internal) OWNER TO postgres;

--
-- TOC entry 77 (class 1255 OID 27951)
-- Dependencies: 5
-- Name: _ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', '_ltree_consistent'
    LANGUAGE c;


ALTER FUNCTION public._ltree_consistent(internal, internal, smallint) OWNER TO postgres;

--
-- TOC entry 78 (class 1255 OID 27952)
-- Dependencies: 5 1001 1003 1001
-- Name: _ltree_extract_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_extract_isparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_extract_isparent(ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 79 (class 1255 OID 27953)
-- Dependencies: 1001 5 1001 1003
-- Name: _ltree_extract_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_extract_risparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_extract_risparent(ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 80 (class 1255 OID 27954)
-- Dependencies: 1001 1003 5
-- Name: _ltree_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_isparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_isparent(ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 81 (class 1255 OID 27955)
-- Dependencies: 5
-- Name: _ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public._ltree_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 82 (class 1255 OID 27956)
-- Dependencies: 5
-- Name: _ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_picksplit'
    LANGUAGE c;


ALTER FUNCTION public._ltree_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 83 (class 1255 OID 27957)
-- Dependencies: 1003 1001 5
-- Name: _ltree_r_isparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_r_isparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_r_isparent(ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 84 (class 1255 OID 27958)
-- Dependencies: 1003 5 1001
-- Name: _ltree_r_risparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_r_risparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_r_risparent(ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 85 (class 1255 OID 27959)
-- Dependencies: 1003 1001 5
-- Name: _ltree_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_risparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltree_risparent(ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 86 (class 1255 OID 27960)
-- Dependencies: 5
-- Name: _ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_same'
    LANGUAGE c;


ALTER FUNCTION public._ltree_same(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 87 (class 1255 OID 27961)
-- Dependencies: 5
-- Name: _ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', '_ltree_union'
    LANGUAGE c;


ALTER FUNCTION public._ltree_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 88 (class 1255 OID 27962)
-- Dependencies: 5 1003 1007
-- Name: _ltxtq_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltxtq_exec(ltree[], ltxtquery) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_exec(ltree[], ltxtquery) OWNER TO postgres;

--
-- TOC entry 89 (class 1255 OID 27963)
-- Dependencies: 1001 1003 5 1007
-- Name: _ltxtq_extract_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltxtq_extract_exec(ltree[], ltxtquery) RETURNS ltree
    AS '$libdir/ltree', '_ltxtq_extract_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_extract_exec(ltree[], ltxtquery) OWNER TO postgres;

--
-- TOC entry 90 (class 1255 OID 27964)
-- Dependencies: 1003 5 1007
-- Name: _ltxtq_rexec(ltxtquery, ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _ltxtq_rexec(ltxtquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._ltxtq_rexec(ltxtquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 91 (class 1255 OID 27965)
-- Dependencies: 5
-- Name: armor(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION armor(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pg_armor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.armor(bytea) OWNER TO postgres;

--
-- TOC entry 92 (class 1255 OID 27966)
-- Dependencies: 1010 5
-- Name: boolop(integer[], query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION boolop(integer[], query_int) RETURNS boolean
    AS '$libdir/_int', 'boolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.boolop(integer[], query_int) OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 92
-- Name: FUNCTION boolop(integer[], query_int); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION boolop(integer[], query_int) IS 'boolean operation with array';


--
-- TOC entry 93 (class 1255 OID 27967)
-- Dependencies: 968 968 5
-- Name: btean13cmp(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 94 (class 1255 OID 27968)
-- Dependencies: 5 983 968
-- Name: btean13cmp(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 95 (class 1255 OID 27969)
-- Dependencies: 968 5 989
-- Name: btean13cmp(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 96 (class 1255 OID 27970)
-- Dependencies: 995 968 5
-- Name: btean13cmp(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 97 (class 1255 OID 27971)
-- Dependencies: 5 980 968
-- Name: btean13cmp(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 98 (class 1255 OID 27972)
-- Dependencies: 986 968 5
-- Name: btean13cmp(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 99 (class 1255 OID 27973)
-- Dependencies: 968 5 992
-- Name: btean13cmp(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, issn) OWNER TO postgres;

--
-- TOC entry 100 (class 1255 OID 27974)
-- Dependencies: 1022 968 5
-- Name: btean13cmp(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btean13cmp(ean13, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btean13cmp(ean13, upc) OWNER TO postgres;

--
-- TOC entry 101 (class 1255 OID 27975)
-- Dependencies: 983 5 983
-- Name: btisbn13cmp(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 102 (class 1255 OID 27976)
-- Dependencies: 968 983 5
-- Name: btisbn13cmp(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 103 (class 1255 OID 27977)
-- Dependencies: 980 5 983
-- Name: btisbn13cmp(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbn13cmp(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 104 (class 1255 OID 27978)
-- Dependencies: 980 980 5
-- Name: btisbncmp(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 105 (class 1255 OID 27979)
-- Dependencies: 5 968 980
-- Name: btisbncmp(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 106 (class 1255 OID 27980)
-- Dependencies: 980 983 5
-- Name: btisbncmp(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btisbncmp(isbn, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btisbncmp(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 107 (class 1255 OID 27981)
-- Dependencies: 5 989 989
-- Name: btismn13cmp(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 108 (class 1255 OID 27982)
-- Dependencies: 968 989 5
-- Name: btismn13cmp(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 109 (class 1255 OID 27983)
-- Dependencies: 5 986 989
-- Name: btismn13cmp(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismn13cmp(ismn13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismn13cmp(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 110 (class 1255 OID 27984)
-- Dependencies: 5 986 986
-- Name: btismncmp(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 111 (class 1255 OID 27985)
-- Dependencies: 986 968 5
-- Name: btismncmp(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 112 (class 1255 OID 27986)
-- Dependencies: 989 5 986
-- Name: btismncmp(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btismncmp(ismn, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btismncmp(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 113 (class 1255 OID 27987)
-- Dependencies: 995 5 995
-- Name: btissn13cmp(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 114 (class 1255 OID 27988)
-- Dependencies: 968 995 5
-- Name: btissn13cmp(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 115 (class 1255 OID 27989)
-- Dependencies: 992 995 5
-- Name: btissn13cmp(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissn13cmp(issn13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissn13cmp(issn13, issn) OWNER TO postgres;

--
-- TOC entry 116 (class 1255 OID 27990)
-- Dependencies: 992 992 5
-- Name: btissncmp(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, issn) OWNER TO postgres;

--
-- TOC entry 117 (class 1255 OID 27991)
-- Dependencies: 5 992 968
-- Name: btissncmp(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, ean13) OWNER TO postgres;

--
-- TOC entry 118 (class 1255 OID 27992)
-- Dependencies: 5 992 995
-- Name: btissncmp(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btissncmp(issn, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btissncmp(issn, issn13) OWNER TO postgres;

--
-- TOC entry 119 (class 1255 OID 27993)
-- Dependencies: 5 1022 1022
-- Name: btupccmp(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btupccmp(upc, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btupccmp(upc, upc) OWNER TO postgres;

--
-- TOC entry 120 (class 1255 OID 27994)
-- Dependencies: 5 1022 968
-- Name: btupccmp(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION btupccmp(upc, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.btupccmp(upc, ean13) OWNER TO postgres;

--
-- TOC entry 121 (class 1255 OID 27995)
-- Dependencies: 5 1019 1019 1019
-- Name: concat(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION concat(tsvector, tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'concat'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.concat(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 122 (class 1255 OID 27996)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer, text) OWNER TO postgres;

--
-- TOC entry 123 (class 1255 OID 27997)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, integer) OWNER TO postgres;

--
-- TOC entry 124 (class 1255 OID 27998)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer, text) OWNER TO postgres;

--
-- TOC entry 125 (class 1255 OID 27999)
-- Dependencies: 5
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.connectby(text, text, text, text, text, integer) OWNER TO postgres;

--
-- TOC entry 126 (class 1255 OID 28000)
-- Dependencies: 5
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text) OWNER TO postgres;

--
-- TOC entry 127 (class 1255 OID 28001)
-- Dependencies: 5
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, integer) OWNER TO postgres;

--
-- TOC entry 128 (class 1255 OID 28002)
-- Dependencies: 5
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab(text, text) OWNER TO postgres;

--
-- TOC entry 129 (class 1255 OID 28003)
-- Dependencies: 1031 5
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab2(text) OWNER TO postgres;

--
-- TOC entry 130 (class 1255 OID 28004)
-- Dependencies: 1032 5
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab3(text) OWNER TO postgres;

--
-- TOC entry 131 (class 1255 OID 28005)
-- Dependencies: 1033 5
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.crosstab4(text) OWNER TO postgres;

--
-- TOC entry 132 (class 1255 OID 28006)
-- Dependencies: 5
-- Name: crypt(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crypt(text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_crypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.crypt(text, text) OWNER TO postgres;

--
-- TOC entry 133 (class 1255 OID 28007)
-- Dependencies: 5 956
-- Name: cube(double precision[], double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision[], double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision[], double precision[]) OWNER TO postgres;

--
-- TOC entry 134 (class 1255 OID 28008)
-- Dependencies: 956 5
-- Name: cube(double precision[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision[]) OWNER TO postgres;

--
-- TOC entry 135 (class 1255 OID 28009)
-- Dependencies: 5 956
-- Name: cube(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(text) RETURNS cube
    AS '$libdir/cube', 'cube'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(text) OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 135
-- Name: FUNCTION cube(text); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube(text) IS 'convert text to cube';


--
-- TOC entry 136 (class 1255 OID 28010)
-- Dependencies: 956 5
-- Name: cube(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision) OWNER TO postgres;

--
-- TOC entry 137 (class 1255 OID 28011)
-- Dependencies: 956 5
-- Name: cube(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 138 (class 1255 OID 28012)
-- Dependencies: 956 956 5
-- Name: cube(cube, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(cube, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(cube, double precision) OWNER TO postgres;

--
-- TOC entry 139 (class 1255 OID 28013)
-- Dependencies: 5 956 956
-- Name: cube(cube, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube(cube, double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube(cube, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 140 (class 1255 OID 28014)
-- Dependencies: 956 5 956
-- Name: cube_cmp(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_cmp(cube, cube) RETURNS integer
    AS '$libdir/cube', 'cube_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_cmp(cube, cube) OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 140
-- Name: FUNCTION cube_cmp(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_cmp(cube, cube) IS 'btree comparison function';


--
-- TOC entry 141 (class 1255 OID 28015)
-- Dependencies: 5 956 956
-- Name: cube_contained(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_contained(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_contained(cube, cube) OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 141
-- Name: FUNCTION cube_contained(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_contained(cube, cube) IS 'contained in';


--
-- TOC entry 142 (class 1255 OID 28016)
-- Dependencies: 956 5 956
-- Name: cube_contains(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_contains(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_contains(cube, cube) OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 142
-- Name: FUNCTION cube_contains(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_contains(cube, cube) IS 'contains';


--
-- TOC entry 143 (class 1255 OID 28017)
-- Dependencies: 956 5 956
-- Name: cube_enlarge(cube, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_enlarge(cube, double precision, integer) RETURNS cube
    AS '$libdir/cube', 'cube_enlarge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_enlarge(cube, double precision, integer) OWNER TO postgres;

--
-- TOC entry 144 (class 1255 OID 28018)
-- Dependencies: 956 956 5
-- Name: cube_eq(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_eq(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_eq(cube, cube) OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 144
-- Name: FUNCTION cube_eq(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_eq(cube, cube) IS 'same as';


--
-- TOC entry 145 (class 1255 OID 28019)
-- Dependencies: 956 5 956
-- Name: cube_ge(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ge(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ge(cube, cube) OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 145
-- Name: FUNCTION cube_ge(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_ge(cube, cube) IS 'greater than or equal to';


--
-- TOC entry 146 (class 1255 OID 28020)
-- Dependencies: 956 956 5
-- Name: cube_gt(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_gt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_gt(cube, cube) OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 146
-- Name: FUNCTION cube_gt(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_gt(cube, cube) IS 'greater than';


--
-- TOC entry 147 (class 1255 OID 28021)
-- Dependencies: 956 5 956 956
-- Name: cube_inter(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_inter(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_inter(cube, cube) OWNER TO postgres;

--
-- TOC entry 148 (class 1255 OID 28022)
-- Dependencies: 5 956 956
-- Name: cube_le(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_le(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_le(cube, cube) OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 148
-- Name: FUNCTION cube_le(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_le(cube, cube) IS 'lower than or equal to';


--
-- TOC entry 149 (class 1255 OID 28023)
-- Dependencies: 956 5
-- Name: cube_ll_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ll_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ll_coord'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ll_coord(cube, integer) OWNER TO postgres;

--
-- TOC entry 150 (class 1255 OID 28024)
-- Dependencies: 5 956 956
-- Name: cube_lt(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_lt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_lt(cube, cube) OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 150
-- Name: FUNCTION cube_lt(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_lt(cube, cube) IS 'lower than';


--
-- TOC entry 151 (class 1255 OID 28025)
-- Dependencies: 956 956 5
-- Name: cube_ne(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ne(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ne(cube, cube) OWNER TO postgres;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 151
-- Name: FUNCTION cube_ne(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_ne(cube, cube) IS 'different';


--
-- TOC entry 152 (class 1255 OID 28026)
-- Dependencies: 956 956 5
-- Name: cube_overlap(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_overlap(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_overlap(cube, cube) OWNER TO postgres;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 152
-- Name: FUNCTION cube_overlap(cube, cube); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION cube_overlap(cube, cube) IS 'overlaps';


--
-- TOC entry 153 (class 1255 OID 28027)
-- Dependencies: 5 956
-- Name: cube_size(cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_size(cube) RETURNS double precision
    AS '$libdir/cube', 'cube_size'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_size(cube) OWNER TO postgres;

--
-- TOC entry 154 (class 1255 OID 28028)
-- Dependencies: 956 5 956
-- Name: cube_subset(cube, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_subset(cube, integer[]) RETURNS cube
    AS '$libdir/cube', 'cube_subset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_subset(cube, integer[]) OWNER TO postgres;

--
-- TOC entry 155 (class 1255 OID 28029)
-- Dependencies: 5 956 956 956
-- Name: cube_union(cube, cube); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_union(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_union(cube, cube) OWNER TO postgres;

--
-- TOC entry 156 (class 1255 OID 28030)
-- Dependencies: 5 956
-- Name: cube_ur_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cube_ur_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ur_coord'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.cube_ur_coord(cube, integer) OWNER TO postgres;

--
-- TOC entry 157 (class 1255 OID 28031)
-- Dependencies: 5
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, text) OWNER TO postgres;

--
-- TOC entry 158 (class 1255 OID 28032)
-- Dependencies: 5
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 159 (class 1255 OID 28033)
-- Dependencies: 5
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text) OWNER TO postgres;

--
-- TOC entry 160 (class 1255 OID 28034)
-- Dependencies: 5
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink(text, boolean) OWNER TO postgres;

--
-- TOC entry 161 (class 1255 OID 28035)
-- Dependencies: 5
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_delete'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_delete(text, int2vector, integer, text[]) OWNER TO postgres;

--
-- TOC entry 162 (class 1255 OID 28036)
-- Dependencies: 5
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_insert'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_insert(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 163 (class 1255 OID 28037)
-- Dependencies: 5
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_update'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_build_sql_update(text, int2vector, integer, text[], text[]) OWNER TO postgres;

--
-- TOC entry 164 (class 1255 OID 28038)
-- Dependencies: 5
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_cancel_query(text) RETURNS text
    AS '$libdir/dblink', 'dblink_cancel_query'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_cancel_query(text) OWNER TO postgres;

--
-- TOC entry 165 (class 1255 OID 28039)
-- Dependencies: 5
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text) OWNER TO postgres;

--
-- TOC entry 166 (class 1255 OID 28040)
-- Dependencies: 5
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, boolean) OWNER TO postgres;

--
-- TOC entry 167 (class 1255 OID 28041)
-- Dependencies: 5
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, text) OWNER TO postgres;

--
-- TOC entry 168 (class 1255 OID 28042)
-- Dependencies: 5
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_close(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_close(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 169 (class 1255 OID 28043)
-- Dependencies: 5
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_connect(text) OWNER TO postgres;

--
-- TOC entry 170 (class 1255 OID 28044)
-- Dependencies: 5
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_connect(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_connect(text, text) OWNER TO postgres;

--
-- TOC entry 171 (class 1255 OID 28045)
-- Dependencies: 5
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_current_query() RETURNS text
    AS '$libdir/dblink', 'dblink_current_query'
    LANGUAGE c;


ALTER FUNCTION public.dblink_current_query() OWNER TO postgres;

--
-- TOC entry 172 (class 1255 OID 28046)
-- Dependencies: 5
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect() RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_disconnect() OWNER TO postgres;

--
-- TOC entry 173 (class 1255 OID 28047)
-- Dependencies: 5
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_disconnect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_disconnect(text) OWNER TO postgres;

--
-- TOC entry 174 (class 1255 OID 28048)
-- Dependencies: 5
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_error_message(text) RETURNS text
    AS '$libdir/dblink', 'dblink_error_message'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_error_message(text) OWNER TO postgres;

--
-- TOC entry 175 (class 1255 OID 28049)
-- Dependencies: 5
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, text) OWNER TO postgres;

--
-- TOC entry 176 (class 1255 OID 28050)
-- Dependencies: 5
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 177 (class 1255 OID 28051)
-- Dependencies: 5
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text) OWNER TO postgres;

--
-- TOC entry 178 (class 1255 OID 28052)
-- Dependencies: 5
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_exec(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_exec(text, boolean) OWNER TO postgres;

--
-- TOC entry 179 (class 1255 OID 28053)
-- Dependencies: 5
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, integer) OWNER TO postgres;

--
-- TOC entry 180 (class 1255 OID 28054)
-- Dependencies: 5
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 181 (class 1255 OID 28055)
-- Dependencies: 5
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, text, integer) OWNER TO postgres;

--
-- TOC entry 182 (class 1255 OID 28056)
-- Dependencies: 5
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_fetch(text, text, integer, boolean) OWNER TO postgres;

--
-- TOC entry 183 (class 1255 OID 28057)
-- Dependencies: 5
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_connections() RETURNS text[]
    AS '$libdir/dblink', 'dblink_get_connections'
    LANGUAGE c;


ALTER FUNCTION public.dblink_get_connections() OWNER TO postgres;

--
-- TOC entry 184 (class 1255 OID 28058)
-- Dependencies: 1025 5
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_pkey(text) RETURNS SETOF dblink_pkey_results
    AS '$libdir/dblink', 'dblink_get_pkey'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_pkey(text) OWNER TO postgres;

--
-- TOC entry 185 (class 1255 OID 28059)
-- Dependencies: 5
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_result(text) OWNER TO postgres;

--
-- TOC entry 186 (class 1255 OID 28060)
-- Dependencies: 5
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_get_result(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_get_result(text, boolean) OWNER TO postgres;

--
-- TOC entry 187 (class 1255 OID 28061)
-- Dependencies: 5
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_is_busy(text) RETURNS integer
    AS '$libdir/dblink', 'dblink_is_busy'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_is_busy(text) OWNER TO postgres;

--
-- TOC entry 188 (class 1255 OID 28062)
-- Dependencies: 5
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text) OWNER TO postgres;

--
-- TOC entry 189 (class 1255 OID 28063)
-- Dependencies: 5
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, boolean) OWNER TO postgres;

--
-- TOC entry 190 (class 1255 OID 28064)
-- Dependencies: 5
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, text) OWNER TO postgres;

--
-- TOC entry 191 (class 1255 OID 28065)
-- Dependencies: 5
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_open(text, text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_open(text, text, text, boolean) OWNER TO postgres;

--
-- TOC entry 192 (class 1255 OID 28066)
-- Dependencies: 5
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dblink_send_query(text, text) RETURNS integer
    AS '$libdir/dblink', 'dblink_send_query'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dblink_send_query(text, text) OWNER TO postgres;

--
-- TOC entry 193 (class 1255 OID 28067)
-- Dependencies: 5
-- Name: dearmor(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dearmor(text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_dearmor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dearmor(text) OWNER TO postgres;

--
-- TOC entry 194 (class 1255 OID 28068)
-- Dependencies: 5
-- Name: decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.decrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 195 (class 1255 OID 28069)
-- Dependencies: 5
-- Name: decrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION decrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.decrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 196 (class 1255 OID 28070)
-- Dependencies: 5
-- Name: dex_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'dex_init'
    LANGUAGE c;


ALTER FUNCTION public.dex_init(internal) OWNER TO postgres;

--
-- TOC entry 197 (class 1255 OID 28071)
-- Dependencies: 5
-- Name: dex_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dex_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'dex_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.dex_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 198 (class 1255 OID 28072)
-- Dependencies: 5
-- Name: difference(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION difference(text, text) RETURNS integer
    AS '$libdir/fuzzystrmatch', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.difference(text, text) OWNER TO postgres;

--
-- TOC entry 199 (class 1255 OID 28073)
-- Dependencies: 5
-- Name: digest(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION digest(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.digest(text, text) OWNER TO postgres;

--
-- TOC entry 200 (class 1255 OID 28074)
-- Dependencies: 5
-- Name: digest(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION digest(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.digest(bytea, text) OWNER TO postgres;

--
-- TOC entry 201 (class 1255 OID 28075)
-- Dependencies: 5
-- Name: dmetaphone(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dmetaphone(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'dmetaphone'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dmetaphone(text) OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 28076)
-- Dependencies: 5
-- Name: dmetaphone_alt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dmetaphone_alt(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'dmetaphone_alt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dmetaphone_alt(text) OWNER TO postgres;

--
-- TOC entry 203 (class 1255 OID 28077)
-- Dependencies: 968 5
-- Name: ean13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ean13(text) RETURNS ean13
    AS '$libdir/isn', 'ean13_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ean13(text) OWNER TO postgres;

--
-- TOC entry 204 (class 1255 OID 28078)
-- Dependencies: 1026 956 5
-- Name: earth_box(earth, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth_box(earth, double precision) RETURNS cube
    AS $_$SELECT cube_enlarge($1, gc_to_sec($2), 3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.earth_box(earth, double precision) OWNER TO postgres;

--
-- TOC entry 205 (class 1255 OID 28079)
-- Dependencies: 1026 1026 5
-- Name: earth_distance(earth, earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION earth_distance(earth, earth) RETURNS double precision
    AS $_$SELECT sec_to_gc(cube_distance($1, $2))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.earth_distance(earth, earth) OWNER TO postgres;

--
-- TOC entry 206 (class 1255 OID 28080)
-- Dependencies: 5
-- Name: encrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.encrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 207 (class 1255 OID 28081)
-- Dependencies: 5
-- Name: encrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION encrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.encrypt_iv(bytea, bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 208 (class 1255 OID 28082)
-- Dependencies: 1016 5 1019
-- Name: exectsq(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION exectsq(tsvector, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'exectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.exectsq(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 208
-- Name: FUNCTION exectsq(tsvector, tsquery); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION exectsq(tsvector, tsquery) IS 'boolean operation with text index';


--
-- TOC entry 209 (class 1255 OID 28083)
-- Dependencies: 5
-- Name: g_cube_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_compress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_compress(internal) OWNER TO postgres;

--
-- TOC entry 210 (class 1255 OID 28084)
-- Dependencies: 956 5
-- Name: g_cube_consistent(internal, cube, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_consistent(internal, cube, integer) RETURNS boolean
    AS '$libdir/cube', 'g_cube_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_consistent(internal, cube, integer) OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 28085)
-- Dependencies: 5
-- Name: g_cube_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_decompress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_decompress(internal) OWNER TO postgres;

--
-- TOC entry 212 (class 1255 OID 28086)
-- Dependencies: 5
-- Name: g_cube_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_cube_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 213 (class 1255 OID 28087)
-- Dependencies: 5
-- Name: g_cube_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_picksplit(internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 28088)
-- Dependencies: 5 956 956
-- Name: g_cube_same(cube, cube, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_same(cube, cube, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_same'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_same(cube, cube, internal) OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 28089)
-- Dependencies: 956 5
-- Name: g_cube_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_cube_union(internal, internal) RETURNS cube
    AS '$libdir/cube', 'g_cube_union'
    LANGUAGE c;


ALTER FUNCTION public.g_cube_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 28090)
-- Dependencies: 5
-- Name: g_int_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_int_compress(internal) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 28091)
-- Dependencies: 5
-- Name: g_int_consistent(internal, integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_consistent(internal, integer[], integer) RETURNS boolean
    AS '$libdir/_int', 'g_int_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_int_consistent(internal, integer[], integer) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 28092)
-- Dependencies: 5
-- Name: g_int_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_int_decompress(internal) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 28093)
-- Dependencies: 5
-- Name: g_int_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_int_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 28094)
-- Dependencies: 5
-- Name: g_int_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_int_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 28095)
-- Dependencies: 5
-- Name: g_int_same(integer[], integer[], internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_same(integer[], integer[], internal) RETURNS internal
    AS '$libdir/_int', 'g_int_same'
    LANGUAGE c;


ALTER FUNCTION public.g_int_same(integer[], integer[], internal) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 28096)
-- Dependencies: 5
-- Name: g_int_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_int_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_int_union'
    LANGUAGE c;


ALTER FUNCTION public.g_int_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 28097)
-- Dependencies: 5
-- Name: g_intbig_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_compress'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_compress(internal) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 28098)
-- Dependencies: 5
-- Name: g_intbig_consistent(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_consistent(internal, internal, integer) RETURNS boolean
    AS '$libdir/_int', 'g_intbig_consistent'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_consistent(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 28099)
-- Dependencies: 5
-- Name: g_intbig_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_decompress'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_decompress(internal) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 28100)
-- Dependencies: 5
-- Name: g_intbig_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.g_intbig_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 28101)
-- Dependencies: 5
-- Name: g_intbig_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 28102)
-- Dependencies: 5
-- Name: g_intbig_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_same(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_same'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_same(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 28103)
-- Dependencies: 5
-- Name: g_intbig_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION g_intbig_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_intbig_union'
    LANGUAGE c;


ALTER FUNCTION public.g_intbig_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 28104)
-- Dependencies: 5
-- Name: gc_to_sec(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gc_to_sec(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/earth() > pi() THEN 2*earth() ELSE 2*earth()*sin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.gc_to_sec(double precision) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 28105)
-- Dependencies: 5
-- Name: gen_random_bytes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_random_bytes(integer) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_random_bytes'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_random_bytes(integer) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 28106)
-- Dependencies: 5
-- Name: gen_salt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_salt(text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_salt(text) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 28107)
-- Dependencies: 5
-- Name: gen_salt(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_salt(text, integer) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt_rounds'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gen_salt(text, integer) OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 28108)
-- Dependencies: 5
-- Name: geo_distance(point, point); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geo_distance(point, point) RETURNS double precision
    AS '$libdir/earthdistance', 'geo_distance'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geo_distance(point, point) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 28109)
-- Dependencies: 1016 1019 5
-- Name: get_covers(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_covers(tsvector, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'get_covers'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_covers(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 28110)
-- Dependencies: 5
-- Name: get_timetravel(name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_timetravel(name) RETURNS integer
    AS '$libdir/timetravel', 'get_timetravel'
    LANGUAGE c STRICT;


ALTER FUNCTION public.get_timetravel(name) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 28111)
-- Dependencies: 1016 5
-- Name: gin_extract_tsquery(tsquery, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsquery(tsquery, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsquery'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsquery(tsquery, internal, internal) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 28112)
-- Dependencies: 5 1019
-- Name: gin_extract_tsvector(tsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_extract_tsvector(tsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsvector'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_extract_tsvector(tsvector, internal) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 28113)
-- Dependencies: 5 1016
-- Name: gin_ts_consistent(internal, internal, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gin_ts_consistent(internal, internal, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'gin_ts_consistent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gin_ts_consistent(internal, internal, tsquery) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 28114)
-- Dependencies: 5
-- Name: ginint4_consistent(internal, smallint, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ginint4_consistent(internal, smallint, internal) RETURNS internal
    AS '$libdir/_int', 'ginint4_consistent'
    LANGUAGE c;


ALTER FUNCTION public.ginint4_consistent(internal, smallint, internal) OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 28115)
-- Dependencies: 5
-- Name: ginint4_queryextract(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ginint4_queryextract(internal, internal, smallint) RETURNS internal
    AS '$libdir/_int', 'ginint4_queryextract'
    LANGUAGE c;


ALTER FUNCTION public.ginint4_queryextract(internal, internal, smallint) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 28116)
-- Dependencies: 5
-- Name: gseg_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_compress(internal) RETURNS internal
    AS '$libdir/seg', 'gseg_compress'
    LANGUAGE c;


ALTER FUNCTION public.gseg_compress(internal) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 28117)
-- Dependencies: 5 1013
-- Name: gseg_consistent(internal, seg, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_consistent(internal, seg, integer) RETURNS boolean
    AS '$libdir/seg', 'gseg_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gseg_consistent(internal, seg, integer) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 28118)
-- Dependencies: 5
-- Name: gseg_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_decompress(internal) RETURNS internal
    AS '$libdir/seg', 'gseg_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gseg_decompress(internal) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 28119)
-- Dependencies: 5
-- Name: gseg_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gseg_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 28120)
-- Dependencies: 5
-- Name: gseg_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_picksplit(internal, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gseg_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 28121)
-- Dependencies: 1013 1013 5
-- Name: gseg_same(seg, seg, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_same(seg, seg, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_same'
    LANGUAGE c;


ALTER FUNCTION public.gseg_same(seg, seg, internal) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 28122)
-- Dependencies: 5 1013
-- Name: gseg_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gseg_union(internal, internal) RETURNS seg
    AS '$libdir/seg', 'gseg_union'
    LANGUAGE c;


ALTER FUNCTION public.gseg_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 28123)
-- Dependencies: 5
-- Name: gtsq_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_compress(internal) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 28124)
-- Dependencies: 5 971
-- Name: gtsq_consistent(gtsq, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_consistent(gtsq, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsq_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_consistent(gtsq, internal, integer) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 28125)
-- Dependencies: 5
-- Name: gtsq_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_decompress(internal) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 28126)
-- Dependencies: 5
-- Name: gtsq_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsq_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 28127)
-- Dependencies: 5
-- Name: gtsq_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 28128)
-- Dependencies: 971 971 5
-- Name: gtsq_same(gtsq, gtsq, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_same(gtsq, gtsq, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_same(gtsq, gtsq, internal) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 28129)
-- Dependencies: 5
-- Name: gtsq_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsq_union(bytea, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsq_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsq_union(bytea, internal) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 28130)
-- Dependencies: 5
-- Name: gtsvector_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_compress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_compress(internal) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 28131)
-- Dependencies: 5 974
-- Name: gtsvector_consistent(gtsvector, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_consistent(gtsvector, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsvector_consistent'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_consistent(gtsvector, internal, integer) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 28132)
-- Dependencies: 5
-- Name: gtsvector_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_decompress'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_decompress(internal) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 28133)
-- Dependencies: 5
-- Name: gtsvector_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.gtsvector_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 28134)
-- Dependencies: 5
-- Name: gtsvector_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 28135)
-- Dependencies: 974 5 974
-- Name: gtsvector_same(gtsvector, gtsvector, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_same(gtsvector, gtsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_same'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_same(gtsvector, gtsvector, internal) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 28136)
-- Dependencies: 5
-- Name: gtsvector_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gtsvector_union(internal, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


ALTER FUNCTION public.gtsvector_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 28137)
-- Dependencies: 5 968
-- Name: hashean13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashean13(ean13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashean13(ean13) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 28138)
-- Dependencies: 980 5
-- Name: hashisbn(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashisbn(isbn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashisbn(isbn) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 28139)
-- Dependencies: 5 983
-- Name: hashisbn13(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashisbn13(isbn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashisbn13(isbn13) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 28140)
-- Dependencies: 5 986
-- Name: hashismn(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashismn(ismn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashismn(ismn) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 28141)
-- Dependencies: 5 989
-- Name: hashismn13(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashismn13(ismn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashismn13(ismn13) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 28142)
-- Dependencies: 5 992
-- Name: hashissn(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashissn(issn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashissn(issn) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 28143)
-- Dependencies: 5 995
-- Name: hashissn13(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashissn13(issn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashissn13(issn13) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 28144)
-- Dependencies: 5 1022
-- Name: hashupc(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hashupc(upc) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.hashupc(upc) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 28145)
-- Dependencies: 5 1016
-- Name: headline(oid, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 28146)
-- Dependencies: 1016 5
-- Name: headline(oid, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(oid, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(oid, text, tsquery) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 28147)
-- Dependencies: 1016 5
-- Name: headline(text, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 28148)
-- Dependencies: 5 1016
-- Name: headline(text, text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, text, tsquery) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 28149)
-- Dependencies: 1016 5
-- Name: headline(text, tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery, text) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 28150)
-- Dependencies: 1016 5
-- Name: headline(text, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION headline(text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.headline(text, tsquery) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 28151)
-- Dependencies: 5
-- Name: hmac(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hmac(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.hmac(text, text, text) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 28152)
-- Dependencies: 5
-- Name: hmac(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hmac(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.hmac(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 28153)
-- Dependencies: 5
-- Name: icount(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION icount(integer[]) RETURNS integer
    AS '$libdir/_int', 'icount'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.icount(integer[]) OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 28154)
-- Dependencies: 5
-- Name: idx(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION idx(integer[], integer) RETURNS integer
    AS '$libdir/_int', 'idx'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.idx(integer[], integer) OWNER TO postgres;

--
-- TOC entry 281 (class 1255 OID 28155)
-- Dependencies: 1001 5 1001
-- Name: index(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "index"(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public."index"(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 28156)
-- Dependencies: 5 1001 1001
-- Name: index(ltree, ltree, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "index"(ltree, ltree, integer) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public."index"(ltree, ltree, integer) OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 28157)
-- Dependencies: 5
-- Name: insert_username(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION insert_username() RETURNS "trigger"
    AS '$libdir/insert_username', 'insert_username'
    LANGUAGE c;


ALTER FUNCTION public.insert_username() OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 28158)
-- Dependencies: 5
-- Name: int_agg_final_array(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_agg_final_array(integer[]) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_final_array'
    LANGUAGE c;


ALTER FUNCTION public.int_agg_final_array(integer[]) OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 28159)
-- Dependencies: 5
-- Name: int_agg_state(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_agg_state(integer[], integer) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_state'
    LANGUAGE c;


ALTER FUNCTION public.int_agg_state(integer[], integer) OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 28160)
-- Dependencies: 5
-- Name: int_array_enum(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION int_array_enum(integer[]) RETURNS SETOF integer
    AS '$libdir/int_aggregate', 'int_enum'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.int_array_enum(integer[]) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 28161)
-- Dependencies: 5
-- Name: intarray_del_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_del_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_del_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_del_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 28162)
-- Dependencies: 5
-- Name: intarray_push_array(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_push_array(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_array'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_array(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 28163)
-- Dependencies: 5
-- Name: intarray_push_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intarray_push_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intarray_push_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 28164)
-- Dependencies: 5
-- Name: intset(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset(integer) RETURNS integer[]
    AS '$libdir/_int', 'intset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset(integer) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 28165)
-- Dependencies: 5
-- Name: intset_subtract(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset_subtract(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intset_subtract'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_subtract(integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 28166)
-- Dependencies: 5
-- Name: intset_union_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intset_union_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intset_union_elem'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intset_union_elem(integer[], integer) OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 28167)
-- Dependencies: 5 968
-- Name: is_valid(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ean13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ean13) OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 28168)
-- Dependencies: 5 983
-- Name: is_valid(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(isbn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(isbn13) OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 28169)
-- Dependencies: 989 5
-- Name: is_valid(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ismn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ismn13) OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 28170)
-- Dependencies: 5 995
-- Name: is_valid(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(issn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(issn13) OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 28171)
-- Dependencies: 5 980
-- Name: is_valid(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(isbn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(isbn) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 28172)
-- Dependencies: 5 986
-- Name: is_valid(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(ismn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(ismn) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 28173)
-- Dependencies: 5 992
-- Name: is_valid(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(issn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(issn) OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 28174)
-- Dependencies: 5 1022
-- Name: is_valid(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION is_valid(upc) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.is_valid(upc) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 28175)
-- Dependencies: 968 980 5
-- Name: isbn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn(ean13) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn(ean13) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 28176)
-- Dependencies: 5 980
-- Name: isbn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn(text) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn(text) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 28177)
-- Dependencies: 968 5 983
-- Name: isbn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13(ean13) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13(ean13) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 28178)
-- Dependencies: 983 5
-- Name: isbn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isbn13(text) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isbn13(text) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 28179)
-- Dependencies: 986 968 5
-- Name: ismn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn(ean13) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn(ean13) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 28180)
-- Dependencies: 5 986
-- Name: ismn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn(text) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn(text) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 28181)
-- Dependencies: 968 989 5
-- Name: ismn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13(ean13) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13(ean13) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 28182)
-- Dependencies: 5 989
-- Name: ismn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ismn13(text) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ismn13(text) OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 28183)
-- Dependencies: 5
-- Name: isn_weak(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_weak(boolean) RETURNS boolean
    AS '$libdir/isn', 'accept_weak_input'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_weak(boolean) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 28184)
-- Dependencies: 5
-- Name: isn_weak(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isn_weak() RETURNS boolean
    AS '$libdir/isn', 'weak_input_status'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isn_weak() OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 28185)
-- Dependencies: 5 968 968
-- Name: isneq(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 28186)
-- Dependencies: 5 968 983
-- Name: isneq(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 28187)
-- Dependencies: 5 989 968
-- Name: isneq(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 28188)
-- Dependencies: 995 5 968
-- Name: isneq(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 28189)
-- Dependencies: 980 968 5
-- Name: isneq(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 28190)
-- Dependencies: 968 5 986
-- Name: isneq(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 28191)
-- Dependencies: 968 992 5
-- Name: isneq(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, issn) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 28192)
-- Dependencies: 968 5 1022
-- Name: isneq(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ean13, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ean13, upc) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 28193)
-- Dependencies: 5 983 983
-- Name: isneq(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 28194)
-- Dependencies: 5 983 980
-- Name: isneq(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 28195)
-- Dependencies: 5 983 968
-- Name: isneq(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 28196)
-- Dependencies: 5 980 980
-- Name: isneq(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 28197)
-- Dependencies: 5 980 983
-- Name: isneq(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 28198)
-- Dependencies: 5 980 968
-- Name: isneq(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(isbn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 325 (class 1255 OID 28199)
-- Dependencies: 5 989 989
-- Name: isneq(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 326 (class 1255 OID 28200)
-- Dependencies: 5 986 989
-- Name: isneq(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 327 (class 1255 OID 28201)
-- Dependencies: 5 989 968
-- Name: isneq(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 328 (class 1255 OID 28202)
-- Dependencies: 5 986 986
-- Name: isneq(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 329 (class 1255 OID 28203)
-- Dependencies: 5 986 989
-- Name: isneq(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 28204)
-- Dependencies: 5 986 968
-- Name: isneq(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(ismn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 28205)
-- Dependencies: 5 995 995
-- Name: isneq(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 28206)
-- Dependencies: 5 995 992
-- Name: isneq(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, issn) OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 28207)
-- Dependencies: 5 995 968
-- Name: isneq(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 28208)
-- Dependencies: 5 992 992
-- Name: isneq(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, issn) OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 28209)
-- Dependencies: 5 992 995
-- Name: isneq(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, issn13) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 28210)
-- Dependencies: 5 992 968
-- Name: isneq(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(issn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(issn, ean13) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 28211)
-- Dependencies: 5 1022 1022
-- Name: isneq(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(upc, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(upc, upc) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 28212)
-- Dependencies: 5 1022 968
-- Name: isneq(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isneq(upc, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isneq(upc, ean13) OWNER TO postgres;

--
-- TOC entry 339 (class 1255 OID 28213)
-- Dependencies: 5 968 968
-- Name: isnge(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 340 (class 1255 OID 28214)
-- Dependencies: 5 968 983
-- Name: isnge(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 341 (class 1255 OID 28215)
-- Dependencies: 5 968 989
-- Name: isnge(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 342 (class 1255 OID 28216)
-- Dependencies: 5 968 995
-- Name: isnge(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 343 (class 1255 OID 28217)
-- Dependencies: 5 968 980
-- Name: isnge(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 344 (class 1255 OID 28218)
-- Dependencies: 5 968 986
-- Name: isnge(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 345 (class 1255 OID 28219)
-- Dependencies: 5 968 992
-- Name: isnge(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, issn) OWNER TO postgres;

--
-- TOC entry 346 (class 1255 OID 28220)
-- Dependencies: 5 968 1022
-- Name: isnge(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ean13, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ean13, upc) OWNER TO postgres;

--
-- TOC entry 347 (class 1255 OID 28221)
-- Dependencies: 5 983 983
-- Name: isnge(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 348 (class 1255 OID 28222)
-- Dependencies: 5 983 980
-- Name: isnge(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 349 (class 1255 OID 28223)
-- Dependencies: 5 983 968
-- Name: isnge(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 350 (class 1255 OID 28224)
-- Dependencies: 5 980 980
-- Name: isnge(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 351 (class 1255 OID 28225)
-- Dependencies: 5 980 983
-- Name: isnge(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 352 (class 1255 OID 28226)
-- Dependencies: 5 980 968
-- Name: isnge(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(isbn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 353 (class 1255 OID 28227)
-- Dependencies: 5 989 989
-- Name: isnge(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 354 (class 1255 OID 28228)
-- Dependencies: 5 989 986
-- Name: isnge(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 355 (class 1255 OID 28229)
-- Dependencies: 5 989 968
-- Name: isnge(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 356 (class 1255 OID 28230)
-- Dependencies: 5 986 986
-- Name: isnge(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 357 (class 1255 OID 28231)
-- Dependencies: 5 986 989
-- Name: isnge(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 358 (class 1255 OID 28232)
-- Dependencies: 5 986 968
-- Name: isnge(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(ismn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 359 (class 1255 OID 28233)
-- Dependencies: 5 995 995
-- Name: isnge(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 360 (class 1255 OID 28234)
-- Dependencies: 5 995 992
-- Name: isnge(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, issn) OWNER TO postgres;

--
-- TOC entry 361 (class 1255 OID 28235)
-- Dependencies: 5 995 968
-- Name: isnge(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 362 (class 1255 OID 28236)
-- Dependencies: 5 992 992
-- Name: isnge(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, issn) OWNER TO postgres;

--
-- TOC entry 363 (class 1255 OID 28237)
-- Dependencies: 5 992 995
-- Name: isnge(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, issn13) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 28238)
-- Dependencies: 5 992 968
-- Name: isnge(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(issn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(issn, ean13) OWNER TO postgres;

--
-- TOC entry 365 (class 1255 OID 28239)
-- Dependencies: 5 1022 1022
-- Name: isnge(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(upc, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(upc, upc) OWNER TO postgres;

--
-- TOC entry 366 (class 1255 OID 28240)
-- Dependencies: 5 1022 968
-- Name: isnge(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnge(upc, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnge(upc, ean13) OWNER TO postgres;

--
-- TOC entry 367 (class 1255 OID 28241)
-- Dependencies: 5 968 968
-- Name: isngt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 368 (class 1255 OID 28242)
-- Dependencies: 5 968 983
-- Name: isngt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 369 (class 1255 OID 28243)
-- Dependencies: 5 968 989
-- Name: isngt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 370 (class 1255 OID 28244)
-- Dependencies: 5 968 995
-- Name: isngt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 28245)
-- Dependencies: 5 968 980
-- Name: isngt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 28246)
-- Dependencies: 5 968 986
-- Name: isngt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 373 (class 1255 OID 28247)
-- Dependencies: 5 968 992
-- Name: isngt(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, issn) OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 28248)
-- Dependencies: 5 968 1022
-- Name: isngt(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ean13, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ean13, upc) OWNER TO postgres;

--
-- TOC entry 375 (class 1255 OID 28249)
-- Dependencies: 5 983 983
-- Name: isngt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 28250)
-- Dependencies: 5 983 980
-- Name: isngt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 28251)
-- Dependencies: 5 983 968
-- Name: isngt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 28252)
-- Dependencies: 5 980 980
-- Name: isngt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 28253)
-- Dependencies: 5 980 983
-- Name: isngt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 28254)
-- Dependencies: 5 980 968
-- Name: isngt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(isbn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 28255)
-- Dependencies: 5 989 989
-- Name: isngt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 28256)
-- Dependencies: 5 989 986
-- Name: isngt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 28257)
-- Dependencies: 5 989 968
-- Name: isngt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 28258)
-- Dependencies: 5 986 986
-- Name: isngt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 28259)
-- Dependencies: 5 986 989
-- Name: isngt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 28260)
-- Dependencies: 5 986 968
-- Name: isngt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(ismn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 28261)
-- Dependencies: 5 995 995
-- Name: isngt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 28262)
-- Dependencies: 5 995 992
-- Name: isngt(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, issn) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 28263)
-- Dependencies: 5 995 968
-- Name: isngt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 28264)
-- Dependencies: 5 992 992
-- Name: isngt(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, issn) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 28265)
-- Dependencies: 5 992 995
-- Name: isngt(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, issn13) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 28266)
-- Dependencies: 5 992 968
-- Name: isngt(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(issn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(issn, ean13) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 28267)
-- Dependencies: 5 1022 1022
-- Name: isngt(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(upc, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(upc, upc) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 28268)
-- Dependencies: 5 1022 968
-- Name: isngt(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isngt(upc, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isngt(upc, ean13) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 28269)
-- Dependencies: 5 968 968
-- Name: isnle(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 28270)
-- Dependencies: 5 968 983
-- Name: isnle(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 28271)
-- Dependencies: 5 968 989
-- Name: isnle(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 28272)
-- Dependencies: 5 968 995
-- Name: isnle(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 28273)
-- Dependencies: 5 968 980
-- Name: isnle(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 28274)
-- Dependencies: 5 968 986
-- Name: isnle(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 28275)
-- Dependencies: 5 968 992
-- Name: isnle(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, issn) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 28276)
-- Dependencies: 5 968 1022
-- Name: isnle(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ean13, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ean13, upc) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 28277)
-- Dependencies: 5 983 983
-- Name: isnle(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 404 (class 1255 OID 28278)
-- Dependencies: 5 983 980
-- Name: isnle(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 28279)
-- Dependencies: 5 983 968
-- Name: isnle(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 28280)
-- Dependencies: 5 980 980
-- Name: isnle(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 28281)
-- Dependencies: 5 980 983
-- Name: isnle(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 28282)
-- Dependencies: 5 980 968
-- Name: isnle(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(isbn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 28283)
-- Dependencies: 5 989 989
-- Name: isnle(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 28284)
-- Dependencies: 5 989 986
-- Name: isnle(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 28285)
-- Dependencies: 5 989 968
-- Name: isnle(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 28286)
-- Dependencies: 5 986 986
-- Name: isnle(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 28287)
-- Dependencies: 5 986 989
-- Name: isnle(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 28288)
-- Dependencies: 5 986 968
-- Name: isnle(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(ismn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 28289)
-- Dependencies: 5 995 995
-- Name: isnle(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 28290)
-- Dependencies: 5 995 992
-- Name: isnle(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, issn) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 28291)
-- Dependencies: 5 995 968
-- Name: isnle(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 28292)
-- Dependencies: 5 992 992
-- Name: isnle(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, issn) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 28293)
-- Dependencies: 5 992 995
-- Name: isnle(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, issn13) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 28294)
-- Dependencies: 5 992 968
-- Name: isnle(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(issn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(issn, ean13) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 28295)
-- Dependencies: 5 1022 1022
-- Name: isnle(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(upc, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(upc, upc) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 28296)
-- Dependencies: 5 1022 968
-- Name: isnle(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnle(upc, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnle(upc, ean13) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 28297)
-- Dependencies: 5 968 968
-- Name: isnlt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 28298)
-- Dependencies: 5 968 983
-- Name: isnlt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 28299)
-- Dependencies: 5 968 989
-- Name: isnlt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 28300)
-- Dependencies: 5 968 995
-- Name: isnlt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 28301)
-- Dependencies: 5 968 980
-- Name: isnlt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 28302)
-- Dependencies: 5 968 986
-- Name: isnlt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 28303)
-- Dependencies: 5 968 992
-- Name: isnlt(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, issn) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 28304)
-- Dependencies: 5 968 1022
-- Name: isnlt(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ean13, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ean13, upc) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 28305)
-- Dependencies: 5 983 983
-- Name: isnlt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 28306)
-- Dependencies: 5 983 980
-- Name: isnlt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 28307)
-- Dependencies: 5 983 968
-- Name: isnlt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 28308)
-- Dependencies: 5 980 980
-- Name: isnlt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 28309)
-- Dependencies: 5 980 983
-- Name: isnlt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 28310)
-- Dependencies: 5 980 968
-- Name: isnlt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(isbn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 28311)
-- Dependencies: 5 989 989
-- Name: isnlt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 28312)
-- Dependencies: 5 989 986
-- Name: isnlt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 28313)
-- Dependencies: 5 989 968
-- Name: isnlt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 28314)
-- Dependencies: 5 986 986
-- Name: isnlt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 28315)
-- Dependencies: 5 986 989
-- Name: isnlt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 28316)
-- Dependencies: 5 986 968
-- Name: isnlt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(ismn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 28317)
-- Dependencies: 5 995 995
-- Name: isnlt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 28318)
-- Dependencies: 5 995 992
-- Name: isnlt(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, issn) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 28319)
-- Dependencies: 5 995 968
-- Name: isnlt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 28320)
-- Dependencies: 5 992 992
-- Name: isnlt(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, issn) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 28321)
-- Dependencies: 5 992 995
-- Name: isnlt(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, issn13) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 28322)
-- Dependencies: 5 992 968
-- Name: isnlt(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(issn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(issn, ean13) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 28323)
-- Dependencies: 5 1022 1022
-- Name: isnlt(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(upc, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(upc, upc) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 28324)
-- Dependencies: 5 1022 968
-- Name: isnlt(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnlt(upc, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnlt(upc, ean13) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 28325)
-- Dependencies: 5 968 968
-- Name: isnne(ean13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ean13) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 28326)
-- Dependencies: 5 968 983
-- Name: isnne(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, isbn13) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 28327)
-- Dependencies: 5 968 989
-- Name: isnne(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ismn13) OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 28328)
-- Dependencies: 5 968 995
-- Name: isnne(ean13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, issn13) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 28329)
-- Dependencies: 5 968 980
-- Name: isnne(ean13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, isbn) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 28330)
-- Dependencies: 5 968 986
-- Name: isnne(ean13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, ismn) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 28331)
-- Dependencies: 5 968 992
-- Name: isnne(ean13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, issn) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 28332)
-- Dependencies: 5 968 1022
-- Name: isnne(ean13, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ean13, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ean13, upc) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 28333)
-- Dependencies: 5 983 983
-- Name: isnne(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, isbn13) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 28334)
-- Dependencies: 5 983 980
-- Name: isnne(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, isbn) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 28335)
-- Dependencies: 5 983 968
-- Name: isnne(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn13, ean13) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 28336)
-- Dependencies: 5 980 980
-- Name: isnne(isbn, isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, isbn) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 28337)
-- Dependencies: 5 980 983
-- Name: isnne(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, isbn13) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 28338)
-- Dependencies: 5 980 968
-- Name: isnne(isbn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(isbn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(isbn, ean13) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 28339)
-- Dependencies: 5 989 989
-- Name: isnne(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ismn13) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 28340)
-- Dependencies: 5 989 986
-- Name: isnne(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ismn) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 28341)
-- Dependencies: 5 989 968
-- Name: isnne(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn13, ean13) OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 28342)
-- Dependencies: 5 986 986
-- Name: isnne(ismn, ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ismn) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 28343)
-- Dependencies: 5 986 989
-- Name: isnne(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ismn13) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 28344)
-- Dependencies: 5 986 968
-- Name: isnne(ismn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(ismn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(ismn, ean13) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 28345)
-- Dependencies: 5 995 995
-- Name: isnne(issn13, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, issn13) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 28346)
-- Dependencies: 5 995 992
-- Name: isnne(issn13, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, issn) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 28347)
-- Dependencies: 5 995 968
-- Name: isnne(issn13, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn13, ean13) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 28348)
-- Dependencies: 5 992 992
-- Name: isnne(issn, issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, issn) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 28349)
-- Dependencies: 5 992 995
-- Name: isnne(issn, issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, issn13) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 28350)
-- Dependencies: 5 992 968
-- Name: isnne(issn, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(issn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(issn, ean13) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 28351)
-- Dependencies: 5 1022 1022
-- Name: isnne(upc, upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(upc, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(upc, upc) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 28352)
-- Dependencies: 5 1022 968
-- Name: isnne(upc, ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isnne(upc, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


ALTER FUNCTION public.isnne(upc, ean13) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 28353)
-- Dependencies: 5 992 968
-- Name: issn(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn(ean13) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn(ean13) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 28354)
-- Dependencies: 5 992
-- Name: issn(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn(text) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn(text) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 28355)
-- Dependencies: 5 995 968
-- Name: issn13(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13(ean13) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13(ean13) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 28356)
-- Dependencies: 5 995
-- Name: issn13(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issn13(text) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issn13(text) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 28357)
-- Dependencies: 5 1026
-- Name: latitude(earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION latitude(earth) RETURNS double precision
    AS $_$SELECT CASE WHEN cube_ll_coord($1, 3)/earth() < -1 THEN -90::float8 WHEN cube_ll_coord($1, 3)/earth() > 1 THEN 90::float8 ELSE degrees(asin(cube_ll_coord($1, 3)/earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.latitude(earth) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 28358)
-- Dependencies: 5 1001 1003
-- Name: lca(ltree[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree[]) RETURNS ltree
    AS '$libdir/ltree', '_lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree[]) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 28359)
-- Dependencies: 5 1001 1001 1001
-- Name: lca(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 28360)
-- Dependencies: 5 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 28361)
-- Dependencies: 5 1001 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 28362)
-- Dependencies: 5 1001 1001 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 28363)
-- Dependencies: 5 1001 1001 1001 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 28364)
-- Dependencies: 5 1001 1001 1001 1001 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 28365)
-- Dependencies: 5 1001 1001 1001 1001 1001 1001 1001 1001 1001
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 28366)
-- Dependencies: 5 1019
-- Name: length(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length(tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_length'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length(tsvector) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 28367)
-- Dependencies: 5
-- Name: levenshtein(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION levenshtein(text, text) RETURNS integer
    AS '$libdir/fuzzystrmatch', 'levenshtein'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.levenshtein(text, text) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 28368)
-- Dependencies: 5
-- Name: lexize(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(oid, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(oid, text) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 28369)
-- Dependencies: 5
-- Name: lexize(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text, text) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 28370)
-- Dependencies: 5
-- Name: lexize(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lexize(text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_bycurrent'
    LANGUAGE c STRICT;


ALTER FUNCTION public.lexize(text) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 28371)
-- Dependencies: 5 1026
-- Name: ll_to_earth(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ll_to_earth(double precision, double precision) RETURNS earth
    AS $_$SELECT cube(cube(cube(earth()*cos(radians($1))*cos(radians($2))),earth()*cos(radians($1))*sin(radians($2))),earth()*sin(radians($1)))::earth$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.ll_to_earth(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 28372)
-- Dependencies: 5 1026
-- Name: longitude(earth); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION longitude(earth) RETURNS double precision
    AS $_$SELECT degrees(atan2(cube_ll_coord($1, 2), cube_ll_coord($1, 1)))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.longitude(earth) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 28373)
-- Dependencies: 5 1001 1000
-- Name: lt_q_regex(ltree, lquery[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lt_q_regex(ltree, lquery[]) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lt_q_regex(ltree, lquery[]) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 28374)
-- Dependencies: 5 1000 1001
-- Name: lt_q_rregex(lquery[], ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lt_q_rregex(lquery[], ltree) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.lt_q_rregex(lquery[], ltree) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 28375)
-- Dependencies: 5 1001 998
-- Name: ltq_regex(ltree, lquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltq_regex(ltree, lquery) RETURNS boolean
    AS '$libdir/ltree', 'ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltq_regex(ltree, lquery) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 28376)
-- Dependencies: 5 998 1001
-- Name: ltq_rregex(lquery, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltq_rregex(lquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltq_rregex(lquery, ltree) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 28377)
-- Dependencies: 5 1001
-- Name: ltree2text(ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree2text(ltree) RETURNS text
    AS '$libdir/ltree', 'ltree2text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree2text(ltree) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 28378)
-- Dependencies: 5 1001 1001 1001
-- Name: ltree_addltree(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_addltree(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_addltree(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 28379)
-- Dependencies: 5 1001 1001
-- Name: ltree_addtext(ltree, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_addtext(ltree, text) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addtext'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_addtext(ltree, text) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 28380)
-- Dependencies: 5 1001 1001
-- Name: ltree_cmp(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_cmp(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_cmp(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 28381)
-- Dependencies: 5
-- Name: ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_compress'
    LANGUAGE c;


ALTER FUNCTION public.ltree_compress(internal) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 28382)
-- Dependencies: 5
-- Name: ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', 'ltree_consistent'
    LANGUAGE c;


ALTER FUNCTION public.ltree_consistent(internal, internal, smallint) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 28383)
-- Dependencies: 5
-- Name: ltree_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_decompress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_decompress'
    LANGUAGE c;


ALTER FUNCTION public.ltree_decompress(internal) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 28384)
-- Dependencies: 5 1001 1001
-- Name: ltree_eq(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_eq(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_eq(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 28385)
-- Dependencies: 5 1001 1001
-- Name: ltree_ge(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_ge(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_ge(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 28386)
-- Dependencies: 5 1001 1001
-- Name: ltree_gt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_gt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_gt(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 28387)
-- Dependencies: 5 1001 1001
-- Name: ltree_isparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_isparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_isparent(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 28388)
-- Dependencies: 5 1001 1001
-- Name: ltree_le(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_le(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_le(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 28389)
-- Dependencies: 5 1001 1001
-- Name: ltree_lt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_lt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_lt(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 28390)
-- Dependencies: 5 1001 1001
-- Name: ltree_ne(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_ne(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_ne(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 28391)
-- Dependencies: 5
-- Name: ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_penalty'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ltree_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 28392)
-- Dependencies: 5
-- Name: ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.ltree_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 28393)
-- Dependencies: 5 1001 1001
-- Name: ltree_risparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_risparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_risparent(ltree, ltree) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 28394)
-- Dependencies: 5
-- Name: ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_same'
    LANGUAGE c;


ALTER FUNCTION public.ltree_same(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 28395)
-- Dependencies: 5 1001 1001
-- Name: ltree_textadd(text, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_textadd(text, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_textadd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltree_textadd(text, ltree) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 28396)
-- Dependencies: 5
-- Name: ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', 'ltree_union'
    LANGUAGE c;


ALTER FUNCTION public.ltree_union(internal, internal) OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 28397)
-- Dependencies: 5
-- Name: ltreeparentsel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltreeparentsel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/ltree', 'ltreeparentsel'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltreeparentsel(internal, oid, internal, integer) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 28398)
-- Dependencies: 5 1001 1007
-- Name: ltxtq_exec(ltree, ltxtquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltxtq_exec(ltree, ltxtquery) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltxtq_exec(ltree, ltxtquery) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 28399)
-- Dependencies: 5 1007 1001
-- Name: ltxtq_rexec(ltxtquery, ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ltxtq_rexec(ltxtquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ltxtq_rexec(ltxtquery, ltree) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 28400)
-- Dependencies: 5 968 968
-- Name: make_valid(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ean13) RETURNS ean13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ean13) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 28401)
-- Dependencies: 5 983 983
-- Name: make_valid(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(isbn13) RETURNS isbn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(isbn13) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 28402)
-- Dependencies: 989 5 989
-- Name: make_valid(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ismn13) RETURNS ismn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ismn13) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 28403)
-- Dependencies: 995 5 995
-- Name: make_valid(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(issn13) RETURNS issn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(issn13) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 28404)
-- Dependencies: 980 5 980
-- Name: make_valid(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(isbn) RETURNS isbn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(isbn) OWNER TO postgres;

--
-- TOC entry 531 (class 1255 OID 28405)
-- Dependencies: 986 5 986
-- Name: make_valid(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(ismn) RETURNS ismn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(ismn) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 28406)
-- Dependencies: 992 5 992
-- Name: make_valid(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(issn) RETURNS issn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(issn) OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 28407)
-- Dependencies: 1022 1022 5
-- Name: make_valid(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION make_valid(upc) RETURNS upc
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.make_valid(upc) OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 28408)
-- Dependencies: 5
-- Name: metaphone(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION metaphone(text, integer) RETURNS text
    AS '$libdir/fuzzystrmatch', 'metaphone'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.metaphone(text, integer) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 28409)
-- Dependencies: 5 1001
-- Name: nlevel(ltree); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nlevel(ltree) RETURNS integer
    AS '$libdir/ltree', 'nlevel'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.nlevel(ltree) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 28410)
-- Dependencies: 5
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    AS '$libdir/tablefunc', 'normal_rand'
    LANGUAGE c STRICT;


ALTER FUNCTION public.normal_rand(integer, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 28411)
-- Dependencies: 1016 5
-- Name: numnode(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numnode(tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_numnode'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numnode(tsquery) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 28412)
-- Dependencies: 5 1101
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
-- TOC entry 539 (class 1255 OID 28413)
-- Dependencies: 1101 5
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
-- TOC entry 540 (class 1255 OID 28414)
-- Dependencies: 5 1101
-- Name: operacao_dadoscartao(character, bigint, integer, date, character varying, integer, integer, bigint, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_dadoscartao(character, bigint, integer, date, character varying, integer, integer, bigint, double precision) RETURNS character varying
    AS $_$
DECLARE
	cTipo		alias for $1;
	bNumeroCartao	alias for $2;
	iCodSeguranca 	alias for $3;
	dDataValidade	alias for $4;
	sNomeImpresso	alias for $5;
	iNumParcelas	alias for $6;
	iBandeiraCart	alias for $7;
	iCodPedido	alias for $8;
	dValorTotal	alias for $9;
	Status 		varchar(30);
BEGIN
	IF (cTipo = 'I' ) THEN
	INSERT INTO dadoscartao(_numerocartao, _codigoseguranca, _datavalidade, _nomeimpresso, _parcelas, _tipobandeiracartao, _pedidodesktopwap, _valortotal)
			VALUES (bNumeroCartao, iCodSeguranca, dDataValidade, sNomeImpresso,iNumParcelas,iBandeiraCart,iCodPedido,dValorTotal);
	END IF;
	IF (cTipo = 'E') THEN
	
	END IF;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_dadoscartao(character, bigint, integer, date, character varying, integer, integer, bigint, double precision) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 28415)
-- Dependencies: 1101 5
-- Name: operacao_dadoscartao(character, bigint, integer, character varying, integer, integer, bigint, double precision, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_dadoscartao(character, bigint, integer, character varying, integer, integer, bigint, double precision, integer, integer) RETURNS character varying
    AS $_$
DECLARE
	cTipo			alias for $1;
	bNumeroCartao	alias for $2;
	iCodSeguranca 	alias for $3;
	sNomeImpresso	alias for $4;
	iNumParcelas	alias for $5;
	iBandeiraCart	alias for $6;
	iCodPedido		alias for $7;
	dValorTotal		alias for $8;
	iMesValidade	alias for $9;
	iAnoValidade	alias for $10;
	
	Status 		varchar(30);
BEGIN
	IF (cTipo = 'I' ) THEN
	INSERT INTO dadoscartao(_numerocartao, _codigoseguranca, _nomeimpresso, _parcelas, _tipobandeiracartao, _pedidodesktopwap, _valortotal, _mesvalidade, _anovalidade)
			VALUES (bNumeroCartao, iCodSeguranca, sNomeImpresso,iNumParcelas,iBandeiraCart,iCodPedido,dValorTotal, iMesValidade, iAnoValidade);
	Status = 'SUCESSO';
	END IF;
	IF (cTipo = 'E') THEN
	Status = 'SUCESSO';
	END IF;
	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_dadoscartao(character, bigint, integer, character varying, integer, integer, bigint, double precision, integer, integer) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 29343)
-- Dependencies: 5 1101
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
-- TOC entry 542 (class 1255 OID 28416)
-- Dependencies: 5 1101
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

				INSERT INTO Endereco(_cep,_rua,_numero,_caixapostal,_complemento,_bairro,_municipio,_estado,_pais,_nomereceptor,_referenciaentrega,_tipoendereco,_usuario,_celular)
				VALUES (iCep,sRua,iNumero,iCaixaPostal,sComplemento,sBairro,sMunicipio,sEstado,sPais,sNomeReceptor,sReferenciaEntrega,iTipoEndereco,bCodigoObjeto,bEndCelular);
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
-- TOC entry 543 (class 1255 OID 28417)
-- Dependencies: 1101 5
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
-- TOC entry 544 (class 1255 OID 28418)
-- Dependencies: 5 1101
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
-- TOC entry 545 (class 1255 OID 28419)
-- Dependencies: 1101 5
-- Name: operacao_item(bigint, bigint, integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_item(bigint, bigint, integer, double precision, double precision) RETURNS character varying
    AS $_$
DECLARE
	bCodProd		alias for $1;
	bCodPedido  		alias for $2;
	iQuantidade		alias for $3;
	dValorTotal		alias for $4;
	dValorFrete		alias for $5;
	Status 		varchar(30);
BEGIN
	INSERT INTO item(_produto, _pedidodesktopwap, quantidade, valortotal, valorfrete)
			VALUES (bCodProd, bCodPedido, iQuantidade, dValorTotal,dValorFrete);
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_item(bigint, bigint, integer, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 28420)
-- Dependencies: 5 1101
-- Name: operacao_item(bigint, bigint, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_item(bigint, bigint, integer, double precision) RETURNS character varying
    AS $_$
DECLARE
	bCodProd		alias for $1;
	bCodPedido  		alias for $2;
	iQuantidade		alias for $3;
	dValorTotal		alias for $4;
	Status 		varchar(30);
BEGIN
	INSERT INTO item(_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal)
			VALUES ((select nextval('sq_item')), bCodProd, bCodPedido, iQuantidade, dValorTotal);
	Status = 'SUCESSO';
	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_item(bigint, bigint, integer, double precision) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 28421)
-- Dependencies: 5 1101
-- Name: operacao_pedido(character, bigint, integer, integer, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_pedido(character, bigint, integer, integer, double precision, integer) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodUsuario	alias for $2;
	iTipoStatus  	alias for $3;
	iFormaPagto	alias for $4;
	dTotalPedido	alias for $5;
	iQtdParcelas	alias for $6;
	Status 		varchar(30);
BEGIN
	IF(cTipo ='I') THEN
		INSERT INTO pedidodesktopwap(_usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido,_horapedido,_parcelas)
			VALUES (bCodUsuario, iTipoStatus,  iFormaPagto, current_date, dTotalPedido, current_time, iQtdParcelas);
		Status = 'SUCESSO';
	END IF;
	IF(cTipo ='A') THEN
		UPDATE pedidodesktopwap set _horapagamento = current_time,  _datapagamento = current_date;
		Status = 'SUCESSO';
	END IF;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_pedido(character, bigint, integer, integer, double precision, integer) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 28422)
-- Dependencies: 1101 5
-- Name: operacao_pedido(character, bigint, integer, integer, double precision, integer, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_pedido(character, bigint, integer, integer, double precision, integer, bigint) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodUsuario	alias for $2;
	iTipoStatus  	alias for $3;
	iFormaPagto	alias for $4;
	dTotalPedido	alias for $5;
	iQtdParcelas	alias for $6;
	bCodPedido	alias for $7; /* Utilizado somente para alterações*/
	Status 		varchar(30);
BEGIN
	IF(cTipo ='I') THEN
		INSERT INTO pedidodesktopwap(_usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido,_horapedido,_parcelas)
			VALUES (bCodUsuario, iTipoStatus,  iFormaPagto, current_date, dTotalPedido, current_time, iQtdParcelas);
		Status = 'SUCESSO';
	END IF;
	IF(cTipo ='A') THEN
		UPDATE pedidodesktopwap set _horapagamento = current_time,  _datapagamento = current_date WHERE _codigo = bCodPedido;
		Status = 'SUCESSO';
	END IF;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_pedido(character, bigint, integer, integer, double precision, integer, bigint) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 28423)
-- Dependencies: 5 1101
-- Name: operacao_pedidodesktopwap(character, bigint, integer, integer, double precision, integer, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_pedidodesktopwap(character, bigint, integer, integer, double precision, integer, bigint) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodUsuario	alias for $2;
	iTipoStatus  	alias for $3;
	iFormaPagto	alias for $4;
	dTotalPedido	alias for $5;
	iQtdParcelas	alias for $6;
	bCodPedido	alias for $7; /* Utilizado somente para alterações*/
	Status 		varchar(30);
BEGIN
	IF(cTipo ='I') THEN
		INSERT INTO pedidodesktopwap(_usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido,_horapedido,_parcelas)
			VALUES (bCodUsuario, iTipoStatus,  iFormaPagto, current_date, dTotalPedido, current_time, iQtdParcelas);
		Status = 'SUCESSO';
	END IF;
	IF(cTipo ='A') THEN
		UPDATE pedidodesktopwap set _horapagamento = current_time,  _datapagamento = current_date, _tipostatuspedido = iTipoStatus WHERE _codigo = bCodPedido;
		Status = 'SUCESSO';
	END IF;
	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_pedidodesktopwap(character, bigint, integer, integer, double precision, integer, bigint) OWNER TO postgres;

--
-- TOC entry 550 (class 1255 OID 28424)
-- Dependencies: 5 1101
-- Name: operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodPedido	alias for $2; 
	bCodUsuario	alias for $3;
	iTipoStatus  	alias for $4;
	iFormaPagto	alias for $5;
	dTotalPedido	alias for $6;
	iQtdParcelas	alias for $7;
	
	Status 		varchar(30);
BEGIN
	IF(cTipo ='I') THEN
		INSERT INTO pedidodesktopwap(_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido,_horapedido,_parcelas)
			VALUES (bCodPedido, bCodUsuario, iTipoStatus,  iFormaPagto, current_date, dTotalPedido, current_time, iQtdParcelas);
		Status = 'SUCESSO';
	END IF;
	IF(cTipo ='A') THEN
		UPDATE pedidodesktopwap set _horapagamento = current_time,  _datapagamento = current_date, _tipostatuspedido = iTipoStatus WHERE _codigo = bCodPedido;
		Status = 'SUCESSO';
	END IF;
	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 28425)
-- Dependencies: 5 1101
-- Name: operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer, bigint) RETURNS character varying
    AS $_$
DECLARE
	cTipo 		alias for $1;
	bCodPedido	alias for $2; 
	bCodUsuario	alias for $3;
	iTipoStatus  	alias for $4;
	iFormaPagto	alias for $5;
	dTotalPedido	alias for $6;
	iQtdParcelas	alias for $7;
	bCodEndereco	alias for $8;
	
	Status 		varchar(30);
BEGIN
	IF(cTipo ='I') THEN
		INSERT INTO pedidodesktopwap(_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _totalpedido,_horapedido,_parcelas, _codigoendereco)
			VALUES (bCodPedido, bCodUsuario, iTipoStatus,  iFormaPagto, current_date, dTotalPedido, current_time, iQtdParcelas, bCodEndereco);
		Status = 'SUCESSO';
	END IF;
	IF(cTipo ='A') THEN
		UPDATE pedidodesktopwap set _horapagamento = current_time,  _datapagamento = current_date, _tipostatuspedido = iTipoStatus WHERE _codigo = bCodPedido;
		Status = 'SUCESSO';
	END IF;
	RETURN Status;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.operacao_pedidodesktopwap(character, bigint, bigint, integer, integer, double precision, integer, bigint) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 28426)
-- Dependencies: 1101 5
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
-- TOC entry 553 (class 1255 OID 28427)
-- Dependencies: 1101 5
-- Name: operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer) RETURNS character varying
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
	Status 		varchar(30);
BEGIN
	
	IF(cTipo ='I') THEN 

		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN
			Status = 'FRACASSO';	
			RAISE EXCEPTION 'Usuario já Cadastrado';
		ELSE
			INSERT INTO Usuario(_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular)
			VALUES (bCodigo, iTipoUsuario, sNome, bCPF, bRG, sOrgaoEmissor, sNaturalidade, dDataNascimento, sSexo, sEmail, sSenha, iDDD, iTelefonePrincipal, iRamal, iTelefoneOpcional, iFax, iCelular);
			Status = 'SUCESSO';
		END IF;
	END IF; 

	IF (cTipo ='A') THEN 	
		IF((SELECT _codigo FROM Usuario WHERE _codigo = bCodigo) = bCodigo) THEN
			UPDATE Usuario SET _tipousuario = iTipoUsuario, _nome = sNome, _cpf = bCPF, _rg = bRG, _orgaoemissor = sOrgaoEmissor, _naturalidade = sNaturalidade, 
				_datanascimento = dDataNascimento, _sexo = sSexo, _email = sEmail, _senha = sSenha, _ddd = iDDD, _telefoneprincipal = iTelefonePrincipal, _ramal = iRamal, 
				_telefoneopcional = iTelefoneOpcional, _fax = iFax, _celular = iCelular
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


ALTER FUNCTION public.operacao_usuario(character, bigint, integer, text, bigint, bigint, text, text, date, text, text, text, integer, integer, integer, integer, integer, integer) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 28428)
-- Dependencies: 5 1101
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
-- TOC entry 555 (class 1255 OID 28429)
-- Dependencies: 1034 5
-- Name: parse(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(oid, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(oid, text) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 28430)
-- Dependencies: 5 1034
-- Name: parse(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text, text) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 28431)
-- Dependencies: 5 1034
-- Name: parse(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parse(text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.parse(text) OWNER TO postgres;

--
-- TOC entry 719 (class 1255 OID 28432)
-- Dependencies: 5
-- Name: pg_buffercache_pages(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_buffercache_pages() RETURNS SETOF record
    AS '$libdir/pg_buffercache', 'pg_buffercache_pages'
    LANGUAGE c;


ALTER FUNCTION public.pg_buffercache_pages() OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 28433)
-- Dependencies: 5
-- Name: pg_freespacemap_pages(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_freespacemap_pages() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_pages'
    LANGUAGE c;


ALTER FUNCTION public.pg_freespacemap_pages() OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 28434)
-- Dependencies: 5
-- Name: pg_freespacemap_relations(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_freespacemap_relations() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_relations'
    LANGUAGE c;


ALTER FUNCTION public.pg_freespacemap_relations() OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 28435)
-- Dependencies: 5
-- Name: pgp_key_id(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_key_id(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_key_id_w'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_key_id(bytea) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 28436)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 28437)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 28438)
-- Dependencies: 5
-- Name: pgp_pub_decrypt(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt(bytea, bytea, text, text) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 28439)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 28440)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 28441)
-- Dependencies: 5
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text, text) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 28442)
-- Dependencies: 5
-- Name: pgp_pub_encrypt(text, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt(text, bytea) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 28443)
-- Dependencies: 5
-- Name: pgp_pub_encrypt(text, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt(text, bytea, text) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 28444)
-- Dependencies: 5
-- Name: pgp_pub_encrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 28445)
-- Dependencies: 5
-- Name: pgp_pub_encrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea, text) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 28446)
-- Dependencies: 5
-- Name: pgp_sym_decrypt(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt(bytea, text) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 28447)
-- Dependencies: 5
-- Name: pgp_sym_decrypt(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 28448)
-- Dependencies: 5
-- Name: pgp_sym_decrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt_bytea(bytea, text) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 28449)
-- Dependencies: 5
-- Name: pgp_sym_decrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pgp_sym_decrypt_bytea(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 28450)
-- Dependencies: 5
-- Name: pgp_sym_encrypt(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt(text, text) OWNER TO postgres;

--
-- TOC entry 574 (class 1255 OID 28451)
-- Dependencies: 5
-- Name: pgp_sym_encrypt(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt(text, text, text) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 28452)
-- Dependencies: 5
-- Name: pgp_sym_encrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt_bytea(bytea, text) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 28453)
-- Dependencies: 5
-- Name: pgp_sym_encrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


ALTER FUNCTION public.pgp_sym_encrypt_bytea(bytea, text, text) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 28454)
-- Dependencies: 5 1016
-- Name: plainto_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 28455)
-- Dependencies: 1016 5
-- Name: plainto_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 28456)
-- Dependencies: 1016 5
-- Name: plainto_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION plainto_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.plainto_tsquery(text) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 28457)
-- Dependencies: 5
-- Name: prsd_end(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_end(internal) RETURNS void
    AS '$libdir/tsearch2', 'prsd_end'
    LANGUAGE c;


ALTER FUNCTION public.prsd_end(internal) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 28458)
-- Dependencies: 5
-- Name: prsd_getlexeme(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_getlexeme(internal, internal, internal) RETURNS integer
    AS '$libdir/tsearch2', 'prsd_getlexeme'
    LANGUAGE c;


ALTER FUNCTION public.prsd_getlexeme(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 28459)
-- Dependencies: 5
-- Name: prsd_headline(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_headline(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_headline'
    LANGUAGE c;


ALTER FUNCTION public.prsd_headline(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 28460)
-- Dependencies: 5
-- Name: prsd_lextype(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_lextype(internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_lextype'
    LANGUAGE c;


ALTER FUNCTION public.prsd_lextype(internal) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 28461)
-- Dependencies: 5
-- Name: prsd_start(internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION prsd_start(internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_start'
    LANGUAGE c;


ALTER FUNCTION public.prsd_start(internal, integer) OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 28462)
-- Dependencies: 1010 5
-- Name: querytree(query_int); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION querytree(query_int) RETURNS text
    AS '$libdir/_int', 'querytree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.querytree(query_int) OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 28463)
-- Dependencies: 1016 5
-- Name: querytree(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION querytree(tsquery) RETURNS text
    AS '$libdir/tsearch2', 'tsquerytree'
    LANGUAGE c STRICT;


ALTER FUNCTION public.querytree(tsquery) OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 28464)
-- Dependencies: 1019 5 1016
-- Name: rank(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 28465)
-- Dependencies: 1016 5 1019
-- Name: rank(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 28466)
-- Dependencies: 1019 5 1016
-- Name: rank(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 28467)
-- Dependencies: 1019 1016 5
-- Name: rank(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 28468)
-- Dependencies: 1019 1016 5
-- Name: rank_cd(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 28469)
-- Dependencies: 1019 5 1016
-- Name: rank_cd(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(real[], tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 28470)
-- Dependencies: 1019 5 1016
-- Name: rank_cd(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 28471)
-- Dependencies: 5 1019 1016
-- Name: rank_cd(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rank_cd(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rank_cd(tsvector, tsquery, integer) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 28472)
-- Dependencies: 5 1010
-- Name: rboolop(query_int, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rboolop(query_int, integer[]) RETURNS boolean
    AS '$libdir/_int', 'rboolop'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rboolop(query_int, integer[]) OWNER TO postgres;

--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 595
-- Name: FUNCTION rboolop(query_int, integer[]); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION rboolop(query_int, integer[]) IS 'boolean operation with array';


--
-- TOC entry 596 (class 1255 OID 28473)
-- Dependencies: 5
-- Name: reset_tsearch(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reset_tsearch() RETURNS void
    AS '$libdir/tsearch2', 'reset_tsearch'
    LANGUAGE c STRICT;


ALTER FUNCTION public.reset_tsearch() OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 28474)
-- Dependencies: 5 1016 1016
-- Name: rewrite(tsquery, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, text) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 28475)
-- Dependencies: 5 1016 1016 1016 1016
-- Name: rewrite(tsquery, tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite(tsquery, tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite_query'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rewrite(tsquery, tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 28476)
-- Dependencies: 1016 5 1018 1016
-- Name: rewrite_accum(tsquery, tsquery[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_accum(tsquery, tsquery[]) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_accum'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_accum(tsquery, tsquery[]) OWNER TO postgres;

--
-- TOC entry 600 (class 1255 OID 28477)
-- Dependencies: 5 1016 1016
-- Name: rewrite_finish(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rewrite_finish(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_finish'
    LANGUAGE c;


ALTER FUNCTION public.rewrite_finish(tsquery) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 28478)
-- Dependencies: 1016 1019 5
-- Name: rexectsq(tsquery, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rexectsq(tsquery, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'rexectsq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.rexectsq(tsquery, tsvector) OWNER TO postgres;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 601
-- Name: FUNCTION rexectsq(tsquery, tsvector); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION rexectsq(tsquery, tsvector) IS 'boolean operation with text index';


--
-- TOC entry 602 (class 1255 OID 28479)
-- Dependencies: 5
-- Name: sec_to_gc(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sec_to_gc(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/(2*earth()) > 1 THEN pi()*earth() ELSE 2*earth()*asin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.sec_to_gc(double precision) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 28480)
-- Dependencies: 1013 1013 5
-- Name: seg_cmp(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_cmp(seg, seg) RETURNS integer
    AS '$libdir/seg', 'seg_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_cmp(seg, seg) OWNER TO postgres;

--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 603
-- Name: FUNCTION seg_cmp(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_cmp(seg, seg) IS 'btree comparison function';


--
-- TOC entry 604 (class 1255 OID 28481)
-- Dependencies: 1013 5 1013
-- Name: seg_contained(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_contained(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_contained(seg, seg) OWNER TO postgres;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 604
-- Name: FUNCTION seg_contained(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_contained(seg, seg) IS 'contained in';


--
-- TOC entry 605 (class 1255 OID 28482)
-- Dependencies: 1013 5 1013
-- Name: seg_contains(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_contains(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_contains(seg, seg) OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 605
-- Name: FUNCTION seg_contains(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_contains(seg, seg) IS 'contains';


--
-- TOC entry 606 (class 1255 OID 28483)
-- Dependencies: 1013 1013 5
-- Name: seg_different(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_different(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_different'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_different(seg, seg) OWNER TO postgres;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 606
-- Name: FUNCTION seg_different(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_different(seg, seg) IS 'different';


--
-- TOC entry 607 (class 1255 OID 28484)
-- Dependencies: 1013 5 1013
-- Name: seg_ge(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_ge(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_ge(seg, seg) OWNER TO postgres;

--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 607
-- Name: FUNCTION seg_ge(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_ge(seg, seg) IS 'greater than or equal';


--
-- TOC entry 608 (class 1255 OID 28485)
-- Dependencies: 1013 5 1013
-- Name: seg_gt(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_gt(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_gt(seg, seg) OWNER TO postgres;

--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 608
-- Name: FUNCTION seg_gt(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_gt(seg, seg) IS 'greater than';


--
-- TOC entry 609 (class 1255 OID 28486)
-- Dependencies: 1013 5 1013 1013
-- Name: seg_inter(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_inter(seg, seg) RETURNS seg
    AS '$libdir/seg', 'seg_inter'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_inter(seg, seg) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 28487)
-- Dependencies: 1013 5 1013
-- Name: seg_le(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_le(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_le(seg, seg) OWNER TO postgres;

--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 610
-- Name: FUNCTION seg_le(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_le(seg, seg) IS 'less than or equal';


--
-- TOC entry 611 (class 1255 OID 28488)
-- Dependencies: 1013 5 1013
-- Name: seg_left(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_left(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_left(seg, seg) OWNER TO postgres;

--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 611
-- Name: FUNCTION seg_left(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_left(seg, seg) IS 'is left of';


--
-- TOC entry 612 (class 1255 OID 28489)
-- Dependencies: 5 1013
-- Name: seg_lower(seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_lower(seg) RETURNS real
    AS '$libdir/seg', 'seg_lower'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_lower(seg) OWNER TO postgres;

--
-- TOC entry 613 (class 1255 OID 28490)
-- Dependencies: 1013 1013 5
-- Name: seg_lt(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_lt(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_lt(seg, seg) OWNER TO postgres;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 613
-- Name: FUNCTION seg_lt(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_lt(seg, seg) IS 'less than';


--
-- TOC entry 614 (class 1255 OID 28491)
-- Dependencies: 1013 1013 5
-- Name: seg_over_left(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_over_left(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_over_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_over_left(seg, seg) OWNER TO postgres;

--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 614
-- Name: FUNCTION seg_over_left(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_over_left(seg, seg) IS 'overlaps or is left of';


--
-- TOC entry 615 (class 1255 OID 28492)
-- Dependencies: 5 1013 1013
-- Name: seg_over_right(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_over_right(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_over_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_over_right(seg, seg) OWNER TO postgres;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 615
-- Name: FUNCTION seg_over_right(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_over_right(seg, seg) IS 'overlaps or is right of';


--
-- TOC entry 616 (class 1255 OID 28493)
-- Dependencies: 1013 1013 5
-- Name: seg_overlap(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_overlap(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_overlap(seg, seg) OWNER TO postgres;

--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 616
-- Name: FUNCTION seg_overlap(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_overlap(seg, seg) IS 'overlaps';


--
-- TOC entry 617 (class 1255 OID 28494)
-- Dependencies: 1013 5 1013
-- Name: seg_right(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_right(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_right(seg, seg) OWNER TO postgres;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 617
-- Name: FUNCTION seg_right(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_right(seg, seg) IS 'is right of';


--
-- TOC entry 618 (class 1255 OID 28495)
-- Dependencies: 1013 5 1013
-- Name: seg_same(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_same(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_same(seg, seg) OWNER TO postgres;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 618
-- Name: FUNCTION seg_same(seg, seg); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION seg_same(seg, seg) IS 'same as';


--
-- TOC entry 619 (class 1255 OID 28496)
-- Dependencies: 5 1013
-- Name: seg_size(seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_size(seg) RETURNS real
    AS '$libdir/seg', 'seg_size'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_size(seg) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 28497)
-- Dependencies: 5 1013 1013 1013
-- Name: seg_union(seg, seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_union(seg, seg) RETURNS seg
    AS '$libdir/seg', 'seg_union'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_union(seg, seg) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 28498)
-- Dependencies: 5 1013
-- Name: seg_upper(seg); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION seg_upper(seg) RETURNS real
    AS '$libdir/seg', 'seg_upper'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.seg_upper(seg) OWNER TO postgres;

--
-- TOC entry 622 (class 1255 OID 28499)
-- Dependencies: 5
-- Name: set_curcfg(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(integer) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 28500)
-- Dependencies: 5
-- Name: set_curcfg(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curcfg(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curcfg(text) OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 28501)
-- Dependencies: 5
-- Name: set_curdict(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(integer) OWNER TO postgres;

--
-- TOC entry 625 (class 1255 OID 28502)
-- Dependencies: 5
-- Name: set_curdict(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curdict(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curdict(text) OWNER TO postgres;

--
-- TOC entry 626 (class 1255 OID 28503)
-- Dependencies: 5
-- Name: set_curprs(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(integer) OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 28504)
-- Dependencies: 5
-- Name: set_curprs(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_curprs(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_curprs(text) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 28505)
-- Dependencies: 5
-- Name: set_timetravel(name, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION set_timetravel(name, integer) RETURNS integer
    AS '$libdir/timetravel', 'set_timetravel'
    LANGUAGE c STRICT;


ALTER FUNCTION public.set_timetravel(name, integer) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 28506)
-- Dependencies: 5 1019 1019
-- Name: setweight(tsvector, "char"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setweight(tsvector, "char") RETURNS tsvector
    AS '$libdir/tsearch2', 'setweight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setweight(tsvector, "char") OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 28507)
-- Dependencies: 5
-- Name: show_curcfg(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION show_curcfg() RETURNS oid
    AS '$libdir/tsearch2', 'show_curcfg'
    LANGUAGE c STRICT;


ALTER FUNCTION public.show_curcfg() OWNER TO postgres;

--
-- TOC entry 631 (class 1255 OID 28508)
-- Dependencies: 5
-- Name: snb_en_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_en_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_en_init'
    LANGUAGE c;


ALTER FUNCTION public.snb_en_init(internal) OWNER TO postgres;

--
-- TOC entry 632 (class 1255 OID 28509)
-- Dependencies: 5
-- Name: snb_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'snb_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.snb_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 28510)
-- Dependencies: 5
-- Name: snb_ru_init_koi8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_koi8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_koi8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_koi8(internal) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 28511)
-- Dependencies: 5
-- Name: snb_ru_init_utf8(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snb_ru_init_utf8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_utf8'
    LANGUAGE c;


ALTER FUNCTION public.snb_ru_init_utf8(internal) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 28512)
-- Dependencies: 5
-- Name: sort(integer[], text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort(integer[], text) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[], text) OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 28513)
-- Dependencies: 5
-- Name: sort(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort(integer[]) OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 28514)
-- Dependencies: 5
-- Name: sort_asc(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort_asc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_asc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_asc(integer[]) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 28515)
-- Dependencies: 5
-- Name: sort_desc(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sort_desc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_desc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.sort_desc(integer[]) OWNER TO postgres;

--
-- TOC entry 639 (class 1255 OID 28516)
-- Dependencies: 5
-- Name: soundex(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION soundex(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'soundex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.soundex(text) OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 28517)
-- Dependencies: 5
-- Name: spell_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'spell_init'
    LANGUAGE c;


ALTER FUNCTION public.spell_init(internal) OWNER TO postgres;

--
-- TOC entry 641 (class 1255 OID 28518)
-- Dependencies: 5
-- Name: spell_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spell_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'spell_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.spell_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 28519)
-- Dependencies: 5
-- Name: ssl_client_cert_present(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_cert_present() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_client_cert_present'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_cert_present() OWNER TO postgres;

--
-- TOC entry 643 (class 1255 OID 28520)
-- Dependencies: 5
-- Name: ssl_client_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn() OWNER TO postgres;

--
-- TOC entry 644 (class 1255 OID 28521)
-- Dependencies: 5
-- Name: ssl_client_dn_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_dn_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_dn_field(text) OWNER TO postgres;

--
-- TOC entry 645 (class 1255 OID 28522)
-- Dependencies: 5
-- Name: ssl_client_serial(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_client_serial() RETURNS numeric
    AS '$libdir/sslinfo', 'ssl_client_serial'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_client_serial() OWNER TO postgres;

--
-- TOC entry 646 (class 1255 OID 28523)
-- Dependencies: 5
-- Name: ssl_is_used(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_is_used() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_is_used'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_is_used() OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 28524)
-- Dependencies: 5
-- Name: ssl_issuer_dn(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_dn'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_dn() OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 28525)
-- Dependencies: 5
-- Name: ssl_issuer_field(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ssl_issuer_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_field'
    LANGUAGE c STRICT;


ALTER FUNCTION public.ssl_issuer_field(text) OWNER TO postgres;

--
-- TOC entry 649 (class 1255 OID 28526)
-- Dependencies: 1030 5
-- Name: stat(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text) OWNER TO postgres;

--
-- TOC entry 650 (class 1255 OID 28527)
-- Dependencies: 5 1030
-- Name: stat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION stat(text, text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


ALTER FUNCTION public.stat(text, text) OWNER TO postgres;

--
-- TOC entry 651 (class 1255 OID 28528)
-- Dependencies: 5 1019 1019
-- Name: strip(tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION strip(tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'strip'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.strip(tsvector) OWNER TO postgres;

--
-- TOC entry 652 (class 1255 OID 28529)
-- Dependencies: 5
-- Name: subarray(integer[], integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subarray(integer[], integer, integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer, integer) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 28530)
-- Dependencies: 5
-- Name: subarray(integer[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subarray(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subarray(integer[], integer) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 28531)
-- Dependencies: 1001 1001 5
-- Name: subltree(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subltree(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subltree(ltree, integer, integer) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 28532)
-- Dependencies: 5 1001 1001
-- Name: subpath(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subpath(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subpath(ltree, integer, integer) OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 28533)
-- Dependencies: 5 1001 1001
-- Name: subpath(ltree, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION subpath(ltree, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.subpath(ltree, integer) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 28534)
-- Dependencies: 5
-- Name: syn_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'syn_init'
    LANGUAGE c;


ALTER FUNCTION public.syn_init(internal) OWNER TO postgres;

--
-- TOC entry 658 (class 1255 OID 28535)
-- Dependencies: 5
-- Name: syn_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION syn_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'syn_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.syn_lexize(internal, internal, integer) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 28536)
-- Dependencies: 5 968
-- Name: text(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ean13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ean13) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 28537)
-- Dependencies: 5 983
-- Name: text(isbn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(isbn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(isbn13) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 28538)
-- Dependencies: 989 5
-- Name: text(ismn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ismn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ismn13) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 28539)
-- Dependencies: 995 5
-- Name: text(issn13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(issn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(issn13) OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 28540)
-- Dependencies: 980 5
-- Name: text(isbn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(isbn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(isbn) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 28541)
-- Dependencies: 986 5
-- Name: text(ismn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(ismn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(ismn) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 28542)
-- Dependencies: 992 5
-- Name: text(issn); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(issn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(issn) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 28543)
-- Dependencies: 1022 5
-- Name: text(upc); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(upc) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(upc) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 28544)
-- Dependencies: 5 1001
-- Name: text2ltree(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text2ltree(text) RETURNS ltree
    AS '$libdir/ltree', 'text2ltree'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text2ltree(text) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 28545)
-- Dependencies: 5
-- Name: text_soundex(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text_soundex(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'soundex'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text_soundex(text) OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 28546)
-- Dependencies: 5
-- Name: thesaurus_init(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_init'
    LANGUAGE c;


ALTER FUNCTION public.thesaurus_init(internal) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 28547)
-- Dependencies: 5
-- Name: thesaurus_lexize(internal, internal, integer, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION thesaurus_lexize(internal, internal, integer, internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_lexize'
    LANGUAGE c STRICT;


ALTER FUNCTION public.thesaurus_lexize(internal, internal, integer, internal) OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 28548)
-- Dependencies: 5
-- Name: timetravel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION timetravel() RETURNS "trigger"
    AS '$libdir/timetravel', 'timetravel'
    LANGUAGE c;


ALTER FUNCTION public.timetravel() OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 28549)
-- Dependencies: 1016 5
-- Name: to_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(oid, text) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 28550)
-- Dependencies: 1016 5
-- Name: to_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text, text) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 28551)
-- Dependencies: 1016 5
-- Name: to_tsquery(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsquery(text) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 28552)
-- Dependencies: 5 1019
-- Name: to_tsvector(oid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(oid, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(oid, text) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 28553)
-- Dependencies: 5 1019
-- Name: to_tsvector(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_name'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text, text) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 28554)
-- Dependencies: 5 1019
-- Name: to_tsvector(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION to_tsvector(text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_current'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.to_tsvector(text) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 28555)
-- Dependencies: 1035 5
-- Name: token_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(integer) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(integer) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 28556)
-- Dependencies: 1035 5
-- Name: token_type(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type(text) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_byname'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type(text) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 28557)
-- Dependencies: 5 1035
-- Name: token_type(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION token_type() RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_current'
    LANGUAGE c STRICT;


ALTER FUNCTION public.token_type() OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 28558)
-- Dependencies: 5 1036
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
-- TOC entry 682 (class 1255 OID 28559)
-- Dependencies: 5
-- Name: tsearch2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsearch2() RETURNS "trigger"
    AS '$libdir/tsearch2', 'tsearch2'
    LANGUAGE c;


ALTER FUNCTION public.tsearch2() OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 28560)
-- Dependencies: 5 1016 1016
-- Name: tsq_mcontained(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontained(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontained(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 28561)
-- Dependencies: 5 1016 1016
-- Name: tsq_mcontains(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsq_mcontains(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsq_mcontains(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 685 (class 1255 OID 28562)
-- Dependencies: 1016 5 1016 1016
-- Name: tsquery_and(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_and(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_and'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_and(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 28563)
-- Dependencies: 1016 5 1016
-- Name: tsquery_cmp(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_cmp(tsquery, tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_cmp(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 28564)
-- Dependencies: 5 1016 1016
-- Name: tsquery_eq(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_eq(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_eq(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 28565)
-- Dependencies: 1016 5 1016
-- Name: tsquery_ge(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ge(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ge(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 28566)
-- Dependencies: 1016 5 1016
-- Name: tsquery_gt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_gt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_gt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 690 (class 1255 OID 28567)
-- Dependencies: 1016 1016 5
-- Name: tsquery_le(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_le(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_le(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 691 (class 1255 OID 28568)
-- Dependencies: 1016 5 1016
-- Name: tsquery_lt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_lt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_lt(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 28569)
-- Dependencies: 1016 1016 5
-- Name: tsquery_ne(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_ne(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_ne(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 693 (class 1255 OID 28570)
-- Dependencies: 5 1016 1016
-- Name: tsquery_not(tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_not(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_not'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_not(tsquery) OWNER TO postgres;

--
-- TOC entry 694 (class 1255 OID 28571)
-- Dependencies: 1016 1016 5 1016
-- Name: tsquery_or(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsquery_or(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_or'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsquery_or(tsquery, tsquery) OWNER TO postgres;

--
-- TOC entry 695 (class 1255 OID 28572)
-- Dependencies: 1019 5 1019
-- Name: tsvector_cmp(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_cmp(tsvector, tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_cmp(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 28573)
-- Dependencies: 1019 5 1019
-- Name: tsvector_eq(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_eq(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_eq(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 28574)
-- Dependencies: 1019 1019 5
-- Name: tsvector_ge(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ge(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ge(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 28575)
-- Dependencies: 1019 1019 5
-- Name: tsvector_gt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_gt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_gt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 699 (class 1255 OID 28576)
-- Dependencies: 5 1019 1019
-- Name: tsvector_le(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_le(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_le(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 700 (class 1255 OID 28577)
-- Dependencies: 5 1019 1019
-- Name: tsvector_lt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_lt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_lt(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 701 (class 1255 OID 28578)
-- Dependencies: 1019 1019 5
-- Name: tsvector_ne(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tsvector_ne(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ne'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.tsvector_ne(tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 28579)
-- Dependencies: 5
-- Name: uniq(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION uniq(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'uniq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.uniq(integer[]) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 28580)
-- Dependencies: 1022 968 5
-- Name: upc(ean13); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc(ean13) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc(ean13) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 28581)
-- Dependencies: 1022 5
-- Name: upc(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upc(text) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.upc(text) OWNER TO postgres;

--
-- TOC entry 705 (class 1255 OID 28582)
-- Dependencies: 5
-- Name: xml_encode_special_chars(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_encode_special_chars(text) RETURNS text
    AS '$libdir/pgxml', 'xml_encode_special_chars'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_encode_special_chars(text) OWNER TO postgres;

--
-- TOC entry 706 (class 1255 OID 28583)
-- Dependencies: 5
-- Name: xml_is_well_formed(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_is_well_formed(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_is_well_formed(text) OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 28584)
-- Dependencies: 5
-- Name: xml_valid(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xml_valid(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xml_valid(text) OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 28585)
-- Dependencies: 5
-- Name: xpath_bool(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_bool(text, text) RETURNS boolean
    AS '$libdir/pgxml', 'xpath_bool'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_bool(text, text) OWNER TO postgres;

--
-- TOC entry 709 (class 1255 OID 28586)
-- Dependencies: 5
-- Name: xpath_list(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_list'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text, text) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 28587)
-- Dependencies: 5
-- Name: xpath_list(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_list(text, text) RETURNS text
    AS $_$SELECT xpath_list($1,$2,',')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_list(text, text) OWNER TO postgres;

--
-- TOC entry 711 (class 1255 OID 28588)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_nodeset'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text, text) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 28589)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'','')$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text) OWNER TO postgres;

--
-- TOC entry 713 (class 1255 OID 28590)
-- Dependencies: 5
-- Name: xpath_nodeset(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_nodeset(text, text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'',$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_nodeset(text, text, text) OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 28591)
-- Dependencies: 5
-- Name: xpath_number(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_number(text, text) RETURNS real
    AS '$libdir/pgxml', 'xpath_number'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_number(text, text) OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 28592)
-- Dependencies: 5
-- Name: xpath_string(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_string(text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_string'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xpath_string(text, text) OWNER TO postgres;

--
-- TOC entry 716 (class 1255 OID 28593)
-- Dependencies: 5
-- Name: xpath_table(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xpath_table(text, text, text, text, text) RETURNS SETOF record
    AS '$libdir/pgxml', 'xpath_table'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.xpath_table(text, text, text, text, text) OWNER TO postgres;

--
-- TOC entry 717 (class 1255 OID 28594)
-- Dependencies: 5
-- Name: xslt_process(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c STRICT;


ALTER FUNCTION public.xslt_process(text, text, text) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 28595)
-- Dependencies: 5
-- Name: xslt_process(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xslt_process(text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xslt_process(text, text) OWNER TO postgres;

--
-- TOC entry 1102 (class 1255 OID 28596)
-- Dependencies: 284 285 5
-- Name: int_array_aggregate(integer); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE int_array_aggregate(integer) (
    SFUNC = int_agg_state,
    STYPE = integer[],
    FINALFUNC = int_agg_final_array
);


ALTER AGGREGATE public.int_array_aggregate(integer) OWNER TO postgres;

--
-- TOC entry 1103 (class 1255 OID 28597)
-- Dependencies: 5 600 599 1018 1016
-- Name: rewrite(tsquery[]); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE rewrite(tsquery[]) (
    SFUNC = rewrite_accum,
    STYPE = tsquery,
    FINALFUNC = rewrite_finish
);


ALTER AGGREGATE public.rewrite(tsquery[]) OWNER TO postgres;

--
-- TOC entry 1770 (class 2617 OID 28598)
-- Dependencies: 1016 693 1016 5
-- Name: !!; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR !! (
    PROCEDURE = tsquery_not,
    RIGHTARG = tsquery
);


ALTER OPERATOR public.!! (NONE, tsquery) OWNER TO postgres;

--
-- TOC entry 1771 (class 2617 OID 28599)
-- Dependencies: 279 5
-- Name: #; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR # (
    PROCEDURE = icount,
    RIGHTARG = integer[]
);


ALTER OPERATOR public.# (NONE, integer[]) OWNER TO postgres;

--
-- TOC entry 1772 (class 2617 OID 28600)
-- Dependencies: 5 280
-- Name: #; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR # (
    PROCEDURE = idx,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.# (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1773 (class 2617 OID 28601)
-- Dependencies: 5 67
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
-- TOC entry 1774 (class 2617 OID 28602)
-- Dependencies: 956 152 5 956
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
-- TOC entry 1775 (class 2617 OID 28603)
-- Dependencies: 5 68
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
-- TOC entry 1776 (class 2617 OID 28604)
-- Dependencies: 1016 1016 685 5 1016
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
-- TOC entry 1777 (class 2617 OID 28605)
-- Dependencies: 1013 616 1013 5
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = seg_overlap,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = &&,
    RESTRICT = areasel,
    JOIN = areajoinsel
);


ALTER OPERATOR public.&& (seg, seg) OWNER TO postgres;

--
-- TOC entry 1778 (class 2617 OID 28606)
-- Dependencies: 1013 614 5 1013
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = seg_over_left,
    LEFTARG = seg,
    RIGHTARG = seg,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (seg, seg) OWNER TO postgres;

--
-- TOC entry 1779 (class 2617 OID 28607)
-- Dependencies: 1013 615 5 1013
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = seg_over_right,
    LEFTARG = seg,
    RIGHTARG = seg,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (seg, seg) OWNER TO postgres;

--
-- TOC entry 1780 (class 2617 OID 28608)
-- Dependencies: 5 289
-- Name: +; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.+ (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1781 (class 2617 OID 28609)
-- Dependencies: 5 288
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
-- TOC entry 1782 (class 2617 OID 28610)
-- Dependencies: 287 5
-- Name: -; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR - (
    PROCEDURE = intarray_del_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.- (integer[], integer) OWNER TO postgres;

--
-- TOC entry 1783 (class 2617 OID 28611)
-- Dependencies: 291 5
-- Name: -; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR - (
    PROCEDURE = intset_subtract,
    LEFTARG = integer[],
    RIGHTARG = integer[]
);


ALTER OPERATOR public.- (integer[], integer[]) OWNER TO postgres;

--
-- TOC entry 1784 (class 2617 OID 28614)
-- Dependencies: 956 5 956 150
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
-- TOC entry 1785 (class 2617 OID 28617)
-- Dependencies: 968 423 5 968
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
-- TOC entry 1786 (class 2617 OID 28620)
-- Dependencies: 424 5 983 968
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
-- TOC entry 1787 (class 2617 OID 28623)
-- Dependencies: 983 433 5 968
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
-- TOC entry 1788 (class 2617 OID 28626)
-- Dependencies: 968 425 5 989
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
-- TOC entry 1789 (class 2617 OID 28629)
-- Dependencies: 5 989 968 439
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
-- TOC entry 1790 (class 2617 OID 28632)
-- Dependencies: 5 426 995 968
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
-- TOC entry 1791 (class 2617 OID 28635)
-- Dependencies: 445 995 968 5
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
-- TOC entry 1792 (class 2617 OID 28638)
-- Dependencies: 427 5 968 980
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
-- TOC entry 1793 (class 2617 OID 28641)
-- Dependencies: 5 436 968 980
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
-- TOC entry 1794 (class 2617 OID 28644)
-- Dependencies: 968 428 986 5
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
-- TOC entry 1795 (class 2617 OID 28647)
-- Dependencies: 442 5 968 986
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
-- TOC entry 1796 (class 2617 OID 28650)
-- Dependencies: 992 5 968 429
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
-- TOC entry 1797 (class 2617 OID 28653)
-- Dependencies: 448 968 992 5
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
-- TOC entry 1798 (class 2617 OID 28656)
-- Dependencies: 1022 5 968 430
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
-- TOC entry 1799 (class 2617 OID 28659)
-- Dependencies: 450 5 1022 968
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
-- TOC entry 1800 (class 2617 OID 28662)
-- Dependencies: 5 431 983 983
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
-- TOC entry 1801 (class 2617 OID 28665)
-- Dependencies: 5 983 980 432
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
-- TOC entry 1802 (class 2617 OID 28668)
-- Dependencies: 435 980 983 5
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
-- TOC entry 1803 (class 2617 OID 28671)
-- Dependencies: 5 980 980 434
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
-- TOC entry 1804 (class 2617 OID 28674)
-- Dependencies: 5 989 989 437
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
-- TOC entry 1805 (class 2617 OID 28677)
-- Dependencies: 986 989 438 5
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
-- TOC entry 1806 (class 2617 OID 28680)
-- Dependencies: 441 986 989 5
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
-- TOC entry 1807 (class 2617 OID 28683)
-- Dependencies: 5 986 986 440
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
-- TOC entry 1808 (class 2617 OID 28686)
-- Dependencies: 5 995 995 443
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
-- TOC entry 1809 (class 2617 OID 28689)
-- Dependencies: 444 992 995 5
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
-- TOC entry 1810 (class 2617 OID 28692)
-- Dependencies: 5 447 995 992
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
-- TOC entry 1811 (class 2617 OID 28695)
-- Dependencies: 992 5 446 992
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
-- TOC entry 1812 (class 2617 OID 28698)
-- Dependencies: 1022 449 5 1022
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
-- TOC entry 1813 (class 2617 OID 28701)
-- Dependencies: 1019 700 5 1019
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
-- TOC entry 1814 (class 2617 OID 28704)
-- Dependencies: 691 1016 1016 5
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
-- TOC entry 1815 (class 2617 OID 28707)
-- Dependencies: 1001 515 5 1001
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = ltree_lt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1816 (class 2617 OID 28710)
-- Dependencies: 1013 613 5 1013
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = seg_lt,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.< (seg, seg) OWNER TO postgres;

--
-- TOC entry 1817 (class 2617 OID 28712)
-- Dependencies: 1013 611 5 1013
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = seg_left,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (seg, seg) OWNER TO postgres;

--
-- TOC entry 1818 (class 2617 OID 28713)
-- Dependencies: 956 148 5 956
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
-- TOC entry 1819 (class 2617 OID 28714)
-- Dependencies: 5 395 968 968
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
-- TOC entry 1820 (class 2617 OID 28715)
-- Dependencies: 396 983 968 5
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
-- TOC entry 1821 (class 2617 OID 28716)
-- Dependencies: 5 405 968 983
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
-- TOC entry 1822 (class 2617 OID 28717)
-- Dependencies: 397 989 968 5
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
-- TOC entry 1823 (class 2617 OID 28718)
-- Dependencies: 411 968 989 5
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
-- TOC entry 1824 (class 2617 OID 28719)
-- Dependencies: 398 968 5 995
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
-- TOC entry 1825 (class 2617 OID 28720)
-- Dependencies: 5 995 968 417
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
-- TOC entry 1826 (class 2617 OID 28721)
-- Dependencies: 5 968 980 399
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
-- TOC entry 1827 (class 2617 OID 28722)
-- Dependencies: 408 5 980 968
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
-- TOC entry 1828 (class 2617 OID 28723)
-- Dependencies: 400 5 968 986
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
-- TOC entry 1829 (class 2617 OID 28724)
-- Dependencies: 986 5 968 414
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
-- TOC entry 1830 (class 2617 OID 28725)
-- Dependencies: 5 968 992 401
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
-- TOC entry 1831 (class 2617 OID 28726)
-- Dependencies: 968 992 5 420
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
-- TOC entry 1832 (class 2617 OID 28727)
-- Dependencies: 402 968 5 1022
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
-- TOC entry 1833 (class 2617 OID 28728)
-- Dependencies: 968 1022 5 422
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
-- TOC entry 1834 (class 2617 OID 28729)
-- Dependencies: 5 983 983 403
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
-- TOC entry 1835 (class 2617 OID 28730)
-- Dependencies: 5 983 980 404
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
-- TOC entry 1836 (class 2617 OID 28731)
-- Dependencies: 5 980 983 407
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
-- TOC entry 1837 (class 2617 OID 28732)
-- Dependencies: 5 980 980 406
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
-- TOC entry 1838 (class 2617 OID 28733)
-- Dependencies: 5 989 989 409
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
-- TOC entry 1839 (class 2617 OID 28734)
-- Dependencies: 5 410 986 989
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
-- TOC entry 1840 (class 2617 OID 28735)
-- Dependencies: 5 986 989 413
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
-- TOC entry 1841 (class 2617 OID 28736)
-- Dependencies: 5 986 412 986
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
-- TOC entry 1842 (class 2617 OID 28737)
-- Dependencies: 5 415 995 995
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
-- TOC entry 1843 (class 2617 OID 28738)
-- Dependencies: 5 416 992 995
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
-- TOC entry 1844 (class 2617 OID 28739)
-- Dependencies: 5 419 995 992
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
-- TOC entry 1845 (class 2617 OID 28740)
-- Dependencies: 5 418 992 992
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
-- TOC entry 1846 (class 2617 OID 28741)
-- Dependencies: 1022 1022 421 5
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
-- TOC entry 1847 (class 2617 OID 28742)
-- Dependencies: 5 699 1019 1019
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
-- TOC entry 1848 (class 2617 OID 28743)
-- Dependencies: 5 1016 1016 690
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
-- TOC entry 1849 (class 2617 OID 28744)
-- Dependencies: 1001 514 1001 5
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = ltree_le,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1850 (class 2617 OID 28745)
-- Dependencies: 610 5 1013 1013
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = seg_le,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


ALTER OPERATOR public.<= (seg, seg) OWNER TO postgres;

--
-- TOC entry 1851 (class 2617 OID 28747)
-- Dependencies: 151 956 5 956
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
-- TOC entry 1852 (class 2617 OID 28749)
-- Dependencies: 5 968 968 451
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
-- TOC entry 1854 (class 2617 OID 28750)
-- Dependencies: 968 5 983 461
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
-- TOC entry 1853 (class 2617 OID 28752)
-- Dependencies: 968 452 5 983
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
-- TOC entry 1856 (class 2617 OID 28754)
-- Dependencies: 5 968 467 989
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
-- TOC entry 1855 (class 2617 OID 28756)
-- Dependencies: 968 989 453 5
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
-- TOC entry 1858 (class 2617 OID 28758)
-- Dependencies: 5 473 968 995
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
-- TOC entry 1857 (class 2617 OID 28760)
-- Dependencies: 5 454 995 968
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
-- TOC entry 1860 (class 2617 OID 28762)
-- Dependencies: 5 980 968 464
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
-- TOC entry 1859 (class 2617 OID 28764)
-- Dependencies: 455 5 968 980
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
-- TOC entry 1862 (class 2617 OID 28766)
-- Dependencies: 470 5 986 968
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
-- TOC entry 1861 (class 2617 OID 28768)
-- Dependencies: 5 456 986 968
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
-- TOC entry 1864 (class 2617 OID 28770)
-- Dependencies: 5 476 968 992
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
-- TOC entry 1863 (class 2617 OID 28772)
-- Dependencies: 457 5 968 992
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
-- TOC entry 1866 (class 2617 OID 28774)
-- Dependencies: 1022 478 968 5
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
-- TOC entry 1865 (class 2617 OID 28776)
-- Dependencies: 1022 5 968 458
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
-- TOC entry 1867 (class 2617 OID 28779)
-- Dependencies: 459 5 983 983
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
-- TOC entry 1869 (class 2617 OID 28780)
-- Dependencies: 5 463 983 980
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
-- TOC entry 1868 (class 2617 OID 28782)
-- Dependencies: 980 5 460 983
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
-- TOC entry 1870 (class 2617 OID 28785)
-- Dependencies: 980 462 980 5
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
-- TOC entry 1871 (class 2617 OID 28787)
-- Dependencies: 989 465 989 5
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
-- TOC entry 1873 (class 2617 OID 28788)
-- Dependencies: 989 5 986 469
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
-- TOC entry 1872 (class 2617 OID 28790)
-- Dependencies: 466 986 989 5
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
-- TOC entry 1874 (class 2617 OID 28793)
-- Dependencies: 986 5 986 468
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
-- TOC entry 1875 (class 2617 OID 28795)
-- Dependencies: 5 471 995 995
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
-- TOC entry 1877 (class 2617 OID 28796)
-- Dependencies: 992 5 995 475
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
-- TOC entry 1876 (class 2617 OID 28798)
-- Dependencies: 472 5 995 992
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
-- TOC entry 1878 (class 2617 OID 28801)
-- Dependencies: 474 992 992 5
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
-- TOC entry 1879 (class 2617 OID 28803)
-- Dependencies: 5 477 1022 1022
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
-- TOC entry 1880 (class 2617 OID 28805)
-- Dependencies: 1019 5 701 1019
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
-- TOC entry 1881 (class 2617 OID 28807)
-- Dependencies: 1016 5 692 1016
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
-- TOC entry 1882 (class 2617 OID 28809)
-- Dependencies: 5 516 1001 1001
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = ltree_ne,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1883 (class 2617 OID 28811)
-- Dependencies: 1013 5 1013 606
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = seg_different,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


ALTER OPERATOR public.<> (seg, seg) OWNER TO postgres;

--
-- TOC entry 1884 (class 2617 OID 28813)
-- Dependencies: 141 5 956 956
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
-- TOC entry 1885 (class 2617 OID 28815)
-- Dependencies: 5 64
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
-- TOC entry 1886 (class 2617 OID 28817)
-- Dependencies: 1016 1016 683 5
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
-- TOC entry 1887 (class 2617 OID 28819)
-- Dependencies: 5 1001 519 523 1001
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1888 (class 2617 OID 28821)
-- Dependencies: 5 83 1003 1001
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 1889 (class 2617 OID 28823)
-- Dependencies: 85 1003 5 1001
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 1890 (class 2617 OID 28825)
-- Dependencies: 604 5 1013 1013
-- Name: <@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <@ (
    PROCEDURE = seg_contained,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<@ (seg, seg) OWNER TO postgres;

--
-- TOC entry 1891 (class 2617 OID 28826)
-- Dependencies: 5 234
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
-- TOC entry 1892 (class 2617 OID 28746)
-- Dependencies: 5 144 956 956
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
-- TOC entry 1893 (class 2617 OID 28748)
-- Dependencies: 311 968 968 5
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
-- TOC entry 1895 (class 2617 OID 28751)
-- Dependencies: 983 968 5 312
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
-- TOC entry 1894 (class 2617 OID 28753)
-- Dependencies: 5 968 321 983
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
-- TOC entry 1897 (class 2617 OID 28755)
-- Dependencies: 313 989 968 5
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
-- TOC entry 1896 (class 2617 OID 28757)
-- Dependencies: 968 327 5 989
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
-- TOC entry 1899 (class 2617 OID 28759)
-- Dependencies: 5 314 995 968
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
-- TOC entry 1898 (class 2617 OID 28761)
-- Dependencies: 968 5 995 333
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
-- TOC entry 1901 (class 2617 OID 28763)
-- Dependencies: 5 315 968 980
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
-- TOC entry 1900 (class 2617 OID 28765)
-- Dependencies: 324 5 980 968
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
-- TOC entry 1903 (class 2617 OID 28767)
-- Dependencies: 968 316 986 5
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
-- TOC entry 1902 (class 2617 OID 28769)
-- Dependencies: 986 330 5 968
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
-- TOC entry 1905 (class 2617 OID 28771)
-- Dependencies: 968 992 317 5
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
-- TOC entry 1904 (class 2617 OID 28773)
-- Dependencies: 992 968 336 5
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
-- TOC entry 1907 (class 2617 OID 28775)
-- Dependencies: 5 968 1022 318
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
-- TOC entry 1906 (class 2617 OID 28777)
-- Dependencies: 338 5 1022 968
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
-- TOC entry 1908 (class 2617 OID 28778)
-- Dependencies: 5 319 983 983
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
-- TOC entry 1910 (class 2617 OID 28781)
-- Dependencies: 983 5 980 320
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
-- TOC entry 1909 (class 2617 OID 28783)
-- Dependencies: 5 980 983 323
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
-- TOC entry 1911 (class 2617 OID 28784)
-- Dependencies: 322 980 980 5
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
-- TOC entry 1912 (class 2617 OID 28786)
-- Dependencies: 325 989 989 5
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
-- TOC entry 1914 (class 2617 OID 28789)
-- Dependencies: 5 989 986 326
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
-- TOC entry 1913 (class 2617 OID 28791)
-- Dependencies: 989 329 5 986
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
-- TOC entry 1915 (class 2617 OID 28792)
-- Dependencies: 986 986 5 328
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
-- TOC entry 1916 (class 2617 OID 28794)
-- Dependencies: 995 331 995 5
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
-- TOC entry 1918 (class 2617 OID 28797)
-- Dependencies: 332 5 995 992
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
-- TOC entry 1917 (class 2617 OID 28799)
-- Dependencies: 5 992 995 335
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
-- TOC entry 1919 (class 2617 OID 28800)
-- Dependencies: 5 992 992 334
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
-- TOC entry 1920 (class 2617 OID 28802)
-- Dependencies: 337 5 1022 1022
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
-- TOC entry 1921 (class 2617 OID 28804)
-- Dependencies: 696 1019 1019 5
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
-- TOC entry 1922 (class 2617 OID 28806)
-- Dependencies: 5 687 1016 1016
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
-- TOC entry 1923 (class 2617 OID 28808)
-- Dependencies: 1001 510 1001 5
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = ltree_eq,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1924 (class 2617 OID 28810)
-- Dependencies: 1013 618 5 1013
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = seg_same,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


ALTER OPERATOR public.= (seg, seg) OWNER TO postgres;

--
-- TOC entry 1925 (class 2617 OID 28612)
-- Dependencies: 5 146 956 956
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
-- TOC entry 1926 (class 2617 OID 28615)
-- Dependencies: 5 968 968 367
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
-- TOC entry 1927 (class 2617 OID 28618)
-- Dependencies: 5 968 983 377
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
-- TOC entry 1928 (class 2617 OID 28621)
-- Dependencies: 5 983 368 968
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
-- TOC entry 1929 (class 2617 OID 28624)
-- Dependencies: 383 5 989 968
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
-- TOC entry 1930 (class 2617 OID 28627)
-- Dependencies: 989 968 5 369
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
-- TOC entry 1931 (class 2617 OID 28630)
-- Dependencies: 5 995 968 389
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
-- TOC entry 1932 (class 2617 OID 28633)
-- Dependencies: 5 370 995 968
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
-- TOC entry 1933 (class 2617 OID 28636)
-- Dependencies: 968 380 980 5
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
-- TOC entry 1934 (class 2617 OID 28639)
-- Dependencies: 968 980 371 5
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
-- TOC entry 1935 (class 2617 OID 28642)
-- Dependencies: 386 5 986 968
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
-- TOC entry 1936 (class 2617 OID 28645)
-- Dependencies: 372 5 968 986
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
-- TOC entry 1937 (class 2617 OID 28648)
-- Dependencies: 5 392 968 992
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
-- TOC entry 1938 (class 2617 OID 28651)
-- Dependencies: 992 373 5 968
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
-- TOC entry 1939 (class 2617 OID 28654)
-- Dependencies: 394 5 1022 968
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
-- TOC entry 1940 (class 2617 OID 28657)
-- Dependencies: 5 374 1022 968
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
-- TOC entry 1941 (class 2617 OID 28660)
-- Dependencies: 983 5 983 375
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
-- TOC entry 1942 (class 2617 OID 28663)
-- Dependencies: 379 5 980 983
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
-- TOC entry 1943 (class 2617 OID 28666)
-- Dependencies: 376 5 983 980
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
-- TOC entry 1944 (class 2617 OID 28669)
-- Dependencies: 378 980 980 5
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
-- TOC entry 1945 (class 2617 OID 28672)
-- Dependencies: 381 5 989 989
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
-- TOC entry 1946 (class 2617 OID 28675)
-- Dependencies: 989 5 986 385
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
-- TOC entry 1947 (class 2617 OID 28678)
-- Dependencies: 5 382 986 989
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
-- TOC entry 1948 (class 2617 OID 28681)
-- Dependencies: 5 986 986 384
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
-- TOC entry 1949 (class 2617 OID 28684)
-- Dependencies: 5 387 995 995
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
-- TOC entry 1950 (class 2617 OID 28687)
-- Dependencies: 5 992 995 391
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
-- TOC entry 1951 (class 2617 OID 28690)
-- Dependencies: 388 992 995 5
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
-- TOC entry 1952 (class 2617 OID 28693)
-- Dependencies: 992 390 5 992
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
-- TOC entry 1953 (class 2617 OID 28696)
-- Dependencies: 1022 393 1022 5
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
-- TOC entry 1954 (class 2617 OID 28699)
-- Dependencies: 1019 698 5 1019
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
-- TOC entry 1955 (class 2617 OID 28702)
-- Dependencies: 1016 1016 689 5
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
-- TOC entry 1956 (class 2617 OID 28705)
-- Dependencies: 1001 512 1001 5
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = ltree_gt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1957 (class 2617 OID 28708)
-- Dependencies: 5 1013 1013 608
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = seg_gt,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.> (seg, seg) OWNER TO postgres;

--
-- TOC entry 1958 (class 2617 OID 28613)
-- Dependencies: 956 5 145 956
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
-- TOC entry 1959 (class 2617 OID 28616)
-- Dependencies: 968 339 5 968
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
-- TOC entry 1960 (class 2617 OID 28619)
-- Dependencies: 983 968 5 340
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
-- TOC entry 1961 (class 2617 OID 28622)
-- Dependencies: 5 983 968 349
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
-- TOC entry 1962 (class 2617 OID 28625)
-- Dependencies: 989 968 5 341
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
-- TOC entry 1963 (class 2617 OID 28628)
-- Dependencies: 5 989 968 355
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
-- TOC entry 1964 (class 2617 OID 28631)
-- Dependencies: 342 968 995 5
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
-- TOC entry 1965 (class 2617 OID 28634)
-- Dependencies: 361 5 995 968
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
-- TOC entry 1966 (class 2617 OID 28637)
-- Dependencies: 343 5 968 980
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
-- TOC entry 1967 (class 2617 OID 28640)
-- Dependencies: 968 980 5 352
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
-- TOC entry 1968 (class 2617 OID 28643)
-- Dependencies: 344 5 986 968
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
-- TOC entry 1969 (class 2617 OID 28646)
-- Dependencies: 986 358 968 5
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
-- TOC entry 1970 (class 2617 OID 28649)
-- Dependencies: 992 5 968 345
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
-- TOC entry 1971 (class 2617 OID 28652)
-- Dependencies: 968 5 364 992
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
-- TOC entry 1972 (class 2617 OID 28655)
-- Dependencies: 1022 346 5 968
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
-- TOC entry 1973 (class 2617 OID 28658)
-- Dependencies: 366 1022 968 5
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
-- TOC entry 1974 (class 2617 OID 28661)
-- Dependencies: 347 5 983 983
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
-- TOC entry 1975 (class 2617 OID 28664)
-- Dependencies: 348 980 983 5
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
-- TOC entry 1976 (class 2617 OID 28667)
-- Dependencies: 983 980 5 351
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
-- TOC entry 1977 (class 2617 OID 28670)
-- Dependencies: 5 980 980 350
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
-- TOC entry 1978 (class 2617 OID 28673)
-- Dependencies: 353 5 989 989
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
-- TOC entry 1979 (class 2617 OID 28676)
-- Dependencies: 986 5 989 354
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
-- TOC entry 1980 (class 2617 OID 28679)
-- Dependencies: 986 5 989 357
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
-- TOC entry 1981 (class 2617 OID 28682)
-- Dependencies: 986 986 5 356
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
-- TOC entry 1982 (class 2617 OID 28685)
-- Dependencies: 5 995 995 359
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
-- TOC entry 1983 (class 2617 OID 28688)
-- Dependencies: 360 992 995 5
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
-- TOC entry 1984 (class 2617 OID 28691)
-- Dependencies: 363 992 995 5
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
-- TOC entry 1985 (class 2617 OID 28694)
-- Dependencies: 992 5 362 992
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
-- TOC entry 1986 (class 2617 OID 28697)
-- Dependencies: 1022 365 5 1022
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
-- TOC entry 1987 (class 2617 OID 28700)
-- Dependencies: 1019 697 5 1019
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
-- TOC entry 1988 (class 2617 OID 28703)
-- Dependencies: 1016 688 5 1016
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
-- TOC entry 1989 (class 2617 OID 28706)
-- Dependencies: 1001 511 5 1001
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = ltree_ge,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 1990 (class 2617 OID 28709)
-- Dependencies: 1013 607 5 1013
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = seg_ge,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


ALTER OPERATOR public.>= (seg, seg) OWNER TO postgres;

--
-- TOC entry 1991 (class 2617 OID 28711)
-- Dependencies: 1013 5 617 1013
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = seg_right,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (seg, seg) OWNER TO postgres;

--
-- TOC entry 1993 (class 2617 OID 28827)
-- Dependencies: 1000 500 5 1001
-- Name: ?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (lquery[], ltree) OWNER TO postgres;

--
-- TOC entry 1992 (class 2617 OID 28828)
-- Dependencies: 1000 499 5 1001
-- Name: ?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (ltree, lquery[]) OWNER TO postgres;

--
-- TOC entry 1995 (class 2617 OID 28829)
-- Dependencies: 1000 72 1003 5
-- Name: ?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (lquery[], ltree[]) OWNER TO postgres;

--
-- TOC entry 1994 (class 2617 OID 28830)
-- Dependencies: 71 1000 1003 5
-- Name: ?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.? (ltree[], lquery[]) OWNER TO postgres;

--
-- TOC entry 1996 (class 2617 OID 28831)
-- Dependencies: 1003 79 5 1001 1001
-- Name: ?<@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ?<@ (
    PROCEDURE = _ltree_extract_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


ALTER OPERATOR public.?<@ (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 1997 (class 2617 OID 28832)
-- Dependencies: 5 89 1001 1007 1003
-- Name: ?@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ?@ (
    PROCEDURE = _ltxtq_extract_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery
);


ALTER OPERATOR public.?@ (ltree[], ltxtquery) OWNER TO postgres;

--
-- TOC entry 1998 (class 2617 OID 28833)
-- Dependencies: 5 78 1001 1001 1003
-- Name: ?@>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ?@> (
    PROCEDURE = _ltree_extract_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


ALTER OPERATOR public.?@> (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 1999 (class 2617 OID 28834)
-- Dependencies: 1003 73 1001 998 5
-- Name: ?~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ?~ (
    PROCEDURE = _ltq_extract_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery
);


ALTER OPERATOR public.?~ (ltree[], lquery) OWNER TO postgres;

--
-- TOC entry 2000 (class 2617 OID 28836)
-- Dependencies: 956 5 142 956
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
-- TOC entry 2001 (class 2617 OID 28838)
-- Dependencies: 65 5
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
-- TOC entry 2002 (class 2617 OID 28840)
-- Dependencies: 1016 684 5 1016
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
-- TOC entry 2004 (class 2617 OID 28841)
-- Dependencies: 525 1001 5 1007
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltxtquery, ltree) OWNER TO postgres;

--
-- TOC entry 2003 (class 2617 OID 28842)
-- Dependencies: 1001 524 5 1007
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltree, ltxtquery) OWNER TO postgres;

--
-- TOC entry 2006 (class 2617 OID 28843)
-- Dependencies: 1003 1007 5 90
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltxtquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 2005 (class 2617 OID 28844)
-- Dependencies: 1003 5 1007 88
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (ltree[], ltxtquery) OWNER TO postgres;

--
-- TOC entry 2007 (class 2617 OID 28846)
-- Dependencies: 605 1013 5 1013
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = seg_contains,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (seg, seg) OWNER TO postgres;

--
-- TOC entry 2008 (class 2617 OID 28812)
-- Dependencies: 956 956 142 5
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
-- TOC entry 2009 (class 2617 OID 28814)
-- Dependencies: 65 5
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
-- TOC entry 2010 (class 2617 OID 28816)
-- Dependencies: 1016 5 1016 684
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
-- TOC entry 2011 (class 2617 OID 28818)
-- Dependencies: 1001 1001 513 523 5
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 2012 (class 2617 OID 28820)
-- Dependencies: 1001 1003 5 80
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 2013 (class 2617 OID 28822)
-- Dependencies: 5 1003 1001 84
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 2014 (class 2617 OID 28824)
-- Dependencies: 605 1013 1013 5
-- Name: @>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @> (
    PROCEDURE = seg_contains,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@> (seg, seg) OWNER TO postgres;

--
-- TOC entry 2015 (class 2617 OID 28848)
-- Dependencies: 5 1010 92
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
-- TOC entry 2017 (class 2617 OID 28849)
-- Dependencies: 1016 5 1019 208
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
-- TOC entry 2016 (class 2617 OID 28850)
-- Dependencies: 5 1016 1019 601
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
-- TOC entry 2019 (class 2617 OID 28851)
-- Dependencies: 1016 208 1019 5
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
-- TOC entry 2018 (class 2617 OID 28852)
-- Dependencies: 601 1019 5 1016
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
-- TOC entry 2020 (class 2617 OID 28854)
-- Dependencies: 1001 5 1001 519
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^<@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 2021 (class 2617 OID 28856)
-- Dependencies: 83 1003 1001 5
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 2022 (class 2617 OID 28858)
-- Dependencies: 1003 5 1001 85
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^<@ (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 2024 (class 2617 OID 28859)
-- Dependencies: 1001 5 1000 500
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (lquery[], ltree) OWNER TO postgres;

--
-- TOC entry 2023 (class 2617 OID 28860)
-- Dependencies: 1000 499 1001 5
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (ltree, lquery[]) OWNER TO postgres;

--
-- TOC entry 2026 (class 2617 OID 28861)
-- Dependencies: 1000 5 72 1003
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (lquery[], ltree[]) OWNER TO postgres;

--
-- TOC entry 2025 (class 2617 OID 28862)
-- Dependencies: 1000 71 5 1003
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^? (ltree[], lquery[]) OWNER TO postgres;

--
-- TOC entry 2028 (class 2617 OID 28863)
-- Dependencies: 1007 5 525 1001
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltxtquery, ltree) OWNER TO postgres;

--
-- TOC entry 2027 (class 2617 OID 28864)
-- Dependencies: 1007 524 5 1001
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltree, ltxtquery) OWNER TO postgres;

--
-- TOC entry 2030 (class 2617 OID 28865)
-- Dependencies: 1003 5 90 1007
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltxtquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 2029 (class 2617 OID 28866)
-- Dependencies: 1007 5 1003 88
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@ (ltree[], ltxtquery) OWNER TO postgres;

--
-- TOC entry 2031 (class 2617 OID 28853)
-- Dependencies: 1001 1001 513 5
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 2032 (class 2617 OID 28855)
-- Dependencies: 1001 5 80 1003
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree[], ltree) OWNER TO postgres;

--
-- TOC entry 2033 (class 2617 OID 28857)
-- Dependencies: 84 1003 1001 5
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^@> (ltree, ltree[]) OWNER TO postgres;

--
-- TOC entry 2035 (class 2617 OID 28867)
-- Dependencies: 5 502 1001 998
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (lquery, ltree) OWNER TO postgres;

--
-- TOC entry 2034 (class 2617 OID 28868)
-- Dependencies: 998 501 1001 5
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (ltree, lquery) OWNER TO postgres;

--
-- TOC entry 2037 (class 2617 OID 28869)
-- Dependencies: 998 5 75 1003
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (lquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 2036 (class 2617 OID 28870)
-- Dependencies: 74 5 1003 998
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.^~ (ltree[], lquery) OWNER TO postgres;

--
-- TOC entry 2038 (class 2617 OID 28871)
-- Dependencies: 292 5
-- Name: |; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR | (
    PROCEDURE = intset_union_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


ALTER OPERATOR public.| (integer[], integer) OWNER TO postgres;

--
-- TOC entry 2039 (class 2617 OID 28872)
-- Dependencies: 5 70
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
-- TOC entry 2040 (class 2617 OID 28873)
-- Dependencies: 1019 5 1019 1019 121
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);


ALTER OPERATOR public.|| (tsvector, tsvector) OWNER TO postgres;

--
-- TOC entry 2041 (class 2617 OID 28874)
-- Dependencies: 5 1016 1016 1016 694
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
-- TOC entry 2042 (class 2617 OID 28875)
-- Dependencies: 1001 504 1001 1001 5
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addltree,
    LEFTARG = ltree,
    RIGHTARG = ltree
);


ALTER OPERATOR public.|| (ltree, ltree) OWNER TO postgres;

--
-- TOC entry 2043 (class 2617 OID 28876)
-- Dependencies: 505 5 1001 1001
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addtext,
    LEFTARG = ltree,
    RIGHTARG = text
);


ALTER OPERATOR public.|| (ltree, text) OWNER TO postgres;

--
-- TOC entry 2044 (class 2617 OID 28877)
-- Dependencies: 1001 5 1001 521
-- Name: ||; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR || (
    PROCEDURE = ltree_textadd,
    LEFTARG = text,
    RIGHTARG = ltree
);


ALTER OPERATOR public.|| (text, ltree) OWNER TO postgres;

--
-- TOC entry 2045 (class 2617 OID 28835)
-- Dependencies: 141 5 956 956
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
-- TOC entry 2046 (class 2617 OID 28837)
-- Dependencies: 5 64
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
-- TOC entry 2047 (class 2617 OID 28839)
-- Dependencies: 5 1016 1016 683
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
-- TOC entry 2048 (class 2617 OID 28845)
-- Dependencies: 604 5 1013 1013
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = seg_contained,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (seg, seg) OWNER TO postgres;

--
-- TOC entry 2050 (class 2617 OID 28878)
-- Dependencies: 1001 5 998 502
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (lquery, ltree) OWNER TO postgres;

--
-- TOC entry 2049 (class 2617 OID 28879)
-- Dependencies: 501 5 1001 998
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (ltree, lquery) OWNER TO postgres;

--
-- TOC entry 2052 (class 2617 OID 28880)
-- Dependencies: 75 5 998 1003
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (lquery, ltree[]) OWNER TO postgres;

--
-- TOC entry 2051 (class 2617 OID 28881)
-- Dependencies: 74 5 1003 998
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (ltree[], lquery) OWNER TO postgres;

--
-- TOC entry 2053 (class 2617 OID 28847)
-- Dependencies: 595 1010 5
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
-- TOC entry 2156 (class 2616 OID 28882)
-- Dependencies: 1784 5 956 1818 1892 1958 1925 140
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
-- TOC entry 2157 (class 2616 OID 28883)
-- Dependencies: 98 97 96 95 94 1926 1940 1938 1936 1934 1932 1930 1928 1959 1972 1970 1968 1966 1964 1962 1960 1893 1907 1905 1903 1901 1899 1897 1895 1819 1832 1830 1820 1785 1798 5 968 1796 1786 1788 1790 1792 1794 1828 1826 1824 1822 93 100 99
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
-- TOC entry 2158 (class 2616 OID 28884)
-- Dependencies: 5 968 1893 263
-- Name: ean13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ean13_ops
    DEFAULT FOR TYPE ean13 USING hash AS
    OPERATOR 1 =(ean13,ean13) ,
    FUNCTION 1 hashean13(ean13);


ALTER OPERATOR CLASS public.ean13_ops USING hash OWNER TO postgres;

--
-- TOC entry 2159 (class 2616 OID 28885)
-- Dependencies: 238 237 239 5 1019 2017 2019
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
-- TOC entry 2160 (class 2616 OID 28886)
-- Dependencies: 220 219 218 216 222 217 2015 2046 1775 2001 1885 5 2009 221
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
-- TOC entry 2161 (class 2616 OID 28887)
-- Dependencies: 2046 1885 2009 1775 977 5 228 227 226 225 223 229 224 2015 2001
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
-- TOC entry 2162 (class 2616 OID 28888)
-- Dependencies: 2013 86 82 81 509 76 87 77 1995 1994 2006 2005 2052 2051 1889 1004 1003 5
-- Name: gist__ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist__ltree_ops
    DEFAULT FOR TYPE ltree[] USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 10 <@(ltree[],ltree) RECHECK ,
    OPERATOR 11 @>(ltree,ltree[]) RECHECK ,
    OPERATOR 12 ~(ltree[],lquery) RECHECK ,
    OPERATOR 13 ~(lquery,ltree[]) RECHECK ,
    OPERATOR 14 @(ltree[],ltxtquery) RECHECK ,
    OPERATOR 15 @(ltxtquery,ltree[]) RECHECK ,
    OPERATOR 16 ?(ltree[],lquery[]) RECHECK ,
    OPERATOR 17 ?(lquery[],ltree[]) RECHECK ,
    FUNCTION 1 _ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 _ltree_union(internal,internal) ,
    FUNCTION 3 _ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 _ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 _ltree_picksplit(internal,internal) ,
    FUNCTION 7 _ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist__ltree_ops USING gist OWNER TO postgres;

--
-- TOC entry 2163 (class 2616 OID 28889)
-- Dependencies: 2045 210 215 209 211 212 213 214 5 956 1774 1892 2008 1884 2000
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
-- TOC entry 2164 (class 2616 OID 28890)
-- Dependencies: 1992 1993 508 522 507 509 517 520 518 5 1001 1004 1815 1849 1923 1989 1956 2011 1887 2049 2050 2003 2004
-- Name: gist_ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_ltree_ops
    DEFAULT FOR TYPE ltree USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    OPERATOR 10 @>(ltree,ltree) ,
    OPERATOR 11 <@(ltree,ltree) ,
    OPERATOR 12 ~(ltree,lquery) ,
    OPERATOR 13 ~(lquery,ltree) ,
    OPERATOR 14 @(ltree,ltxtquery) ,
    OPERATOR 15 @(ltxtquery,ltree) ,
    OPERATOR 16 ?(ltree,lquery[]) ,
    OPERATOR 17 ?(lquery[],ltree) ,
    FUNCTION 1 ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 ltree_union(internal,internal) ,
    FUNCTION 3 ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 ltree_picksplit(internal,internal) ,
    FUNCTION 7 ltree_same(internal,internal,internal);


ALTER OPERATOR CLASS public.gist_ltree_ops USING gist OWNER TO postgres;

--
-- TOC entry 2165 (class 2616 OID 28891)
-- Dependencies: 2048 5 1013 1817 1778 1777 1779 1991 1924 2014 1890 2007 243 248 242 244 245 246 247
-- Name: gist_seg_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_seg_ops
    DEFAULT FOR TYPE seg USING gist AS
    OPERATOR 1 <<(seg,seg) ,
    OPERATOR 2 &<(seg,seg) ,
    OPERATOR 3 &&(seg,seg) ,
    OPERATOR 4 &>(seg,seg) ,
    OPERATOR 5 >>(seg,seg) ,
    OPERATOR 6 =(seg,seg) ,
    OPERATOR 7 @>(seg,seg) ,
    OPERATOR 8 <@(seg,seg) ,
    OPERATOR 13 @(seg,seg) ,
    OPERATOR 14 ~(seg,seg) ,
    FUNCTION 1 gseg_consistent(internal,seg,integer) ,
    FUNCTION 2 gseg_union(internal,internal) ,
    FUNCTION 3 gseg_compress(internal) ,
    FUNCTION 4 gseg_decompress(internal) ,
    FUNCTION 5 gseg_penalty(internal,internal,internal) ,
    FUNCTION 6 gseg_picksplit(internal,internal) ,
    FUNCTION 7 gseg_same(seg,seg,internal);


ALTER OPERATOR CLASS public.gist_seg_ops USING gist OWNER TO postgres;

--
-- TOC entry 2166 (class 2616 OID 28892)
-- Dependencies: 254 5 1016 971 2010 1886 2002 2047 250 255 249 251 252 253
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
-- TOC entry 2167 (class 2616 OID 28893)
-- Dependencies: 974 5 1019 2017 257 262 256 258 259 260 261
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
-- TOC entry 2168 (class 2616 OID 28894)
-- Dependencies: 103 5 983 1787 1801 1800 1821 1835 1834 1894 1910 1908 101 1961 1975 1974 1927 1943 1941 102
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
-- TOC entry 2169 (class 2616 OID 28895)
-- Dependencies: 1908 5 983 265
-- Name: isbn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn13_ops
    DEFAULT FOR TYPE isbn13 USING hash AS
    OPERATOR 1 =(isbn13,isbn13) ,
    FUNCTION 1 hashisbn13(isbn13);


ALTER OPERATOR CLASS public.isbn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 2170 (class 2616 OID 28896)
-- Dependencies: 1976 5 980 1793 1802 1803 1836 1837 1900 1909 1911 1967 1977 1933 1942 1944 105 106 104 1827
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
-- TOC entry 2171 (class 2616 OID 28897)
-- Dependencies: 980 1911 5 264
-- Name: isbn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS isbn_ops
    DEFAULT FOR TYPE isbn USING hash AS
    OPERATOR 1 =(isbn,isbn) ,
    FUNCTION 1 hashisbn(isbn);


ALTER OPERATOR CLASS public.isbn_ops USING hash OWNER TO postgres;

--
-- TOC entry 2172 (class 2616 OID 28898)
-- Dependencies: 1804 1789 5 1896 1838 1839 1823 107 109 108 1945 1947 1929 1978 1979 1963 1912 1805 1914 989
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
-- TOC entry 2173 (class 2616 OID 28899)
-- Dependencies: 1912 989 5 267
-- Name: ismn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn13_ops
    DEFAULT FOR TYPE ismn13 USING hash AS
    OPERATOR 1 =(ismn13,ismn13) ,
    FUNCTION 1 hashismn13(ismn13);


ALTER OPERATOR CLASS public.ismn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 2174 (class 2616 OID 28900)
-- Dependencies: 986 110 112 111 1948 1946 1935 1981 1980 1969 1915 1913 1902 1841 1840 1829 1807 1806 1795 5
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
-- TOC entry 2175 (class 2616 OID 28901)
-- Dependencies: 266 986 1915 5
-- Name: ismn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ismn_ops
    DEFAULT FOR TYPE ismn USING hash AS
    OPERATOR 1 =(ismn,ismn) ,
    FUNCTION 1 hashismn(ismn);


ALTER OPERATOR CLASS public.ismn_ops USING hash OWNER TO postgres;

--
-- TOC entry 2176 (class 2616 OID 28902)
-- Dependencies: 1809 1808 1825 1843 1842 1898 1918 1916 1965 1983 1982 1931 1951 1949 114 113 115 5 995 1791
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
-- TOC entry 2177 (class 2616 OID 28903)
-- Dependencies: 1916 5 995 269
-- Name: issn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn13_ops
    DEFAULT FOR TYPE issn13 USING hash AS
    OPERATOR 1 =(issn13,issn13) ,
    FUNCTION 1 hashissn13(issn13);


ALTER OPERATOR CLASS public.issn13_ops USING hash OWNER TO postgres;

--
-- TOC entry 2178 (class 2616 OID 28904)
-- Dependencies: 1904 5 992 1797 1810 1811 1831 1844 1845 1917 1919 1971 1984 1985 1937 1950 1952 117 118 116
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
-- TOC entry 2179 (class 2616 OID 28905)
-- Dependencies: 1919 268 5 992
-- Name: issn_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS issn_ops
    DEFAULT FOR TYPE issn USING hash AS
    OPERATOR 1 =(issn,issn) ,
    FUNCTION 1 hashissn(issn);


ALTER OPERATOR CLASS public.issn_ops USING hash OWNER TO postgres;

--
-- TOC entry 2180 (class 2616 OID 28906)
-- Dependencies: 1815 1849 1923 1956 1989 506 5 1001
-- Name: ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS ltree_ops
    DEFAULT FOR TYPE ltree USING btree AS
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    FUNCTION 1 ltree_cmp(ltree,ltree);


ALTER OPERATOR CLASS public.ltree_ops USING btree OWNER TO postgres;

--
-- TOC entry 2181 (class 2616 OID 28907)
-- Dependencies: 1957 5 1013 1816 1850 1924 1990 603
-- Name: seg_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS seg_ops
    DEFAULT FOR TYPE seg USING btree AS
    OPERATOR 1 <(seg,seg) ,
    OPERATOR 2 <=(seg,seg) ,
    OPERATOR 3 =(seg,seg) ,
    OPERATOR 4 >=(seg,seg) ,
    OPERATOR 5 >(seg,seg) ,
    FUNCTION 1 seg_cmp(seg,seg);


ALTER OPERATOR CLASS public.seg_ops USING btree OWNER TO postgres;

--
-- TOC entry 2182 (class 2616 OID 28908)
-- Dependencies: 686 5 1016 1814 1848 1922 1988 1955
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
-- TOC entry 2183 (class 2616 OID 28909)
-- Dependencies: 1954 5 1019 1813 1847 1921 1987 695
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
-- TOC entry 2184 (class 2616 OID 28910)
-- Dependencies: 120 5 1022 1799 1812 1833 1846 1906 1920 1973 1986 1939 1953 119
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
-- TOC entry 2185 (class 2616 OID 28911)
-- Dependencies: 1920 5 1022 270
-- Name: upc_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS upc_ops
    DEFAULT FOR TYPE upc USING hash AS
    OPERATOR 1 =(upc,upc) ,
    FUNCTION 1 hashupc(upc);


ALTER OPERATOR CLASS public.upc_ops USING hash OWNER TO postgres;

SET search_path = pg_catalog;

--
-- TOC entry 2835 (class 2605 OID 28912)
-- Dependencies: 301 980 301 968
-- Name: CAST (public.ean13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.isbn) WITH FUNCTION public.isbn(public.ean13);


--
-- TOC entry 2836 (class 2605 OID 28913)
-- Dependencies: 303 983 303 968
-- Name: CAST (public.ean13 AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.isbn13) WITH FUNCTION public.isbn13(public.ean13);


--
-- TOC entry 2837 (class 2605 OID 28914)
-- Dependencies: 305 305 968 986
-- Name: CAST (public.ean13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.ismn) WITH FUNCTION public.ismn(public.ean13);


--
-- TOC entry 2838 (class 2605 OID 28915)
-- Dependencies: 307 968 989 307
-- Name: CAST (public.ean13 AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.ismn13) WITH FUNCTION public.ismn13(public.ean13);


--
-- TOC entry 2839 (class 2605 OID 28916)
-- Dependencies: 479 968 479 992
-- Name: CAST (public.ean13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.issn) WITH FUNCTION public.issn(public.ean13);


--
-- TOC entry 2840 (class 2605 OID 28917)
-- Dependencies: 481 995 968 481
-- Name: CAST (public.ean13 AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.issn13) WITH FUNCTION public.issn13(public.ean13);


--
-- TOC entry 2834 (class 2605 OID 28918)
-- Dependencies: 659 659 968
-- Name: CAST (public.ean13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS text) WITH FUNCTION public.text(public.ean13);


--
-- TOC entry 2841 (class 2605 OID 28919)
-- Dependencies: 703 1022 968 703
-- Name: CAST (public.ean13 AS public.upc); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ean13 AS public.upc) WITH FUNCTION public.upc(public.ean13);


--
-- TOC entry 2843 (class 2605 OID 28920)
-- Dependencies: 980 968
-- Name: CAST (public.isbn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2844 (class 2605 OID 28921)
-- Dependencies: 983 980
-- Name: CAST (public.isbn AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS public.isbn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2842 (class 2605 OID 28922)
-- Dependencies: 663 663 980
-- Name: CAST (public.isbn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn AS text) WITH FUNCTION public.text(public.isbn);


--
-- TOC entry 2846 (class 2605 OID 28923)
-- Dependencies: 968 983
-- Name: CAST (public.isbn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2847 (class 2605 OID 28924)
-- Dependencies: 983 980
-- Name: CAST (public.isbn13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS public.isbn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2845 (class 2605 OID 28925)
-- Dependencies: 660 660 983
-- Name: CAST (public.isbn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.isbn13 AS text) WITH FUNCTION public.text(public.isbn13);


--
-- TOC entry 2849 (class 2605 OID 28926)
-- Dependencies: 968 986
-- Name: CAST (public.ismn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2850 (class 2605 OID 28927)
-- Dependencies: 989 986
-- Name: CAST (public.ismn AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS public.ismn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2848 (class 2605 OID 28928)
-- Dependencies: 664 986 664
-- Name: CAST (public.ismn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn AS text) WITH FUNCTION public.text(public.ismn);


--
-- TOC entry 2852 (class 2605 OID 28929)
-- Dependencies: 989 968
-- Name: CAST (public.ismn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2853 (class 2605 OID 28930)
-- Dependencies: 989 986
-- Name: CAST (public.ismn13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS public.ismn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2851 (class 2605 OID 28931)
-- Dependencies: 661 989 661
-- Name: CAST (public.ismn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.ismn13 AS text) WITH FUNCTION public.text(public.ismn13);


--
-- TOC entry 2855 (class 2605 OID 28932)
-- Dependencies: 968 992
-- Name: CAST (public.issn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2856 (class 2605 OID 28933)
-- Dependencies: 992 995
-- Name: CAST (public.issn AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS public.issn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2854 (class 2605 OID 28934)
-- Dependencies: 665 665 992
-- Name: CAST (public.issn AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn AS text) WITH FUNCTION public.text(public.issn);


--
-- TOC entry 2858 (class 2605 OID 28935)
-- Dependencies: 968 995
-- Name: CAST (public.issn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2859 (class 2605 OID 28936)
-- Dependencies: 995 992
-- Name: CAST (public.issn13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS public.issn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2857 (class 2605 OID 28937)
-- Dependencies: 662 662 995
-- Name: CAST (public.issn13 AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.issn13 AS text) WITH FUNCTION public.text(public.issn13);


--
-- TOC entry 2653 (class 2605 OID 28938)
-- Dependencies: 135 956 135
-- Name: CAST (text AS public.cube); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.cube) WITH FUNCTION public.cube(text) AS ASSIGNMENT;


--
-- TOC entry 2654 (class 2605 OID 28939)
-- Dependencies: 203 203 968
-- Name: CAST (text AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ean13) WITH FUNCTION public.ean13(text);


--
-- TOC entry 2655 (class 2605 OID 28940)
-- Dependencies: 302 302 980
-- Name: CAST (text AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.isbn) WITH FUNCTION public.isbn(text);


--
-- TOC entry 2656 (class 2605 OID 28941)
-- Dependencies: 304 983 304
-- Name: CAST (text AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.isbn13) WITH FUNCTION public.isbn13(text);


--
-- TOC entry 2657 (class 2605 OID 28942)
-- Dependencies: 306 306 986
-- Name: CAST (text AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ismn) WITH FUNCTION public.ismn(text);


--
-- TOC entry 2658 (class 2605 OID 28943)
-- Dependencies: 308 308 989
-- Name: CAST (text AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.ismn13) WITH FUNCTION public.ismn13(text);


--
-- TOC entry 2659 (class 2605 OID 28944)
-- Dependencies: 480 480 992
-- Name: CAST (text AS public.issn); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.issn) WITH FUNCTION public.issn(text);


--
-- TOC entry 2660 (class 2605 OID 28945)
-- Dependencies: 482 482 995
-- Name: CAST (text AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.issn13) WITH FUNCTION public.issn13(text);


--
-- TOC entry 2661 (class 2605 OID 28946)
-- Dependencies: 704 1022 704
-- Name: CAST (text AS public.upc); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.upc) WITH FUNCTION public.upc(text);


--
-- TOC entry 2861 (class 2605 OID 28947)
-- Dependencies: 1022 968
-- Name: CAST (public.upc AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.upc AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2860 (class 2605 OID 28948)
-- Dependencies: 666 666 1022
-- Name: CAST (public.upc AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.upc AS text) WITH FUNCTION public.text(public.upc);


SET search_path = public, pg_catalog;

--
-- TOC entry 2430 (class 1259 OID 28949)
-- Dependencies: 5
-- Name: sq_avaliacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_avaliacao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_avaliacao OWNER TO postgres;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 2430
-- Name: sq_avaliacao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_avaliacao', 26, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2431 (class 1259 OID 28951)
-- Dependencies: 2862 5
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
-- TOC entry 2432 (class 1259 OID 28954)
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
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 2432
-- Name: sq_avaliaratendimento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_avaliaratendimento', 44, true);


--
-- TOC entry 2433 (class 1259 OID 28956)
-- Dependencies: 2863 5
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
-- TOC entry 2434 (class 1259 OID 28962)
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
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 2434
-- Name: sq_boleto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_boleto', 243, true);


--
-- TOC entry 2435 (class 1259 OID 28964)
-- Dependencies: 2864 2865 5
-- Name: boleto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE boleto (
    _codigo integer DEFAULT nextval('sq_boleto'::regclass) NOT NULL,
    _valor real NOT NULL,
    _valorboleto real NOT NULL,
    _nossonumero integer DEFAULT 666,
    _numeropedido integer NOT NULL,
    _usuario bigint NOT NULL,
    _datavencimento date NOT NULL,
    _dataprocessamento date NOT NULL,
    _cedente character varying(20) NOT NULL
);


ALTER TABLE public.boleto OWNER TO postgres;

--
-- TOC entry 2436 (class 1259 OID 28968)
-- Dependencies: 5
-- Name: sq_caracttipoproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_caracttipoproduto
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_caracttipoproduto OWNER TO postgres;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 2436
-- Name: sq_caracttipoproduto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_caracttipoproduto', 18, true);


--
-- TOC entry 2437 (class 1259 OID 28970)
-- Dependencies: 2866 5
-- Name: caracttipoproduto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE caracttipoproduto (
    _codigo integer DEFAULT nextval('sq_caracttipoproduto'::regclass) NOT NULL,
    _descricao character varying(20) NOT NULL,
    _tipoproduto integer NOT NULL
);


ALTER TABLE public.caracttipoproduto OWNER TO postgres;

--
-- TOC entry 2438 (class 1259 OID 28973)
-- Dependencies: 5
-- Name: sq_categoria; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_categoria
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_categoria OWNER TO postgres;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 2438
-- Name: sq_categoria; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_categoria', 493, true);


--
-- TOC entry 2439 (class 1259 OID 28975)
-- Dependencies: 2867 5
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    _codigo integer DEFAULT nextval('sq_categoria'::regclass) NOT NULL,
    _descricao character varying(40) NOT NULL,
    _genero integer NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 2440 (class 1259 OID 28978)
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
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 2440
-- Name: sq_conteudoproduto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_conteudoproduto', 824, true);


--
-- TOC entry 2441 (class 1259 OID 28980)
-- Dependencies: 2868 5
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
-- TOC entry 2442 (class 1259 OID 28983)
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
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 2442
-- Name: sq_dadoscartao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_dadoscartao', 49, true);


--
-- TOC entry 2443 (class 1259 OID 28985)
-- Dependencies: 2869 5
-- Name: dadoscartao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dadoscartao (
    _codigo bigint DEFAULT nextval('sq_dadoscartao'::regclass) NOT NULL,
    _numerocartao bigint NOT NULL,
    _codigoseguranca integer NOT NULL,
    _datavalidade date NOT NULL,
    _nomeimpresso character varying(50) NOT NULL,
    _parcelas integer NOT NULL,
    _tipobandeiracartao integer NOT NULL,
    _pedidodesktopwap bigint NOT NULL,
    _valortotal double precision
);


ALTER TABLE public.dadoscartao OWNER TO postgres;

--
-- TOC entry 2444 (class 1259 OID 28988)
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
-- TOC entry 2445 (class 1259 OID 28990)
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
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 2445
-- Name: sq_endereco; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_endereco', 74, true);


--
-- TOC entry 2446 (class 1259 OID 28992)
-- Dependencies: 2870 5
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
-- TOC entry 2447 (class 1259 OID 28995)
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
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 2447
-- Name: sq_estoque; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_estoque', 2, true);


--
-- TOC entry 2448 (class 1259 OID 28997)
-- Dependencies: 2871 5
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estoque (
    _codigo bigint DEFAULT nextval('sq_estoque'::regclass) NOT NULL,
    _produto bigint NOT NULL,
    _movimento bigint NOT NULL,
    _quantidadedisponivel integer NOT NULL,
    _quantidadeestoque integer NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- TOC entry 2449 (class 1259 OID 29000)
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
-- TOC entry 2450 (class 1259 OID 29002)
-- Dependencies: 5
-- Name: sq_genero; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_genero
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_genero OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 2450
-- Name: sq_genero; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_genero', 69, true);


--
-- TOC entry 2451 (class 1259 OID 29004)
-- Dependencies: 2872 5
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genero (
    _codigo integer DEFAULT nextval('sq_genero'::regclass) NOT NULL,
    _descricao character varying(30) NOT NULL,
    _tipoproduto integer NOT NULL
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 2452 (class 1259 OID 29007)
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
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 2452
-- Name: sq_historico; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_historico', 1, false);


--
-- TOC entry 2453 (class 1259 OID 29009)
-- Dependencies: 2873 5
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
-- TOC entry 2454 (class 1259 OID 29012)
-- Dependencies: 5
-- Name: sq_imagem; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_imagem
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_imagem OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 2454
-- Name: sq_imagem; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_imagem', 1, false);


--
-- TOC entry 2455 (class 1259 OID 29014)
-- Dependencies: 2874 5
-- Name: imagem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE imagem (
    _codigo bigint DEFAULT nextval('sq_imagem'::regclass) NOT NULL,
    _url character varying NOT NULL,
    _produto bigint NOT NULL
);


ALTER TABLE public.imagem OWNER TO postgres;

--
-- TOC entry 2456 (class 1259 OID 29020)
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
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 2456
-- Name: sq_item; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_item', 144, true);


--
-- TOC entry 2457 (class 1259 OID 29022)
-- Dependencies: 2875 5
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
-- TOC entry 2458 (class 1259 OID 29025)
-- Dependencies: 5
-- Name: sq_movimento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_movimento
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_movimento OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 2458
-- Name: sq_movimento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_movimento', 4, true);


--
-- TOC entry 2459 (class 1259 OID 29027)
-- Dependencies: 2876 5
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
-- TOC entry 2460 (class 1259 OID 29030)
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
-- TOC entry 2461 (class 1259 OID 29032)
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
-- TOC entry 2462 (class 1259 OID 29034)
-- Dependencies: 2566 5
-- Name: pg_buffercache; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_buffercache AS
    SELECT p.bufferid, p.relfilenode, p.reltablespace, p.reldatabase, p.relblocknumber, p.isdirty FROM pg_buffercache_pages() p(bufferid integer, relfilenode oid, reltablespace oid, reldatabase oid, relblocknumber bigint, isdirty boolean);


ALTER TABLE public.pg_buffercache OWNER TO postgres;

--
-- TOC entry 2463 (class 1259 OID 29037)
-- Dependencies: 2567 5
-- Name: pg_freespacemap_pages; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_freespacemap_pages AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.relblocknumber, p.bytes FROM pg_freespacemap_pages() p(reltablespace oid, reldatabase oid, relfilenode oid, relblocknumber bigint, bytes integer);


ALTER TABLE public.pg_freespacemap_pages OWNER TO postgres;

--
-- TOC entry 2464 (class 1259 OID 29040)
-- Dependencies: 2568 5
-- Name: pg_freespacemap_relations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW pg_freespacemap_relations AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.avgrequest, p.interestingpages, p.storedpages, p.nextpage FROM pg_freespacemap_relations() p(reltablespace oid, reldatabase oid, relfilenode oid, avgrequest integer, interestingpages integer, storedpages integer, nextpage integer);


ALTER TABLE public.pg_freespacemap_relations OWNER TO postgres;

--
-- TOC entry 2465 (class 1259 OID 29043)
-- Dependencies: 5
-- Name: sq_produto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_produto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_produto OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 2465
-- Name: sq_produto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_produto', 1, false);


--
-- TOC entry 2466 (class 1259 OID 29045)
-- Dependencies: 2877 2878 5
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
-- TOC entry 2467 (class 1259 OID 29049)
-- Dependencies: 5
-- Name: sq_promocao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_promocao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_promocao OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 2467
-- Name: sq_promocao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_promocao', 1, false);


--
-- TOC entry 2468 (class 1259 OID 29051)
-- Dependencies: 2879 5
-- Name: promocao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE promocao (
    _codigo bigint DEFAULT nextval('sq_promocao'::regclass) NOT NULL,
    _datainicio date,
    _datatermino date,
    _produto bigint NOT NULL,
    _tipopromocao bigint NOT NULL
);


ALTER TABLE public.promocao OWNER TO postgres;

--
-- TOC entry 2469 (class 1259 OID 29054)
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
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 2469
-- Name: sq_fornecedores; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_fornecedores', 246, true);


--
-- TOC entry 2470 (class 1259 OID 29056)
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
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 2470
-- Name: sq_pedidodesktopwap; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_pedidodesktopwap', 200, true);


--
-- TOC entry 2471 (class 1259 OID 29058)
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
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 2471
-- Name: sq_pedidosms; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_pedidosms', 37, true);


--
-- TOC entry 2472 (class 1259 OID 29060)
-- Dependencies: 5
-- Name: sq_tipobandeiracartao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipobandeiracartao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipobandeiracartao OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 2472
-- Name: sq_tipobandeiracartao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipobandeiracartao', 2, true);


--
-- TOC entry 2473 (class 1259 OID 29062)
-- Dependencies: 5
-- Name: sq_tipoendereco; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoendereco
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoendereco OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 2473
-- Name: sq_tipoendereco; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipoendereco', 3, true);


--
-- TOC entry 2474 (class 1259 OID 29064)
-- Dependencies: 5
-- Name: sq_tipoformapagamento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoformapagamento
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoformapagamento OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 2474
-- Name: sq_tipoformapagamento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipoformapagamento', 4, true);


--
-- TOC entry 2475 (class 1259 OID 29066)
-- Dependencies: 5
-- Name: sq_tipohistorico; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipohistorico
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipohistorico OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 2475
-- Name: sq_tipohistorico; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipohistorico', 3, true);


--
-- TOC entry 2476 (class 1259 OID 29068)
-- Dependencies: 5
-- Name: sq_tipomovimento; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipomovimento
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipomovimento OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 2476
-- Name: sq_tipomovimento; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipomovimento', 5, true);


--
-- TOC entry 2477 (class 1259 OID 29070)
-- Dependencies: 5
-- Name: sq_tipoproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipoproduto
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipoproduto OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 2477
-- Name: sq_tipoproduto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipoproduto', 3, true);


--
-- TOC entry 2478 (class 1259 OID 29072)
-- Dependencies: 5
-- Name: sq_tipopromocao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipopromocao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipopromocao OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 2478
-- Name: sq_tipopromocao; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipopromocao', 5, true);


--
-- TOC entry 2479 (class 1259 OID 29074)
-- Dependencies: 5
-- Name: sq_tipostatuspedido; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipostatuspedido
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipostatuspedido OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 2479
-- Name: sq_tipostatuspedido; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipostatuspedido', 7, true);


--
-- TOC entry 2480 (class 1259 OID 29076)
-- Dependencies: 5
-- Name: sq_tipousuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_tipousuario
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sq_tipousuario OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 2480
-- Name: sq_tipousuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_tipousuario', 7, true);


--
-- TOC entry 2481 (class 1259 OID 29078)
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
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 2481
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 30, true);


--
-- TOC entry 2482 (class 1259 OID 29080)
-- Dependencies: 2880 5
-- Name: tipobandeiracartao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipobandeiracartao (
    _codigo integer DEFAULT nextval('sq_tipobandeiracartao'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipobandeiracartao OWNER TO postgres;

--
-- TOC entry 2483 (class 1259 OID 29083)
-- Dependencies: 2881 5
-- Name: tipoendereco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoendereco (
    _codigo integer DEFAULT nextval('sq_tipoendereco'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipoendereco OWNER TO postgres;

--
-- TOC entry 2484 (class 1259 OID 29086)
-- Dependencies: 2882 5
-- Name: tipoformapagamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoformapagamento (
    _codigo integer DEFAULT nextval('sq_tipoformapagamento'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipoformapagamento OWNER TO postgres;

--
-- TOC entry 2485 (class 1259 OID 29089)
-- Dependencies: 2883 5
-- Name: tipohistorico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipohistorico (
    _codigo integer DEFAULT nextval('sq_tipohistorico'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipohistorico OWNER TO postgres;

--
-- TOC entry 2486 (class 1259 OID 29092)
-- Dependencies: 2884 5
-- Name: tipomovimento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipomovimento (
    _codigo bigint DEFAULT nextval('sq_tipomovimento'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipomovimento OWNER TO postgres;

--
-- TOC entry 2487 (class 1259 OID 29095)
-- Dependencies: 2885 5
-- Name: tipoproduto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipoproduto (
    _codigo integer DEFAULT nextval('sq_tipoproduto'::regclass) NOT NULL,
    _descricao character varying(20) NOT NULL
);


ALTER TABLE public.tipoproduto OWNER TO postgres;

--
-- TOC entry 2488 (class 1259 OID 29098)
-- Dependencies: 2886 5
-- Name: tipopromocao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipopromocao (
    _codigo bigint DEFAULT nextval('sq_tipopromocao'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipopromocao OWNER TO postgres;

--
-- TOC entry 2489 (class 1259 OID 29101)
-- Dependencies: 2887 5
-- Name: tipostatuspedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipostatuspedido (
    _codigo integer DEFAULT nextval('sq_tipostatuspedido'::regclass) NOT NULL,
    _descricao character varying(150) NOT NULL
);


ALTER TABLE public.tipostatuspedido OWNER TO postgres;

--
-- TOC entry 2490 (class 1259 OID 29104)
-- Dependencies: 2888 5
-- Name: tipousuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipousuario (
    _codigo bigint DEFAULT nextval('sq_tipousuario'::regclass) NOT NULL,
    _descricao character varying(30) NOT NULL,
    _nivelacesso numeric(2,0) NOT NULL
);


ALTER TABLE public.tipousuario OWNER TO postgres;

--
-- TOC entry 2491 (class 1259 OID 29107)
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
-- TOC entry 2992 (class 0 OID 28951)
-- Dependencies: 2431
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (1, 2, 'Avaliei este produto', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (2, 228, 'Teste de avaliar', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (3, 228, 'Seria Legal', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (4, 228, 'Mais uma Avaliação', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (5, 228, 'erro??', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (9, 228, 'Nao mais', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (10, 1, 'avaliando', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (11, 4, 'Gostosas!!
Cachorras!!!
safadas!!!!', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (12, 5, 'Gostosa!
Loira!
Cachorra!!!
Cantora!!!
hehehehe', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (13, 3, 'é uma fortaleza digital msm', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (14, 7, 'eu prefiro a ashely!', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (15, 7, 'eu nao gosto', 14);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (16, 230, 'isso é Muuuuuuuuuuuuuito bom', 13);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (17, 7, 'Nicoli???? Gostooooosaaaaaaa!!!!!!!
Ashley? Gostosaaaaaaaaaaaaa!!!!!!
Jéssica??? Gostosaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!!!!!!', 17);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (18, 5, 'conheço em..
já fui mto ali!!!!
ela continua gostosa!!!', 17);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (19, 2, 'Legal o livrim..
cheio de misterim...', 17);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (20, 2, 'dcdscsdvfvfbcv', 13);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (21, 228, 'teste produto
', 23);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (22, 232, 'Testevnos', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (23, 8, 'Eu gosto deles', 4);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (24, 3, 'Produto legal...', 24);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (25, 7, 'pouca vergonha... safadões!!!', 24);
INSERT INTO avaliacao (_codigo, _produto, _avaliacao, _usuario) VALUES (26, 7, 'Teste de avaliação', 23);


--
-- TOC entry 2993 (class 0 OID 28956)
-- Dependencies: 2433
-- Data for Name: avaliaratendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (32, 'leonidiao', 4, '2008-06-01');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (34, 'Ahh... legalzim qd funciona!! mas é dificil ....', 17, '2008-06-01');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (38, 'que merda Ã© essa ....', 13, '2008-06-02');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (39, 'Essa porra agora funciona..!!!', 13, '2008-06-03');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (40, 'teste', 4, '2008-06-03');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (42, 'eu sou gay e dai ....', 4, '2008-06-07');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (41, 'sads', 13, '2008-10-03');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (43, 'teste', 13, '2008-10-02');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (35, 'tst', 4, '2008-06-02');
INSERT INTO avaliaratendimento (_codigo, _avaliacao, _usuario, _dataavaliacao) VALUES (44, 'esta bosta funciona', 13, '2008-10-06');


--
-- TOC entry 2994 (class 0 OID 28964)
-- Dependencies: 2435
-- Data for Name: boleto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (0, 69.690002, 72.690002, 666, 1, 1, '2008-05-31', '2008-05-26', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (5, 25.99, 28.99, 666, 25, 1, '2008-05-31', '2008-05-26', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (27, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (28, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (29, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (30, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (31, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (32, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (33, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (34, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (35, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (37, 1, 29.99, 33, 666, 1, '2030-05-08', '2026-05-08', 'Ovni');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (39, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (41, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (43, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (45, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (47, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (49, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (51, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (53, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (55, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (57, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (59, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (61, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (63, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (65, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (67, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (69, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (71, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (73, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (75, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (77, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (79, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (81, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (83, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (85, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (87, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (89, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (91, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (93, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (95, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (97, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (99, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (101, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (103, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (105, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (107, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (109, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (111, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (113, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (115, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (117, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (119, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (121, 54.779999, 57.779999, 666, 90, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (123, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (125, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (127, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (129, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (131, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (133, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (135, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (137, 54.779999, 57.779999, 666, 34, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (139, 55.689999, 58.689999, 666, 32, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (141, 55.689999, 58.689999, 666, 32, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (143, 69.690002, 72.690002, 666, 80, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (145, 2000, 2003, 666, 123, 14, '2008-06-06', '2008-06-01', 'Ovni.Net');
INSERT INTO boleto (_codigo, _valor, _valorboleto, _nossonumero, _numeropedido, _usuario, _datavencimento, _dataprocessamento, _cedente) VALUES (147, 222, 225, 666, 12341, 4, '2008-06-06', '2008-06-01', 'Ovni.Net');


--
-- TOC entry 2995 (class 0 OID 28970)
-- Dependencies: 2437
-- Data for Name: caracttipoproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (1, 'EDITORA', 1);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (2, 'ISBN', 1);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (3, 'NUMERO PAGINAS', 1);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (4, 'EDICAO', 1);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (5, 'SINOPSE', 1);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (6, 'DURACAO', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (7, 'FAIXAS', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (8, 'ELENCO', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (9, 'REGIAO', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (10, 'GRAVADORA', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (11, 'FORMATO DE TELA', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (12, 'SISTEMA DE SOM', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (13, 'EDICAO', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (14, 'SINOPSE', 2);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (15, 'FAIXAS', 3);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (16, 'DURACAO', 3);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (17, 'GRAVADORA', 3);
INSERT INTO caracttipoproduto (_codigo, _descricao, _tipoproduto) VALUES (18, 'SISTEMA DE SOM', 3);


--
-- TOC entry 2996 (class 0 OID 28975)
-- Dependencies: 2439
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (1, 'COMERCIO EXTERIOR', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (2, 'DESENVOLVIMENTO PROFISSIONAL', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (3, 'EMPRESAS E NEGOCIOS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (4, 'FINANÇAS E MERCADOS CAPITAIS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (5, 'OUTROS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (6, 'GLOBALIZAÇAO', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (7, 'LIDERANÇA E GESTAO DE EQUIPES', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (8, 'MBA', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (9, 'MARKETING', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (10, 'METODOLOGIA DE PESQUISA', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (11, 'PLANEJAMENTO ESTRATEGICO', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (12, 'PRODUÇAO E LOGISTICA', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (13, 'QUALIDADE', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (14, 'RECURSOS HUMANOS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (15, 'RELAÇOES INTERNACIONAIS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (16, 'SECRETARIADO', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (17, 'TEC. INFORMAÇAO E COM. ELETRONICO', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (18, 'TERCEIRO SETOR', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (19, 'VENDAS E SERVIÇOS', 1);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (20, 'OUTROS', 2);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (21, 'VEGETAIS', 2);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (22, 'FONTES', 2);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (23, 'TERRA', 2);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (24, 'ANIMAIS DIVERSOS', 3);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (25, 'CAES', 3);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (26, 'GATOS', 3);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (27, 'OUTROS', 3);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (28, 'ARTES E ANTIGUIDADES', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (29, 'BIOGRAFIAS & MEMORIAS', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (30, 'DANÇA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (31, 'DESENHO', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (32, 'ESCULTURA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (33, 'FOTOGRAFIA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (34, 'OUTROS', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (35, 'GIFTS E JOALHERIA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (36, 'JOGOS', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (37, 'MUSICA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (38, 'PINTURA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (39, 'TEATRO', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (40, 'TEORIA E HISTORIA', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (41, 'TRABALHOS AMNUAIS', 4);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (42, 'AUTO-ESTIMA', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (43, 'CRENÇAS', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (44, 'DEPRESSAO', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (45, 'DESENVOLVIMENTO PROFISSIONAL', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (46, 'FENG SHUI', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (47, 'OUTROS', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (48, 'MEDITAÇAO E REFLEXAO', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (49, 'NEUROLINGUISTICA & PNL', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (50, 'RELACIONAMENTOS', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (51, 'SEXOLOGIA & SEXUALIDADE', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (52, 'STRESS', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (53, 'SUCESSO', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (54, 'UFOLOGIA', 5);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (55, 'AVICULTURA, APICULTURA E AQUACULTURA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (56, 'BOTANICA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (57, 'CIENCIAS COGNITIVAS', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (58, 'CIENCIAS NATURAIS', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (59, 'ECOLIGIA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (60, 'GENETICA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (61, 'OUTROS', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (62, 'BIOLOGIA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (63, 'PALEONTOLOGIA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (64, 'PECUARIA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (65, 'ZOOLOGIA', 6);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (66, 'ASTRONOMIA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (67, 'AUDITORIA E CONTROLADORIA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (68, 'CIENCIAS ATUARIAIS (SEGUROS)', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (69, 'CIENCIAS CONTABEIS', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (70, 'CIENCIAS DA TERRA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (71, 'ESTATISTICA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (72, 'FISICA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (73, 'OUTROS', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (74, 'MATEMATICA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (75, 'QUIMICA', 7);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (76, 'PORTUGUES', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (77, 'ANTROPOLOGIA', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (78, 'CIENCIA POLITICA', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (79, 'CIENCIAS SOCIAIS', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (80, 'FILOSOFIA', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (81, 'OUTROS', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (82, 'SOCIOLOGIA', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (83, 'ENSINO RELIGIOSO', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (84, 'ESTUDOS SOCIAIS', 8);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (85, 'BIBLIOTECONOMIA', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (86, 'CINEMA', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (87, 'DESIGN INDUSTRIAL E GRAFICO', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (88, 'EDITORAÇAO', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (89, 'FOTOGRAFIA', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (90, 'OUTROS', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (91, 'JORNALISMO', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (92, 'PUBLICIDADE E PROPAGANDA', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (93, 'RELAÇOES PUBLICAS', 9);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (94, 'BEBIDAS', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (95, 'CULINARIA', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (96, 'CULINARIA INTERNACIONAL', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (97, 'CULINARIA NACIONAL', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (98, 'DIET E LIGHT', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (99, 'DOCES E SOBREMESAS', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (100, 'ETIQUETA', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (101, 'OUTROS', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (102, 'NATURAL E VEGETARIANA', 10);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (103, 'DICIONARIOS & MATERIAIS REFERENCIA', 11);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (104, 'DICIONARIOS BILINGUES', 11);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (105, 'DICIONARIOS MONOLINGUES', 11);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (106, 'DICIONARISO TEMATICOS & ENCICLOPEDIAS', 11);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (107, 'OUTROS', 11);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (108, 'ADMINISTRATIVO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (109, 'AMBIENTAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (110, 'CIVIL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (111, 'COMERCIAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (112, 'CONSTITUCIONAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (113, 'CONSUMIDOR', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (114, 'CRIANÇA E ADOLESCENTE', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (115, 'DESPORTIVO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (116, 'DICIONARIOS', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (117, 'ELEITORAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (118, 'EMPRESARIAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (119, 'FINANCEIRO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (120, 'OUTROS', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (121, 'INTERNACIONAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (122, 'JURISPRUDENCIA', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (123, 'LEGISLAÇAO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (124, 'PENAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (125, 'PREVIDENCIARIO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (126, 'PROCESSUAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (127, 'PROCESSUAL - CIVIL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (128, 'PROCESSUAL - PENAL', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (129, 'PROCESSUAL - TRABALHISTA', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (130, 'TRABALHISTA', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (131, 'TRIBUTARIO', 12);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (132, 'ECONOMIA FINANCEIRA', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (133, 'ECONOMIA INTERNACIONAL', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (134, 'ECONOMIA NACIONAL', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (135, 'OUTROS', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (136, 'GLOBALIZAÇAO', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (137, 'MACROECONOMIA', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (138, 'MICROECONOMIA', 13);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (139, 'AGRONOMICA', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (140, 'ALIMENTOS', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (141, 'CIVIL E HIDRAULICA', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (142, 'ELETRONICA - TELECOMUNICAÇOES', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (143, 'ELTRO-ELETRONICA', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (144, 'OUTROS', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (145, 'MECANICA', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (146, 'METALURGICA', 14);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (147, 'ALEMAO', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (148, 'ESPANHOL', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (149, 'FRANCES', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (150, 'OUTROS', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (151, 'GREGO', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (152, 'HEBRAICO', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (153, 'INGLES', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (154, 'ITALIANO', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (155, 'JAPONES', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (156, 'LATIM', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (157, 'POLONES', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (158, 'ARABE', 15);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (159, 'ASTROLOGIA', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (160, 'CABALA', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (161, 'OUTROS', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (162, 'I CHING', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (163, 'MAGIA', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (164, 'NUMEROLOGIA', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (165, 'OCULTISMO', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (166, 'TARO', 16);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (167, 'ATLAS GEOGRAFICO', 17);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (168, 'GEOGRAFIA', 17);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (169, 'GEOPOLITICA', 17);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (170, 'HISTORIA GERAL', 17);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (171, 'HISTORIA DO BRASIL', 17);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (172, 'CONTOS E CRONICAS', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (173, 'DC COMICS', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (174, 'HUMOR', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (175, 'MANGAS', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (176, 'OUTROS', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (177, 'RPG', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (178, 'SATIRA', 18);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (179, 'ARTES E OFICIOS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (180, 'BARNEY', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (181, 'BRINQUEDOS E JOGOS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (182, 'DESVENTURAS EM SERIES', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (183, 'IDIOMAS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (184, 'INFANTIL - 0 A 3 ANOS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (185, 'INFANTIL - 4 A 8 ANOS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (186, 'JOGOS', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (187, 'LITERATURA INFANTIL', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (188, 'LITERATURA JUVENIL', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (189, 'MONTEIRO LOBATO', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (190, 'TURMA DA MONICA', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (191, 'WALT DISNEY', 19);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (192, 'ANALISE DE SISTEMAS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (193, 'APLICATIVOS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (194, 'BANCO DE DADOS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (195, 'COMPUTAÇAO GRAFICA', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (196, 'ENGENHARIA DE SOFTWARE', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (197, 'OUTROS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (198, 'GERENCIAMENTO DE PROJETOS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (199, 'HARDWARE', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (200, 'INTELIGENCIA ARTIFICIAL', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (201, 'INTERNET', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (202, 'PROGRAMAÇAO', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (203, 'REDES', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (204, 'SEGURANÇA', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (205, 'SISTEMAS OPERACIONAIS', 20);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (206, 'ADMINISTRAÇAO E NEGOCIOS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (207, 'AGRONOMIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (208, 'ANIMAIS DE ESTIMAÇAO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (209, 'ARTES', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (210, 'AUTO-AJUDA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (211, 'CIENCIAS BIOLOGICA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (212, 'CIENCIAS EXATAS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (213, 'CIENCIAS HUMANAS E SOCIAIS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (214, 'COMUNICAÇAO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (215, 'CULINARIA E GASTRONOMIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (216, 'DICIONARIOS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (217, 'DIREITO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (218, 'ECONOMIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (219, 'ENGENHARIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (220, 'LINGUAS ESTRANGEIRAS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (221, 'ESOTERISMO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (222, 'HISTORIA E GEOGRAFIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (223, 'QUADRINHOS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (224, 'INFANTO-JUVENIL', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (225, 'INFORMATICA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (226, 'LITERATURA ESTRANGEIRA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (227, 'LITERATURA NACIONAL', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (228, 'MEDICINA E SAUDE', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (229, 'MODA E BELEZA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (230, 'PALAVRAS CRUZADAS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (231, 'POCKETS', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (232, 'PSICOLOGIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (233, 'RELIGIAO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (234, 'TURISMO', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (235, 'VETERINARIA', 21);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (236, 'BIOGRAFIAS, DIARIOS, CARTAS E MEMORIAS', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (237, 'CONTOS E CRONICAS', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (238, 'CRIMES REAIS', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (239, 'FICÇAO CIENTIFICA', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (240, 'FICÇAO FANTASIOSA', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (241, 'FICÇAO DE TERROR E SUSPENSE', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (242, 'OUTROS', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (243, 'MITOLOGIA', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (244, 'POESIA', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (245, 'POLICIAL', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (246, 'ROMANCE', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (247, 'SUSPENSE', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (248, 'TEORIA E CRITICA LITERARIA', 22);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (249, 'BIOGRAFIAS, DIARIOS, CARTAS E MEMORIAS', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (250, 'CONTOS E CRONICAS', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (251, 'CRIMES REAIS', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (252, 'FICÇAO CIENTIFICA', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (253, 'FICÇAO FANTASIOSA', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (254, 'FICÇAO DE TERROR E SUSPENSE', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (255, 'OUTROS', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (256, 'MITOLOGIA', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (257, 'POESIA', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (258, 'POLICIAL', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (259, 'ROMANCE', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (260, 'SUSPENSE', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (261, 'TEORIA E CRITICA LITERARIA', 23);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (262, 'ACUPUNTURA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (263, 'ANATOMIA E FISIOLOGIA HUMANA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (264, 'BIOETICA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (265, 'CARDIOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (266, 'CIRURGIAS', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (267, 'DEMARTOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (268, 'DIETAS', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (269, 'ENFERMAGEM', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (270, 'ESPECIALIDADES MEDICAS', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (271, 'EXAMES', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (272, 'FARMACOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (273, 'FISIOTERAPIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (274, 'FONOAUDIOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (275, 'GINECOLOGIA E OBSTRETIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (276, 'MASSAGEM', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (277, 'MEDICINA GERAL', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (278, 'NUTRIÇAO', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (279, 'ODONTOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (280, 'PATOLOGIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (281, 'PUERICULTURA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (282, 'PSIQUIATRIA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (283, 'SAUDE PUBLICA', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (284, 'TERAPIA OCUPACIONAL', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (285, 'TERAPIAS ALTERNATIVAS', 24);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (286, 'OUTROS', 25);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (287, 'ROUPAS', 25);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (288, 'SAPATOS', 25);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (289, 'ACESSORIOS', 25);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (290, 'OUTROS', 26);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (291, 'NIVEL MÉDIO', 26);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (292, 'NIVEL FACIL', 26);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (293, 'NIVEL DIFICIL', 26);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (294, 'NIVEL ULTRA DIFICIL', 26);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (295, 'OUTROS', 27);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (296, 'PASSATEMPO', 27);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (297, 'OUTROS', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (298, 'PEDAGOGIA', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (299, 'PROCESSO MENTAL E INTELIGENCIA', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (300, 'PSICOLOGIA ANALITICA', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (301, 'PSICOLOGIA E PSICANALISE', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (302, 'TERAPIA FAMILIAR', 28);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (303, 'AFRO BRASILEIRAS', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (304, 'BUDISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (305, 'BIBLIAS', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (306, 'CATOLICISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (307, 'CRISTIANISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (308, 'ESPIRITISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (309, 'EVANGELICOS', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (310, 'ISLAMISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (311, 'JUDAISMO', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (312, 'ORIENTAIS', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (313, 'OUTRAS RELIGIOES', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (314, 'TEOLOGIA', 29);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (315, 'ATIVIDADE ECONOMICA', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (316, 'OUTRAS', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (317, 'GUIAS DE CONVERSAÇAO', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (318, 'GUIAS DE VIAGEBM', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (319, 'HOTELARIA & RESTAURANTES', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (320, 'VIAGENS E AVENTURA', 30);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (321, 'MAMIFEROS', 31);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (322, 'ANFIBIOS', 31);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (323, 'OUTROS', 31);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (324, 'OUTROS', 32);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (325, 'TIRO', 32);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (326, 'LUTAS', 32);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (327, 'CORRIDAS', 32);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (328, 'OUTROS', 33);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (329, 'GRÁFICA', 33);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (330, 'COMPUTADORIZADA', 33);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (331, 'OUTROS', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (332, 'JIU-JITSU', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (333, 'KARATÊ', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (334, 'MUAY-THAY', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (335, 'KUNG-FU', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (336, 'BOXE', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (337, 'CAPOEIRA', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (338, 'JUDÔ', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (339, 'TAENKONDO', 34);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (340, 'OUTROS', 35);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (341, 'FLORESTAS', 35);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (342, 'MONTANHAS', 35);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (343, 'MAR', 35);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (344, 'OUTROS', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (345, 'SUSPENSE', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (346, 'DRAMA', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (347, 'ROMANCE', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (348, 'COMÉDIA', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (349, 'AVENTURA', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (350, 'DOCUMENTARIO', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (351, 'MUSICAL', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (352, 'TERROR', 36);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (353, 'OUTROS', 37);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (354, 'MEDIEVAL', 37);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (355, 'CONTEMPORANEO', 37);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (356, 'OUTROS', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (357, 'ANIMADA', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (358, 'INTELIGENTE', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (359, 'REALISTA', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (360, 'COTIDIANA', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (361, 'PASTELÃO', 38);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (362, 'OUTROS', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (363, 'BIOGRAFIAS', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (364, 'CIENCIAS', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (365, 'HISTORIA', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (366, 'GEOGRAFIA', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (367, 'TEOLOGIA', 39);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (368, 'OUTROS', 40);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (369, 'PASTELÃO', 40);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (370, 'FICÇÃO', 40);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (371, 'ROMANTICO', 40);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (372, 'OUTROS', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (373, 'HANDEBOL', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (374, 'FUTSAL', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (375, 'VOLEIBOL', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (376, 'BASQUETE', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (377, 'HIPISMO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (378, 'NATAÇÃO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (379, 'MUSCULAÇÃO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (380, 'ATLETISMO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (381, 'ARREMESO DE PESO ', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (382, 'TRIATLO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (383, 'SALTO DE PARAQUEDAS', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (384, 'SALTO COM VARA', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (385, 'GINASTICA OLIMPICA', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (386, 'TENIS', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (387, 'TENIS DE MESA', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (388, 'XADREZ', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (389, 'TIRO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (390, 'FUTEBOL', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (391, 'PARAQUEDISMO', 41);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (392, 'OUTROS', 42);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (393, 'CIENTIFICA', 42);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (394, 'BIOLOGICA', 42);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (395, 'FISICA', 42);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (396, 'QUIMICA', 42);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (397, 'OUTROS', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (398, 'ASIATICA', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (399, 'NORTE-AMERICANA', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (400, 'EUROPEIA', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (401, 'MEXICANA', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (402, 'SULAMERICANA', 43);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (403, 'OUTROS', 44);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (404, 'FRIA', 44);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (405, 'BIOLOGICA', 44);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (406, 'QUIMICA', 44);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (407, 'OUTROS', 45);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (408, '1-3 ANOS', 45);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (409, '4-6 ANOS', 45);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (410, '7-9 ANOS', 45);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (411, 'OUTROS', 46);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (412, 'LATINO', 46);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (413, 'NACIONAL', 46);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (414, 'INTERNACIONAL', 46);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (415, 'OUTROS', 47);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (416, 'HOMICIDIOS', 47);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (417, 'SUICIDIOS', 47);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (418, 'INVESTIGAÇÃO', 47);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (419, 'CRIMINAIS', 47);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (420, 'OUTROS', 48);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (421, 'TEOLOGIA', 48);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (422, 'CRISTIANISMO', 48);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (423, 'EVANGELICOS', 48);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (424, 'OUTROS', 49);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (425, 'PASTELÃO', 49);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (426, 'CONTEMPORANEO', 49);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (427, 'MELOSO', 49);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (428, 'OUTROS', 50);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (429, 'HISTORIA', 50);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (430, 'PERSONALIDADES', 50);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (431, 'HEROIS', 50);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (432, 'FICÇÃO', 50);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (433, 'OUTROS', 51);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (434, 'FANTASMAS', 51);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (435, 'ASSASSINATOS', 51);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (436, 'CORRIDAS', 51);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (437, 'OUTROS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (438, 'MONSTROS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (439, 'ASSASSINATOS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (440, 'VAMPIROS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (441, 'FANTASMAS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (442, 'JOGOS', 52);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (443, 'OUTROS', 53);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (444, 'NACIONAL', 53);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (445, 'INTERNACIONAL', 53);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (446, 'OUTROS', 54);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (447, 'NACIONAL', 54);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (448, 'INTERNACIONAL', 54);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (449, 'OUTROS', 55);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (450, 'NACIONAL', 55);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (451, 'INTERNACIONAL', 55);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (452, 'OUTROS', 56);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (453, 'NACIONAL', 56);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (454, 'INTERNACIONAL', 56);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (455, 'OUTROS', 57);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (456, 'NACIONAL', 57);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (457, 'INTERNACIONAL', 57);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (458, 'OUTROS', 58);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (459, 'NACIONAL', 58);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (460, 'INTERNACIONAL', 58);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (461, 'OUTROS', 59);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (462, 'NACIONAL', 59);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (463, 'INTERNACIONAL', 59);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (464, 'OUTROS', 60);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (465, 'NACIONAL', 60);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (466, 'INTERNACIONAL', 60);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (467, 'OUTROS', 61);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (468, 'NACIONAL', 61);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (469, 'INTERNACIONAL', 61);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (470, 'OUTROS', 62);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (471, 'NACIONAL', 62);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (472, 'INTERNACIONAL', 62);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (473, 'OUTROS', 63);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (474, 'NACIONAL', 63);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (475, 'INTERNACIONAL', 63);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (476, 'OUTROS', 64);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (477, 'NACIONAL', 64);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (478, 'INTERNACIONAL', 64);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (479, 'OUTROS', 65);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (480, 'NACIONAL', 65);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (481, 'INTERNACIONAL', 65);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (482, 'OUTROS', 66);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (483, 'NACIONAL', 66);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (484, 'INTERNACIONAL', 66);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (485, 'OUTROS', 67);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (486, 'NACIONAL', 67);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (487, 'INTERNACIONAL', 67);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (488, 'OUTROS', 68);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (489, 'NACIONAL', 68);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (490, 'INTERNACIONAL', 68);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (491, 'OUTROS', 69);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (492, 'NACIONAL', 69);
INSERT INTO categoria (_codigo, _descricao, _genero) VALUES (493, 'INTERNACIONAL', 69);


--
-- TOC entry 2997 (class 0 OID 28980)
-- Dependencies: 2441
-- Data for Name: conteudoproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (1, 1, 1, 'PORRA DA EDITORA');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (2, 1, 2, '123456');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (810, 228, 1, 'PORRA');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (811, 228, 2, 'PORRA');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (812, 228, 3, '12412');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (813, 228, 4, '21312');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (814, 228, 5, '12312321');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (815, 230, 1, 'PORRAS LOCAS');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (816, 230, 2, '1241242');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (817, 230, 3, '800');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (818, 230, 4, '1');
INSERT INTO conteudoproduto (_codigo, _produto, _caracttipoproduto, _descricao) VALUES (819, 230, 5, 'pra todos que gostam de meter');


--
-- TOC entry 2998 (class 0 OID 28985)
-- Dependencies: 2443
-- Data for Name: dadoscartao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2999 (class 0 OID 28988)
-- Dependencies: 2444
-- Data for Name: dadosempresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dadosempresa (_codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, _inscrmunicipal, _telefoneprincipal, _cep, _endereco, _numero, _complemento, _bairro, _municipio, _estado, _pais, _ddd, _dddfax, _fax) VALUES (1, 'Ovni.NET - Ofertas de outro planeta', 'Ovni Serviços OnLine S.A.', 23233444233, 12212, 2324, 2629220, '08775320', 'Rua Amélia dos Santos', '539', '', 'Putaria', 'Suzano', 'SP', 'Brasil', 11, 111, 1121231);


--
-- TOC entry 3000 (class 0 OID 28992)
-- Dependencies: 2446
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (66, '2', '2', 2, 2, '2', '2', '2', 'SP', 'Brasil', '2', '2', 2, 244, NULL, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (65, '1', '1', 1, 11, '1', '1', '1', 'SP', 'Brasil', '1', '1', 1, 244, NULL, NULL, true);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (69, '1', '1', 1, 1, '1', '1', '1', 'SP', 'Brasil', '1', '1', 1, NULL, 30, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (70, '2', '2', 2, 2, '2', '2', '2', 'SP', 'Brasil', '2', '2', 2, NULL, 30, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (71, '3', '3', 3, 3, '3', '3', '3', 'SP', 'Brasil', '3', '3', 3, NULL, 30, NULL, true);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (67, '4', '4', 444, 4, '4', '4', '4', 'SP', 'Brasil', '44', '44', 4, NULL, 13, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (49, '2', 'teste', 2, 2, '2', '2', '2', 'SP', 'Brasil', '2', '2', 2, NULL, 13, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (52, '4', '4', 4, 4, '4', '4', '4', 'SP', 'Brasil', '4', '4', 3, NULL, 13, NULL, false);
INSERT INTO endereco (_codigo, _cep, _rua, _numero, _caixapostal, _complemento, _bairro, _municipio, _estado, _pais, _nomereceptor, _referenciaentrega, _tipoendereco, _fornecedor, _usuario, _ultimo, _celular) VALUES (62, '1', '1', 1, 1, '1', '1', '1', 'SP', 'Brasil', '1', '1', 1, NULL, 13, NULL, true);


--
-- TOC entry 3001 (class 0 OID 28997)
-- Dependencies: 2448
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3002 (class 0 OID 29000)
-- Dependencies: 2449
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO fornecedores (_codigo, _nomefantasia, _razaosocial, _cnpj, _inscrestadual, _cei, _inscrmunicipal, _contato, _cargo, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _email) VALUES (244, '1', '1', 1, 1, 1, 1, '1', '1', 1, 1, 1, 1, 1, 1, 'admin@ovni.com');


--
-- TOC entry 3003 (class 0 OID 29004)
-- Dependencies: 2451
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (1, 'ADMINISTRAÇAO E NEGOCIOS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (2, 'AGRONOMIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (3, 'ANIMAIS DE ESTIMAÇAO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (4, 'ARTES', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (5, 'AUTO-AJUDA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (6, 'CIENCIAS BIOLOGICAS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (7, 'CIENCIAS EXATAS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (8, 'CIENCIAS HUMANAS E SOCIAIS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (9, 'COMUNICAÇAO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (10, 'CULINARIA E GASTRONOMIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (11, 'DICIONARIOS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (12, 'DIREITO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (13, 'ECONOMIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (14, 'ENGENHARIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (15, 'LINGUAS ESTRANGEIRAS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (16, 'ESOTERISMO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (17, 'HISTORIA E GEOGRAFIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (18, 'QUADRINHOS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (19, 'INFANTO-JUVENIL', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (20, 'INFORMATICA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (21, 'KITS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (22, 'LITERATURA ESTRANGEIRA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (23, 'LITERATURA NACIONAL', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (24, 'MEDICINA E SAUDE', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (25, 'MODA E BELEZA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (26, 'PALAVRAS CRUZADAS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (27, 'POCKETS', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (28, 'PSICOLOGIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (29, 'RELIGIAO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (30, 'TURISMO', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (31, 'VETERINARIA', 1);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (32, 'AÇAO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (33, 'ANIMAÇAO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (34, 'ARTES MARCIAIS', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (35, 'AVENTURA', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (36, 'CINEMA NACIONAL', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (37, 'CLASSICO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (38, 'COMEDIA', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (39, 'DOCUMENTARIO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (40, 'DRAMA', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (41, 'ESPORTE', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (42, 'FICÇAO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (43, 'GASTRONOMIA', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (44, 'GUERRA', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (45, 'INFANTIL', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (46, 'MUSICAL', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (47, 'POLICIAL', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (48, 'RELIGIOSO', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (49, 'ROMANCE', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (50, 'SERIADOS MINISSERIES', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (51, 'SUSPENSE', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (52, 'TERROR', 2);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (53, 'BLUES', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (54, 'CLASSICOS', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (55, 'COLETANEA', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (56, 'DANCE E MUSICA ELETRONICA', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (57, 'FORRO', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (58, 'GOSPEL', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (59, 'INFANTIL & TEEN', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (60, 'INSTRUMENTAL', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (61, 'JAZZ', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (62, 'POP E ROCK', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (63, 'RAP, FUNK E SOUL', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (64, 'REGGAE', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (65, 'RELIGIOSAS', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (66, 'SAMBA, AXE E PAGODE', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (67, 'SERTANEJO E COUNTRY', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (68, 'TRILHA SONORA', 3);
INSERT INTO genero (_codigo, _descricao, _tipoproduto) VALUES (69, 'BOX', 3);


--
-- TOC entry 3004 (class 0 OID 29009)
-- Dependencies: 2453
-- Data for Name: historico; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3005 (class 0 OID 29014)
-- Dependencies: 2455
-- Data for Name: imagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO imagem (_codigo, _url, _produto) VALUES (2, 'imgs/produtos/3_1.jpg', 3);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (1, 'imgs/produtos/2_1.jpg', 2);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (3, 'imgs/produtos/4_1.jpg', 4);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (4, 'imgs/produtos/5_1.jpg', 5);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (5, 'imgs/produtos/6_1.gif', 6);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (6, 'imgs/produtos/7_1.gif', 7);
INSERT INTO imagem (_codigo, _url, _produto) VALUES (7, 'imgs/produtos/8_1.gif', 8);


--
-- TOC entry 3006 (class 0 OID 29022)
-- Dependencies: 2457
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (99, 8, 153, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (100, 228, 154, 1, 9, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (101, 8, 155, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (102, 5, 156, 1, 17.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (103, 3, 157, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (104, 3, 158, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (105, 8, 158, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (106, 228, 159, 1, 9, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (107, 8, 160, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (108, 2, 161, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (109, 3, 162, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (110, 8, 163, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (111, 3, 164, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (112, 228, 166, 1, 9, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (113, 8, 167, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (114, 3, 168, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (115, 2, 168, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (116, 1, 168, 1, 24.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (117, 6, 168, 1, 23.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (118, 8, 168, 1, 49.990001678466797, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (119, 4, 168, 1, 17.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (120, 3, 169, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (121, 228, 170, 1, 9, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (122, 1, 171, 1, 24.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (123, 2, 172, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (124, 3, 173, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (125, 232, 174, 1, 90, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (126, 1, 175, 1, 24.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (127, 2, 176, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (128, 3, 177, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (129, 1, 178, 1, 24.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (130, 1, 179, 1, 24.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (131, 3, 179, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (132, 3, 180, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (133, 1, 181, 20, 499.79998779296875, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (134, 2, 182, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (135, 3, 183, 3, 59.850002288818359, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (136, 6, 184, 4, 95.959999084472656, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (137, 3, 185, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (138, 2, 186, 3, 74.850006103515625, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (139, 3, 187, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (140, 2, 188, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (141, 2, 193, 1, 24.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (142, 3, 196, 1, 19.950000762939453, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (143, 4, 197, 1, 17.989999771118164, NULL);
INSERT INTO item (_codigo, _produto, _pedidodesktopwap, _quantidade, _valortotal, _valorfrete) VALUES (144, 4, 198, 1, 17.989999771118164, NULL);


--
-- TOC entry 3007 (class 0 OID 29027)
-- Dependencies: 2459
-- Data for Name: movimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO movimento (_codigo, _produto, _tipomovimento, _quantidade) VALUES (1, 1, 2, 10);
INSERT INTO movimento (_codigo, _produto, _tipomovimento, _quantidade) VALUES (2, 232, 1, 60);
INSERT INTO movimento (_codigo, _produto, _tipomovimento, _quantidade) VALUES (3, 1, 1, 10);
INSERT INTO movimento (_codigo, _produto, _tipomovimento, _quantidade) VALUES (4, 1, 2, 6);


--
-- TOC entry 3008 (class 0 OID 29030)
-- Dependencies: 2460
-- Data for Name: pedidodesktopwap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (2, 4, 1, 1, '2008-04-04', NULL, 50, NULL, '17:00:52.468', 1, 1, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (4, 4, 2, 1, '2008-06-01', '2008-06-01', 10, '19:04:12.812', '19:02:40.984', 1, 1, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (153, 4, 1, 1, '2008-06-07', NULL, 52.990001678466797, NULL, '20:31:36.39', 1, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (154, 4, 1, 3, '2008-06-07', NULL, 9, NULL, '20:32:01.812', 3, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (155, 4, 1, 3, '2008-06-07', NULL, 49.990001678466797, NULL, '20:38:03.875', 3, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (156, 4, 1, 2, '2008-06-07', NULL, 17.989999771118164, NULL, '20:43:31.437', 3, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (157, 4, 1, 3, '2008-06-07', NULL, 19.950000762939453, NULL, '21:01:32.484', 3, 24, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (158, 4, 1, 1, '2008-06-13', NULL, 72.94000244140625, NULL, '13:00:39.828', 1, 24, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (159, 4, 1, 2, '2008-06-13', NULL, 9, NULL, '13:04:31.984', 2, 24, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (160, 23, 1, 3, '2008-06-13', NULL, 49.990001678466797, NULL, '23:59:09.687', 3, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (161, 23, 1, 1, '2008-06-14', NULL, 27.950000762939453, NULL, '00:10:42.14', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (162, 23, 1, 1, '2008-06-14', NULL, 22.950000762939453, NULL, '00:12:29.062', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (163, 23, 1, 1, '2008-06-14', NULL, 52.990001678466797, NULL, '00:27:08.234', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (164, 23, 1, 1, '2008-06-14', NULL, 22.950000762939453, NULL, '00:29:32.125', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (165, 23, 1, 1, '2008-06-14', NULL, 3, NULL, '00:29:32.578', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (166, 23, 1, 1, '2008-06-14', NULL, 12, NULL, '00:31:55.468', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (167, 23, 1, 1, '2008-06-14', NULL, 52.990001678466797, NULL, '00:39:43.546', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (168, 23, 1, 1, '2008-06-14', NULL, 164.8600025177002, NULL, '00:41:41.25', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (169, 23, 1, 1, '2008-06-14', NULL, 22.950000762939453, NULL, '00:55:03.812', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (171, 23, 2, 1, '2008-06-14', NULL, 27.989999771118164, NULL, '08:31:16.89', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (170, 23, 3, 1, '2008-06-14', NULL, 12, NULL, '00:59:39.171', 1, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (172, 4, 1, 1, '2008-06-14', NULL, 27.950000762939453, NULL, '14:50:25.369', 1, 24, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (173, 23, 1, 2, '2008-06-14', NULL, 19.950000762939453, NULL, '14:51:33.947', 2, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (174, 4, 1, 1, '2008-06-14', NULL, 93, NULL, '15:01:04.134', 1, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (175, 4, 2, 1, '2008-06-14', NULL, 27.989999771118164, NULL, '15:01:46.806', 1, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (176, 4, 1, 1, '2008-06-14', NULL, 27.950000762939453, NULL, '15:47:33.525', 1, 5, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (177, 24, 1, 1, '2008-06-15', NULL, 22.950000762939453, NULL, '23:08:51.796', 1, 26, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (178, 23, 1, 3, '2008-07-20', NULL, 24.989999771118164, NULL, '16:54:12.14', 2, 25, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (179, 13, 1, 1, '2008-07-27', NULL, 47.940000534057617, NULL, '11:39:59.375', 1, 20, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (180, 23, 1, 1, '2008-08-07', NULL, 22.950000762939453, NULL, '21:23:04.578', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (181, 23, 1, 1, '2008-08-11', NULL, 502.79998779296875, NULL, '20:55:23.546', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (182, 23, 1, 1, '2008-08-11', NULL, 27.950000762939453, NULL, '20:58:48.156', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (183, 23, 1, 1, '2008-08-11', NULL, 62.850002288818359, NULL, '21:02:00.546', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (184, 23, 1, 2, '2008-08-11', NULL, 95.959999084472656, NULL, '21:03:04.921', 3, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (185, 25, 1, 1, '2008-08-11', NULL, 22.950000762939453, NULL, '21:08:25.703', 1, 30, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (186, 23, 1, 1, '2008-08-12', NULL, 77.850006103515625, NULL, '20:02:26.812', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (187, 23, 1, 1, '2008-08-14', NULL, 22.950000762939453, NULL, '16:32:00.109', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (188, 23, 1, 2, '2008-08-14', NULL, 24.950000762939453, NULL, '16:32:26.218', 3, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (190, 23, 1, 2, '2008-08-14', NULL, 19.950000762939453, NULL, '16:56:19.50', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (191, 23, 1, 2, '2008-08-14', NULL, 0, NULL, '16:56:31.296', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (193, 23, 1, 3, '2008-08-14', NULL, 24.950000762939453, NULL, '16:57:06.64', 3, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (194, 23, 1, 3, '2008-08-14', NULL, 23.989999771118164, NULL, '19:48:40.359', 1, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (195, 23, 1, 3, '2008-08-14', NULL, 0, NULL, '19:49:00.062', 3, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (196, 23, 1, 3, '2008-08-14', NULL, 19.950000762939453, NULL, '19:51:12.64', 3, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (197, 23, 1, 2, '2008-08-14', NULL, 17.989999771118164, NULL, '19:56:44.921', 2, 29, NULL);
INSERT INTO pedidodesktopwap (_codigo, _usuario, _tipostatuspedido, _formapagamento, _datapedido, _datapagamento, _totalpedido, _horapagamento, _horapedido, _parcelas, _codigoendereco, _codigorastreamento) VALUES (198, 23, 1, 3, '2008-08-14', NULL, 17.989999771118164, NULL, '19:57:29.64', 2, 29, NULL);


--
-- TOC entry 3009 (class 0 OID 29032)
-- Dependencies: 2461
-- Data for Name: pedidosms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (23, 13, 3, 1, 19.950000762939453, 1, '2008-09-26', 20.950000762939453, 1);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (24, 13, 4, 1, 17.989999771118164, 1, '2008-09-26', 18.989999771118164, 1);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (25, 13, 2, 1, 24.950000762939453, 1, '2008-09-26', 25.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (26, 13, 3, 1, 19.950000762939453, 0, '2008-09-26', 19.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (27, 13, 2, 1, 24.950000762939453, 0, '2008-09-26', 24.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (28, 13, 2, 1, 24.950000762939453, 0, '2008-09-26', 24.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (29, 13, 2, 1, 24.950000762939453, 0, '2008-09-26', 24.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (30, 13, 4, 1, 17.989999771118164, 8.8000000000000007, '2008-09-26', 26.789999771118165, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (31, 13, 2, 1, 24.950000762939453, 0, '2008-09-26', 24.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (32, 13, 2, 1, 24.950000762939453, 8.8000000000000007, '2008-09-26', 33.75000076293945, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (33, 13, 2, 1, 24.950000762939453, 0, '2008-09-27', 24.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (34, 13, 4, 1, 17.989999771118164, 0, '2008-09-27', 17.989999771118164, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (35, 13, 3, 1, 19.950000762939453, 0, '2008-09-27', 19.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (36, 13, 3, 1, 19.950000762939453, 0, '2008-09-29', 19.950000762939453, 2);
INSERT INTO pedidosms (_codigo, _usuario, _produto, _statuspedido, _valortotal, _frete, _datapedido, _valorcompra, _endereco) VALUES (37, 13, 7, 1, 22.979999542236328, 0, '2008-10-14', 22.979999542236328, 2);


--
-- TOC entry 3010 (class 0 OID 29045)
-- Dependencies: 2466
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (8, 'Live After Death', 0.56300002, 49.990002, 'PC', 131, 1213, 12312, 'ESTRANGEIRA', 'EUA', 1985, 'Iron Maiden', 'Inglês', 2, 46, 414, 2, 'O DVD Live After Death traz o lendário registro das quatro<br>  noites de show do Iron Maiden no Long Beach Arena, Califórnia, em 1984.', 0, 4, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (6, 'Na Arena - Ao Vivo', 0.56300002, 23.99, 'PC', 13, 121, 12121212, 'NACIONAL', 'BRASIL', 2008, 'Edson & Hudson', 'Português', 2, 46, 413, 2, 'O DVD Na Arena Ao Vivo foi gravado durante a Festa do Peão de Osasco em São Paulo,<br> e tem como destaque músicas inéditas e as participações de Bruno & Marrone e Tchê Garotos', 0, 12, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (1, 'Anjos e Demônios', 0.5, 24.99, 'PC', 12, 12, 1321213, 'ESTRANGEIRA', 'EUA', 2002, 'Dan Brown', 'Inglês', 1, 15, 153, 1, 'Primeira Aventura de Robert Langdon', 0, 35, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (230, 'Kama Sutra', 0, 1, 'PC', 1, 1, 1, 'ESTRANGEIRA', 'INDIA', 1490, 'So DEUS sabe', 'Putaria', 1, 4, 28, 1, 'Putaria so alegria!', 0, 6, false);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (9, 'Regininha...Hu', 0.53399998, 10, 'PC', 12123, 12312312, 231231, 'NACIONAL', 'BRASIL', 2000, 'Brasileirinhas', 'Português', 2, 32, 414, 2, 'Huuuuuu', 0, 21, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (228, 'teste', 99, 9, 'PC', 121, 12129, 192912, 'nacional', 'BRASIL', 2008, 'Erros Constantes', 'pintoles', 1, 1, 3, 4, 'testee', 0, 74, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (4, 'The PussyCat Dools', 0.34400001, 17.99, 'PC', 19, 19, 21123123, 'ESTRANGEIRA', 'EUA', 1999, 'Pussycat Dools ', 'Inglês', 3, 63, 475, 2, 'O melhor do black com as gatas do PussyCat Dools', 0, 42, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (5, 'The Ducthes', 0.34400001, 17.99, 'PC', 19, 19, 23423423, 'ESTRANGEIRA', 'EUA', 2000, 'Fergie', 'Inglês', 3, 63, 475, 2, 'Fergie huuuuuuuu', 0, 18, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (7, 'Live From London', 0.56300002, 22.98, 'PC', 131, 131, 1212312312, 'ESTRANGEIRA', 'EUA', 2006, 'Pussycat Dools', 'Inglês', 2, 46, 414, 2, 'Pussycat Dolls: Live from London apresenta a performance ao vivo de Nicole, Carmit, Melody, Jessica, Ashley e Kimberly,<BR> as garotas que conseguiram ter 5 singles no topo das paradas.', 0, 31, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (3, 'Fortaleza Digital', 0.5, 19.950001, 'PC', 12, 12, 12131231, 'ESTRANGEIRA', 'EUA', 1999, 'Dan Brown', 'Inglês', 1, 15, 153, 1, 'Entre nessa aventura de códigos', 0, 37, true);
INSERT INTO produtos (_codigo, _titulo, _pesokg, _valor, _unidade, _ipi, _icms, _classfiscal, _procedencia, _paisorigem, _anolancamento, _autorartista, _idioma, _tipoproduto, _genero, _categoria, _fornecedor, _resumo, _vendas, _visitas, _status) VALUES (2, 'Código Da Vinci', 0.5, 24.950001, 'PC', 12, 12, 123123123, 'ESTRANGEIRA', 'EUA', 2002, 'Dan Brown', 'Inglês', 1, 15, 153, 1, 'Suspense no  Museu do Louvre', 0, 65, true);


--
-- TOC entry 3011 (class 0 OID 29051)
-- Dependencies: 2468
-- Data for Name: promocao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3012 (class 0 OID 29080)
-- Dependencies: 2482
-- Data for Name: tipobandeiracartao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipobandeiracartao (_codigo, _descricao) VALUES (1, 'VISA');
INSERT INTO tipobandeiracartao (_codigo, _descricao) VALUES (2, 'MASTERCARD');


--
-- TOC entry 3013 (class 0 OID 29083)
-- Dependencies: 2483
-- Data for Name: tipoendereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipoendereco (_codigo, _descricao) VALUES (1, 'PAGAMENTO');
INSERT INTO tipoendereco (_codigo, _descricao) VALUES (2, 'ENTREGA');
INSERT INTO tipoendereco (_codigo, _descricao) VALUES (3, 'OPCIONAL');
INSERT INTO tipoendereco (_codigo, _descricao) VALUES (4, 'ENTREGA CELULAR');


--
-- TOC entry 3014 (class 0 OID 29086)
-- Dependencies: 2484
-- Data for Name: tipoformapagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipoformapagamento (_codigo, _descricao) VALUES (1, 'Boleto');
INSERT INTO tipoformapagamento (_codigo, _descricao) VALUES (2, 'Cartao Master');
INSERT INTO tipoformapagamento (_codigo, _descricao) VALUES (3, 'Cartao Visa');


--
-- TOC entry 3015 (class 0 OID 29089)
-- Dependencies: 2485
-- Data for Name: tipohistorico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipohistorico (_codigo, _descricao) VALUES (1, 'INSERÇÃO');
INSERT INTO tipohistorico (_codigo, _descricao) VALUES (2, 'ATUALIZAÇÃO');
INSERT INTO tipohistorico (_codigo, _descricao) VALUES (3, 'EXCLUSÃO');


--
-- TOC entry 3016 (class 0 OID 29092)
-- Dependencies: 2486
-- Data for Name: tipomovimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipomovimento (_codigo, _descricao) VALUES (1, 'ENTRADA');
INSERT INTO tipomovimento (_codigo, _descricao) VALUES (2, 'SAIDA');
INSERT INTO tipomovimento (_codigo, _descricao) VALUES (3, 'DEVOLUÇÃO');
INSERT INTO tipomovimento (_codigo, _descricao) VALUES (4, 'DOAÇÃO');
INSERT INTO tipomovimento (_codigo, _descricao) VALUES (5, 'ENTRADA');


--
-- TOC entry 3017 (class 0 OID 29095)
-- Dependencies: 2487
-- Data for Name: tipoproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipoproduto (_codigo, _descricao) VALUES (1, 'Livros');
INSERT INTO tipoproduto (_codigo, _descricao) VALUES (3, 'CDs');
INSERT INTO tipoproduto (_codigo, _descricao) VALUES (2, 'DVDs');


--
-- TOC entry 3018 (class 0 OID 29098)
-- Dependencies: 2488
-- Data for Name: tipopromocao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipopromocao (_codigo, _descricao) VALUES (1, 'PROMOÇÃO DE NATAL');
INSERT INTO tipopromocao (_codigo, _descricao) VALUES (2, 'PROMOÇÃO DIA DAS MÃES');
INSERT INTO tipopromocao (_codigo, _descricao) VALUES (3, 'PROMOÇÃO DIA DOS PAIS');
INSERT INTO tipopromocao (_codigo, _descricao) VALUES (4, 'PROMOÇÃO DIA INTERNACIONAL DA MULHER');
INSERT INTO tipopromocao (_codigo, _descricao) VALUES (5, 'PROMOÇÃO DIA CRIANÇAS');


--
-- TOC entry 3019 (class 0 OID 29101)
-- Dependencies: 2489
-- Data for Name: tipostatuspedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (1, 'AGUARDANDO PAGAMENTO');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (2, 'CANCELADO');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (3, 'PAGO - AGUARDANDO ENVIO');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (4, 'ENVIADO PARA CORREIOS');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (5, 'BOLETO');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (6, 'TRANSFERENCIA ELETRONICA');
INSERT INTO tipostatuspedido (_codigo, _descricao) VALUES (7, 'OPERADORA CELULAR');


--
-- TOC entry 3020 (class 0 OID 29104)
-- Dependencies: 2490
-- Data for Name: tipousuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (1, 'USUARIO', 1);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (2, 'BANCO', 2);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (3, 'ADMINISTRADOR', 3);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (4, 'OPERADORA CARTAO', 4);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (5, 'FUNCIONARIO', 5);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (6, 'OPERADORA CELULAR', 6);
INSERT INTO tipousuario (_codigo, _descricao, _nivelacesso) VALUES (7, 'TRANSPORTADORA', 7);


--
-- TOC entry 3021 (class 0 OID 29107)
-- Dependencies: 2491
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (1, 1, 'ze', 1, 1, '2', '1', '1975-01-02', 'M', 'leonidio.borges@gmail.com', '1B2M2Y8AsgTpgAmY7PhCfg==', 1, 1, 1, 1, 1, 1, '2008-05-17', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (5, 1, 'leonidio', 22222222222, 1111111, '222222', '22222', '1951-02-20', 'M', 'leo@yahoo.com', 'D3Wd0epsTHbO3CmQOcpPIw==', 111, 111111, 11111, 11111, 11111, 1111111, '2008-05-27', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (6, 1, 'Teste', 32876779854, 0, '00', 'MOGI DAS CRUZES', '1953-03-02', 'M', 'leonidio@porroloco.com', 'D3Wd0epsTHbO3CmQOcpPIw==', 111, 88888888, 8888, 888888, 888888, 888888, '2008-06-01', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (14, 1, 'Adalberto Silva da Costa', 11111111111, 111111111, 'sspsp', 'Mogi das Cruzes', '1987-04-20', 'M', 'adalberto@gmail.com', 'ISMvKXpXpadDiUoOSoAfww==', 11, 11111111, 11111, 11111111, 11111111, 11111111, '2008-06-01', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (16, 1, 'Foda-se', 22222222222, 999102901, 'ssp', 'Aqui', '1952-03-04', 'M', 'fodase@fodase.com', 'MCex64Xu/+oSTxAqBi3GTg==', 121, 1212, 12121, 12121, 12121, 12121, '2008-06-01', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (17, 1, 'Diogo Vieira dos Santos', 0, 4653, 'ssp', 'sampa', '1983-03-05', 'M', 'diogo_fenix@hotmail.com', 'olM45fHwFEQyUZjT52eSPA==', 11, 47598348, 0, 0, 0, 71318430, '2008-06-01', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (22, 1, 'teste', 0, 4653, 'ssp', 'sampa', '1966-06-06', 'M', 'teste@teste.com', 'aY3BnUicTk23PiinE+qwew==', 11, 89876865, 9089, 8789798, 989080, 9808, NULL, NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (23, 1, 'Adalberto', 11111111111, 1, '1', '1', '1950-01-10', 'M', 'adalberto@teste.com', 'xMpCOKC5I4INzFCab3WEmw==', 1, 1, 1, 11, 1, 11, '2008-06-02', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (26, 1, 'tst', 66666666666, 666666666, '6', '6', '1950-01-01', 'M', 'teste@tst.com', 'aY3BnUicTk23PiinE+qwew==', 6, 6, 6, 6, 66, 6, '2008-06-02', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (29, 1, 'Adalberto', 0, 0, 's', 'mogi', '1987-04-20', 'M', 'adalberto@adm.com.br', 'aY3BnUicTk23PiinE+qwew==', 11, 11111111, 11111, 11111111, 11111111, 12121212, '2008-10-19', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (30, 1, 'Adalberto', 0, 0, 's', 'mogi', '1987-04-20', 'M', 'adalberto@adm.com', 'aY3BnUicTk23PiinE+qwew==', 111, 11111111, 11111, 11111111, 11111111, 90909090, '2008-10-19', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (4, 1, 'Leonidio Borges', 32876779854, 0, '00000', '000000000000', '1985-03-03', 'M', 'leo@gmail.com', 'D3Wd0epsTHbO3CmQOcpPIw==', 111, 11111111, 11111, 11111111, 11111111, 111111110, '2008-06-07', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (18, 1, 'Adalberto', 11111111111, 111111111, '1', '1', '1950-01-10', 'M', 'adalberto@ovni.com.br', 'xMpCOKC5I4INzFCab3WEmw==', 1, 1, 1, 1, 1, 14324, '2008-06-01', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (21, 1, 'teste', 11111111111, 111111111, '111111111', '1', '1950-02-10', 'M', 'teste@teste.com.br', 'xMpCOKC5I4INzFCab3WEmw==', 1, 1, 1, 11, 1, 4343, NULL, NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (27, 1, 'adalberto', 0, 0, 'ss', '0', '1950-01-01', 'M', 'pheyjao@hotmail.com', 'kwHCpywPCZ0DEwmfHNVHmQ==', 9, 9, 9, 9, 9, 9, '2008-10-06', NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (12, 1, 'Leonidio Borges', 32876779854, 100120312, 'SSP', 'Mogi das Cruzes', '1985-02-04', 'M', 'leonidio@gmail.com', 'ISMvKXpXpadDiUoOSoAfww==', 111, 47985002, 112, 76785829, 11991, 77777777, NULL, NULL);
INSERT INTO usuario (_codigo, _tipousuario, _nome, _cpf, _rg, _orgaoemissor, _naturalidade, _datanascimento, _sexo, _email, _senha, _ddd, _telefoneprincipal, _ramal, _telefoneopcional, _fax, _celular, _dataultimoacesso, _recebepromocoes) VALUES (13, 3, 'Admin', 99999999999, 999999999, '9999', 'teste', '2001-01-01', 'M', 'admin@ovni.com', 'ISMvKXpXpadDiUoOSoAfww==', 11, 11111111, 111, 1111, 111, 74119945, NULL, NULL);


--
-- TOC entry 2890 (class 2606 OID 29110)
-- Dependencies: 2431 2431
-- Name: avaliacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2892 (class 2606 OID 29112)
-- Dependencies: 2433 2433
-- Name: avaliaratendimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT avaliaratendimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2896 (class 2606 OID 29114)
-- Dependencies: 2435 2435
-- Name: boleto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY boleto
    ADD CONSTRAINT boleto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2898 (class 2606 OID 29116)
-- Dependencies: 2437 2437
-- Name: caracttipoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT caracttipoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2902 (class 2606 OID 29118)
-- Dependencies: 2439 2439
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2906 (class 2606 OID 29120)
-- Dependencies: 2441 2441
-- Name: conteudoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2908 (class 2606 OID 29122)
-- Dependencies: 2443 2443
-- Name: dadoscartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dadoscartao
    ADD CONSTRAINT dadoscartao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2910 (class 2606 OID 29124)
-- Dependencies: 2444 2444
-- Name: dadosempresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dadosempresa
    ADD CONSTRAINT dadosempresa_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2912 (class 2606 OID 29126)
-- Dependencies: 2446 2446
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2918 (class 2606 OID 29128)
-- Dependencies: 2448 2448
-- Name: estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2920 (class 2606 OID 29130)
-- Dependencies: 2449 2449
-- Name: fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2922 (class 2606 OID 29132)
-- Dependencies: 2451 2451
-- Name: genero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2926 (class 2606 OID 29134)
-- Dependencies: 2453 2453
-- Name: historico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT historico_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2928 (class 2606 OID 29136)
-- Dependencies: 2455 2455
-- Name: imagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imagem
    ADD CONSTRAINT imagem_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2930 (class 2606 OID 29138)
-- Dependencies: 2457 2457
-- Name: item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2932 (class 2606 OID 29140)
-- Dependencies: 2459 2459
-- Name: movimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2934 (class 2606 OID 29142)
-- Dependencies: 2460 2460
-- Name: pedidodesktopwap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2936 (class 2606 OID 29144)
-- Dependencies: 2461 2461
-- Name: pedidosms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2938 (class 2606 OID 29146)
-- Dependencies: 2466 2466
-- Name: produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2942 (class 2606 OID 29148)
-- Dependencies: 2468 2468
-- Name: promocao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2944 (class 2606 OID 29150)
-- Dependencies: 2482 2482
-- Name: tipobandeiracartao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipobandeiracartao
    ADD CONSTRAINT tipobandeiracartao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2946 (class 2606 OID 29152)
-- Dependencies: 2483 2483
-- Name: tipoendereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoendereco
    ADD CONSTRAINT tipoendereco_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2948 (class 2606 OID 29154)
-- Dependencies: 2484 2484
-- Name: tipoformapagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoformapagamento
    ADD CONSTRAINT tipoformapagamento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2950 (class 2606 OID 29156)
-- Dependencies: 2485 2485
-- Name: tipohistorico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipohistorico
    ADD CONSTRAINT tipohistorico_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2952 (class 2606 OID 29158)
-- Dependencies: 2486 2486
-- Name: tipomovimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipomovimento
    ADD CONSTRAINT tipomovimento_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2954 (class 2606 OID 29160)
-- Dependencies: 2487 2487
-- Name: tipoproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipoproduto
    ADD CONSTRAINT tipoproduto_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2956 (class 2606 OID 29162)
-- Dependencies: 2488 2488
-- Name: tipopromocao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipopromocao
    ADD CONSTRAINT tipopromocao_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2958 (class 2606 OID 29164)
-- Dependencies: 2489 2489
-- Name: tipostatuspedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipostatuspedido
    ADD CONSTRAINT tipostatuspedido_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2960 (class 2606 OID 29166)
-- Dependencies: 2490 2490
-- Name: tipousuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2894 (class 2606 OID 29168)
-- Dependencies: 2433 2433 2433
-- Name: uk_avaliacaoatendimento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT uk_avaliacaoatendimento UNIQUE (_usuario, _dataavaliacao);


--
-- TOC entry 2900 (class 2606 OID 29170)
-- Dependencies: 2437 2437 2437
-- Name: uk_caracttipoproduto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT uk_caracttipoproduto UNIQUE (_descricao, _tipoproduto);


--
-- TOC entry 2904 (class 2606 OID 29172)
-- Dependencies: 2439 2439 2439
-- Name: uk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT uk_categoria UNIQUE (_descricao, _genero);


--
-- TOC entry 2914 (class 2606 OID 29174)
-- Dependencies: 2446 2446 2446
-- Name: uk_enderecofornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT uk_enderecofornecedor UNIQUE (_tipoendereco, _fornecedor);


--
-- TOC entry 2916 (class 2606 OID 29176)
-- Dependencies: 2446 2446 2446
-- Name: uk_enderecousuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT uk_enderecousuario UNIQUE (_tipoendereco, _usuario);


--
-- TOC entry 2924 (class 2606 OID 29178)
-- Dependencies: 2451 2451 2451
-- Name: uk_genero; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT uk_genero UNIQUE (_descricao, _tipoproduto);


--
-- TOC entry 2940 (class 2606 OID 29180)
-- Dependencies: 2466 2466 2466 2466 2466
-- Name: uk_produto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT uk_produto UNIQUE (_titulo, _autorartista, _anolancamento, _tipoproduto);


--
-- TOC entry 2962 (class 2606 OID 29182)
-- Dependencies: 2491 2491
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (_codigo);


--
-- TOC entry 2963 (class 2606 OID 29188)
-- Dependencies: 2961 2491 2433
-- Name: avaliaratendimento__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY avaliaratendimento
    ADD CONSTRAINT avaliaratendimento__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo);


--
-- TOC entry 2964 (class 2606 OID 29193)
-- Dependencies: 2435 2491 2961
-- Name: boleto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY boleto
    ADD CONSTRAINT boleto_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo);


--
-- TOC entry 2965 (class 2606 OID 29198)
-- Dependencies: 2437 2953 2487
-- Name: caracttipoproduto__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caracttipoproduto
    ADD CONSTRAINT caracttipoproduto__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2966 (class 2606 OID 29203)
-- Dependencies: 2439 2921 2451
-- Name: categoria__genero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria__genero_fkey FOREIGN KEY (_genero) REFERENCES genero(_codigo);


--
-- TOC entry 2967 (class 2606 OID 29208)
-- Dependencies: 2897 2437 2441
-- Name: conteudoproduto__caracttipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto__caracttipoproduto_fkey FOREIGN KEY (_caracttipoproduto) REFERENCES caracttipoproduto(_codigo);


--
-- TOC entry 2968 (class 2606 OID 29213)
-- Dependencies: 2441 2937 2466
-- Name: conteudoproduto__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conteudoproduto
    ADD CONSTRAINT conteudoproduto__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2969 (class 2606 OID 29218)
-- Dependencies: 2933 2460 2443
-- Name: dadoscartao__pedidodesktopwap_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dadoscartao
    ADD CONSTRAINT dadoscartao__pedidodesktopwap_fkey FOREIGN KEY (_pedidodesktopwap) REFERENCES pedidodesktopwap(_codigo);


--
-- TOC entry 2970 (class 2606 OID 29223)
-- Dependencies: 2443 2943 2482
-- Name: dadoscartao__tipobandeiracartao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dadoscartao
    ADD CONSTRAINT dadoscartao__tipobandeiracartao_fkey FOREIGN KEY (_tipobandeiracartao) REFERENCES tipobandeiracartao(_codigo);


--
-- TOC entry 2971 (class 2606 OID 29228)
-- Dependencies: 2919 2449 2446
-- Name: endereco__fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__fornecedor_fkey FOREIGN KEY (_fornecedor) REFERENCES fornecedores(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2972 (class 2606 OID 29233)
-- Dependencies: 2945 2483 2446
-- Name: endereco__tipoendereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__tipoendereco_fkey FOREIGN KEY (_tipoendereco) REFERENCES tipoendereco(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2973 (class 2606 OID 29238)
-- Dependencies: 2961 2491 2446
-- Name: endereco__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo) ON DELETE CASCADE;


--
-- TOC entry 2974 (class 2606 OID 29243)
-- Dependencies: 2931 2459 2448
-- Name: estoque__movimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque__movimento_fkey FOREIGN KEY (_movimento) REFERENCES movimento(_codigo);


--
-- TOC entry 2975 (class 2606 OID 29248)
-- Dependencies: 2937 2466 2448
-- Name: estoque__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estoque
    ADD CONSTRAINT estoque__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2976 (class 2606 OID 29253)
-- Dependencies: 2487 2953 2451
-- Name: genero__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT genero__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2977 (class 2606 OID 29258)
-- Dependencies: 2949 2453 2485
-- Name: historico__tipohistorico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historico
    ADD CONSTRAINT historico__tipohistorico_fkey FOREIGN KEY (_tipohistorico) REFERENCES tipohistorico(_codigo);


--
-- TOC entry 2978 (class 2606 OID 29263)
-- Dependencies: 2937 2455 2466
-- Name: imagem__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagem
    ADD CONSTRAINT imagem__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2979 (class 2606 OID 29268)
-- Dependencies: 2457 2460 2933
-- Name: item__pedidodesktopwap_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item__pedidodesktopwap_fkey FOREIGN KEY (_pedidodesktopwap) REFERENCES pedidodesktopwap(_codigo);


--
-- TOC entry 2980 (class 2606 OID 29283)
-- Dependencies: 2459 2486 2951
-- Name: movimento__tipomovimento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimento
    ADD CONSTRAINT movimento__tipomovimento_fkey FOREIGN KEY (_tipomovimento) REFERENCES tipomovimento(_codigo);


--
-- TOC entry 2981 (class 2606 OID 29288)
-- Dependencies: 2460 2484 2947
-- Name: pedidodesktopwap__formapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap__formapagamento_fkey FOREIGN KEY (_formapagamento) REFERENCES tipoformapagamento(_codigo);


--
-- TOC entry 2982 (class 2606 OID 29293)
-- Dependencies: 2460 2489 2957
-- Name: pedidodesktopwap__tipostatuspedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidodesktopwap
    ADD CONSTRAINT pedidodesktopwap__tipostatuspedido_fkey FOREIGN KEY (_tipostatuspedido) REFERENCES tipostatuspedido(_codigo);


--
-- TOC entry 2983 (class 2606 OID 29298)
-- Dependencies: 2466 2461 2937
-- Name: pedidosms__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2984 (class 2606 OID 29303)
-- Dependencies: 2461 2489 2957
-- Name: pedidosms__statuspedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__statuspedido_fkey FOREIGN KEY (_statuspedido) REFERENCES tipostatuspedido(_codigo);


--
-- TOC entry 2985 (class 2606 OID 29308)
-- Dependencies: 2961 2461 2491
-- Name: pedidosms__usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidosms
    ADD CONSTRAINT pedidosms__usuario_fkey FOREIGN KEY (_usuario) REFERENCES usuario(_codigo);


--
-- TOC entry 2986 (class 2606 OID 29313)
-- Dependencies: 2901 2466 2439
-- Name: produtos__categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__categoria_fkey FOREIGN KEY (_categoria) REFERENCES categoria(_codigo);


--
-- TOC entry 2987 (class 2606 OID 29318)
-- Dependencies: 2466 2921 2451
-- Name: produtos__genero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__genero_fkey FOREIGN KEY (_genero) REFERENCES genero(_codigo);


--
-- TOC entry 2988 (class 2606 OID 29323)
-- Dependencies: 2953 2487 2466
-- Name: produtos__tipoproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos__tipoproduto_fkey FOREIGN KEY (_tipoproduto) REFERENCES tipoproduto(_codigo);


--
-- TOC entry 2989 (class 2606 OID 29328)
-- Dependencies: 2466 2468 2937
-- Name: promocao__produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao__produto_fkey FOREIGN KEY (_produto) REFERENCES produtos(_codigo);


--
-- TOC entry 2990 (class 2606 OID 29333)
-- Dependencies: 2955 2468 2488
-- Name: promocao__tipopromocao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao__tipopromocao_fkey FOREIGN KEY (_tipopromocao) REFERENCES tipopromocao(_codigo);


--
-- TOC entry 2991 (class 2606 OID 29338)
-- Dependencies: 2491 2490 2959
-- Name: usuario__tipousuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario__tipousuario_fkey FOREIGN KEY (_tipousuario) REFERENCES tipousuario(_codigo);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 719
-- Name: pg_buffercache_pages(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM postgres;
GRANT ALL ON FUNCTION pg_buffercache_pages() TO postgres;


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 720
-- Name: pg_freespacemap_pages(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM postgres;
GRANT ALL ON FUNCTION pg_freespacemap_pages() TO postgres;


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 721
-- Name: pg_freespacemap_relations(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM postgres;
GRANT ALL ON FUNCTION pg_freespacemap_relations() TO postgres;


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 2462
-- Name: pg_buffercache; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_buffercache FROM PUBLIC;
REVOKE ALL ON TABLE pg_buffercache FROM postgres;
GRANT ALL ON TABLE pg_buffercache TO postgres;


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 2463
-- Name: pg_freespacemap_pages; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_freespacemap_pages FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_pages FROM postgres;
GRANT ALL ON TABLE pg_freespacemap_pages TO postgres;


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 2464
-- Name: pg_freespacemap_relations; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pg_freespacemap_relations FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_relations FROM postgres;
GRANT ALL ON TABLE pg_freespacemap_relations TO postgres;


-- Completed on 2008-10-19 20:57:19

--
-- PostgreSQL database dump complete
--

