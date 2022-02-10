import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];
  void _carregarItens() {
    for (var i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Mussum ipssum";
      item["descricao"] = "Descrição ${i} Mussum Ipssum";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, index) {
              //    Map<String, dynamic> item = _itens[index];
              //     print("item ${item["titulo"]}");
              return ListTile(
                onTap: () {
                  //print("clicou no  item: ${index}");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(_itens[index]["titulo"]),
                        titlePadding: EdgeInsets.all(50),
                        titleTextStyle: TextStyle(fontSize: 20),
                        content: Text(_itens[index]["descricao"]),
                        contentTextStyle: TextStyle(color: Colors.white),
                        backgroundColor: Colors.grey,
                        actions: [
                          FlatButton(
                            child: Text(
                              "Sim",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              print("selecionado sim");
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Não",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              print("selecionado não");
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                title: Text(_itens[index]["titulo"]),
                subtitle: Text(_itens[index]["descricao"]),
              );
            },
          ),
        ));
  }
}
