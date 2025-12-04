----------------------------------------------------
1. Overview
----------------------------------------------------
appJuego1Carta es una aplicación para iOS desarrollada en Objective-C cuyo propósito es implementar un
juego de memoria con cartas. El objetivo principal es seleccionar cartas y descubrir coincidencias. 
El usuario obtiene puntos al acertar y pierde puntos al fallar. Cuando el jugador logra 5 coincidencias,
se muestra una alerta indicando la victoria.

El sistema utiliza:
- Lógica de coincidencias entre cartas.
- Modelo de baraja tradicional de **52 cartas** utilizando trajes (♠︎, ♣︎, ♥︎, ♦︎) y rangos (A–K).
- Control visual dinámico basado en **UIButton**, imágenes y texto cambiante.
- Alertas integradas en interfaz para notificaciones importantes.

La administración del puntaje, coincidencias y estado del juego se gestiona mediante clases del modelo, aplicando principios básicos del patrón **MVC**.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
Punto de entrada de la aplicación. Inicializa AppDelegate y activa el ciclo estándar de ejecución 
de la app.

/AppDelegate.h – /AppDelegate.m  
Implementación estándar del ciclo de vida global. Configura la app, conecta escenas y establece comportamientos predeterminados de ejecución.

/SceneDelegate.h – /SceneDelegate.m  
Gestionan la ventana principal de la aplicación bajo iOS 13+. No contienen lógica particular asignada
al flujo del juego.

/ViewController.h  
Archivo de interfaz del controlador principal. Contiene:
- Conexiones IBOutlets para etiquetas y botones.
- IBOutletCollection con los botones que representan cartas.
- Declaración de métodos para reiniciar, mostrar información y voltear cartas.

/ViewController.m  
Archivo donde reside la lógica activa del juego:
- Manejo visual de cartas (texto, imagen, habilitación).
- Control del puntaje y coincidencias mediante la instancia de `CardMatchingGame`.
- Creación dinámica de alertas (Acerca de / Ganador).
- Reinicio completo del estado del juego.
- Conexión entre UI y modelo mediante `updateUI`, `cardAtIndex`, `chooseCardAtIndex`.

----------------------------------------------------
2.5 Carpeta "model"
----------------------------------------------------

Todos los archivos siguientes están en la carpeta `/model` y definen el núcleo lógico del juego:

/Card.h – /Card.m  
Clase base representando una carta. Define estado (chosen, matched) y contenido identificable.

/Deck.h – /Deck.m  
Maneja almacenamiento y manipulación de cartas:
- Agregar cartas
- Extraer carta al azar

/PlayingCard.h – /PlayingCard.m  
Extiende `Card` para representar una carta real con rango (A–K) y traje (♠︎, ♣︎, ♥︎, ♦︎). Implementa su contenido visual y reglas propias.

/PlayingCardDeck.h – /PlayingCardDeck.m  
Genera una baraja completa de **52 cartas** recorriendo todos los trajes y rangos.

/CardMatchingGame.h – /CardMatchingGame.m  
Clase central de reglas del juego. Define:
- Puntaje dinámico según coincidencias y penalizaciones.
- Conteo de coincidencias logradas.
- Estado de cartas (elegida, emparejada).
- Regla de victoria al alcanzar cinco coincidencias.

Constantes utilizadas:
- MISMATCH_PENALTY = 2
- MATCH_BONUS = 4
- COST_TO_CHOOSE = 1

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Selección de cartas con botón interactivo.  
• Representación visual dinámica mediante:
  – Texto del botón  
  – Imagen de carta volteada (FrontCard / BackCard)  
• Sistema de puntaje automático basado en aciertos y errores.  
• Control del flujo de victoria tras 5 coincidencias exitosas.  
• Reinicio completo del juego con baraja nueva y puntaje restablecido.  
• Pantalla "Acerca de" mediante UIAlertController.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Imágenes con los siguientes nombres en Assets:  
  – FrontCard  
  – BackCard  

----------------------------------------------------
