import 'package:flutter/material.dart';
import '../data/compositions.dart';

class CompositionScreen extends StatelessWidget {
  final String teamName;
  final String mapName;

  const CompositionScreen({
    super.key,
    required this.teamName,
    required this.mapName,
  });

  @override
  Widget build(BuildContext context) {
    final composition = compositions[teamName]?[mapName];

    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2733),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Composición de $teamName en $mapName",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Fondo difuminado
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/fondo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          if (composition == null)
            const Center(
              child: Text(
                "No hay datos para este mapa",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAgent(context, composition[0]),
                    _buildAgent(context, composition[1]),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAgent(context, composition[2]),
                    _buildAgent(context, composition[3]),
                  ],
                ),
                const SizedBox(height: 30),
                _buildAgent(context, composition[4]),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAgent(BuildContext context, Map<String, String> data) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/agentInfo',
              arguments: {"name": data["name"] ?? "Agente"}, // 👈 ahora sí mandamos el nombre real del agente
            );
          },
          child: Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: AssetImage(data["agent"]!), // la imagen del personaje
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          data["player"]!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
