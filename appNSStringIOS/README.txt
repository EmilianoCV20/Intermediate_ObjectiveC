----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación en iOS diseñada como un juego de
adivinanza de palabras. El usuario recibe una pista y debe escribir la
palabra correcta utilizando un teclado personalizado (sin usar el
teclado del sistema).

La aplicación implementa:
- Manejo de UI manual (UILabel, UITextField, UIButton).
- Diccionario de palabras con pistas (NSDictionary).
- Generación aleatoria de palabras.
- Validación de respuestas y conteo de puntuación.
- Sistema de intentos con reinicio automático.
- Sistema de ayudas basado en expresiones regulares (RegEx).
- Deshabilitación del teclado estándar mediante inputView vacío.

El flujo principal consiste en adivinar la palabra correcta, usar
botones de letras personalizados y solicitar ayudas que pueden revelar
vocales o número de consonantes según el estado actual.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada de la aplicación. Inicializa y enlaza AppDelegate.

AppDelegate.h / AppDelegate.m  
    Manejan el ciclo de vida de la aplicación y la configuración de
    escenas (iOS 13+).

SceneDelegate.h / SceneDelegate.m  
    Controlan la escena principal, administran estados como foreground,
    background, active e inactive.

ViewController.h  
    Componentes principales:
    - Labels:
        textPuntuacion → muestra la puntuación actual  
        textPista → muestra la pista correspondiente  
        textIntentos → muestra intentos restantes  

    - UITextField:
        textPalabra → campo donde el usuario forma la palabra (sin teclado)

    - Botones:
        botonAceptar → valida respuesta  
        botonLetra → agrega una letra al campo  
        botonBorrar → elimina el último carácter  
        botonClean → limpia el texto completo  
        botonAyuda → despliega ayudas dinámicas

    - Atributos funcionales:
        palabrasYPistas → diccionario con palabras y pistas  
        palabraActual → palabra aleatoria asignada  
        puntuacion → conteo de aciertos  
        intentos → intentos disponibles por palabra  
        ayuda → alterna entre ayuda de vocales o consonantes

ViewController.m  
    Contiene la lógica completa del juego:
    - Inicializa la interfaz, elimina teclado estándar y asigna
      un diccionario de palabras.
    - Selecciona palabras aleatorias usando arc4random_uniform.
    - Actualiza estado de UI (puntuación, intentos).
    - Implementa escritura mediante botones personalizados.
    - Maneja lógica de validación:
        • aciertos → incremento y nueva palabra  
        • fallos → decremento de intentos  
        • intentos agotados → reinicio automático
    - Implementa ayudas:
        • mostrarVocales → usa RegEx [aeiou]  
        • mostrarConsonantes → usa RegEx [bcdfghjklmnñpqrstvwxyz]  
        • gestiona alternancia mediante variable ayuda
    - Controla limpieza, borrado individual y reinicio del textbox.
    - Maneja múltiples alertas mediante UIAlertController.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------

• Generación de palabra aleatoria  
    - Selección aleatoria desde NSDictionary.  
    - Vinculación automática con su pista.

• Sistema de intentos  
    - Tres intentos por palabra.  
    - Reinicio automático al fallar los tres intentos.

• Validación de respuesta  
    - Compara textPalabra con palabraActual.  
    - Gestiona puntuación y cambio de palabra.

• Teclado personalizado  
    - Se elimina inputView del UITextField.  
    - Entrada textual controlada por botones.

• Ayudas basadas en RegEx  
    - Vocales: extracción mediante `[aeiou]`.  
    - Consonantes: conteo mediante `[bcdfghjklmnñpqrstvwxyz]`.  
    - Alternancia entre ambos tipos usando variable “ayuda”.

• Alertas informativas  
    - Confirmación de ayuda.  
    - Alertas de vocales, consonantes.  
    - Alerta de último intento consumido.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte Objective-C  
• Storyboard con:
    - Conexiones a todos los IBOutlets / IBActions  
    - Botones alfabéticos para formar palabras  
    - Botón de ayuda, borrar, limpiar y aceptar respuesta
