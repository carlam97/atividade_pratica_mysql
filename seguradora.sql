create database seguradora;
use seguradora;

create table cliente(
cpf int not null primary key,
nome varchar(50) not null,
nascimento date,
genero varchar(10)
);

create table apolice(
numero int not null primary key,
data_inicio date not null,
data_termino date not null,
valor decimal(7,2),
franquia varchar(30),
cpf_cliente int not null
);

create table carro(
chassis varchar(20) not null primary key,
modelo varchar(30) not null,
ano int,
numero_apolice int not null
);


create table acidente(
numerobo int not null primary key,
data_hora datetime not null,
local_acidente varchar(30),
chassis_carro varchar(20)
);

show tables;
desc apolice;

insert into cliente(cpf, nome, nascimento, genero)
values(122456978, 'João Carlos', '2000-05-30', 'masculino'),
      (345867453, 'Camila Almeida', '1999-04-12', 'feminino'),
      (546745853, 'JUlia Batista', '2003-10-17', 'feminino'),
      (768453735, 'Felipe Alves', '1997-12-12', 'masculino'),
      (909756732, 'Katia Nunes', '2001-09-21', 'feminino'),
      (652535978, 'Zé Roberto', '1985-07-20', 'masculino'),
      (958600092, 'Roberta Miranda', '1992-05-22', 'feminino'),
      (112049859, 'Fernanda Mello', '2004-11-27', 'feminino');
      
insert into apolice(numero, data_inicio, data_termino, valor, franquia, cpf_cliente)
values(6545, '2022-01-10', '2023-01-10', 1023.99, 'Acquazero', 122456978),
      (7233, '2021-07-19', '2024-06-08', 4550, 'DryWash', 345867453),
      (8351, '2019-11-06', '2022-12-24', 3485.89, 'Freewet', 546745853),
      (4451, '2020-02-01', '2022-10-15', 2500, 'Bono Pneus', 768453735),
      (2551, '2018-09-10', '2028-09-20', 10800.50, 'Strike Brasil', 909756732),
      (3600, '2016-02-17', '2018-03-18', 1003.49, 'Rools', 652535978),
      (5612, '2022-03-17', '2023-05-09', 1650, 'Ferrast', 958600092),
      (1514, '2015-01-05', '2020-06-25', 4085.89, 'Toon Run', 112049859);

insert into carro(chassis, modelo, ano, numero_apolice)
values('xxx1234', 'Sedã', 2019, 6545),
      ('abc9526', 'Fusca', 2000, 7233),
      ('bgj7688', 'Brasilia', 1980, 8351),
      ('plh5463', 'Minivan', 2010, 4451),
      ('nmf0090', 'Picape', 1997, 2551),
      ('ppe0987', 'Camaro', 2013, 3600),
      ('zyx9566', 'Ferrari', 2021, 5612),
      ('thj0450', 'Porche', 1995, 1514);


insert into acidente(numerobo, data_hora, local_acidente, chassis_carro)
values(75648, '2022-09-23 23:34:21', 'Avenida Paulista','xxx1234'),
      (34898, '2021-12-30 19:39:41', 'Rio Branco', 'abc9526'),
      (12344, '2020-08-02 22:12:20', 'Avenida das Industrias', 'bgj7688'),
      (54322, '2019-02-27 00:02:16', 'João Ramalho', 'plh5463'),
      (98789, '2018-10-13 06:45:45', 'Rua das Flores', 'nmf0090');
      
insert into acidente(numerobo, data_hora, local_acidente, chassis_carro)
values(25688, '2010-06-29 22:44:01', 'Avenida Amazonia','ppe0987'),
      (78455, '2020-02-22 16:26:29', 'Victor Euzebio da Silva', 'zyx9566'),
      (35798, '2015-09-05 03:45:45', 'Rua das Margaridas', 'thj0450');

select * from cliente;
select * from apolice;
select * from carro;
select * from acidente;

                                   /*Cliente*/
/* Mostre todos os campos de todos os clientes femininos*/
select * from cliente
where genero = 'feminino'
order by cpf desc;

/*Mostre cpf e nome dos clientes que nasceram até 12 de dezembro de 2000*/
select cpf, nome from cliente
where nascimento <= '2000-12-12';

/*Mostre todos os campos dos clientes que são mulheres e nasceram depois de 01 de janeiro de 2000*/
select * from cliente
where genero = 'feminino' and nascimento > '2000-01-01';

delete from cliente
where cpf = 122456978;

delete from cliente
where nascimento = '2003-10-17';

update cliente
set nome = 'Carla Martins'
where cpf = 345867453;

update cliente
set nascimento = '2000-12-12'
where genero = 'masculino';


			       /*Apolice*/
/*Mostrar valor e franquia das apolices com data de inicio depois de 2020*/
select valor, franquia from apolice
where data_inicio > '2020-01-01'; 

/*Mostre todas as colunas das apolices com franquia da DryWash ou valor maior que R$2500*/
select * from apolice
where franquia = 'Strike Brasil' or valor > 2500
order by numero;

/*Mostre soma toal dos valores das apolices*/
select sum(valor) from apolice;

delete from apolice
where franquia = 'Acquazero';

delete from apolice
where valor = 3485.89;

update apolice
set data_termino = '2022-09-15'
where numero = 4451;

update apolice
set valor = 11800.50
where data_termino = '2028-09-20';

                                            /*Carro*/
/*Mostre todos os campos do carro que possue o menor ano*/
select *, min(ano) from carro;

/*Mostre modelo e ano de carro que possuem ano 1980 ou numero de apolice 4451*/
select modelo, ano from carro
where ano = 1980 or numero_apolice = 4451
order by modelo;

/*Mostre chasis, modelo e ano dos carros que possuem numero apolice maior que 6000*/
select chassis, modelo, ano from carro
where numero_apolice > 6000;

delete from carro
where modelo = 'Picape';

delete from carro
where ano = 2000;

update carro
set modelo = 'Gol'
where ano = 1980;

update carro
set ano = 2015
where chassis = 'xxx1234';


                                     /*Acidente*/
/*Mostre todos os campos de acidente que ocorram antes de 2019*/
select * from acidente
where data_hora < '2019-12-12 00:00:00'
order by local_acidente;

/*Mostre data, hora e loal dos acidentes que tem numero de bo 12344 ou 98789*/
select data_hora, local_acidente from acidente
where numerobo = 12344 or numerobo = 98789;

/*Mostre numero do bo, data e hora e local do acidente mais recente*/
select numerobo, max(data_hora), local_acidente from acidente;

delete from acidente
where numerobo = 34898;

delete from acidente
where local_acidente = 'Rua das Flores';

update acidente
set data_hora = '2021-08-02 21:12:20'
where numerobo = 12344;

update acidente
set local_acidente = 'Rio Negro'
where chassis_carro = 'xxx1234';

/*inner join*/
select * from apolice
inner join cliente 
on apolice.cpf_cliente = cliente.cpf;

select * from acidente
inner join carro 
on acidente.chassis_carro = carro.chassis;
