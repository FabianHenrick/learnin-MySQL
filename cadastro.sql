
 /* ##### DDL #####
   Data Definition Language
   comando de definição de dados, como CREATE DATABASE, CREATE TABLE, ALTER TABLE, DROP TABLE.
 */
 
  /* ##### DML #####
   Data Manipulation Language
   comando de manipulação de dados, como INSERT INTO, UPDATE, DELETE, TRUNCATE
 */

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
