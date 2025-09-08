import 'dart:ffi';
import 'dart:io';
import 'Animais.dart';

void main() {
  Animal cachorro = Cachorro(
    nome: "Totó",
    especie: "cachorro",
    porte: "pequeno",
  );
  Animal leao = Leao(nome: "Rei Leão", especie: "leão", porte: "grande");

  List<Animal> animais = [];

  animais.add(cachorro);
  animais.add(leao);

  menu();

  int opcaoUsuario = int.parse(stdin.readLineSync()!);
  if (opcaoUsuario == 1) {
    print("Qual animal deseja cadastrar?");
    menuAnimais();
    int opcaoAnimal = int.parse(stdin.readLineSync()!);

    switch (opcaoAnimal) {
      case 1:
        print("Digite o nome do animal");
        String nome = "";
        nome = stdin.readLineSync()!;
        print("Digite o porte do animal: (pequeno, medio, grande)");
        String? porte = stdin.readLineSync();
        Animal animal = Cachorro(
          especie: "cachorro",
          porte: porte!,
          nome: nome,
        );
        print(
          "Animal cadastrado com sucesso! ${animal.especie}, ${animal.porte}, ${animal.nome}",
        );
        animais.add(animal);

      case 2:
        print("Digite o nome do animal");
        String nome = "";
        nome = stdin.readLineSync()!;
        print("Digite o porte do animal: (pequeno, medio, grande)");
        String? porte = stdin.readLineSync();
        Animal animal = Galinha(especie: "galinha", porte: porte!, nome: nome);
        print(
          "Animal cadastrado com sucesso! ${animal.especie}, ${animal.porte}, ${animal.nome}",
        );
        animais.add(animal);

      case 3:
        print("Digite o nome do animal");
        String nome = "";
        nome = stdin.readLineSync()!;
        print("Digite o porte do animal: (pequeno, medio, grande)");
        String? porte = stdin.readLineSync();
        Animal animal = Leao(especie: "leão", porte: porte!, nome: nome);
        print(
          "Animal cadastrado com sucesso! ${animal.especie}, ${animal.porte}, ${animal.nome}",
        );
        animais.add(animal);
    }
  }
  if (opcaoUsuario == 2) {
    for (var animal in animais) {
      print("Nome: ${animal.nome} - ${animal.especie}");
    }
  }
  if (opcaoUsuario == 3) {
    for (int i = 0; i < animais.length; i++) {
      print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
    }
    print("Digite o indice do animal que deseja alterar: ");
    int indiceAnimal = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < animais.length; i++) {
      if (i == indiceAnimal) {
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
        break;
      }
    }
  }

  if (opcaoUsuario == 4) {
    for (int i = 0; i < animais.length; i++) {
      print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
    }
    print("Selecione o indice do animal que deseja remover: ");
    int indiceAnimal = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < animais.length; i++) {
      if (i == indiceAnimal) {
        animais.remove(animais[i]);
        print("Removido com sucesso!");
        print("Lista atualizada: ");
        for (int i = 0; i < animais.length; i++) {
          print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
        }
      }
    }
  }

  if (opcaoUsuario == 5) {
    print("Selecione o filtro que deseja aplicar: ");
    print("1 - Por porte \n2- Por especie");
    int filtro = int.parse(stdin.readLineSync()!);
    if (filtro == 1) {
      print("Selecione o porte que deseja filtrar: ");
      print("1 - Pequeno\n2- Medio\n 3 - Grande");
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
            print("${i} - Nome: ${porte[i].nome} - ${porte[i].especie}");
          }

        case 2:
          List<Animal> porte = [];
          for (int i = 0; i < animais.length; i++) {
            if (animais[i].porte == "medio") {
              porte.add(animais[i]);
            }
          }
          for (int i = 0; i < porte.length; i++) {
            print("${i} - Nome: ${porte[i].nome} - ${porte[i].especie}");
          }

        case 3:
          List<Animal> porte = [];
          for (int i = 0; i < animais.length; i++) {
            if (animais[i].porte == "grande") {
              porte.add(animais[i]);
            }
          }
          for (int i = 0; i < porte.length; i++) {
            print("${i} - Nome: ${porte[i].nome} - ${porte[i].especie}");
          }
      }
    }

    //Filtro por especie
    if (filtro == 2) {
      print("Selecione a especie que deseja filtrar: ");
      print("1 - Cachorro\n2- Galinha\n 3 - Leão");
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
      }
    }
  }

  if (opcaoUsuario == 6) {
    for (int i = 0; i < animais.length; i++) {
      print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
    }
    print("Selecione o indice do animal que deseja inserir a idade: ");
    int indiceAnimal = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < animais.length; i++) {
      if (i == indiceAnimal) {
        print("Digite a idade do animal: ");
        int idade = int.parse(stdin.readLineSync()!);
        animais[i].alterar_idade = idade;
        print("Idade adicionada com sucesso! ");
        print("Lista atualizada: ");
        print(
          "${i} - Nome: ${animais[i].nome} - ${animais[i].especie} - idade: ${animais[i].mostrar_idade}",
        );
      }
    }
  }

  if (opcaoUsuario == 7) {
    for (int i = 0; i < animais.length; i++) {
      print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie}");
    }
    print("Selecione o indice do animal que deseja ouvir o som: ");
    int indiceAnimal = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < animais.length; i++) {
      if (i == indiceAnimal) {
        print("Animal selecionado: ");
        print("${i} - Nome: ${animais[i].nome} - ${animais[i].especie} - idade: ${animais[i].mostrar_idade}");

        print("\nSeu som:");
        animais[i].emitirSom();
      }
    }
  }
}

void menu() {
  print("Selecione uma opção: ");
  print("1 - Cadastrar novos animais");
  print("2 - Listar todos os animais cadastrados");
  print("3 - Editar dados de um animal existente");
  print("4 - Remover um animal");
  print("5 - Aplicar filtro");
  print("6 - Cadastrar a idade de um animal");
  print("7 - Ouvir som do animal");
}

void menuAnimais() {
  print("1 - Cachorro");
  print("2 - Galinha");
  print("3 - Leão");
}
