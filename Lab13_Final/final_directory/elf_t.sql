CREATE OR REPLACE

TYPE elf_t UNDER base_t
( name  VARCHAR2(30)
, genus VARCHAR2(30)
, CONSTRUCTOR FUNCTION dwarf_t
 RETURN SELF AS RESULT
, MEMBER FUNCTION get_name RETURN VARCHAR2
, MEMBER PROCEDURE set_name (oname VARCHAR2)
, MEMBER FUNCTION get_genus RETURN VARCHAR2
, MEMBER PROCEDURE set_genus (genus VARCHAR2)
 INSTANTIABLE NOT FINAL;
/

CREATE OR REPLACE
	TYPE BODY elf_t IS

/* A default constructor w/o formal parameters. */

CONSTRUCTOR FUNCTION elf_t
	RETURN SELF AS RESULT IS
	BEGIN
		self.name := 'ELF_T';
		RETURN;
	END;

/* An accessor, or getter, method. */

MEMBER FUNCTION get_name RETURN VARCHAR2 IS
	BEGIN
		RETURN self.name;
	END get_name;

/* A mutator, or setter, method. */

MEMBER PROCEDURE set_name
	( name  VARCHAR2 ) IS
	
	BEGIN
		self.name := name;
	END set_name;
/* A to_string conversion method. */
	
	MEMBER FUNCTION to_string RETURN VARCHAR2 IS
	BEGIN
		RETURN self.name;

	END to_string;
END;
/

QUIT
