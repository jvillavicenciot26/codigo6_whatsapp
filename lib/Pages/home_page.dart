import 'package:codigo6_whatsapp/Pages/chat_page.dart';
import 'package:codigo6_whatsapp/Pages/states_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

//Mixin, permite hacer una doble herencia hacia otra clase esto se usa con with
//siempre que se use tabs debera usarse with para generar mixin
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //TabController, lenght = cantidad de tabs que se quiere tener
  //vsync= se le envia la clase actual con this
  //late: siginifica que el objeto sera inicializado luego
  //TabController? myTabController;
  late TabController myTabController;

  //El metodo initState es el estado inicial del statefulwidget
  //se ejecuta antes del metodo build y solo cuando se crea la clase
  //si hacemos un hotreload solo ejecuta el build
  @override
  void initState() {
    super.initState();
    myTabController = TabController(length: 4, vsync: this);
  }

  //El metodo dispose es el estado final del statefulwidget
  //se ejecuta cuando se destruye
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        //backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
        //bottom: parte inferior del appBar
        bottom: TabBar(
          controller: myTabController,
          //indicatorColor: Color de subrayado de tab seleccionado
          indicatorColor: Colors.white,
          //indicatorWeight: Determina el peso
          indicatorWeight: 5.0,
          //isScrollable: Determina si las pestañas estan sujetas a scroll horizontal
          //isScrollable: true,
          //labelColor: Establece el color del texto en cada tab, solo la propiedad text
          labelColor: Colors.white,
          //labelStyle: Permite establecer estilos para los textos de los tabs, propiedad text
          labelStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14.0,
          ),
          //unselectedLabelColor: Establece colores para tabs no seleccionados
          unselectedLabelColor: Colors.amber,
          tabs: [
            Tab(
              //En tab no se puede definir un text y un child juntos
              //text: "Hola",
              icon: Icon(
                Icons.people,
              ),
              //child: Text("Daniel"),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "ESTADOS",
            ),
            Tab(
              text: "LLAMADAS",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.message,
        ),
      ),
      //TabBarView: Para trabajar contenido por cada tab
      body: TabBarView(
        controller: myTabController,
        children: [
          Text(
            "Comunidad",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          // Text(
          //   "Chats",
          //   style: TextStyle(
          //     color: Colors.black,
          //   ),
          // ),
          ChatPage(),
          // Text(
          //   "Estados",
          //   style: TextStyle(
          //     color: Colors.black,
          //   ),
          // ),
          StatesPage(),
          Text(
            "Llamadas",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
