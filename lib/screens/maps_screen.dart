import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  final String teamName;

  const MapsScreen({super.key, required this.teamName});

  // Lista de mapas (asegúrate de que las imágenes existen en assets/maps/)
  final List<Map<String, String>> maps = const [
    {"name": "Ascent", "image": "assets/maps/ascent.png"},
    {"name": "Bind", "image": "assets/maps/bind.png"},
    {"name": "Haven", "image": "assets/maps/haven.png"},
    {"name": "Icebox", "image": "assets/maps/icebox.png"},
    {"name": "Lotus", "image": "assets/maps/lotus.png"},
    {"name": "Split", "image": "assets/maps/split.png"},
    {"name": "Sunset", "image": "assets/maps/sunset.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923), // Fallback oscuro
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2733), // 👈 tono más claro para diferenciar
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // 👈 flechita de back en blanco
        ),
        title: Text(
          "Mapas de $teamName",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/fondo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa negra semitransparente
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Contenido de la pantalla
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: maps.length,
            itemBuilder: (context, index) {
              final map = maps[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/composition',
                    arguments: {
                      "team": teamName,
                      "map": map["name"],
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(map["image"]!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), // Oscurece un poco cada mapa
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    map["name"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
