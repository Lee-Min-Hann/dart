import 'dart:io';

bool isPrime(int number){
  if (number < 2) return false;
  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main(){
  stdout.write('Masukkan Angka:');
  int? number = int.tryParse(stdin.readLineSync()!);

  if (number == null) {
    print('Input tidak valid');
    return;
  }

  if (isPrime(number)) {
    print('$number adalah bilangan prima.');
  } else {
    print ('$number bukan bilangan prima');
  }
}