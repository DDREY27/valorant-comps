import 'package:flutter/material.dart';
import '../data/agents.dart'; // 👈 aquí está toda la info de los personajes

class AgentInfoScreen extends StatelessWidget {
  final String agentName;

  const AgentInfoScreen({
    super.key,
    required this.agentName,
  });

  @override
  Widget build(BuildContext context) {
    final agent = agents[agentName]; // obtenemos datos desde agents.dart

    if (agent == null) {
      return Scaffold(
        backgroundColor: const Color(0xFF0F1923),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2733),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(agentName),
        ),
        body: const Center(
          child: Text(
            "No hay información disponible de este agente",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    final List abilities = agent["abilities"] as List;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2733),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          agentName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen grande del agente
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage(agent["image"] as String),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Rol
            Text(
              "Rol: ${agent["role"]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Lista de habilidades
            ...abilities.map((ability) {
              return Card(
                color: Colors.black.withOpacity(0.5),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ability["name"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ability["description"],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
