import 'Animais.dart';

class Leao extends Animal {
  Leao({required String especie, required String porte, required String nome})
    : super(especie: especie, porte: porte, nome: nome);

  @override
  void emitirSom() {
    print("Uoorrr, (rugido)");
  }
}
