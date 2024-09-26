create view mapa_de_clientes as select nombre from empleados where id;

/*Crea una tabla triangulos_rectangulos con dos columnas: longitud_lado_adyacente y longitud lado_opuesto,
 ambos de tipo INT.*/
 
 create table triangulos_rectangulos (
 longitud_lado_adyacente int,
 longitud_lado_opuesto int
 );

/*Rellena la tabla triangulos_rectangulos con 10 filas con enteros aleatorios entre 1 y 100*/

insert into triangulos_rectangulos (longitud_lado_adyacente, longitud_lado_opuesto) values
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100)),
(FLoor (1 +  rand() * 100), floor(1+rand()*100));

/*Crea una vista donde agregues la columna “hipotenusa” calculándola a partir de los otros dos lados.
 Utiliza el teorema de Pitágoras para realizar el cálculo: Siendo el lado adyacente “A” y el opuesto “B” 
 y la hipotenusa “C” la fórmula quedaría de la siguiente forma:

C =A2+B2​*/

create view vista_triangulos as select
longitud_lado_adyacente,
longitud_lado_opuesto,
round(sqrt(pow(longitud_lado_adyacente,2)+pow(longitud_lado_opuesto,2)), 2) as hipotenusa
from triangulos_rectangulos;

/*Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo α en radianes y grados. Aquí tienes dos fórmulas:

En radianes: =arcsen(BC) =arccos(AC) = arctan(BA)  */

create or replace view vista_triangulos as select
longitud_lado_adyacente,
longitud_lado_opuesto,
round(sqrt(pow(longitud_lado_adyacente, 2) +pow(longitud_lado_opuesto, 2)),2) as hipotenusa,
round(asin(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2))),2) as angulo_alpha_radianes,
round(degrees(asin(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2)+pow(longitud_lado_opuesto, 2)))),2) as angulo_alpha_grados
from triangulos_rectangulos;

/*Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo β en radianes y grados. Aquí tienes dos fórmulas:

En radianes: β =arccos(BC)=arcsen(AC) = arctan(AB) */ 

create or replace view vista_triangulos as select
longitud_lado_adyacente, longitud_lado_opuesto,
round(sqrt(pow(longitud_lado_adyacente,2)+ pow(longitud_lado_opuesto, 2)), 2) as hipotenusa,
round(asin(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2))),2) as angulo_alpha_radianes,
round(degrees(asin(longitud_lado_OPUESTO / SQRT(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2)))),2) as angulo_alpha_grados,
round(acos(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2))), 2) as angulo_beta_radianes,
round(degrees(acos(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2)))), 2) as angulo_beta_grados
from triangulos_rectangulos;

/*Reemplaza la vista y ahora agrégale dos columnas para calcular el ángulo γ en radianes y grados.
 Como se trata de triángulos rectángulos, el ángulo es de 90°, pero aplica una fórmula de igual manera,
 usa la regla de que la suma de los ángulos de un triángulo suma 180°.*/

create or replace view vista_triangulos as select
longitud_lado_adyacente,
longitud_lado_opuesto,
round(sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2)), 2) as hipotenusa,
round(asin(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) + pow(longitud_lado_opuesto, 2))),2) as angulo_alpha_radiante,
round(degrees(asin(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) +pow(longitud_lado_opuesto, 2)))), 2) as angulo_alpha_grados,
round(acos(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2) +pow(longitud_lado_opuesto, 2))), 2) as angulo_beta_radianes,
round(degrees(acos(longitud_lado_opuesto / sqrt(pow(longitud_lado_adyacente, 2)+ pow(longitud_lado_opuesto, 2)))),2) as angulo_beta_grados,
90 as angulo_gamma_grados from triangulos_rectangulos;

/*Crea una tabla triangulos_rectangulos_2 con dos columnas: angulo_alfa y una hipotenusa ambos de tipo INT.*/

create table triangulos_rectangulos_2 (
angulo_alfa int,
hipotenusa int
);

/*Rellena la tabla triangulos_rectangulos_2 con 10 filas con enteros aleatorios entre 1 y 89 para angulo_alfa
 y enteros aleatorios entre 1 y 100 para la columna hipotenusa.*/
 
 insert into triangulos_rectangulos_2 (angulo_alfa, hipotenusa) values
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100)),
(floor(1 + rand() * 89),floor( 1 + rand() * 100));

/*Crea una vista donde agregues la columna lado_adyacente donde calcules su longitud.*/

create view vista_triangulos_2 as select
angulo_alfa,
hipotenusa,
round(hipotenusa * cos(radians(angulo_alfa)), 2) as lado_adyacente from triangulos_rectangulos_2;

