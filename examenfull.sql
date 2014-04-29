-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "cics" ----------------------------------
CREATE DATABASE IF NOT EXISTS `cics` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cics`;
-- ---------------------------------------------------------


-- CREATE TABLE "examen" -----------------------------------
CREATE TABLE `examen` ( 
	`idExamen` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`idUser` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`puntaje` Int( 11 ) NULL, 
	`tipo` Int( 11 ) NULL, 
	`fecha` Date NULL,
	 PRIMARY KEY ( `idExamen` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "examen_resultado" -------------------------
CREATE TABLE `examen_resultado` ( 
	`idExamen_Resultado` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`idExamen` Int( 11 ) NOT NULL, 
	`materia` Int( 11 ) NOT NULL, 
	`puntaje` Int( 11 ) NULL,
	 PRIMARY KEY ( `idExamen_Resultado` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "materia" ----------------------------------
CREATE TABLE `materia` ( 
	`idMateria` Int( 11 ) NOT NULL, 
	`Nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`numPregunta` Int( 11 ) NULL,
	 PRIMARY KEY ( `idMateria` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "pregunta" ---------------------------------
CREATE TABLE `pregunta` ( 
	`idPregunta` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`oracion` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`opc1` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`opc2` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`opc3` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`opc4` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`just` VarChar( 450 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`tema` Int( 11 ) NULL, 
	`opcc` Int( 11 ) NOT NULL, 
	`grafico` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	 PRIMARY KEY ( `idPregunta` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 65;
-- ---------------------------------------------------------


-- CREATE TABLE "recomendacion" ----------------------------
CREATE TABLE `recomendacion` ( 
	`idRecomendacion` Int( 11 ) NOT NULL, 
	`url` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`idTema` Int( 11 ) NULL,
	 PRIMARY KEY ( `idRecomendacion` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "tema" -------------------------------------
CREATE TABLE `tema` ( 
	`idTema` Int( 11 ) AUTO_INCREMENT NOT NULL, 
	`nombre` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`idMateria` Int( 11 ) NOT NULL,
	 PRIMARY KEY ( `idTema`,`idMateria` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 7;
-- ---------------------------------------------------------


-- CREATE TABLE "usuario" ----------------------------------
CREATE TABLE `usuario` ( 
	`username` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`password` VarChar( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`tipo` Int( 11 ) NOT NULL, 
	`creado` DateTime NULL, 
	`modificado` DateTime NULL, 
	`login` DateTime NULL, 
	`passwordStrategy` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`salt` VarChar( 200 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`login_ip` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	 PRIMARY KEY ( `username` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "usuario_datos" ----------------------------
CREATE TABLE `usuario_datos` ( 
	`idUser` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
	`nombre` VarChar( 45 ) CHARACTER SET big5 COLLATE big5_chinese_ci NULL, 
	`apellidoa` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`apellidom` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`fechanac` Date NULL, 
	`fechareg` Date NULL, 
	`fechasusc` Date NULL, 
	`ecuela` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
	`email` VarChar( 45 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	 PRIMARY KEY ( `idUser` )
 )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- Dump data of "examen" -----------------------------------
-- ---------------------------------------------------------


-- Dump data of "examen_resultado" -------------------------
-- ---------------------------------------------------------


-- Dump data of "materia" ----------------------------------
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '1', 'Comunicación Español', '20' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '2', 'Comunicación Ingés
', '10' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '3', ' HABILIDAD MATEMÁTICA', '15' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '4', 'BIOLOGÍA', '10' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '5', 'Química', '15' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '6', 'Física', '15' );
INSERT INTO `materia`(`idMateria`,`Nombre`,`numPregunta`) VALUES ( '7', 'Matematicas', '35' );;
-- ---------------------------------------------------------


-- Dump data of "pregunta" ---------------------------------
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '1', 'Los autores del texto le llaman “Nuestro Pecado Mortal”, ¿Por qué razones usan éste título? ', 'a) Hacen referencia religiosa del origen del hombre y de la mujer para su existencia. ', 'b) Se refieren a nuestros pecados cometidos al vivir el día a día. ', 'c) Se trata de una analogía respecto a nuestros hábitos diarios de vivir. ', 'd) Realizan una comparación entre el nivel de lectura que hemos desarrollado.', 'Pendiente', '1', '4', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '2', 'Hacen referencia en el texto de los autores que escribieron las siguientes obras: ', 'a) Umberto Eco y la Historia del Tiempo. Milan Kundera y La Inmortalidad. Stephen Hawking y El Péndulo de Foucault. ', 'b) Umberto Eco y el Péndulo de Foucault. Milan Kundera y La Inmortalidad. Stephen Hawking y La Historia del Tiempo. ', 'c) Umberto Eco y La inmortalidad. Milan Kundera y El Péndulo de Foucault. Stephen Hawking y Historia del Tiempo. ', 'd) Umberto Eco y La Inmortalidad. Milan Kundera y Historia del Tiempo. Stephen Hawking y El Péndulo de Foucault.', 'Pendiente', '1', '2', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '3', 'Dentro del texto mencionan tres librerías que son: ', 'a) Casa del libro, librería de Cristal y el Sótano. ', 'b) El Libro Viejo, libros Antiguos y el Libro del Saber. ', 'c) Porrúa, Zaplana y Gandhi. ', 'd) El Aleph, Rayuela y las Trampas de la Fe.', 'Pendiente', '1', '3', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '4', 'El tema principal del texto trata de: ', 'a) La importancia de la literatura latinoamericana y sus principales exponentes. ', 'b) Domina el concepto de la lectura enfocada a la calidad de los autores. ', 'c) Hace un recuento de los autores que sobresalen en las letras latinoamericanas. ', 'd) Interpreta la realidad de los escritores con relación al lector y sus habilidades.', 'Pendiente', '1', '2', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '5', 'Con referencia artística mencionan el nombre de tres pintores que son: ', 'a) Goya, Van Gogh y El Bosco. ', 'b) Eco, Hawking y Kundera. ', 'c) Borges, Córtazar y Paz. ', 'd) Marx, Gorbachov y Galbarith', 'Pendiente', '1', '1', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '6', 'En la oración “este genio que bordea los límites de la locura con la cordura”. ¿Qué palabra está presentada como sujeto? ', 'a) Este genio… ', 'b) Este genio que bordea… ', 'c) Este… ', 'd) Ninguna de las tres.', 'El sujeto es aquel que lleva acabo la accion del Verbo.', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '7', 'En la oración “los best-seller de Europa y América en México”, la palabra best-seller significa: ', 'a) Son los principales autores en ambos continentes. ', 'b) Son los autores más conocidos en el mundo por escribir sus obras. ', 'c) Son los libros más populares dentro del público consumidor. ', 'd) Son los libros que registran mayor número de ventas.', 'Un best seller es aquel libro mas vendido o de los más vendidos', '1', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '8', 'En la oración “Auspiciando la publicación de una serie de libros pequeños” la palabra acentuada con tilde se clasifica como: ', 'a) Aguda. ', 'b) Grave.', 'c) Esdrújula. ', 'd) Sobreesdrújula.', 'Pendiente', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '9', 'En la oración “Para muchos de nosotros lo importante es HACER COMO SI, aunque en el fondo sabemos que nuestro quehacer sea COMO NO”, se refiere a: ', 'a) Nuestros hábitos no son adecuados y solo hacemos la apariencia de que existen. ', 'b) Nuestros conocimientos están presentes pero no logran exponerse dentro de nuestra mente. ', 'c) Nuestro método de lectura no es el adecuado pero aparentamos que si entendimos lo leído. ', 'd) Como no es una negación que no existe, ya que se trata de una oración anulada.', 'Pendiente', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '10', 'Al utilizar la palabra “ intelectual” le conceden el siguiente significado: ', 'a) Se trata de una persona con conocimiento llegando a la sabiduría. ', 'b) Es una persona que cree tener conocimiento de algo pero solo es una apariencia. ', 'c) Persona que tiene conocimientos comunes y corrientes en el uso diario. ', 'd) Se dice de una persona que nació sobre dotada en el uso de su cerebro.', 'Pendiente', '1', '2', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '11', 'Al utilizar en el texto el verbo leer con distintas acepciones principalmente se refiere a: ', 'a) La capacidad de solo unir letras. ', 'b) La utilidad para leer lo cotidiano. ', 'c) La capacidad de leer y escribir como lo hacemos en el nivel primaria. ', 'd) La capacidad de llegar al entendimiento de las ideas expuestas.', 'Pendiente', '1', '1', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '12', 'En el párrafo que inicia con “Por ahí anda el talachero”… las palabras “magister dixit” significan: ', 'a) Magisterio designado. ', 'b) Maravilloso en las decisiones. ', 'c) Magnífico en el diccionario. ', 'd) Maestro en el decir. ', 'Pendiente', '1', '4', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '13', 'En el párrafo “A propósito del verbo hacer” el verbo se encuentra en que tiempo: ', 'a)	Gerundio', ' b) Infinitivo', 'c) Imperativo', 'd) Presente perfecto ', 'Pendiente', '1', '2', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '14', 'Al final de un texto se utiliza “Es una cédula embrionaria”, se trata de un: ', 'a) Sinónimo ', 'b) Antónimo ', 'c) Analogía ', 'd) Anocronismo ', 'Pendente', '1', '3', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '15', '“Si es cierto que hoy se venden muchos más libros”, se está cometiendo un:', 'a) Pleonasmo ', 'b) Aforismo ', 'c) Silogismo ', 'd) Error gramatical ', 'pendiente', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '16', 'Al conjugar el verbo hacer en… “ya la hizo. No la hace”, en que tiempo de conjugación se presentan: ', 'a)	Presente', 'b)Pretérito ', 'c) Futuro ', 'd) Pospretérito', 'Pendiente', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '17', 'Dentro del texto se mencionan a distintos autores, cuál de las opciones trata sobre filósofos: ', 'a) Bosco, Van Gogh y Goya', ' b) Borges, Cortazar y Paz ', 'c) Eco, Hawking y Kundera ', 'd) Heidegger, Sartre y Freud', 'Pendiente', '1', '4', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '18', 'Al terminar de leer el texto la idea general para su discusión es: ', 'a) Hacer una campaña para que se editen y vendan más libros en México. ', 'b) La necesidad de crear el hábito de lectura y una profunda comprensión. ', 'c) Publicitar a los escritores mexicanos para que sean famosos. ', 'd) ¿Qué son mejores? Los poetas, escritores, científicos ó literatos.', 'Pendiente', '1', '2', 'images/NUESTRO_PECADO_MORTAL.pdf' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '19', 'En la oración ¿puede haber creación científica sin raíz esotérica? La última palabra significa: ', 'a) Relación con las brujas.', 'b) Interacción con el más allá. ', 'c) Práctica y objetos metafísicos.', 'd) Práctica de la adivinación.', 'Pendiente', '1', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '20', '“Leer de verdad” es una oración que se refiere a: ', 'a) Lograr una comprensión total y profunda del texto. ', 'b) No caer en la mentira. ', 'c) Tener un conocimiento de la teoría sin llegar a la práctica. ', 'd) Estar en una realidad totalizadora.', 'Pendiente', '1', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '21', 'He´s my best friend and _______________ since I was a child. ', 'a) I´ve known him ', 'b) I knew him ', 'c) I´m knowing him ', 'd) I know him ', 'Pendiente', '2', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '22', 'I knew his name because ____________________ before. ', 'a) We have met ', 'b) We´d meted ', 'c) We had met ', 'd) We have been meeting ', 'Pendiente', '2', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '23', 'When the rain ___________________, we all went into the garden. ', 'a) Was stopping ', 'b) Stoped ', 'c) Was stopped ', 'd) Stopped ', 'Pendiente', '2', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '24', 'I´m sorry I´m late. How long ________________ here? ', 'a) Have you sat ', 'b) Did you sit ', 'c) Are you sitting ', 'd) Have you been sitting ', 'Pendiente', '2', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '25', 'They say that ______________ it is, the more elegant it looks. ', 'a) The simple ', 'b) Simpler ', 'c) The simpler ', 'd) More simple ', 'Pendiente', '2', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '26', 'Where´s dad? In ______________, practicing his golf as usual. ', 'a) The garden ', 'b) Gardens ', 'c) A garden 
', 'd) Garden ', 'Pendiente', '2', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '27', 'We got it to work better by __________ it off, then on again. ', 'a) Switch ', 'b) Switches ', 'c) Switching ', 'd) Switched ', 'Pendiente', '2', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '28', 'What is the gist (the main idea) that this piece of writing conveys? ', 'a. Wolves like to take care of human children. ', 'b. The city of Rome had many wolves in the old days. ', 'c. The city of Rome was founded by a wolf', 'c. The city of Rome was founded by a wolf', 'Pendiente', '2', '4', 'images/lec1Ingles.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '29', 'What is a herdsman? ', 'a. someone who builds cities ', 'b. someone who cares for children ', 'c. someone who cares for domestic animals ', 'd. someone who can hear very well', 'Pendiente', '2', '3', 'images/lec1Ingles.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '30', '"...they sought revenge on the king who had killed their mother..." means... ', 'a. They attacked the king who had harmed their mother and made them orphans. ', 'b. They went to court to sue the king for his crime against their mother. ', 'c. They hired some gangsters to take care of their problem with the king. ', 'd. They went to talk to the king about his crime against their mother.', 'Pendiente', '2', '1', 'images/lec1Ingles.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '31', 'Los siguientes números de la sucesión aritmética son: ', 'a) 19, 27           ', 'b) 11, 25              ', 'c) 22, 27      ', 'd) 22, 34', 'Pendiente', '3', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '32', 'Andrea al saltar de un trampolín, se eleva 1 m., para posteriormente bajar 5 m. (sumergiéndose en el agua) y después sube 2 m. para llegar a la superficie del agua. ¿A qué altura sobre el nivel del agua se encuentra el trampolín? ', 'a) 2m           ', 'b) 3m          ', 'c) 5.2m', 'd) 5.1m', 'Pendiente', '3', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '33', 'Los términos que faltan en la siguiente sucesión  son:                          ', 'a) 40, 24           ', 'b) 100, 80             ', 'c) 20, 60                 ', 'd) 100, 14', 'Pendiente', '3', '4', 'images/33.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '34', '¿Qué figura es la que sigue a la secuencia? ', 'a)', 'b)', 'c)', 'd)', 'pendiente', '3', '4', 'images/34.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '35', 'Al simplificar la operación de adición (2+4+6+8+10+12+......+98+100) - (1+3+5+7+9+11+13+.......+97+99) la diferencia es:', 'a)0', 'b)50', 'c)-50', 'd)22', 'pendiente', '3', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '36', '¿Qué figura es la que sigue a la secuencia? ', 'a)', 'b)', 'c)', 'd)', 'pendiente', '3', '2', 'images/36.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '37', 'Unos parásitos al reproducirse duplican su número cada minuto. Si hay un frasco a la mitad a las 7 horas 15 minutos, ¿qué hora será cuando se llene el frasco? ', 'a) 14 horas 30 minutos               ', 'b) 8 horas 30 minutos ', 'c) 14 horas 15 minutos              ', 'd) 7 horas 16 minutos', 'Pendiente', '3', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '38', 'Un cartero debe entregar en diferentes direcciones 12 paquetes. Si cada hora debe entregar 4 paquetes pero olvida entregar 2 , el tiempo que invierte en entregar todos es: ', 'a) 5 horas ', 'b) 4 horas ', 'c) 6 horas ', 'd) 3 horas ', 'Pendiente', '3', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '39', 'El décimo término de la sucesión aritmética 3, 10, 17, 24, … es: ', 'a) 30 ', 'b) 70 ', 'c) 66 ', 'd) 73 ', 'Pendiente', '3', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '40', 'Sea la siguente expresión', 'a)2 dígitos', 'b) 3 dígitos            ', 'c) 4 dígitos     ', 'd) 5 dígitos ', 'Pendiente', '3', '3', 'images/40.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '41', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '3', '4', 'images/41.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '42', 'En la fiesta de fin de año, asistieron varios profesores, todos se saludaron de mano, alguien se ocupó de contar el número de saludos y en total fueron 105 apretones de mano. ¿Cuántos profesores asistieron a la fiesta? ', 'a) 15 ', 'b) 105 ', 'c) 66 ', 'd) 53 ', 'Pendiente', '3', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '43', 'Un recipiente contiene 10 litros de jugo de zanahoria. Se toma un litro y se sustituye por jugo de naranja. Posteriormente se toman 2 litros de esta mezcla y se reponen con jugo de naranja. ¿Qué porcentaje de jugo de zanahoria hay finalmente en los 10 litros? ', 'a) 82 %          ', 'b) 62 %        ', 'c) 90 %              ', 'd) 72 % ', 'Pendiente', '3', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '44', 'Sea la siguiente Expresión:', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '3', '2', 'images/44.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '45', 'En una escuela naval, cada estudiante ha de dibujar una bandera blanca y negra, de tal manera que la parte negra cubra exactamente los tres quintos de la bandera. ¿Cuántas de estas banderas cumplen esa condición? ', 'a) Ninguna      ', 'b) Una               ', 'c) Dos                ', 'd) Tres ', 'Pendiente', '3', '3', 'images/45.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '46', 'La expresión algebraica que representa el enunciado: “ Un número más su recíproco es igual a 2” es: ', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '3', '1', 'images/46.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '47', 'El binomio que falta en la siguiente expresión matemática ', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '2', 'images/47.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '48', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '2', 'images/48.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '49', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '3', 'images/49.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '50', 'La simplificación a su mínima expresión de la fracción algebraica es:', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '1', 'images/50.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '51', 'Al efectuar las operaciones indicadas y simplificar se obtiene', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '3', 'images/51.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '52', 'Si factorizamos el polinomio, los factores son:', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '3', 'images/52.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '53', 'La solución de la ecuación   5 (2x-1) -5=3(x+2)-x  es:', 'a) x = -5           ', 'b) x = -11             ', 'c) x =5                 ', 'd) x = -2', 'Pnediente', '7', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '54', 'Un tinaco de almacenamiento de agua se puede llenar con 2 bombas trabajando juntas en 12 minutos. Se sabe que la bomba mayor puede hacer el llenado en 10 minutos menos que la otra. El tiempo en que puede llenar cada una trabajando sola el tinaco es: ', 'a) 10, 20 min.              ', 'b) 20, 30 min.             ', 'c) 30, 40 min.          ', 'd) 40, 50 min. ', 'Pendiente', '7', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '55', 'Una compañía que vende calculadoras científicas vende en promedio 600 calculadoras mensualmente a $800.00 por cada una, la empresa observa que si reducen el precio en $20.00 por calculadora se venderán 25 calculadoras más mensualmente, ¿A qué precio hay que vender las calculadoras para obtener el máximo posible? ', 'a) $ 800.00            ', 'b) $720.00              ', 'c) $640.00              ', 'd) $ 520.00 ', 'Pendiente', '7', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '56', 'Al simplificar al máximo aplicando leyes de los exponentes se obtiene', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '2', 'images/56.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '57', 'El valor de X es:', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '2', 'images/57.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '58', 'Al simplificar se obtiene', 'a)1', 'b)0', 'c)-1', 'd)2', 'Pendiente', '7', '2', 'images/58.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '59', 'Sea la siguinete expresión', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '4', 'images/59.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '60', 'Sea la siguinete expresión', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '4', 'images/60.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '61', 'El menor de dos números impares consecutivos es el doble del mayor disminuido en 15. Halla los números. ', 'a) 17 y 11     ', 'b) 9 y 11         ', 'c) 11 y 13       ', 'd)  11 y 15 ', 'Pendiente', '7', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '62', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '3', 'images/62.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '63', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '2', 'images/63.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '64', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '2', 'images/64.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '65', 'Sea la siguiente expresión', 'a)-2', 'b)-1', 'c)1', 'd)5', 'pendiente', '7', '4', 'images/65.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '66', 'Sea la siguiente Expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '2', 'images66.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '67', 'Calcula el valor del angulo B', 'a)15°', 'b)7°|', 'c)4°', 'd)66°', 'pendiente', '7', '4', 'images/67.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '68', 'Determina el valor de 2 ángulos que son suplementarios y el mayor es  50° más grande que la quinta parte del menor. ', 'a) 108.33° y 71.67°      ', ' b) 33.33° y 56.67°     ', 'c) 258.33° y 101.67°', 'd) 156° y 24°', 'Pendiente', '7', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '69', 'En el siguiente polígono regular, indica cuál es el valor del ángulo β:', 'a) 18°             ', 'b) 144° ', 'c)  72°', 'd) 66° ', 'Pendiente', '7', '2', 'images/69.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '70', 'Calcula el número de lados que tiene un polígono regular en el que se pueden trazar ', 'a) 10          ', 'b) 9             ', 'c) 12             ', 'd) 15 ', 'Pendiente', '7', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '71', 'El perímetro del siguiente triángulo es:', 'a) 103.2592 cm.            ', 'b) 48.5 cm.            ', ' c) 208 cm', 'd) 30 cm. ', 'Pendiente', '7', '2', 'images/71.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '72', 'Al simplificar la expresión  ( sec α + tan α) (1 – sen α) se obtiene: ', 'a)   1           ', 'b)  cos α              ', 'c)    tan α                  ', 'd) sen α', 'Pendiente', '7', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '73', 'Si los triángulos de la siguiente figura son semejantes, Encuentra el valor del lado BC.', 'a) 52              ', 'b) 62                   ', 'c)42', 'd)32', 'Pendiente', '7', '3', 'images/73.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '74', 'La expresión      11/6  (pi)  radianes   es equivalente a, ¿cuántos grados sexagesimales? ', 'a) 360°              ', 'b) 330°               ', 'c) 180°          ', 'd) 45° ', 'Pendiente', '7', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '75', 'En un triángulo rectángulo isósceles uno de los ángulos agudos es igual a 45°. ¿Cuál es el valor numérico de la Hipotenusa? ', 'a)', 'b)', 'c)', 'd)', 'Pendiente', '7', '1', 'images/75.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '76', 'La medida de un ángulo es igual a (4x + 20)°  y su ángulo opuesto por el vértice mide (6x – 34)° . El valor de es igual a: ', 'a)  22°                       ', 'b)   27°                    ', 'c)  37°                 ', 'd) 52°', 'Pendiente', '7', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '77', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '2', 'images/77.png
' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '78', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '1', 'images/78.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '79', 'El Círculo Trigonométrico queda dividido en cuatro partes por los Ejes Coordenados, denominadas Cuadrantes. Por tanto, el ángulo de 415° está ubicado ¿en qué Cuadrante? ', 'a) Primer Cuadrante             ', 'b) Segundo Cuadrante ', 'c) Tercer Cuadrante             ', 'd) Cuarto Cuadrante', 'pendiente', '7', '1', '' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '80', 'Sea la siguiente expresión', 'a)', 'b)', 'c)', 'd)', 'pendiente', '7', '3', 'images/80.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '81', 'Postularon que todas las especies de seres vivos han evolucionado con el tiempo a partir de un antepasado común mediante un proceso denominado selección natural. ', 'a) Charles Darwin y Alfred Russel Wallace ', 'b) Alfred Russel Wallace y Jean B. Lamarck ', 'c) Carlos Linneo y Charles Darwin ', 'd) Gregor Mendel y Charles Darwin', 'Pendiente', '4', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '82', 'Son ejemplo de factores bióticos: ', 'a) Luz y agua         ', 'b) Sal y plantas     ', 'c) Agua y polen      ', 'd) Plantas y animales', 'pendiente', '4', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '83', 'Ordena los siguientes niveles taxonómicos en forma descendente: ', 'a) 7, 3, 2, 5, 6, 4, 1 ', 'b) 7, 3, 2, 5, 6, 1, 4 ', 'c) 7, 6, 5, 4, 3, 2, 1 ', 'd) 7, 3, 2, 6, 4, 5, 1', 'pendiente', '4', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '84', 'Conjunto de organismos o individuos de la misma especie que coexisten en un mismo espacio y tiempo, y que comparten ciertas propiedades biológicas. ', 'a) Población', 'b) Ecosistema           ', 'c) Comunidad             ', 'd) Biodiversidad', 'pendiente', '4', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '85', 'Estudia las interacciones de los organismos y su ambiente. ', 'a) Taxonomía           ', 'b) Ecología             ', 'c) Sistemática            ', 'd) Botánica', 'pendiente', '4', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '86', 'Es el centro de la hemoglobina, y necesario para el transporte de oxígeno a las células. ', 'a) El fósforo            ', 'b) El potasio              ', 'c) El yodo                 ', 'd) El hierro', 'pendiente', '4', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '87', 'La alteración de la composición sanguínea entendida como la condición clínica determinada por una disminución de la masa eritrocitaria que condiciona una concentración baja de hemoglobina es conocida cómo. ', 'a) Anemia         ', 'b) Diabetes II         ', 'c) Bulimia nerviosa       ', 'd) Anorexia nerviosa', 'pendiente', '4', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '88', 'Tipo de metabolismo energético en el que los seres vivos extraen energía de moléculas orgánicas, como la glucosa, por un proceso complejo en el que el carbono es oxidado: ', 'a) Respiración aerobia 
', 'b) Respiración anaerobia ', 'c) Respiración con Dióxido de carbono y agua ', 'd) Respiración con Dióxido de carbono y oxígeno', 'pendiente', '4', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '89', '¿Cuáles son métodos anticonceptivos quirúrgicos? ', 'a) Implante anticonceptivo y anillo vaginal ', 'b) DIU y Condón masculino ', 'c) Salpingoclasia y Vasectomía ', 'd) Condón femenino y Salpingoclasia', 'pendiente', '4', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '90', 'Consiste en que de un organismo ya desarrollado se desprende una sola célula o trozos del cuerpo, los que por procesos mitóticos son capaces de formar un individuo completo, genéticamente idéntico a él. Se lleva a cabo con un solo progenitor y sin la intervención de los núcleos de las células sexuales o gametos. ', 'a) Reproducción sexual ', 'b) Reproducción asexual ', 'c) Reproducción con un solo progenitor y no hay células especializadas ', 'd) Reproducción con dos progenitores y no hay células especializadas', 'pendiente', '4', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '91', 'Son aquellas sustancias resultantes de la combinación de dos o más sustancias, de tal forma que es posible identificarlos por sus propiedades individuales y originales: ', 'a) Mezclas             ', ' b) Fórmulas             ', 'c) Compuestos             ', 'd) Soluciones', 'pendiente', '5', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '92', 'Cuando se unen dos no metales, en donde los átomos son iguales, generalmente son moléculas diatónicas da origen al enlace: ', 'a) Electrovalente ', 'b) Covalente puro ', 'c) Covalente polar          ', 'd) Covalente coordinado ', 'pendiente', '5', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '93', '¿De qué tipo son los hidrocarburos que presentan doble enlace en su estructura? ', 'a) Alcanos           ', 'b) Alquinos           ', '  c) Alquenos               ', 'd) Ciclo Alcanos', 'pendiente', '5', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '94', 'La fórmula del Ácido Sulfúrico es: ', 'a) HCl           ', ' b) N2H3 ', 'c) H2SO4           ', 'd) NaOH', 'pendiente', '5', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '95', 'Este tipo de enlaces se presentan en moléculas como el Cloruro de Sodio: ', 'a) Iónicos           ', 'b) Metálicos ', 'c) Coordinados', 'd) Covalentes no polares', 'pendiente', '5', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '96', 'En la siguiente ecuación química: KClO4                      KCl + O2 el coeficiente del KCl que nos indica la ecuación ajustada es: ', 'a) 1               ', 'b) 2                  ', 'c) 3                  ', 'd) 5', 'pendiente', '5', '1', 'images/96.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '97', 'La ecuación Al(OH)3 + H2SO4       ------------>   Al2(SO4)3 + H2O está correctamente ajustada si el coeficiente del H2SO4 es: ', 'a) 1             ', 'b) 2                 ', 'c) 3            ', 'd) 4', 'pendiente', '5', '3', 'images/97.png' );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '98', 'Es el número de orbitales que se tienen en el subnivel “p”: ', 'a) 1            ', 'b) 3               ', 'c) 5            ', 'd) 10', 'pendiente', '5', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '99', 'Los anhídridos están formados por: ', 'a) Un metal y oxígeno                   ', 'b) Un no metal y oxígeno ', 'c) Un metal e ión hidroxilo            ', 'd) Un no metal e ión hidroxilo', 'pendiente', '5', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '100', 'La reacción entre un hidrácido y un hidróxido, se clasifica como de:', 'a) Síntesis o adición', 'b) Descomposición o análisis ', 'c) Doble sustitución o catatesis', 'd) Simple sustitución o simple desplazamiento', 'pendiente', '5', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '101', '¿Cuál es la fórmula que representa la cadena lineal del Pentano? ', 'a) CH3 -CH2-CH2-CH2-CH3                                   ', 'b) CH3-CH2-CH2 -CH3 ', 'b) CH3-CH2-CH2 -CH3 ', 'd) CH3 – CH2-CH2-CH3', 'pendiente', '5', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '102', 'Para obtener 37.74g de Fe a partir de la reacción: 
Fe2O3 + CH4  2 Fe+ CO + 2 H2O 
( 159.6 ) ( 16 ) ( 111.6 ) ( 28 ) ( 36 ) Masas de combinación se cuenta con mineral de Fe2O3, el cual contiene 20% de impurezas. En estas condiciones, la cantidad de mineral necesaria para el proceso es aproximadamente:
', 'a) 27 g                        ', 'b) 43 g                    ', 'c) 54 g                          ', 'd) 214 g', 'pendiente', '5', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '103', 'Los compuestos _____________, se caracterizan por sus altos puntos de ebullición, formación de cristales, solubles en agua y al estar fundidos conducen la corriente eléctrica. ', 'a) Iónicos        ', 'B) Metálicos    ', 'C) Covalentes polares   ', 'D) Covalentes no polares', 'pendiente', '5', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '104', 'En la clasificación de cadenas de compuestos orgánicos el benceno tiene las siguientes características. ', 'a) Alicíclico, saturado, arborescente, con aroma ', 'b) Cíclico, saturado, arborescente, con aroma ', 'c) Alicíclico, saturado, simple, con aroma ', 'd) Cíclico, no saturado, simple, con aroma', 'pendiente', '5', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '105', 'En 1865 se propuso una estructura para el benceno. La Fórmula fue propuesta por: ', 'a) Dalton              ', 'b) Kekulé                  ', 'c) Millikan              ', 'd) Neuton', 'pendiente', '5', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '106', 'Un automóvil viaja a razón de 90 km./h. ¿Qué distancia recorre en un minuto? ', 'a) 90 m.             ', 'b)150 m.              ', 'c) 900 m.                   ', 'd) 1500 m.', 'pendiente', '6', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '107', 'Se deja caer un cuerpo desde la parte más alta de un edificio y tarda 6 segundos en llegar al suelo, la altura del edificio es igual a: ', 'a) 58.86 m.             ', 'b) 353.16 m.           ', 'c) 176.58 m.               ', 'd) 88.29 m.', 'pendiente', '6', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '108', '¿Cuál es el módulo del vector A= 3i-4j? ', 'a) -1                 ', 'b)1                   ', 'c)5                    ', 'd) 7', 'pendiente', '6', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '109', 'Encuentra el tiempo que requiere el motor de un elevador cuya potencia es de 42 kw. Para elevar una carga de 4500 N. hasta una altura de 30 m. ', 'a) 10.34 s.                ', 'b) 9.17 s.                   ', 'c) 5.2 s.                  ', 'd) 3.2 s.', 'pendiente', '6', '4', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '110', 'Al convertir 60 °F a Celsius se obtiene: ', 'a) 155 °C                ', 'b) 15.5 °C                   ', 'c) 140 °C                ', 'd) 14 °C', 'pendiente', '6', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '111', '¿Cuál es el incremento en la temperatura de 400 g. de agua cuando se aplican 34 Kcal? ', 'a) 80 °C                   ', 'b) 85 °C                       ', 'c) 8.5 °C            ', 'd) 0.85 °C', 'pendiente', '6', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '112', 'Dos cargas de 3 mC. se encuentran separadas 16 mm., ¿Qué sucede con la fuerza si la distancia se reduce a la mitad? ', 'a) 4 Farads                         ', 'b) 2 Farads
                       ', 'c) Farad /2                       ', 'd) Farad /4', 'pendiente', '6', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '113', '¿Cuál es la intensidad de corriente que circula por un conductor de 25 Ω, cuando se aplica en sus extremos una diferencia de potencial de 100 V.? 
