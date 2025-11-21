----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación para iOS diseñada para demostrar el uso de  Core Graphics mediante 
dibujo manual en un UIView personalizado. El proyecto  incluye ejemplos de figuras 
geométricas, curvas de Bézier cúbicas y cuadráticas, rellenos de color y la capacidad
de trazar líneas personalizadas ingresadas por el usuario.

El usuario puede especificar coordenadas (x1, y1, x2, y2) y el grosor del trazo 
para dibujar una línea sobre la vista gráfica.

Este proyecto proporciona una base clara para entender:
- Ciclo de renderizado en UIView (drawRect).
- Uso de CGContext para dibujar líneas, polígonos, rectángulos y curvas.
- Manejo de colores, rellenos y trazos.
- Integración entre controles de interfaz (UITextField) y render dinámico.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada de la app. Registra AppDelegate y lanza UIApplicationMain.

AppDelegate.h / AppDelegate.m  
    Manejo global del ciclo de vida de la aplicación. (Estandar).

SceneDelegate.h / SceneDelegate.m  
    Gestión de escenas, ventanas y estados en iOS 13+.

Graficos.h / Graficos.m  
    - Subclase UIView encargada del dibujo.
    - drawRect implementa:
        • Un rombo centrado en la pantalla.  
        • Rectángulo con trazo y relleno.  
        • Curva Bézier cúbica personalizada.  
        • Curva Bézier cuadrática.  
        • Línea generada por el usuario mediante coordenadas ingresadas.  
    - Método dibujarLineaDesdeX:… permite actualizar las coordenadas y el grosor, 
      activando un nuevo render usando setNeedsDisplay.

ViewController.h  
    - UITextFields:
        labelX1, labelY1 → Coordenada inicial de la línea  
        labelX2, labelY2 → Coordenada final  
        labelGrosor → Grosor del trazo  
    - IBAction botonLinea → Llama a la función de dibujo en la vista Graficos.

ViewController.m  
    - Inicializa Graficos como subview de la vista principal.  
    - Envía valores numéricos ingresados por el usuario a la vista de dibujo.  
    - Lógica para trazar la línea con el grosor especificado.  
    - Ejemplo de integración entre UI y renderizado gráfico.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Dibujo de figuras geométricas  
    - Rombo centrado y relleno.  
    - Rectángulo con stroke + fill.  

• Curvas Bézier  
    - Bézier cúbica personalizada.  
    - Bézier cuadrática con punto de control centrado.

• Dibujo dinámico desde UI  
    - Usuario introduce puntos y grosor.  
    - drawRect se actualiza en tiempo real con nueva línea.

• Render por Core Graphics  
    - Uso directo de CGContext: líneas, rellenos, colores y path management.  
    - Ejemplo ideal para estudiantes que inician en dibujo 2D en iOS.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte Objective-C  
• Storyboard con:
    - Campos de entrada para coordenadas y grosor  
    - Botón para activar el dibujo

