CREATE DATABASE IF NOT EXISTS EMPRESA;
USE EMPRESA;
CREATE TABLE IF NOT EXISTS FUNCIONARIO
(Pnome VARCHAR(15) NOT NULL,
Minicial CHAR,
Unome VARCHAR(15) NOT NULL,
Cpf CHAR(11) NOT NULL,
Datanasc DATE,
Endereco VARCHAR(100),
Sexo CHAR,
Salario DECIMAL(10,2),
Cpf_supervisor CHAR(11) NULL,
Dnr INT,
PRIMARY KEY (Cpf),
FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)
);
CREATE TABLE IF NOT EXISTS DEPARTAMENTO
( Dnome VARCHAR(15) NOT NULL,
Dnumero INT NOT NULL,
Cpf_gerente CHAR(11) NULL,
Data_inicio_gerente DATE,
PRIMARY KEY (Dnumero),
UNIQUE (Dnome),
FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf));

ALTER TABLE FUNCIONARIO
ADD FOREIGN KEY (Dnr) REFERENCES DEPARTAMENTO(Dnumero);

CREATE TABLE IF NOT EXISTS LOCALIZACAO_DEP
( Dnumero INT NOT NULL,
Dlocal VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumero, Dlocal),
FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO(Dnumero) 
);

CREATE TABLE IF NOT EXISTS PROJETO
(Projnome VARCHAR(15) NOT NULL,
Projnumero INT NOT NULL,
Projlocal VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Projnumero),
UNIQUE (Projnome),
FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO(Dnumero) 
);
CREATE TABLE IF NOT EXISTS TRABALHA_EM
( Fcpf CHAR(11) NOT NULL,
Pnr INT NOT NULL,
Horas DECIMAL(3,1) NULL,
PRIMARY KEY (Fcpf, Pnr),
FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf),
FOREIGN KEY (Pnr) REFERENCES PROJETO(Projnumero) 
);
CREATE TABLE IF NOT EXISTS DEPENDENTE
( Fcpf CHAR(11) NOT NULL,
Nome_dependente VARCHAR(15) NOT NULL,
Sexo CHAR,
Datanasc DATE,
Parentesco VARCHAR(8),
PRIMARY KEY (Fcpf, Nome_dependente),
FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf) 
);
-- Populando a tabela departamentos.
INSERT INTO DEPARTAMENTO (Dnome, Dnumero, Data_inicio_gerente) 
VALUES
('Pesquisa',6,"1966-05-22"),
('Admnistração',4,"1995-01-01"),
('Matriz',1,"1981-06-19");
-- Populando a tabela departamentos.
INSERT INTO FUNCIONARIO (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
VALUES
('Jorge','E','Brito',88866555576,"1937-11-10",'Rua do Horto, 35, São Paulo, SP','M',55000,NULL,1),
('Fernando','T','Wong',33344666687,"1955-12-08",'Rua da Lapa, 34, São Paulo, SP','M',40000,88866555576,6),
('Jennifer','S','Souza',98765432168,"1941-06-20",'Av. Arthur de Lima, 54, Santo André, SP','F',43000,88866555576,4),
('João','B','Silva',12345678966,"1965-01-09",'Rua das Flores, 761, São Paulo, SP','M',30000,33344666687,6),
('Alice','J','Zelaya',99988777767,"1968-01-19",'Rua Souza Lima, 35, Curitiba, PR','F',25000,98765432168,4),
('Ronaldo','K','Lima',66688444476,"1962-09-15",'Rua Rebouças, 65, Piracicaba, SP','M',38000,33344666687,6),
('Joice','A','Leite',45345345376,"1972-07-31",'Av. Lucas Obes, 74, São Paulo, SP','F',26000,33344666687,6),
('André','V','Pereira',98798798733,"1969-03-29",'Rua Timbira, 35, São Paulo, SP','M',26000,98765432168,4);

-- fazendo update do Cpf_gerente pós criação da tabela por que ele não existia e estava dando erro.
UPDATE DEPARTAMENTO 
SET Cpf_gerente = 88866555576
WHERE Dnumero = 1;dependente
UPDATE DEPARTAMENTO
SET Cpf_gerente = 98765432168
WHERE Dnumero = 4;
UPDATE DEPARTAMENTO
SET Cpf_gerente = 33344666687
WHERE Dnumero = 6;

INSERT INTO LOCALIZACAO_DEP(Dnumero, DlocaL)
VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(6, 'Santo André'),
(6, 'Itu'),
(6, 'São Paulo');

INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
VALUES
('ProdutoX',1,'Santo André',6),
('ProdutoY',2,'Itu',6),
('ProdutoZ',3,'São Paulo',6),
('Informatização',10,'Mauá',4),
('Reorganização',20,'São Paulo',1),
('Novosbenefícios',30,'Mauá',4);

INSERT INTO trabalha_em (Fcpf, Pnr, Horas) 
VALUES
(12345678966,1,32.5),
(12345678966,2,7.5),
(66688444476,3,40.0),
(45345345376,1,20.0),
(45345345376,2,20.0),
(33344666687,2,10.0),
(33344666687,3,10.0),
(33344666687,10,10.0),
(33344666687,20,10.0),
(99988777767,30,30.0),
(99988777767,10,10.0),
(98798798733,10,35.0),
(98798798733,30,5.0),
(98765432168,30,20.0),
(98765432168,20,15.0),
(88866555576,20,NULL);

INSERT INTO DEPENDENTE (Fcpf,Nome_dependente,Sexo,Datanasc,Parentesco)
VALUES
(33344666687,'Alicia','F',"1986-04-05",'Filha'),
(33344666687,'Tiago','M',"1983-10-25",'Filho'),
(33344666687,'Janaína','F',"1958-05-03",'Esposa'),
(98765432168,'Antonio','M',"1942-02-28",'Marido'),
(12345678966,'Michael','M',"1988-01-04",'Filho'),
(12345678966,'Alicia','F',"1988-12-30",'Filha'),
(12345678966,'Elizabeth','F',"1967-05-05",'Esposa');


