--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: careers; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE careers (
    id integer NOT NULL,
    title character varying,
    description character varying
);


ALTER TABLE careers OWNER TO "Guest";

--
-- Name: careers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE careers_id_seq OWNER TO "Guest";

--
-- Name: careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE careers_id_seq OWNED BY careers.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages (
    id integer NOT NULL,
    name character varying,
    description character varying,
    date character varying,
    most_recent_release_date character varying,
    webpage character varying,
    example character varying
);


ALTER TABLE languages OWNER TO "Guest";

--
-- Name: languages_careers; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_careers (
    id integer NOT NULL,
    language_id integer,
    career_id integer
);


ALTER TABLE languages_careers OWNER TO "Guest";

--
-- Name: languages_careers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_careers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_careers_id_seq OWNER TO "Guest";

--
-- Name: languages_careers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_careers_id_seq OWNED BY languages_careers.id;


--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_id_seq OWNER TO "Guest";

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_id_seq OWNED BY languages.id;


--
-- Name: languages_programs; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_programs (
    id integer NOT NULL,
    language_id integer,
    program_id integer
);


ALTER TABLE languages_programs OWNER TO "Guest";

--
-- Name: languages_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_programs_id_seq OWNER TO "Guest";

--
-- Name: languages_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_programs_id_seq OWNED BY languages_programs.id;


--
-- Name: languages_types; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE languages_types (
    id integer NOT NULL,
    language_id integer,
    type_id integer
);


ALTER TABLE languages_types OWNER TO "Guest";

--
-- Name: languages_types_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE languages_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_types_id_seq OWNER TO "Guest";

--
-- Name: languages_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE languages_types_id_seq OWNED BY languages_types.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying,
    description character varying,
    url character varying
);