/*Agrega a la vista la columna lado_opuesto donde calcules su longitud.
Agrega a la vista la columna angulo_beta donde calcules su valor en grados.
Agrega a la vista la columna angulo_gamma donde calcules su valor en grados.
Redondea todos los valores con hasta dos números decimales.*/

create or replace view vista_triangulos_2 as select
angulo_alfa,
hipotenusa,
round(hipotenusa * cos(radians(angulo_alfa)), 2) as lado_adyacente,
round(hipotenusa * sin(radians(angulo_alfa)), 2) as lado_opuesto,
round(90 - angulo_alfa, 2) as angulo_beta,
90.00 as angulo_gamma 
from triangulos_rectangulos_2;

/* - - - - - - - - - - - - - - - - - - - - */

/*Crea una tabla mensajes que tenga una columna “datos” de tipo varchar y una columna valor_crc de tipo int,
 con las siguientes filas: VALUES

    ('Hola, ¿cómo estás? Espero que tengas un buen día.',3221685809),

    ('Ayer fui al cine a ver una película genial.', 951196167),

    ('Estoy emocionado por el próximo fin de semana.', 3275166159),

    ('Mi reunión se pospuso para el martes que viene.', 169741145),

    ('He estado trabajando en un proyecto importante.', 6480112535),

    ('Esta receta de pastel de manzana es deliciosa.', 2524836786),

    ('Planeo hacer un viaje a la playa este verano.', 5107635050),

    ('Mi gato se divierte jugando con su pelota.', 3578632817),

    ('Hoy es un día soleado y agradable.', 3675102258),

    ('El libro que estoy leyendo es muy interesante.', 854938277);*/

create table mensajes( 
datos varchar(255),
valor_crc bigint
);

INSERT INTO mensajes (datos, valor_crc) 
VALUES
    ('Hola, ¿cómo estás? Espero que tengas un buen día.', 3221685809),
    ('Ayer fui al cine a ver una película genial.', 951196167),
    ('Estoy emocionado por el próximo fin de semana.', 3275166159),
    ('Mi reunión se pospuso para el martes que viene.', 169741145),
    ('He estado trabajando en un proyecto importante.', 6480112535),
    ('Esta receta de pastel de manzana es deliciosa.', 2524836786),
    ('Planeo hacer un viaje a la playa este verano.', 5107635050),
    ('Mi gato se divierte jugando con su pelota.', 3578632817),
    ('Hoy es un día soleado y agradable.', 3675102258),
    ('El libro que estoy leyendo es muy interesante.', 854938277);


/*Crea una vista con una tercera columna “análisis” donde verifiques si el valor crc del mensaje
 es igual al valor de la segunda columna, si no es igual muestra un mensaje “adulterado” en
 la tercera columna o “correcto” en el caso contrario.*/

create view vista_mensajes as select
datos, valor_crc,
case
when valor_crc = crc32(datos) then 'correcto' else 'adulterado'
end as analisis from mensajes;

/*Crea una tabla llamada ahorros con tres columnas: ahorro_inicial (la cantidad inicial de ahorros en dólares)
 de tipo decimal(10, 2), periodos (el número de períodos en años) de tipo int, y tasa_interes
 (la tasa de interés nominal anual en porcentaje) de tipo decimal(5, 2). */
 
 create table ahorros (
 ahorro_inicial decimal(10, 2),
 periodos int, 
 tasa_interes decimal(5, 2)
 );

/*Llena la tabla con 10 filas de números aleatorios para ahorro_inicial (un valor mayor a 1000),
 periodos (un valor entre 1 y 10), y tasa_interes (un valor entre 1 y 1,20).*/

INSERT INTO ahorros (ahorro_inicial, periodos, tasa_interes)
VALUES
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2)),
    (FLOOR(RAND() * 9000) + 1000, FLOOR(RAND() * 10) + 1, ROUND((RAND() * 0.20) + 1, 2));


/*Crea una vista llamada vista_ahorros_futuros que incluya una columna con el cálculo de los ahorros 
futuros ajustados por la tasa de interés. Para esto utilizaremos la fórmula para calcular el interés compuesto:

VF = VA x (1+r)^n

VF: Valor futuro (ahorros futuros).

VA: Valor actual (ahorro_inicial).

r: La tasa de interés (tasa_interes).

n: El número de periodos (periodos).*/

create view vista_ahorros_futuros as select
ahorro_inicial,
 periodos,
 tasa_interes,
 round(ahorro_inicial * power(1 + (tasa_interes / 100), periodos), 2) as valor_futuro
 from ahorros;
