import 'Animais.dart';

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
