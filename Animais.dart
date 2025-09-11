import 'dart:io';

class Animal {
  String especie;
  String porte;
  String nome;
  int _idade = 0;

  Animal({required this.nome, required this.especie, required this.porte});

  set alterar_idade(int idade) {
    bool idadeInvalida = true;
    while (idadeInvalida) {
      if (idade > 0 || idade < 50) {
        _idade = idade;
        print("Idade cadastrada com sucesso");
        idadeInvalida = false;
      } else {
        print("Digite uma idade válida. Idade tem que ser maior que 0 e menor que 50");
        print("Tente novamente: ");
        idade = int.parse(stdin.readLineSync()!);
      }
    }
  }

  int get mostrar_idade {
    return _idade;
  }

  void emitirSom() {
    print("Animal emitindo som");
  }
}