ALTER TABLE programs OWNER TO "Guest";

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE programs_id_seq OWNER TO "Guest";

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE types (
    id integer NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE types OWNER TO "Guest";

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE types_id_seq OWNER TO "Guest";

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY careers ALTER COLUMN id SET DEFAULT nextval('careers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages ALTER COLUMN id SET DEFAULT nextval('languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_careers ALTER COLUMN id SET DEFAULT nextval('languages_careers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_programs ALTER COLUMN id SET DEFAULT nextval('languages_programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY languages_types ALTER COLUMN id SET DEFAULT nextval('languages_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Data for Name: careers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY careers (id, title, description) FROM stdin;
1	Backend Web Developer	The backend of a web application is an enabler for a frontend experience. An application’s frontend may be the most beautifully crafted web page, but if the application itself doesn’t work, the application will be a failure. The backend of an application is responsible for things like calculations, business logic, database interactions, and performance. Most of the code that is required to make an application work will be done on the backend. Backend code is run on the server, as opposed to the client. This means that backend developers not only need to understand programming languages and databases, but they must have an understanding of server architecture as well. If an application is slow, crashes often, or constantly throws errors at users, it’s likely because of backend problems.
2	Data Analyst	Gathers, sorts, and displays data in more usable fashions.
3	Database Engineer	Database engineers, who may work as either applications or systems software developers, are generally employed by computer systems companies to design and monitor complex databases. They must make sure that a database is operational and provides valid and relevant data. An in-depth understanding of computer software, database technologies and programming is required to work as a database engineer.
4	Firmware Engineer	Firmware engineers create software used in electronic devices. Job requirements differ, but in most cases require at least a bachelor's degree or a master's degree in computer science, mathematics or engineering.
5	Front End Web Designer	Front-end web development, also known as client-side development is the practice of producing HTML, CSS and JavaScript for a website or web application so that a user can see and interact with them directly.[1] The challenge associated with front end development is that the tools and techniques used to create the front end of a website change constantly and so the developer needs to constantly be aware of how the field is developing.
6	Game Developer	Designs and builds video game programs.
7	GUI Developer	A GUI Developer is someone who creates Graphical User Interfaces for programs so that they are easy to use.  Similar to what a Front-End Web Designer does.
9	Hardware Engineer	Computer hardware engineers modify the hardware components for computers. They evaluate existing computer systems and use complex problem-solving skills to improve models.
10	Information Systems Technologist	Information systems technicians operate and maintain information systems, facilitating system utilization. In many companies, these technicians assemble data sets and other details needed to build databases. This includes data management, procedure writing, writing job setup instructions, and performing program librarian functions.
11	Interactive Media Programmer	Builds interactive media things.
12	Linux OS Developer	Builds tools and applications for Linux operating systems.
13	Mainframe Systems Engineer	And engineer that builds and maintains mainframe systems.
14	Mobile Developer - Android	Develops apps and services for Android devices.
15	Mobile Developer - IOS	Developes apps and services for IOS devices.
16	Multimedia Programmer	Multimedia programmers are specialist software engineers who use their creative flair and technical ability to produce innovative digital products, such as Flash-based websites, mobile apps and interactive animated films.
17	Network Engineer	A network engineer maintains computer infrastructures with emphasis on networking. Responsibilities may vary between organizations, but on-site servers, software-network interactions as well as network integrity/resilience are the key areas of focus.
18	OS X Developer	Builds tools and applications for OS X operating systems.
19	Robotics Programming	Designs programs to handle the operation of robotics.
20	Security Analyst	Builds, examines, and maintains network security systems.
21	Server Architect	A computer network architect  that designs and builds server architecture.
22	Software Engineer	Designs and builds software applications.
23	System Administrator	a person who manages the operation of a computer system, such as a message board.
24	Systems Programmer	Produce software which provides services to computers.
25	Visual Effects Programmer	Creates visual effects for a multitude of difference applications
26	Windows OS Developer	Builds tools and applications for Windows operating systems.
\.


--
-- Name: careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('careers_id_seq', 30, true);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages (id, name, description, date, most_recent_release_date, webpage, example) FROM stdin;
3	A# .NET	A# is a part of the Ada programming language to the Microsoft .NET platform. A# is freely distributed by the Department of Computer Science at the United States Air Force Academy as a service to the Ada community under the terms of the GNU General Public License.	2004; 12 years ago (2004)	null	http://www.asharp.martincarlisle.com/	No code example (yet).
4	A# (Axiom)	A♯ (A sharp) is an object-oriented functional programming language distributed as a separable component of Version 2 of the Axiom computer algebra system. A# types and functions are first-class values and can be used freely in conjunction with an extensive library of data structures and other mathematical abstractions. A key design guideline for A# was suitability of compilation to portable and efficient machine code.	null	null	http://axiom-developer.org/index.html	No code example (yet).
5	A+	A+ is an array programming language descendent from the programming language A, which in turn was created to replace APL in 1988.[1] Arthur Whitney developed the "A" portion of A+, while other developers at Morgan Stanley extended it, adding a graphical user interface and other language features. A+ was designed for numerically intensive applications, especially those found in financial applications. A+ runs on many Unix variants, including Linux. A+ is a high-level, interactive, interpreted language.	1988	4.20-2 / November 2006	\N	No code example (yet).
6	A++	A++ stands for abstraction plus reference plus synthesis which is used as a name for the minimalistic programming language that is built on ARS. ARS is an abstraction from the Lambda Calculus, taking its three basic operations, and giving them a more general meaning, thus providing a foundation for the three major programming paradigms: functional programming, object-oriented programming and imperative programming.	2001	null	\N	No code example (yet).
7	ABAP	ABAP (Advanced Business Application Programming, originally Allgemeiner Berichts-Aufbereitungs-Prozessor, German for "general report creation processor"[1]) is a high-level programming language created by the German software company SAP. It is currently positioned, alongside Java, as the language for programming the SAP Application Server, which is part of the NetWeaver platform for building business applications.	1983 (1983)	null	\N	No code example (yet).
8	ABC	ABC is an imperative general-purpose programming language and programming environment developed at CWI, Netherlands by Leo Geurts, Lambert Meertens, and Steven Pemberton. It is interactive, structured, high-level, and intended to be used instead of BASIC, Pascal, or AWK. It is not meant to be a systems-programming language but is intended for teaching or prototyping.	null	1.05.02	\N	No code example (yet).
9	ABC ALGOL	ABC ALGOL is an extension of the Algol 60 programming language with arbitrary data structures and user-defined operators, targeted for symbolic mathematics. Despite its advances, it was never used as widely as Algol proper.	null	null	\N	No code example (yet).
10	ABLE	ABLE is a simplified programming language targeted at accounting applications.	null	null	\N	No code example (yet).
11	ABSET	ABSET was an early declarative programming language from the University of Aberdeen.	null	null	\N	No code example (yet).
12	ABSYS	Absys was an early declarative programming language from the University of Aberdeen.[1] It anticipated a number of features of Prolog such as negation as failure, aggregation operators, the central role of backtracking[2] and constraint solving.[1] Absys was the first implementation of a logic programming language.[1]	1967	null	\N	No code example (yet).
13	ACC	ACC is a near-C compiler for the MS-DOS operating system on the IBM PC line of computers for programs. The compiler and compiled programs will run on any Intel 80386 or above PC running MS-DOS. Included with the compiler are a 386 assembler and a linker for combining multiple object files. There are also two libraries, which are a protected mode DOS extender (based on Thomas Pytel's, AKA Tran's PMODE30B + PMODE307 DOS extenders), and a library of functions callable by C programs.	null	null	\N	No code example (yet).
14	Accent	Accent is a very high level interpreted programming language, published in 1990 by CaseWare, Inc. (acquired by Telelogic Synergy). Accent has native support for strings and tables. It is strongly typed and supports remote function calls.	1990	null	\N	No code example (yet).
15	Ace DASL	The DASL Programming Language (Distributed Application Specification Language) is a high-level, strongly typed programming language originally developed at Sun Microsystems Laboratories between 1999 and 2003 as part of the Ace Project. The goals of the project were to enable rapid development of web-based applications based on Sun's J2EE architecture, and to eliminate the steep learning curve of platform-specific details.	null	null	\N	No code example (yet).
16	ACL2	ACL2 (A Computational Logic for Applicative Common Lisp) is a software system consisting of a programming language, an extensible theory in a first-order logic, and a mechanical theorem prover. ACL2 is designed to support automated reasoning in inductive logical theories, mostly for the purpose of software and hardware verification. The input language and implementation of ACL2 are built on Common Lisp. ACL2 is free, open source (BSD license) software.	1990 (limited distribution), 1996 (public distribution)	7.1 / May 2015 (2015-05)	http://www.cs.utexas.edu/users/moore/acl2/	No code example (yet).
17	ACT-III	The LGP-30, standing for Librascope General Purpose and then Librascope General Precision, was an early off-the-shelf computer. It was manufactured by the Librascope company of Glendale, California (a division of General Precision Inc.), and sold and serviced by the Royal Precision Electronic Computer Company, a joint venture with the Royal McBee division of the Royal Typewriter Company. The LGP-30 was first manufactured in 1956 with a retail price of $47,000—equivalent to about $409,000 today.[1]	null	null	\N	No code example (yet).
419	Nice	Nice is an object-oriented programming language released under the GNU General Public License.	null	null	\N	//Hello World in Nice\n\nvoid main(String[] args){ \n   println("hello world"); \n}
21	Adenine	Adenine, named after the nucleobase adenine, is a scripting language that is cross-platform, which is developed in the context of project Haystack and Project Oxygen of the Massachusetts Institute of Technology (MIT) Computer Science and Artificial Intelligence Laboratory (CSAIL) in collaboration with Nippon Telegraph and Telephone (NTT).	null	null	\N	No code example (yet).
22	Agda	Agda is a dependently typed functional programming language originally developed by Ulf Norell at Chalmers University of Technology with implementation described in his PhD thesis.[2] The current version of Agda was originally known as Agda 2. The original Agda system was developed at Chalmers by Catarina Coquand in 1999.[3] The current version is a full rewrite, which should be considered a new language that shares a name and tradition.	2007	2.5.1 / April 16, 2016 (2016-04-16)	http://wiki.portal.chalmers.se/agda	No code example (yet).
23	Agilent VEE	Keysight VEE is a graphical dataflow programming software development environment from Keysight Technologies for automated test, measurement, data analysis and reporting. VEE originally stood for Visual Engineering Environment and developed by HP designated as HP VEE; it has since been officially renamed to Keysight VEE. Keysight VEE has been widely used in various industries, serving the entire stage of a product lifecycle, from design, validation to manufacturing. It is optimized in instrument control and automation with test and measurement devices such as data acquisition instruments like digital voltmeters and oscilloscopes, and source devices like signal generators and programmable power supplies.	null	null	http://www.keysight.com/find/vee	No code example (yet).
24	Agora	Agora is a reflective, prototype-based, object-oriented programming language that is based exclusively on message passing and not delegation. Agora was intended to show that even subject to that limit, it is possible to build a full object-oriented language that features inheritance, cloning and reflective operators.	null	null	\N	No code example (yet).
25	AIMMS	AIMMS (an acronym for "Advanced Interactive Multidimensional Modeling System") is a software system designed for modeling and solving large-scale optimization and scheduling-type problems.[2][3] It consists of an algebraic modeling language, an integrated development environment for both editing models and creating a graphical user interface around these models, and a graphical end-user environment.[4] AIMMS is linked to multiple solvers through the AIMMS Open Solver Interface, not to be confused with COIN-OR Open Solver Interface (OSI) which unlike AIMMS OSI is an open-source project.[5] Supported solvers include CPLEX, Gurobi, MOSEK, CBC, Conopt, MINOS, IPOPT, SNOPT, KNITRO and CP Optimizer.	1993	AIMMS 4.0 / July 7, 2014	\N	No code example (yet).
26	Alef	Alef was a concurrent programming language, designed as part of the Plan 9 operating system by Phil Winterbottom of Bell Labs. It implemented the channel-based concurrency model of Newsqueak in a compiled, C-like language.	1992	null	\N	No code example (yet).
27	ALF	Algebraic Logic Functional programming language, also known as ALF, is a programming language which combines functional and logic programming techniques. Its foundation is Horn clause logic with equality which consists of predicates and Horn clauses for logic programming, and functions and equations for functional programming.	null	null	\N	No code example (yet).
28	ALGOL 58	ALGOL 58, originally known as IAL, is one of the family of ALGOL computer programming languages. It was an early compromise design soon superseded by ALGOL 60. According to John Backus[2]	1958; 58 years ago (1958)	null	\N	No code example (yet).
29	ALGOL 60	ALGOL 60 (short for ALGOrithmic Language 1960) is a member of the ALGOL family of computer programming languages. It followed on from ALGOL 58 which had introduced code blocks and the begin and end pairs for delimiting them. ALGOL 60 was the first language implementing nested function definitions with lexical scope. It gave rise to many other programming languages, including CPL, Simula, BCPL, B, Pascal and C.	1960	null	\N	No code example (yet).
30	ALGOL 68	ALGOL 68 (short for ALGOrithmic Language 1968) is an imperative computer programming language that was conceived as a successor to the ALGOL 60 programming language, designed with the goal of a much wider scope of application and more rigorously defined syntax and semantics.	Final Report: 1968r0	Algol 68/RR / Revised Report: 1973r1	\N	No code example (yet).
31	ALGOL W	ALGOL W is a programming language. It was based on a proposal for ALGOL X by Niklaus Wirth and Tony Hoare as a successor to ALGOL 60 in IFIP Working Group 2.1. When the committee decided that the proposal was not a sufficient advance over ALGOL 60, the proposal was published as A contribution to the development of ALGOL.[1] After making small modifications to the language[2] Wirth supervised a high quality implementation for the IBM/360 at Stanford University that was widely distributed.[3]	1966; 50 years ago (1966)	null	\N	No code example (yet).
32	Alice	Alice ML is a programming language designed by the Programming Systems Laboratory[2] at Saarland University, Saarbrücken, Germany. It is a dialect of Standard ML, augmented with support for lazy evaluation, concurrency (multithreading and distributed computing via remote procedure calls) and constraint programming.	2000; 16 years ago (2000)	1.4 / May 3, 2007; 9 years ago (2007-05-03)	http://www.ps.uni-saarland.de/alice	No code example (yet).
33	Alma-0	Alma-0 is a multi-paradigm computer programming language. This language is an augmented version of the imperative Modula-2 language with logic-programming features and convenient backtracking capability.[1] It is small, strongly typed, and combines constraint programming, a limited number of features inspired by logic programming and supports imperative paradigms. The language advocates declarative programming. The designers claim that search-oriented solutions built with it are substantially simpler than their counterparts written in purely imperative or logic programming style.[citation needed] [1] Alma-0 provides natural, high-level constructs for the construction of search trees.[2]	null	null	\N	No code example (yet).
34	AmbientTalk	AmbientTalk is an experimental object-oriented distributed programming language developed at the Programming Technology Laboratory at the Vrije Universiteit Brussel, Belgium. The language is primarily targeted at writing programs deployed in mobile ad hoc networks.	2006	2.19 / April 2011	\N	No code example (yet).
36	AMOS	AMOS BASIC is a dialect of the BASIC programming language implemented on the Amiga computer. AMOS BASIC was published by Europress Software and originally written by François Lionet with Constantin Sotiropoulos.	1990; 26 years ago (1990)	null	\N	Rem Hello world in AMOS\n\nPrint "Hello world!"
38	Apex	Salesforce.com (stylized as salesƒorce) is an American cloud computing company headquartered in San Francisco, California. Though its revenue comes from a customer relationship management (CRM) product, Salesforce also capitalizes on commercial applications of social networking through acquisition. As of early 2016, it is one of the most highly valued American cloud computing companies with a market capitalization of $45 billion.[4]	null	null	http://salesforce.com/	No code example (yet).
39	APL	APL (named after the book A Programming Language)[8] is a programming language developed in the 1960s by Kenneth E. Iverson. Its central datatype is the multidimensional array. It uses a large range of special graphic symbols[9] to represent most functions and operators, leading to very concise code. It has been an important influence on the development of concept modeling, spreadsheets, functional programming,[10] and computer math packages.[6] It has also inspired several other programming languages.[4][5][7] It is still used today for certain applications.[11][12]	1964	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.51.5088	⍝ Hello World in APL\n\n⎕←\\'Hello World\\'
40	App Inventor for Android's visual block language	App Inventor for Android is an open-source web application originally provided by Google, and now maintained by the Massachusetts Institute of Technology (MIT).	null	Beta	http://appinventor.mit.edu/	No code example (yet).
41	AppleScript	AppleScript is a scripting language created by Apple Inc. and built into Macintosh operating systems since System 7. The term "AppleScript" may refer to the scripting system itself, or to an individual script written in the AppleScript language.	1993; 23 years ago (1993)	2.7 / October 16, 2014; 18 months ago (2014-10-16)[1]	http://developer.apple.com/applescript/	-- "Hello World" in AppleScript:\n\ndisplay dialog "Hello World"
42	Arc	Arc is a dialect of the Lisp programming language developed by Paul Graham and Robert Morris.	null	null	\N	No code example (yet).
43	ARexx	ARexx is an implementation of the REXX language for the Amiga, written in 1987 by William S. Hawes, with a number of Amiga-specific features beyond standard REXX facilities. Like most REXX implementations, ARexx is an interpreted language. Programs written for ARexx are called "scripts", or "macros"; several programs offer the ability to run ARexx scripts in their main interface as macros.	null	null	\N	No code example (yet).
44	Argus	Argus is a programming language created at MIT by Barbara Liskov between 1982 and 1988, in collaboration with Maurice Herlihy, Paul Johnson, Robert Scheifler, and William Weihl.[1] It is an extension of the CLU language, and utilizes most of the same syntax and semantics.[1] Argus was designed to support the creation of distributed programs, by encapsulating related procedures within objects called guardians, and by supporting atomic operations called actions.[1][2]	null	null	\N	No code example (yet).
45	AspectJ	AspectJ is an aspect-oriented programming (AOP) extension created at PARC for the Java programming language. It is available in Eclipse Foundation open-source projects, both stand-alone and integrated into Eclipse. AspectJ has become a widely used de facto standard for AOP by emphasizing simplicity and usability for end users. It uses Java-like syntax, and included IDE integrations for displaying crosscutting structure since its initial public release in 2001.	2001 (2001)	1.8.8 / January 7, 2016 (2016-01-07)	http://www.eclipse.org/aspectj/	No code example (yet).
46	Assembly language	An assembly (or assembler) language,[1] often abbreviated asm, is a low-level programming language for a computer, or other programmable device, in which there is a very strong (generally one-to-one) correspondence between the language and the architecture's machine code instructions. Each assembly language is specific to a particular computer architecture, in contrast to most high-level programming languages, which are generally portable across multiple architectures, but require interpreting or compiling. Assembly language may also be called symbolic machine code.[2]	1949; 67 years ago (1949)	null	\N	No code example (yet).
47	Ateji PX	Ateji PX is an object-oriented programming language extension for Java. It is intended to facilliate parallel computing on multi-core processors, GPU, Grid and Cloud.	null	null	\N	No code example (yet).
49	Autocoder	Autocoder was the name given to certain assemblers for a number of IBM computers of the 1950s and 1960s. The first Autocoders appear to have been the earliest assemblers to provide a macro facility.[1]	null	null	\N	No code example (yet).
50	AutoHotkey	AutoHotkey is a free, open-source custom scripting language for Microsoft Windows, initially aimed at providing easy keyboard shortcuts or hotkeys, fast macro-creation and software automation that allows users of most levels of computer skill to automate repetitive tasks in any Windows application. User interfaces can easily be extended or modified by AutoHotkey (for example, overriding the default Windows control key commands with their Emacs equivalents).[3] The Autohotkey installation includes its own extensive help file with an always updated web based version.	null	1.1.23.05 / 27 March 2016; 32 days ago (2016-03-27)[1]	http://ahkscript.org/	; Hello World in AutoHotkey\n\nMsgbox Hello, World!
193	EXEC 2	EXEC 2 is an interpreted, command procedure control, computer scripting language used by the EXEC 2 Processor supplied with the IBM Virtual Machine/System Product (VM/SP) operating system.[1]	null	null	\N	No code example (yet).
52	AutoLISP / Visual LISP	AutoLISP is a dialect of the LISP programming language built specifically for use with the full version of AutoCAD and its derivatives, which include AutoCAD Map 3D, AutoCAD Architecture and AutoCAD Mechanical.[1] Neither the application programming interface nor the interpreter to execute AutoLISP code are included in the AutoCAD LT product line.[2]	null	null	\N	No code example (yet).
53	Averest	Averest is a synchronous programming language and set of tools to specify, verify, and implement reactive systems. It includes a compiler for synchronous programs, a symbolic model checker, and a tool for hardware/software synthesis.	null	null	\N	No code example (yet).
54	AWK	AWK is an interpreted programming language designed for text processing and typically used as a data extraction and reporting tool. It is a standard feature of most Unix-like operating systems.	1977; 39 years ago (1977)	IEEE Std 1003.1-2008 (POSIX) / 1985	http://www.cs.princeton.edu/~bwk/btl.mirror/	# Hello world in AWK\n\nBEGIN {\n  print "Hello World!"\n}
56	B	B is a programming language developed at Bell Labs circa 1969. It is the work of Ken Thompson with Dennis Ritchie.	1969; 47 years ago (1969)[1]	null	\N	/* Hello World in B */\n\nmain() {\n  extern a, b, c;\n  putchar (a); putchar (b); putchar (c); putchar ('!*n');\n}\n\na 'hell' ;\nb 'o, w' ;\nc 'orld' ;
57	Babbage	Babbage is the high level assembly language for the GEC 4000 series minicomputers.[1] It was named after Charles Babbage, an English computing pioneer.	around 1971; 45 years ago (1971)	308	\N	No code example (yet).
59	BASIC	BASIC (an acronym for Beginner's All-purpose Symbolic Instruction Code)[1] is a family of general-purpose, high-level programming languages whose design philosophy emphasizes ease of use.	May 1, 1964; 52 years ago (1964-05-01)	null	\N	10 REM Hello World in BASIC\n20 PRINT "Hello World!"
60	Batch (Windows/Dos)	A batch file is a kind of script file in DOS, OS/2 and Windows. It consists of a series of commands to be executed by the command line interpreter, stored in a plain text file. A batch file may contain any command the interpreter accepts interactively and use constructs that enable conditional branching and looping within the batch file, such as "if", "for", "goto" and labels. The term "batch" is from batch processing, meaning "non-interactive execution", though a batch file may not process a batch of multiple data.	null	null	\N	No code example (yet).
61	bc	bc, for basic calculator (often referred to as bench calculator), is "an arbitrary precision calculator language" with syntax similar to the C programming language. bc is typically used as either a mathematical scripting language or as an interactive mathematical shell.	null	null	\N	#!/usr/bin/bc -q\n# Hello World for the Unix "bc" calculator\n\nprint "Hello World!\\n"
62	BCPL	BCPL (Basic Combined Programming Language) is a procedural, imperative, and structured computer programming language designed by Martin Richards of the University of Cambridge in 1966.	1966; 50 years ago (1966)	null	\N	// Hello world in BCLP\nGET "libhdr"\n\nLET start() = VALOF\n$( writes("Hello world*N")\n   RESULTIS 0\n$)
63	BeanShell	BeanShell is a Java-like scripting language, invented by Patrick Niemeyer. It runs in the Java Runtime Environment (JRE) and uses a variation of the Java syntax, in addition to scripting commands and syntax.	1999; 17 years ago (1999)	1.3.0 / August 2003; 12 years ago (2003-08)	http://www.beanshell.org/	// Hello World in BeanShell\n\nprint ("Hello World!");
64	Bertrand	Bertrand (named after Bertrand Russell) is a computer programming language for creating constraint programming systems. The language was created by Wm Leler in the mid-1980s as part of his doctoral research. Bertrand has a declarative programming syntax and differentiates itself from other programming languages by use of a technique called augmented term rewriting.	null	null	\N	No code example (yet).
65	BETA	BETA is a pure object-oriented language originating within the "Scandinavian School" in object-orientation where the first object-oriented language Simula was developed.[1] Among its notable features, it introduced nested classes, and unified classes with procedures into so called patterns.	null	null	http://daimi.au.dk/~beta	No code example (yet).
66	Bigwig	Bigwig is a programming language, specifically a high level domain-specific language, designed to build web applications. It is implemented as an Apache HTTP Server module. As of 2011[update], versions are available for the operating systems Linux and Solaris, but not Windows. Bigwig is developed at the Basic Research in Computer Science (BRICS) research center at the Department of Computer Science, Aarhus University, Denmark and borrows ideas from Mawl. It is open-source software with a GNU General Public License.	null	null	http://www.brics.dk/bigwig/	No code example (yet).
67	Bistro	Bistro is a programming language designed and developed by Nikolas Boyd. It is intended to integrate features of Smalltalk and Java, running as a variant of Smalltalk that runs atop any Java virtual machine conforming to Sun Microsystems' Java specification.	1999; 17 years ago (1999)	3.6 / October 14, 2010; 5 years ago (2010-10-14)	http://bistro.sourceforge.net/	No code example (yet).
68	BitC	BitC was a partially designed and implemented systems programming language developed by researchers[1] at the Johns Hopkins University and The EROS Group, LLC as part of the Coyotos project. It aimed to support formal program verification. The primary designer of BitC stopped working the language in 2012 claiming it had fundamental design flaws.[2]	null	BitCC 0.9.1 / February 17, 2006	\N	No code example (yet).
172	EASYTRIEVE PLUS	Easytrieve is a Report generator product of CA Technologies. Easytrieve Classic and Easytrieve Plus are two available versions of this programming languages primarily designed to generate reports and are used by large corporations operating in mainframe (z/OS, z/VM, z/VSE), UNIX, Linux, and Microsoft Windows environments	null	null	\N	No code example (yet).
70	Blockly	Blockly is a client-side JavaScript library for creating visual block programming editors. It is a project of Google and is open-source under the Apache 2.0 License.[1] It runs in a web browser, and resembles Scratch.	null	null	\N	No code example (yet).
71	BlooP	BlooP and FlooP are simple programming languages designed by Douglas Hofstadter to illustrate a point in his book Gödel, Escher, Bach.[1] BlooP is a non-Turing-complete programming language whose main control flow structure is a bounded loop (i.e. recursion is not permitted). All programs in the language must terminate, and this language can only express primitive recursive functions.[2]	null	null	\N	No code example (yet).
73	Boo	Boo is an object-oriented, statically typed, general-purpose programming language that seeks to make use of the Common Language Infrastructure's support for Unicode, internationalization, and web applications, while using a Python-inspired syntax[2] and a special focus on language and compiler extensibility. Some features of note include type inference, generators, multimethods, optional duck typing, macros, true closures, currying, and first-class functions.	2003; 13 years ago (2003)	0.9.4 / 21 January 2011; 5 years ago (2011-01-21)	https://github.com/boo-lang	# Hello World in Boo\nprint "Hello World"
74	Boomerang	Boomerang is a programming language for writing lenses—well-behaved bidirectional transformations —that operate on ad-hoc, textual data formats.	2008	0.2 / September 2, 2009 (2009-09-02)	http://www.seas.upenn.edu/~harmony/	No code example (yet).
75	Bourne shell	The Bourne shell (sh) is a shell, or command-line interpreter, for computer operating systems.	null	null	\N	No code example (yet).
76	BPEL	The Web Services Business Process Execution Language (WS-BPEL), commonly known as BPEL (Business Process Execution Language), is an OASIS[1] standard executable language for specifying actions within business processes with web services. Processes in BPEL export and import information by using web service interfaces exclusively.	null	null	\N	No code example (yet).
77	BREW	Binary Runtime Environment for Wireless (Brew MP, Brew, or BREW) is an application development platform created by Qualcomm, originally for code division multiple access (CDMA) mobile phones, featuring third-party applications such as mobile games. It is offered in some feature phones (mostly with the similar specifications of a mid to high-end mobile phones) but not in smartphones. Developed in 1999, as a platform for wireless applications on CDMA-based mobile phones, it debuted in September 2001.	null	null	http://www.brewmp.com/	No code example (yet).
78	C	C (/ˈsiː/, as in the letter c) is a general-purpose, imperative computer programming language, supporting structured programming, lexical variable scope and recursion, while a static type system prevents many unintended operations. By design, C provides constructs that map efficiently to typical machine instructions, and therefore it has found lasting use in applications that had formerly been coded in assembly language, including operating systems, as well as various application software for computers ranging from supercomputers to embedded systems.	1972; 44 years ago (1972)[2]	C11 / December 2011; 4 years ago (2011-12)	\N	No code example (yet).
79	C Shell	The C shell (csh or the improved version, tcsh, on most machines) is a Unix shell that was created by Bill Joy while he was a graduate student at University of California, Berkeley in the late 1970s. It has been distributed widely, beginning with the 2BSD release of the BSD Unix system that Joy began distributing in 1978.[2][3] Other early contributors to the ideas or the code were Michael Ubell, Eric Allman, Mike O'Brien and Jim Kulp.[4]	null	tcsh 6.19.00 / 21 May 2015; 11 months ago (2015-05-21)[1]	\N	No code example (yet).
80	C--	C-- (pronounced "see minus minus") is a C-like programming language. Its creators, functional programming researchers Simon Peyton Jones and Norman Ramsey, designed it to be generated mainly by compilers for very high-level languages rather than written by human programmers. Unlike many other intermediate languages, its representation is plain ASCII text, not bytecode or another binary format.	1997	null	\N	No code example (yet).
81	C/AL	C/AL (Client/server Application Language) is the programming language used within C/SIDE the Client/Server Integrated Development Environment in Microsoft Dynamics NAV (Formerly known as Navision Attain). C/AL is a Database specific programming language, and is primarily used for retrieving, inserting and modifying records in a Navision database. C/AL resembles the Pascal language on which it is based. The original C/AL compiler was written by Michael Nielsen[1]	null	null	\N	No code example (yet).
83	C++	C++ (pronounced as cee plus plus, /ˈsiː plʌs plʌs/) is a general-purpose programming language. It has imperative, object-oriented and generic programming features, while also providing facilities for low-level memory manipulation.	1983; 33 years ago (1983)	ISO/IEC 14882:2014 / 15 December 2014; 16 months ago (2014-12-15)	http://isocpp.org/	// Hello World in C++ (pre-ISO)\n\n#include <iostream.h>\n\nmain()\n{\n    cout << "Hello World!" << endl;\n    return 0;\n}
84	Caché ObjectScript	Caché ObjectScript (COS) is a part of the Caché database system sold by InterSystems. The language is a functional superset of the ANSI-standard MUMPS programming language. Since Caché is at its core a MUMPS implementation, it can run ANSI MUMPS routines with no change. To appeal as a commercial product, Caché implements support for object-oriented programming, a macro preprocessing language, embedded SQL for ANSI-standard SQL access to M's built-in database, procedure and control blocks using C-like brace syntax, procedure-scoped variables, and relaxed whitespace syntax limitations.	1997	null	\N	No code example (yet).
85	Caml	Caml (originally an acronym for Categorical Abstract Machine Language) is a dialect of the ML programming language family, developed at INRIA and formerly at ENS.	1985	4.00.0 / July 26, 2012; 3 years ago (2012-07-26)	http://caml.inria.fr/	No code example (yet).
233	GNU E	GNU E is an extension of C++ designed for writing software systems to support persistent applications. It was designed as part of the Exodus project.	1991	2.3.3 / May 28, 1993	\N	No code example (yet).
87	CDuce	CDuce is an XML-oriented functional language, which extends XDuce in a few directions. It features XML regular expression types, XML regular expression patterns, XML iterators. CDuce is not strictly speaking an XML transformation language since it can be used for general-purpose programming.	null	null	\N	(* Hello World in CDuce *)\n\nprint "Hello World!\\n";;
88	Cecil	Cecilia is a pure object-oriented programming language that was developed by Craig Chambers at the University of Washington in 1992 to be part of the Vortex project there. Cecil has many similarities to other object-oriented languages, most notably Objective-C, Modula-3, and Self.[1][2] The main goals of the project were extensibility, orthogonality, efficiency, and ease-of-use.	null	null	\N	No code example (yet).
90	Cesil	Cesil, or Computer Education in Schools Instruction Language, was a programming language designed to introduce pupils in British schools to Assembly language. It is rather difficult to define it as high or low level. It has a total of fourteen instructions:	null	null	\N	No code example (yet).
91	Ceylon	Ceylon is an object-oriented, strongly statically typed programming language with an emphasis on immutability, created by Red Hat. Ceylon programs run on the Java Virtual Machine, and can be compiled to JavaScript.[5][6] The language design focuses on readability, predictability, toolability, modularity, and metaprogrammability.[7]	2011	1.2.2 / March 11, 2016; 45 days ago (2016-03-11)	http://ceylon-lang.org/	No code example (yet).
92	CFEngine	CFEngine is an open source configuration management system, written by Mark Burgess. Its primary function is to provide automated configuration and maintenance of large-scale computer systems, including the unified management of servers, desktops, consumer and industrial devices, embedded networked devices, mobile smartphones, and tablet computers.	null	3.7.3 / April 1, 2016	http://www.cfengine.com/	No code example (yet).
93	CFML	ColdFusion Markup Language, more commonly known as CFML, is a scripting language for web development that runs on the JVM, the .NET framework, and Google App Engine. Multiple commercial and open source implementations of CFML engines are available, including Adobe ColdFusion, Lucee, New Atlanta BlueDragon (who makes both a Java-based and a .NET-based version), Railo, and Open BlueDragon as well as other CFML server engines.	1995; 21 years ago (1995)	null	http://www.adobe.com/products/coldfusion	No code example (yet).
94	Cg	Cg (short for C for Graphics) is a high-level shading language developed by Nvidia in close collaboration with Microsoft for programming vertex and pixel shaders. Cg is based on the C programming language and although they share the same syntax, some features of C were modified and new data types were added to make Cg more suitable for programming graphics processing units. This language is only suitable for GPU programming and is not a general programming language. The Cg compiler outputs DirectX or OpenGL shader programs. Since 2012, Cg is deprecated, with no additional development or support available.[1]	null	null	\N	No code example (yet).
95	Ch	Ch /ˌsiːˈeɪtʃ/ is a proprietary cross-platform C and C++ interpreter and scripting language environment, originally designed by Harry H. Cheng as a scripting language for beginners to learn mathematics, computing, numerical analysis (numeric methods), and programming in C/C++. Ch is now developed and marketed by SoftIntegration, Inc. A student edition is freely available.	null	7.5.1 / December 2, 2015; 4 months ago (2015-12-02)	http://www.softintegration.com/	No code example (yet).
96	CHAIN	CHAIN was Datapoint's batch programming language, used in the late 1980s.	null	null	\N	No code example (yet).
97	Chapel	Chapel, the Cascade High Productivity Language, is a parallel programming language developed by Cray.[2] It is being developed as part of the Cray Cascade project, a participant in DARPA's High Productivity Computing Systems (HPCS) program, which had the goal of increasing supercomputer productivity by the year 2010. It is being developed as an open source project, under version 2 of the Apache license.[3]	2009 (2009)	1.12 / October 1, 2015; 6 months ago (2015-10-01)	http://chapel.cray.com/	No code example (yet).
98	Charity	Charity is an experimental purely functional programming language, developed at the University of Calgary under the supervision of Robin Cockett. Based on ideas by Hagino Tatsuya, it is completely grounded in category theory.	1992[1]	null	http://pll.cpsc.ucalgary.ca/charity1/www/home.html	No code example (yet).
99	Charm	Charm is a computer programming language devised in the early 1990s with similarities to the RTL/2, Pascal and C languages in addition to containing some unique features of its own. The Charm language is defined by a context-free grammar amenable to being processed by recursive descent parser as described in seminal books on compiler design.[1][2]	1996	null	http://charm.qu-bit.co.uk/	No code example (yet).
174	Edinburgh IMP	Edinburgh IMP is a development of ATLAS Autocode, initially developed around 1966-1969 at Edinburgh University, Scotland. IMP was a general-purpose programming language which was used heavily for systems programming.	null	null	\N	No code example (yet).
101	CHILL	In computing, CHILL (an acronym for CCITT High Level Language) is a procedural programming language designed for use in telecommunication switches (the hardware used inside telephone exchanges). The language is still used for legacy systems in some telecommunication companies and for signal box programming.	1980	3.0? / 2003; 13 years ago (2003)	\N	No code example (yet).
102	CHIP-8	CHIP-8 is an interpreted programming language, developed by Joseph Weisbecker. It was initially used on the COSMAC VIP and Telmac 1800 8-bit microcomputers in the mid-1970s. CHIP-8 programs are run on a CHIP-8 virtual machine. It was made to allow video games to be more easily programmed for said computers.	null	null	\N	No code example (yet).
173	ECMAScript	ECMAScript (or ES)[1] is a trademarked[2] scripting-language specification standardized by Ecma International in ECMA-262 and ISO/IEC 16262. It was based on JavaScript, which now tracks ECMAScript. It is commonly used for client-side scripting on the World Wide Web. Other implementations include JScript and ActionScript.	1997; 19 years ago (1997)	null	http://www.ecmascript.org/	No code example (yet).
105	CICS	Customer Information Control System (CICS®) is a family of mixed language application servers that provide industrial-strength, online transaction management and connectivity for mission-critical applications on IBM Mainframe systems under z/OS and z/VSE.	null	CICS Transaction Server V5.3 / December 11, 2015; 5 months ago (2015-12-11)	http://www.ibm.com/cics	No code example (yet).
106	Cilk	Cilk, Cilk++ and Cilk Plus are general-purpose programming languages designed for multithreaded parallel computing. They are based on the C and C++ programming languages, which they extend these with constructs to express parallel loops and the fork–join idiom.	1994	1.2 / September 9, 2013; 2 years ago (2013-09-09)	http://www.cilk.com/	No code example (yet).
107	Citrine (programming language)	Citrine is a general purpose programming language for Unix-like operating systems. It focuses on readability and maintainability. Readability is achieved by syntactic and conceptual minimalism. The language is heavily inspired by Smalltalk and Self but has some very distinctive features. Like Smalltalk, Citrine treats everything as an object and focuses on sending messages to these objects. However unlike Smalltalk, Citrine lacks the concept of a class. In this regard, Citrine is more like Self and JavaScript because it uses prototypes. The combination of Smalltalk like messages and prototypes is what makes Citrine unique.	2014	0.2 / 2014; 2 years ago (2014)	http://citrine-lang.org/	No code example (yet).
108	CL	The IBM i Control Language (CL) is a scripting language for the IBM's IBM i platform (previously called OS/400 when running on AS/400 systems) bearing a resemblance to the IBM Job Control Language and consisting of an ever expanding set of command objects (*CMD) used to invoke traditional AS/400 programs and/or get help on what those programs do. CL can also be used to create CL programs (congruent to shell scripts) where there are additional commands that provide program-like functionality (IF/ELSE, variable declaration, file input, etc.)	null	null	\N	No code example (yet).
109	Claire	Claire is a high-level functional and object-oriented programming language with rule processing abilities. It was designed by Yves Caseau at Bouygues' e-Lab research laboratory, and received its final definition in 2004.	1994 (1994)	3.3.46 / February 17, 2009; 7 years ago (2009-02-17)	http://www.claire-language.com/	No code example (yet).
110	Clarion	Clarion is a commercial, 4GL, multi-paradigm, programming language and Integrated Development Environment from SoftVelocity used to program database applications. It is compatible with ISAM, SQL and ADO data access methods, reads and writes several flat file desktop database formats including ASCII, CSV, DOS (Binary), FoxPro, Clipper, dBase, and some relational databases via ODBC, MS SQL Server, Sybase SQL Anywhere and Oracle through the use of accelerated native database drivers, and XML, Clarion can be used to output to HTML, XML, plaintext, and PDF, among others.	null	Clarion 10 / September 2015; 8 months ago (2015-09)	\N	!Hello World in Clarion \n \n  PROGRAM\n \n MAP\n END\n \n CODE\n \n MESSAGE('Hello World!')\n \n RETURN
111	Clean	In computer science, Clean is a general-purpose purely functional computer programming language. For much of the language's active development history it was called Concurrent Clean and emphasized concurrency, but this was dropped at some point.	1987	2.4 / December 23, 2011 (2011-12-23)	\N	// Hello World in Clean\n\nmodule hello\n\nStart :: String\nStart = "Hello World!\\n"
112	Clipper	Clipper is a xBase compiler, which is a computer programming language, that is used to create software programs that originally operated primarily under DOS. Although it is a powerful general-purpose programming language, it was primarily used to create database/business programs.	1985 (1985)	CA Clipper 5.3b / May 20, 1997	http://www.grafxsoft.com/clipper.htm	// Hello World in Clipper\n\n? "Hello World"
113	CLIST	CLIST (Command List) (pronounced "C-List") is a procedural programming language for TSO in MVS systems. It originated in OS/360 Release 20 and has assumed a secondary role since the availability of Rexx in TSO/E Version 2. The term CLIST is also used for command lists written by users of NetView.[1]	null	null	\N	No code example (yet).
114	Clojure	Clojure (pronunciation: /ˈkloʊʒɜːr/, like "closure"[6]) is a dialect of the Lisp programming language created by Rich Hickey.[7] Clojure is a general-purpose programming language with an emphasis on functional programming.[8] It runs on the Java virtual machine, Common Language Runtime,[9] and JavaScript[10] engines. Like other Lisps, Clojure treats code as data and has a macro system.[11] The current development process is community-driven,[12] overseen by Rich Hickey as its benevolent dictator for life (BDFL).[13]	2007; 9 years ago (2007)	1.8[1] / January 19, 2016; 3 months ago (2016-01-19)	http://clojure.org/	; Hello world in Clojure\n\n(defn hello []\n  (println "Hello world!"))\n\n(hello)
115	CLU	CLU is a pioneering programming language created at the Massachusetts Institute of Technology (MIT) by Barbara Liskov and her students between 1974 and 1975. While it did not find extensive use, it introduced many features that are used widely now, and is seen as a step in the development of object-oriented programming (OOP). However, it is not object-oriented, instead being considered an object-based language, as it lacked many features of OOP.	1975; 41 years ago (1975)	1.5 / May 26, 1989; 26 years ago (1989-05-26)	http://www.pmg.lcs.mit.edu/CLU.html	No code example (yet).
116	CMS EXEC	CMS EXEC, or EXEC, is an interpreted, command procedure control, computer scripting language used by the CMS EXEC Processor supplied with the IBM Virtual Machine/Conversational Monitor System (VM/CMS) operating system.	null	null	\N	No code example (yet).
117	CMS-2	CMS-2 is an embedded systems programming language used by the United States Navy.[2]It was an early attempt to develop a standardized high-level computer programming language intended to improve code portability and reusability. CMS-2 was developed primarily for the US Navy’s tactical data systems (NTDS).[1]	1968	null	\N	No code example (yet).
119	Cobra	Cobra is a general-purpose, object-oriented programming language.[1] Cobra is designed by Charles Esterbrook, and runs on the Microsoft .NET and Mono platforms.[2] It is strongly influenced by Python, C#, Eiffel, Objective-C, and other programming languages.[3] It supports both static and dynamic typing.[4][5] It has support for unit tests and contracts.[4] It has lambda expressions, closures, list comprehensions, and generators.[6]	2006; 10 years ago (2006)	0.9.6 / December 23, 2013; 2 years ago (2013-12-23)	http://cobra-language.com/	"""Hello world in Cobra"""\n\nclass Hello\n\n    def main\n        print 'Hello, world.'
120	CODE	CODE (computationally oriented display environment[1]) is a visual programming language and system for parallel programming, which lets users compose sequential programs into parallel programs.	null	null	http://www.cs.utexas.edu/users/code/	No code example (yet).
121	CoffeeScript	CoffeeScript is a programming language that transcompiles to JavaScript. It adds syntactic sugar inspired by Ruby, Python and Haskell in an effort to enhance JavaScript's brevity and readability.[3] Specific additional features include list comprehension and pattern matching.	December 13, 2009; 6 years ago (2009-12-13)	1.10.0 / September 3, 2015; 8 months ago (2015-09-03)	http://coffeescript.org/	No code example (yet).
122	Cola	Cola is a programming language similar to Java and C# with some higher level features of Perl and Ruby including first-class regular expressions. It can be compiled for the Microsoft .NET CLR or the Parrot virtual machine.	null	null	\N	No code example (yet).
123	ColdC	ColdC is a programming language, forked from C--/ColdMUD (created by Greg Hudson). The ColdC project was started and maintained by Brandon Gillespie along with other developers, and managed ColdC/Genesis addressing applications in fields unrelated to MUDs. It is a dynamically typed prototype-based object oriented system, with a syntax derived from the C programming language. The original C-- was heavily influenced in design by the CoolMUD system and programming language. The resulting ColdC featured characteristics:	1993	null	http://cold.org/coldc/	No code example (yet).
124	ColdFusion	ColdFusion is a commercial rapid web application development platform created by JJ Allaire in 1995.[1][2][3][4] (The programming language used with that platform is also commonly called ColdFusion, though is more accurately known as CFML.) ColdFusion was originally designed to make it easier to connect simple HTML pages to a database. By Version 2 (1996), it had become a full platform that included an IDE in addition to a full scripting language.	null	2016.0.0.297996 / February 16, 2016; 2 months ago (2016-02-16)	https://www.adobe.com/products/coldfusion	<!---Hello world in ColdFusion--->\n\n<cfset message = "Hello World">\n<cfoutput> #message#</cfoutput>
125	COMAL	COMAL (Common Algorithmic Language) is a computer programming language developed in Denmark by Benedict Løfstedt and Børge R. Christensen in 1973.	1973	null	\N	No code example (yet).
126	Combined Programming Language	CPL (from Combined Programming Language and Cambridge Programming Language before that) is a multi-paradigm programming language, that was developed in the early 1960s.	1963; 53 years ago (1963)	null	\N	No code example (yet).
127	COMIT	COMIT was the first string processing language (compare SNOBOL, TRAC, and Perl), developed on the IBM 700/7000 series computers by Dr. Victor Yngve and collaborators at MIT from 1957-1965. Yngve created the language for supporting computerized research in the field of linguistics, and more specifically, the area of machine translation for natural language processing. The creation of COMIT led to the creation of SNOBOL.	1957 (1957)	null	\N	No code example (yet).
129	Common Lisp	Common Lisp (CL) is a dialect of the Lisp programming language, published in ANSI standard document ANSI INCITS 226-1994 (R2004) (formerly X3.226-1994 (R1999)).[1] The Common Lisp HyperSpec, a hyperlinked HTML version, has been derived from the ANSI Common Lisp standard.[2]	1984, 1994 for ANSI Common Lisp	null	http://common-lisp.net/	No code example (yet).
130	COMPASS	COMPASS is an acronym for COMPrehensive ASSembler. COMPASS is any of a family of macro assembly languages on Control Data Corporation's 3000 series, and on the 60-bit CDC 6000 series, 7600 and Cyber 70 and 170 series mainframe computers. While the architectures are very different, the macro and conditional assembly facilities are similar.	null	null	\N	No code example (yet).
131	Component Pascal	Component Pascal is a programming language in the tradition of Niklaus Wirth's Pascal,[1] Modula-2,[2] Oberon[3][4] and Oberon-2.[5] It bears the name of the Pascal programming language but is incompatible with it. Instead, it is a minor variant and refinement of Oberon-2, designed and supported by a small ETH Zürich spin-off company called Oberon microsystems. They developed an IDE (Integrated development environment) called BlackBox Component Builder. At the time the first version was released (1994 as Oberon/F) it presented a novel approach to graphical user interface (GUI) construction based on editable forms, where fields and command buttons are linked to exported variables and executable procedures. This approach bears some similarity to the code-behind way used in Microsoft's .NET 3.0 to access code in XAML.	1997	null	\N	No code example (yet).
132	Constraint Handling Rules	Constraint Handling Rules (CHR) is a declarative, rule-based language, introduced in 1991 by Thom Frühwirth at the time in the University of Ulm.[1][2] Originally intended for constraint programming, CHR finds applications in abductive reasoning, multi-agent systems, natural language processing, compilation, scheduling, spatial-temporal reasoning, testing and verification, and type systems.	1991	null	\N	No code example (yet).
133	Converge	Converge is a dynamic object-oriented programming language with compile-time meta-programming facilities.	null	null	\N	No code example (yet).
134	Cool	Cool, an acronym for Classroom Object Oriented Language, is a computer programming language designed by Alexander Aiken for use in an undergraduate compiler course project. While small enough for a one term project, Cool still has many of the features of modern programming languages, including objects, automatic memory management, strong static typing and simple reflection.	1996	null	\N	-- Hello World in Cool\n\nclass Main inherits IO{\n    main():Object{\n    out_string("Hello, world!\\n")\n    };\n};
136	Coral 66	CORAL (Computer On-line Real-time Applications Language) is a programming language originally developed in 1964 at the Royal Radar Establishment (RRE), Malvern, UK, as a subset of JOVIAL. Coral 66 was subsequently developed by I. F. Currie and M. Griffiths under the auspices of IECCA (Inter-Establishment Committee for Computer Applications). Its official definition,[1] edited by Woodward, Wetherall and Gorman, was first published in 1970.	1964; 52 years ago (1964)	null	\N	No code example (yet).
137	Corn	This is a selected list of video game system emulators. For information about emulating specific systems, including those not covered by the emulators in this list, see the respective article for each system.	null	null	\N	No code example (yet).
138	CorVision	CorVision is a fourth generation programming tool (4GL) currently owned by Attunity, Inc. CorVision was developed by Cortex Corporation for the VAX/VMS ISAM environment. Although Cortex beta tested CorVision-10 which was generated for PCs but CorVision itself stayed anchored on VMS. CorVision-10 proved more difficult than hoped, and was never released.	1986 (1986)	null	\N	No code example (yet).
139	COWSEL	COWSEL (COntrolled Working SpacE Language) is a programming language designed between 1964 and 1966 by Robin Popplestone. It was based on an RPN form of Lisp combined with some ideas from CPL.	1964 (1964)	null	\N	No code example (yet).
140	Cryptol	Cryptol is a domain specific programming language for cryptography developed by the Portland, Oregon based software development firm, Galois, Inc.. [1] [2] The language was originally developed for use by the United States National Security Agency. [3][1] The language is also used by private firms that provide information technology systems, such as the American company Rockwell Collins provides to aerospace and defense contractors in the United States.[1]	null	null	\N	No code example (yet).
141	csh	The C shell (csh or the improved version, tcsh, on most machines) is a Unix shell that was created by Bill Joy while he was a graduate student at University of California, Berkeley in the late 1970s. It has been distributed widely, beginning with the 2BSD release of the BSD Unix system that Joy began distributing in 1978.[2][3] Other early contributors to the ideas or the code were Michael Ubell, Eric Allman, Mike O'Brien and Jim Kulp.[4]	null	tcsh 6.19.00 / 21 May 2015; 11 months ago (2015-05-21)[1]	\N	No code example (yet).
142	Csound	Csound is a computer programming language for sound, also known as a sound compiler or an audio programming language, or more precisely, an audio DSL. It is called Csound because it is written in C, as opposed to some of its predecessors.	null	6.06[1] / November 17, 2015 (2015-11-17)	http://csound.github.io/	No code example (yet).
145	Curl	Curl is a reflective object-oriented programming language for interactive web applications whose goal is to provide a smoother transition between formatting and programming. It makes it possible to embed complex objects in simple documents without needing to switch between programming languages or development platforms.The Curl implementation initially consisted of just an interpreter, but a compiler was later added.	1998	8.0.6 / 13 November 2015; 5 months ago (2015-11-13)	http://www.curl.com/	No code example (yet).
146	Curry	Curry[1] is an experimental functional logic programming language,[2] based on the Haskell language. It merges elements of functional and logic programming, including constraint programming integration.	null	null	\N	No code example (yet).
147	Cyclone	The Cyclone programming language is intended to be a safe dialect of the C language. Cyclone is designed to avoid buffer overflows and other vulnerabilities that are endemic in C programs, without losing the power and convenience of C as a tool for system programming.	2006 (2006)	null	http://cyclone.thelanguage.org/	No code example (yet).
148	Cython	The Cython programming language is a superset of Python, designed to give C-like performance with code which is mostly written in Python.[3][4]	null	0.24 (4 April 2016; 41 days ago (2016-04-04)) [±][2]	http://cython.org/	No code example (yet).
149	D	The D programming language is an object-oriented, imperative, multi-paradigm system programming language created by Walter Bright of Digital Mars and released in 2001. Bright was joined in the design and development effort in 2007 by Andrei Alexandrescu. Though it originated as a re-engineering of C++, D is a distinct language, having redesigned some core C++ features while also taking inspiration from other languages, notably Java, Python, Ruby, C#, and Eiffel.	2001; 15 years ago (2001)[1]	2.071.0[2] / April 5, 2016; 42 days ago (2016-04-05)[3]	http://dlang.org/	// Hello World in D\n\nimport std.stdio;\n\nvoid main()\n{\n   writefln("Hello World!");\n}
150	Dart	Dart is a general-purpose programming language originally developed by Google and later approved as a standard by Ecma (ECMA-408).[4] It is used to build web, server and mobile applications, and for Internet of Things (IoT) devices.[5] It is open-source software under a BSD license.	October 10, 2011; 4 years ago (2011-10-10)[2]	1.16 / April 26, 2016; 18 days ago (2016-04-26)	http://www.dartlang.org/	// Hello world in Dart\n\nmain() {\n   print('Hello world!');\n}
151	DASL	DASL (Datapoint's Advanced Systems Language) was a programming language and compiler proprietary to Datapoint. Primarily influenced by Pascal with some C touches, it was created in the early 1980s by Gene Hughes.	null	null	\N	No code example (yet).
152	DataFlex	DataFlex is a relational database management system, self-described as an applications development database, originated around 1980.	null	null	\N	No code example (yet).
153	Datalog	Datalog is a declarative logic programming language that syntactically is a subset of Prolog. It is often used as a query language for deductive databases. In recent years, Datalog has found new application in data integration, information extraction, networking, program analysis, security, and cloud computing.[1]	null	null	\N	No code example (yet).
155	dBase	dBase (also stylized dBASE) was one of the first database management systems for microcomputers, and the most successful in its day.[2] The dBase system includes the core database engine, a query system, a forms engine, and a programming language that ties all of these components together. dBase's underlying file format, the .dbf file, is widely used in applications needing a simple format to store structured data.	1979; 37 years ago (1979)	null	http://www.dbase.com/	* Hello World in dBase IV\n\n? "Hello World!"
156	dc	dc is a cross-platform reverse-polish desk calculator which supports arbitrary-precision arithmetic.[1] It is one of the oldest Unix utilities, predating even the invention of the C programming language. Like other utilities of that vintage, it has a powerful set of features but an extremely terse syntax.[2][3] Traditionally, the bc calculator program (with infix notation) was implemented on top of dc.	null	null	\N	#!/usr/bin/dc\n# Hello world! in dc (Unix desk calculator)\n[Hello world!]p
158	Deesel	Embarcadero Delphi is a programming language and integrated development environment (IDE) for desktop, mobile, web, and console applications.[1] Delphi's compilers use their own Object Pascal dialect of Pascal and generate native code for several platforms: Windows (x86 and x64), OS X (32-bit only), and iOS (32 and 64-bit) and Android.	null	Delphi 10.1 Berlin / April 20, 2016; 27 days ago (2016-04-20)	http://embarcadero.com/products/delphi	No code example (yet).
159	Delphi	Embarcadero Delphi is a programming language and integrated development environment (IDE) for desktop, mobile, web, and console applications.[1] Delphi's compilers use their own Object Pascal dialect of Pascal and generate native code for several platforms: Windows (x86 and x64), OS X (32-bit only), and iOS (32 and 64-bit) and Android.	null	Delphi 10.1 Berlin / April 20, 2016; 27 days ago (2016-04-20)	http://embarcadero.com/products/delphi	// Hello World in Delphi\nProgram Hello_World;\n\n{$APPTYPE CONSOLE}\n\nBegin\n  WriteLn('Hello World');\nEnd.
160	DIBOL	DiBOL or Digital's Business Oriented Language is a general-purpose, procedural, imperative programming language, designed for use in Management Information Systems (MIS) software development. It has a syntax similar to FORTRAN and BASIC, along with BCD arithmetic. It shares the COBOL program structure of data and procedure divisions.	1970	Dibol 1992 / 2002	\N	No code example (yet).
161	DinkC	Dink Smallwood is an action role-playing video game, developed by Robinson Technologies, at the time consisting of Seth Robinson, Justin Martin, and Greg Smith. It was first released in 1998 before being released as freeware on October 17, 1999.[1] Mitch Brink composed several of the game's music tracks, while others are MIDI forms of classical music, such as Debussy's "Reverie". The game has a small but constant fan following that continues to develop add-ons for the game more than a decade after its release.[2] The game is also notable for its humorous dialogue and surrealistic themes in various scenes between the gameplay.	null	null	\N	No code example (yet).
162	Dog	Sepandar David Kamvar (born 1977), also known as Sep Kamvar, is a computer scientist, artist, and entrepreneur.[1][2][3][4] He is currently the LG Career Development Professor of Media Arts and Sciences at MIT, and director of the Social Computing group at the MIT Media Lab.[3][5]	null	null	\N	No code example (yet).
163	Draco	Draco was a shareware programming language for CP/M and the Amiga, created by Chris Gray in the early 1980s, and discontinued sometime around 1990.[1]	early 1980s, discontinued around 1990	null	\N	/* Hello world in Draco */\n\nproc main()void:\n    writeln("Hello world!");\ncorp;
164	DRAKON	DRAKON is an algorithmic visual programming language developed within the Buran space project.	null	null	\N	No code example (yet).
166	DYNAMO	DYNAMO (DYNAmic MOdels) was a simulation language and accompanying graphical notation developed within the system dynamics analytical framework. It was originally for industrial dynamics but was soon extended to other applications, including population and resource studies[1][2] and urban planning.[3][4]	null	null	\N	No code example (yet).
167	E	E is an object-oriented programming language for secure distributed computing, created by Mark S. Miller, Dan Bornstein, and others at Electric Communities in 1997. E is mainly descended from the concurrent language Joule and from Original-E, a set of extensions to Java for secure distributed programming. E combines message-based computation with Java-like syntax. A concurrency model based on event loops and promises ensures that deadlock can never occur.[citation needed]	1997	null	http://erights.org/	# Hello World in E\n\nprintln("Hello, world!")
168	E#	E# is an object-oriented programming language for embedding, created by Adrian Punga in 2012. E# is mainly based on ideas in SmallTalk, Python, Java and C# but it resembles the syntax of Java. E# combines message-based computation with Java-like syntax.	2012	null	http://code.google.com/p/esharp	No code example (yet).
169	Ease	Ease is a general purpose parallel programming language, designed by Steven Ericsson-Zenith of Yale University. It combines the process constructs of CSP with logically shared data structures called contexts. Contexts are parallel data types that are constructed by processes and provide a way for processes to interact.	null	null	\N	No code example (yet).
170	Easy PL/I	PL/I ("Programming Language One", pronounced /piː ɛl wʌn/) is a procedural, imperative computer programming language designed for scientific, engineering, business and system programming uses. It has been used by various academic, commercial and industrial organizations since it was introduced in the 1960s, and continues to be actively used as of 2009[update].[1]	1964	IBM Enterprise PL/I 4.4 / July 2013	\N	No code example (yet).
171	Easy Programming Language	Easy Programming Language (EPL, Chinese: 易语言) is a Chinese programming language, featuring a full Chinese environment. Its community may be the largest of all non-English-based programming languages. EPL is popular in China, considering the difficulties of adopting English for most Chinese speakers.	null	null	\N	No code example (yet).
192	EusLisp Robot Programming Language	EusLisp is a Lisp-based programming system. Built on the basis of object orientation, it is designed specifically for developing robotics software. The first version of it ran in 1986 on Unix-System5/Ustation-E20.[1]	null	null	\N	No code example (yet).
176	Eiffel	Eiffel is an ISO-standardized, object-oriented programming language designed by Bertrand Meyer (an object-orientation proponent and author of Object-Oriented Software Construction) and Eiffel Software. The design of the language is closely connected with the Eiffel programming method. Both are based on a set of principles, including design by contract, command-query separation, the uniform-access principle, the single-choice principle, the open-closed principle, and option-operand separation.	1986	null	\N	note "Hello World in Eiffel"\nclass HELLO\ncreate run\nfeature run\n       do\n               print ("Hello World!%N")\n       end\nend
177	ELAN	ELAN is an educational programming language for learning and teaching systematic programming.	1974	null	\N	No code example (yet).
178	Elixir	Elixir is a functional, concurrent, general-purpose programming language that runs on the Erlang virtual machine (BEAM). Elixir builds on top of Erlang to provide distributed, fault-tolerant, soft real-time, non-stop applications but also extends it to support metaprogramming with macros and polymorphism via protocols.[3]	2012; 4 years ago (2012)	1.2.5 / 30 April 2016; 17 days ago (2016-04-30)[1]	http://elixir-lang.org/	# Hello world in Elixir\n\ndefmodule HelloWorld do\n  IO.puts "Hello, World!"\nend
179	Elm	Elm is a functional programming language for declaratively creating web browser-based graphical user interfaces. Elm uses the functional reactive programming style and purely functional graphical layout to build user interface without any destructive updates.	2012	0.17 / May 10, 2016; 5 days ago (2016-05-10)	\N	-- Hello world in Elm\n\nimport Text\n\nmain = Text.plainText "Hello, world!"
181	Emerald	Emerald is a distributed, object-oriented programming language developed in the 1980s by Andrew P. Black, Norman C. Hutchinson, Eric B. Jul, and Henry M. Levy, in the Department of Computer Science at the University of Washington.[1]	1980s	null	http://www.emeraldprogramminglanguage.org/	No code example (yet).
182	Epigram	Epigram is a functional programming language with dependent types. Epigram also refers to the IDE usually packaged with the language. Epigram's type system is strong enough to express program specifications. The goal is to support a smooth transition from ordinary programming to integrated programs and proofs whose correctness can be checked and certified by the compiler. Epigram exploits the propositions as types principle, and is based on intuitionistic type theory.	2004	1 / October 11, 2006 (2006-10-11)	\N	No code example (yet).
275	Ioke	Ioke is a dynamic, strongly typed, prototype-based programming language targeting the Java Virtual Machine and the Common Language Runtime. It was designed by Ola Bini, a developer of JRuby. It has a very simple homoiconic syntax, somewhat similar to Io.	November 6, 2008; 7 years ago (2008-11-06)[1]	P (ikj-0.4.0, ikc-0.4.0)	http://ioke.org/	No code example (yet).
183	Erlang	Erlang (/ˈɜːrlæŋ/ ER-lang) is a general-purpose, concurrent, functional programming language. It is also a garbage-collected runtime system. The sequential subset of Erlang supports eager evaluation, single assignment, and dynamic typing. Erlang is known for its designs that are well suited for systems with the following characteristics:	1986; 30 years ago (1986)	18.3[1] / March 16, 2016; 61 days ago (2016-03-16)	http://www.erlang.org/	%% Hello World in Erlang\n\n-module(hello).\n\n-export([hello/0]).\n\nhello() ->\n   io:format("Hello World!~n", []).
184	es	rc is the command line interpreter for Version 10 Unix and Plan 9 from Bell Labs operating systems. It resembles the Bourne shell, but its syntax is somewhat simpler. It was created by Tom Duff, who is better known for an unusual C programming language construct ("Duff's device").	1989; 27 years ago (1989)	null	\N	No code example (yet).
185	Escher	Escher is a declarative programming language that supports both functional programming and logic programming models, developed by J.W. Lloyd in the mid-1990s. It was designed mostly as a research and teaching vehicle. The basic view of programming exhibited by Escher and related languages is that a program is a representation of a theory in some logic framework, and the program's execution (computation) is a deduction from the theory. The logic framework for Escher is Alonzo Church's simple theory of types.	mid-1990s	null	\N	No code example (yet).
186	ESPOL	ESPOL (short for Executive Systems Problem Oriented Language) was a superset of ALGOL 60 that provided capabilities of what would later be known as Mohols, machine oriented high order languages, such as interrupting a processor on a multiprocessor system (the Burroughs large systems were multiprocessor processor systems). It was used to write the MCP (Master Control Program) on Burroughs computer systems from the B5000 to the B6700. The single-pass compiler for ESPOL could compile over 250 lines per second.	null	null	\N	No code example (yet).
187	Esterel	Esterel is a synchronous programming language for the development of complex reactive systems. The imperative programming style of Esterel allows the simple expression of parallelism and preemption. As a consequence, it is well suited for control-dominated model designs.	null	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.46.2076	No code example (yet).
188	Etoys	Etoys is a child-friendly computer environment and object-oriented prototype-based programming language for use in education.	1996	null	\N	No code example (yet).
190	Euler	Euler is a programming language created by Niklaus Wirth and Helmut Weber, conceived as an extension and generalization of ALGOL 60. The designers' goal was to create a language:	null	null	\N	No code example (yet).
191	Euphoria	Euphoria is a programming language originally created by Robert Craig of Rapid Deployment Software[1] in Toronto, Canada. Initially developed (though not publicly released) on the Atari ST,[2] the first commercial release[3] was for the 16-bit DOS platform and was proprietary. In 2006, with the release of version 3,[4] Euphoria became open-source software. The openEuphoria Group continues to administer and develop the project.[5] In December 2010, the openEuphoria Group released version 4[6] of openEuphoria along with a new identity and mascot for the project. OpenEuphoria is currently available for Windows, Linux, OS X and three flavors of *BSD.	1993; 23 years ago (1993)	4.0.5 / October 19, 2012; 3 years ago (2012-10-19)	http://openeuphoria.org/	-- Hello World in Euphoria\n\nputs(1, "Hello World!\\n")
196	F-Script	F-Script is an object-oriented scripting programming language for Apple's OS X operating system developed by Philippe Mougin. F-Script is an interactive language based on Smalltalk, using OS X's native Cocoa API.	null	2.2.1 / February 5, 2014; 2 years ago (2014-02-05)	http://www.fscript.org/	No code example (yet).
197	F#	F# (pronounced F sharp) is a strongly typed, multi-paradigm programming language that encompasses functional, imperative, and object-oriented programming techniques. F# is most often used as a cross-platform CLI language, but can also be used to generate JavaScript[6] and GPU[7] code.	2005 (version 1.0) (2005 (version 1.0))	4.0[1] / July 20, 2015 (2015-07-20)	\N	(* Hello World in F# *)\n\nprintf "Hello World!\\n"
198	Factor	Factor is a stack-oriented programming language created by Slava Pestov. Factor is dynamically typed and has automatic memory management, as well as powerful metaprogramming features. The language has a single implementation featuring a self-hosted optimizing compiler and an interactive development environment. The Factor distribution includes a large standard library.	2003	0.97 / November 2, 2014 (2014-11-02)	http://factorcode.org/	No code example (yet).
199	Falcon	Falcon is an open source, multi-paradigm programming language. Design and implementation is led by Giancarlo Niccolai,[3][4] a native of Bologna, Italy and Information Technology graduate from Pistoia.	2003; 13 years ago (2003)	0.9.6.8 (Chimera) / December 31, 2010; 5 years ago (2010-12-31)[1]	http://www.falconpl.org/	// Hello World in Falcon\n\n> "Hello World!"
200	Fantom	Fantom is a general purpose object-oriented programming language created by Brian and Andy Frank[4] that runs on the Java Runtime Environment (JRE), JavaScript, and the .NET Common Language Runtime (CLR) (.NET support is considered "prototype"[5] status). Its primary design goal is to provide a standard library API[6] that abstracts away the question of whether the code will ultimately run on the JRE or CLR. Like C# and Java, Fantom uses a curly brace syntax. The language supports functional programming through closures and concurrency through the Actor model. Fantom takes a "middle of the road" approach to its type system, blending together aspects of both static and dynamic typing.	2005[1]	1.0.67 / January 9, 2015; 15 months ago (2015-01-09)[2]	http://www.fantom.org/	No code example (yet).
201	FAUST	FAUST (Functional AUdio STream) is a domain-specific purely functional programming language for implementing signal processing algorithms in the form of libraries, audio plug-ins, or standalone applications. A FAUST program denotes a signal processor: a mathematical function that is applied to some input signal and then fed out.	null	0.9.67 / May 19, 2014 (2014-05-19)	http://faust.grame.fr/	No code example (yet).
202	FFP	FP (short for Function Programming) is a programming language created by John Backus to support the function-level programming[2] paradigm. This allows eliminating named variables.	1977	null	\N	No code example (yet).
203	Fjölnir	Fjölnir (also Fjolnir or Fjoelnir) is a programming language developed by professor Snorri Agnarsson of computer science at Háskóli Íslands that was mostly used in the 1980s. The source files usually have the extension fjo or sma.	1980s	null	\N	;; Hello World in Fjölnir (Icelandic programming language)\n\n"hello" < main\n{\n   main ->\n   stef(;)\n   stofn\n       skrifastreng(;"Halló Veröld!"),\n   stofnlok\n}\n*\n"GRUNNUR"\n;
204	FL	FL (short for Function Level) is a programming language created at the IBM Almaden Research Center by John Backus, John Williams, and Edward Wimmers in 1989.	1989	null	\N	No code example (yet).
205	Flavors	Flavors,[1] an early object-oriented extension to Lisp developed by Howard Cannon at the MIT Artificial Intelligence Laboratory for the Lisp machine and its programming language Lisp Machine Lisp, was the first programming language to include mixins.[2] Symbolics used it for its Lisp machines, and eventually developed it into New Flavors; both the original and new Flavors were message passing OO models. It was hugely influential in the development of the Common Lisp Object System (CLOS).[3]	null	null	\N	No code example (yet).
206	Flex	In computing, the FLEX language was developed by Alan Kay in the late 1960s while exploring ideas that would later evolve into the Smalltalk programming language.[1]	null	null	\N	No code example (yet).
207	FLOW-MATIC	FLOW-MATIC, originally known as B-0 (Business Language version 0), was the first English-like data processing language. It was developed for the UNIVAC I at Remington Rand under Grace Hopper during the period from 1955 until 1959. It had a strong influence on the development of COBOL.	1955 (1955)	null	\N	No code example (yet).
208	FOCAL	FOCAL is an interpreted programming language resembling JOSS. The name is an acronym for Formulating On-Line Calculations in Algebraic Language.	null	null	\N	No code example (yet).
209	FOCUS	FOCUS is a computer programming language and development environment. It is a language used to build database queries, and is regarded as a fourth-generation programming language (4GL). Produced by Information Builders Inc., it was originally developed for data handling and analysis on the IBM mainframe. As newer systems were developed and smaller computers became more powerful, the available platforms for FOCUS were extended to personal computers and in 1997, to the World Wide Web in the WebFOCUS product.	null	null	\N	-* Hello World in FOCUS\n\n-TYPE Hello world
210	FOIL	FOIL was the name for two different programming languages.	null	null	\N	No code example (yet).
211	FORMAC	FORMAC, acronym of FORmula MAnipulation Compiler was an early computer algebra system based on FORTRAN. It was developed by Jean E. Sammet.	null	null	\N	No code example (yet).
232	GM	A software release life cycle is the sum of the stages of development and maturity for a piece of computer software: ranging from its initial development to its eventual release, and including updated versions of the released version to help improve software or fix bugs still present in the software.	null	null	\N	No code example (yet).
265	IBM Informix-4GL	Informix-4GL is a 4GL programming language developed by Informix during the mid-1980s.	null	null	\N	No code example (yet).
214	Fortress	Fortress is a discontinued experimental programming language for high-performance computing, created by Sun Microsystems with funding from DARPA's High Productivity Computing Systems project. One of the language designers was Guy L. Steele Jr., whose previous work includes Scheme, Common Lisp, and Java.	null	1.0_5033 / September 7, 2011 (2011-09-07)	\N	(* Hello World in Fortress *)\n\nexport Executable\nrun(args) = print "Hello, world!"
216	FoxPro	FoxPro was a text-based procedurally oriented programming language and database management system (DBMS), and it is also an object-oriented programming language, originally published by Fox Software and later by Microsoft, for MS-DOS, Windows, Macintosh, and UNIX. The final published release of FoxPro was 2.6. Development continued under the Visual FoxPro label, which in turn was discontinued in 2007.	null	null	\N	No code example (yet).
217	FP	FP (short for Function Programming) is a programming language created by John Backus to support the function-level programming[2] paradigm. This allows eliminating named variables.	1977	null	\N	No code example (yet).
218	FPr	FPr (Function-level Programming right-associative) is a programming language that is an implementation of an FP-System. FP was invented by John Backus and described in his Turing Award lecture.[1] FPr features the list-techniques of Lisp and some techniques of object-oriented programming especially the use of the infix notation. FPr offers an alternative for the usage of local variables.	null	0.11	\N	No code example (yet).
219	Franz Lisp	In computer programming, Franz Lisp was a Lisp system written at UC Berkeley by the students of Professor Richard J. Fateman, based largely on Maclisp and distributed with the Berkeley Software Distribution (BSD) for the Digital Equipment Corp (DEC) VAX. Piggybacking on the popularity of the BSD package, Franz Lisp was probably the most widely distributed and used Lisp system of the 1970s and 1980s.[1]	null	null	\N	No code example (yet).
220	Frege	Frege is a non-strict, pure functional programming language for the Java virtual machine in the spirit of Haskell.	2011; 5 years ago (2011)	3.24 / 12 March 2016; 2 months ago (2016-03-12)	https://github.com/Frege/frege	No code example (yet).
221	G	G-code (also RS-274), which has many variants, is the common name for the most widely used numerical control (NC) programming language. It is used mainly in computer-aided manufacturing to control automated machine tools. G-code is sometimes called G programming language, not to be confused with LabVIEW's G programming language.	1950s (first edition)	null	\N	No code example (yet).
223	Game Maker Language	GameMaker: Studio (originally named Animo and later Game Maker) is a proprietary game creation system created by Mark Overmars in the Delphi programming language.[1]	null	v1.4.1749 / 24 February 2016; 2 months ago (2016-02-24)	http://www.yoyogames.com/	No code example (yet).
224	GameMonkey Script	GameMonkey Script is a small, cross-platform scripting language designed, as its name suggests, for embedding into games. GameMonkey bears many similarities to Lua, except the syntax is more similar to that of C.	null	null	\N	No code example (yet).
225	GAMS	The General Algebraic Modeling System (GAMS) is a high-level modeling system for mathematical optimization. GAMS is designed for modeling and solving linear, nonlinear, and mixed-integer optimization problems. The system is tailored for complex, large-scale modeling applications and allows the user to build large maintainable models that can be adapted to new situations. The system is available for use on various computer platforms. Models are portable from one platform to another.	null	24.7.1 / March 15, 2016	\N	No code example (yet).
226	GAP	GAP (Groups, Algorithms and Programming) is a computer algebra system for computational discrete algebra with particular emphasis on computational group theory.	null	4.8.2 / February 20, 2016; 2 months ago (2016-02-20)[1]	http://www.gap-system.org/	No code example (yet).
227	GDL	In computer-aided design, Geometric Description Language (GDL) is the programming language of ArchiCAD library parts. GSM is the file format of these CAD objects.	null	null	\N	No code example (yet).
252	Hartmann pipelines	CMS Pipelines implements the pipeline concept under the VM/CMS operating system. The programs in a pipeline operate on a sequential stream of records. A program writes records that are read by the next program in the pipeline. Any program can be combined with any other because reading and writing is done through a device independent interface.	1986	1.1.12/000C / 2015-07-30	\N	No code example (yet).
228	Genie	Genie is a modern, general-purpose high-level programming language in active development since 2008.[1] It was designed as an alternative, simpler and cleaner dialect for the Vala compiler, while preserving the same functionality of the Vala language. Genie uses the same compiler and libraries as Vala; the two can indeed be used alongside each other.[2] The differences are only syntactical.	2008; 8 years ago (2008)	0.11.0 / October 4, 2010; 5 years ago (2010-10-04)	https://wiki.gnome.org/Projects/Genie	No code example (yet).
229	GEORGE	GEORGE is a programming language invented by Charles Leonard Hamblin in 1957.[1][2]	null	null	\N	No code example (yet).
230	GJ	Generic Java (GJ) is a programming language that is a superset of Java which adds support for generic programming. It was designed by Gilad Bracha, Martin Odersky, David Stoutamire, and Philip Wadler to offer developers a smoother transition and better Java compatibility than the Pizza programming language, previously created by Odersky and Wadler.	null	null	http://homepages.inf.ed.ac.uk/wadler/pizza/gj/	No code example (yet).
231	GLSL	OpenGL Shading Language (abbreviated: GLSL or GLslang), is a high-level shading language based on the syntax of the C programming language. It was created by the OpenGL ARB (OpenGL Architecture Review Board) to give developers more direct control of the graphics pipeline without having to use ARB assembly language or hardware-specific languages.	null	null	\N	No code example (yet).
235	Go!	Go! is an agent-based programming language in the tradition of logic-based programming languages like Prolog.[1] It was introduced in a 2003 paper by Francis McCabe and Keith Clark.[2]	2003	null	\N	No code example (yet).
236	GOAL	Game Oriented Assembly Lisp (or GOAL) is a video game programming language developed by Andy Gavin and the Jak and Daxter team at Naughty Dog. It was written using Allegro Common Lisp and used in the development of the entire Jak and Daxter series of games.	null	null	\N	No code example (yet).
237	Gödel	Gödel is a declarative, general-purpose programming language that adheres to the logic programming paradigm. It is a strongly typed language, the type system being based on many-sorted logic with parametric polymorphism. It is named after logician Kurt Gödel.	1992	1.5 / August 11, 1995 (1995-08-11)	\N	No code example (yet).
238	Godiva	Godiva (GOal-DIrected JaVA) is an extension to the Java programming language supporting goal-directed evaluation of expressions.	2002 (2002)	null	\N	No code example (yet).
239	Golo	Golo is a simple, dynamic, weakly-typed language for the JVM created in 2012 as part of the research activities of the DynaMid group of the Centre of Innovation in Telecommunications and Integration of service aka CITI Laboratory at INSA Lyon.	null	null	\N	No code example (yet).
241	Google Apps Script	Google Apps Script is a scripting language for light-weight application development in the Google Apps platform. It is based on JavaScript 1.6 with some portions of 1.7 and 1.8 and provides subset of ECMAScript 5 API,[2] however instead of running on the client, it gets executed in the Google Cloud. According to Google, Google Apps Script "provides easy ways to automate tasks across Google products and third party services.".[3] Apps Script is also the tool that powers the add-ons for Google Docs, Sheets & Forms.[4]	null	null	https://script.google.com/	No code example (yet).
243	GOTRAN	The IBM 1620 was announced by IBM on October 21, 1959, and marketed as an inexpensive "scientific computer". After a total production of about two thousand machines, it was withdrawn on November 19, 1970. Modified versions of the 1620 were used as the CPU of the IBM 1710 and IBM 1720 Industrial Process Control Systems (making it the first digital computer considered reliable enough for real-time process control of factory equipment).	null	null	\N	No code example (yet).
244	GPSS	General Purpose Simulation System (GPSS) (originally Gordon's Programmable Simulation System after creator Geoffrey Gordon; the name was changed when it was decided to release it as a product) is a discrete time simulation general-purpose programming language, where a simulation clock advances in discrete steps. A system is modelled as transactions enter the system and are passed from one service (represented by blocs) to another. This is particularly well-suited for problems such as a factory. GPSS is less flexible than simulation languages such as Simula and SIMSCRIPT II.5 but it is easier to use and more popular.	null	null	\N	No code example (yet).
245	GraphTalk	Computer Sciences Corporation (CSC) is an American multinational corporation that provides information technology (IT) services and professional services.[2] Its headquarters are located in Falls Church, Virginia. CSC has 56,000 employees in over 60 countries.[3] Its clients include commercial enterprises and the U.S. federal government, as well as state, local and non-U.S. government agencies.[4]	null	null	http://www.csc.com/	No code example (yet).
246	GRASS	GRASS (GRAphics Symbiosis System) was a programming language created to script 2D vector graphics animations. GRASS was similar to BASIC in syntax, but added numerous instructions for specifying 2D object animation, including scaling, translation, rotation and color changes over time. It quickly became a hit with the artistic community who were experimenting with the new medium of computer graphics, and will remain most famous for its use by Larry Cuba to create the original "attacking the death star will not be easy" animation in Star Wars. A later version that was adapted to support raster graphics was known as ZGrass.	null	null	\N	No code example (yet).
247	Groovy	Apache Groovy is an object-oriented programming language for the Java platform. It is a dynamic language with features similar to those of Python, Ruby, Perl, and Smalltalk. It can be used as a scripting language for the Java Platform, is dynamically compiled to Java Virtual Machine (JVM) bytecode, and interoperates with other Java code and libraries. Groovy uses a Java-like curly-bracket syntax. Most Java code is also syntactically valid Groovy, although semantics may be different.	2003; 13 years ago (2003)	2.4.6 / February 18, 2016; 2 months ago (2016-02-18)	http://groovy-lang.org/	// Hello World in Groovy\n\nprintln "Hello World"
248	Hack	Hack is a programming language for the HipHop Virtual Machine (HHVM), created by Facebook as a dialect of PHP. The language implementation is open-source, licensed under the BSD License.[2][3][4]	2014	null	http://hacklang.org/	No code example (yet).
249	HAL/S	HAL/S (High-order Assembly Language/Shuttle)[1] is a real-time aerospace programming language, best known for its use in the Space Shuttle program.[2] It was designed by Intermetrics in the 1970s for NASA. HAL/S is written in XPL, a dialect of PL/I.	null	null	\N	No code example (yet).
251	Harbour	Harbour is a modern computer programming language, primarily used to create database/business programs. It is a modernized, open sourced and cross-platform version of the older and largely DOS-only Clipper system, which in turn developed from the dBase database market of the 1980s and 90s.	1999	3.0.0 / 17 July 2011; 4 years ago (2011-07-17)	\N	No code example (yet).
253	Haskell	Haskell /ˈhæskəl/[26] is a standardized, general-purpose purely functional programming language, with non-strict semantics and strong static typing.[27] It is named after logician Haskell Curry.[1] The latest standard of Haskell is Haskell 2010. As of May 2016[update], a group is working on the next version, Haskell 2020.[28]	1990; 26 years ago (1990)[1]	Haskell 2010[2] / July 2010; 5 years ago (2010-07)	http://haskell.org/	-- Hello World in Haskell\n \nmain = putStrLn "Hello World"
254	Haxe	Haxe is an open source high-level multi-platform programming language and compiler that can produce applications and source code for many different platforms from a single code-base.[1][2][3][4]	2005	3.2.1 / October 11, 2015; 6 months ago (2015-10-11)	http://haxe.org/	// Hello world in Haxe\n\nclass Hello {\n    static public function main() {\n        trace("Hello world!");\n    }\n}
256	HLSL	The High-Level Shader Language[1] or High-Level Shading Language[2] (HLSL) is a proprietary shading language developed by Microsoft for the Direct3D 9 API to augment the shader assembly language, and went on to become the required shading language for the unified shader model of Direct3D 10 and higher.	null	null	\N	No code example (yet).
257	Hop	Hop is a Lisp-like programming language by Manuel Serrano for web 2.0 and also the name of the web broker (server and proxy) that implements this language. It is written in Bigloo Scheme. It is a project funded by INRIA.	2006	2.4.2 / September 23, 2013; 2 years ago (2013-09-23)	\N	No code example (yet).
258	Hope	Hope is a small functional programming language developed in the 1970s at Edinburgh University.[1][2][3][4] It predates Miranda and Haskell and is contemporaneous with ML (also developed at Edinburgh). Hope was derived from NPL,[2] a simple functional language developed by Rod Burstall and John Darlington in their work on program transformation.[5] NPL was, in turn, derived from Kleene Recursion Equations. NPL and Hope are notable for being the first languages with call-by-pattern evaluation and algebraic data types.[citation needed] (Though SNOBOL is even older, and its 'patterns' may qualify as a hybrid between call-by-pattern and regular expression matching.)[citation needed] Hope is an important language in the development of functional programming.	null	null	\N	No code example (yet).
259	Hopscotch	Hopscotch is a visual programming language developed by Hopscotch Technologies, designed to allow young or beginner programmers to develop simple projects. Its simple UI allows its users to drag and drop blocks to create scripts of which can be played when activated. Although the language is easy to use, to develop more advanced pieces of code is almost impossible and requires more powerful languages. The use of the language is through a tablet or phone supporting Hopscotch.[1]	null	null	\N	No code example (yet).
261	Hume	Hume is a functionally based programming language developed at the University of St Andrews and Heriot-Watt University in Scotland since the year 2000. The language name is both an acronym meaning 'Higher-order Unified Meta-Environment' and an honorific to the 18th Century philosopher David Hume. It targets real-time embedded systems, aiming to produce a design that is both highly abstract, yet which will still allow precise extraction of time and space execution costs. This allows programmers to guarantee the bounded time and space demands of executing programs.	null	null	\N	No code example (yet).
262	HyperTalk	HyperTalk is a high-level, procedural programming language created in 1987 by Dan Winkler and used in conjunction with Apple Computer's HyperCard hypermedia program by Bill Atkinson. The main target audience of HyperTalk was beginning programmers, hence HyperTalk programmers were usually called authors, and the process of writing programs was called "scripting". HyperTalk scripts are fairly similar to written English, and use a logic structure similar to the Pascal programming language.	1987 (1987)	null	\N	No code example (yet).
263	IBM Basic assembly language	Basic Assembly Language (BAL) is the commonly used term for a low-level programming language used on IBM System/360 and successor mainframes. Originally "Basic Assembly Language" applied only to an extremely restricted dialect designed to run under control of IBM Basic Programming Support (BPS/360) on systems with only 8 KB of main memory, and only a card reader, a card punch, and a printer for input/output — thus the word "Basic". However, the full name and the initialism "BAL" almost immediately attached themselves in popular use to all assembly-language dialects on the System/360 and its descendants. BAL for BPS/360 was introduced with the System/360 in 1964.	null	null	\N	No code example (yet).
264	IBM HAScript	HAScript, or Host Access Script, is an IBM-developed macro language with an XML syntax designed for programmatic interaction with terminal-based applications. HAScript is based on a state machine principle. The first commercial implementation appeared in IBM's Host On-Demand in the late 1990s.	null	null	\N	No code example (yet).
268	Icon	Icon is a very high-level programming language featuring goal directed execution and many facilities for managing strings and textual patterns. It is related to SNOBOL and SL5, string processing languages. Icon is not object-oriented, but an object-oriented extension called Idol was developed in 1996 which eventually became Unicon.	1977	9.5.1 / June 6, 2013	\N	# Hello world in Icon (http://www.cs.arizona.edu/icon/)\n\nprocedure main()\n    write("Hello world")\nend
269	Id	Irvine Dataflow (Id) is a general-purpose parallel programming language, started at the University of California at Irvine in 1975[1] by Arvind and K. P. Gostelow.[2] Arvind continued work with Id at MIT into the 1990s.	null	null	\N	No code example (yet).
270	IDL	IDL, short for Interactive Data Language, is a programming language used for data analysis. It is popular in particular areas of science, such as astronomy, atmospheric physics and medical imaging. IDL shares a common syntax with PV-Wave and originated from the same codebase, though the languages have subsequently diverged in detail. There are also two free implementations, GNU Data Language (GDL) and Fawlty Language (FL).	1977	IDL 8.5.1 / December 15, 2015	\N	IDL> ; Hello World in IDL (Interactive Data Language)\nIDL> print, "Hello World"
271	Idris	Idris is a general-purpose purely functional programming language with dependent types. The type system is similar to the one used by Agda.	null	0.10[1] / January 20, 2016 (2016-01-20)	\N	Hello world in Idris\n\n> main : IO ()\n> main = putStrLn "Hello, World!"
272	IMP	IMP was a systems programming language developed by E. T. Irons in the late 1960s through early 1970s. Unlike most other systems programming languages, IMP was an extensible syntax programming language.	null	null	\N	No code example (yet).
274	Io	Io is a pure object-oriented programming language inspired by Smalltalk, Self, Lua, Lisp, Act1, and NewtonScript.[1] Io has a prototype-based object model similar to the ones in Self and NewtonScript, eliminating the distinction between instance and class. Like Smalltalk, everything is an object and it uses dynamic typing. Like Lisp, programs are just data trees. Io uses actors for concurrency.	2002; 14 years ago (2002)	null	\N	// Hello World in io programming language\n"Hello world!" print
276	IPL	Information Processing Language (IPL) is a programming language created by Allen Newell, Cliff Shaw, and Herbert A. Simon at RAND Corporation and the Carnegie Institute of Technology at about 1956. Newell had the job of language specifier-application programmer, Shaw was the system programmer, and Simon took the job of application programmer-user.	1956	IPL-VI	\N	No code example (yet).
277	IPTSCRAE	Iptscrae is a stack-oriented scripting language used to give additional functionality to The Palace software and servers. Its name comes from the pronunciation of "script" in Pig Latin. [1]	null	null	\N	No code example (yet).
278	ISLISP	ISLISP (also capitalized as ISLisp) is a programming language in the LISP family standardized by ISO working group ISO/IEC JTC 1/SC 22/WG 16[1] (commonly referred to simply as SC22/WG16 or WG16). The primary output of this working group was an International Standard, ISO/IEC 13816:1997(E), published by ISO. The standard was updated in 2007 and republished as ISO/IEC 13816:2007(E).[2] Although official publication was through ISO, versions of the ISLISP language specification are available that are believed to be in the public domain.[3]	null	null	\N	No code example (yet).
279	ISPF	In computing, Interactive System Productivity Facility (ISPF) is a software product for the z/OS operating system that runs on IBM mainframes. It includes a screen editor, the user interface of which was emulated by some microcomputer editors sold commercially starting in the late 1980s, including SPFPC.	null	null	\N	No code example (yet).
280	ISWIM	ISWIM is an abstract computer programming language (or a family of programming languages) devised by Peter J. Landin and first described in his article The Next 700 Programming Languages, published in the Communications of the ACM in 1966. The acronym stands for "If you See What I Mean"[1] (also said to have stood for "I See What You Mean", but ISWYM was mistyped as ISWIM[citation needed]).	1966	null	\N	No code example (yet).
281	J	The J programming language, developed in the early 1990s by Kenneth E. Iverson and Roger Hui,[4][5] is a synthesis of APL (also by Iverson) and the FP and FL function-level languages created by John Backus.[6]	1990; 26 years ago (1990)	J804 / 4 January 2016; 4 months ago (2016-01-04)[1]	http://www.jsoftware.com/	NB. Hello World in J\n'Hello World' 1!:2(2)
282	J#	Visual J# (pronounced "jay-sharp") programming language was a transitional language for programmers of Java and Visual J++ languages, so they could use their existing knowledge and applications on .NET Framework.	2002 (2002)	v2.0 Second Edition / 18 May 2007; 8 years ago (2007-05-18)	http://msdn2.microsoft.com/en-us/vjsharp/default.aspx	No code example (yet).
283	J++	Visual J++ (pronounced "Jay Plus Plus") is Microsoft's discontinued implementation of Java. Syntax, keywords, and grammatical conventions were the same as Java's. Microsoft discontinued support of J++ in January 2004,[1] replacing it to a certain extent with J# and C#.	null	null	\N	No code example (yet).
284	JADE	JADE is a proprietary object-oriented software development and deployment platform product from the New Zealand-based Jade Software Corporation, first released in 1996.[1] It consists of the JADE programming language, IDE and debugger, integrated application server and object database management system.	null	null	http://www.jadeworld.com/	No code example (yet).
285	Jako	The Jako programming language for the Parrot virtual machine was initially created by Gregor N. Purdy as a "user-friendly mini-language,"[1] and became the first Parrot-targeted language implementation to have subroutines.[2] It is similar to Java or C++, but makes several large deviations, in some ways making it closer to Perl. Jako can be compiled into Parrot's assembly language, PASM, and then run on the Parrot virtual machine.	null	null	\N	# Hello World in Jako\n\nuse sys;\n\nsys::print("Hello, world!\\n");
287	Janus (concurrent constraint programming language)	Janus is a computer programming language partially described by K. Kahn and Vijay A. Saraswat in "Actors as a special case of concurrent constraint (logic) programming", in SIGPLAN Notices, October 1990. Janus is a concurrent constraint language without backtracking.	1990	null	\N	No code example (yet).
289	JASS	JASS and JASS2 (sometimes said to stand for Just Another Scripting Syntax)[citation needed] is a scripting language provided with an event-driven API created by Blizzard Entertainment. It is used extensively by their games Warcraft III (JASS2) and StarCraft (JASS) for scripting events in the game world. Map creators can use it in the Warcraft III World Editor and the Starcraft Editor to create scripts for triggers and AI (artificial intelligence) in custom maps and campaigns.	null	null	\N	No code example (yet).
291	JavaFX Script	JavaFX Script is a scripting language designed by Sun Microsystems, forming part of the JavaFX family of technologies on the Java Platform.	null	1.2 / June 2, 2009 (2009-06-02)	\N	No code example (yet).
292	JavaScript	JavaScript (/ˈdʒɑːvəˌskrɪpt/[5]) is a high-level, dynamic, untyped, and interpreted programming language.[6] It has been standardized in the ECMAScript language specification.[7] Alongside HTML and CSS, it is one of the three core technologies of World Wide Web content production; the majority of websites employ it and it is supported by all modern Web browsers without plug-ins.[6] JavaScript is prototype-based with first-class functions, making it a multi-paradigm language, supporting object-oriented,[8] imperative, and functional programming styles.[6] It has an API for working with text, arrays, dates and regular expressions, but does not include any I/O, such as networking, storage, or graphics facilities, relying for these upon the host environment in which it is embedded.[7]	May 23, 1995; 20 years ago (1995-05-23)	ECMAScript 6[2] / June 17, 2015; 10 months ago (2015-06-17)	\N	<html>\n<body>\n<script language="JavaScript" type="text/javascript">\n// Hello World in JavaScript\ndocument.write('Hello World');\n</script>\n</body>\n</html>
293	JCL	Job Control Language (JCL) is a name for scripting languages used on IBM mainframe operating systems to instruct the system on how to run a batch job or start a subsystem.	null	null	\N	//HERIB    JOB  ,'HERIBERT OTTEN',PRTY=12\n//* HELLO WORLD FOR MVS            \n //HALLO    EXEC PGM=IEBGENER       \n //SYSIN    DD DUMMY                \n //SYSPRINT DD SYSOUT=*             \n //SYSUT2   DD SYSOUT=T             \n //SYSUT1   DD *                    \n HELLO WORLD!                       \n /*                                 \n //
294	JEAN	JEAN was a dialect of the JOSS programming language developed for and used on ICT 1900 series computers in the late 1960s and early 1970s; it was implemented under the MINIMOP operating system. It was used at the University of Southampton. [1]	null	null	\N	No code example (yet).
295	Join Java	Join Java is a programming language based on the join-pattern that extends the standard Java programming language with the join semantics of the join-calculus. It was written at the University of South Australia within the Reconfigurable Computing Lab by Dr. Von Itzstein.	2000 (2000)	null	\N	No code example (yet).
296	JOSS	JOSS (an acronym for JOHNNIAC Open Shop System) was one of the very first interactive, time-sharing programming languages. JOSS I, developed by J. Clifford Shaw at RAND was first implemented, in beta form, on the JOHNNIAC computer in May 1963. The full implementation was deployed in January 1964, supporting five terminals and the final version, supporting ten terminals, was deployed in January 1965.[1][2]	1966; 50 years ago (1966)	null	\N	No code example (yet).
297	Joule	Joule is a concurrent dataflow programming language, designed for building distributed applications. It is so concurrent that the order of statements within a block is irrelevant to the operation of the block. Statements are executed whenever possible, based on their inputs. Everything in Joule happens by sending messages. There is no control flow. Instead, the programmer describes the flow of data, making it a dataflow programming language.	1996	null	\N	No code example (yet).
298	JOVIAL	JOVIAL is a high-level computer programming language similar to ALGOL, but specialized for the development of embedded systems (specialized computer systems designed to perform one or a few dedicated functions, usually embedded as part of a complete device including mechanical parts).	1960	null	\N	No code example (yet).
299	Joy	The Joy programming language in computer science is a purely functional programming language that was produced by Manfred von Thun of La Trobe University in Melbourne, Australia. Joy is based on composition of functions rather than lambda calculus. It has turned out to have many similarities to Forth, due not to design but to a sort of parallel evolution and convergence. It was also inspired by the function-level programming style of Backus's FP.[1]	2001	March 17, 2003 / March 17, 2003	\N	No code example (yet).
300	JScript	JScript is Microsoft's dialect of the ECMAScript standard[2] that is used in Microsoft's Internet Explorer.	1996	9.0 / March 2011	http://msdn.microsoft.com/library/hbxc2t98.aspx	No code example (yet).
301	JScript .NET	JScript .NET is a .NET programming language developed by Microsoft.	null	null	\N	No code example (yet).
320	L# .NET	L# .NET is a dynamic computer programming language intended to be compiled and executed on the Ecma-334 and Ecma-335 Common Language Infrastructure (CLI). It is a dialect of Lisp, adapted from Paul Graham's proposed Arc language to exploit the libraries of the .NET Framework, Microsoft's implementation of the CLI specification.	null	null	\N	No code example (yet).
321	LabVIEW	LabVIEW (short for Laboratory Virtual Instrument Engineering Workbench) is a system-design platform and development environment for a visual programming language from National Instruments.	null	2015 / August 2015 (2015-08)	\N	// Hello world in Lasso\n\nHello world!
475	Picolisp	PicoLisp is an open source Lisp dialect. It runs on Linux and other POSIX-compliant systems.	1988	16.2 / February 18, 2016; 2 months ago (2016-02-18)	http://picolisp.com/	No code example (yet).
303	Jython	Jython is an implementation of the Python programming language designed to run on the Java platform. It is the successor of JPython.[3]	null	2.7.0 / May 2, 2015; 11 months ago (2015-05-02)[2]	http://www.jython.org/	No code example (yet).
304	K	K is a proprietary array processing language developed by Arthur Whitney and commercialized by Kx Systems. Since then, an open-source implementation known as Kona has also been developed.[1] The language serves as the foundation for kdb, an in-memory, column-based database, and other related financial products.[2] The language, originally developed in 1993, is a variant of APL and contains elements of Scheme. Advocates of the language emphasize its speed, facility in handling arrays, and expressive syntax.[3]	1993	null	\N	/ Hello world in K\n\n"Hello world!"
305	Kaleidoscope	The Kaleidoscope programming language is a constraint programming language embedding constraints into an imperative object-oriented language. It adds keywords always, once, and assert..during (formerly while..assert) to make statements about relational invariants. Objects have constraint constructors, which are not methods, to enforce the meanings of user-defined datatypes.	null	null	\N	No code example (yet).
306	Karel	Karel is an educational programming language for beginners, created by Richard E. Pattis in his book Karel The Robot: A Gentle Introduction to the Art of Programming. Pattis used the language in his courses at Stanford University, California. The language is named after Karel Čapek, a Czech writer who introduced the word robot.	1981	null	\N	No code example (yet).
307	Karel++	Karel is an educational programming language for beginners, created by Richard E. Pattis in his book Karel The Robot: A Gentle Introduction to the Art of Programming. Pattis used the language in his courses at Stanford University, California. The language is named after Karel Čapek, a Czech writer who introduced the word robot.	1981	null	\N	No code example (yet).
308	KEE	IntelliCorp (IC) is a software company that provides, develops, and markets SAP application lifecycle management, business process management and data management software for SAP customers and partners. IntelliCorp applications deliver automatic intelligent impact analysis of SAP systems and are SAP Integration Certified.[1]	null	null	\N	No code example (yet).
310	Kixtart	KiXtart is a closed source free-format scripting language for Windows. It is described as a logon script processor and enhanced batch scripting language by the official website.[2] Its name is a portmanteau of "kick start".	null	4.66 / July 24, 2015; 9 months ago (2015-07-24)[1]	\N	No code example (yet).
311	Klerer-May System	The Klerer-May System is a programming language developed in the mid-1960s, oriented to numerical scientific programming, whose most notable feature is its two-dimensional syntax based on traditional mathematical notation.	null	null	\N	No code example (yet).
312	Kojo	Kojo is a programming and learning environment - with many different features that enable play, exploration, creation, and learning in the areas of computer programming, mental skills, (interactive) math, graphics, art, music, science, animation, games, and electronics. Kojo draws ideas from Logo and Processing.[1][2]	2010	2.4.08 / 14 November 2015; 5 months ago (2015-11-14)	\N	No code example (yet).
313	Kotlin	Kotlin is a statically-typed programming language that runs on the Java Virtual Machine and also can be compiled to JavaScript source code. Its primary development is from a team of JetBrains programmers based in Saint Petersburg, Russia (the name comes from the Kotlin Island, near St. Petersburg).[2] Kotlin was named Language of the Month in the January 2012 issue of Dr. Dobb's Journal.[3] While not syntax compatible with Java, Kotlin is designed to interoperate with Java code and is reliant on Java code from the existing Java Class Library, such as the collections framework.	null	Kotlin 1.0.1 / March 16, 2016; 2 months ago (2016-03-16)	http://kotlinlang.org/	No code example (yet).
359	M4	m4 is a general-purpose macro processor designed by Brian Kernighan and Dennis Ritchie. m4 is an extension of an earlier macro processor m3, written by Ritchie for the AP-3 minicomputer.[1]	1977	null	\N	No code example (yet).
314	KRC	KRC (Kent Recursive Calculator) is a lazy functional language developed by David Turner from November 1979 to October 1981[1] based on SASL, with pattern matching, guards and ZF expressions[2] (now more usually called list comprehensions). Two implementations of KRC were written: David Turner's original one in BCPL running on EMAS, and Simon J. Croft's later one in C under Unix, and KRC was the main language used for teaching functional programming at the University of Kent at Canterbury (UK) from 1982 to 1985.	1981	null	\N	No code example (yet).
315	KRL	KRL is a knowledge representation language, developed by Daniel G. Bobrow and Terry Winograd while at Xerox PARC and Stanford University, respectively. It is a frame-based language.	1976	null	\N	No code example (yet).
316	KRYPTON	Krypton (styled KRYPTON) is a frame-based computer programming language.	null	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.73.7373	No code example (yet).
317	ksh	KornShell (ksh) is a Unix shell which was developed by David Korn at Bell Labs in the early 1980s and announced at USENIX on July 14, 1983.[1][2] The initial development was based on Bourne shell source code.[6] Other early contributors were Bell Labs developers Mike Veach and Pat Sullivan, who wrote the Emacs- and vi-style line editing modes' code, respectively.[7] KornShell is backward-compatible with the Bourne shell and includes many features of the C shell, inspired by the requests of Bell Labs users.	null	ksh93v / June 1, 2013; 2 years ago (2013-06-01)[3]	http://www.kornshell.org/	No code example (yet).
318	KUKA	KUKA is a German manufacturer of industrial robots and solutions for factory automation. The KUKA Robotics Corporation has 25 subsidiaries worldwide, mostly sales and service subsidiaries, including in the United States, Canada, Mexico, Brazil, China, Japan, Korea, Taiwan, India, Russia[2] and most European countries. The company name, KUKA, is an acronym for Keller und Knappich Augsburg.	null	null	http://www.kuka.com/	No code example (yet).
319	L	Multiple programming languages are named L, including:	null	null	\N	// Hello World in L\n\nnamespace Hello is\n    class Main is\n        void init is()\n            IO.Std.out.println("Hello World!");\n        end\n    end\nend
323	Lagoona	Lagoona is an experimental programming language developed by Michael Franz, a former student of Niklaus Wirth. It explores component-oriented programming with the use of stand-alone messages and message sets, message forwarding, and by de-emphasizing classes.	null	null	\N	No code example (yet).
324	LANSA	LANSA is an integrated development environment for building software applications that can run on IBM i, Windows and Linux. The features of the LANSA development environment are:	null	null	http://www.lansa.com/	No code example (yet).
326	LaTeX	LaTeX (/ˈlɑːtɛx/ LAH-tekh, commonly pronounced as /ˈlɑːtɛk/ LAH-tek or /ˈleɪtɛk/ LAY-tek,[1] a shortening of Lamport TeX[citation needed]) is a document preparation system. When writing, the writer uses plain text as opposed to formatted text as users of word processors like Microsoft Word. The writer uses markup tagging conventions to define the general structure of a document (such as article, book, and letter), to stylise text throughout a document (such as bold and italic), and to add citations and cross-references. A TeX distribution such as TeX Live or MikTeX is used to produce an output file (such as PDF or DVI) suitable for printing or digital distribution. Within the typesetting system, its name is stylised as LaTeX.	null	null	https://latex-project.org/	% Hello World! in LaTeX\n\\documentclass{article}\n\\begin{document}\nHello World!\n\\end{document}
327	Lava	Lava is an experimental, visual object-oriented, interpreter-based programming language with an associated programming environment (Lava Programming Environment or LavaPE) that uses structure editors instead of text editors. Only comments, constants, and new identifiers may be entered as text.	null	null	\N	No code example (yet).
328	LC-3	Little Computer 3, or LC-3, is a type of computer educational programming language, an assembly language, which is a type of low-level programming language.	null	null	\N	No code example (yet).
329	Leda	Leda is a multiparadigm programming language whose goal is to successfully mix imperative, object-oriented, functional, and logic-based programming features into one language.	null	null	\N	No code example (yet).
330	Legoscript	The Lego Mindstorms series of kits contain software and hardware to create customizable, programmable robots. They include an intelligent brick computer that controls the system, a set of modular sensors and motors, and Lego parts from the Technic line to create the mechanical systems.	null	null	\N	No code example (yet).
331	LIL	LIL, the Little Implementation Language, was a system programming language during the early days of Unix history on PDP-11 machines. It was written by P. J. Plauger of Bell Labs.	null	null	\N	No code example (yet).
332	LilyPond	LilyPond is a computer program and file format for music engraving. One of LilyPond's major goals is to produce scores that are engraved with traditional layout rules, reflecting the era when scores were engraved by hand.	null	2.18.2 (March 17, 2014; 2 years ago (2014-03-17)[2]) [±]	http://lilypond.org/	% Hello World in LilyPond\n\n\\markup { Hello World! }
333	Limbo	Limbo is a programming language for writing distributed systems and is the language used to write applications for the Inferno operating system. It was designed at Bell Labs by Sean Dorward, Phil Winterbottom, and Rob Pike.	1995; 21 years ago (1995)	null	http://www.vitanuova.com/inferno/limbo.html	Hello World in Limbo.\nLimbo is the programming language of the Inferno OS\n(from Lucent Bell Labs).\n\n\nimplement Cmd;\n\ninclude "sys.m";\ninclude "draw.m";\n\nCmd : module {\n    init : fn (ctxt : ref Draw->Context, args : list of string);\n};\n\ninit(nil : ref Draw->Context, nil : list of string)\n{\n    sys := load Sys Sys->PATH;\n    sys->print("Hello World\\n");\n}
334	Limnor	Limnor is a generic-purpose codeless and visual programming system. The aim is to enable users to create computer software without directly coding in a texture programming language. It can be extended by software developers.	null	null	\N	No code example (yet).
335	LINC	LINC ("Logic and Information Network Compiler") is a fourth-generation programming language, used mostly on Unisys computer systems.	null	null	\N	No code example (yet).
337	LIS	LIS (Language d'Implementation de Systèmes) was a system implementation programming language designed by Jean Ichbiah, who later designed Ada.	null	null	\N	No code example (yet).
338	LISA	LISA (Language for Instruction Set Architectures) is a language to describe the instruction set architecture of a processor. LISA captures the information required to generate software tools (compiler, assembler, instruction set simulator, ...) and implementation hardware (in VHDL or Verilog) of a given processor.	1997, last revised 2007	null	\N	No code example (yet).
418	Nial	Nial (from "Nested Interactive Array Language") is a high-level array programming language developed from about 1981 by Mike Jenkins of Queen's University, Kingston, Ontario, Canada.	1981	6.3 / August 2006	\N	No code example (yet).
339	Lisaac	Lisaac is a statically typed prototype-based language conceived by Benoît Sonntag, in which the Isaac operating system is being written.	2003; 13 years ago (2003)	0.13.1 (Specification) / February 17, 2008; 8 years ago (2008-02-17)	\N	// Hello World in Lisaac\nSection Header\n\n  + name        := HELLO_WORLD;\n\nSection Inherit\n\n  - parent_object:OBJECT := OBJECT;\n\nSection Public\n\n  - main <-\n  (\n    "Hello world !\\n".print;\n  );
341	Lite-C	Lite-C is a programming language for multimedia applications and personal computer games, using a syntax subset of the C language with some elements of the C++ language. Its main difference to C is the native implementation of multimedia and computer game related objects like sounds, images, movies, GUI elements, 2D and 3D models, collision detection and rigid body physics. Lite-C executables are compiled instead of interpreted. Lite-C runs on 32-bit and 64-bit Windows XP or Vista operating systems.	2007	8.45 / February 9, 2014; 2 years ago (2014-02-09)	http://www.3dgamestudio.com/	No code example (yet).
342	Lithe	Lithe is an experimental programming language created in 1982 by David Sandberg at the University of Washington which allows the programmer to freely choose his own syntax. Lithe combines the ideas of syntax-directed translation and classes in a novel manner that results in a remarkably simple yet powerful language.	null	null	\N	No code example (yet).
416	NewtonScript	NewtonScript is a prototype-based programming language created to write programs for the Newton platform. It is heavily influenced by the Self programming language, but modified to be more suited to needs of mobile and embedded devices.	1993; 23 years ago (1993)	null	\N	// Hello World in NewtonScript\n\nbaseview :=\n   {viewBounds: {left: -3, top: 71, right: 138, bottom: 137},\n    viewFlags: 581,\n    declareSelf: 'base,\n    _proto: protoFloatNGo,\n    debug: "baseview"\n   };\n\ntextview := * child of baseview *\n   {text: "Hello World!",\n    viewBounds: {left: 33, top: 24, right: 113, bottom: 46},\n    viewFlags: 579,\n    _proto: protoStaticText,\n    debug: "textview"\n   };
344	LiveCode	The LiveCode programming language (formerly the "Revolution" programming language)[1] is both an open-source and proprietary cross-platform[2] rapid application development language inspired by HyperCard's programming language HyperTalk.[3][4] It belongs to the family of xTalk scripting languages.	1993 (1993)	null	\N	No code example (yet).
345	LiveScript	LiveScript is a functional language that compiles to JavaScript. It was created by Jeremy Ashkenas—the creator of CoffeeScript—along with Satoshi Muramaki, George Zahariev, and many others.[2] Notably, LiveScript was briefly the name of JavaScript in 1990s.[3]	2011; 5 years ago (2011)	LiveScript 1.4.0 / 11 May 2015; 11 months ago (2015-05-11)[1]	http://livescript.net/	No code example (yet).
347	Logtalk	Logtalk is an object-oriented logic programming language that extends and leverages the Prolog language with a feature set suitable for programming in the large.[1] It provides support for encapsulation and data hiding, separation of concerns and enhanced code reuse.[1] Logtalk uses standard Prolog syntax with the addition of a few operators and directives.	1998; 18 years ago (1998)	3.01.0 / September 12, 2015; 7 months ago (2015-09-12)	http://logtalk.org/	No code example (yet).
348	LotusScript	LotusScript is an object oriented programming language used by Lotus Notes and other IBM Lotus Software products.	null	null	\N	No code example (yet).
349	LPC	LPC (short for Lars Pensjö C) is an object-oriented programming language derived from C[1] and developed originally by Lars Pensjö to facilitate MUD building on LPMuds.[2][3] Though designed for game development, its flexibility has led to it being used for a variety of purposes, and to its evolution into the language Pike.[3]	null	null	http://lpmuds.net/	// Hello World in LPC\n\nvoid create()\n{\n       message("info","Hello World!",this_user());\n}
350	LSE	LSE (Langage symbolique d'enseignement) is a programming language developed at Supélec in the late 1970s/early 1980s. It is similar to the BASIC, except with French-language instead of English-language keywords. It was derived from an earlier language called LSD, also developed at Supélec. It is most commonly said to be an acronym for Langage Symbolique d'Enseignement (Symbolic Teaching Language), but other expansions are also known (e.g. Langage de Sup-Élec, or the more cynical Langage Sans Espoir (hopeless language))	null	null	\N	No code example (yet).
351	LSL	Linden Scripting Language, or LSL, is the programming language used by residents of Second Life (SL), a virtual world by Linden Lab[1] and similar virtual worlds.	null	null	https://wiki.secondlife.com/wiki/LSL_Portal	// Hello World in Linden Scripting Language (LSL)\n\ndefault\n{\n    state_entry()\n    {\n        llSay(0, "Hello World");\n    }\n}
352	Lua	Lua (/ˈluːə/ LOO-ə, from Portuguese: lua [ˈlu.(w)ɐ] meaning moon; explicitly not "LUA"[1] because it is not an acronym) is a lightweight multi-paradigm programming language designed primarily for embedded systems and clients.[2] Lua is cross-platform since it is written in ANSI C,[1] and has a relatively simple C API.[3]	1993; 23 years ago (1993)	5.3.2 / 30 November 2015 (2015-11-30)	http://www.lua.org/	# Hello World in Lua\n\nprint "Hello world"
353	Lucid	Lucid is a dataflow programming language. It is designed to experiment with non-von Neumann programming models. It was designed by Bill Wadge and Ed Ashcroft and described in the book Lucid, the Dataflow Programming Language.	1976	null	\N	No code example (yet).
354	Lustre	Lustre is a formally defined, declarative, and synchronous dataflow programming language for programming reactive systems. It began as a research project in the early 1980s. A formal presentation of the language can be found in the 1991 Proceedings of the IEEE.[1] In 1993 it progressed to practical, industrial use in a commercial product as the core language of the industrial environment SCADE, developed by Esterel Technologies. It is now used for critical control software in aircraft,[2] helicopters, and nuclear power plants.	null	null	\N	No code example (yet).
355	LYaPAS	LYaPAS (Russian: ЛЯПАС, short for "Logical Language for the Representation of Synthesis Algorithms") is a programming language created in the Soviet Union in 1964 by Arkady D.Zakrevskij of the Laboratory of System Programming and Logical Synthesis of the BSSR Academy of Sciences.	null	null	\N	No code example (yet).
356	Lynx	Lynx is a programming language for large distributed networks, using remote procedure calls. It was developed by the University of Wisconsin–Madison in 1984 for the Charlotte multicomputer operating system.	null	null	\N	No code example (yet).
357	M#	\N	2012	null	http://www.msharp.co.uk/Home.html	No code example (yet).
358	M2001	M2001 is a modular educational mathematical programming language for developing and presenting mathematical algorithms, from the modern discrete to the classical continuous mathematics. M2001 is built on a semantic framework that is based in category theory and has a syntax similar to that of Pascal or Modula-2.	null	null	\N	No code example (yet).
360	Machine code	Machine code or machine language is a set of instructions executed directly by a computer's central processing unit (CPU). Each instruction performs a very specific task, such as a load, a jump, or an ALU operation on a unit of data in a CPU register or memory. Every program directly executed by a CPU is made up of a series of such instructions.	null	null	\N	No code example (yet).
361	Magik	Magik is an object-oriented programming language that supports multiple inheritance, polymorphism and is dynamically typed. It was designed implemented in 1989 by Arthur Chance, of Smallworld Systems Ltd, as part of Smallworld Geographical Information System (GIS). Following Smallworld's acquisition in 2000, Magik is now is provided by GE Energy, still as part of its Smallworld technology platform.	null	null	\N	No code example (yet).
362	Magma	Magma is a computer algebra system designed to solve problems in algebra, number theory, geometry and combinatorics. It is named after the algebraic structure magma. It runs on Unix-like operating systems, as well as Windows.	null	2.21-6 / September 10, 2015	http://magma.maths.usyd.edu.au/	No code example (yet).
417	NGL	NGL (short for aNGeL) is a function-level array programming language featuring an iconical mathematical notation and tuple pattern matching.	null	null	\N	No code example (yet).
364	Maple	Maple is a commercial computer algebra system developed and sold commercially by Maplesoft, a software company based in Waterloo, Ontario, Canada. The current major version is version 2016, which was released in March 2016.	null	2016 / March 2, 2016 (2016-03-02)	http://www.maplesoft.com/products/maple/	# Hello World in Maple\n\n>> printf("Hello World!");
366	MARK-IV	MARK IV is a Fourth-generation programming language that was created by Informatics, Inc. (later, Sterling Software) in the 1960s. Informatics, Inc. took advantage of IBM's decision to unbundle their software; MARK IV was the first "software product to have cumulative sales of $10 million".	null	null	\N	No code example (yet).
367	Mary	Mary was a programming language designed and implemented by RUNIT at Trondheim, Norway in the 1970s. It borrowed many features from ALGOL 68 but was designed for machine-oriented programming.	1970s	null	\N	No code example (yet).
368	MASM Microsoft Assembly x86	The Microsoft Macro Assembler (MASM) is an x86 assembler that uses the Intel syntax for MS-DOS and Microsoft Windows. Beginning with MASM 8.0 there are two versions of the assembler - one for 16-bit and 32-bit assembly sources, and another (ML64) for 64-bit sources only.	null	14.00.23026.0 / June 25, 2015; 9 months ago (2015-06-25)	\N	No code example (yet).
369	MATH-MATIC	MATH-MATIC is the marketing name for the AT-3 (Algebraic Translator 3) compiler, an early programming language for the UNIVAC I and UNIVAC II.	1957 (1957)	null	\N	No code example (yet).
370	Mathematica	Mathematica is a symbolic mathematical computation program, sometimes called a computer algebra program, used in many scientific, engineering, mathematical, and computing fields. It was conceived by Stephen Wolfram and is developed by Wolfram Research of Champaign, Illinois.[7][8] The Wolfram Language is the programming language used in Mathematica.[9]	null	10.4.1 (April 18, 2016 (2016-04-18)) [±][2]	http://www.wolfram.com/mathematica/	(* Hello World in Mathematica *)\n\nHello[] := Print["Hello, World!"]
371	MATLAB	MATLAB (matrix laboratory) is a multi-paradigm numerical computing environment and fourth-generation programming language. A proprietary programming language developed by MathWorks, MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages, including C, C++, Java, Fortran and Python.	late 1970s	R2016a / 3 March 2016; 2 months ago (2016-03-03)	http://mathworks.com/products/matlab	% Hello World in MATLAB.\n\ndisp('Hello World');
372	Max	Max is a visual programming language for music and multimedia developed and maintained by San Francisco-based software company Cycling '74. During its history, it has been used by composers, performers, software designers, researchers, and artists to create recordings, performances, and installations.	null	7.1.0 / December 14, 2015; 4 months ago (2015-12-14)	https://cycling74.com/products/max/	No code example (yet).
373	Maxima	Maxima is a computer algebra system based on a 1982 version of Macsyma. It is written in Common Lisp and runs on all POSIX platforms such as OS X, Unix, BSD, and Linux as well as under Microsoft Windows and Android. It is free software released under the terms of the GNU General Public License.	null	5.38.1 / 12 May 2016; 4 days ago (2016-05-12)	http://maxima.sourceforge.net/	/*  Hello World in Maxima */\n\ndisp("hello, world");
375	Maya (MEL)	The Maya Embedded Language (MEL) is a scripting language used to simplify tasks in Autodesk's 3D Graphics Software Maya. Most tasks that can be achieved through Maya's GUI can be achieved with MEL, as well as certain tasks that are not available from the GUI. MEL offers a method of speeding up complicated or repetitive tasks, as well as allowing users to redistribute a specific set of commands to others that may find it useful.	null	null	http://www.autodesk.com/products/autodesk-maya/overview	No code example (yet).
376	MDL	MDL (the MIT Design Language) is a descendant of the Lisp programming language. Its initial purpose was to provide high level language support for the Dynamic Modeling Group at MIT's Project MAC. It was initially developed in 1971 on the PDP-10 computer under the Incompatible Timesharing System. The initial development team consisted of Gerald Sussman and Carl Hewitt of the Artificial Intelligence Lab, and Chris Reeve, Bruce Daniels, and David Cressey of the Dynamic Modeling Group. Later, Stu Galley, also of the Dynamic Modeling Group, wrote the MDL documentation.[citation needed]	null	null	\N	No code example (yet).
377	Mercury	Mercury is a functional logic programming language geared towards real-world applications. It was initially developed at the University of Melbourne Computer Science department under the supervision of Zoltan Somogyi. The first version was developed by Fergus Henderson, Thomas Conway and Zoltan Somogyi and was released on April 8, 1995.	1995	14.01.1 / September 8, 2014 (2014-09-08)	http://www.mercurylang.org/	No code example (yet).
378	Mesa	Mesa[1] is an innovative programming language (superseded by the Cedar language) developed in the late 1970s at the Xerox Palo Alto Research Center in Palo Alto, California, United States. The language name was a pun based upon the programming language catchphrases of the time, because Mesa is a "high level" programming language.	1976; 40 years ago (1976)[2]	Mesa 6.0(Version 41) / July 1981; 34 years ago (1981-07)	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.105.3163	No code example (yet).
379	Metacard	MetaCard was a cross-platform, commercial GUI toolkit. MetaCard included an IDE and had its own language, MetaTalk. From the MetaCard Corporation website: "The MetaTalk language has all the features common to third-generation languages like C/C++/Java but has a much simpler syntax."	null	null	\N	No code example (yet).
382	MicroScript	TRON (acronym for The Real-time Operating system Nucleus) is an open real-time operating system kernel design. The project was started by Prof. Dr. Ken Sakamura of the University of Tokyo in 1984. The project's goal is to create an ideal computer architecture and network, to provide for all of society's needs.[1]	null	null	\N	No code example (yet).
383	MIIS	MIIS (Meditech Interpretive Information System) is a MUMPS-like programming language that was created by A.Neil Pappalardo and Curt W. Marble, on a DEC PDP at Mass General Hospital from 1964 to 1968. MUMPS evolution took two major directions: MUMPS proper and MIIS. MUMPS became an ANSI and ISO-standard language. When many MUMPS implementations standardized to be compatible, MIIS did not standardize, but became a proprietary system instead.	null	null	\N	No code example (yet).
384	MillScript	MillScript is a computer programming language for the batch production of templated Web sites. The language is a Java-based, early implementation of Spice, an experimental language developed by the OpenSpice group.	null	null	\N	No code example (yet).
385	MIMIC	MIMIC, known in capitalized form only, is a former simulation computer language developed 1964 by H. E. Petersen, F. J. Sansom and L. M. Warshawsky of Systems Engineering Group within the Air Force Materiel Command at the Wright-Patterson AFB in Dayton, Ohio, USA.[1] It is an expression-oriented continuous block simulation language, but capable of incorporating blocks of FORTRAN-like algebra.	null	null	\N	No code example (yet).
386	Mirah	Mirah (formerly known as Duby) is a programming language based on Ruby syntax, local type inference, hybrid static/dynamic type system, and a pluggable compiler toolchain. Mirah was created by Charles Oliver Nutter to be "a 'Ruby-like' language, probably a subset of Ruby syntax, that [could] compile to solid, fast, idiomatic JVM bytecode."[1] The word mirah refers to the gemstone ruby in the Javanese language, a play on the concept of Ruby in Java.[2]	2008	null	http://www.mirah.org/	No code example (yet).
387	Miranda	Miranda is a lazy, purely functional programming language designed by David Turner as a successor to his earlier programming languages SASL and KRC, using some concepts from ML and Hope. It was produced by Research Software Ltd. of England (which holds a trademark on the name Miranda) and was the first purely functional language to be commercially supported.	1985 (1985)	null	http://miranda.org.uk/	No code example (yet).
388	MIVA Script	Miva Script is a proprietary computer scripting language mainly used for internet applications such as e-commerce. As of 2015, it is developed, maintained and owned by Miva Merchant, Inc., based in San Diego, California. Many web hosting companies support Miva Script on their servers, but it is significantly less widespread than other popular web languages.	1996 (1996)	5.23	http://www.mivascript.com/	No code example (yet).
389	ML	ML is a general-purpose functional programming language developed by Robin Milner and others in the early 1970s at the University of Edinburgh,[1] whose syntax is inspired by ISWIM. Historically, ML stands for metalanguage: it was conceived to develop proof tactics in the LCF theorem prover (whose language, pplambda, a combination of the first-order predicate calculus and the simply-typed polymorphic lambda calculus, had ML as its metalanguage). It is known for its use of the Hindley–Milner type system, whose type inference algorithm can automatically assign the types of most expressions without requiring explicit type annotations. Additionally, the use of this algorithm ensures type safety—there is a formal proof that a well-typed ML program does not cause runtime type errors.[2]	1973; 43 years ago (1973)	null	\N	No code example (yet).
390	Moby	The Moby programming language is an experiment in computer programming, design and implementation.The Moby project started out as a testbed for the design of ML2000.	null	null	\N	No code example (yet).
391	Model 204	Model 204 is a database management system for IBM and compatible mainframe computers, “born” 1965 October 13,[1]:66[2] and first deployed in 1972. It incorporates a programming language and an environment for application development. Implemented in assembly language[2] for IBM System/360 and its successors, M204 can deal with very large databases[citation needed] and transaction loads of 1000 TPS.[1]:4	null	null	\N	No code example (yet).
392	Modelica	Modelica is an object-oriented, declarative, multi-domain modeling language for component-oriented modeling of complex systems, e.g., systems containing mechanical, electrical, electronic, hydraulic, thermal, control, electric power or process-oriented subcomponents. The free Modelica language[1] is developed by the non-profit Modelica Association.[2] The Modelica Association also develops the free Modelica Standard Library[3] that contains about 1360 generic model components and 1280 functions in various domains, as of version 3.2.1.	1997	3.3 / May 9, 2012[1]	\N	No code example (yet).
393	Modula	The Modula programming language is a descendent of the Pascal programming language. It was developed in Switzerland in the 1970s by Niklaus Wirth, the same person who designed Pascal. The main innovation of Modula over Pascal is a module system, used for grouping sets of related declarations into program units; hence the name Modula. The language is defined in a report by Wirth called Modula. A language for modular multiprogramming published 1976.[1]	1975 (1975)	null	\N	No code example (yet).
394	Modula-2	Modula-2 is a computer programming language designed and developed between 1977 and 1985 by Niklaus Wirth at the Swiss Federal Institute of Technology in Zurich (ETH Zurich) as a revision of Pascal to serve as the sole programming language for the operating system and application software for the personal workstation Lilith.[1] The principal concepts were:	1978	null	\N	(* Hello World in Modula-2 *)\n\nMODULE HelloWorld;\nFROM InOut IMPORT WriteString,WriteLn;\nBEGIN\n  WriteString("Hello World!");\n  WriteLn;\nEND HelloWorld.
415	Newspeak	Newspeak is a programming language and platform in the tradition of Smalltalk and Self being developed by a team led by Gilad Bracha. The platform includes an IDE, a GUI library, and standard libraries.[1] Starting in 2006, Cadence Design Systems funded its development and employed the main contributors, but ceased funding in January 2009.[2]	2006	Prototype / February 2013	http://newspeaklanguage.org/	No code example (yet).
396	Mohol	Mohol refers to Machine Oriented High Order Languages in Dijkstra's terminology.	null	null	\N	No code example (yet).
397	MOO	A MOO (MUD, object-oriented[1][2]) is a text-based online virtual reality system to which multiple users (players) are connected at the same time.	null	null	\N	"Hello World in MOO";\n\nplayer.location:announce_all("Hello, world!");
398	Mortran	Mortran (More Fortran) is an extension of the Fortran programming language used for scientific computation. It introduces syntax changes, including the use of semicolons to end statements, in order to improve readability and flexibility. Mortran code is macro-processed into Fortran code for compilation.	null	null	\N	No code example (yet).
399	Mouse	The Mouse programming language is a small computer programming language developed by Dr. Peter Grogono in the late 1970s and early 1980s.[1][2][3] It was developed as an extension of an earlier language called MUSYS, which was used to control digital and analog devices in an electronic music studio.	null	null	\N	~ Hello World in Mouse\n\n"HELLO, WORLD."\n$
400	MPD	Multithreaded, Parallel, and Distributed programming (MPD) is a concurrent programming language whose syntax is derived from the one used in the book Foundations of Multithreaded, Parallel, and Distributed Programming The name thus lists the distinguishing features of the language, namely that it supports all three of these concurrent programming techniques.	null	null	\N	# Hello World in MPD.\n\nresource helloworld()\n  write("Hello World")\nend
401	MSL	The mIRC scripting language, often unofficially abbreviated to 'mSL'[citation needed], is the scripting language embedded in mIRC, an IRC client for Windows.	1995 (1995)	null	\N	No code example (yet).
403	Mystic Programming Language	Mystic BBS is a bulletin board system software program that began in 1994. Mystic was the first DOS-based BBS software program to support a native telnet server. It has since been ported to Microsoft Windows, OS/2, OS X, and Linux.	null	1.11 / Nov 06 2015	\N	No code example (yet).
404	Napier88	Napier88 is an orthogonally persistent programming language that was designed and implemented at the University of St Andrews, Scotland. The primary designer was Ron Morrison, whose initial designs were extended and implemented by Fred Brown, Richard Connor, and Al Dearle. Napier88 was ahead of its time in many ways, and was the first robustly implemented language to combine a polymorphic type system with orthogonal persistence. The language was robustly implemented and released to users from both industry and academia; up to 1,000 registered users were recorded in due course. The language, however, was only intended to provide a proof of concept for an experiment in persistent programming; some time after 1989 (the year the first implementation was in fact released) the group's interests moved on and the language was no longer maintained.	null	null	\N	No code example (yet).
405	NASM	The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit (IA-32) and 64-bit (x86-64) programs. NASM is considered to be one of the most popular assemblers for Linux.[1]	null	2.11.08 / February 21, 2015; 14 months ago (2015-02-21)	http://www.nasm.us/	No code example (yet).
406	Neko	Neko is a high-level dynamically typed programming language developed by Nicolas Cannasse as part of R&D efforts at Motion-Twin.	2005	2.1 / May 8, 2016; 5 days ago (2016-05-08)	http://nekovm.org/	No code example (yet).
407	Nemerle	Nemerle is a general-purpose high-level statically typed programming language designed for platforms using the Common Language Infrastructure (.NET/Mono). It offers functional, object-oriented (OO) and imperative features. It has a simple C#-like syntax and a powerful metaprogramming system. In June 2012, the core developers of Nemerle were hired by the Czech software development company JetBrains. The team is focusing on developing Nitra, a framework to implement extant and new programming languages. This framework will likely be used to create future versions of Nemerle.[2][3][4]	2003; 13 years ago (2003)	1.0.0[1] / 13 May 2011; 5 years ago (2011-05-13)	http://nemerle.org/	// Hello World in Nemerle (a functional programming language for .NET)\n\nSystem.Console.WriteLine("Hello World");
408	nesC	nesC (network embedded systems C), pronounced "NES-see", is a component-based, event-driven programming language used to build applications for the TinyOS platform. TinyOS is an operating environment designed to run on embedded devices used in distributed wireless sensor networks. nesC is built as an extension to the C programming language with components "wired" together to run applications on TinyOS.	null	null	\N	No code example (yet).
409	NESL	NESL is a parallel programming language developed at Carnegie Mellon by the SCandAL project and released in 1993. It integrates various ideas from parallel algorithms, and functional programming and array programming languages.	1993	3.1 / November 1995	\N	No code example (yet).
410	Net.Data	Net.Data is a programming language by IBM used largely for database-backed web applications.[1]	null	null	\N	No code example (yet).
411	NetLogo	NetLogo is an agent-based programming language and integrated modeling environment.	1999; 17 years ago (1999)	5.3.1 / February 29, 2016; 2 months ago (2016-02-29)	http://ccl.northwestern.edu/netlogo/	No code example (yet).
413	NewLISP	newLISP is an open source scripting language in the Lisp family of programming languages developed by Lutz Mueller[1] and released under the GNU General Public License.	1991	10.6.2 / January 20, 2015; 15 months ago (2015-01-20)	http://www.newlisp.org/	No code example (yet).
414	NEWP	NEWP (or the New Executive Programming Language) is a high-level programming language used on the Unisys MCP systems. The language is used to write the operating system and other system utilities, although it can also be used to write user software as well. Several constructs separate it from extended ALGOL on which it is based. Language operators such as MEMORY which allows direct memory access are strictly used by programs running as the MCP.[1]	null	null	\N	No code example (yet).
422	Not eXactly C	Not eXactly C, or NXC, is a high-level programming language for the Lego Mindstorms NXT. NXC, which is short for Not eXactly C, is based on Next Byte Codes, an assembly language. NXC has a syntax like C. The IDE for NXC is the Bricx Command Center.	null	null	\N	No code example (yet).
423	Not Quite C	Not Quite C (NQC) is a programming language, application programming interface (API), and native bytecode compiler toolkit for the Lego Mindstorms, Cybermaster and LEGO Spybotics systems. It is based primarily on the C language but has specific limitations, such as the maximum number of subroutines and variables allowed, which differ depending on the version of firmware the RCX has. The language was invented by David Baum. He has released two books on the subject.	null	null	\N	No code example (yet).
424	NPL	Nord Programming Language, commonly abbreviated NPL, was a programming language by the Norwegian minicomputer manufacturer Norsk Data. It shipped as a standard component of the operating system SINTRAN III.	null	null	\N	No code example (yet).
425	NSIS	Nullsoft Scriptable Install System (NSIS) is a script-driven Installer authoring tool for Microsoft Windows with minimal overhead backed by Nullsoft, the creators of Winamp. NSIS is released under a combination of free software licenses, primarily the zlib license.[2] It has become a widely used alternative to commercial proprietary products like InstallShield, with users including Amazon.com, Dropbox, Ubisoft, FL Studio, BitTorrent, and McAfee.[3]	null	2.51 / 1 April 2016; 33 days ago (2016-04-01)	http://nsis.sourceforge.net/	; Hello World in Nullsoft Software Install Script (NSIS)\n\nCaption "Hello World!"\nOutFile ".\\HelloWorld.exe"\nSilentInstall silent\n\nSection ""\n        MessageBox MB_OK "Hello World!"\nSectionEnd
426	Nu	Nu is an interpreted object-oriented programming language, with a Lisp-like syntax, created by Tim Burks as an alternative scripting language to program OS X through its Cocoa application programming interface (API). Implementations also exist for iPhone and Linux.	2007	2.1.0 / April 15, 2013; 3 years ago (2013-04-15)	http://programming.nu/	No code example (yet).
427	NWScript	NWScript is the scripting language developed by BioWare for the role-playing video game Neverwinter Nights. It is based on the C programming language and is implemented in the Aurora toolset. Neverscript, an open source 3rd party editor, has been created for the Mac OS X and Linux versions of NWN because the Aurora toolset has not been ported to those platforms.	6/18/2002	1.69.8109 (Neverwinter Nights) / July 9, 2008	\N	No code example (yet).
429	o:XML	o:XML is an open source, dynamically typed, general-purpose object-oriented programming language based on XML-syntax. It has threads, exception handling, regular expressions and namespaces. Additionally o:XML has an expression language very similar to XPath that allows functions to be invoked on nodes and node sets.	null	null	\N	No code example (yet).
430	Oak	Oak was a programming language created by James Gosling in 1991, initially for Sun Microsystems' set-top box project. The language later evolved to become Java.	null	null	\N	No code example (yet).
431	Oberon	Oberon is a general-purpose programming language created in 1986 by Professor Niklaus Wirth and the latest member of the Wirthian family of ALGOL-like languages (Euler, Algol-W, Pascal, Modula, and Modula-2). Oberon was the result of a concentrated effort to increase the power of Modula-2, the direct successor of Pascal, and simultaneously to reduce its complexity. Its principal new feature is the concept of type extension of record types:[1] It permits the construction of new data types on the basis of existing ones and to relate them, deviating from the dogma of strictly static data typing. Type extension is Wirth's way of inheritance reflecting the viewpoint of the parent site. Oberon was developed as part of the implementation of the Oberon operating system at ETH Zurich in Switzerland. The name is from the moon of Uranus, Oberon.	1986	null	\N	No code example (yet).
432	OBJ2	OBJ2 is a programming language with Clear-like parametrised modules and a functional system based on equations.	null	null	\N	No code example (yet).
433	Object Lisp	Object Lisp was a computer programming language, a dialect of the Lisp language. It was an object-oriented extension for the Lisp dialect Lisp Machine Lisp, designed by Lisp Machines, Inc. Object Lisp was also an early example of prototype-based programming.	null	null	\N	No code example (yet).
434	Object Pascal	Object Pascal refers to a branch of object-oriented derivatives of Pascal, mostly known as the primary programming language of Embarcadero Delphi.	1986; 30 years ago (1986)	null	\N	No code example (yet).
435	Object REXX	The Object REXX programming language is an object-oriented scripting language initially produced by IBM for OS/2. It is a follow-on to and a significant extension of the "Classic Rexx" language originally created for the CMS component of VM/SP and later ported to MVS,[3] OS/2 and PC DOS. OS/2 version of IBM Object REXX is deeply integrated with SOM.[4]	1988; 28 years ago (1988)	4.2.0 / 24 February 2014; 2 years ago (2014-02-24)	http://www.oorexx.org/	No code example (yet).
436	Objective-C	Objective-C is a general-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language. It was the main programming language used by Apple for the OS X and iOS operating systems, and their respective application programming interfaces (APIs): Cocoa and Cocoa Touch prior to the introduction of Swift.	1983; 33 years ago (1983)	2	http://developer.apple.com/library/mac/navigation	No code example (yet).
437	Objective-J	Objective-J is a programming language developed as part of the Cappuccino web development framework. Its syntax is nearly identical to the Objective-C syntax and it shares with JavaScript the same relationship that Objective-C has with the C programming language: that of being a strict, but small, superset; adding traditional inheritance and Smalltalk/Objective-C style dynamic dispatch. Pure JavaScript, being a prototype-based language, already has a notion of object orientation and inheritance, but Objective-J adds the use of class-based programming to JavaScript.	2008	null	http://cappuccino-project.org/	No code example (yet).
440	OCaml	OCaml (/oʊˈkæməl/ oh-KAM-əl), originally known as Objective Caml, is the main implementation of the Caml programming language, created by Xavier Leroy, Jérôme Vouillon, Damien Doligez, Didier Rémy, Ascánder Suárez and others in 1996. OCaml extends the core Caml language with object-oriented constructs.	1996; 20 years ago (1996)	4.03.0 / April 25, 2016; 21 days ago (2016-04-25)	http://ocaml.org/	(* Hello World in OCaml *)\n\nprint_string "Hello World!\\n";;
441	occam	occam is a concurrent programming language that builds on the communicating sequential processes (CSP) process algebra,[1] and shares many of its features. It is named after William of Ockham of Occam's Razor fame.	1983	2.1 (official), 2.5 (unofficial), 3 (not fully implemented) / 1988+	\N	No code example (yet).
442	occam-π	In computer science, occam-π (or occam-pi) is the name of a variant of the programming language occam developed by the Kent Retargetable occam Compiler (KRoC) team at the University of Kent.[1] The name reflects the introduction of elements of π-calculus into occam, especially concepts involving mobile agents (processes) and data. The language contains several extensions to occam 2.1, including:	null	null	http://occam-pi.org/	No code example (yet).
443	Octave	GNU Octave is software featuring a high-level programming language, primarily intended for numerical computations. Octave helps in solving linear and nonlinear problems numerically, and for performing other numerical experiments using a language that is mostly compatible with MATLAB. It may also be used as a batch-oriented language. Since it is part of the GNU Project, it is free software under the terms of the GNU General Public License.	null	4.0.1 (March 23, 2016; 55 days ago (2016-03-23)) [±]	https://gnu.org/software/octave/	#Hello World in Octave (http://www.octave.org/)\nprintf("Hello World\\n");
444	OmniMark	OmniMark is a fourth-generation programming language used mostly in the publishing industry. It is a proprietary software product of Stilo International.	null	null	\N	No code example (yet).
445	Onyx	Onyx is a stack-oriented programming language.	null	null	\N	No code example (yet).
446	Opa	Opa is an open source programming language for developing scalable web applications.	2011	1.1.0 (stable) / February 13, 2013; 3 years ago (2013-02-13)[1]	http://opalang.org/	No code example (yet).
447	Opal	OPAL (OPtimized Applicative Language) is a functional programming language first developed at the Technical University of Berlin.	null	null	\N	No code example (yet).
572	SiMPLE	SiMPLE (a recursive acronym for SiMPLE Modular Programming Language & Environment) is a programming development system that was created to provide easy programming capabilities for everybody, especially non-professionals.	null	null	\N	No code example (yet).
448	OpenCL	Open Computing Language (OpenCL) is a framework for writing programs that execute across heterogeneous platforms consisting of central processing units (CPUs), graphics processing units (GPUs), digital signal processors (DSPs), field-programmable gate arrays (FPGAs) and other processors or hardware accelerators. OpenCL specifies a programming language (based on C99) for programming these devices and application programming interfaces (APIs) to control the platform and execute programs on the compute devices. OpenCL provides a standard interface for parallel computing using task-based and data-based parallelism.	null	2.1 revision 23[1] / November 11, 2015; 6 months ago (2015-11-11)	https://www.khronos.org/opencl	No code example (yet).
449	OpenEdge ABL	OpenEdge Advanced Business Language, or OpenEdge ABL for short, is a business application development language created and maintained by Progress Software Corporation (PSC). The language, typically classified as a fourth-generation programming language, uses an English-like syntax to simplify software development.[1] The language was called PROGRESS or Progress 4GL up until version 9, but in 2006 PSC changed the name to OpenEdge Advanced Business Language (OpenEdge ABL) in order to overcome a presumed industry perception that 4GLs were less capable than other languages.[2] A subset of the language, called SpeedScript, is used in the development of web applications.[3]	null	OpenEdge 11.6 / October 26, 2015; 6 months ago (2015-10-26)	\N	No code example (yet).
450	OPL	Open Programming Language (OPL) is an embedded programming language for portable devices that run the Symbian Operating System.	1984	1.56 / June 17, 2006 (2006-06-17) / June 17, 2006 (2006-06-17)	http://opl-dev.sourceforge.net/	No code example (yet).
451	OPS5	OPS5 is a rule-based or production system computer language, notable as the first such language to be used in a successful expert system, the R1/XCON system used to configure VAX computers.	null	null	\N	No code example (yet).
452	OptimJ	OptimJ is an extension of the Java with language support for writing optimization models and abstractions for bulk data processing. The extensions and the proprietary product implementing the extensions were developed by Ateji which went out of business in September 2011.[1] OptimJ aims at providing a clear and concise algebraic notation for optimization modeling, removing compatibility barriers between optimization modeling and application programming tools, and bringing software engineering techniques such as object-orientation and modern IDE support to optimization experts.	2006 (2006)	null	\N	No code example (yet).
453	Orc	Orc is a concurrent, nondeterministic computer programming language created by Jayadev Misra at the University of Texas at Austin.	2004	null	https://orc.csres.utexas.edu/	No code example (yet).
454	ORCA/Modula-2	ORCA/Modula-2 is a Modula-2 compiler written in the Modula-2 programming language for the Apple IIGS computer.	null	null	\N	No code example (yet).
455	Oriel	Oriel is a scripting language released with the Power Tools series of instructional books written by the LeBlond Group. Described in its documentation as a "graphics-based batch language", it was originally designed for Microsoft Windows 3.0 and released with the book Windows 3 Power Tools in 1991.[1] However, versions of the language were also bundled with Windows 3.1 Power Tools in 1992 and Windows NT Power Tools in 1994.	1991	null	\N	No code example (yet).
457	Oxygene	Oxygene (formerly known as Chrome) is a programming language developed by RemObjects Software for Microsoft's Common Language Infrastructure, the Java Platform and Cocoa. Oxygene is Object Pascal-based, but also has influences from C#, Eiffel, Java, F# and other languages.	null	8.2 / November 13, 2015; 5 months ago (2015-11-13)	http://elementscompiler.com/	No code example (yet).
458	Oz	Oz is a multiparadigm programming language, developed in the Programming Systems Lab at Université catholique de Louvain, for programming language education. It has a canonical textbook: Concepts, Techniques, and Models of Computer Programming.	1991; 25 years ago (1991)	Oz 1.4.0 (final), Mozart 2 / 3 July 2008; 7 years ago (2008-07-03)	http://mozart.github.io/	% Hello World in Oz\n\nfunctor\nimport\n  System\n  Application\ndefine\n  {System.showInfo "Hello World!"}\n  {Application.exit 0}\nend
459	P#	P# is a Prolog interpreter written for the Common Language Infrastructure.	null	null	\N	No code example (yet).
460	P′′	P′′ is a primitive computer programming language created by Corrado Böhm[1][2] in 1964 to describe a family of Turing machines.	1964	null	\N	No code example (yet).
461	ParaSail (programming language)	ParaSail, Parallel Specification and Implementation Language, is an object-oriented parallel programming language. The design and ongoing implementation of ParaSail is described in a blog and on its official website.	2009	null	http://www.parasail-lang.org/	No code example (yet).
462	PARI/GP	PARI/GP is a computer algebra system with the main aim of facilitating number theory computations. Versions 2.1.0 and higher are distributed under the GNU General Public License. It runs on most common operating systems.	null	2.7.5 / November 9, 2015; 6 months ago (2015-11-09)	http://pari.math.u-bordeaux.fr/	No code example (yet).
464	PCASTL	The PCASTL (an acronym for by Parent and Childset Accessible Syntax Tree Language) is an interpreted high-level programming language. It was created in 2008 by Philippe Choquette.[1] The PCASTL is designed to ease the writing of self-modifying code. The language has reserved words parent and childset to access the nodes of the syntax tree of the currently written code.[2]	2008	3.4 / April 9, 2016 (2016-04-09)	\N	No code example (yet).
465	PCF	In computer science, Programming Computable Functions,[note 1] or PCF, is a typed functional language introduced in an unpublished 1969 manuscript by Dana Scott. It can be considered to be an extended version of the typed lambda calculus or a simplified version of modern typed functional languages such as ML.	null	null	\N	No code example (yet).
467	PEARL	PEARL, or Process and experiment automation realtime language, is a computer programming language designed for multitasking and real-time programming. Being a high-level language, it is fairly cross-platform. Since 1977, the language has been going under several standardization steps by the Deutsches Institut für Normung. The current version is PEARL-90, which was standardized in 1998 as DIN 66253-2.	null	null	\N	MODULE (HELLO);\n/* Hello World in PEARL (Process and Experiment Automation Realtime Language) */\n  SYSTEM;\n   TERMINAL:DIS<->SDVLS(2);\n  PROBLEM;\n   SPC TERMINAL DATION INOUT\n         ALPHIC DIM(,) TFU MAX\n         FORWARD CONTROL (ALL);\n   MAIN:TASK;\n     DCL TEXT INV CHAR(30)\n          INIT('HELLO WORLD!');\n    OPEN TERMINAL;\n    PUT TEXT TO TERMINAL;\n    CLOSE TERMINAL;\n   END;\nMODEND;
508	PROMAL	PROMAL (PROgrammer's Microapplication Language) is a structured programming language from Systems Management Associates for MS-DOS, Commodore 64, and Apple II. PROMAL features simple syntax, no line numbers, long variable names, functions and procedures with argument passing, real number type, arrays, strings, pointer, and a built-in I/O library. Like ABC and Python, indentation is part of the language syntax.	8/16/1984	2.1e / 1986-10-14	\N	No code example (yet).
468	PeopleCode	PeopleCode is an object-oriented, proprietary language used to express business logic for PeopleSoft applications. In its fundamentals, PeopleCode syntax resembles other programming languages. Some aspects of the PeopleCode language, however, are specifically related to the PeopleTools environment. However, the fundamentals of objects and classes are the same as in Java language. Definition name references, for example, enable you to refer to PeopleTools definitions, such as record definitions or pages, without using hard-coded string literals.[1] Other language features, such as PeopleCode data types and metastrings, reflect the close interaction of PeopleTools and Structured Query Language (SQL). Dot notation, classes and methods in PeopleCode are similar to other object oriented languages, like Java. Object syntax was an important feature of PeopleTools 8.[2]	null	null	\N	/* Hello World in PeopleCode 8.45\n\n&MsgText = MsgGetText(66666666, 999999999, "Hello World!");
469	Perl	Perl is a family of high-level, general-purpose, interpreted, dynamic programming languages. The languages in this family include Perl 5 and Perl 6.[4]	December 18, 1987; 28 years ago (1987-12-18)	5.24.0[1] / May 10, 2016; 7 days ago (2016-05-10)	https://www.perl.org/	# Hello world in perl\n\nprint "Hello World!\\n";
470	Perl6	Perl 6 is a member of the Perl family of programming languages.[5]	2000; 16 years ago (2000)	Rakudo Star / April 25, 2016 (2016-04-25)[2]	http://perl6.org/	No code example (yet).
471	Pharo	Pharo is an open source implementation of the programming language and environment Smalltalk. Pharo offers strong live programming features such as immediate object manipulation, live update, hot recompilation. Live programming environment is in the heart of the system.	2008; 8 years ago (2008)	5.0 / May 12, 2016; 4 days ago (2016-05-12)	http://pharo.org/	"Hello world in Pharo"\n\nTranscript show: 'hello world'; cr.
472	PHP	PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. Originally created by Rasmus Lerdorf in 1994,[3] the PHP reference implementation is now produced by The PHP Group.[4] PHP originally stood for Personal Home Page,[3] but it now stands for the recursive backronym PHP: Hypertext Preprocessor.[5]	1995; 21 years ago (1995)[1]	7.0.6[2] / April 29, 2016; 18 days ago (2016-04-29)	https://php.net/	<?php\no\n  // Hello World in PHP\n  echo 'Hello World!';\n?>
473	Phrogram	Phrogram was a commercial programming language designed for beginning and intermediate programmers of all ages. Its predecessor, Kids Programming Language (KPL) was first released in August 2005 and its distribution was discontinued in May 2008.[1] Phrogram was first released in October 2006 as v2.0; its current version, v2.5, was released in September 2008. As of July 15, 2015, Phrogsoft announced on their official website to cease the sale and distribution of its software.	null	null	\N	No code example (yet).
474	Pico	Pico is a programming language developed at the Software Languages Lab at Vrije Universiteit Brussel. The language was created to introduce the essentials of programming to non-computer science students.	1997; 19 years ago (1997)	null	http://pico.vub.ac.be/	No code example (yet).
478	PIKT	PIKT is cross-categorical, multi-purpose software for global-view, site-at-a-time system and network administration. Applicability includes system monitoring, configuration management, server and network administration, system security, and many other uses.	null	1.19.0 / September 10, 2007	\N	No code example (yet).
479	PILOT	Programmed Instruction, Learning, or Teaching (PILOT) is a simple programming language developed in the 1960s.[1] Like its younger sibling LOGO, it was an early foray into the technology of computer-assisted instruction (CAI).	null	null	\N	R:Hello world in PILOT\nT:Hello World!
480	Pizza	Pizza is an open-source superset of the Java programming language with the following new features:	null	null	http://pizzacompiler.sourceforge.net/	No code example (yet).
481	PL-11	PL-11 is a high-level machine-oriented programming language for the PDP-11, developed by R.D. Russell of CERN in 1971. Written in Fortran IV, it is similar to PL360 and is cross-compiled on other machines.	null	null	\N	No code example (yet).
482	PL/0	At least two programming languages are known as PL/0. One is a subset of IBM's general-purpose programming language PL/I.	null	null	\N	No code example (yet).
483	PL/B	Programming Language for Business or PL/B is a business-oriented programming language originally called DATABUS and designed by Datapoint in the early 1970s as an alternative to COBOL because Datapoint's 8-bit computers could not fit COBOL into their limited memory, and because COBOL did not at the time have facilities to deal with Datapoint's built-in keyboard and screen.	null	null	\N	No code example (yet).
485	PL/M	The PL/M programming language (an acronym of Programming Language for Microcomputers) is a high-level language developed by Gary Kildall[1] in 1972 for Intel for its microprocessors.	1972 (1972)	null	\N	No code example (yet).
486	PL/P	The PL/P programming language (an acronym of Programming Language for Prime (computers)) is a mid-level programming language developed by Prime Computer to serve as their second primary system programming language after Fortran IV. PL/P was a subset of PL/I.	null	null	\N	No code example (yet).
487	PL/SQL	PL/SQL (Procedural Language/Structured Query Language) is Oracle Corporation's procedural extension for SQL and the Oracle relational database. PL/SQL is available in Oracle Database (since version 7), TimesTen in-memory database (since version 11.2.1), and IBM DB2 (since version 9.7).[1] Oracle Corporation usually extends PL/SQL functionality with each successive release of the Oracle Database.	null	null	\N	No code example (yet).
488	PL360	PL360 (or PL/360) is a programming language designed by Niklaus Wirth and written by Niklaus Wirth, Joseph W. Wells, Jr., and Edwin Satterthwaite, Jr. for the IBM System/360 computer at Stanford University. A description of PL360 was published in early 1968, although the implementation was probably completed before Wirth left Stanford in 1967.[1]	null	null	\N	No code example (yet).
489	PLANC	PLANC (pronounced as "plank") is a high level computer programming language. The acronym stands for Programming LAnguage for Nd Computers.	null	null	\N	No code example (yet).
509	Promela	PROMELA (Process or Protocol Meta Language) is a verification modeling language introduced by Gerard J. Holzmann. The language allows for the dynamic creation of concurrent processes to model, for example, distributed systems. In PROMELA models, communication via message channels can be defined to be synchronous (i.e., rendezvous), or asynchronous (i.e., buffered). PROMELA models can be analyzed with the SPIN model checker, to verify that the modeled system produces the desired behavior. An implementation verified with Isabelle/HOL is also available, as part of the Computer Aided Verification of Automata project.[1]	null	null	\N	No code example (yet).
490	Plankalkül	Plankalkül (German pronunciation: [ˈplaːnkalkyːl], "Plan Calculus") is a programming language designed for engineering purposes by Konrad Zuse between 1943 and 1945. It was the first high-level (non-von Neumann) programming language to be designed for a computer. Also, notes survive with scribblings about such a plan calculation dating back to 1941. Plankalkül was not published at that time owing to a combination of factors such as conditions in wartime and postwar Germany and his efforts to commercialise the Z3 computer and its successors. In 1944 Zuse met with the German logician and philosopher Heinrich Scholz and they discussed Zuse's Plankalkül. In March 1945 Scholz personally expressed his deep appreciation for Zuse's utilization of the logical calculus.[2]	1948; 68 years ago (1948) – concept first published	null	\N	R1.1(V0[:sig]) => R0\nR1.2(V0[:m x sig]) => R0\n0 => i | m + 1 => j\n[W [ i < j -> [ R1.1(V0[i: m x sig]) => R0 | i + 1 => i ] ] ]\nEND\nR1.3() => R0\n'H';'e';'l';'l';'o';',';' ';'w';'o';'r';'l';'d';'!' => Z0[: m x sig] R1.2(Z0) => R0\nEND
491	Planner	Planner (often seen in publications as "PLANNER" although it is not an acronym) is a programming language designed by Carl Hewitt at MIT, and first published in 1969. First, subsets such as Micro-Planner and Pico-Planner were implemented, and then essentially the whole language was implemented as Popler by Julian Davies at the University of Edinburgh in the POP-2 programming language.[1] Derivations such as QA4, Conniver, QLISP and Ether (see Scientific Community Metaphor) were important tools in Artificial Intelligence research in the 1970s, which influenced commercial developments such as KEE and ART.	1969 (1969)	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.80.756	No code example (yet).
492	PLEX	PLEX (Programming Language for EXchanges) is a special-purpose, pseudo-parallel and event-driven real-time programming language. Dedicated for AXE telephone exchanges, it was developed by Göran Hemdahl at Ericsson.[1] Originally designed in the 1970s, it has been continuously evolving since then.[2] The language has two variants: Plex-C used for the AXE Central Processor (CP) and Plex-M used for Extension Module Regional Processors (EMRP).[3] PLEX was described in 2008 as "a cross between Fortran and a macro assembler."[4]	1970s	null	\N	No code example (yet).
493	PLEXIL	PLEXIL (Plan Execution Interchange Language) is an open source technology for automation, created and currently in development by NASA.	2005	null	\N	No code example (yet).
496	PortablE	Amiga E, or very often simply E, is a programming language created by Wouter van Oortmerssen on the Amiga. He has since moved on to develop the SHEEP programming language for the new AmigaDE platform and the CryScript language (also known as DOG) used during the development of the video game Far Cry.	null	null	\N	No code example (yet).
497	PostScript	PostScript (PS) is a computer language for creating vector graphics. It is a dynamically typed, concatenative programming language and was created at Adobe Systems by John Warnock, Charles Geschke, Doug Brotz, Ed Taft and Bill Paxton[1] in 1982-4. It is used as a page description language in the electronic and desktop publishing areas.	1982; 34 years ago (1982)	PostScript 3 / 1997; 19 years ago (1997)	\N	No code example (yet).
498	PowerBuilder	PowerBuilder is an integrated development environment owned by Sybase, a division of SAP. It has been in use since 1991, peaking around 1998 with around 100,000 users.[1] In May of 2015 SAP announced that Appeon would take over future development and marketing of PowerBuilder while Intellectual Property would remain with SAP.[2]	null	12.6 / August 2014	\N	No code example (yet).
499	Powerhouse	PowerHouse is a trademarked name for a byte-compiled fourth-generation programming language (or 4GL) originally produced by Quasar Corporation (later renamed Cognos Incorporated) for the Hewlett-Packard HP3000 mini-computer. It was initially composed of five components:	null	null	\N	No code example (yet).
500	PowerShell	Windows PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language built on the .NET Framework. PowerShell provides full access to COM and WMI, enabling administrators to perform administrative tasks on both local and remote Windows systems as well as WS-Management and CIM enabling management of remote Linux systems and network devices.	November 14, 2006; 9 years ago (2006-11-14)	5.0 / July 29, 2015; 9 months ago (2015-07-29)	http://microsoft.com/powershell	No code example (yet).
501	PPL	The Polymorphic Programming Language (PPL) was developed in 1969 at Harvard University by Thomas A. Standish. It is an interactive, extensible language with a base language similar to APL.	null	null	\N	;Hello World in PPL (PCBoard Programming Language)\nPRINTLN "Hello, World!"
502	Pro*C	Pro*C (also known as Pro*C/C++) is an embedded SQL programming language used by Oracle Database database management systems. Pro*C uses either C or C++ as its host language. During compilation, the embedded SQL statements are interpreted by a precompiler and replaced by C or C++ function calls to their respective SQL library. The output from the Pro*C precompiler is standard C or C++ code that is then compiled by any one of several C or C++ compilers into an executable.	null	null	\N	No code example (yet).
504	Processing.js	Processing.js is a JavaScript port of Processing, a programming language designed to write visualizations, images, and interactive content. It allows web browsers to display animations, visual applications, games and other graphical rich content without the need for a Java applet or Flash plugin.	null	1.4.8 / March 25, 2014; 2 years ago (2014-03-25)	http://processingjs.org/	No code example (yet).
505	Prograph	Prograph is a visual, object-oriented, dataflow, multiparadigm programming language that uses iconic symbols to represent actions to be taken on data. Commercial Prograph software development environments such as Prograph Classic and Prograph CPX were available for the Apple Macintosh and Windows platforms for many years but were eventually withdrawn from the market in the late 1990s. Support for the Prograph language on Mac OS X has recently reappeared with the release of the Marten software development environment.	1983	null	\N	/* Hello World in Progress */\n\nmessage "Hello World" view-as alert-box.
506	PROIV	PROIV is a fourth-generation programming language (4GL), developed and sold by NorthgateArinso, part of the Northgate Information Solutions Group. It has an active community of around 2500 developers and end-users worldwide, ranging from consultants to large multinationals, finance institutions, tax authorities, retailers, engineering companies, media operators and software houses.	null	null	\N	No code example (yet).
507	Prolog	Prolog is a general-purpose logic programming language associated with artificial intelligence and computational linguistics.[1][2][3]	1972	null	\N	% Hello World in Prolog\n\nhello :- display('Hello World!') , nl .
552	SAIL	SAIL, the Stanford Artificial Intelligence Language, was developed by Dan Swinehart and Bob Sproull of the Stanford AI Lab in 1970. It was originally a large ALGOL 60-like language for the PDP-10 and DECSYSTEM-20.	null	null	\N	No code example (yet).
510	PROSE modeling language	PROSE[1][2][3][4] was the mathematical 4GL virtual machine which established the holistic modeling paradigm known as Synthetic Calculus[5][6][7] (AKA MetaCalculus). A successor to the SLANG[8]/CUE[9] simulation and optimization language developed at TRW Systems, it was introduced in 1974 on Control Data supercomputers. It was the first commercial language[10][11][12][13] to employ automatic differentiation (AD), which was optimized to loop in the instruction-stack of the CDC 6600 CPU.	null	null	\N	No code example (yet).
512	ProvideX	ProvideX is a computer language and development environment derived from Business Basic (a business oriented derivative of BASIC) in the mid-1980s.	1992; 24 years ago (1992)	9.10 / July 15, 2010; 5 years ago (2010-07-15)	http://www.pvxplus.com/	No code example (yet).
514	Python	Python is a widely used high-level, general-purpose, interpreted, dynamic programming language.[23][24] Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in fewer lines of code than would be possible in languages such as C++ or Java.[25][26] The language provides constructs intended to enable clear programs on both a small and large scale.[27]	20 February 1991; 25 years ago (1991-02-20)[1]	3.5.1 / 7 December 2015; 5 months ago (2015-12-07)[2]\n\n2.7.11 / 5 December 2015; 5 months ago (2015-12-05)[3]	https://www.python.org/	No code example (yet).
515	Q (equational programming language)	Q (short for equational programming language) is an interpreted, interactive functional programming language created by Albert Gräf at the University of Mainz in Germany. Q programs are just collections of equations which are used to evaluate expressions in a symbolic fashion. Q has many similarities with other modern functional programming languages like Haskell and ML, but is based on general term rewriting (a method of computation also used by the Mathematica computer algebra system) instead of the lambda calculus.	1991 (1991)	7.5 / September 12, 2006	\N	No code example (yet).
516	Q (programming language from Kx Systems)	Q is a proprietary array processing language developed by Arthur Whitney and commercialized by Kx Systems. The language serves as the query language for kdb+, a disk based and in-memory, column-based database. kdb+ is based upon K, a terse variant of APL. Q is a thin wrapper around K, providing a more readable, English-like interface.[2]	2003[1]	3.3 / December 2, 2015 (2015-12-02)	\N	No code example (yet).
518	QPL	Quantum programming is a set of computer programming languages that allow the expression of quantum algorithms using high-level constructs.[1] The point of quantum languages is not so much to provide a tool for programmers, but to provide tools for researchers to understand better how quantum computation works and how to reason formally about quantum algorithms.	null	null	\N	No code example (yet).
519	QtScript	QtScript is a scripting engine that has been part of the Qt cross-platform application framework since version 4.3.0.	null	null	\N	No code example (yet).
520	QuakeC	QuakeC is an interpreted language developed in 1996 by John Carmack of id Software to program parts of the video game Quake. Using QuakeC, a programmer is able to customize Quake to great extents by adding weapons, changing game logic and physics, and programming complex scenarios. It can be used to control many aspects of the game itself, such as parts of the AI, triggers, or changes in the level. The Quake engine was the only game engine to use QuakeC. Following engines used DLL game modules for customization written in C and C++ from id Tech 4 on.	1996	null	\N	// Hello World in QuakeC. This should be put somewhere, for instance\n// PutClientInServer() in Client.qc.\n\nbprint("Hello World\\n");
521	R	R is a programming language and software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing.[3] The R language is widely used among statisticians and data miners for developing statistical software[4] and data analysis.[5] Polls, surveys of data miners, and studies of scholarly literature databases show that R's popularity has increased substantially in recent years.[6]	1993; 23 years ago (1993)[2]	3.3.0 / May 3, 2016; 12 days ago (2016-05-03)	https://r-project.org/	# Hello World in R\ncat("Hello world\\n")
522	R++	R++ is a rule-based programming language based on C++. The United States patent describes R++ as follows:	null	null	\N	No code example (yet).
523	Racket	Racket (formerly named PLT Scheme) is a general purpose, multi-paradigm programming language in the Lisp-Scheme family. One of its design goals is to serve as a platform for language creation, design, and implementation.[7][8] The language is used in a variety of contexts such as scripting, general-purpose programming, computer science education, and research.	1994	6.5[1] / April 28, 2016; 15 days ago (2016-04-28)	http://racket-lang.org/	;; Hello world in Racket\n\n#lang racket/base\n"Hello, World!"
524	RAPID	RAPID is a high-level programming language used to control ABB industrial robots. RAPID was introduced along with S4 Control System in 1994 by ABB, superseding the ARLA programming language.	1994	null	\N	No code example (yet).
525	Rapira	Rapira (Russian: Рапира, rapier) is an educational procedural programming language developed in the USSR and implemented on Agat computer, PDP-11 clones (Electronika, DVK, BK series) and Intel-8080/Z80 clones (Korvet). It was an interpreted language with dynamic type system and high level constructions. The language originally had a Russian-based set of keywords, but English and Moldovan were added later. Also, it was more elegant and easier to use than existing Pascal implementations of the time[according to whom?].	null	null	\N	No code example (yet).
526	Ratfiv	Ratfiv is an enhanced version of the Ratfor programming language, a preprocessor for Fortran designed to give it C-like capabilities. Fortran was widely used for scientific programming but had very basic control-flow primitives ("do" and "goto") and no "macro" facility which limited its expressiveness.	null	null	\N	No code example (yet).
527	Ratfor	Ratfor (short for Rational Fortran) is a programming language implemented as a preprocessor for Fortran 66. It provided modern control structures, unavailable in Fortran 66, to replace GOTOs and statement numbers.	1976 (1976)	null	\N	No code example (yet).
528	rc	rc is the command line interpreter for Version 10 Unix and Plan 9 from Bell Labs operating systems. It resembles the Bourne shell, but its syntax is somewhat simpler. It was created by Tom Duff, who is better known for an unusual C programming language construct ("Duff's device").	1989; 27 years ago (1989)	null	\N	No code example (yet).
548	S2	S2 (Style System 2) is an object-oriented programming language developed in the late 1990s by Brad Fitzpatrick, Martin "Mart" Atkins, and others for the online journaling service LiveJournal in order to allow users full control over the appearance of their pages. S2 source code is compiled into Perl, which the webserver can then execute directly for individual web page requests.	1999 (1999)	null	http://www.livejournal.com/doc/s2	No code example (yet).
571	SIGNAL	SIGNAL is a programming language based on synchronized data-flow (flows + synchronization): a process is a set of equations on elementary flows describing both data and control.[1]	null	null	\N	No code example (yet).
530	Red	Red is a computer programming language. Red were made to overcoming limitations of the computer language Rebol. Red is both an imperative and functional programming language introduced in 2011 by Nenad Rakocevic. Its syntax and general usage directly overlaps with that of the interpreted Rebol language (which was introduced in 1997). The implementation choices of Red were geared specifically to create what Rakocevic calls a "full stack programming language". Red can be used for extremely high-level programming (DSLs and GUIs) as well as low-level programming (operating systems and device drivers).	2011	0.6.0 (Alpha) / March, 2016	http://www.red-lang.org/	No code example (yet).
532	REFAL	Refal (Recursive functions algorithmic language) "is a functional programming language oriented toward symbol manipulation", including "string processing, translation, [and] artificial intelligence".[1] It is one of the oldest members of this family, first conceived in 1966 as a theoretical tool with the first implementation appearing in 1968. Refal was intended to combine mathematical simplicity with practicality for writing large and sophisticated programs.	1968 (1968)	null	\N	No code example (yet).
533	Reia	Reia was a general-purpose concurrent object-oriented programming language for the Erlang virtual machine. As of August 10, 2011, Reia has been declared defunct in favor of Elixir.[1]	2008	null	http://reia-lang.org/	No code example (yet).
534	Revolution	The LiveCode programming language (formerly the "Revolution" programming language)[1] is both an open-source and proprietary cross-platform[2] rapid application development language inspired by HyperCard's programming language HyperTalk.[3][4] It belongs to the family of xTalk scripting languages.	1993 (1993)	null	\N	-- Hello World in Revolution (formerly called Transcript)\nanswer "Hello World!"
535	REXX	Rexx (Restructured Extended Executor) is an interpreted programming language developed at IBM by Mike Cowlishaw. It is a structured, high-level programming language designed for ease of learning and reading. Proprietary and open source REXX interpreters exist for a wide range of computing platforms; compilers exist for IBM mainframe computers.[2]	1979; 37 years ago (1979)	ANSI X3.274 / 1996; 20 years ago (1996)	\N	No code example (yet).
536	Rlab	Rlab is an interactive, interpreted numerical computation program and its core programming language, written by Ian Searle. Rlab (the language) is very high level and is intended to provide fast prototyping and program development, as well as easy data-visualization, and processing.	null	null	\N	No code example (yet).
537	ROOP	ROOP is a multiparadigm programming language targeted at AI applications created at the Chengdu University of China. It combines rule-based, procedural, logical and object-oriented programming techniques.	null	null	\N	No code example (yet).
538	RPL	RPL (derived from Reverse Polish Lisp according to its original developers,[2][3][4][5][6][7] whilst for a short while in 1987 HP marketing attempted to coin the backronym ROM-based Procedural Language for it.[1][7][8]) is a handheld calculator operating system and application programming language used on Hewlett-Packard's scientific graphing RPN (Reverse Polish Notation) calculators of the HP 28, 48, 49 and 50 series, but it is also usable on non-RPN calculators, such as the 38, 39 and 40 series.	1984 (1986)	null	\N	Hello World in RPL for the HP-28, HP-48, HP-49 and HP-50 series pocket calculators. No comments possible.\n\n<<\n    "HELLO WORLD"\n    1 DISP\n    60 FREEZE\n>>
539	RSL	Robot Battle is a programming game for Microsoft Windows where players design and code adaptable battling robots. Robot Battle takes strategy rather than reflexes, accuracy, or timing to succeed. What differentiates one robot from the next is its programming, for which the player is responsible. The game is inspired by the similar game RobotWar.	null	null	\N	// Hello World in RSL (RS-Bank Language)\n\n[Hello World!];
540	RTL/2	RTL/2 was a high-level programming language developed at Imperial Chemical Industries Ltd by J.G.P. Barnes. It was originally used internally within ICI but was distributed by SPL International in 1974[1] It was designed for use in real-time computing (hence the initials RTL = real-time language). Based on concepts from Algol 68, it was intended to be a small, simple language.[2][3] RTL/2 was standardised in 1980 by the British Standards Institution.[4]	1972	null	\N	No code example (yet).
541	Ruby	Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.	1995; 21 years ago (1995)	2.3.1 / April 26, 2016; 20 days ago (2016-04-26)[1]	http://www.ruby-lang.org/	# Hello World in Ruby\nputs "Hello World!"
542	RuneScript	RuneScape is a fantasy massively multiplayer online role-playing game (MMORPG) developed and published by Jagex, released originally in January 2001. RuneScape is a graphical browser game implemented on the client-side in Java, and incorporates 3D rendering. The game has had over 200 million accounts created and is recognised by the Guinness World Records as the world's largest free MMORPG and the most-updated game.[1]	null	null	http://www.runescape.com/	No code example (yet).
543	Rust	Rust is a general-purpose, multi-paradigm, compiled programming language sponsored by Mozilla Research.[12] It is designed to be a "safe, concurrent, practical language",[13] supporting pure-functional, imperative-procedural, and object-oriented styles.	2010	1.8[1] / April 14, 2016; 32 days ago (2016-04-14)	https://www.rust-lang.org/	// Hello world in Rust\n\nfn main() {\n    println!("Hello World!");\n}
544	S	S is a statistical programming language developed primarily by John Chambers and (in earlier versions) Rick Becker and Allan Wilks of Bell Laboratories. The aim of the language, as expressed by John Chambers, is "to turn ideas into software, quickly and faithfully".[1]	1976; 40 years ago (1976)	null	\N	No code example (yet).
546	S-PLUS	S-PLUS is a commercial implementation of the S programming language sold by TIBCO Software Inc..	null	8.2 / November 2010; 5 years ago (2010-11)	\N	No code example (yet).
547	S/SL	The Syntax/Semantic Language (S/SL) is an executable high level specification language for recursive descent parsers, semantic analyzers and code generators developed by James Cordy, Ric Holt and David Wortman at the University of Toronto in 1980.[1]	null	null	\N	No code example (yet).
550	SA-C	Single Assignment C (SA-C) (pronounced "sassy") is a member of the C programming language family designed to be directly and intuitively translatable into circuits, including FPGAs. To ease translation, SA-C does not include pointers and arithmetics thereon. To retain most of the expressiveness of C, SA-C instead features true n-dimensional arrays as first-class objects of the language.	null	null	\N	No code example (yet).
551	SabreTalk	SabreTalk was a dialect of PL/I for the S/360 IBM mainframes running the TPF platform. SabreTalk was developed jointly by American Airlines, Eastern Air Lines and IBM. SabreTalk is known as PL/TPF (Programming Language for TPF).[1]	null	null	\N	No code example (yet).
553	SALSA	The SALSA programming language (Simple Actor Language System and Architecture) is an actor-oriented programming language that uses concurrency primitives beyond asynchronous message passing, including token-passing, join, and first-class continuations. It also supports distributed computing over the Internet with universal naming, remote communication, and migration linguistic abstractions and associated middleware. For portability, it produces Java code.	2001 (2001)	1.1.5 / July 18, 2011; 4 years ago (2011-07-18)	\N	No code example (yet).
554	SAM76	SAM76 is a macro programming language used from the late 1970s to the present 2007 initially ran on CP/M.	null	null	\N	No code example (yet).
555	SAS	SAS (Statistical Analysis System)[1] is a software suite developed by SAS Institute for advanced analytics, multivariate analyses, business intelligence, data management, and predictive analytics.	null	9.4 / July 10, 2013; 2 years ago (2013-07-10)	\N	/* Hello world in SAS */\n* Writes as output title;\nTITLE "Hello World!";\n* writes to the log;\nPUT Hello world!;
557	Sather	Sather is an object-oriented programming language. It originated circa 1990 at the International Computer Science Institute (ICSI) at the University of California, Berkeley, developed by an international team led by Steve Omohundro. It supports garbage collection and generics by subtypes.	1990	null	https://www.gnu.org/software/sather/	-- Hello World in Sather\n\n    class HELLO is\n       main is #OUT + "Hello World!\\n" end\n    end
558	Sawzall	Sawzall is a procedural domain-specific programming language, used by Google to process large numbers of individual log records. Sawzall was first described in 2003,[1] and the szl runtime was open-sourced in August 2010.[2] However, since the MapReduce table aggregators have not been released,[3] the open-sourced runtime is not useful for large-scale data analysis of multiple log files off the shelf.	null	null	\N	No code example (yet).
559	SBL	Superbase is an end-user desktop database program that started on the Commodore 64 and was ported from that to various operating systems over the course of more than 20 years. It also has generally included a programming language to automate database-oriented tasks, and with later versions included WYSIWYG form and report designers as well as more sophisticated programming capabilities.	null	null	http://www.superbase.com/	No code example (yet).
560	Scala	Scala (/ˈskɑːlɑː/ SKAH-lah)[7] is a general purpose programming language. Scala has full support for functional programming and a very strong static type system. Designed to be concise,[8] many of Scala's design decisions were inspired by criticism of the shortcomings of Java.[6]	January 20, 2004; 12 years ago (2004-01-20)	2.11.8 / March 8, 2016; 2 months ago (2016-03-08)[1]	http://www.scala-lang.org/	// Hello world in Scala\n\nobject HelloWorld extends App {\n  println("Hello world!")\n}
561	Scheme	Scheme is a functional programming language and one of the two main dialects of the programming language Lisp. Unlike Common Lisp, the other main dialect, Scheme follows a minimalist design philosophy specifying a small standard core with powerful tools for language extension.	1970	R7RS (ratified standard) / 2013	http://www.scheme-reports.org/	; Hello World in Scheme\n\n(display "Hello, world!")\n(newline)
562	Scilab	Scilab is an open source, cross-platform numerical computational package and a high-level, numerically oriented programming language. It can be used for signal processing, statistical analysis, image enhancement, fluid dynamics simulations, numerical optimization, and modeling, simulation of explicit and implicit dynamical systems and (if the corresponding toolbox is installed) symbolic manipulations.	null	5.5.2 / April 1, 2015; 13 months ago (2015-04-01)	http://www.scilab.org/	// Hello World in SciLab.\n\ndisp('Hello World');
564	Script.NET	Script.NET or S# is a metaprogramming language that provides scripting functionality in Microsoft .NET applications, allowing runtime execution of custom functionality, similar to VBA in Microsoft Office applications. The syntax of Script.NET is similar to JavaScript. It is designed to be simple and efficient scripting language allowing to customize .NET applications. The language has a true runtime interpreter, and it is executed without generating additional in-memory assemblies.	null	null	http://www.protsyk.com/scriptdotnet	No code example (yet).
565	Sed	sed (stream editor) is a Unix utility that parses and transforms text, using a simple, compact programming language. sed was developed from 1973 to 1974 by Lee E. McMahon of Bell Labs,[1] and is available today for most operating systems.[2] sed was based on the scripting features of the interactive editor ed ("editor", 1971) and the earlier qed ("quick editor", 1965–66). sed was one of the earliest tools to support regular expressions, and remains in use for text processing, most notably with the substitution command. Other options for doing "stream editing" include AWK and Perl.	1974; 42 years ago (1974)	null	\N	No code example (yet).
567	Self	Self is an object-oriented programming language based on the concept of prototypes. Self was a dialect of Smalltalk, being dynamically typed and using just-in-time compilation (JIT) as well as the prototype-based approach to objects: it was first used as an experimental test system for language design in the 1980s and 1990s. In 2006, Self was still being developed as part of the Klein project, which was a Self virtual machine written fully in Self. The latest version is 4.5.0 released in January 2014.[1]	1987; 29 years ago (1987)	4.5.0 / January 12, 2014; 2 years ago (2014-01-12)	http://selflanguage.org/	(|  "Hello World in Self"\n\n  hello = (| | 'Hello World!' print)\n|)
568	SenseTalk	SenseTalk is an English-like scripting language derived from the HyperTalk language used in HyperCard. SenseTalk was originally developed as the scripting language within the HyperSense multimedia authoring application on the NeXTStep and OpenStep platforms. SenseTalk resurfaced in 2002 as the scripting language in eggPlant, the first commercial Mac OS X and cross-platform GUI testing application.	null	1.25 / January 18, 2007; 9 years ago (2007-01-18)	\N	Hello World in SenseTalk.\n\non run put "Hello World!" end run
569	SequenceL	SequenceL is computer software, a type of programming language. It is a general purpose functional programming language and auto-parallelizing (concurrency) tool set, which primary design objectives are performance on multi-core processor hardware, ease of programming, and code clarity and readability. Its main advantage is that it can be used to write straightforward code that automatically takes full advantage of all the processing power available, without programmers needing to be concerned with identifying parallelisms, specifying vectorization, avoiding race conditions, and other challenges of manual directive-based programming approaches such as OpenMP.	1989; 27 years ago (1989)	null	http://www.texasmulticore.com/	No code example (yet).
570	SETL	SETL (SET Language) is a very high-level programming language based on the mathematical theory of sets. It was originally developed by Jack Schwartz at the NYU Courant Institute of Mathematical Sciences in the late 1960s.	1969	null	http://setl.org/	No code example (yet).
573	SIMPOL	Superbase is an end-user desktop database program that started on the Commodore 64 and was ported from that to various operating systems over the course of more than 20 years. It also has generally included a programming language to automate database-oriented tasks, and with later versions included WYSIWYG form and report designers as well as more sophisticated programming capabilities.	null	null	http://www.superbase.com/	No code example (yet).
574	SIMSCRIPT	SIMSCRIPT is a free-form, English-like general-purpose simulation language conceived by Harry Markowitz and Bernard Hausner at the RAND Corporation in 1963. It was implemented as a Fortran preprocessor on the IBM 7090 and was designed for large discrete event simulations. It influenced Simula.	null	null	\N	No code example (yet).
575	Simula	Simula is the name of two simulation programming languages, Simula I and Simula 67, developed in the 1960s at the Norwegian Computing Center in Oslo, by Ole-Johan Dahl and Kristen Nygaard. Syntactically, it is a fairly faithful superset of ALGOL 60.[1]:1.3.1	1965	null	\N	! Hello World in Simula;\n\nBEGIN\n    OutText("Hello World!");\n    OutImage;\nEND
576	Simulink	Simulink, developed by MathWorks, is a graphical programming environment for modeling, simulating and analyzing multidomain dynamic systems. Its primary interface is a graphical block diagramming tool and a customizable set of block libraries. It offers tight integration with the rest of the MATLAB environment and can either drive MATLAB or be scripted from it. Simulink is widely used in automatic control and digital signal processing for multidomain simulation and Model-Based Design.[2][3]	null	8.6 (part of R2015b) / September 3, 2015 (2015-09-03)	\N	No code example (yet).
577	SISAL	SISAL ("Streams and Iteration in a Single Assignment Language") is a general-purpose single assignment functional programming language with strict semantics, implicit parallelism, and efficient array handling. SISAL outputs a dataflow graph in Intermediary Form 1 (IF1). It was derived from VAL (Value-oriented Algorithmic Language, designed by Jack Dennis), and adds recursion and finite streams. It has a Pascal-like syntax and was designed to be a common high-level language for numerical programs on a variety of multiprocessors.	1983	null	\N	No code example (yet).
578	SLIP	SLIP is a list processing computer programming language, invented by Joseph Weizenbaum in the 1960s. The name SLIP stands for Symmetric LIst Processor. It was first implemented as an extension to the Fortran programming language, and later embedded into MAD and ALGOL.[1]	null	null	\N	No code example (yet).
579	SMALL	SMALL, Small Machine Algol Like Language, is a programming language developed by Dr. Nevil Brownlee of Auckland University.	null	null	\N	No code example (yet).
581	Smalltalk	Smalltalk is an object-oriented, dynamically typed, reflective programming language. Smalltalk was created as the language to underpin the "new world" of computing exemplified by "human–computer symbiosis."[2] It was designed and created in part for educational use, more so for constructionist learning, at the Learning Research Group (LRG) of Xerox PARC by Alan Kay, Dan Ingalls, Adele Goldberg, Ted Kaehler, Scott Wallace, and others during the 1970s.	1972; 44 years ago (1972) (development began in 1969)	Smalltalk-80 version 2 / 1980; 36 years ago (1980)	\N	No code example (yet).
582	SML	Standard ML (SML) is a general-purpose, modular, functional programming language with compile-time type checking and type inference. It is popular among compiler writers and programming language researchers, as well as in the development of theorem provers.	null	null	\N	(* Hello World in SML *)\n\nfun hello() = output(std_out, "Hello World!");
584	SNOBOL	SNOBOL (StriNg Oriented and symBOlic Language) is a series of computer programming languages developed between 1962 and 1967 at AT&T Bell Laboratories by David J. Farber, Ralph E. Griswold and Ivan P. Polonsky, culminating in SNOBOL4. It was one of a number of text-string-oriented languages developed during the 1950s and 1960s; others included COMIT and TRAC.	1962; 54 years ago (1962)	SNOBOL4 / 1967; 49 years ago (1967)	\N	No code example (yet).
585	Snowball	Snowball is a small string processing programming language designed for creating stemming algorithms for use in information retrieval.[1]	null	null	\N	No code example (yet).
587	SP/k	SP/k is a programming language developed circa 1974[1] by R.C. Holt, D.B. Wortman, D.T. Barnard and J.R. Cordy as a subset of the PL/I programming language designed for teaching programming. It was used for about a decade at over 40 universities, schools, and research laboratories in Canada and the United States.	1974	SP/8	\N	No code example (yet).
588	Span	Span is a programming language targeting the Parrot virtual machine. Its syntax is meant to be very similar to C, but its philosophy is Smalltalk-like, and it uses Smalltalk-style message syntax. Almost all of Span's library visible to the user is written in Span itself. Span is dynamically typed. The hello world program in Span is	null	null	\N	No code example (yet).
589	SPARK	SPARK is a formally defined computer programming language based on the Ada programming language, intended for the development of high integrity software used in systems where predictable and highly reliable operation is essential. It facilitates the development of applications that demand safety, security, or business integrity.	null	15.0.1 / February 17, 2015 (2015-02-17)	\N	No code example (yet).
590	Speedcode	Speedcoding or Speedcode was the first high order or high-level language created for an IBM computer.[1] The language was developed by John Backus in 1953 for the IBM 701 to support computation with floating point numbers.[2] Here high level means symbolic and aiming for natural language expressivity as a goal as opposed to machine or hardware instruction oriented coding.	1953	null	\N	No code example (yet).
591	SPIN	The Parallax P8X32A Propeller chip, introduced in 2006, is a multi-core architecture parallel microcontroller with eight 32-bit RISC CPU cores.[1][2]	null	null	\N	No code example (yet).
592	SPS	The IBM 1401 Symbolic Programming System (SPS) was an assembler that was developed by Gary Mokotoff, IBM Applied Programming Department, for the IBM 1401 computer, the first of the IBM 1400 series. One source indicates that "This programming system was announced by IBM with the machine."[1]	null	null	\N	No code example (yet).
593	SQR	SQR (Hyperion SQR Production Reporting, Part of OBIEE) is a programming language designed for generating reports from database management systems. The name is an acronym of Structured Query Reporter, which suggests its relationship to SQL (Structured Query Language). Any SQL statement can be embedded in an SQR program.	null	null	\N	! Hello World in SQR\nbegin-program\n   print 'Hello, World.' (1,1)\nend-program
594	Squeak	The Squeak programming language is a dialect of Smalltalk. It is object-oriented, class-based and reflective.	1996; 20 years ago (1996)	5.0 / August 12, 2015; 9 months ago (2015-08-12)[2]	http://www.squeak.org/	"Hello world in Squeak"\n\nTranscript show: 'Hello World'
595	Squirrel	Squirrel is a high level imperative, object-oriented programming language, designed to be a light-weight scripting language that fits in the size, memory bandwidth, and real-time requirements of applications like video games and hardware such as Electric Imp.	2003	3.0.7 / January 10, 2015 (2015-01-10)	\N	#!/usr/bin/squirrelsh\n// Hello world in Squirrel\nprintl("Hello, world!");
596	SR	SR (short for Synchronizing Resources) is a programming language designed for concurrent programming.	null	null	\N	No code example (yet).
597	Stackless Python	Stackless Python, or Stackless, is a Python programming language interpreter, so named because it avoids depending on the C call stack for its own stack. The most prominent feature of Stackless is microthreads, which avoid much of the overhead associated with usual operating system threads. In addition to Python features, Stackless also adds support for coroutines, communication channels and task serialization.	null	null	http://www.stackless.com/	No code example (yet).
598	Starlogo	StarLogo is an agent-based simulation language developed by Mitchel Resnick, Eric Klopfer, and others at MIT Media Lab and MIT Scheller Teacher Education Program in Massachusetts. It is an extension of the Logo programming language, a dialect of Lisp. Designed for education, StarLogo can be used by students to model the behavior of decentralized systems.	null	StarLogo TNG 1.5.1/January 18, 2011; 5 years ago (2011-01-18)	http://education.mit.edu/portfolio_page/starlogo-tng/	No code example (yet).
599	Stata	Stata is a general-purpose statistical software package created in 1985 by StataCorp. Most of its users work in research, especially in the fields of economics, sociology, political science, biomedicine and epidemiology.[citation needed]	null	14.0 / April 7, 2015; 13 months ago (2015-04-07)	http://www.stata.com/	No code example (yet).
600	Stateflow	Stateflow, (developed by MathWorks), is a control logic tool used to model reactive systems via state machines and flow charts within a Simulink model. Stateflow uses a variant of the finite-state machine notation established by David Harel, enabling the representation of hierarchy, parallelism and history within a state chart.[2][3] Stateflow also provides state transition tables and truth tables.	null	R2015b / September 3, 2015; 7 months ago (2015-09-03)	\N	No code example (yet).
601	Strand	Strand is a high-level symbolic language for parallel computing, similar in syntax to Prolog.	null	null	\N	No code example (yet).
602	Subtext	Subtext is a moderately visual programming language and environment, for writing application software. It is an experimental, research attempt to develop a new programming model, called Example Centric Programming, by treating copied blocks as first class prototypes, for program structure. It uses live text, similar to what occurs in spreadsheets as users update cells, for frequent feedback. It is intended to eventually be developed enough to become a practical language for daily use. It is planned to be open software; the license is not yet determined.	null	null	\N	No code example (yet).
604	SuperTalk	SuperTalk is the scripting language used in SuperCard. SuperTalk is a descendant of HyperTalk.	null	null	\N	No code example (yet).
606	Swift (parallel scripting language)	Swift[1] is an implicitly parallel programming language that allows the writing of scripts that distribute program execution across distributed computing resources,[2] including clusters, clouds, grids, and supercomputers. Swift implementations are open source under the Apache License, version 2.0.	2007 (2007)	0.94.1 / 09/30/2013	\N	No code example (yet).
607	SYMPL	SYMPL was a programming language developed by the Control Data Corporation for use on the CDC 6000 series computer systems in the 1970s and 1980s. It was based on a subset of CDCs version of JOVIAL, as an alternative to assembly language. A number of important CDC software products were implemented in SYMPL, including compilers, libraries, a full-screen editor, and major subsystems.	null	null	\N	No code example (yet).
608	SyncCharts	SyncCharts is a graphical formalism dedicated to reactive system modeling. It allows specifying the reactive behavior, and the synchronous programming, of applications. SyncCharts is the name of the model. A syncChart is an instance. This language was created by Prof. Charles André.	null	null	\N	No code example (yet).
609	SystemVerilog	In the semiconductor and electronic design industry, SystemVerilog is a combined hardware description language and hardware verification language based on extensions to Verilog.	2002; 14 years ago (2002)	IEEE 1800-2012 / February 21, 2013; 3 years ago (2013-02-21)	\N	No code example (yet).
610	T	The T programming language is a dialect of the Scheme programming language developed in the early 1980s by Jonathan A. Rees, Kent M. Pitman, and Norman I. Adams of Yale University as an experiment in language design and implementation.	1980s	3.0 (August 1, 1984 (1984-08-01))	\N	; Hello world in T\n\n"Hello World!"
611	T-SQL	Transact-SQL (T-SQL) is Microsoft's and Sybase's proprietary extension to SQL. SQL, the acronym for Structured Query Language, is a standardized computer language that was originally developed by IBM for querying, altering and defining relational databases, using declarative statements. T-SQL expands on the SQL standard to include procedural programming, local variables, various support functions for string processing, date processing, mathematics, etc. and changes to the DELETE and UPDATE statements. These additional features make Transact-SQL Turing complete.[citation needed]	null	null	\N	-- Hello World in T-SQL\nPRINT 'Hello World'
612	TACL	TACL (the Tandem Advanced Command Language) is the scripting programming language used in Tandem Computers. TACL is the shell.	null	null	\N	Comment -- Hello World for TACL (Tandem Advanced Command Language)\n\n?tacl macro\n\n#OUTPUT Hello world
613	TACPOL	TACPOL (Tactical Procedure Oriented Language) is a block structured programming language developed by the United States Army for the TACFIRE Tactical Fire Direction command and control application. TACPOL is similar to PL/I.	null	null	\N	No code example (yet).
614	TADS	Text Adventure Development System (TADS) is a prototype-based domain-specific programming language and set of standard libraries for creating interactive fiction (IF) games.	1988; 28 years ago (1988)	Version 3.1.3 / May 16, 2013; 3 years ago (2013-05-16)	http://www.tads.org/	No code example (yet).
616	Tcl	Tcl (originally from Tool Command Language, but conventionally spelled "Tcl" rather than "TCL"; pronounced as "tickle" or "tee-see-ell"[4]) is a scripting language created by John Ousterhout.[5] Originally "born out of frustration",[6] according to the author, with programmers devising their own languages intended to be embedded into applications, Tcl gained acceptance on its own. It is commonly used for rapid prototyping, scripted applications, GUIs and testing. Tcl is used on embedded systems platforms, both in its full form and in several other small-footprint versions.	1988; 28 years ago (1988)	8.6.5[1] / February 29, 2016; 2 months ago (2016-02-29)	http://www.tcl.tk/	#!/usr/local/bin/tclsh\n# Hello World in Tcl\n\nputs "Hello World!"
617	Tea	Tea is a high level scripting language for the Java environment. It combines features of Scheme, Tcl and Java.	1997 (1997)	null	\N	No code example (yet).
618	TECO	TECO (/ˈtiːkoʊ/; originally an acronym for [paper] Tape Editor and COrrector, but later Text Editor and COrrector, then Text Editor Character Oriented) is a text editor originally developed at the Massachusetts Institute of Technology (MIT) in the 1960s, after which it was modified by "just about everybody".[1] TECO was a direct ancestor of Emacs, which was originally implemented in TECO macros.	null	null	\N	!Hello World in TECO\n!The $ symbol below wouldn't actually be a printing character -\n!it's the [escape] character, \\u001b!\nFTHello World$
619	TELCOMP	TELCOMP was a programming language developed at Bolt, Beranek and Newman (BBN) in about 1964 and in use until at least 1974. BBN offered TELCOMP as a paid service, with first revenue in October 1965.[1] The service was sold to a company called On-Line Systems in 1972. In the United Kingdom, TELCOMP was offered by Time Sharing, Ltd, a partnership between BBN and an entrepreneur named Richard Evans.	1965 (1965)	null	\N	No code example (yet).
620	TEX	In 1979, Honeywell Information Systems announced a new programming language for their time-sharing service named TEX, an acronym for the Text Executive processor. TEX was a first generation scripting language, developed around the time of AWK and used by Honeywell initially as an in-house system test automation tool.	null	null	\N	No code example (yet).
621	TeX	TeX (/ˈtɛx/ or /ˈtɛk/, see below) is a typesetting system designed and mostly written by Donald Knuth[1] and released in 1978.	null	3.14159265 / January 2014; 2 years ago (2014-01)	http://tug.org/	% Hello World in plain \\TeX\n\\immediate\\write16{Hello World!}\n\\end
622	TIE	Tensilica Instruction Extension refers to the proprietary language that is used to customize the Xtensa processor core architecture.	null	null	\N	No code example (yet).
623	Timber	Timber is a functional programming language descendant from O'Haskell, targeted at embedded real-time systems.	null	null	http://www.timber-lang.org/	No code example (yet).
624	TMG	TMG is a compiler-compiler[1] created by Robert M. McClure and presented in 1968, and implemented by Douglas McIlroy.[2][3][4] TMG ran on systems like OS360 and early Unix.[5] It was used to build EPL, an early version of PL/I.[5] Ken Thompson used TMG in 1970 on PDP-7 as a tool to offer Fortran, but ended up creating the B programming language which was much influenced by BCPL.[2]	null	null	\N	No code example (yet).
626	Tom	Tom is a programming language[1] particularly well-suited for programming various transformations[2] on tree structures and XML based documents. Tom is a language extension which adds new matching primitives to C and Java[3] as well as support for rewrite rules systems.[4] The rules can be controlled using a strategy[5] language.	null	2.10 / 2013-03-21	\N	No code example (yet).
627	TouchDevelop	TouchDevelop[1] is an interactive development environment and a visual programming language being developed at Microsoft Research.	null	null	https://www.touchdevelop.com/	No code example (yet).
628	TPU	DEC Text Processing Utility (or DECTPU)[1][2] was a language developed by Digital Equipment Corporation (DEC) for developing text editors. In 1986, DEC developed a new version of EDT written in DECTPU. DECTPU is distributed with OpenVMS. It is designed to be used on a terminal or console, so that it is not necessary to have DECwindows installed to use it.	null	null	\N	No code example (yet).
629	Trac	TRAC (for Text Reckoning And Compiling) Language is a programming language developed in the early 1960s by Calvin Mooers. It was one of three "first languages" recommended by Ted Nelson in Computer Lib.	null	null	\N	No code example (yet).
631	TTM	TTM is a string oriented, general purpose macro processing programming language developed in 1968 by Steven Caine and E. Kent Gordon at the California Institute of Technology.	1968	1.0 /	\N	No code example (yet).
633	Turing	Turing is a Pascal-like programming language developed in 1982 by Ric Holt and James Cordy, then of University of Toronto, Canada. Turing is a descendant of Euclid, Pascal and SP/k that features a clean syntax and precise machine-independent semantics.	1982	null	\N	% Hello World in Turing\nput "Hello World!"
634	TUTOR	TUTOR (also known as PLATO Author Language) is a programming language developed for use on the PLATO system at the University of Illinois at Urbana-Champaign around 1965. TUTOR was initially designed by Paul Tenczar for use in computer assisted instruction (CAI) and computer managed instruction (CMI) (in computer programs called "lessons") and has many features for that purpose. For example, TUTOR has powerful answer-parsing and answer-judging commands, graphics, and features to simplify handling student records and statistics by instructors. TUTOR's flexibility, in combination with PLATO's computational power (running on what was considered a supercomputer in 1972), also made it suitable for the creation of many non-educational lessons—that is, games—including flight simulators, war games, dungeon style multiplayer role-playing games, card games, word games, and medical lesson games such as Bugs and Drugs (BND).	1969 (1969)	null	\N	No code example (yet).
635	TXL	TXL is a special-purpose programming language originally designed by Charles Halpern-Hamu and James Cordy at the University of Toronto in 1985. The acronym "TXL" originally stood for "Turing eXtender Language" after the language's original purpose, the specification and rapid prototyping of variants and extensions of the Turing programming language, but no longer has any meaningful interpretation.	null	null	\N	No code example (yet).
636	TypeScript	TypeScript is a free and open source programming language developed and maintained by Microsoft. It is a strict superset of JavaScript, and adds optional static typing and class-based object-oriented programming to the language. Anders Hejlsberg, lead architect of C# and creator of Delphi and Turbo Pascal, has worked on the development of TypeScript.[2][3][4][5] TypeScript may be used to develop JavaScript applications for client-side or server-side (Node.js) execution.	October 1, 2012 (2012-10-01)[1]	1.8 / January 2016; 4 months ago (2016-01)	http://www.typescriptlang.org/	// Hello world in TypeScript\n\nalert('Hello world!');
637	Ubercode	Ubercode is a high level programming language designed by Ubercode Software and released in 2005 for Microsoft Windows. Ubercode is influenced by Eiffel and BASIC. It is commercial software and can be tried out for free for 30 days. Ubercode has the following design goals:	null	null	\N	No code example (yet).
638	UCSD Pascal	UCSD Pascal was a Pascal programming language system that ran on the UCSD p-System, a portable, highly machine-independent operating system. UCSD Pascal was first released in 1978. It was developed at the University of California, San Diego (UCSD).	null	null	\N	No code example (yet).
639	Umple	Umple is a language for both object-oriented programming and modeling with class diagrams and state diagrams. The name Umple is a portmanteau of "UML", "ample" and "programming language", indicating that it is designed to provide ample features to extend programming languages with UML capabilities.	2008	1.23.0 / December 21, 2015 (2015-12-21)	http://www.umple.org/	No code example (yet).
640	Unicon	Unicon is a programming language designed by American computer scientist Clint Jeffery with collaborators including Shamim Mohamed, Jafar Al Gharaibeh, Robert Parlett and others. Unicon descended from Icon and a preprocessor for Icon called IDOL. Compared with Icon, Unicon offers better access to the operating system as well as support for object-oriented programming. Unicon began life as a merger of three popular Icon extensions: an OO preprocessor named Idol, a POSIX filesystem and networking interface, and an ODBC facility. The name is shorthand for "Unified Extended Dialect of Icon."	null	null	http://unicon.sourceforge.net/	No code example (yet).
642	UNITY	UNITY is a programming language that was constructed by K. Mani Chandy and Jayadev Misra for their book Parallel Program Design: A Foundation. It is a theoretical language, which tries to focus on what, instead of where, when or how. The language has no flow control, the statements in the program run in a random order, until none of the statements causes change if run. This allows for programs that run indefinitely (auto-pilot or power plant safety system) as well as programs that would normally terminate (which here converge to a fixed point).	null	null	\N	No code example (yet).
644	UnrealScript	The Unreal Engine is a game engine developed by Epic Games, first showcased in the 1998 first-person shooter game Unreal. Although primarily developed for first-person shooters, it has been successfully used in a variety of other genres, including stealth, MMORPGs, and other RPGs. With its code written in C++, the Unreal Engine features a high degree of portability and is a tool used by many game developers today.[2][3]	1998	4.11 / March 31, 2016; 47 days ago (2016-03-31)	http://unrealengine.com/	// Hello World for UnrealScript\n\nclass HelloWorldHUD extends HudBase;\n\nsimulated function DrawHudPassC (Canvas C)\n{\n  C.SetPos( 0.50*C.ClipX , 0.50*C.ClipY);\n  C.DrawText("Hello World!");\n}\n\ndefaultproperties\n{\n}
645	Vala	Vala is an object-oriented programming language with a self-hosting compiler that generates C code and uses the GObject system (that "can be seen as an alternative to C-derived languages such as C++ and Objective-C").	2006; 10 years ago (2006)	0.32.0[1] / 21 March 2016; 56 days ago (2016-03-21)	https://wiki.gnome.org/Projects/Vala	// Hello World in Vala\n\nusing GLib;\n\nint main(string[] args) {\n   stdout.printf("Hello world!\\n");\n   return 0;\n}
646	VBA	Visual Basic for Applications (VBA) is an implementation of Microsoft's discontinued event-driven programming language, Visual Basic 6, and its associated integrated development environment (IDE).	1993; 23 years ago (1993)	7.1 (Office 2013)	\N	No code example (yet).
647	VBScript	VBScript ("Visual Basic Scripting Edition") is an Active Scripting language developed by Microsoft that is modeled on Visual Basic. It is designed as a "lightweight" language with a fast interpreter for use in a wide variety of Microsoft environments. VBScript uses the Component Object Model to access elements of the environment within which it is running; for example, the FileSystemObject (FSO) is used to create, read, update and delete files.	1996; 20 years ago (1996)	5.8	https://msdn.microsoft.com/en-us/library/t0aew7h6.aspx	' Hello World in VBScript (Windows Scripting Host)\nmsgbox "Hello, World!"
648	Visual Basic	Visual Basic is a third-generation event-driven programming language and integrated development environment (IDE) from Microsoft for its COM programming model first released in 1991 and declared legacy in 2008. Microsoft intended Visual Basic to be relatively easy to learn and use.[1][2] Visual Basic was derived from BASIC and enables the rapid application development (RAD) of graphical user interface (GUI) applications, access to databases using Data Access Objects, Remote Data Objects, or ActiveX Data Objects, and creation of ActiveX controls and objects.	1991; 25 years ago (1991)	6.0 / 1998; 18 years ago (1998)	http://msdn.microsoft.com/en-us/vstudio/ms788229.aspx	No code example (yet).
649	Visual Basic .NET	Visual Basic .NET (VB.NET) is a multi-paradigm, object-oriented programming language, implemented on the .NET Framework. Microsoft launched VB.NET in 2002 as the successor to its original Visual Basic language. Although the ".NET" portion was dropped in 2005, this article uses "Visual Basic [.NET]" to refer to all Visual Basic languages releases since 2002, in order to distinguish between them and the classic Visual Basic. Along with Visual C#, it is one of the two main languages targeting the .NET framework.	2001; 15 years ago (2001)	2015 (14.0) / 5 June 2015; 11 months ago (2015-06-05)	http://msdn.microsoft.com/en-us/vstudio/hh388573	No code example (yet).
650	Visual DataFlex	Visual DataFlex has been re-branded as DataFlex by Data Access Worldwide as of the release of version 2014/18.0 in August, 2014. The latest information about the product is consolidated in the DataFlex article.	null	null	\N	No code example (yet).
651	Visual DialogScript	Visual DialogScript (VDS) is an interpreted programming language for Microsoft Windows. It can be used to create small, fast programs. VDS has a large number of dialog and graphical elements available to create professional looking programs. VDS programs have access to the Windows API; therefore, it is possible to write applications that can perform the same advanced tasks as other programming languages such as Visual Basic, C++, or Delphi.	null	null	\N	No code example (yet).
653	Visual FoxPro	Visual FoxPro is a data-centric, object-oriented, procedural, programming language produced by Microsoft. It is derived from FoxPro (originally known as FoxBASE) which was developed by Fox Software beginning in 1984. It contained the fastest PC-based database engine available at the time. Fox Technologies merged with Microsoft in 1992, after which the software acquired further features and the prefix "Visual". The database engine became known as the Microsoft Jet Database Engine which was used by Microsoft Access. The last version, (FoxPro 2.6) worked on Mac OS, DOS, Windows, and Unix: Visual FoxPro 3.0, the first "Visual" version, reduced platform support to only Mac[6] and Windows, and later versions were Windows-only. The current version of Visual FoxPro is COM-based and Microsoft has stated that they do not intend to create a Microsoft .NET version.	null	null	http://msdn.microsoft.com/vfoxpro	No code example (yet).
654	Visual J#	Visual J++ (pronounced "Jay Plus Plus") is Microsoft's discontinued implementation of Java. Syntax, keywords, and grammatical conventions were the same as Java's. Microsoft discontinued support of J++ in January 2004,[1] replacing it to a certain extent with J# and C#.	null	null	\N	No code example (yet).
656	Visual Prolog	Visual Prolog, also formerly known as PDC Prolog and Turbo Prolog, is a strongly typed object-oriented extension of Prolog. As Turbo Prolog it was marketed by Borland, but it is now developed and marketed by the Danish firm Prolog Development Center (PDC) that originally developed it. Visual Prolog can build Microsoft Windows GUI-applications, console applications, DLLs (dynamic link libraries), and CGI-programs. It can also link to COM components and to databases by means of ODBC.	null	7.5, Build 7502 / November 5, 2015 (2015-11-05)	\N	No code example (yet).
658	vvvv	vvvv (German pronunciation: [faʊfiːɐ̯ ] = "v4") is a general purpose toolkit with a special focus on real-time video synthesis and programming large media environments with physical interfaces, real-time motion graphics, audio and video.[1] vvvv uses a dataflow approach and a visual programming interface for rapid prototyping and developing. Applications written in vvvv are commonly called patches. Patches consist of a network of nodes. Patches can be created, edited and tested while they are running.[2] Patches are stored on the disk in standard XML format. vvvv is written in Borland Delphi, plugins can be developed in the .NET Framework in C#.	1998	null	\N	No code example (yet).
659	WATFIV, WATFOR	WATFIV, or WATerloo FORTRAN IV, developed at the University of Waterloo, Canada is an implementation of the Fortran computer programming language. It is the successor of WATFOR.	null	null	\N	No code example (yet).
660	WebDNA	WebDNA is a server-side scripting, interpreted language with an embedded database system, specifically designed for the World Wide Web. Its primary use is in creating database-driven dynamic web page applications. Released in 1995, the name was registered as a trademark in 1998.[1] WebDNA is currently maintained by WebDNA Software Corporation.	null	null	\N	No code example (yet).
661	WebQL	WebQL Home Page http://www.ql2.com/products-services/ql2-webql/	null	null	\N	No code example (yet).
662	Whiley	Whiley is a general purpose multi-paradigm, compiled language developed by David Pearce.[1] The language combines features from the Functional and Imperative paradigms, is statically typed and supports formal specification through function preconditions, postconditions and loop invariants. The language is also notable for the use of flow-sensitive typing, also known as "flow typing".	2009	0.3.39 / March 11, 2016; 44 days ago (2016-03-11)	http://whiley.org/	No code example (yet).
663	Winbatch	Winbatch is a Microsoft Windows scripting language developed by Wilson WindowWare. Its environment includes an interpreter and a code editor along with a dialog designer and optional compiler to create self-contained executables.	null	null	http://www.winbatch.com/	No code example (yet).
664	Windows PowerShell	Windows PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language built on the .NET Framework. PowerShell provides full access to COM and WMI, enabling administrators to perform administrative tasks on both local and remote Windows systems as well as WS-Management and CIM enabling management of remote Linux systems and network devices.	November 14, 2006; 9 years ago (2006-11-14)	5.0 / July 29, 2015; 9 months ago (2015-07-29)	http://microsoft.com/powershell	No code example (yet).
665	Wolfram Language	The Wolfram Language, which is the programming language of Mathematica[2] and of the Wolfram Programming Cloud, is a general multi-paradigm programming language[3] developed by Wolfram Research. It was designed to be as general as possible and emphasizes symbolic computation, functional programming, and rule-based programming.[4] It can employ arbitrary structures and data.[4]	null	null	\N	No code example (yet).
666	Wyvern	Wyvern is a computer programming language for development of web and mobile applications. It aims to provide a way to safely use multiple programming languages within the same program so programmers can use the language most appropriate for each function while at the same time increasing the program's security.	null	null	http://www.cs.cmu.edu/~aldrich/wyvern/	No code example (yet).
667	X#	X# is a low-level programming language developed for the x86 processor architecture as a part of Cosmos operating system to make operating system development easier. X# is designed to bring some of C-like language syntax to assembly language. At the beginning, X# was an aid for debugging services of Cosmos. The X# compiler is an open source console interface program with an atypical architecture. It parses lines of code into tokens and compares them with patterns. Finally, matched X# code patterns are translated to intel syntax x86 assembly, usually for the NASM compiler. In first versions, X# operation was mostly 1:1 with assembly code, but hasn't been the reason why the X# compiler was written.	2009	null	\N	No code example (yet).
668	X++	Microsoft Dynamics AX is one of Microsoft's enterprise resource planning software products. It is part of the Microsoft Dynamics family.	null	7.0.1265.3015 / February 22, 2016 (2016-02-22)[1]	\N	// Hello World in X++ (Microsoft Axapta)\n\nclass classHelloWorld\n{\n}\n\nstatic void main(args Args)\n{\n    dialog   dialog;\n    ;\n    dialog = new dialog();\n    dialog.addText("Hello World!");\n    dialog.run();\n}
669	X10	X10 is a programming language being developed by IBM at the Thomas J. Watson Research Center as part of the Productive, Easy-to-use, Reliable Computing System (PERCS) project funded by DARPA's High Productivity Computing Systems (HPCS) program. Its primary authors are Kemal Ebcioğlu, Vijay Saraswat, and Vivek Sarkar.[1]	2004	2.5.4 / December 21, 2015; 4 months ago (2015-12-21)	http://x10-lang.org/	No code example (yet).
670	XBL	XBL (XML Binding Language) is an XML-based markup language used to declare the behavior and look of XUL-widgets and XML elements. Development of the XBL specification was abandoned by the W3C in 2012.	null	null	\N	No code example (yet).
671	XC	In computers, XC is a programming language for real-time embedded parallel processors, targeted at the XMOS XCore processor architecture.[1]	2005	null	\N	No code example (yet).
672	xHarbour	xHarbour is a free multi-platform extended Clipper compiler, offering multiple graphic terminals (GTs), including console drivers, GUIs, and hybrid console/GUIs. xHarbour is backward-compatible with Clipper and supports many language syntax extensions, greatly extended run-time libraries, and extensive third party support.	null	null	\N	No code example (yet).
673	XL	XL stands for eXtensible Language. It is the first and so far the only computer programming language designed to support concept programming.[1]	2000	0.1 / February 2010; 6 years ago (2010-02)	http://xlr.sf.net/	No code example (yet).
1	@Formula	The Formula language is a scripting language used by Lotus Notes.\r\n\nIt is often referred to as @Formula language (pronounced at-formula) because many language elements start with the @-character. Here is an example of a selection formula:	null	null	\N	No code example (yet).
2	A-0 System	The A-0 system (Arithmetic Language version 0), written by Grace Hopper in 1951 and 1952 for the UNIVAC I, was the first compiler ever developed for an electronic computer.[1] The A-0 functioned more as a loader or linker than the modern notion of a compiler. A program was specified as a sequence of subroutines and arguments. The subroutines were identified by a numeric code and the arguments to the subroutines were written directly after each subroutine code. The A-0 system converted the specification into machine code that could be fed into the computer a second time to execute the said program.	null	null	\N	No code example (yet).
18	Action!	Action! is a programming language and development environment with an integrated editor, compiler, and debugger for the Atari 8-bit family of computers. It was created by Clinton Parker, who had previously developed the Micro SPL language with Henry Baker,[1] and released on cartridge by Optimized Systems Software in 1983. Action! was used to develop at least two commercial products—the Homepak productivity suite and Games Computers Play client program—and numerous programs in ANALOG Computing and Antic magazines. The language was never ported to other systems.	null	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.126.6877	; Hello world in Action! programming language for the Atari 8-Bit computers\n\nPROC Main()\n PrintE("Hello World!")\nRETURN
19	ActionScript	ActionScript is an object-oriented programming language originally developed by Macromedia Inc. (since merged into Adobe Systems). It is a derivation of HyperTalk, the scripting language for HyperCard.[2] It is now a dialect of ECMAScript (meaning it is a superset of the syntax and semantics of the language more widely known as JavaScript), though it originally arose as a sibling, both being influenced by HyperTalk.	1998	3.0 / June 27, 2006 (2006-06-27)	\N	No code example (yet).
676	XPL	XPL is a programming language based on PL/I, a portable one-pass compiler written in its own language, and a parser generator tool for easily implementing similar compilers for other languages. XPL was designed in 1967 as a way to teach compiler design principles and as starting point for students to build compilers for their own languages.	null	null	\N	No code example (yet).
677	XPL0	XPL0 is a computer programming language that is essentially a cross between Pascal and C. It was created in 1976 by Peter J. R. Boyle who wanted a high-level language for his microcomputer and wanted something more sophisticated than BASIC, which was the dominant language for personal computers at the time.	null	null	\N	\\Hello World in XPL0\ncode Text=12;\nText(0, "Hello World!\n")
678	XQuery	XQuery is a query and functional programming language that queries and transforms collections of structured and unstructured data, usually in the form of XML, text and with vendor-specific extensions for other data formats (JSON, binary, etc.). The language is developed by the XML Query working group of the W3C. The work is closely coordinated with the development of XSLT by the XSL Working Group; the two groups share responsibility for XPath, which is a subset of XQuery.	2007	3.0/ April 8, 2014 (2014-04-08)[1]	http://www.w3.org/XML/Query/	(: Hello World with XQuery :)\nlet $i := "Hello World"\nreturn $i
679	XSB	XSB is the name of a dialect of the Prolog programming language and its implementation developed at Stony Brook University in collaboration with the Katholieke Universiteit Leuven, the New University of Lisbon, Uppsala University and software vendor XSB, Inc.	null	XSB Version 3.6 / April 22, 2015	\N	No code example (yet).
680	XSLT	XSLT (Extensible Stylesheet Language Transformations) is a language for transforming XML documents into other XML documents,[1] or other formats such as HTML for web pages, plain text or into XSL Formatting Objects, which may subsequently be converted to other formats, such as PDF, PostScript and PNG.[2]	1998	2	\N	<?xml version="1.0" encoding="UTF-8"?>\n<!-- Hello World in XSLT -->\n<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">\n    <xsl:template match="/">\n        <xsl:text>Hello World!</xsl:text>\n    </xsl:template>\n</xsl:stylesheet>
682	Yorick	Yorick is an interpreted programming language designed for numerics, graph plotting, and steering large scientific simulation codes. It is quite fast due to array syntax, and extensible via C or Fortran routines. It was created in 1996 by David H. Munro of Lawrence Livermore National Laboratory.	1996	2.2.04 / May 2015	\N	No code example (yet).
683	YQL	Yahoo! Query Language (YQL) is an SQL-like query language created by Yahoo! as part of their Developer Network. YQL is designed to retrieve and manipulate data from APIs through a single Web interface, thus allowing mashups that enable developers to create their own applications.[1]	null	null	\N	No code example (yet).
684	Z notation	The Z notation /ˈzɛd/ is a formal specification language used for describing and modelling computing systems. It is targeted at the clear specification of computer programs and computer-based systems in general.	null	null	\N	No code example (yet).
685	Zeno	Zeno (after pre-Socratic Greek philosopher Zeno of Elea) is an imperative procedural programming language designed to be easy to learn and user friendly. Zeno is generic in the sense that it contains most of the essential elements used in other languages to develop real applications.	null	null	\N	No code example (yet).
686	ZOPL	ZOPL is a programming language created by Geac Computer Corporation in the early 1970s for use on their mainframe computer systems used in libraries and banking institutions. It had similarities to C and Pascal.	null	null	\N	No code example (yet).
687	ZPL	ZPL (short for Z-level Programming Language) is an array programming language designed to replace C and C++ programming languages in engineering and scientific applications.[2] Because its design goal was to obtain cross-platform high performance, ZPL programs run fast on both sequential and parallel computers. Highly-parallel ZPL programs are simple and easy to write because it exclusively uses implicit parallelism.	1993 (1993)	null	http://www.cs.washington.edu/research/zpl/home/	No code example (yet).
20	Ada	Ada is a structured, statically typed, imperative, wide-spectrum, and object-oriented high-level computer programming language, extended from Pascal and other languages. It has built-in language support for design-by-contract, extremely strong typing, explicit concurrency, offering tasks, synchronous message passing, protected objects, and non-determinism. Ada improves code safety and maintainability by using the compiler to find errors in favor of runtime errors. Ada is an international standard; the current version (known as Ada 2012[7]) is defined by ISO/IEC 8652:2012.[8]	1980; 36 years ago (1980)	Ada 2012 TC1[1][2] / February 1, 2016; 3 months ago (2016-02-01)	http://www.adaic.org/	-- Hello World in Ada\n\nwith Text_IO;\nprocedure Hello_World is\n\nbegin\n  Text_IO.Put_Line("Hello World!");\nend Hello_World;
35	Amiga E	Amiga E, or very often simply E, is a programming language created by Wouter van Oortmerssen on the Amiga. He has since moved on to develop the SHEEP programming language for the new AmigaDE platform and the CryScript language (also known as DOG) used during the development of the video game Far Cry.	null	null	\N	No code example (yet).
37	AMPL	A Mathematical Programming Language (AMPL) is an algebraic modeling language to describe and solve high-complexity problems for large-scale mathematical computing (i.e., large-scale optimization and scheduling-type problems).[1] It was developed by Robert Fourer, David Gay, and Brian Kernighan at Bell Laboratories. AMPL supports dozens of solvers, both open source and commercial software, including CBC, CPLEX, FortMP, Gurobi, MINOS, IPOPT, SNOPT, KNITRO, and LGO. Problems are passed to solvers as nl files. AMPL is used by more than 100 corporate clients, and by government agencies and academic institutions.[2]	1985; 31 years ago (1985)	20131012 / October 12, 2013; 2 years ago (2013-10-12)	http://www.ampl.com/	No code example (yet).
48	ATS	ATS (Applied Type System) is a programming language designed to unify programming with formal specification. ATS has support for combining theorem proving with practical programming through the use of advanced type systems.[1] The performance of ATS has been demonstrated to be comparable to that of the C and C++ programming languages.[2] By using theorem proving and strict type checking, the compiler can detect and prove that its implemented functions are not susceptible to bugs such as division by zero, memory leaks, buffer overflow, and other forms of memory corruption by verifying pointer arithmetic and reference counting before the program compiles. Additionally, by using the integrated theorem-proving system of ATS (ATS/LF), the programmer may make use of static constructs that are intertwined with the operative code to prove that a function attains its specification.	null	ATS2-0.2.5 / 2015-12-22	\N	// Hello world in ATS\n\nimplement main () = begin\n  print ("Hello, world!"); print_newline ()\nend
51	AutoIt	AutoIt /ɔːtoʊ ɪt/[2] is a freeware automation language for Microsoft Windows. In its earliest release, the software was primarily intended to create automation scripts (sometimes called macros) for Microsoft Windows programs[3] but has since grown to include enhancements in both programming language design and overall functionality.	null	3.3.14.2 / September 18, 2015; 7 months ago (2015-09-18)[1]	http://www.autoitscript.com/	No code example (yet).
55	Axum	Axum (previously codenamed Maestro) is a domain specific concurrent programming language, based on the Actor model, that was under active development by Microsoft[1] between 2009 and 2011.[2] It is an object-oriented language based on the .NET Common Language Runtime using a C-like syntax which, being a domain-specific language, is intended for development of portions of a software application that is well-suited to concurrency. But it contains enough general-purpose constructs that one need not switch to a general-purpose programming language (like C#) for the sequential parts of the concurrent components.[1]	5/8/2009	Community Technology Preview / May 8, 2009 (2009-05-08)	\N	No code example (yet).
58	Bash	Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell.[6][7] Released in 1989,[8] it has been distributed widely as the shell for the GNU operating system and as a default shell on Linux and OS X. Microsoft announced during the 2016 Build Conference that Windows 10 has added a Linux subsystem that fully supports Bash and other Ubuntu binaries running natively in Windows.[9] In the past, and currently, it has also ported to Microsoft Windows and distributed with Cygwin and MinGW, to DOS by the DJGPP project, to Novell NetWare and to Android via various terminal emulation applications. In the late 1990s, Bash was a minor player among multiple commonly used shells; at present Bash has overwhelming favor.[citation needed]	null	4.3.42 / August 13, 2015; 8 months ago (2015-08-13)[1]	https://www.gnu.org/software/bash/	No code example (yet).
69	BLISS	BLISS is a system programming language developed at Carnegie Mellon University by W. A. Wulf, D. B. Russell, and A. N. Habermann around 1970. It was perhaps the best known systems programming language right up until C made its debut a few years later. Since then, C took off and BLISS faded into obscurity. When C was in its infancy, a few projects within Bell Labs were debating the merits of BLISS vs. C[citation needed].	1970	BLISS-64	\N	No code example (yet).
72	Blue	Blue is a system for teaching object-oriented programming, developed at the University of Sydney, Australia. It is an integrated development environment (IDE) and a programming language. Blue has been used for teaching since 1997. The development was stopped in 1999 when one of its principals, Michael Kölling, began applying the IDE design to the Java programming language, resulting in BlueJ.	null	null	http://www.cs.kent.ac.uk/people/staff/mik/blue/	No code example (yet).
82	C#	C#[note 2] (pronounced as see sharp) is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines. It was developed by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.	2000; 16 years ago (2000)	6.0 / July 20, 2015; 9 months ago (2015-07-20)	http://msdn.microsoft.com/pt-br/vcsharp/default.aspx	//Hello World in C#\nclass HelloWorld\n{\n    static void Main()\n    {\n        System.Console.WriteLine("Hello, World!");\n    }\n}
86	Cayenne	Haskell /ˈhæskəl/[26] is a standardized, general-purpose purely functional programming language, with non-strict semantics and strong static typing.[27] It is named after logician Haskell Curry.[1] The latest standard of Haskell is Haskell 2010. As of May 2016[update], a group is working on the next version, Haskell 2020.[28]	1990; 26 years ago (1990)[1]	Haskell 2010[2] / July 2010; 5 years ago (2010-07)	http://haskell.org/	No code example (yet).
89	Cel	Cel is an object-oriented prototype-based programming language based on Self which was heavily influenced by Smalltalk. The goal was to create a version of Self that would run under a lot of operating systems without strong ties to the Self GUI for development. For example, one could create a simple command line application in Cel without the high-overhead of the Self-system.	1998	0.8.5 / February 24, 2002	\N	No code example (yet).
100	Chef	An esoteric programming language (sometimes shortened to esolang) is a programming language designed to test the boundaries of computer programming language design, as a proof of concept, as software art, as a hacking interface to another language (particularly functional programming or procedural programming languages), or as a joke. The use of esoteric distinguishes these languages from programming languages that working developers use to write software. Usually, an esolang's creators do not intend the language to be used for mainstream programming, although some esoteric features, such as visuospatial syntax,[1] have inspired practical applications in the arts. Such languages are often popular among hackers and hobbyists.	null	null	\N	Hello World Souffle.\n\nThis recipe prints the immortal words "Hello world!", in a basically brute force\nway. It also makes a lot of food for one person.\n\nIngredients.\n72 g haricot beans\n101 eggs\n108 g lard\n111 cups oil\n32 zucchinis\n119 ml water\n114 g red salmon\n100 g dijon mustard\n33 potatoes\n\nMethod.\nPut potatoes into the mixing bowl. Put dijon mustard into the mixing bowl. Put\nlard into the mixing bowl. Put red salmon into the mixing bowl. Put oil into\nthe mixing bowl. Put water into the mixing bowl. Put zucchinis into the mixing\nbowl. Put oil into the mixing bowl. Put lard into the mixing bowl. Put lard\ninto the mixing bowl. Put eggs into the mixing bowl. Put haricot beans into\nthe mixing bowl. Liquefy contents of the mixing bowl. Pour contents of the\nmixing bowl into the baking dish.\n\nServes 1.
513	Pure	Pure is a dynamically typed, functional programming language based on term rewriting. It has facilities for user-defined operator syntax, macros, multiple-precision numbers, and compilation to native code through the LLVM. It is the successor to the Q programming language.	2008 (2008)	null	http://purelang.bitbucket.org/	No code example (yet).
103	chomski	chomski virtual machine (named after the noted linguist Noam Chomsky) and pp (the pattern parser) refer to both a command line computer language and utility (interpreter for that language) which can be used to parse and transform text patterns. The utility reads input files character by character (sequentially), applying the operation which has been specified via the command line or a pp script, and then outputs the line. It was developed from 2006 as a Unix and Windows utility, and is available today for Windows and Linux systems. Pp has derived a number of ideas and syntax elements from Sed, a command line text stream editor.	2007	null	\N	No code example (yet).
104	ChucK	ChucK is a concurrent, strongly timed audio programming language for real-time synthesis, composition, and performance,[2] which runs on Linux, Mac OS X, Microsoft Windows, and iOS. It is designed to favor readability and flexibility for the programmer over other considerations such as raw performance. It natively supports deterministic concurrency and multiple, simultaneous, dynamic control rates. Another key feature is the ability to live code; adding, removing, and modifying code on the fly, while the program is running, without stopping or restarting. It has a highly precise timing/concurrency model, allowing for arbitrarily fine granularity. It offers composers and researchers a powerful and flexible programming tool for building and experimenting with complex audio synthesis programs, and real-time interactive control.[3]	2003[1]	1.3.5.2 / October 24, 2015 (2015-10-24)	\N	No code example (yet).
118	COBOL	COBOL (/ˈkoʊbɒl/, an acronym for common business-oriented language) is a compiled English-like computer programming language designed for business use. It is imperative, procedural and, since 2002, object-oriented. COBOL is primarily used in business, finance, and administrative systems for companies and governments. COBOL is still widely used in legacy applications deployed on mainframe computers, such as large-scale batch and transaction processing jobs. But due to its declining popularity and the retirement of experienced COBOL programmers, programs are being migrated to new platforms, rewritten in modern languages or replaced with software packages.[6] Most programming in COBOL is now purely to maintain existing applications.[7]	1959; 57 years ago (1959)	ISO/IEC 1989:2014 / 2014	http://cobolstandard.info/	       * Hello World in COBOL\n\n*****************************\nIDENTIFICATION DIVISION.\nPROGRAM-ID. HELLO.\nENVIRONMENT DIVISION.\nDATA DIVISION.\nPROCEDURE DIVISION.\nMAIN SECTION.\nDISPLAY "Hello World!"\nSTOP RUN.\n****************************
128	Common Intermediate Language	Common Intermediate Language (CIL, pronounced either "sil" or "kil"), formerly called Microsoft Intermediate Language or MSIL, is the lowest-level human-readable programming language defined by the Common Language Infrastructure (CLI) specification and is used by the .NET Framework and Mono. Languages which target a CLI-compatible runtime environment compile to CIL, which is assembled into an object code that has a bytecode-style format. CIL is an object-oriented assembly language, and is entirely stack-based. Its bytecode is translated into native code or — most commonly — executed by a virtual machine.	null	null	\N	No code example (yet).
135	Coq	In computer science, Coq is an interactive theorem prover. It allows the expression of mathematical assertions, mechanically checks proofs of these assertions, helps to find formal proofs, and extracts a certified program from the constructive proof of its formal specification. Coq works within the theory of the calculus of inductive constructions, a derivative of the calculus of constructions. Coq is not an automated theorem prover but includes automatic theorem proving tactics and various decision procedures.	1984[1]	8.5 / January 2016 (2016-01)	https://coq.inria.fr/	No code example (yet).
143	CSP	In computer science, communicating sequential processes (CSP) is a formal language for describing patterns of interaction in concurrent systems.[1] It is a member of the family of mathematical theories of concurrency known as process algebras, or process calculi, based on message passing via channels. CSP was highly influential in the design of the occam programming language,[1][2] and also influenced the design of programming languages such as Limbo[3] and Go.[4]	null	null	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.45.3212	No code example (yet).
144	CUDA	CUDA is a parallel computing platform and application programming interface (API) model created by NVIDIA.[1] It allows software developers to use a CUDA-enabled graphics processing unit (GPU) for general purpose processing – an approach known as GPGPU. The CUDA platform is a software layer that gives direct access to the GPU's virtual instruction set and parallel computational elements, for the execution of compute kernels.[2]	null	7.5 / September 8, 2015; 8 months ago (2015-09-08)	http://www.nvidia.com/object/cuda_home_new.html	// Hello world in CUDA\n\n#include <stdio.h>\n \nconst int N = 16; \nconst int blocksize = 16; \n \n__global__ \nvoid hello(char *a, int *b) \n{\n a[threadIdx.x] += b[threadIdx.x];\n}\n \nint main()\n{\n char a[N] = "Hello \\0\\0\\0\\0\\0\\0";\n int b[N] = {15, 10, 6, 0, -11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};\n \n char *ad;\n int *bd;\n const int csize = N*sizeof(char);\n const int isize = N*sizeof(int);\n \n printf("%s", a);\n \n cudaMalloc( (void**)&ad, csize ); \n cudaMalloc( (void**)&bd, isize ); \n cudaMemcpy( ad, a, csize, cudaMemcpyHostToDevice ); \n cudaMemcpy( bd, b, isize, cudaMemcpyHostToDevice ); \n \n dim3 dimBlock( blocksize, 1 );\n dim3 dimGrid( 1, 1 );\n hello<<<dimGrid, dimBlock>>>(ad, bd);\n cudaMemcpy( a, ad, csize, cudaMemcpyDeviceToHost ); \n cudaFree( ad );\n cudaFree( bd );\n \n printf("%s\\n", a);\n return EXIT_SUCCESS;\n}
154	DATATRIEVE	DATATRIEVE is a database query and report writer tool from Hewlett-Packard. It runs on the OpenVMS operating system, as well as several PDP-11 operating systems. DATATRIEVE's command structure is nearly plain English, and it is an early example of a Fourth Generation Language (4GL). It works against flat files, indexed files, and databases. Such data files are delimited using record definitions stored in the Common Data Dictionary (CDD), or in RMS files. DATATRIEVE is used at many OpenVMS installations.	null	7.3	\N	No code example (yet).
157	DCL	DIGITAL Command Language (DCL) is the standard command language adopted by most of the operating systems (OSs) that were sold by the former Digital Equipment Corporation (which was acquired by Compaq, which was in turn acquired by Hewlett-Packard). It had its roots in the IAS, TOPS-20, and RT-11 OSs and was implemented as a standard across most of Digital's OSs, notably RSX-11, but took its most powerful form in the OpenVMS OS.	null	null	\N	$! Hello world in Digital/Compaq/HP DCL (Digital Command Language)\n$ write sys$output "Hello World"
165	Dylan	Dylan /ˈdɪlən/ is a multi-paradigm programming language that includes support for functional and object-oriented programming, and is dynamic and reflective while providing a programming model designed to support efficient machine code generation, including fine-grained control over dynamic and static behaviors. It was created in the early 1990s by a group led by Apple Computer.	1992; 24 years ago (1992)	2014.1	http://opendylan.org/	module:   hello-world\nauthor:   Homer\ncopyright:  (c) 1994 Homer\nversion:  1.0\n\n// Hello World in DYLAN\n\ndefine method main (#rest args)\n  princ("Hello world!");\nend;\n\nmain();
175	EGL	EGL (Enterprise Generation Language), originally developed by IBM and now available as the EDT (EGL Development Tools) Open Source project under the Eclipse Public License (EPL), is a programming technology designed to meet the challenges of modern, multi-platform application development by providing a common language and programming model across languages, frameworks, and runtime platforms. The language borrows concepts familiar to anyone using statically typed languages like Java, COBOL, C, etc. However, it borrows the concept of stereotype from Unified Modeling Language (UML) that is not typically found in statically typed programming languages.	null	null	\N	No code example (yet).
180	Emacs Lisp	Emacs Lisp is a dialect of the Lisp programming language used by the GNU Emacs and XEmacs text editors (which this article will refer to collectively as "Emacs"). It is used for implementing most of the editing functionality built into Emacs, the remainder being written in C (as is the Lisp interpreter itself). Emacs Lisp is also referred to as Elisp, although there is also an older, unrelated Lisp dialect with that name.	null	null	\N	No code example (yet).
189	Euclid	Euclid is an imperative programming language for writing verifiable programs. It was designed by Butler Lampson and associates at the Xerox PARC lab in the mid-1970s. The implementation was led by Ric Holt at the University of Toronto and James Cordy was the principal programmer for the first implementation of the compiler. It was originally designed for the Motorola 6809 microprocessor. It was considered innovative for the time; the compiler development team had a $2 million budget over 2 years and was commissioned by the Defense Advanced Research Projects Agency of the U.S. Department of Defense and the Canadian Department of National Defence. It was used for a few years at I. P. Sharp Associates, MITRE Corporation, SRI International and various other international institutes for research in systems programming and secure software systems.	1970s	null	\N	No code example (yet).
194	Executable UML	Executable UML (xtUML or xUML) is both a software development method and a highly abstract software language. The language "combines a subset of the UML (Unified Modeling Language) graphical notation with executable semantics and timing rules."[1] The Executable UML method is the successor to the Shlaer–Mellor method.[2]	null	null	\N	No code example (yet).
195	F	F is a module-oriented, compiled and numeric computer programming language. F is designed for scientific programming and scientific computation.[1] F was developed by the Fortran Company and was developed as a modern Fortran thus making it a subset of Fortran 95 and Fortran 90[2] programming language. It combines both numerical features and data abstraction features from these languages. F is also backwards compatible with Fortran 77, thus allowing to make calls to Fortran 77 programs. F uses the g95 compiler, which is the same compiler used for Fortran 95. F compilers are readily available on both Windows and various Linux Operating Systems free of charge or can be as part of a bundle from the Fortran Store.	null	null	\N	! Hello world in F\n\nprogram hello\n   print *, "Hello world!"\nend program hello
212	Forth	Forth is an imperative stack-based computer programming language and environment originally designed by Charles "Chuck" Moore. Language features include structured programming, reflection (the ability to modify the program structure during program execution), concatenative programming (functions are composed with juxtaposition) and extensibility (the programmer can create new commands). Although not an acronym, the language's name is sometimes spelled with all capital letters as FORTH, following the customary usage during its earlier years.	1970; 46 years ago (1970)	null	\N	' Hello world in Forth\n\n." Hello World" CR
213	Fortran	Fortran (formerly FORTRAN, derived from "Formula Translation"[2]) is a general-purpose, imperative programming language that is especially suited to numeric computation and scientific computing. Originally developed by IBM[3] in the 1950s for scientific and engineering applications, Fortran came to dominate this area of programming early on and has been in continuous use for over half a century in computationally intensive areas such as numerical weather prediction, finite element analysis, computational fluid dynamics, computational physics and computational chemistry. It is a popular language for high-performance computing[4] and is used for programs that benchmark and rank the world's fastest supercomputers.[5]	1957; 59 years ago (1957)	Fortran 2008 (ISO/IEC 1539-1:2010) / 2010; 6 years ago (2010)	\N	C     Hello World in Fortran\n\n      PROGRAM HELLO\n      WRITE (*,100)\n      STOP\n  100 FORMAT (' Hello World! ' /)\n      END
215	FoxBase	Visual FoxPro is a data-centric, object-oriented, procedural, programming language produced by Microsoft. It is derived from FoxPro (originally known as FoxBASE) which was developed by Fox Software beginning in 1984. It contained the fastest PC-based database engine available at the time. Fox Technologies merged with Microsoft in 1992, after which the software acquired further features and the prefix "Visual". The database engine became known as the Microsoft Jet Database Engine which was used by Microsoft Access. The last version, (FoxPro 2.6) worked on Mac OS, DOS, Windows, and Unix: Visual FoxPro 3.0, the first "Visual" version, reduced platform support to only Mac[6] and Windows, and later versions were Windows-only. The current version of Visual FoxPro is COM-based and Microsoft has stated that they do not intend to create a Microsoft .NET version.	null	null	http://msdn.microsoft.com/vfoxpro	No code example (yet).
222	G-code	G-code (also RS-274), which has many variants, is the common name for the most widely used numerical control (NC) programming language. It is used mainly in computer-aided manufacturing to control automated machine tools. G-code is sometimes called G programming language, not to be confused with LabVIEW's G programming language.	1950s (first edition)	null	\N	%\nO1000\n(PROGRAM NAME - HELLOWORLD)\n(DATE=DD-MM-YY - 30-06-05 TIME=HH:MM - 19:37)\nN10G20\nN20G0G17G40G49G80G90\n/N30G91G28Z0.\n/N40G28X0.Y0.\n/N50G92X0.Y0.Z0.\n( 1/16 FLAT ENDMILL TOOL - 1 DIA. OFF. - 1 LEN. - 1 DIA. - .0625)\n(CONTOUR)\nN60T1M6\nN70G0G90X0.Y1.A0.S5000M3\nN80G43H1Z.5\nN90Z.25\nN100G1Z-.005F2.\nN110Y0.F20.\nN120G0Z.5\nN130X.5\nN140Z.25\nN150G1Z-.005F2.\nN160Y1.F20.\nN170G0Z.5\nN180Y.6106\nN190Z.25\nN200G1Z-.005F2.\nN210X0.F20.\nN220G0Z.5\nN230X.6157Y.4712\nN240Z.25\nN250G1Z-.005F2.\nN260X.6039Y.4135F20.\nN270X.6Y.351\nN280X1.1\nN290G3X1.0098Y.6202R.4333\nN300X.8941Y.6971R.2625\nN310X.7255Y.6538R.1837\nN320X.6157Y.4712R.332\nN330G0Z.5\nN340X.6Y.351\nN350Z.25\nN360G1Z-.005F2.\nN370X.6039Y.2885F20.\nN380G3X.7255Y.0481R.385\nN390X.9745R.1853\nN400X1.0843Y.2308R.332\nN410G0Z.5\nN420X1.2039Y0.\nN430Z.25\nN440G1Z-.005F2.\nN450Y1.F20.\nN460G0Z.5\nN470X1.3098\nN480Z.25\nN490G1Z-.005F2.\nN500Y0.F20.\nN510G0Z.5\nN520X1.4706Y.125\nN530Z.25\nN540G1Z-.005F2.\nN550X1.502Y.0817F20.\nN560G3X1.6176Y.0048R.2625\nN570X1.7863Y.0481R.1837\nN580X1.9118Y.351R.3957\nN590X1.8216Y.6202R.4333\nN600X1.7059Y.6971R.2625\nN610X1.5373Y.6538R.1837\nN620X1.4157Y.4135R.358\nN630X1.4706Y.125R.4611\nN640G0Z.5\nN650X1.9853Y0.\nN660Z.25\nN670G1Z-.005F2.\nN680X2.0422Y.1442F20.\nN690G0Z.5\nN700X2.5706Y1.\nN710Z.25\nN720G1Z-.005F2.\nN730X2.6961Y0.F20.\nN740X2.8216Y1.\nN750X2.9451Y0.\nN760X3.0706Y1.\nN770G0Z.5\nN780X3.2961Y.6538\nN790Z.25\nN800G1Z-.005F2.\nN810X3.2608Y.6202F20.\nN820G3X3.1745Y.2885R.4408\nN830X3.2961Y.0481R.385\nN840X3.5451R.1853\nN850X3.6706Y.351R.3957\nN860X3.5804Y.6202R.4333\nN870X3.4647Y.6971R.2625\nN880X3.2961Y.6538R.1837\nN890G0Z.5\nN900X3.7461Y.7019\nN910Z.25\nN920G1Z-.005F2.\nN930Y0.F20.\nN940G0Z.5\nN950Y.3654\nN960Z.25\nN970G1Z-.005F2.\nN980X3.7637Y.4663F20.\nN990G2X3.8422Y.6587R.4948\nN1000X3.9167Y.7019R.0929\nN1010G1X4.0755\nN1020G2X4.15Y.6587R.0929\nN1030X4.1951Y.5769R.246\nN1040G0Z.5\nN1050X4.3255Y1.\nN1060Z.25\nN1070G1Z-.005F2.\nN1080Y0.F20.\nN1090G0Z.5\nN1100X4.9275\nN1110Z.25\nN1120G1Z-.005F2.\nN1130Y1.F20.\nN1140G0Z.5\nN1150X5.0314\nN1160Z.25\nN1170G1Z-.005F2.\nN1180Y.2981F20.\nN1190G0Z.5\nN1200X4.9275Y.274\nN1210Z.25\nN1220G1Z-.005F2.\nN1230X4.8941Y.1731F20.\nN1240G2X4.7627Y.0192R.3255\nN1250X4.5529Y.0481R.1862\nN1260X4.4314Y.2885R.358\nN1270X4.5176Y.6202R.4408\nN1280X4.6333Y.6971R.2625\nN1290X4.802Y.6538R.1837\nN1300X4.8941Y.5288R.3457\nN1310G1X4.9275Y.4279\nN1320G0Z.5\nN1330X5.0314Y.149\nN1340Z.25\nN1350G1Z-.005F2.\nN1360Y0.F20.\nN1370G0Z.5\nN1380M5\nN1390G91G28Z0.\nN1400G28X0.Y0.A0.\nN1410M30\n%
234	Go	Go (often referred to as golang) is an open source[12][clarification needed] programming language created at Google[13] in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson.[10] It is a compiled, statically typed language in the tradition of Algol and C, with garbage collection, limited structural typing,[3] memory safety features and CSP-style concurrent programming features added.[14]	November 10, 2009; 6 years ago (2009-11-10)	1.6.2 / 20 April 2016; 26 days ago (2016-04-20)[2]	https://golang.org/	// Hello world in Go\n\npackage main\nimport "fmt"\nfunc main() {\n fmt.Printf("Hello World\\n")\n}
240	GOM (Good Old Mad)	MAD (Michigan Algorithm Decoder) is a programming language and compiler for the IBM 704 and later the IBM 709, IBM 7090, IBM 7040, UNIVAC 1107, UNIVAC 1108, Philco 210-211, and eventually the IBM S/370 mainframe computers. Developed in 1959 at the University of Michigan by Bernard Galler, Bruce Arden and Robert M. Graham, MAD is a variant of the ALGOL language. It was widely used to teach programming at colleges and universities during the 1960s and played a minor role in the development of CTSS, Multics, and the Michigan Terminal System computer operating systems.[1]	1959	null	\N	No code example (yet).
242	Gosu	Gosu is a statically-typed programming language that runs on the Java Virtual Machine released under the Apache 2.[1] This general-purpose programming language is used in several open-source software projects including SparkGS and Ragnar DB among several others, and is widely used in the insurance industry via Guidewire Software's commercial products.[1][2] The language borrows from several existing languages including Java, C#, and ECMAScript. A notable and unique feature is its Open Type System, which allows the language to be easily extended to provide compile-time checking and IDE awareness of information that is typically checked only at runtime in most other languages. Also of note is the language's ability to serve as both a full-featured general purpose language and as a concise scripting language. For instance, Gosu has free-form Program types (.gsp files) for scripting as well as statically verified Template files (.gst files). Gosu can optionally execute these and all other types directly from source without precompilation, which also distinguishes it from other static languages.	null	1.10.1 / January 15, 2016; 3 months ago (2016-01-15)	http://gosu-lang.org/	No code example (yet).
250	Hamilton C shell	Hamilton C shell is a clone of the Unix C shell and utilities[1][2] for Microsoft Windows created by Nicole Hamilton[3] at Hamilton Laboratories as a completely original work, not based on any prior code. It was first released on OS/2 on December 12, 1988[4][5][6][7][8][9] and on Windows NT in July 1992.[10][11][12] The OS/2 version was discontinued in 2003 but the Windows version continues to be actively supported.	null	5.2 / September 15, 2014; 18 months ago (2014-09-15)	http://www.hamiltonlabs.com/Cshell.htm	No code example (yet).
255	High Level Assembly	High Level Assembly (HLA) is an assembly language developed by Randall Hyde. It allows the use of higher-level language constructs to aid both beginners and advanced assembly developers. It fully supports advanced data types and object-oriented assembly language programming. It uses a syntax loosely based on several high-level languages (HLL), such as Pascal, Ada, Modula-2, and C++, to allow creating readable assembly language programs, and to allow HLL programmers to learn HLA as fast as possible.	null	null	http://webster.cs.ucr.edu/	No code example (yet).
260	Hugo	Interactive fiction, often abbreviated IF, is software simulating environments in which players use text commands to control characters and influence the environment. Works in this form can be understood as literary narratives, either in the form of Interactive narratives or Interactive narrations. These works can also be understood as a form of video game,[1] either in the form of an adventure game or role-playing game. In common usage, the term refers to text adventures, a type of adventure game where the entire interface can be "text-only",[2] however, Graphical text adventure games, where the text is accompanied by graphics (still images, animations or video) still fall under the text adventure category if the main way to interact with the game is by typing text. Some users of the term distinguish between interactive fiction, known as "Puzzle-free", that focuses on narrative, and "text adventures" that focus on puzzles.	null	null	\N	No code example (yet).
266	IBM RPG	RPG is a high-level programming language (HLL) for business applications. RPG is an IBM proprietary programming language and its later versions are only available on IBM i or OS/400 based systems.[1]	1959	RPG IV version 7 release 2 / May 2, 2014 (2014-05-02)	\N	No code example (yet).
267	ICI	ICI is a general purpose interpreted, computer programming language originally developed by Tim Long in the late 1980s. It has dynamic typing and flexible data types, with the basic syntax, flow control constructs and operators of C. It can be considered broadly similar to Perl, with which it is roughly contemporary. Like Perl, it also has tight integration with regular expressions.	null	null	\N	No code example (yet).
580	Small Basic	Microsoft Small Basic is a programming language and associated IDE. It is Microsoft's simplified variant of the BASIC programming language, intended as an easy programming language for beginners. The associated IDE provides a simplified programming environment with functionality such as syntax highlighting, intelligent code completion, and in-editor documentation access.[5] The language has only 14 keywords.[6]	October 23, 2008; 7 years ago (2008-10-23)[1][2]	v1.2 / October 1, 2015; 7 months ago (2015-10-01)[3]	http://www.smallbasic.com/	No code example (yet).
273	Inform	Inform is a programming language and design system for interactive fiction originally created in 1993 by Graham Nelson. Inform can generate programs designed for the Z-code or Glulx virtual machines. Versions 1 through 5 were released between 1993 and 1996. Around 1996, Nelson rewrote Inform from first principles to create version 6 (or Inform 6).[2] Over the following decade, version 6 became reasonably stable and a popular language for writing interactive fiction. In 2006, Nelson released Inform 7 (briefly known as Natural Inform), a completely new language based on principles of natural language and a new set of tools based around a book-publishing metaphor.	1993	7 6L02 / May 7, 2014 (2014-05-07)[1]	\N	!  "Hello world" in Inform\n[ Main;\n  print "Hello world^";\n];
286	JAL	JAL (Just Another Language) is a Pascal-like programming language and compiler that generates executable code for PIC microcontrollers. It is a free-format language with a compiler that runs on Linux, MS-Windows and MS-DOS (OSX support). It is configurable and extendable through the use of libraries and can even be combined with PIC assembly language.	null	null	\N	No code example (yet).
288	Janus (time-reversible computing programming language)	Janus is a time-reversible programming language written at Caltech in 1982.[1] The operational semantics of the language were formally specified, together with a program inverter and an invertible self-interpreter, in 2007 by Tetsuo Yokoyama and Robert Glück.[2] A Janus inverter and interpreter is made freely available by the TOPPS research group at DIKU.[3] The below summarises the language presented in the 2007 paper.	1982, 2007	null	\N	No code example (yet).
290	Java	Java is a general-purpose computer programming language that is concurrent, class-based, object-oriented,[13] and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers "write once, run anywhere" (WORA),[14] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[15] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of computer architecture. As of 2016, Java is one of the most popular programming languages in use,[16][17][18][19] particularly for client-server web applications, with a reported 9 million developers.[citation needed] Java was originally developed by James Gosling at Sun Microsystems (which has since been acquired by Oracle Corporation) and released in 1995 as a core component of Sun Microsystems' Java platform. The language derives much of its syntax from C and C++, but it has fewer low-level facilities than either of them.	May 23, 1995; 20 years ago (1995-05-23)[1]	null	http://java.net/	// Hello World in Java\n\nclass HelloWorld {\n  static public void main( String args[] ) {\n    System.out.println( "Hello World!" );\n  }\n}
302	Julia	Julia is a high-level dynamic programming language designed to address the requirements of high-performance numerical and scientific computing while also being effective for general-purpose programming,[11][12][13][14] web use[15][16] or as a specification language.[17] Distinctive aspects of Julia's design include a type system with parametric types in a fully dynamic programming language and multiple dispatch as its core programming paradigm. It allows concurrent, parallel and distributed computing, and direct calling of C and Fortran libraries without glue code. Julia is garbage-collected,[18] uses eager evaluation and includes efficient libraries for floating-point calculations, linear algebra, random number generation, fast Fourier transforms and regular expression matching.	2012; 4 years ago (2012)[4]	0.4.5 / 0.3.12[5] / 18 March 2016; 59 days ago (2016-03-18)[6]	http://julialang.org/	# Hello world in Julia\n\nprintln("Hello, World!")
309	KIF	Knowledge Interchange Format (KIF) is a computer language designed to enable systems to share and re-use information from knowledge-based systems. KIF is similar to frame languages such as KL-One and LOOM but unlike such language its primary role is not intended as a framework for the expression or use of knowledge but rather for the interchange of knowledge between systems. The designers of KIF likened it to PostScript. PostScript was not designed primarily as a language to store and manipulate documents but rather as an interchange format for systems and devices to share documents. In the same way KIF is meant to facilitate sharing of knowledge across different systems that use different languages, formalisms, platforms, etc.	null	null	\N	No code example (yet).
322	Ladder	Ladder logic was originally a written method to document the design and construction of relay racks as used in manufacturing and process control.[1][2] Each device in the relay rack would be represented by a symbol on the ladder diagram with connections between those devices shown. In addition, other items external to the relay rack such as pumps, heaters, and so forth would also be shown on the ladder diagram. See relay logic.	null	null	\N	No code example (yet).
325	Lasso	Lasso is an application server and server management interface used to develop internet applications and is a general-purpose, high-level programming language. Originally a web datasource connection tool,[1] for Filemaker and later included in Apple Computer's FileMaker 4.0 and Claris Homepage as CDML,[2][3] it has since evolved into a complex language used to develop and serve large-scale internet applications and web pages.	1995; 21 years ago (1995)	9.3.1 / October 23, 2015; 6 months ago (2015-10-23)	http://www.lassosoft.com/	// Hello world in Lasso\n\nHello world!
336	Lingo	Lingo is a verbose object-oriented (OO) scripting language developed by John H. Thompson for use in Adobe Director (formerly Macromedia Director). Lingo is used to develop desktop application software, interactive kiosks, CD-ROMs and Adobe Shockwave content.[1][2]	null	null	http://www.adobe.com/support/director/lingo.html	Hello World in Lingo (Macromedia Director)\n\non startmovie\n  alert "Hello World" \nend
340	Lisp	Lisp (historically, LISP) is a family of computer programming languages with a long history and a distinctive, fully parenthesized prefix notation.[1] Originally specified in 1958, Lisp is the second-oldest high-level programming language in widespread use today; only Fortran is older (by one year).[2][3] Lisp has changed a great deal since its early days, and a number of dialects have existed over its history. Today, the most widely known general-purpose Lisp dialects are Common Lisp and Scheme.	1958	null	\N	No code example (yet).
343	Little b	Little b is a domain-specific programming language, more specifically, a modeling language, designed to build modular mathematical models of biological systems. It was designed and authored by Aneil Mallavarapu. Little b is being developed in the Virtual Cell Program at Harvard Medical School, headed by mathematician Jeremy Gunawardena.	2004	1.6.0 / September 6, 2008 (2008-09-06)	\N	No code example (yet).
603	SuperCollider	SuperCollider is an environment and programming language originally released in 1996 by James McCartney for real-time audio synthesis and algorithmic composition.[2][3]	null	3.7.0 / March 2016; 2 months ago (2016-03)	http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.186.9817	// Hello World in SuperCollider\n\n"Hello, world!".postln;
346	Logo	Logo is an educational programming language, designed in 1967 by Daniel G. Bobrow, Wally Feurzeig, Seymour Papert and Cynthia Solomon. Today the language is remembered mainly for its use of "turtle graphics", in which commands for movement and drawing produced line graphics either on screen or with a small robot called a "turtle". The language was originally conceived to teach concepts of programming related to Lisp and only later to enable what Papert called "body-syntonic reasoning" where students could understand (and predict and reason about) the turtle's motion by imagining what they would do if they were the turtle. There are substantial differences among the many dialects of Logo, and the situation is confused by the regular appearance of turtle graphics programs that mistakenly call themselves Logo.	1967; 49 years ago (1967)	null	\N	; Hello World in Logo\n\nDRUCKEZEILE [Hello World!]
363	make	In software development, Make is a build automation tool that automatically builds executable programs and libraries from source code by reading files called Makefiles which specify how to derive the target program. Though integrated development environments and language-specific compiler features can also be used to manage a build process, Make remains widely used, especially in Unix.	null	null	\N	# Hello world as a makefile\n\nall:\n    @echo "Hello world!"
365	MAPPER	MAPPER (MAintain, Prepare, and Produce Executive Reports) is a database management and processing system. It is a software tool that enables end-users to share computer power in a corporation. Users are able to develop their own applications and process them interactively. The product has a number of unique characteristics that may appear technically impossible to persons unfamiliar with its method of operation.	null	null	\N	No code example (yet).
374	MaxScript	Autodesk 3ds Max, formerly 3D Studio, then 3D Studio Max is a professional 3D computer graphics program for making 3D animations, models, games and images. It is developed and produced by Autodesk Media and Entertainment.[2] It has modeling capabilities, a flexible plugin architecture and can be used on the Microsoft Windows platform. It is frequently used by video game developers, many TV commercial studios and architectural visualization studios. It is also used for movie effects and movie pre-visualization. To its modeling and animation tools, the latest version of 3ds Max also features shaders (such as ambient occlusion and subsurface scattering), dynamic simulation, particle systems, radiosity, normal map creation and rendering, global illumination, a customizable user interface, and its own scripting language.[3]	null	2017 / 18 April 2016; 29 days ago (2016-04-18)	http://autodesk.com/3dsmax	No code example (yet).
380	Metafont	Metafont is a description language used to define vector fonts. It is also the name of the interpreter that executes Metafont code, generating the bitmap fonts that can be embedded into e.g. PostScript. Metafont was devised by Donald Knuth as a counterpart to his TeX typesetting system.	null	2.7182818 / January 2014; 2 years ago (2014-01)	\N	No code example (yet).
381	Microcode	A microassembler is a computer program that helps prepare a microprogram, called firmware, to control the low level operation of a computer in much the same way an assembler helps prepare higher level code for a processor. The difference is that the microprogram is usually only developed by the processor manufacturer and works intimately with the computer hardware. On a microprogrammed computer the microprogram implements the operations of the instruction set in which any normal program (including both application programs and operating systems) is written. The use of a microprogram allows the manufacturer to fix certain mistakes, including working around hardware design errors, without modifying the hardware. Another means of employing microassembler-generated microprograms is in allowing the same hardware to run different instruction sets. After it is assembled, the microprogram is then loaded to a control store to become part of the logic of a CPU's control unit.	null	null	\N	No code example (yet).
395	Modula-3	Modula-3 is a programming language conceived as a successor to an upgraded version of Modula-2 known as Modula-2+. While it has been influential in research circles (influencing the designs of languages such as Java, C#, and Python) it has not been adopted widely in industry. It was designed by Luca Cardelli, James Donahue, Lucille Glassman, Mick Jordan (before at the Olivetti Software Technology Laboratory), Bill Kalsow and Greg Nelson at the Digital Equipment Corporation (DEC) Systems Research Center (SRC) and the Olivetti Research Center (ORC) in the late 1980s.	1980s	5.8.6 / July 14, 2010	\N	(* Hello World in Modula-3 *)\n\nMODULE Hello EXPORTS Main;\n\nIMPORT IO;\n\nBEGIN\n IO.Put("Hello World!\\n");\nEND Hello.
402	MUMPS	MUMPS (Massachusetts General Hospital Utility Multi-Programming System) or alternatively M, is a general-purpose computer programming language that provides ACID (Atomic, Consistent, Isolated, and Durable) transaction processing. Its differentiating feature is its "built-in" database, enabling high-level access to disk storage using simple symbolic program variables and subscripted arrays, similar to the variables used by most languages to access main memory.	1966; 50 years ago (1966)	ANSI X11.1-1995 / December 8, 1995 (1995-12-08)	\N	No code example (yet).
412	NetRexx	NetRexx is an open source, originally IBM's, variant of the REXX programming language to run on the Java virtual machine.[3] It supports a classic REXX syntax, with no reserved keywords, along with considerable additions to support object-oriented programming in a manner compatible with Java's object model, yet can be used as both a compiled and an interpreted language, with an option of using only data types native to the JVM or the NetRexx runtime package. The latter offers the standard Rexx data type that combines string processing with unlimited precision decimal arithmetic.	1996	3.04 / 1 June 2015; 10 months ago (2015-06-01)	\N	No code example (yet).
420	Nickle	Nickle is a numeric oriented programming language by Keith Packard and Bart Massey. Originally used for desktop calculation, it has since expanded for prototyping of complicated algorithms.	2001	null	\N	No code example (yet).
421	Nim	Nim (formerly named Nimrod) is an imperative, multi-paradigm, compiled programming language[6] designed and developed by Andreas Rumpf. It is designed to be "efficient, expressive, and elegant",[7] supporting metaprogramming, functional, message passing,[4] procedural, and object-oriented programming styles by providing several features such as compile time code generation, algebraic data types, an elegant foreign function interface (FFI) with C and compiling to JavaScript.[8]	2008; 8 years ago (2008)	null	http://nim-lang.org/	# Hello world in Nim\n\necho "Hello World"
586	SOL	The Secure Operations Language (SOL) was developed jointly by the United States Naval Research Laboratory and Utah State University in the USA. SOL is a domain-specific synchronous programming language for developing distributed applications and is based on software engineering principles developed in the Software Cost Reduction project at the Naval Research Laboratory in the late 1970s and early 1980s. SOL is intended to be a domain-specific language for developing service-based systems. Concurrently, a domain-specific extension of Java (SOLj) is being developed (FTDCS 2007) Application domains include sensor networks, defense and space systems, healthcare delivery, power control, etc.	null	null	\N	No code example (yet).
428	NXT-G	LEGO Mindstorms NXT is a programmable robotics kit released by Lego in late July 2006.[1] It replaced the first-generation Lego Mindstorms kit, which was called the Robotics Invention System. The base kit ships in two versions: the Retail Version (set #8527)[2] and the Education Base Set (set #9797).[3] It comes with the NXT-G programming software, or optionally LabVIEW for Lego Mindstorms.[4] A variety of unofficial languages exist, such as NXC, NBC, leJOS NXJ, and RobotC. A new version of the set, the new Lego Mindstorms NXT 2.0, was released on August 1, 2009, featuring a color sensor and other upgraded capabilities. There is now a new Lego Mindstorms Robot, called the EV3.	null	null	http://mindstorms.lego.com/	No code example (yet).
438	ObjectLOGO	ObjectLOGO is a variant of the programming language Logo with object-oriented programming extensions and lexical scoping. Version 2.7 is sold by Digitool, Inc.[1] It is no longer being developed or supported, and does not run on versions of the Mac operating system after version 7.5.[2]	null	null	\N	No code example (yet).
517	Qalb	قلب (Levantine Arabic: [ʔalb]), transliterated Qalb, Qlb and Alb, is a functional programming language allowing a programmer to write programs completely in Arabic.[1] Its name means heart and is a recursive acronym in Arabic meaning Qlb: a programming language (قلب: لغة برمجة, Qlb: Lughat Barmijah). It was developed in 2012 by Ramsey Nasser, a computer scientist at the Eyebeam Art + Technology Center in New York City, as both an artistic endeavor and as a response to the Anglophone bias in the vast majority of programming languages, which express their fundamental concepts using English words.	2012	null	\N	No code example (yet).
439	Obliq	Obliq is an interpreted, object-oriented programming language designed to make distributed, and locally multi-threaded, computation simple and easy for the programmer, while providing program safety and implicit type system. The interpreter is written in Modula-3, and provides Obliq with full access to Modula-3's network objects capabilities. A type inference algorithm for record concatenation, subtyping and recursive types has been developed for Obliq, more important it has been proved to be NP-complete [1] and its lowest complexity to be Ο(n3) or if under other modeling up to certain conditions down to Ο(n2) [2] and its best known implementation runs in Ο(n5).[3] Obliq's syntax is very similar to Modula-3, the biggest difference being that Obliq has no need of explicit typed variables (i.e., a variable can hold any data type allowed by the type checker and if does not accepts one, i.e., a given expression execution error will be thrown) although explicit type declarations are allowed and ignored by the interpreter. The basic data types in the language include booleans, integers, reals, characters, strings, and arrays. Obliq supports the usual set of sequential control structures (conditional, iteration, and exception handling forms), as well as special control forms for concurrency (mutexes and guarded statements). Besides that Obliq's objects are able to be cloned and safely copied remotely by any machine in a distributed network object and it can be done in a transparent way.[4]	null	null	\N	No code example (yet).
456	Orwell	Orwell is a small, lazy-evaluation functional programming language implemented principally by Martin Raskovsky and first released in 1984 by Philip Wadler during his time as a Research Fellow in the Programming Research Group, part of the Oxford University Computing Laboratory. Developed as a free alternative to Miranda, it was a forerunner of Haskell and was one of the first programming languages to support list comprehensions and pattern matching.	1984	null	\N	No code example (yet).
463	Pascal	Pascal is a historically influential imperative and procedural programming language, designed in 1968–69 and published in 1970 by Niklaus Wirth as a small and efficient language intended to encourage good programming practices using structured programming and data structuring.	1970; 46 years ago (1970)	null	\N	{Hello World in Pascal}\n\nprogram HelloWorld(output);\nbegin\n  WriteLn('Hello World!');\nend.
466	PDL	Perl Data Language (abbreviated PDL) is a set of free software array programming extensions to the Perl programming language. PDL extends the data structures built into Perl, to include large multidimensional arrays, and adds functionality to manipulate those arrays as vector objects. It also provides tools for image processing, computer modeling of physical systems, and graphical plotting and presentation. Simple operations are automatically vectorized across complete arrays, and higher-dimensional operations (such as matrix multiplication) are supported. On a computer with both Perl and PDL installed, any Perl script can use the PDL functionality by declaring "use PDL;".	1996 (1996)	2.012 / 14 June 2015; 10 months ago (2015-06-14)	http://pdl.perl.org/	No code example (yet).
476	Pict	Pict is a statically typed programming language, one of the very few based on the π-calculus. Work on the language began at the University of Edinburgh in 1992, and development has been more or less dormant since 1998. The language is still at an experimental stage.	null	null	http://www.cis.upenn.edu/~bcpierce/papers/pict/Html/Pict.html	No code example (yet).
477	Pike	Pike is an interpreted, general-purpose, high-level, cross-platform, dynamic programming language, with a syntax similar to that of C. Unlike many other dynamic languages, Pike is both statically and dynamically typed, and requires explicit type definitions. It features a flexible type system that allows the rapid development and flexible code of dynamically typed languages, while still providing some of the benefits of a statically typed language.	1994	7.8.866 / June 25, 2014; 22 months ago (2014-06-25)	http://pike.lysator.liu.se/	// Hello world in Pike (pike.roxen.com)\n\nint main(){\n        write("Hello World!\\n");\n}
484	PL/C	PL/C is a computer programming language developed at Cornell University with the specific goal of being used for teaching programming. It is based on IBM's PL/I language, and was designed in the early 1970s. Cornell also developed a compiler for the language that was based on its earlier CUPL compiler, and it was widely used in college-level programming courses. The two researchers and academic teachers who designed PL/C were Richard W. Conway and Thomas R. Wilcox.[1] They submitted the famous article "Design and implementation of a diagnostic compiler for PL/I" published in the Communications of ACM in March 1973, pages 169-179. PL/C eliminated some of the more complex features of PL/I, and added extensive debugging and error recovery facilities. PL/C is a subset of PL/I. A program that runs without error under the PL/C compiler should run under PL/I and produce the same results, unless certain incompatible diagnostic features, such as a macro section (begun by a $MACRO statement and finished by a $MEND statement), were used. The PL/C compiler had the unusual capability of never failing to compile any program, through the use of extensive automatic correction of many syntax errors and by converting any remaining syntax errors to output statements.	early 1970s (early 1970s)	null	\N	No code example (yet).
494	Plus	Plus is a "Pascal-like" system implementation language from the University of British Columbia (UBC), Canada, based on the SUE[1] system language developed at the University of Toronto, c. 1971.[2]	1976	null	\N	No code example (yet).
495	POP-11	POP-11 is a reflective, incrementally compiled programming language with many of the features of an interpreted language. It is the core language of the Poplog programming environment developed originally by the University of Sussex, and recently in the School of Computer Science at the University of Birmingham which hosts the Poplog website.	null	null	\N	;;; Hello World in POP-11\n\n: vars outputtext;\n: "Hello World" -> outputtext;\n: outputtext =>\n\n** Hello World
503	Processing	Processing is an open source programming language and integrated development environment (IDE) built for the electronic arts, new media art, and visual design communities with the purpose of teaching the fundamentals of computer programming in a visual context, and to serve as the foundation for electronic sketchbooks. The project was initiated in 2001 by Casey Reas and Benjamin Fry, both formerly of the Aesthetics and Computation Group at the MIT Media Lab. One of the stated aims of Processing is to act as a tool to get non-programmers started with programming through the instant gratification of visual feedback. The language builds on the Java language, but uses a simplified syntax and graphics programming model. In 2012, they started the Processing Foundation along with Daniel Shiffman, who formally joined as a third project lead.	2001; 15 years ago (2001)	3.0.2 / February 13, 2016; 3 months ago (2016-02-13)	https://processing.org/	// Hello world in Processing\n\nprintln( "Hello world!" );
511	PROTEL	Protel stands for "Procedure Oriented Type Enforcing Language". It is a programming language created by Nortel Networks and used on telecommunications switching systems such as the DMS-100.[1][2] Protel-2 is the object-oriented version of Protel.[3][4]	null	null	\N	No code example (yet).
529	REBOL	Rebol (/ˈrɛbəl/ REB-əl; historically REBOL) is a cross-platform[6] data exchange language and a multi-paradigm dynamic programming language designed by Carl Sassenrath for network communications and distributed computing. It introduces the concept of dialecting: small, optimized, domain-specific languages for code and data,[6][7] which is also the most notable property of the language according to its designer Carl Sassenrath:	1997; 19 years ago (1997)	2.7.8 / January 2011; 5 years ago (2011-01)	http://www.rebol.com/	; Hello World in REBOL\n\nprint "Hello World!"
531	Redcode	Core War is a programming game created by D. G. Jones and A. K. Dewdney in which two or more battle programs (called "warriors") compete for control of a virtual computer. These battle programs are written in an abstract assembly language called Redcode.	null	null	\N	; Hello World in Redcode\n; Should work with any MARS >= ICWS-86\n; (with 128x64 gfx core support, of course!)\n;\nStart   MOV     0,2455\n        MOV     0,2458\n        MOV     0,2459\n        MOV     0,2459\n        MOV     0,2459\n        MOV     0,2459\n        MOV     0,2459\n        MOV     0,2460\n        MOV     0,2465\n        MOV     0,2471\n        MOV     0,2471\n        MOV     0,2471\n        MOV     0,2479\n        MOV     0,2482\n        MOV     0,2484\n        MOV     0,2484\n        MOV     0,2484\n        MOV     0,2486\n        MOV     0,2486\n        MOV     0,2486\n        MOV     0,2486\n        MOV     0,2488\n        MOV     0,2493\n        MOV     0,2493\n        MOV     0,2493\n        MOV     0,2493\n        MOV     0,2497\n        MOV     0,2556\n        MOV     0,2559\n        MOV     0,2560\n        MOV     0,2565\n        MOV     0,2570\n        MOV     0,2575\n        MOV     0,2578\n        MOV     0,2585\n        MOV     0,2588\n        MOV     0,2589\n        MOV     0,2592\n        MOV     0,2593\n        MOV     0,2596\n        MOV     0,2597\n        MOV     0,2603\n        MOV     0,2605\n        MOV     0,2608\n        MOV     0,2667\n        MOV     0,2670\n        MOV     0,2671\n        MOV     0,2676\n        MOV     0,2681\n        MOV     0,2686\n        MOV     0,2689\n        MOV     0,2696\n        MOV     0,2699\n        MOV     0,2700\n        MOV     0,2703\n        MOV     0,2704\n        MOV     0,2707\n        MOV     0,2708\n        MOV     0,2714\n        MOV     0,2716\n        MOV     0,2719\n        MOV     0,2778\n        MOV     0,2778\n        MOV     0,2778\n        MOV     0,2778\n        MOV     0,2778\n        MOV     0,2779\n        MOV     0,2779\n        MOV     0,2779\n        MOV     0,2782\n        MOV     0,2787\n        MOV     0,2792\n        MOV     0,2795\n        MOV     0,2802\n        MOV     0,2805\n        MOV     0,2806\n        MOV     0,2809\n        MOV     0,2810\n        MOV     0,2810\n        MOV     0,2810\n        MOV     0,2810\n        MOV     0,2812\n        MOV     0,2818\n        MOV     0,2820\n        MOV     0,2823\n        MOV     0,2882\n        MOV     0,2885\n        MOV     0,2886\n        MOV     0,2891\n        MOV     0,2896\n        MOV     0,2901\n        MOV     0,2904\n        MOV     0,2911\n        MOV     0,2912\n        MOV     0,2913\n        MOV     0,2914\n        MOV     0,2917\n        MOV     0,2918\n        MOV     0,2919\n        MOV     0,2922\n        MOV     0,2928\n        MOV     0,2930\n        MOV     0,2933\n        MOV     0,2992\n        MOV     0,2995\n        MOV     0,2996\n        MOV     0,3001\n        MOV     0,3006\n        MOV     0,3011\n        MOV     0,3014\n        MOV     0,3021\n        MOV     0,3022\n        MOV     0,3023\n        MOV     0,3024\n        MOV     0,3027\n        MOV     0,3028\n        MOV     0,3030\n        MOV     0,3032\n        MOV     0,3038\n        MOV     0,3040\n        MOV     0,3103\n        MOV     0,3106\n        MOV     0,3107\n        MOV     0,3107\n        MOV     0,3107\n        MOV     0,3107\n        MOV     0,3107\n        MOV     0,3108\n        MOV     0,3108\n        MOV     0,3108\n        MOV     0,3108\n        MOV     0,3108\n        MOV     0,3109\n        MOV     0,3109\n        MOV     0,3109\n        MOV     0,3109\n        MOV     0,3109\n        MOV     0,3111\n        MOV     0,3111\n        MOV     0,3111\n        MOV     0,3120\n        MOV     0,3121\n        MOV     0,3124\n        MOV     0,3124\n        MOV     0,3124\n        MOV     0,3126\n        MOV     0,3129\n        MOV     0,3130\n        MOV     0,3130\n        MOV     0,3130\n        MOV     0,3130\n        MOV     0,3130\n        MOV     0,3131\n        MOV     0,3131\n        MOV     0,3131\n        MOV     0,3131\n        MOV     0,3135\n        JMP     0
545	S-Lang	The S-Lang programming library is a software library for Unix, Windows, VMS, OS/2, and Mac OS X. It provides routines for embedding an interpreter for the S-Lang scripting language, and components to facilitate the creation of text-based applications.[1] The latter class of functions include routines for constructing and manipulating keymaps, an interactive line-editing facility, and both low and high-level screen/terminal management functions. It is distributed under the terms of the GNU General Public License.	null	null	\N	No code example (yet).
549	S3	S3 is a structured, imperative high-level computer programming language.[1] It was developed by the UK company International Computers Limited (ICL) for its 2900 Series mainframes. It is a system programming language with syntax influenced by ALGOL 68 but with data types and operators aligned to those offered by the 2900 Series. It was the implementation language of the operating system VME.	null	null	\N	No code example (yet).
556	SASL	SASL (from St. Andrews Static Language, alternatively St. Andrews Standard Language) is a purely functional programming language developed by David Turner at the University of St Andrews in 1972, based on the applicative subset of ISWIM.[1] In 1976 Turner redesigned and reimplemented it as a non-strict (lazy) language.[2] In this form it was the foundation of Turner's later languages KRC and Miranda, but SASL appears to be untyped whereas Miranda has polymorphic types.	1972	null	\N	No code example (yet).
563	Scratch	Scratch is a free visual programming language.[1] Scratch is used by students, scholars, teachers, and parents to easily create animations, games, etc. and provide a stepping stone to the more advanced world of computer programming. It can also be used for a range of educational and entertainment constructionist purposes from math and science projects, including simulations and visualizations of experiments, recording lectures with animated presentations, to social sciences animated stories, and interactive art and music.[2] Viewing the existing projects available on the Scratch website, or modifying and testing any modification without saving it requires no online registration.	2002; 14 years ago (2002) (test) 2005; 11 years ago (2005) (official) 2013; 3 years ago (2013) (Scratch 2)	null	https://scratch.mit.edu/	# Hello World in Seed7\n\n$ include "seed7_05.s7i";\n\nconst proc: main is func\n  begin\n    writeln("Hello World!");\n  end func;
566	Seed7	Seed7 is an extensible general-purpose programming language designed by Thomas Mertes. It is syntactically similar to Pascal and Ada. Along with many other features, it provides an extension mechanism.[1] Seed7 supports introducing new syntax elements and their semantics into the language, and allows new language constructs to be defined and written in Seed7.[2] E.g.: programmers can introduce syntax and semantics of new statements and user defined operator symbols. The implementation of Seed7 differs significantly from that of languages with hard-coded syntax and semantics.	2005; 11 years ago (2005)	2016-04-30 / April 30, 2016; 17 days ago (2016-04-30)	http://seed7.sourceforge.net/	# Hello World in Seed7\n\n$ include "seed7_05.s7i";\n\nconst proc: main is func\n  begin\n    writeln("Hello World!");\n  end func;
583	Snap!	Snap! is a free, blocks- and browser-based educational graphical programming language that allows students to create interactive animations, games, stories, and more, while learning about mathematical and computational ideas. Snap! was inspired by Scratch, but also targets both novice and more advanced students by including and expanding Scratch's features.	2011; 5 years ago (2011)	4.0.2 / August 6, 2015; 9 months ago (2015-08-06) [1]	http://snap.berkeley.edu/	No code example (yet).
605	Swift (Apple programming language)	Swift is a general-purpose, multi-paradigm, compiled programming language created for iOS, OS X, watchOS, tvOS and Linux developed by Apple Inc. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products. Swift is intended to be more resilient to erroneous code ("safer") than Objective-C and also more concise. It is built with the LLVM compiler framework included in Xcode 6 and later and uses the Objective-C runtime, which allows C, Objective-C, C++ and Swift code to run within a single program.[9]	June 2, 2014; 23 months ago (2014-06-02)[1]	2.2.1 [2] / May 3, 2016; 13 days ago (2016-05-03)	https://swift.org/	No code example (yet).
615	TAL	Transaction Application Language or TAL (originally "Tandem Application Language") is a block-structured, procedural language optimized for use on Tandem hardware. TAL resembles a cross between C and Pascal. It was the original system programming language for the Tandem CISC machines, which had no assembler.	null	null	\N	!     Hello world in Tandem TAL (Transaction Application Language)\n      proc Hello^World main;\n            begin\n            int    .term[0:12] := [ 12 * [ "  " ] ],\n .out [0:19];\n            string .sout := @out << 1, .sp;\n \n            call myterm ( term[1] );\n            call open ( term[1], term );\nif <> then call abend;\n \nsout := "Hello World" -> @sp;\n            call write ( term, out, @sp-@sout );\nif <> then call abend;\nend;
625	TOM	TOM was an object-oriented programming language developed in the 1990s that built on the lessons learned from Objective-C. The main purpose of TOM was to allow for "unplanned reuse" of code via a well-developed extension mechanism. This concept was introduced seemingly by accident in Objective-C and later proved to be of wide use, and was applied aggressively in TOM.	1999	1.1.1 / October 15, 1999; 16 years ago (1999-10-15)	http://gerbil.org/tom/	No code example (yet).
630	TTCN	TTCN is a programming language used for testing of communication protocols and web services. A TTCN test suite consists of many test cases written in the TTCN programming language. Until version 2 the language was written in tables and called Tree and Tabular Combined Notation. Reading and editing this language required special TTCN editors. Beginning with version 3 TTCN was renamed to Testing and Test Control Notation. It is now closer to current programming languages and can be edited with traditional editors. TTCN-3 is more flexible than TTCN-2 in that it can be used for protocol testing as well as testing traditional software.	null	null	\N	No code example (yet).
632	Turbo C++	Turbo C++ is a discontinued C++ compiler and integrated development environment and computer language originally from Borland. Most recently it was distributed by Embarcadero Technologies, which acquired all of Borland's compiler tools with the purchase of its CodeGear division in 2008. The original Turbo C++ product line was put on hold after 1994 and was revived in 2006 as an introductory-level IDE, essentially a stripped-down version of their flagship C++Builder. Turbo C++ 2006 was released on September 5, 2006 and was available in 'Explorer' and 'Professional' editions. The Explorer edition was free to download and distribute while the Professional edition was a commercial product. In October 2009 Embarcadero Technologies discontinued support of its 2006 C++ editions. As such, the Explorer edition is no longer available for download and the Professional edition is no longer available for purchase from Embarcadero Technologies. Turbo C++ is succeeded by C++Builder.	null	2006 / September 5, 2006	\N	No code example (yet).
641	Uniface	Uniface is a development and deployment platform for enterprise applications that can run in a large range of runtime environments, including mobile, mainframe, web, Service-oriented architecture (SOA), Windows, Java EE and .NET. Uniface is a model-driven, Rapid Application Development (RAD) environment used to create mission-critical applications.	null	Uniface 9.7 / October 15, 2015; 6 months ago (2015-10-15)	http://uniface.com/	No code example (yet).
643	Unix shell	A Unix shell is a command-line interpreter or shell that provides a traditional Unix-like command line user interface. Users direct the operation of the computer by entering commands as text for a command line interpreter to execute, or by creating text scripts of one or more such commands. Users typically interact with a Unix shell using a terminal emulator, however, direct operation via serial hardware connections, or networking session, are common for server systems. All Unix shells provide filename wildcarding, piping, here documents, command substitution, variables and control structures for condition-testing and iteration.	null	null	\N	No code example (yet).
652	Visual Fortran	Fortran (formerly FORTRAN, derived from "Formula Translation"[2]) is a general-purpose, imperative programming language that is especially suited to numeric computation and scientific computing. Originally developed by IBM[3] in the 1950s for scientific and engineering applications, Fortran came to dominate this area of programming early on and has been in continuous use for over half a century in computationally intensive areas such as numerical weather prediction, finite element analysis, computational fluid dynamics, computational physics and computational chemistry. It is a popular language for high-performance computing[4] and is used for programs that benchmark and rank the world's fastest supercomputers.[5]	1957; 59 years ago (1957)	Fortran 2008 (ISO/IEC 1539-1:2010) / 2010; 6 years ago (2010)	\N	No code example (yet).
655	Visual Objects	Visual Objects is an object-oriented computer programming language that is used to create software programs that operate primarily under Windows. Although it can be used as a general-purpose programming tool, it is almost exclusively used to create database programs.	null	null	\N	No code example (yet).
657	VSXu	VSXu (VSX Ultra) is an OpenGL-based (hardware-accelerated), modular programming environment with its main purpose to visualize music/audio data and create 3D effects in real-time.[1] Available for Windows and GNU/Linux.[2] It is currently released as free software under terms of the GNU General Public License v2 and maintained by Vovoid Media Technologies AB.[3] VSXu is built on a modular plug-in-based architecture so anyone can extend it and or make visualization presets ("visuals" or "states").[4]	2004	0.5.1 / December 14, 2014; 16 months ago (2014-12-14)	\N	No code example (yet).
674	Xojo	The Xojo programming environment is developed and commercially marketed by Xojo, Inc of Austin, Texas for software development targeting Mac OS X, Microsoft Windows, x86 Linux, iOS, as well as the web and Raspberry Pi. Xojo uses a proprietary object-oriented BASIC dialect, also known as Xojo.[1][2]	null	Xojo 2015r4 / December 17, 2015; 4 months ago (2015-12-17)	http://xojo.com/	No code example (yet).
675	XOTcl	XOTcl is an object-oriented extension for the Tool Command Language created by Gustaf Neumann and Uwe Zdun. It is a derivative of MIT OTcl. XOTcl is based on a dynamic object system with metaclasses which as influenced by CLOS. Class and method definitions are completely dynamic. XOTcl provides language support for design patterns via filters and decorator mixins.	2000[1]	1.6.8 / 29 April 2014; 23 months ago (2014-04-29)	\N	No code example (yet).
681	Xtend	Xtend is a general-purpose high-level programming language for the Java Virtual Machine. Syntactically and semantically Xtend has its roots in the Java programming language but focuses on a more concise syntax and some additional functionality such as type inference, extension methods, and operator overloading. Being primarily an object-oriented language, it also integrates features known from functional programming, e.g. lambda expressions. Xtend is statically typed and uses Java's type system without modifications. It is compiled to Java code and thereby seamlessly integrates with all existing Java libraries.	2011	2.9.0 / December 1, 2015; 4 months ago (2015-12-01)	\N	No code example (yet).
\.


--
-- Data for Name: languages_careers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_careers (id, language_id, career_id) FROM stdin;
27	19	1
28	78	1
29	121	1
30	183	1
31	292	1
32	469	1
33	472	1
34	514	1
35	541	1
36	647	1
37	660	1
38	290	2
39	302	2
40	371	2
41	514	2
42	521	2
43	555	2
44	556	2
45	560	2
46	82	3
47	83	3
48	84	3
49	110	3
50	112	3
51	402	3
52	660	3
53	661	3
54	665	3
55	78	4
56	83	4
57	290	4
58	436	4
59	469	4
60	514	4
61	540	4
62	541	4
63	19	5
64	173	5
65	290	5
66	292	5
67	300	5
68	352	5
69	595	5
70	647	5
71	46	6
72	78	6
73	82	6
74	83	6
75	290	6
76	292	6
77	340	6
78	352	6
79	436	6
80	463	6
81	469	6
82	514	6
83	605	6
84	616	6
85	649	6
86	82	7
87	83	7
88	290	7
89	371	7
90	541	7
91	78	9
92	82	9
93	83	9
94	469	9
95	83	10
96	290	10
97	292	10
98	472	10
99	514	10
100	541	10
101	543	10
102	82	11
103	83	11
104	290	11
105	78	12
106	82	12
107	83	12
108	118	12
109	213	12
110	290	12
111	340	12
112	463	12
113	514	12
114	46	13
115	59	13
116	78	13
117	82	13
118	83	13
119	113	13
120	118	13
121	213	13
122	290	13
123	463	13
124	535	13
125	78	14
126	83	14
127	290	14
128	292	14
129	78	15
130	82	15
131	352	15
132	436	15
133	605	15
134	292	16
135	472	16
136	541	16
137	78	17
138	82	17
139	83	17
140	290	17
141	292	17
142	436	17
143	514	17
144	541	17
145	581	17
146	616	17
147	648	17
148	290	18
149	436	18
150	514	18
151	58	19
152	78	19
153	83	19
154	290	19
155	371	19
156	443	19
157	514	19
158	576	19
159	83	20
160	290	20
161	352	20
162	514	20
163	82	21
164	183	21
165	290	21
166	292	21
167	78	22
168	82	22
169	83	22
170	213	22
171	253	22
172	290	22
173	371	22
174	436	22
175	440	22
176	469	22
177	507	22
178	514	22
179	541	22
180	560	22
181	581	22
182	54	23
183	58	23
184	78	23
185	83	23
186	100	23
187	352	23
188	469	23
189	541	23
190	20	24
191	46	24
192	69	24
193	78	24
194	83	24
195	149	24
196	186	24
197	213	24
198	234	24
199	421	24
200	488	24
201	543	24
202	605	24
203	607	24
204	78	25
205	83	25
206	375	25
207	514	25
208	46	26
209	78	26
210	82	26
211	83	26
212	197	26
213	290	26
214	292	26
215	514	26
216	649	26
\.


--
-- Name: languages_careers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_careers_id_seq', 216, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_id_seq', 700, false);


--
-- Data for Name: languages_programs; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_programs (id, language_id, program_id) FROM stdin;
\.


--
-- Name: languages_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_programs_id_seq', 5, true);


--
-- Data for Name: languages_types; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY languages_types (id, language_id, type_id) FROM stdin;
19	5	6
20	7	7
21	8	8
22	22	9
23	24	10
24	25	11
25	26	12
26	26	13
27	27	14
28	27	15
29	31	16
30	32	17
31	32	18
32	32	9
33	33	14
34	33	15
35	33	19
36	39	6
37	39	9
38	39	20
39	39	21
40	39	15
41	41	22
42	42	23
43	44	24
44	47	17
45	47	12
46	47	25
47	50	13
48	50	21
49	193	26
50	193	22
51	53	24
52	54	13
53	54	22
54	56	13
55	59	17
56	59	27
57	59	20
58	59	21
59	59	19
60	61	13
61	62	17
62	62	13
63	62	19
64	63	22
65	65	15
66	65	28
67	66	29
68	67	28
69	67	30
70	70	18
71	70	31
72	73	8
73	78	17
74	78	12
75	78	13
76	78	27
78	78	19
79	78	30
80	83	17
81	83	13
82	83	9
83	83	27
84	83	33
85	83	15
86	83	28
87	83	19
88	233	28
89	88	28
90	88	10
91	91	17
92	91	13
93	91	9
94	91	27
95	91	15
96	91	28
97	91	19
98	91	30
99	95	34
100	95	22
101	96	26
102	97	6
103	97	12
104	98	9
105	99	30
106	173	13
107	173	34
108	173	9
109	173	35
110	173	15
111	173	10
112	173	19
113	173	30
114	173	22
115	106	12
116	106	13
117	110	36
118	111	9
119	112	36
120	113	26
121	113	22
122	114	12
123	114	9
124	114	20
125	114	23
126	114	30
127	115	37
128	116	26
129	116	22
130	119	17
131	119	37
132	119	15
133	119	28
134	119	8
135	119	19
136	119	30
137	120	31
138	124	28
139	124	19
140	124	22
141	125	18
142	126	19
143	129	17
144	129	9
145	129	20
146	129	23
147	129	15
148	129	28
149	129	30
150	131	19
151	131	30
152	131	16
153	132	38
154	138	7
155	141	26
156	145	17
157	145	9
158	145	33
159	145	15
160	145	28
161	145	19
162	145	30
163	146	12
164	146	9
165	146	14
166	146	15
167	146	8
168	147	13
169	149	17
170	149	13
171	149	9
172	149	27
173	149	33
174	149	15
175	149	28
176	149	19
177	150	13
178	150	9
179	150	20
180	151	17
181	151	13
182	151	39
183	151	28
184	151	19
185	155	36
186	159	17
187	159	15
188	159	28
189	159	30
190	159	16
191	160	17
192	164	31
193	167	12
194	167	13
195	167	28
196	176	17
197	176	12
198	176	21
199	176	37
200	176	15
201	176	28
202	176	19
203	176	30
204	178	9
205	178	33
206	178	8
207	179	9
208	183	17
209	183	12
210	183	34
211	183	9
212	183	20
213	187	24
214	188	10
215	190	16
216	196	28
217	196	30
218	196	22
219	197	17
220	197	9
221	197	20
222	197	15
223	197	8
224	198	17
225	198	40
226	199	22
227	200	15
228	203	41
229	206	42
230	209	7
231	265	7
232	214	28
233	218	9
234	218	20
235	218	21
236	218	23
237	218	15
238	218	28
239	220	9
240	223	13
241	223	21
242	223	28
243	223	22
244	225	11
245	252	43
246	228	8
247	231	13
248	247	17
249	247	13
250	247	9
251	247	27
252	247	20
253	247	21
254	247	33
255	247	15
256	247	28
257	247	19
258	247	30
259	247	22
260	251	17
261	251	15
262	251	28
263	251	19
264	251	30
265	253	17
266	253	9
267	253	20
268	253	21
269	253	33
270	253	8
271	257	9
272	257	15
273	258	9
274	262	19
275	268	37
276	270	6
277	270	20
278	271	9
279	274	34
280	274	10
281	274	22
282	280	8
283	281	6
284	281	9
285	281	20
286	281	21
287	281	15
288	281	28
289	289	22
290	292	13
291	292	34
292	292	25
293	292	9
294	292	20
295	292	21
296	292	35
297	292	15
298	292	10
299	292	19
300	292	30
301	292	22
302	293	26
303	295	12
304	295	13
305	295	28
306	295	19
307	295	30
308	295	22
309	297	12
310	298	17
311	298	19
312	299	9
313	299	23
314	299	40
315	300	13
316	300	34
317	300	25
318	300	9
319	300	35
320	300	15
321	300	10
322	300	19
323	300	30
324	300	22
325	321	17
326	321	43
327	321	15
328	321	28
329	321	31
330	304	6
331	311	11
332	313	13
333	359	42
334	317	26
335	323	19
336	323	16
337	327	44
338	327	15
339	327	28
340	327	31
341	329	14
342	329	15
343	333	12
344	333	13
345	334	31
346	339	10
347	416	10
348	349	13
349	349	21
350	352	34
351	352	25
352	352	27
353	352	20
354	352	21
355	352	37
356	352	33
357	352	15
358	352	28
359	352	10
360	352	30
361	352	22
362	353	43
363	354	39
364	354	24
365	364	20
366	364	21
367	366	7
368	370	9
369	370	20
370	370	21
371	370	33
372	370	11
373	370	19
374	370	38
375	371	6
376	371	27
377	371	20
378	371	21
379	371	11
380	371	19
381	372	43
382	372	31
383	377	17
384	377	39
385	377	9
386	377	14
387	377	15
388	387	9
389	387	8
390	389	17
391	389	9
392	389	20
393	392	39
394	393	16
395	394	18
396	394	27
397	394	28
398	394	19
399	394	16
400	397	10
401	401	13
402	407	17
403	407	13
404	407	9
405	407	33
406	407	15
407	407	28
408	407	19
409	431	27
410	431	11
411	431	16
412	434	27
413	434	15
414	434	28
415	434	19
416	434	16
417	435	28
418	436	17
419	436	15
420	436	28
421	436	30
422	440	17
423	440	9
424	440	27
425	440	15
426	440	28
427	441	12
428	442	12
429	443	6
430	447	9
431	448	25
432	451	9
433	451	38
434	452	25
435	453	12
436	455	21
437	455	19
438	455	22
439	457	28
440	457	16
441	458	12
442	458	43
443	458	39
444	458	14
445	458	15
446	464	13
447	464	21
448	464	19
449	464	30
450	469	13
451	469	34
452	469	27
453	469	20
454	469	21
455	469	33
456	469	15
457	469	28
458	469	19
459	469	30
460	469	22
461	472	13
462	472	34
463	472	27
464	472	21
465	472	37
466	472	35
467	472	15
468	472	28
469	472	30
470	472	22
471	474	13
472	474	30
473	479	29
474	497	20
475	497	21
476	497	40
477	505	43
478	505	15
479	505	28
480	505	31
481	507	39
482	507	14
483	507	30
484	507	38
485	514	17
486	514	34
487	514	25
488	514	9
489	514	27
490	514	20
491	514	21
492	514	37
493	514	33
494	514	15
495	514	28
496	514	8
497	514	19
498	514	30
499	514	22
500	515	9
501	516	9
502	521	6
503	521	13
504	521	9
505	521	20
506	521	21
507	521	23
508	521	15
509	521	10
510	521	19
511	521	22
512	523	9
513	523	23
514	523	15
515	525	41
516	525	19
517	532	9
518	534	7
519	534	28
520	534	22
521	535	26
522	535	25
523	535	20
524	535	21
525	535	22
526	537	14
527	537	15
528	538	40
529	541	34
530	541	25
531	541	9
532	541	27
533	541	20
534	541	21
535	541	33
536	541	15
537	541	28
538	541	30
539	541	22
540	543	17
541	543	12
542	543	13
543	543	9
544	543	27
545	543	33
546	543	15
547	543	19
548	544	6
549	553	12
550	555	7
551	557	17
552	557	37
553	557	28
554	560	17
555	560	12
556	560	13
557	560	34
558	560	9
559	560	20
560	560	15
561	560	28
562	561	17
563	561	12
564	561	18
565	561	9
566	561	20
567	561	23
568	561	33
569	561	30
570	567	10
571	567	30
572	569	6
573	569	17
574	569	12
575	569	39
576	569	9
577	569	33
578	575	17
579	575	28
580	576	31
581	577	15
582	581	17
583	581	20
584	581	33
585	581	28
586	581	10
587	581	30
588	581	22
589	581	31
590	591	28
591	591	8
592	594	28
593	594	10
594	594	30
595	594	31
596	595	34
597	595	25
598	596	12
599	602	31
600	608	24
601	609	44
602	612	26
603	614	10
604	616	34
605	616	25
606	616	20
607	616	21
608	616	23
609	616	35
610	616	15
611	616	30
612	616	22
613	617	13
614	617	9
615	617	21
616	617	23
617	617	15
618	617	28
619	617	19
620	617	22
621	633	17
622	633	18
623	634	29
624	636	13
625	637	17
626	637	7
627	637	28
628	644	13
629	645	17
630	646	25
631	647	34
632	647	21
633	647	28
634	647	19
635	647	22
636	648	17
637	648	19
638	648	22
639	650	7
640	650	28
641	653	17
642	653	36
643	653	7
644	653	20
645	653	28
646	653	19
647	656	17
648	656	14
649	656	28
650	658	31
651	660	36
652	660	34
653	660	22
654	661	36
655	663	22
656	664	26
657	664	13
658	664	25
659	664	20
660	664	21
661	664	15
662	664	22
663	665	6
664	665	36
665	665	39
666	665	18
667	665	9
668	665	27
669	665	21
670	665	33
671	665	15
672	665	11
673	665	19
674	665	30
675	665	38
676	667	17
677	667	19
678	668	17
679	668	28
680	668	19
681	668	30
682	669	6
683	669	12
684	669	13
685	669	28
686	669	30
687	673	17
688	673	37
689	673	33
690	673	15
691	673	8
692	673	19
693	673	30
694	19	17
695	19	13
696	19	34
697	19	9
698	19	35
699	19	15
700	19	10
701	19	19
702	19	30
703	19	22
704	678	45
705	680	38
706	680	45
707	682	13
708	687	6
709	20	17
710	20	12
711	20	27
712	20	15
713	20	19
714	37	11
715	48	9
716	51	21
717	58	22
718	69	19
719	72	17
720	72	18
721	72	27
722	72	28
723	72	19
724	82	17
725	82	13
726	82	9
727	82	27
728	82	37
729	82	15
730	82	28
731	82	19
732	82	30
733	100	46
734	104	12
735	104	13
736	104	15
737	104	28
738	104	19
739	104	30
740	118	17
741	118	27
742	118	19
743	143	12
744	157	26
745	157	22
746	165	17
747	165	9
748	165	23
749	165	15
750	165	28
751	165	30
752	180	17
753	180	25
754	180	9
755	180	23
756	195	19
757	212	17
758	212	20
759	212	21
760	212	33
761	212	30
762	212	40
763	213	6
764	213	17
765	213	19
766	234	17
767	234	12
768	234	13
769	234	27
770	234	15
771	234	19
772	242	17
773	250	26
774	267	13
775	267	22
776	290	17
777	290	12
778	290	13
779	290	34
780	290	27
781	290	28
782	290	19
783	290	30
784	302	6
785	302	12
786	302	34
787	302	9
788	302	27
789	302	20
790	302	21
791	302	37
792	302	33
793	302	15
794	302	11
795	302	28
796	302	19
797	302	30
798	302	22
799	325	29
800	325	19
801	325	22
802	340	12
803	340	9
804	340	21
805	340	23
806	340	33
807	340	30
808	343	9
809	603	13
810	603	28
811	346	18
812	346	9
813	346	23
814	346	30
815	365	7
816	395	27
817	395	28
818	402	36
819	402	27
820	402	20
821	402	21
822	402	19
823	421	17
824	421	27
825	421	8
826	428	31
827	439	10
828	439	16
829	456	8
830	463	17
831	463	18
832	463	27
833	463	21
834	463	19
835	463	16
836	476	12
837	477	13
838	477	20
839	477	15
840	477	28
841	477	19
842	484	19
843	494	17
844	494	19
845	495	30
846	495	40
847	503	13
848	503	28
849	529	15
850	529	10
851	529	30
852	529	22
853	545	6
854	545	13
855	545	25
856	545	20
857	545	21
858	545	19
859	545	22
860	563	18
861	563	28
862	563	31
863	566	15
864	583	18
865	583	31
866	641	7
867	643	22
868	675	28
869	675	30
\.


--
-- Name: languages_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('languages_types_id_seq', 869, true);


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY programs (id, name, description, url) FROM stdin;
\.


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('programs_id_seq', 3, true);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY types (id, name, description) FROM stdin;
6	Array language	Array programming (also known as vector or multidimensional languages) generalize operations on scalars to apply transparently to vectors, matrices, and higher-dimensional arrays.
29	Authoring languages	An authoring language is a programming language used to create tutorials, computer-based training courseware, websites, CD-ROMs and other interactive computer programs. Authoring systems (packages) generally provide high-level visual tools that enable a complete system to be designed without writing any programming code, although the authoring language is there for more in-depth usage.
26	Command line interface languages	Command-line interface (CLI) languages are also called batch languages, or job control languages.
17	Compiled languages	A compiled language is a programming language whose implementations are typically compilers (translators that generate machine code from source code), and not interpreters (step-by-step executors of source code, where no pre-runtime translation takes place).\r\n\r\nThe term is somewhat vague; in principle any language can be implemented with a compiler or with an interpreter. A combination of both solutions is also common: a compiler can translate the source code into some intermediate form (often called bytecode), which is then passed to an interpreter which executes it.\r\n
12	Concurrent languages	Message passing languages provide language constructs for concurrency. The predominant paradigm for concurrency in mainstream languages such as Java is shared memory concurrency based on monitors. Concurrent languages that make use of message passing have generally been inspired by CSP or the π-calculus, but have had little commercial success, except for Ada and Erlang. Ada is a multipurpose language and concurrent programming is only one option available.
13	Curly-bracket languages	The curly-bracket or curly-brace programming languages have a syntax that defines statement blocks using the curly bracket or brace characters { and }. This syntax originated with BCPL (1966), and was popularized by C (1972). Many curly-bracket languages descend from or are strongly influenced by C. Examples of curly-bracket languages include:
36	Data-oriented languages	Data-oriented languages provide powerful ways of searching and manipulating the relations that have been described as entity relationship tables which map one set of things into other sets.
43	Dataflow languages	Dataflow programming languages rely on a (usually visual) representation of the flow of data to specify the program. Frequently used for reacting to discrete events or for processing streams of data.
39	Declarative languages	Declarative languages describe a problem rather than defining a solution. Declarative programming stands in contrast to imperative programming via imperative programming languages, where serial orders (imperatives) are given to a computer. In addition to the examples given just below, all (pure) functional and logic-based programming languages are also declarative. In fact, "functional" and "logical" constitute the usual subcategories of the declarative category.
18	Educational languages	Languages developed primarily for the purpose of teaching and learning of programming.
34	Embeddable languages	Source embeddable languages embed small pieces of executable code inside a piece of free-form text, often a web page.\r\n\r\nClient-side embedded languages are limited by the abilities of the browser or intended client. They aim to provide dynamism to web pages without the need to recontact the server.\r\n\r\nServer-side embedded languages are much more flexible, since almost any language can be built into a server. The aim of having fragments of server-side code embedded in a web page is to generate additional markup dynamically; the code itself disappears when the page is served, to be replaced by its output.
46	Esoteric languages	An esoteric programming language (sometimes shortened to esolang) is a programming language designed to test the boundaries of computer programming language design, as a proof of concept, as software art, as a hacking interface to another language (particularly functional programming or procedural programming languages), or as a joke. The use of esoteric distinguishes these languages from programming languages that working developers use to write software. Usually, an esolang's creators do not intend the language to be used for mainstream programming, although some esoteric features, such as visuospatial syntax,[1] have inspired practical applications in the arts. Such languages are often popular among hackers and hobbyists.\r\n\r\nUsability is rarely a goal for esoteric programming language designers—often it is quite the opposite. Their usual aim is to remove or replace conventional language features while still maintaining a language that is Turing-complete, or even one for which the computational class is unknown.
25	Extension languages	Extension programming languages are languages embedded into another program and used to harness its features in extension scripts.
9	Functional languages	Functional programming languages define programs and subroutines as mathematical functions. Many so-called functional languages are "impure", containing imperative features. Many functional languages are tied to mathematical calculation tools.
44	Hardware description languages	In electronics, a Hardware description language or HDL is a specialized computer language used to describe the structure, design and operation of electronic circuits, and most commonly, digital logic circuits. The two most widely used and well-supported HDL varieties used in industry are Verilog and VHDL.
20	Interactive mode languages	Interactive mode languages act as a kind of shell: expressions or statements can be entered one at a time, and the result of their evaluation is seen immediately. The interactive mode is also known as a REPL (read–eval–print loop).
37	Iterative languages	Iterative languages are built around or offering generators.
23	List-based languages – LISPs	List-based languages are a type of data-structured language that are based upon the list data structure.
41	Non-English-based languages	Non-English-based programming languages are computer programming languages that, unlike better-known programming languages, do not use keywords taken from, or inspired by, the English vocabulary.
11	Numerical analysis	  
8	Off-side rule languages	Off-side rule languages are those where blocks are formed, indicated, by their indentation.
38	Rule-based languages	Rule-based languages instantiate rules when activated by conditions in a set of data. Of all possible activations, some set is selected and the statements belonging to those rules execute.
42	Syntax handling languages	These languages assist with generating lexical analyzers and parsers for Context-free grammars.
16	Wirth languages	Computer scientist Niklaus Wirth designed and implemented several influential languages.
45	XML-based languages	These are languages based on or that operate on XML.
7	Fourth-generation languages	A fourth-generation programming language (4GL) is a computer programming language envisioned as a refinement of the style of languages classified as third-generation programming language (3GL). Each of the programming language generations aims to provide a higher level of abstraction of the internal computer hardware details, making the language more programmer-friendly, powerful and versatile. While the definition of 4GL has changed over time, it can be typified by operating more with large collections of information at once rather than focusing on just bits and bytes. Languages claimed to be 4GL may include support for database management, report generation, mathematical optimization, GUI development, or web development. Fourth-generation languages have often been compared to domain-specific languages (DSLs). Some researchers state that 4GLs are a subset of DSLs.[1][2]\r\n\r\nThe concept of 4GL was developed from the 1970s through the 1990s, overlapping most of the development of 3GL. While 3GLs like C, C++, C#, Java, and JavaScript remain popular for a wide variety of uses, 4GLs as originally defined found narrower uses.[citation needed] Some advanced 3GLs like Python, Ruby, and Perl combine some 4GL abilities within a general-purpose 3GL environment. Also, libraries with 4GL-like features have been developed as add-ons for most popular 3GLs. This has blurred the distinction of 4GL and 3GL.
27	Imperative languages	Imperative programming is a programming paradigm that uses statements that change a program's state. In much the same way that the imperative mood in natural languages expresses commands, an imperative program consists of commands for the computer to perform. Imperative programming focuses on describing how a program operates.\r\n\r\nThe term is often used in contrast to declarative programming, which focuses on what the program should accomplish without specifying how the program should achieve the result.\r\n\r\nImperative programming languages may be multi-paradigm and appear in other classifications.
21	Interpreted languages	Interpreted languages are programming languages in which programs may be executed from source code form, by an interpreter. Theoretically, any language can be compiled or interpreted, so the term *interpreted language* generally refers to languages that are commonly interpreted rather than compiled.
14	Logic-based languages	\r\nLogic-based languages specify a set of attributes that a solution must have, rather than a set of steps to obtain a solution.
35	Macro languages	Macro languages transform one source code file into another. A "macro" is essentially a short piece of text that expands into a longer one (not too be confused with hygienic macros), possibly with parameter substitution. They are often used to preprocess source code. Preprocessors can also supply facilities like file inclusion.\r\n\r\nMacro languages may be restricted to acting on specially labeled code regions (pre-fixed with a # in the case of the C preprocessor. Alternatively, they may not, but in this case it is still often undesirable to (for instance) expand a macro embedded in a string literal, so they still need a rudimentary awareness of syntax. That being the case, they are often still applicable to more than one language. Contrast with source-embeddable languages like PHP, which are fully featured.
33	Metaprogramming languages	Metaprogramming is writing of programs that write or manipulate other programs (or themselves) as their data or that do part of the work that is otherwise done at run time during compile time. In many cases, this allows programmers to get more done in the same amount of time as they would take to write all the code manually.
15	Multiparadigm languages	Multiparadigm languages support more than one programming paradigm. They allow a program to use more than one programming style. The goal is to allow programmers to use the best tool for a job, admitting that no one paradigm solves all problems in the easiest or most efficient way.
28	Object-oriented class-based languages	Class-based Object-oriented programming languages support objects defined by their class. Class definitions include member data. Message passing is a key concept (if not the key concept) in Object-oriented languages.\r\n\r\nPolymorphic functions parameterized by the class of some of their arguments are typically called methods. In languages with single dispatch, classes typically also include method definitions. In languages with multiple dispatch, methods are defined by generic functions. There are exceptions where single dispatch methods are generic functions (e.g. Bigloo's object system).\r\n
10	Object-oriented prototype-based languages	Prototype-based languages are object-oriented languages where the distinction between classes and instances has been removed.
19	Procedural languages	Procedural programming languages are based on the concept of the unit and scope (the data viewing range of an executable code statement). A procedural program is composed of one or more units or modules, either user coded or provided in a code library; each module is composed of one or more procedures, also called a function, routine, subroutine, or method, depending on the language.
30	Reflective languages	Reflective languages let programs examine and possibly modify their high level structure at runtime. This is most common in high-level virtual machine programming languages like Smalltalk, and less common in lower-level programming languages like C. Languages and platforms supporting reflection:
22	Scripting languages	"Scripting language" has two apparently different, but in fact similar meanings. In a traditional sense, scripting languages are designed to automate frequently used tasks that usually involve calling or passing commands to external programs. Many complex application programs provide built-in languages that let users automate tasks. Those that are interpretive are often called scripting languages.\r\n\r\nRecently, many applications have built-in traditional scripting languages, such as Perl or Visual Basic, but there are quite a few native scripting languages still in use. Many scripting languages are compiled to bytecode and then this (usually) platform-independent bytecode is run through a virtual machine (compare to Java virtual machine).
40	Stack-based languages	Stack-based languages are a type of data-structured language that are based upon the stack data structure.
24	Synchronous languages	Synchronous programming languages are optimized for programming reactive systems, systems that are often interrupted and must respond quickly. Many such systems are also called realtime systems, and are used often in embedded systems.
31	Visual languages	Visual programming languages let users specify programs in a two-(or more)-dimensional way, instead of as one-dimensional text strings, via graphic layouts of various types.
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('types_id_seq', 46, true);


--
-- Name: careers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (id);


--
-- Name: languages_careers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_careers
    ADD CONSTRAINT languages_careers_pkey PRIMARY KEY (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: languages_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_programs
    ADD CONSTRAINT languages_programs_pkey PRIMARY KEY (id);


--
-- Name: languages_types_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY languages_types
    ADD CONSTRAINT languages_types_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

