import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> servicos = [
    {
      "titulo": "corte de cabelo",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis quam sit amet risus placerat, id consequat lorem tincidunt. Ut at viverra elit. Sed egestas lectus eget nisi scelerisque, id fermentum felis laoreet. Nulla vel felis nec magna vehicula cursus. Proin vestibulum laoreet libero, ut fringilla mi laoreet a.",
      "preco": 50.00,
      "imagemUrl": "https://via.placeholder.com/150"
    },
    {
      "titulo": "Manicure e pedicure",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pharetra lectus nec ex iaculis, sit amet cursus nulla ullamcorper. Sed pharetra risus ac risus vestibulum, vitae dapibus felis gravida. Donec luctus dolor ac turpis vehicula, sit amet tincidunt turpis varius. Curabitur gravida eros non mauris iaculis, se",
      "preco": 35.00,
      "imagemUrl": "https://via.placeholder.com/150"
    },
    {
      "titulo": "mecanico",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis quam sit amet risus placerat, id consequat lorem tincidunt. Ut at viverra elit. Sed egestas lectus eget nisi scelerisque, id fermentum felis laoreet. Nulla vel felis nec magna vehicula cursus. Proin vestibulum laoreet libero, ut fringilla mi laoreet a.",
      "preco": 150.00,
      "imagemUrl": "https://via.placeholder.com/150"
    },
    {
      "titulo": "eletricista",
      "descricao":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis quam sit amet risus placerat, id consequat lorem tincidunt. Ut at viverra elit. Sed egestas lectus eget nisi scelerisque, id fermentum felis laoreet. Nulla vel felis nec magna vehicula cursus. Proin vestibulum laoreet libero, ut fringilla mi laoreet a.",
      "preco": 250.00,
      "imagemUrl": "https://via.placeholder.com/150"
    },
  ];

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
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          final servico = servicos[index];
          return Card(
            elevation: 0.5,
            margin: const EdgeInsets.all(8.0),
            color: const Color(0xfffcfcfc),
            child: Row(
              children: [
                Image.network(
                  servico["imagemUrl"],
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
                        'R\$ ${servico["preco"].toStringAsFixed(2)}',
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
          );
        },
      ),
    );
  }
}
