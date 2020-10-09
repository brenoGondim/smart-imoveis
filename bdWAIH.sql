-- --------------------------------------------------------
-- Servidor:                     bd_smartimovel.mysql.dbaas.com.br
-- Versão do servidor:           5.7.17-13-log - Percona Server (GPL), Release 13, Revision fd33d43
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela bd_smartimovel.Contato
DROP TABLE IF EXISTS `Contato`;
CREATE TABLE IF NOT EXISTS `Contato` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  `Mensagem` text NOT NULL,
  `Status` varchar(50) NOT NULL,
  `DataAbertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Contato: ~0 rows (aproximadamente)
DELETE FROM `Contato`;
/*!40000 ALTER TABLE `Contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contato` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.ControleArquivoXML
DROP TABLE IF EXISTS `ControleArquivoXML`;
CREATE TABLE IF NOT EXISTS `ControleArquivoXML` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParceiroId` bigint(20) NOT NULL,
  `FlagArquivoXML` tinyint(4) NOT NULL DEFAULT '0',
  `DataSolicitacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Mensagem` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ParceiroId` (`ParceiroId`),
  CONSTRAINT `FK_ControleArquivoXML_Parceiro` FOREIGN KEY (`ParceiroId`) REFERENCES `Parceiro` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.ControleArquivoXML: ~4 rows (aproximadamente)
DELETE FROM `ControleArquivoXML`;
/*!40000 ALTER TABLE `ControleArquivoXML` DISABLE KEYS */;
INSERT INTO `ControleArquivoXML` (`Id`, `ParceiroId`, `FlagArquivoXML`, `DataSolicitacao`, `Mensagem`) VALUES
	(1, 1, 0, '2020-09-12 02:27:17', 'Iniciado processo de criação do arquivo para o parceiro: Imovel Web na data: 12/09/2020.'),
	(2, 4, 0, '2020-09-12 02:27:10', 'Iniciado processo de criação do arquivo para o parceiro: Vitão na data: 12/09/2020.'),
	(3, 3, 0, '2020-09-12 02:27:17', 'Iniciado processo de criação do arquivo para o parceiro: Brenim Imóveis Criado na data: 12/09/2020.'),
	(4, 2, 0, '2020-09-12 02:27:17', 'Iniciado processo de criação do arquivo para o parceiro: Zeze Imóveis na data: 12/09/2020.');
/*!40000 ALTER TABLE `ControleArquivoXML` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Edificio
DROP TABLE IF EXISTS `Edificio`;
CREATE TABLE IF NOT EXISTS `Edificio` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Referencia` varchar(20) NOT NULL,
  `Zelador` varchar(150) NOT NULL,
  `Telefone1` varchar(150) DEFAULT NULL,
  `Telefone2` varchar(150) DEFAULT NULL,
  `Celular1` varchar(150) DEFAULT NULL,
  `Celular2` varchar(150) DEFAULT NULL,
  `EnderecoId` bigint(20) DEFAULT NULL,
  `FlagAtivo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `EnderecoId` (`EnderecoId`),
  CONSTRAINT `FK_Edificio_Endereco` FOREIGN KEY (`EnderecoId`) REFERENCES `Endereco` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Edificio: ~1 rows (aproximadamente)
DELETE FROM `Edificio`;
/*!40000 ALTER TABLE `Edificio` DISABLE KEYS */;
INSERT INTO `Edificio` (`Id`, `Nome`, `Referencia`, `Zelador`, `Telefone1`, `Telefone2`, `Celular1`, `Celular2`, `EnderecoId`, `FlagAtivo`) VALUES
	(32, 'Cond America', '56536', 'Paulio', '9999999999', '9999999999', '9999999999', '9999999999', 74, 1);
/*!40000 ALTER TABLE `Edificio` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Endereco
DROP TABLE IF EXISTS `Endereco`;
CREATE TABLE IF NOT EXISTS `Endereco` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(250) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Complemento` varchar(20) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cidade` varchar(70) NOT NULL,
  `UF` varchar(70) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  `Latitude` varchar(20) DEFAULT '',
  `Longitude` varchar(20) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Endereco: ~2 rows (aproximadamente)
DELETE FROM `Endereco`;
/*!40000 ALTER TABLE `Endereco` DISABLE KEYS */;
INSERT INTO `Endereco` (`Id`, `Logradouro`, `Numero`, `Complemento`, `Bairro`, `Cidade`, `UF`, `CEP`, `Latitude`, `Longitude`) VALUES
	(74, 'Rua das dores', '4545', 'Não tem', 'Palmeiras', 'Uberlandia', 'MG', '20', '-19.932021', '-44.233556'),
	(112, '', '', '', '', 'Betim', '', '38383883', '-19.932021', '-44.233556');
/*!40000 ALTER TABLE `Endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoAreaEdificio
DROP TABLE IF EXISTS `FotoAreaEdificio`;
CREATE TABLE IF NOT EXISTS `FotoAreaEdificio` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `EdificioId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `EdificioId` (`EdificioId`) USING BTREE,
  CONSTRAINT `FotoAreaEdificio_ibfk_1` FOREIGN KEY (`EdificioId`) REFERENCES `Edificio` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela bd_smartimovel.FotoAreaEdificio: ~0 rows (aproximadamente)
DELETE FROM `FotoAreaEdificio`;
/*!40000 ALTER TABLE `FotoAreaEdificio` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoAreaEdificio` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoAreaImovel
DROP TABLE IF EXISTS `FotoAreaImovel`;
CREATE TABLE IF NOT EXISTS `FotoAreaImovel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `ImovelId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ImovelId` (`ImovelId`) USING BTREE,
  CONSTRAINT `FotoAreaImovel_ibfk_1` FOREIGN KEY (`ImovelId`) REFERENCES `Imovel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela bd_smartimovel.FotoAreaImovel: ~0 rows (aproximadamente)
