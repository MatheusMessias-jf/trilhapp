import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int numMax) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numMax);
  }
}
