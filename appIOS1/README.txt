----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación sencilla para iOS desarrollada en Objective-C cuyo propósito es practicar interacción 
básica con la interfaz gráfica, manejo de controles (UILabel, UITextField, UIButton) y manipulación 
manual de cadenas.

Las funciones principales incluyen:
- Saludar al usuario con un texto personalizado.
- Convertir texto a mayúsculas utilizando métodos nativos.
- Convertir texto entre mayúsculas y minúsculas sin usar métodos nativos (manipulación manual de caracteres).
- Ocultar o mostrar el teclado según la interacción del usuario.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada de la aplicación. Configura el ciclo de vida de la app y registra AppDelegate.

AppDelegate.h / AppDelegate.m  
    (No mostrado, pero estándar). Maneja el ciclo de vida global de la aplicación.

SceneDelegate.h / SceneDelegate.m  
    Maneja escenas y ventanas en iOS 13+. Inicializa la UI y responde a cambios de estado de la escena.

ViewController.h  
    - IBOutlet UITextField *texto1: Campo donde el usuario escribe.  
    - IBOutlet UILabel *label1: Etiqueta para mostrar resultados.  
    - IBAction botonSaludar: Muestra el saludo concatenando el texto ingresado.  
    - IBAction botonAMayusculas: Convierte a mayúsculas usando uppercaseString.  
    - IBAction botonMayus2: Convierte letras a mayúsculas/minúsculas sin métodos nativos.  
    - Método aMayusculas2: Conversión manual a mayúsculas.  
    - Método aMayusYMinus: Alterna entre mayúsculas y minúsculas manualmente.

ViewController.m  
    Implementación de la lógica principal:  
    - Configuración del gesto para ocultar teclado.  
    - Métodos de conversión manual de caracteres.  
    - Implementación de botones de la interfaz.  
    - Ejemplo de manipulación de UIColor.  

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Saludo dinámico:  
    label1 muestra “HOLA {texto ingresado}”.

• Conversión automática a mayúsculas:  
    texto1 → uppercaseString.

• Conversión manual mayúsculas/minúsculas:  
    Recorrido carácter por carácter usando rangos ASCII.

• Ocultar teclado con tap:  
    Se agrega UITapGestureRecognizer para mejorar la experiencia de usuario.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Storyboard con conexiones a los IBOutlets e IBActions mencionados