DELETE FROM `FotoAreaImovel`;
/*!40000 ALTER TABLE `FotoAreaImovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoAreaImovel` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoEdificio
DROP TABLE IF EXISTS `FotoEdificio`;
CREATE TABLE IF NOT EXISTS `FotoEdificio` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `EdificioId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `EdificioId` (`EdificioId`),
  CONSTRAINT `FKFotoEdificio` FOREIGN KEY (`EdificioId`) REFERENCES `Edificio` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.FotoEdificio: ~0 rows (aproximadamente)
DELETE FROM `FotoEdificio`;
/*!40000 ALTER TABLE `FotoEdificio` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoEdificio` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoImovel
DROP TABLE IF EXISTS `FotoImovel`;
CREATE TABLE IF NOT EXISTS `FotoImovel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `ImovelId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ImovelId` (`ImovelId`),
  CONSTRAINT `FKFotoImovel` FOREIGN KEY (`ImovelId`) REFERENCES `Imovel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.FotoImovel: ~0 rows (aproximadamente)
DELETE FROM `FotoImovel`;
/*!40000 ALTER TABLE `FotoImovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoImovel` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoPlantaEdificio
DROP TABLE IF EXISTS `FotoPlantaEdificio`;
CREATE TABLE IF NOT EXISTS `FotoPlantaEdificio` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `EdificioId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `EdificioId` (`EdificioId`) USING BTREE,
  CONSTRAINT `FotoPlantaEdificio_ibfk_1` FOREIGN KEY (`EdificioId`) REFERENCES `Edificio` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela bd_smartimovel.FotoPlantaEdificio: ~0 rows (aproximadamente)
DELETE FROM `FotoPlantaEdificio`;
/*!40000 ALTER TABLE `FotoPlantaEdificio` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoPlantaEdificio` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.FotoPlantaImovel
DROP TABLE IF EXISTS `FotoPlantaImovel`;
CREATE TABLE IF NOT EXISTS `FotoPlantaImovel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NomeFoto` varchar(255) NOT NULL,
  `Ordem` int(11) NOT NULL,
  `ImovelId` bigint(20) NOT NULL,
  `Caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `ImovelId` (`ImovelId`) USING BTREE,
  CONSTRAINT `FotoPlantaImovel_ibfk_1` FOREIGN KEY (`ImovelId`) REFERENCES `Imovel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela bd_smartimovel.FotoPlantaImovel: ~0 rows (aproximadamente)
DELETE FROM `FotoPlantaImovel`;
/*!40000 ALTER TABLE `FotoPlantaImovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `FotoPlantaImovel` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Imovel
DROP TABLE IF EXISTS `Imovel`;
CREATE TABLE IF NOT EXISTS `Imovel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Referencia` varchar(20) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Descricao` text NOT NULL,
  `PrecoVenda` float(30,2) DEFAULT NULL,
  `PrecoLocacao` float(30,2) DEFAULT NULL,
  `PrecoCondominio` float(30,2) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `AreaUtil` int(11) DEFAULT NULL,
  `AreaTotal` int(11) DEFAULT NULL,
  `QtdDormitorios` int(11) DEFAULT NULL,
  `QtdSuites` int(11) DEFAULT NULL,
  `QtdBanheiros` int(11) DEFAULT NULL,
  `QtdSalas` int(11) DEFAULT NULL,
  `QtdVagas` int(11) DEFAULT NULL,
  `QtdElevador` int(11) DEFAULT NULL,
  `QtdUnidadesAndar` int(11) DEFAULT NULL,
  `AnoConstrucao` int(11) DEFAULT NULL,
  `ArmarioCozinha` tinyint(4) DEFAULT '0',
  `ArmarioEmbutido` tinyint(4) DEFAULT '0',
  `EstacionamentoVisitantes` tinyint(4) DEFAULT '0',
  `Piscina` tinyint(4) DEFAULT '0',
  `QuadraSquash` tinyint(4) DEFAULT '0',
  `QuadraTenis` tinyint(4) DEFAULT '0',
  `QuadraPoliesportiva` tinyint(4) DEFAULT '0',
  `SalaGinastica` tinyint(4) DEFAULT '0',
  `SalaoFestas` tinyint(4) DEFAULT '0',
  `SalaoJogos` tinyint(4) DEFAULT '0',
  `Sauna` tinyint(4) DEFAULT '0',
  `Varanda` tinyint(4) DEFAULT '0',
  `Lavabo` tinyint(4) DEFAULT '0',
  `DepositoSubsolo` tinyint(4) DEFAULT '0',
  `Closet` tinyint(4) DEFAULT '0',
  `Hidromassagem` tinyint(4) DEFAULT '0',
  `Lareira` tinyint(4) DEFAULT '0',
  `AndarInteiro` tinyint(4) DEFAULT '0',
  `MeioAndar` tinyint(4) DEFAULT '0',
  `SalaAlmoco` tinyint(4) DEFAULT '0',
  `SalaJantar` tinyint(4) DEFAULT '0',
  `SalaIntima` tinyint(4) DEFAULT '0',
  `Brinquedoteca` tinyint(4) DEFAULT '0',
  `Playground` tinyint(4) DEFAULT '0',
  `Churrasqueira` tinyint(4) DEFAULT '0',
  `Copa` tinyint(4) DEFAULT '0',
  `DependenciaEmpregados` tinyint(4) DEFAULT '0',
  `Despensa` tinyint(4) DEFAULT '0',
  `Edicula` tinyint(4) DEFAULT '0',
  `Quintal` tinyint(4) DEFAULT '0',
  `FlagAtivo` tinyint(4) DEFAULT '1',
  `FlagDestaque` tinyint(4) DEFAULT '0',
  `FlagSuperDestaque` tinyint(4) DEFAULT '0',
  `EnderecoId` bigint(20) DEFAULT NULL,
  `EdificioId` bigint(20) DEFAULT NULL,
  `DataAlteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `UsuarioAlteracao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKEnderecoImovel` (`EnderecoId`),
  KEY `FKEdificioImovel` (`EdificioId`),
  CONSTRAINT `FKEdificioImovel` FOREIGN KEY (`EdificioId`) REFERENCES `Edificio` (`Id`),
  CONSTRAINT `FKEnderecoImovel` FOREIGN KEY (`EnderecoId`) REFERENCES `Endereco` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Imovel: ~1 rows (aproximadamente)
DELETE FROM `Imovel`;
/*!40000 ALTER TABLE `Imovel` DISABLE KEYS */;
INSERT INTO `Imovel` (`Id`, `Nome`, `Referencia`, `Tipo`, `Descricao`, `PrecoVenda`, `PrecoLocacao`, `PrecoCondominio`, `Complemento`, `AreaUtil`, `AreaTotal`, `QtdDormitorios`, `QtdSuites`, `QtdBanheiros`, `QtdSalas`, `QtdVagas`, `QtdElevador`, `QtdUnidadesAndar`, `AnoConstrucao`, `ArmarioCozinha`, `ArmarioEmbutido`, `EstacionamentoVisitantes`, `Piscina`, `QuadraSquash`, `QuadraTenis`, `QuadraPoliesportiva`, `SalaGinastica`, `SalaoFestas`, `SalaoJogos`, `Sauna`, `Varanda`, `Lavabo`, `DepositoSubsolo`, `Closet`, `Hidromassagem`, `Lareira`, `AndarInteiro`, `MeioAndar`, `SalaAlmoco`, `SalaJantar`, `SalaIntima`, `Brinquedoteca`, `Playground`, `Churrasqueira`, `Copa`, `DependenciaEmpregados`, `Despensa`, `Edicula`, `Quintal`, `FlagAtivo`, `FlagDestaque`, `FlagSuperDestaque`, `EnderecoId`, `EdificioId`, `DataAlteracao`, `UsuarioAlteracao`) VALUES
	(73, 'Cond America', '45435', 'Apartamento', ' Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP Descrição AP.', 732443.00, 1500.00, 1343.00, NULL, 100, 0, 4, 4, 5, 3, 3, 2, 3, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, NULL, 74, 32, '0001-01-01 00:00:00', '1');
