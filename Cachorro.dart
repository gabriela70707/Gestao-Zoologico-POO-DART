import 'Animais.dart';

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
