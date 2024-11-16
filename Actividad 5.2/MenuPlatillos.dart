import 'dart:io';

void main() {
  Map<String, double> menu = {
    'Pasta': 30.0,
    'Pizza': 50.0,
    'Ensalada': 25.0,
    'Sopa': 20.0,
    'Tacos': 15.0,
    'Hamburguesa': 40.0,
    'Sushi': 60.0,
    'Chilaquiles': 35.0,
    'Pozole': 45.0,
    'Sandwich': 20.0
  };

  while (true) {
    print('\n=== Menú de Opciones ===');
    print('1) Mostrar todos los platillos');
    print('2) Buscar un platillo');
    print('3) Actualizar el precio de un platillo');
    print('4) Salir');
    print('Selecciona una opción:');

    int option = int.parse(stdin.readLineSync()!);

    if (option == 4) break;

    switch (option) {
      case 1:
        mostrarMenu(menu);
        break;
      case 2:
        buscarPlatillo(menu);
        break;
      case 3:
        actualizarPrecio(menu);
        break;
      default:
        print('Opción no válida. Intenta nuevamente.');
    }
  }
}

void mostrarMenu(Map<String, double> menu) {
  print('\n=== Menú de Platillos ===');
  menu.forEach((platillo, precio) {
    print('Platillo: $platillo, Precio: \$${precio.toStringAsFixed(2)}');
  });
}

void buscarPlatillo(Map<String, double> menu) {
  print('\nIngresa el nombre del platillo que deseas buscar:');
  String platillo = stdin.readLineSync()!;
  if (menu.containsKey(platillo)) {
    print(
        'Platillo encontrado: $platillo, Precio: \$${menu[platillo]!.toStringAsFixed(2)}');
  } else {
    print('El platillo "$platillo" no se encuentra en el menú.');
  }
}

void actualizarPrecio(Map<String, double> menu) {
  print('\nIngresa el nombre del platillo al que deseas actualizar el precio:');
  String platillo = stdin.readLineSync()!;
  if (menu.containsKey(platillo)) {
    print('Ingresa el nuevo precio para $platillo:');
    double nuevoPrecio = double.parse(stdin.readLineSync()!);
    menu[platillo] = nuevoPrecio;
    print(
        'El platillo "$platillo" ha sido actualizado. Nuevo precio: \$${nuevoPrecio.toStringAsFixed(2)}');
  } else {
    print(
        'El platillo "$platillo" no se encuentra en el menú. No se realizó ningún cambio.');
  }
}
