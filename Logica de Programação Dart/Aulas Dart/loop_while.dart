void main() {
  bool condicao = true;
  int x = 0;
  while (condicao) {
    x++;
    print('rodou $x vezes');
    if (x > 9) {
      condicao = false;
    }
  }
}
