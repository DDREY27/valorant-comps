import 'package:flutter/material.dart';

class TeamsScreen extends StatelessWidget {
  // Lista de equipos con nombre y logo
  final List<Map<String, String>> teams = [
    {"name": "2Game", "logo": "assets/logos/2game-logo.png"},
    {"name": "100 Thieves", "logo": "assets/logos/100t-logo.png"},
    {"name": "Cloud9", "logo": "assets/logos/cloud9-logo.png"},
    {"name": "DRX", "logo": "assets/logos/drx-logo.png"},
    {"name": "Evil Geniuses", "logo": "assets/logos/evil-logo.png"},
    {"name": "Fnatic", "logo": "assets/logos/fnatic-logo.png"},
    {"name": "Furia", "logo": "assets/logos/furia-logo.png"},
    {"name": "G2", "logo": "assets/logos/g2-logo.png"},
    {"name": "Giants", "logo": "assets/logos/giantx-logo.png"},
    {"name": "Heretics", "logo": "assets/logos/heretics-logo.png"},
    {"name": "KRU", "logo": "assets/logos/kru-logo.png"},
    {"name": "Leviatan", "logo": "assets/logos/leviatan-logo.png"},
    {"name": "Loud", "logo": "assets/logos/loud-logo.png"},
    {"name": "MIBR", "logo": "assets/logos/mibr-logo.png"},
    {"name": "NRG", "logo": "assets/logos/nrg-logo.png"},
    {"name": "Paper Rex", "logo": "assets/logos/paperrex-logo.png"},
    {"name": "Sentinels", "logo": "assets/logos/sentinels-logo.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923), // Fallback
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2733),
        elevation: 0,
        title: const Center(
          child: Text(
            "VCT 2025",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/fondo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa negra semitransparente para difuminar
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Contenido principal
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Equipos Clasificados",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Grid de logos
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columnas
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    final team = teams[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/maps',
                          arguments: team["name"],
                        );
                      },
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            team["logo"]!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