', 'a) 4 Amperes.                    ', 'b) 0.25 Amperes.                 ', 'c) 2.5 Amperes. ', 'd) 40 Amperes', 'pendiente', '6', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '114', 'Dos resistencias de 3 y de 6 ohm. se conectan en paralelo, ¿Cuál es su resistencia equivalente?', 'a)	9 ohms', 'b) 4.5 ohms', 'c) 2 ohms', 'd) 1/4 ohms', 'pendiente', '6', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '115', 'Es el cambio de estado que ocurre de gas a líquido: ', 'a) Sublimación     ', 'b) Condensación      ', 'c) Evaporación      ', 'd) Cristalización', 'pendiente', '6', '2', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '116', '¿Cuál de los siguientes cuerpos no es inercial: ', 'a) Una silla           ', 'b) Un Edificio        ', 'c) Un poste de luz       ', 'd) Una Fábrica', 'pendiente', '6', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '117', '¿Cuál será la aceleración que produce una fuerza de 100 N a un cuerpo que pesa 5000 g.?', 'a) 30 metros /segundo al cuadrado                      ', 'b)15 metros /segundo al cuadrado         ', 'c) 20 metros /segundo al cuadrado                                  ', 'd) 12 metros /segundo al cuadrado', 'pendiente', '6', '3', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '118', 'Indica cuál de los siguientes cuerpos es un ejemplo de Energía Mecánica', 'a) Una maquina       ', 'b) Un lápiz       ', 'c) Un desarmador       ', 'd) Un vaso', 'pendiente', '6', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '119', 'Cuando dos bolas de billar colisionan a este efecto se le denomina', 'a) Choque Elástico                   ', 'b) Choque Inelástico ', 'c) Conducción                          ', 'd) Deformación Plástica', 'pendiente', '6', '1', NULL );
INSERT INTO `pregunta`(`idPregunta`,`oracion`,`opc1`,`opc2`,`opc3`,`opc4`,`just`,`tema`,`opcc`,`grafico`) VALUES ( '120', 'Indica cuál de estos siguientes efectos físicos no es un método de electrización: ', 'a) Frotamiento             ', 'b) Contacto            ', 'c) Rigidez               ', 'd) Inducción', 'pendiente', '6', '3', NULL );;
-- ---------------------------------------------------------


