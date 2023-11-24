import 'dart:io';

late String? nama;
void main() {
  int umur = 3;
  nama = stdin.readLineSync();
  print("nama : $nama");

  var apaAja = [1, 'a', true, null, 2.5, 0.001];
  print(apaAja);

  var a = [1, 2, 3, 4];
  var b = [...a, 5];
  print(b);

  String? message;
  String text = message ?? "Empty";

  print(text);

  List angka = [1, 2, 3, 4, 5];
  printList();

  angka.forEach((element) {
    print(element);
  });
}

void printList([List? l]) {
  print('List l');
} 
