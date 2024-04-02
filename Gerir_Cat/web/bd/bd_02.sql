-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Abr-2024 às 20:51
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_02`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_categoria`
--

CREATE TABLE `t_categoria` (
  `id` int(11) NOT NULL,
  `descricao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `t_categoria`
--

INSERT INTO `t_categoria` (`id`, `descricao`) VALUES
(2, 'Informatica'),
(3, 'Saude'),
(7, 'Ciência'),
(8, 'Tecnologia'),
(9, 'Educação'),
(10, 'Negócios'),
(11, 'História'),
(12, 'Literatura'),
(13, 'Filosofia'),
(14, 'Gastronomia'),
(15, 'Viagens'),
(16, 'Música'),
(17, 'Cinema'),
(18, 'TV e Séries'),
(19, 'Animais'),
(20, 'Natureza'),
(21, 'Arquitetura'),
(22, 'Automóveis'),
(23, 'Aventura'),
(24, 'Fotografia'),
(25, 'Religião'),
(26, 'Política'),
(27, 'Teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_documento`
--

CREATE TABLE `t_documento` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `tamanho` varchar(20) NOT NULL,
  `foto` varchar(253) NOT NULL,
  `ficheiro` varchar(50) NOT NULL,
  `id_subcat` int(11) DEFAULT NULL,
  `publico` int(11) NOT NULL DEFAULT 0,
  `autor` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `t_documento`
--

INSERT INTO `t_documento` (`id`, `nome`, `isbn`, `descricao`, `tamanho`, `foto`, `ficheiro`, `id_subcat`, `publico`, `autor`) VALUES
(10, 'DocumentoTeste', '235425455243', 'fdsfg', 'ewgds', '2 classes.txt', '2 classes.txt', NULL, 0, 0),
(13, 'DocumentoTeste', 'efw', 'sdgf', 'sdg', '2 classes.txt', '2 classes.txt', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_subcat`
--

CREATE TABLE `t_subcat` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) DEFAULT NULL,
  `descricao_subcat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `t_categoria`
--
ALTER TABLE `t_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `t_documento`
--
ALTER TABLE `t_documento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `t_subcat`
--
ALTER TABLE `t_subcat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `t_categoria`
--
ALTER TABLE `t_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `t_documento`
--
ALTER TABLE `t_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `t_subcat`
--
ALTER TABLE `t_subcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
