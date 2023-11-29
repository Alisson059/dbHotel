create database dbHotel;

show databases;

use dbHotel;

create table funcionarios (
	idFunc int primary key auto_increment,
    login varchar(20) not null unique,
    email varchar(50) not null,
    senha varchar(255) not null,
	cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo) values ("Administrador", "admin","Administrador@gmail.com", md5("admin"), "Administrador");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values("Pamella Pereto", "Pamellapereto","pamellapereto@gmail.com", md5("123@senac"), "TI");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values("Breno Silva", "Brenosilva","brenosilva@gmail.com", md5("123@senac"), "Gerência");
insert into funcionarios(nomeFunc, login, email, senha, cargo) values("Victoria Cardoso", "Victoriacardoso","victoriacardoso@gmail.com", md5("123@senac"), "RH");
insert into funcionarios(nomeFunc, login, email, senha, cargo) value("Laura Lopes", "lauralopes","lauralopes@gmail.com", md5("123@senac"), "Gerência");
insert into funcionarios(nomeFunc, login, email, senha) value("Fellipe Coelho", "felipe","felipecoelho@gmail.com", md5("123@senac"));

select * from funcionarios;

select login as login, senha from funcionarios where login = "admin" and senha = md5("admin");
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;  
select idFunc as ID_Funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;
select IDFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by IDFunc desc;
select IDFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> 'null' order by IDFunc desc;
select * from funcionarios where cargo = "Gerência" order by nomeFunc asc;


create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    numeroQuarto varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar(255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char(3) not null,
    precoCafe decimal(10,2),
    tipoCama varchar(20),
    varanda char(3)
);

describe quartos;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, precoCafe, Foto) values ("5º", "505", "Superior Premier", 3, "não",
"Familiar", "O quarto de 32m² com piso frio,varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', WI-FI grátis, cofre digital, frigobar abastecido
e banheiro comsecador de cabelo e amenitis e mesa de trabalho.",750.90,"Queen size","sim","sim","60.00","https://imagens-revista.vivadecora.com.br/uploads/2019/06/decoracao-quarto-de-luxo-casal-quarto-do-casal-guardinistancati-e1559762018818.jpg");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, precoCafe, Foto) values ("6º", "505", "Superior Premier", 3, "não",
"Familiar", "O quarto de 32m² com piso frio,varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', WI-FI grátis, cofre digital, frigobar abastecido
e banheiro comsecador de cabelo e amenitis e mesa de trabalho.",750.90,"Queen size","sim","sim","60.00","https://meulugar.quintoandar.com.br/wp-content/uploads/2022/10/quarto-luxo-7-1024x576.jpg");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, precoCafe, Foto) values ("4º", "505", "Superior Premier", 3, "não",
"Familiar", "O quarto de 32m² com piso frio,varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', WI-FI grátis, cofre digital, frigobar abastecido
e banheiro comsecador de cabelo e amenitis e mesa de trabalho.",650.00,"Queen size","sim","sim","60.00","https://www.tuacasa.com.br/wp-content/uploads/2021/04/quarto-de-luxo-capa.png");

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, precoCafe, Foto) values ("7º", "865", "Premier", 2, "não",
"Casal", "O quarto de 32m² com piso frio,varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 55'', WI-FI grátis, cofre digital, frigobar abastecido
e banheiro comsecador de cabelo e amenitis e mesa de trabalho.",1500.00,"Queen size","sim","sim","60.00","https://robertacavina.com.br/wp-content/webp-express/webp-images/uploads/2013/03/87-704x563.png.webp");

select * from quartos;

select * from quartos where situacao = "não" order by preco desc;
select * from quartos where cafeDaManha = "sim";
select * from quartos where cafeDaManha = "sim" and varanda = "sim";
select * from quartos where preco < 700.00 ;


create table clientes(
	idClientes int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) unique,
    celular varchar(15)not null
   
);

describe clientes;

insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("Gabriel Herique Melo dos Santos", "643.453.400-04", "41.351.272-1", "Gabrielsantos@gmail.com", "(11) 98701-0793");
 
 insert into clientes (nomeCompleto, cpf, rg, email, celular) values
("Claudia dos Santos", "356.474.465-01", "48.342.289-5", "Claudiasantos@gmail.com", "(11) 98721-8931");
 
select * from clientes;


create table pedidos (
	idPedido int key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("pendente", "finalizado", "Cancelado") not null,
    idClientes int not null,
    foreign key(idClientes) references clientes (idClientes)
    
);

