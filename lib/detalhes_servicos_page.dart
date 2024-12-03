import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetalhesServicosPage extends StatelessWidget {
  final Map<String, dynamic> servico;
  const DetalhesServicosPage({super.key, required this.servico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(servico['titulo']),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
            (servico['fotos'][0]['imagem']),
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            (servico['titulo']),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            (servico['descricao']),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'R\$ ${double.parse(servico["valor"]).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const Divider(),
          Text("Endereço: ${servico["endereco"]}"),
          Text("Bairro: ${servico["bairro"]}"),
          Text("CEP: ${servico["cep"]}"),
          Text("Telefone: ${servico["telefone"]}"),
          Text("Celular: ${servico["celular"]}"),
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
                  // Ação do botão para abrir WhatsApp
                },
                icon: const FaIcon(FontAwesomeIcons.whatsapp),
                label: const Text('WhatsApp'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
