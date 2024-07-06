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