-- Dump data of "recomendacion" ----------------------------
-- ---------------------------------------------------------


-- Dump data of "tema" -------------------------------------
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '1', 'Comunicación Español', '1' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '2', 'Comunicación Ingles', '2' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '3', 'HABILIDAD MATEMÁTICA', '3' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '4', 'BIOLOGÍA', '4' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '5', 'Química', '5' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '6', 'Física', '6' );
INSERT INTO `tema`(`idTema`,`nombre`,`idMateria`) VALUES ( '7', 'Matematicas', '7' );;
-- ---------------------------------------------------------


-- Dump data of "usuario" ----------------------------------
INSERT INTO `usuario`(`username`,`password`,`tipo`,`creado`,`modificado`,`login`,`passwordStrategy`,`salt`,`login_ip`) VALUES ( 'Javier Corona', '$2a$12$YMJ3gepOuyzHZqffJNfPeuAkgliLMskEcz9.BEZmyETye32dj.gty', '2', '2013-09-03 17:23:37', '2013-09-03 17:23:37', '2013-09-21 15:46:42', 'bcrypt', '$2a$12$YMJ3gepOuyzHZqffJNfPew', '::1' );
INSERT INTO `usuario`(`username`,`password`,`tipo`,`creado`,`modificado`,`login`,`passwordStrategy`,`salt`,`login_ip`) VALUES ( 'Lockon', '$2a$10$MWq4WBWlLVBf2JjtR6IYqubb2oLEfUzEfb0.q1BKNaom2zMNSJ58y', '2', '2013-07-23 01:41:45', '2013-07-23 01:41:45', '2014-01-20 19:26:06', 'bcrypt', '$2a$12$FcGIG83ez.Qid/jCpJ8OsQ', '::1' );
INSERT INTO `usuario`(`username`,`password`,`tipo`,`creado`,`modificado`,`login`,`passwordStrategy`,`salt`,`login_ip`) VALUES ( 'LockonZwei', '$2a$10$P1TUINvn5MaH6imdQNQspOL9AvrFCRrf1zwmEzVt.MUpdd9NCufpm', '1', '2014-03-22 08:58:47', '2014-03-22 08:58:47', NULL, NULL, NULL, '127.0.0.1' );
INSERT INTO `usuario`(`username`,`password`,`tipo`,`creado`,`modificado`,`login`,`passwordStrategy`,`salt`,`login_ip`) VALUES ( 'Nuevo', '$2a$12$9he.E.0FmTDAJGJcFrAEoOJUT4CtYXiLTmriHUhk48E5RGGs/ULWC', '1', '2013-08-01 18:23:01', '2013-08-01 18:23:01', '2013-08-01 18:23:17', 'bcrypt', '$2a$12$9he.E.0FmTDAJGJcFrAEoQ', '127.0.0.1' );
INSERT INTO `usuario`(`username`,`password`,`tipo`,`creado`,`modificado`,`login`,`passwordStrategy`,`salt`,`login_ip`) VALUES ( 'paco', '$2a$12$otAkHgHTjdUMjTh/n.W3SuQ72X52bdksHQf39BDX16BYdk0j6Km4q', '2', '2013-09-23 11:23:04', '2013-09-23 11:23:04', '2013-10-09 07:11:35', 'bcrypt', '$2a$12$otAkHgHTjdUMjTh/n.W3Sw', '127.0.0.1' );;
-- ---------------------------------------------------------


