import 'dart:io';

void multiplicationTable(int number) {
  print('Tabel Perkalian $number');
  for (int i = 1; i <= 10; i++) {
    print('$number x $i = ${number * i}');
  }
}

void main() {
  stdout.write('Masukkan angka: ');
  String? input = stdin.readLineSync();
  if (input != null) {
    try {
      int num = int.parse(input);
      multiplicationTable(num);
    } catch (e) {
      print('Harap masukkan angka yang valid.');
    }
  } else {
    print('Anda belum memasukkan angka.');
  }
}