describe pedidos;

insert into pedidos (statusPedido, idClientes) value ("pendente",1);
insert into pedidos (statusPedido, idClientes) value ("finalizado",2);



select * from pedidos;
select * from pedidos inner join clientes on pedidos.idClientes = clientes.idClientes;


create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedidos(idPedido),
    foreign key (idQuarto) references quartos(idQuarto),
    checkin datetime not null,
    checkout datetime not null
    
);

describe reservas;

insert into reservas (idPedido, idQuarto,checkin,checkout) values (1, 1, "2023-11-10 13:00:00", "2023-11-15 15:00:00" );
insert into reservas (idPedido, idQuarto,checkin,checkout) values (1, 2, "2023-11-10 13:00:00", "2023-11-15 15:00:00" );

insert into reservas (idPedido, idQuarto,checkin,checkout) values (2, 3, "2023-12-10 12:00:00", "2023-12-20 15:00:00" );
insert into reservas (idPedido, idQuarto,checkin,checkout) values (2, 4, "2023-12-10 12:00:00", "2023-12-20 15:00:00" );



select * from reservas;

/* Obejetivo: selecionar o nome do cliente, seu cpf, o id do pedido do cliente, data do pedido, quais quartos fazem parte desse pedido, os tipos dos quartos e seu nomes, assim como,
os andares em que estão, os número de cada quarto, e suaus data de checkin e checkout.*/

select  clientes.nomeCompleto, clientes.cpf, clientes.email, pedidos.idPedido, pedidos.dataPedido, quartos.tipoQuarto,
quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco, reservas.checkin, reservas.checkout 
from clientes inner join pedidos on clientes.idClientes = pedidos.idClientes
inner join reservas on reservas.idPedido = pedidos.idPedido 
inner join quartos on reservas.idQuarto = quartos.idQuarto;

/*OBJETIVO: Somar o total que p cliente deverá pagar ao concluir o pedido dos quartos*/

select clientes.nomeCompleto, clientes.cpf, pedidos.idPedido, quartos.tipoQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto,
sum(quartos.preco) as total from clientes 
inner join pedidos on clientes.idClientes = pedidos.idClientes 
inner join reservas on reservas.idPedido = pedidos.idPedido 
inner join quartos on reservas.idQuarto = quartos.idQuarto where pedidos.idPedido = 2
group by clientes.nomeCompleto, clientes.cpf, pedidos.idPedido, quartos.tipoQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto;


/* Soma total de todos os pedidos*/
select sum(quartos.preco) as total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto;

/* Soma total do pedido feito pelo cliente*/
select sum(quartos.preco) as total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido = 2;


/*Cliente Gabriel Henrique Melo dos santos - idPedido 1
Quartos reservados: superior primer (5º andar, número 505, Preço Diaria 750.90
Check-in: 27/11/2023 às 10h00
Check-out: 08/12/2023 às 10h00
*/

/*Buscar o noe do cliente, andar, número do quarto e checkout somente daqueles cuja data do checkout já passou ou igual à data sistema*/
select  clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, reservas.checkout 
from clientes inner join pedidos on clientes.idClientes = pedidos.idClientes
inner join reservas on reservas.idPedido = pedidos.idPedido 
inner join quartos on reservas.idQuarto = quartos.idQuarto where reservas.checkout <= current_timestamp();


/*Atualizar a disponibilidade do quarto somente daqueles cuja data do checkout já passou ou igual à data do sistema*/
update reservas inner join quartos on reservas.idQuarto = quartos.idQuarto
set quartos.situacao = "nao" 
where reservas.checkout < current_timestamp();

update reservas inner join quartos on reservas.idQuarto = quartos.idQuarto
set quartos.situacao = "sim" 
where reservas.checkin > current_timestamp();

/* Buscar o nome do cliente, andar, número do quarto, checkout (com data formatada em 99/99/99) e o cálculo da diferença de quantos
dias falatam para a reserva do cliente encerrar*/
select  clientes.nomeCompleto, quartos.andar, quartos.numeroQuarto, 
date_format(reservas.checkout, '%d/%m/%y') as checkout, datediff(reservas.checkout, curdate()) as dias_restantes
from clientes inner join pedidos on clientes.idClientes = pedidos.idClientes
inner join reservas on reservas.idPedido = pedidos.idPedido 
inner join quartos on reservas.idQuarto = quartos.idQuarto where reservas.checkout > current_timestamp();


select tipoQuarto, situacao from quartos;

select * from reservas;

show tables;
