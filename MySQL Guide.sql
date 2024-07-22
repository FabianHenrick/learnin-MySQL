
 /* ##### DDL #####
   Data Definition Language
   comando de definição de dados, como CREATE DATABASE, CREATE TABLE, ALTER TABLE, DROP TABLE.
 */
 
  /* ##### DML #####
   Data Manipulation Language
   comando de manipulação de dados, como INSERT INTO, UPDATE, DELETE, TRUNCATE
 */

   /* ##### DQL #####
   Data Query Language
   comando de seleção de dados, como SELECT
 */


 /* OBS: Não existe Ctrl+Z portanto jamais trabalhe diretamente com o banco de dados da aplicação, e sempre tenha um backup*/

Create database cadastro
default character set utf8
default collate utf8_general_ci;
 /* ao settar o chatset como utfl nosso banco de dados passa a conseguir trabalhar com caracteres com acentuação*/
use cadastro;

CREATE TABLE `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `nascimento` date ,
  `sexo` enum('M','F'),
  `peso` decimal(5,2) ,
  `altura` decimal(3,2) ,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  PRIMARY KEY (`id`)
) DEFAULT CHARSET = utf8;


Insert into pessoas(nome, nascimento, sexo, peso, altura, nacionalidade)
values('Fabian', '1998-03-26' , 'M' , '90.50', '1.76', 'Brasil' );
 /*Obs: É possivel declarar Default no lugar de algum valor que já tenha algo declarado como padrão
 como no caso de 'ID' e de 'Nacionalidade'*/

  /*Forma abreviada para inserir valores, quando seguem a mesma ordem declarada na tabela*/
Insert into pessoas values('Fabian', '1998-03-26' , 'M' , '90.50', '1.76', 'Brasil' );

Insert into pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade)
values(Default,'Fabian', '1998-03-26' , 'M' , '90.50', '1.76', 'Brasil'),
(Default,'Sayuri', '1999-02-18' , 'F' , '50.2', '1.54', 'Japão' ),
(Default,'Gebiscreidison', '1988-07-21' , 'M' , '103.50', '1.790', 'EUA');	
/*adcionando a virgula e seguindo o mesmo padrão mas preenchendo dados diferentes, é possivel adcionar vários cadastros em um único insert, apenas lembrando de adcionar o ";" no ultimo cadastro para demonstrar o fim do comando */

select * from pessoas;

 /*Alteração de tabelas usando Alter table'*/
alter table pessoas
add column profissao varchar(10);
 /*Add collum para adcionar um campo'*/
 
alter table pessoas
drop column profissao;
/*drop collum para remover um campo'*/

alter table pessoas
add column profissao varchar(10) after nome;
/*add collum... after para adcionar um campo em uma posição espevífica após o nome do campo mencionado.'*/

alter table pessoas
add column codigo int first ;
/*add collum... first para adcionar um campo na primeira posição da tabela.'*/

alter table pessoas
modify column profissao varchar(20) not null default '';
/*Modify para modificar o tipo primitivo e suas constraints'*/

alter table pessoas
change column profissao prof varchar(20);
/*change para modificar o nome de um campo seu tipo primitivo e suas constraints'*/

alter table pessoas
rename to sereshumaninhos;
/*rename to para modificar o nome de uma tabela'*/

####################### Criando nova tabela #######################

create table if not exists cursos(
nome varchar(30) not null UNIQUE,
descricao text,
carga int UNSIGNED,
totaulas int UNSIGNED,
ano year default '2016'
)default charset = utf8mb4;

/*if not exists serve para criar a tabela somente caso não exista uma tabela com o mesmo nome*/

/* UNIQUE serve para não permitir registrar valores iguais sem necessidade de definir como uma primary key*/

/* UNSIGNED serve para registar somente valores positivos*/

alter table cursos
add column idcurso int first;

alter table cursos
add primary key (idcurso);
/* add primary key vai adcionar ao campo idcurso uma primary key*/

drop table if exists tabelaparaexcluir;
/* drop table apaga completamente a tabela */

UPDATE cursos
set nome = 'HTML5' 
where idcurso = '1';
/* UPDATE serve para atualizar uma informação , o SET vai definir o campo nome para "HTML5
e o WHERE é o que da a localização do campo que vai ser modificado"
obs: colocando apenas a , após o campo alterado é possivel alterar mais de um campo ao mesmo tempo
 */
 
update cursos
set carga = '40'
where ano = '2015'
limit 1;
/*  colocando apenas a , após o campo alterado é possivel alterar mais de um campo ao mesmo tempo
é possivel adcionar o LIMIT no fim do comando para limitar quantas linhas vão ser alterados ao mesmo tempo
 */
 
 delete from cursos
 where nome = 'World'
 limit 2;
 /* serve para deletar registros e também é possivel adcionar o LIMIT no fim do comando para limitar quantas linhas vão ser alterados ao mesmo tempo
 */
 
 truncate table tabelaParaLimpar;
 /* serve para deletar TODOS registros da tabela*/
/*

O PHPMyAdmin é uma ferramenta gratuita e de código aberto que facilita a administração de bancos de dados MySQL e MariaDB através de uma interface web.
Ele permite que usuários gerenciem suas bases de dados de maneira visual, sem a necessidade de utilizar comandos SQL diretamente no terminal.
O PHPMyAdmin é frequentemente utilizado por desenvolvedores web, administradores de sistemas e qualquer pessoa que precise gerenciar bancos de dados MySQL ou MariaDB.
É particularmente popular em ambientes de desenvolvimento local, como parte de pacotes de servidores web (por exemplo, XAMPP, MAMP, WAMP) que incluem Apache, MySQL e PHP.

Em resumo, o PHPMyAdmin é uma ferramenta poderosa e versátil que simplifica a administração de bancos de dados através de uma interface web amigável.
*/

select * from cursos
order by nome desc;

 /* ao usar o comando select é possivel usar como parametro o "order by" e o nome de uma coluna para exibir em ordem alfabética ou númerica
Obs: o desc serve para inverter a ordem.
*/

select nome, carga, ano from cursos
order by nome ;

 /* É possivel colocar apenas os nomes das colunas que deseja para receber apenas elas como resultados*/

select nome, carga, ano from cursos
where ano = '2016'
order by nome ;

 /* É possivel usar o comando Where como uma condição para mostrar apenas as linhas com o filtro '2016' por exemplo*/

select nome, carga, ano from cursos
where ano <= 2016
order by nome ;
 /* É possivel usar a mesma sintaxe de algoritimos para passar comandos, como por exemplo o " where ano <= 2016"  vai filtrar e exibir todos os que possuam o valor de ano menor ou igual ao 2016*/

select * from cursos
where ano  between 2014 and 2017;

/* O camando "between" pode ser usado como parametro para filtrar e exibir dados entre os valores determinados.*/

select * from cursos
where ano  in ('2014', '2017', '2018');

/* O camando "in" pode ser usado como parametro para filtrar e exibir dados que apresentam valores pesceficos*/

select * from cursos
where carga >35 and totaulas < 30;

 /* É possivel fazer expressões condicionais mais complexas pra ter filtragens mais elaboradas*/

select * from cursos
where carga >35 or totaulas < 30;

 /* Ao usar o "or" no lugar de and, a filtragem vai exibir resultados contanto que um campo tenha resultado verdadeiro para sua condição*/


select * from cursos
where nome like 'P%'; 



/* usando como operador o 'Like'(Se pareça) e passando como filtro 'a%'  onde o '%' sgnifica qualquer coisa mais o dado de parametro,
 se a % for colocada no inicio ('%a') vai retornar tudo que terminar com a letra a,
 enquanto ('a%') vai retornar tudo que começar com a letra a.
OBS: ao colocar o "Not" antes do like ele passa a se tornar operador de negação.
 */

/* WILDCARD em MySQL é um caractere especial utilizado em consultas SQL para substituir um ou mais caracteres. É especialmente útil em operações de busca com a cláusula LIKE. Existem dois wildcards principais em MySQL:

Porcentagem (%): Substitui zero ou mais caracteres. Por exemplo:
 */
SELECT * FROM produtos WHERE nome LIKE 'maçã%';
/*Este comando seleciona todos os produtos cujo nome começa com "maçã", como "maçã", "maçã verde", "maçã vermelha", etc.
Underline (_): Substitui exatamente um caractere. Por exemplo: */

SELECT * FROM produtos WHERE nome LIKE 'maç_';
/*Este comando seleciona todos os produtos cujo nome é "maç" seguido por exatamente um caractere, como "maçã" ou "maço".
Wildcards são bastante úteis para realizar buscas flexíveis e encontrar registros que correspondam a padrões específicos.
 */
select distinct nacionalidade from gafanhotos
order by nacionalidade ;

/*O comando "Distinct" no MySQL é usada para remover duplicatas de um conjunto de resultados. Quando você utiliza SELECT DISTINCT, apenas os valores únicos serão retornados na consulta,
eliminando quaisquer linhas duplicadas. Isso é particularmente útil quando você precisa garantir que os dados retornados não contenham repetições.. 
no exemplo citado ele vai apresentar apenas um exemplo de cada nacionalidade presente na tabela gafanhotos, evitando repetições.
 */

select count(*) from cursos
 where carga >40;

/* o "count" é uma função de agregação, ela vai agrupar e contar os registros retornando quantos registro temos que atendem as condições, no caso do sexemplo, que tem uma carga maior que 40.
 */

Principais Funções de Agregação:
COUNT: Conta o número de linhas em um conjunto de resultados.


SELECT SUM(carga) FROM pedidos;
/*SUM: Calcula a soma de um conjunto de valores.*/

SELECT AVG(carga) FROM pedidos;
/*AVG: Calcula a média de um conjunto de valores.*/

SELECT MAX(carga) FROM pedidos;
/*MAX: Retorna o valor máximo de um conjunto de valores.*/

SELECT MIN(carga) FROM pedidos;
/*MIN: Retorna o valor mínimo de um conjunto de valores.*/




