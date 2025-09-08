import 'dart:io';

// Especie, porte ✅
// Sistema deve: listar todos os animais, gerar um relatorio simples, executar ações especificas de acordo com o tipo do animal
// ter pelo o menos 3 subclasses ✅
class Animal {
  String especie;
  String porte;
  String nome;
  int _idade = 0;

  Animal({required this.nome, required this.especie, required this.porte});

  set alterar_idade(int idade) {
    if (idade > 0) {
      _idade = idade;
      print("Idade cadastrada com sucesso");
    } else {
      print("Digite uma idade válida. Idade tem que ser maior que 0");
    }
  }

  int get mostrar_idade {
    return _idade;
  }

  void emitirSom() {
    print("Animal emitindo som");
  }
}

class Cachorro extends Animal {
  Cachorro({
    required String especie,
    required String porte,
    required String nome,
  }) : super(especie: especie, porte: porte, nome: nome);

  @override
  void emitirSom() {
    print("Au Au");
  }
}

class Galinha extends Animal {
  Galinha({
    required String especie,
    required String porte,
    required String nome,
  }) : super(especie: especie, porte: porte, nome: nome);

  @override
  void emitirSom() {
    print("Pó Pó Pó");
  }
}

class Leao extends Animal {
  Leao({
    required String especie, 
    required String porte, 
    required String nome
    }) : super(especie: especie, porte: porte, nome: nome);

  @override
  void emitirSom() {
    print("Uoorrr, (rugido)");
  }
}
