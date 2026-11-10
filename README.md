# loja_pegasus
Loja geek para o trabalho de Banco de Dados 2


Usuário Leitor 

phpMyAdmin


ALTER USER 'usr_consulta'@'localhost' IDENTIFIED BY 'Senha123!';
GRANT SELECT ON loja_pegasus.* TO 'usr_consulta'@'localhost';
FLUSH PRIVILEGES;

Prompt de Comando


cd C:\xampp\mysql\bin
mysql -u usr_consulta -h 127.0.0.1 -p
Quando o terminal solicitar a senha, digite: Senha123! e aperte Enter. 



USE loja_pegasus;

Usuário Operador

phpMyAdmin


ALTER USER 'usr_operador'@'localhost' IDENTIFIED BY 'SenhaOperador123!';
GRANT SELECT, INSERT, UPDATE ON loja_pegasus.* TO 'usr_operador'@'localhost';
FLUSH PRIVILEGES;

Prompt de Comando


cd C:\xampp\mysql\bin
mysql -u usr_consulta -h 127.0.0.1 -p
Quando o terminal solicitar a senha, digite: SenhaOperador123!  e aperte Enter. 



USE loja_pegasus;

Usuário Gerente

phpMyAdmin


ALTER USER 'usr_operador'@'localhost' IDENTIFIED BY 'SenhaOperador123!';
GRANT SELECT, INSERT, UPDATE ON loja_pegasus.* TO 'usr_operador'@'localhost';
FLUSH PRIVILEGES;

Prompt de Comando


cd C:\xampp\mysql\bin
mysql -u usr_consulta -h 127.0.0.1 -p
Quando o terminal solicitar a senha, digite: SenhaGerente123!  e aperte Enter. 



USE loja_pegasus;

Usuário Administrador


phpMyAdmin


ALTER USER 'usr_operador'@'localhost' IDENTIFIED BY 'SenhaOperador123!';
GRANT SELECT, INSERT, UPDATE ON loja_pegasus.* TO 'usr_operador'@'localhost';
FLUSH PRIVILEGES;

Prompt de Comando


cd C:\xampp\mysql\bin
mysql -u usr_consulta -h 127.0.0.1 -p
Quando o terminal solicitar a senha, digite: SenhaAdmin123!  e aperte Enter. 



USE loja_pegasus;
