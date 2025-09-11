# 🐾 Sistema de Cadastro de Animais em Dart

Este projeto é um sistema de terminal desenvolvido em Dart para cadastrar, listar, editar e gerenciar animais. Ele simula uma pequena base de dados com funcionalidades interativas, ideal para fins de estudo de programação orientada a objetos e manipulação de listas.

## 📚 Objetivo

Explorar conceitos fundamentais da linguagem Dart como:
- Programação orientada a objetos (herança, polimorfismo)
- Manipulação de listas
- Interação com o terminal
- Estruturação de código em múltiplos arquivos

## 🚀 Como executar

1. Certifique-se de ter o [Dart SDK](https://dart.dev/get-dart) instalado.
2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
Navegue até a pasta do projeto:

```bash
cd nome-do-projeto
```

Execute o programa:

 ```bash
    dart run .\main.dart
```

## 🧮 Estrutura do Projeto

📁 projeto/
├── main.dart
├── Animais.dart
├── Cachorro.dart
├── Galinha.dart
└── Leao.dart

- main.dart: Arquivo principal com o menu e lógica de interação.

- Animais.dart: Classe base Animal com atributos e métodos comuns.

- Cachorro.dart, Galinha.dart, Leao.dart: Classes específicas que herdam de Animal e implementam o método emitirSom.

📋 Funcionalidades
[x] Cadastrar novos animais (Cachorro, Galinha, Leão)

[x] Listar todos os animais cadastrados

[x] Editar dados de um animal

[x] Remover um animal

[x] Filtrar por porte ou espécie

[x] Inserir idade

[x] Ouvir o som do animal (simulado via terminal)

## 🐶 Exemplo de uso

Ao iniciar o programa, o usuário verá um menu como este:


============ OPÇÕES DO MENU ============
1 - Cadastrar novos animais
2 - Listar todos os animais cadastrados
3 - Editar dados de um animal existente
4 - Remover um animal
5 - Aplicar filtro
6 - Cadastrar a idade de um animal
7 - Ouvir som do animal
0 - SAIR

## 🛠️ Tecnologias

- Dart SDK
- Terminal/CLI

📌 Observações
Este projeto é voltado para fins educacionais e pode ser expandido com persistência de dados, interface gráfica ou integração com banco de dados.