/*!40000 ALTER TABLE `Imovel` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Parceiro
DROP TABLE IF EXISTS `Parceiro`;
CREATE TABLE IF NOT EXISTS `Parceiro` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `NomeArquivoXml` varchar(50) NOT NULL,
  `TagSimples` varchar(50) DEFAULT NULL,
  `TagDestaque` varchar(50) DEFAULT NULL,
  `TagSuperDestaque` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Parceiro: ~6 rows (aproximadamente)
DELETE FROM `Parceiro`;
/*!40000 ALTER TABLE `Parceiro` DISABLE KEYS */;
INSERT INTO `Parceiro` (`Id`, `Nome`, `NomeArquivoXml`, `TagSimples`, `TagDestaque`, `TagSuperDestaque`) VALUES
	(1, 'Imovel Web', 'iw_ofertas.xml', 'SIMPLES', 'DESTAQUE', 'HOME'),
	(2, 'Zeze Imóveis', 'zez_ofertas.xml', '', '', ''),
	(3, 'Brenim Imóveis', 'arquivobren', NULL, NULL, NULL),
	(4, 'Vitão', 'vitimfile', '', '', ''),
	(5, 'Parceiro 123', 'parceiro123', NULL, NULL, NULL),
	(6, 'Parceiro Teste', 'fsdfdsdsg', 'Tagsimpels', 'TagDestaquie', 'RTag');
