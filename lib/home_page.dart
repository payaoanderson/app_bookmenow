import 'package:bookmenow/detalhes_servicos_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> servicos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    listaServicos();
  }

  Future<void> listaServicos() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.56.45.24/public/api/servicos"));
      if (response.statusCode == 200) {
        setState(() {
          servicos = json.decode(response.body);
          isLoading = false;
        });
      }
    } catch (e) {
      mostrarError("Erro: $e");
    }
  }

  void mostrarError(String mesagem) {
    setState(() {
      isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mesagem)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BookMeNow"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: const [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 16,
                ),
                child: Text(
                  "Olá, Anderson",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              //trailing: Icon(Icons.login),
              title: Text("Login"),
            ),
            ListTile(
              leading: Icon(Icons.list),
              //trailing: Icon(Icons.login),
              title: Text("Serviços"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              //trailing: Icon(Icons.login),
              title: Text("Dúvidas"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              //trailing: Icon(Icons.login),
              title: Text("Sobre O BooKMeNow"),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: servicos.length,
              itemBuilder: (context, index) {
                final servico = servicos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesServicosPage(
                          servico: servico,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 0.5,
                    margin: const EdgeInsets.all(8.0),
                    color: const Color(0xfffcfcfc),
                    child: Row(
                      children: [
                        Image.network(
                          servico['fotos'][0]['imagem'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                servico["titulo"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                servico["descricao"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'R\$ ${double.parse(servico["valor"]).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
