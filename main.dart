import 'dart:io';
import 'Animais.dart';
import 'Cachorro.dart';
import 'Galinha.dart';
import 'Leao.dart';

// ===================================================================== FUNÇÕES =================================================================================

// Funçoes de exibição
void menu() {
  print("\n" + "=" * 12 + " OPÇÕES DO MENU " + "=" * 12 + "\n");
  print("Selecione uma opção: ");
  print("1 - Cadastrar novos animais");
  print("2 - Listar todos os animais cadastrados");
  print("3 - Editar dados de um animal existente");
  print("4 - Remover um animal");
  print("5 - Aplicar filtro");
  print("6 - Cadastrar a idade de um animal");
  print("7 - Ouvir som do animal");
  print("0 - SAIR");
}

void menuAnimais() {
  print("\n" + "=" * 24 + "\n");
  print("1 - Cachorro");
  print("2 - Galinha");
  print("3 - Leão");
  print("\n" + "=" * 24);
}


void mostrarLista(List<Animal> animais) {
  print("\n" + "=" * 12 + " Animais Cadastrados " + "=" * 12 + "\n");
  for (int i = 0; i < animais.length; i++) {
    print("${i + 1} - Nome: ${animais[i].nome} - Especie: ${animais[i].especie} - Idade: ${animais[i].mostrar_idade}");
  }
}

//Função para validar a entrada do porte
String validarPorte() {
  while (true) {
    print("Digite o porte do animal (pequeno, medio ou grande):");
    String? entrada = stdin.readLineSync();
    if (entrada != null) {
      String porte = entrada.toLowerCase().trim();
      if (porte == 'pequeno' || porte == 'medio' || porte == 'grande') {
        return porte;
      } else {
        print("Porte invalido tente novamente");
      }
    } else {
      print("Entrada invalida tente novamente");
    }
  }
}

//Função para cadastrar animais
Animal cadastrarAnimal(String especie) {
  print("Digite o nome do animal:");
  String nome = stdin.readLineSync()!;
  print("Digite o porte do animal:");
  String porte = validarPorte();

  switch (especie) {
    case "cachorro":
      return Cachorro(nome: nome, especie: especie, porte: porte);
    case "galinha":
      return Galinha(nome: nome, especie: especie, porte: porte);
    case "leao":
      return Leao(nome: nome, especie: especie, porte: porte);
    default:
      throw Exception("Espécie inválida");
  }
}