/*!40000 ALTER TABLE `Parceiro` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.ParceiroCarga
DROP TABLE IF EXISTS `ParceiroCarga`;
CREATE TABLE IF NOT EXISTS `ParceiroCarga` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParceiroId` bigint(20) NOT NULL,
  `AnuncioSimples` int(11) NOT NULL DEFAULT '0',
  `Destaque` int(11) NOT NULL DEFAULT '0',
  `SuperDestaque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `ParceiroId` (`ParceiroId`),
  CONSTRAINT `FK_ParceiroCarga_Parceiro` FOREIGN KEY (`ParceiroId`) REFERENCES `Parceiro` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.ParceiroCarga: ~6 rows (aproximadamente)
DELETE FROM `ParceiroCarga`;
/*!40000 ALTER TABLE `ParceiroCarga` DISABLE KEYS */;
INSERT INTO `ParceiroCarga` (`Id`, `ParceiroId`, `AnuncioSimples`, `Destaque`, `SuperDestaque`) VALUES
	(1, 1, 500, 60, 20),
	(2, 2, 30, 20, 0),
	(3, 3, 10, 10, 10),
	(4, 4, 0, 22, 10),
	(5, 5, 0, 0, 5),
	(6, 6, 0, 0, 0);
/*!40000 ALTER TABLE `ParceiroCarga` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Perfil
DROP TABLE IF EXISTS `Perfil`;
CREATE TABLE IF NOT EXISTS `Perfil` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Perfil: ~2 rows (aproximadamente)
DELETE FROM `Perfil`;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
INSERT INTO `Perfil` (`Id`, `Perfil`) VALUES
	(1, 'Administrador'),
	(2, 'Consultor');
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.VariavelXML
DROP TABLE IF EXISTS `VariavelXML`;
CREATE TABLE IF NOT EXISTS `VariavelXML` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.VariavelXML: ~67 rows (aproximadamente)
DELETE FROM `VariavelXML`;
/*!40000 ALTER TABLE `VariavelXML` DISABLE KEYS */;
INSERT INTO `VariavelXML` (`Id`, `Nome`, `Descricao`) VALUES
	(1, '@nome', 'Nome do Imóvel'),
	(2, '@fotos', 'Lista de Fotos Imóvel'),
	(3, '@videos', 'Lista de Vídeos Imóvel'),
	(4, '@referencia', 'Referência do Imóvel'),
	(5, '@descricao', 'Descrição do Imóvel'),
	(6, '@precoVenda', 'Preço Venda Imóvel'),
	(7, '@precoLocacao', 'Preço Locação Imóvel'),
	(8, '@precoCondominio', 'Preço Condomínio Imóvel'),
	(9, '@complemento', 'Complemento Imóvel'),
	(10, '@latitude', 'Latitude do Imóvel'),
	(11, '@longitude', 'Longitude do Imóvel'),
	(12, '@areaUtil', 'Área Útil do Imóvel'),
	(13, '@areaTotal', 'Área Total do Imóvel'),
	(14, '@qtdDormitorios', 'Qtd Dormitórios do Imóvel'),
	(15, '@qtdSuites', 'Qtd Suites do Imóvel'),
	(16, '@qtdBanheiros', 'Qtd Banheiros do Imóvel'),
	(17, '@qtdSalas', 'Qtd Salas do Imóvel'),
	(18, '@qtdVagas', 'Qtd Vagas do Imóvel'),
	(19, '@qtdElevador', 'Qtd Elevador do Imóvel'),
	(20, '@qtdUnidadesAndar', 'Qtd Unidades/Andar Imóvel'),
	(21, '@anoConstrucao', 'Ano Construção do Imóvel'),
	(22, '@armarioCozinha', 'Armário da Cozinha do Imóvel'),
	(23, '@armarioEmbutido', 'Armário Embutido do Imóvel'),
	(24, '@estacionamentoVisitantes', 'Estacionamento Visitantes'),
	(25, '@piscina', 'Piscina do Imóvel'),
	(26, '@quadraSquash', 'Quadra de Squash do Imóvel'),
	(27, '@quadraTenis', 'Quadra de Tênis do Imóvel'),
	(28, '@quadraPoliesportiva', 'Quadra Poliesportiva Imóvel'),
	(29, '@salaGinastica', 'Sala de Ginástica do Imóvel'),
	(30, '@salaoFestas', 'Salão de Festas do Imóvel'),
	(31, '@salaoJogos', 'Salão de Jogos do Imóvel'),
	(32, '@sauna', 'Sauna do Imóvel'),
	(33, '@varanda', 'Varanda do Imóvel'),
	(34, '@lavabo', 'Lavabo do Imóvel'),
	(35, '@depositoSubsolo', 'Depósito no Subsolo Imóvel'),
	(36, '@closet', 'Closet do Imóvel'),
	(37, '@hidromassagem', 'Hidromassagem do Imóvel'),
	(38, '@lareira', 'Lareira do Imóvel'),
	(39, '@andarInteiro', 'Andar Inteiro do Imóvel'),
	(40, '@meioAndar', 'Meio Andar do Imóvel'),
	(41, '@salaAlmoco', 'Sala de Almoço do Imóvel'),
	(42, '@salaJantar', 'Sala de Jantar do Imóvel'),
	(43, '@salaIntima', 'Sala Íntima do Imóvel'),
	(44, '@brinquedoteca', 'Brinquedoteca do Imóvel'),
	(45, '@playground', 'Playground do Imóvel'),
	(46, '@tagTipoCarga', 'Tag do tipo de carga (Simples, Destaque, SuperDest'),
	(47, '@logradouro', 'Logradouro do Endereço'),
	(48, '@numero', 'Número do Endereço'),
	(49, '@bairro', 'Bairro do Endereço'),
	(50, '@cidade', 'Cidade do Endereço'),
	(51, '@uf', 'Estado do Endereço'),
	(52, '@cep', 'CEP do Endereço'),
	(53, '@videoLink', 'Link do Vídeo'),
	(54, '@videoNome', 'Nome do Vídeo'),
	(55, '@fotoNome', 'Nome da Foto'),
	(56, '@fotoLink', 'Link da Foto'),
	(57, '@fotoOrdem', 'Ordem da Foto'),
	(58, '@fotoPrincipal', 'Se é ou não a foto principal.'),
	(59, '@tipoImovel', 'Tipo do Imóvel (Apartamento, Casa, etc)'),
	(60, '@churrasqueira', 'Se imóvel possui Churrasqueira.'),
	(61, '@closet', 'Se imóvel possui Closet.'),
	(62, '@copa', 'Se imóvel possui Copa'),
	(63, '@dependenciaEmpregados', 'Se imóvel possui Dependência para Empregados.'),
	(64, '@despensa', 'Se imóvel possui Despensa.'),
	(65, '@edicula', 'Se imóvel possui Edícula.'),
	(66, '@playground', 'Se imóvel possui Playground.'),
	(67, '@quintal', 'Se imóvel possui Quintal.');
