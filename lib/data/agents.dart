// lib/data/agents.dart

final Map<String, Map<String, dynamic>> agents = {
  "Viper": {
    "image": "assets/characters/viper.png",
    "role": "Controlador",
    "abilities": [
      {
        "name": "Nube Venenosa",
        "description":
            "Coloca una granada de gas que puede reactivarse varias veces para crear una nube tóxica que consume combustible."
      },
      {
        "name": "Pantalla Tóxica",
        "description":
            "Lanza una línea de emisores que pueden reactivarse para formar un muro de gas venenoso que bloquea visión."
      },
      {
        "name": "Veneno de Serpiente",
        "description":
            "Dispara un cartucho químico que crea un charco de ácido, dañando a los enemigos dentro."
      },
      {
        "name": "Pozo de la Víbora (Ultimate)",
        "description":
            "Genera una enorme nube tóxica que reduce la visión y la vida máxima de los enemigos."
      },
    ],
  },

  "Jett": {
    "image": "assets/characters/jett.png",
    "role": "Duelista",
    "abilities": [
      {
        "name": "Corriente Ascendente",
        "description": "Se eleva rápidamente en el aire."
      },
      {
        "name": "Vendaval",
        "description":
            "Lanza un proyectil de humo que bloquea visión durante unos segundos."
      },
      {
        "name": "Impulso (Dash)",
        "description": "Se desplaza velozmente en la dirección elegida."
      },
      {
        "name": "Tormenta de Cuchillas (Ultimate)",
        "description":
            "Arroja cuchillas precisas que se recargan al conseguir una baja."
      },
    ],
  },
};