// ===================================================================== MAIN =================================================================================
void main() {
  //Instanciando objetos
  Animal cachorro = Cachorro(nome: "Totó", especie: "cachorro", porte: "pequeno");
  Animal leao = Leao(nome: "Rei Leão", especie: "leao", porte: "grande");

  // Inicializando a lista de animais
  List<Animal> animais = [];

  // Adicionando os objetos criados a lista de animais
  animais.add(cachorro);
  animais.add(leao);

  while (true) {
    menu();
    int opcaoUsuario = int.parse(stdin.readLineSync()!);

    // Encerrar o sistema
    if (opcaoUsuario == 0) {
      break;
    }

    // Cadastrar um animal
    if (opcaoUsuario == 1) {
      print("\nQual animal deseja cadastrar?");
      menuAnimais();
      int opcaoAnimal = int.parse(stdin.readLineSync()!);

      String especieSelecionada = "";

      switch (opcaoAnimal) {
        case 1:
          especieSelecionada = "cachorro";
          break;

        case 2:
          especieSelecionada = "galinha";
          break;

        case 3:
          especieSelecionada = "leao";
          break;

        default:
          print("Opção inválida.");
          return;
      }

      Animal novoAnimal = cadastrarAnimal(especieSelecionada);
      animais.add(novoAnimal);

      print("Animal cadastrado com sucesso!");
      mostrarLista(animais);
    }

    // Listar todos os animais cadastrados
    if (opcaoUsuario == 2) {
      mostrarLista(animais);
    }

    // Alterar informações de um usuário
    if (opcaoUsuario == 3) {
      mostrarLista(animais);
      print("Digite o indice do animal que deseja alterar: ");
      int indiceAnimal = int.parse(stdin.readLineSync()!);
      for (int i = 0; i < animais.length; i++) {
        if (i == indiceAnimal - 1) {
          print(
            "Nome: ${animais[i].nome} - Porte: ${animais[i].porte} - Especie: ${animais[i].especie}",
          );
          print("Digite as novas informações: ");
          print("Nome: ");
          String? novoNome = stdin.readLineSync();
          animais[i].nome = novoNome!;
          print("Porte: ");
          String? novoPorte = stdin.readLineSync();
          animais[i].porte = novoPorte!;
          print(
            "Informações Atualizadas com sucesso! \n Nome: ${animais[i].nome} - Porte: ${animais[i].porte} - Especie: ${animais[i].especie}",
          );
          print("Lista nova: ");
          mostrarLista(animais);
          break;
        }
      }
    }

    // Remover um animal da lista
    if (opcaoUsuario == 4) {
      mostrarLista(animais);
      print("Selecione o indice do animal que deseja remover: ");
      int indiceAnimal = int.parse(stdin.readLineSync()!);

      for (int i = 0; i < animais.length; i++) {
        if (i == indiceAnimal - 1) {
          animais.remove(animais[i]);
          print("Removido com sucesso!");
          print("\nLista atualizada: \n");
          for (int i = 0; i < animais.length; i++) {
            print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
          }
        }
      }
    }

    //Realizar filtragem (FILTROS)
    if (opcaoUsuario == 5) {
      print("===== Selecione o filtro que deseja aplicar =====\n");
      print("1 - Por porte \n2 - Por especie");
      int filtro = int.parse(stdin.readLineSync()!);

      // Filtro por porte
      if (filtro == 1) {
        print("Selecione o porte que deseja filtrar: ");
        print("1 - Pequeno\n2 - Medio\n3 - Grande");
        int porte = int.parse(stdin.readLineSync()!);
        switch (porte) {
          case 1:
            List<Animal> porte = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].porte == "pequeno") {
                porte.add(animais[i]);
              }
            }
            for (int i = 0; i < porte.length; i++) {
              print(
                "${i + 1} - Nome: ${porte[i].nome} - ${porte[i].especie} - ${porte[i].porte}",
              );
            }
            break;

          case 2:
            List<Animal> porte = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].porte == "medio") {
                porte.add(animais[i]);
              }
            }
            for (int i = 0; i < porte.length; i++) {
              print(
                "${i + 1} - Nome: ${porte[i].nome} - ${porte[i].especie} - ${porte[i].porte}",
              );
            }
            break;

          case 3:
            List<Animal> porte = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].porte == "grande") {
                porte.add(animais[i]);
              }
            }
            for (int i = 0; i < porte.length; i++) {
              print(
                "${i + 1} - Nome: ${porte[i].nome} - ${porte[i].especie} - ${porte[i].porte}",
              );
            }
            break;
        }
      }

      //Filtro por especie
      if (filtro == 2) {
        print("Selecione a especie que deseja filtrar: ");
        menuAnimais();
        int especie = int.parse(stdin.readLineSync()!);

        switch (especie) {
          case 1:
            List<Animal> especie = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].especie == "cachorro") {
                especie.add(animais[i]);
              }
            }
            for (int i = 0; i < especie.length; i++) {
              print("${i} - Nome: ${especie[i].nome} - ${especie[i].especie}");
            }
            break;

          case 2:
            List<Animal> especie = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].especie == "galinha") {
                especie.add(animais[i]);
              }
            }
            for (int i = 0; i < especie.length; i++) {
              print("${i} - Nome: ${especie[i].nome} - ${especie[i].especie}");
            }
            break;

          case 3:
            List<Animal> especie = [];
            for (int i = 0; i < animais.length; i++) {
              if (animais[i].especie == "leao") {
                especie.add(animais[i]);
              }
            }
            for (int i = 0; i < especie.length; i++) {
              print("${i} - Nome: ${especie[i].nome} - ${especie[i].especie}");
            }
            break;
        }
      }
    }

    //Inserir uma idade a um animal
    if (opcaoUsuario == 6) {
      mostrarLista(animais);
      print("Selecione o indice do animal que deseja inserir a idade: ");
      int indiceAnimal = int.parse(stdin.readLineSync()!);
      bool encontrado = false;

      for (int i = 0; i < animais.length; i++) {
        if (i == indiceAnimal - 1) {
          print("Digite a idade do animal: ");
          int idade = int.parse(stdin.readLineSync()!);
          animais[i].alterar_idade = idade;
          mostrarLista(animais);
          encontrado = true;
        } 
      }
      if (encontrado == false) {
        print("Esse animal não está cadastrado 😥");
      }
    }

    // Ouvir o som de um animal
    if (opcaoUsuario == 7) {
      mostrarLista(animais);
      print("Selecione o indice do animal que deseja ouvir o som: ");
      int indiceAnimal = int.parse(stdin.readLineSync()!);

      for (int i = 0; i < animais.length; i++) {
        if (i == indiceAnimal - 1) {
          print("Animal selecionado: ");
          print(
            "${i} - Nome: ${animais[i].nome} - ${animais[i].especie} - idade: ${animais[i].mostrar_idade}",
          );

          print("\nSeu som:");
          animais[i].emitirSom();
        }
      }
    }
  }
}