/*!40000 ALTER TABLE `VariavelXML` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.Vendedor
DROP TABLE IF EXISTS `Vendedor`;
CREATE TABLE IF NOT EXISTS `Vendedor` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Celular` varchar(11) NOT NULL,
  `Facebook` varchar(200) DEFAULT NULL,
  `Twitter` varchar(200) DEFAULT NULL,
  `Linkedin` varchar(200) DEFAULT NULL,
  `Instagram` varchar(200) DEFAULT NULL,
  `Apresentacao` varchar(200) DEFAULT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Senha` varchar(200) NOT NULL,
  `PefilAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `Token` varchar(200) DEFAULT NULL,
  `Foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.Vendedor: ~2 rows (aproximadamente)
DELETE FROM `Vendedor`;
/*!40000 ALTER TABLE `Vendedor` DISABLE KEYS */;
INSERT INTO `Vendedor` (`Id`, `Nome`, `Email`, `Celular`, `Facebook`, `Twitter`, `Linkedin`, `Instagram`, `Apresentacao`, `Usuario`, `Senha`, `PefilAdmin`, `Token`, `Foto`) VALUES
	(1, 'Pablo Alvim', 'pablo@alvimsolutions.com.br', '34992760020', 'facebook.com.br/pablo.alvim', '', '', '', 'Eu sou o melhor vendedor desse site', 'pablo', '123', 1, NULL, NULL),
	(2, 'Vítor Nunes', 'evitorfiler@gmail.com', '34984112242', 'facebook.com.br/vitor.nunes', NULL, NULL, NULL, 'Eu sou melhor que o cara que ta falando que é o melhor', 'vitor', '123', 0, NULL, NULL);
