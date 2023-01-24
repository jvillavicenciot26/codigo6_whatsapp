import 'package:codigo6_whatsapp/Pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        //brightness: permite establecer tema claro u oscuro
        brightness: Brightness.dark,
        //useMaterial3: establece patron de diseño en Material3
        useMaterial3: true,
        //scaffoldBackgroundColor: establece el color de los background de todos los scaffold
        scaffoldBackgroundColor: Colors.white,
        //appBarTheme: permite centralizar los estilos de los appbar de toda la app
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
        //floatingActionButtonTheme: permite centralizar los estilos de los floatingactionbutton de toda la app
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
