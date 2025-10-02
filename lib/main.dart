import 'package:flutter/material.dart';
import 'screens/teams_screen.dart';
import 'screens/maps_screen.dart';
import 'screens/composition_screen.dart';
import 'screens/agent_info_screen.dart'; // 👈 añade esto

void main() {
  runApp(const ValorantApp());
}

class ValorantApp extends StatelessWidget {
  const ValorantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Comps',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TeamsScreen(),
        '/maps': (context) {
          final teamName = ModalRoute.of(context)!.settings.arguments as String;
          return MapsScreen(teamName: teamName);
        },
        '/composition': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return CompositionScreen(
            teamName: args["team"] ?? "Desconocido",
            mapName: args["map"] ?? "Mapa",
          );
        },
        '/agentInfo': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return AgentInfoScreen(agentName: args["name"] ?? "Agente");
        },
      },
    );
  }
}