/*!40000 ALTER TABLE `Vendedor` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.VideosImovel
DROP TABLE IF EXISTS `VideosImovel`;
CREATE TABLE IF NOT EXISTS `VideosImovel` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Link` text NOT NULL,
  `ImovelId` bigint(20) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ImovelId` (`ImovelId`),
  CONSTRAINT `FK_VideosImovel_Imovel` FOREIGN KEY (`ImovelId`) REFERENCES `Imovel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.VideosImovel: ~0 rows (aproximadamente)
DELETE FROM `VideosImovel`;
/*!40000 ALTER TABLE `VideosImovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `VideosImovel` ENABLE KEYS */;

-- Copiando estrutura para tabela bd_smartimovel.XML
DROP TABLE IF EXISTS `XML`;
CREATE TABLE IF NOT EXISTS `XML` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParceiroId` bigint(20) NOT NULL,
  `XmlImovelInicio` varchar(50) NOT NULL,
  `XmlImovelCorpo` text NOT NULL,
  `XmlImovelFim` varchar(50) NOT NULL,
  `XmlFotosInicio` varchar(50) NOT NULL,
  `XmlFotosCorpo` text NOT NULL,
  `XmlFotosFim` varchar(50) NOT NULL,
  `XmlVideosInicio` varchar(50) NOT NULL,
  `XmlVideosCorpo` text NOT NULL,
  `XmlVideosFim` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ParceiroId` (`ParceiroId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela bd_smartimovel.XML: ~1 rows (aproximadamente)
DELETE FROM `XML`;
/*!40000 ALTER TABLE `XML` DISABLE KEYS */;
INSERT INTO `XML` (`Id`, `ParceiroId`, `XmlImovelInicio`, `XmlImovelCorpo`, `XmlImovelFim`, `XmlFotosInicio`, `XmlFotosCorpo`, `XmlFotosFim`, `XmlVideosInicio`, `XmlVideosCorpo`, `XmlVideosFim`) VALUES
	(3, 1, '<Imoveis>', '<Imovel>\n<CodigoCentralVendas>123456</CodigoCentralVendas>\n<CodigoImovel>@referencia</CodigoImovel>\n<TipoImovel>@tipoImovel</TipoImovel>\n<SubTipoImovel></SubTipoImovel>\n<TituloImovel>@nome</TituloImovel>\n<Observacao>@descricao</Observacao>\n<Modelo>@tagTipoCarga</Modelo>\n<UF>@uf</UF>\n<Cidade>@cidade</Cidade>\n<Bairro>@bairro</Bairro>\n<Endereco>@logradouro</Endereco>\n<Numero>@numero</Numero>\n<CEP>@cep</CEP>\n<DivulgarEndereco>0</DivulgarEndereco>\n<VisualizarMapa>1</VisualizarMapa>\n<PrecoVenda>@precoVenda</PrecoVenda>\n<PrecoCondominio>@precoCondominio</PrecoCondominio>\n<AreaUtil>@areaUtil</AreaUtil>\n<AreaTotal>@areaTotal</AreaTotal>\n<IdadeImovel>@anoConstrucao</IdadeImovel>\n<UnidadeMetrica>M2</UnidadeMetrica>\n<QtdDormitorios>@qtdDormitorios</QtdDormitorios>\n<QtdSuites>@qtdSuites</QtdSuites>\n<QtdBanheiros>@qtdBanheiros</QtdBanheiros>\n<QtdVagas>@qtdVagas</QtdVagas>\n<Armariodecozinha>@armarioCozinha</Armariodecozinha>\n<Churrasqueira>@churrasqueira</Churrasqueira>\n<Closet>@closet</Closet>\n<Copa>@copa</Copa>\n<Dependenciadeempregados>@dependenciaEmpregados</Dependenciadeempregados>\n<Despensa>@despensa</Despensa>\n<Edicula>@edicula</Edicula>\n<Playground>@playground</Playground>\n<Quintal>@quintal</Quintal>\n<Salaodefestas>@salaoFestas</Salaodefestas>\n<SalaodeJogos>@salaoJogos</SalaodeJogos>\n<Piscina>@piscina</Piscina>\n@fotos\n@videos\n</Imovel>', '</Imoveis>', '<Fotos>', '<Foto>\n<NomeArquivo>@fotoNome</NomeArquivo>\n<URLArquivo>@fotoLink</URLArquivo>\n<Principal>@fotoPrincipal</Principal>\n<Ordem>@fotoOrdem</Ordem>\n</Foto>', '</Fotos>', '<Videos>', '<Video>\n<Descricao>@videoNome</Descricao>\n<URLArquivo>@videoLink</URLArquivo>\n<Principal>1</Principal>\n</Video>', '</Videos>');
/*!40000 ALTER TABLE `XML` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
