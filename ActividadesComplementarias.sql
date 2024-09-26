/*Crea una tabla llamada concentracion_de_hidrogenos con una columna de id incremental, 
y otra columna nanomoles_por_litro, y rellénala con 10 números, estos numeros deben ser el resultado 
de elevar 10 a un exponente aleatorio entero entre 9 y (-5).*/

create table concentracion_de_hidrogenos (
id int auto_increment primary key,
nanomoles_por_litro decimal(20, 10)
);

INSERT INTO concentracion_de_hidrogenos (nanomoles_por_litro)
VALUES
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5)),
    (POWER(10, FLOOR(RAND() * 15) - 5));

/*Crea una vista donde agregues la columna ph donde calcules el ph de la sustancia. Utiliza la siguiente formula: 

pH = -log[H+]

Log: es el logaritmo en base 10.

[H+]: es la concentración de hidrogeno en moles.

Como la tabla tiene guarda el valor de la concentración en nanomoles debes hacer la conversión a moles primero:

1 mol = 1.000.000.000 nanomoles.*/

create view vista_ph as select
id,
nanomoles_por_litro,
round(-log10(nanomoles_por_litro / 1000000000), 2) as ph from concentracion_de_hidrogenos;

/*Crea una vista donde agregues la columna escala_de_ph donde etiquetes la sustancia con las
 siguientes categorías según su ph:

Acida : 7 < ph > 0

Neutra: ph = 7

Alcalina: 14 < ph > 7*/

create view vista_ph_categoria as select
id,
nanomoles_por_litro,
ph,
case
when ph < 7 then 'Acida'
when ph = 7 then 'Neutra'
when ph > 7 then 'Alcalina'
end as escala_de_ph from vista_ph;

/*Crea la tabla numeros_ocultos con la columna_1 de tipo varchar y la columna_2
 de int y rellénala con estos valores:

VALUES

('EB4ECB', 16),

('25SK1E', 31),

('8C2B88', 22),

('58D660A', 15),

('100010020211000', 3),

('20251A2', 13),

('4MFL6M', 23),

('IO36L', 29),

('748D676', 14),

('J1G50', 32)*/

create table numeros_ocultos(
columna_1 varchar(255),
columna_2 int
);

INSERT INTO numeros_ocultos (columna_1, columna_2)
VALUES
    ('EB4ECB', 16),
    ('25SK1E', 31),
    ('8C2B88', 22),
    ('58D660A', 15),
    ('100010020211000', 3),
    ('20251A2', 13),
    ('4MFL6M', 23),
    ('IO36L', 29),
    ('748D676', 14),
    ('J1G50', 32);


/*Todos los números de la primera columna de la tabla anterior están expresados en una base
 numérica correspondiente a la segunda columna, crea una vista con una tercera columna para
 mostrar los números de la columna_1 expresados en base 10 y ordénalos de mayor a menor.*/
 
 create view vista_numeros_ocultos as select
 columna_1,
 columna_2,
 conv(columna_1, columna_2, 10) as base_10
 from numeros_ocultos
 order by base_10 desc;

/*Actualiza la vista_ahorros_futuros para que no incluya la columna ahorro_inicial,
 y luego crea una nueva vista vista_ahorro_inicial donde utilices la vista_ahorros_futuros y 
 la siguiente fórmula para calcular una nueva columna ahorro_inicial, incluye las demás columnas 
 excepto tasa_interes en la vista final: 

VA = VF / (1+r)^n

VA: Valor actual (ahorro_inicial).

VF: Valor futuro (ahorros futuros).

r:  La tasa de interés (tasa_interes).

n: El número de periodos (periodos).*/

create or replace view vista_ahorros_futuros as select
periodos,
tasa_interes,
round(ahorro_inicial * power(1 + (tasa_interes / 100), periodos), 2) as valor_futuro
from ahorros;

create view vista_ahorro_inicial as select
valor_futuro,
periodos,
round(valor_futuro / power(1 + (tasa_interes / 100), periodos), 2) as ahorro_inicial
from vista_ahorros_futuros;

/*Crea una nueva vista vista_tasa_interes donde utilices la vista_ahorro_inicial y la
 siguiente fórmula para calcular la columna tasa_interes, incluye las demás columnas,
 excepto “periodos”, en la vista final:

r = ( (VF / VA)^(1/n) ) - 1

r: La tasa de interés (tasa_interes).

VF: Valor futuro (ahorros futuros).

VA: Valor actual (ahorro_inicial).

n: El número de periodos (periodos).*/

create view vista_tasa_interes as select
valor_futuro,
ahorro_inicial,
round(power((valor_futuro / ahorro_inicial), (1.0 / periodos)) - 1, 4) as tasa_interes
from vista_ahorro_inicial;

/*Crea una nueva vista vista_periodos donde utilices la vista_tasa_interes y 
la siguiente fórmula para calcular la columna periodos, incluye todas las columnas en la vista final:

n = ln(VF / VA) / ln(1 + r)

n: El número de periodos (periodos).

VF: Valor futuro (ahorros futuros).

VA: Valor actual (ahorro_inicial).

r: La tasa de interés (tasa_interes).*/

create view vista_periodos as select
valor_futuro,
ahorro_inicial,
tasa_interes,
round(log(valor_futuro / ahorro_inicial) / log(1 + tasa_interes), 2) as periodos
from vista_tasa_interes;