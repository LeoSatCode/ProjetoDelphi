# 🎬 Sistema de Vendas - Curso Delphi

![Delphi](https://img.shields.io/badge/Delphi-VCL-red?style=for-the-badge&logo=delphi)
![SQL Server](https://img.shields.io/badge/SQL_Server-FireDAC-blue?style=for-the-badge&logo=microsoft-sql-server)
![Windows](https://img.shields.io/badge/Windows-Desktop-lightgrey?style=for-the-badge&logo=windows)
![Status](https://img.shields.io/badge/Status-Conclu%C3%ADdo-success?style=for-the-badge)

## 🎯 Objetivo
Sistema desenvolvido durante treinamento na Dom Tec Sistemas

- **Desafio:** Mini ERP de Vendas

## 💻 Tecnologias Utilizadas
* **Linguagem/Framework:** Delphi (VCL)
* **Banco de Dados:** Microsoft SQL Server
* **Acesso a Dados:** FireDAC
* **Manipulação de Dados:** `REST.Json` (Serialização e Desserialização)

## 🚀 Como Executar

O sistema foi projetado para criar as tabelas do SQL Server em sua primeira execução.

**Passo a Passo de Execução:**
1. Abra o projeto no Delphi 10.2 Tokyo ou Superior.
2. Execute com F9. O sistema avisará que o arquivo Vendas.INI foi gerado.
3. Edite o Arquivo INI com as preferencias de conxão ou edite diretamente o Data Module do projeto + Conexão no form uPrincipal.
4. Abra o SQL Server e crie o Banco `vendas` (CREATE DATABASE vendas).
5. **Criação Automática das Tabelas:** Após a conexão, o sistema fará a conexão com o banco `vendas` criando as tabelas necessarias.