-- Dump data of "usuario_datos" ----------------------------
-- ---------------------------------------------------------


-- CREATE INDEX "idUser_idx" -------------------------------
CREATE INDEX `idUser_idx` USING BTREE ON `examen`( `idUser` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_Examen_Resultado_Examen1_idx" ----------
CREATE INDEX `fk_Examen_Resultado_Examen1_idx` USING BTREE ON `examen_resultado`( `idExamen` );
-- ---------------------------------------------------------


-- CREATE INDEX "materia_idx" ------------------------------
CREATE INDEX `materia_idx` USING BTREE ON `examen_resultado`( `materia` );
-- ---------------------------------------------------------


-- CREATE INDEX "tema_idx" ---------------------------------
CREATE INDEX `tema_idx` USING BTREE ON `pregunta`( `tema` );
-- ---------------------------------------------------------


-- CREATE INDEX "idTema_idx" -------------------------------
CREATE INDEX `idTema_idx` USING BTREE ON `recomendacion`( `idTema` );
-- ---------------------------------------------------------


-- CREATE INDEX "fk_Tema_Materia1_idx" ---------------------
CREATE INDEX `fk_Tema_Materia1_idx` USING BTREE ON `tema`( `idMateria` );
-- ---------------------------------------------------------


-- CREATE LINK "idUser" ------------------------------------
ALTER TABLE `examen` ADD CONSTRAINT `idUser` FOREIGN KEY ( `idUser` ) REFERENCES `usuario`( `idUsuario` ) ON DELETE No Action ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "fk_Examen_Resultado_Examen1" ---------------
ALTER TABLE `examen_resultado` ADD CONSTRAINT `fk_Examen_Resultado_Examen1` FOREIGN KEY ( `idExamen` ) REFERENCES `examen`( `idExamen` ) ON DELETE No Action ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "materia" -----------------------------------
ALTER TABLE `examen_resultado` ADD CONSTRAINT `materia` FOREIGN KEY ( `materia` ) REFERENCES `materia`( `idMateria` ) ON DELETE No Action ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "pregunta_tema" -----------------------------
ALTER TABLE `pregunta` ADD CONSTRAINT `pregunta_tema` FOREIGN KEY ( `tema` ) REFERENCES `tema`( `idTema` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "idTema" ------------------------------------
ALTER TABLE `recomendacion` ADD CONSTRAINT `idTema` FOREIGN KEY ( `idTema` ) REFERENCES `tema`( `idTema` ) ON DELETE No Action ON UPDATE No Action;
-- ---------------------------------------------------------


-- CREATE LINK "tema_materia" ------------------------------
ALTER TABLE `tema` ADD CONSTRAINT `tema_materia` FOREIGN KEY ( `idMateria` ) REFERENCES `materia`( `idMateria` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


-- CREATE LINK "fk_username" -------------------------------
ALTER TABLE `usuario_datos` ADD CONSTRAINT `fk_username` FOREIGN KEY ( `idUser` ) REFERENCES `usuario`( `username` ) ON DELETE Cascade ON UPDATE Cascade;
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


