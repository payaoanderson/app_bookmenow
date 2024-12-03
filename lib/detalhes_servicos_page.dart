import 'package:flutter/material.dart';
//import 'package:font_awesome_icon_class/font_awesome_icon_class.dart' as font_awesome_icon;

class DetalhesServicosPage extends StatelessWidget {
  const DetalhesServicosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nome Serviços"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            "assets/tecnico-em-mecanica.png",
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Titulo do Serviço",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Descriçao do Serviço"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "R\$ 20,00",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const Divider(),
          const Text("Endereço: paraiba, 125"),
          const Text("Bairro: Centro"),
          const Text("CEP: 17512792"),
          const Text("Telefone: 14-2587411"),
          const Text("Celular: 14-996999-8888"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Ação do botão
                },
                icon: const Icon(Icons.phone),
                label: const Text('Ligar'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Ação do botão
                },
//                icon: const Icon(Icons.what),
                label: const Text('WhatsApp'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
