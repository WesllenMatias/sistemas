CREATE DATABASE diag_db;


CREATE TABLE IF NOT EXISTS `diag_db`.`raspberrys` (
  `idraspberrys` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  `ip` VARCHAR(15) NOT NULL,
=======
  `ip` VARCHAR(16) NOT NULL,
>>>>>>> Stashed changes
=======
  `ip` VARCHAR(16) NOT NULL,
>>>>>>> Stashed changes
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idraspberrys`),
  UNIQUE INDEX `idraspberrys_UNIQUE` (`idraspberrys` ASC))
ENGINE = InnoDB;


INSERT INTO raspberrys ( nome, ip, usuario, senha, local )
VALUES ( "LJ7-VENDAS-02","192.168.17.102", "pi", "valessh", "LOJA07" );
