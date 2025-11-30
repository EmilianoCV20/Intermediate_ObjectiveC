----------------------------------------------------
1. Overview
----------------------------------------------------
appProyectoGraficos es una aplicación de iOS desarrollada en Objective-C cuyo propósito
es practicar conceptos fundamentales de dibujo 2D utilizando Core Graphics, así como la
interacción con controles de interfaz para modificar parámetros visuales.

El proyecto incluye:
- Dibujo de líneas, rectángulos, curvas cuadráticas y curvas Bézier cúbicas.
- Configuración de puntos de inicio, fin y puntos de control mediante UITextFields.
- Elección del tipo de figura mediante UISegmentedControl.
- Ajuste dinámico del grosor de línea.
- Vista adicional de información con explicaciones e imágenes de cada figura.
- Ocultamiento del teclado mediante gesto.
- Actualización de labels con el tamaño actual de la vista de dibujo.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
Punto de entrada de la aplicación. Configura y lanza UIApplication con AppDelegate.

/AppDelegate.h – AppDelegate.m  
Implementación estándar del ciclo de vida global de la aplicación. Configura escenas para iOS 13+.

/SceneDelegate.h – SceneDelegate.m  
Maneja la escena principal, ciclo de vida cuando entra en foreground, background, etc.

/ViewController.h – ViewController.m  
Controlador principal:
- Presenta InfoViewController al presionar “Ayuda”.
- Implementa UITapGestureRecognizer para ocultar el teclado.
- Contiene la vista de dibujo (Graficos) en el storyboard.

/Graficos.h – Graficos.m  
Clase central del proyecto, hereda de UIView.
Funcionalidad:
- Dibujo personalizado mediante Core Graphics.
- Lectura de puntos y parámetros desde UITextFields:  
  • textoX1, textoY1, textoX2, textoY2  
  • textoPC1, textoPC2, textoPC3, textoPC4  
  • textoGrosor  
- Actualización de labels con ancho y alto de la vista: labelAncho, labelAlto.
- Delegados para UITextFields y cierre de teclado con return.
- Dibujo según selección de UISegmentedControl:
  • tipo 0 = Línea  
  • tipo 1 = Rectángulo  
  • tipo 2 = Curva cuadrática (1 punto de control)  
  • tipo 3 = Curva Bézier cúbica (2 puntos de control)
- Funciones internas:
  • dibujarLinea  
  • dibujarRectangulo  
  • dibujarCurva1  
  • dibujarCurva2

/InfoView.h – InfoView.m  
Vista informativa que muestra descripción de cada figura dibujada.
- Cambia título, descripción e imagen según UISegmentedControl.
- Explica de forma sencilla cada figura geométrica.

/InfoViewController.h – InfoViewController.m  
Controlador para la pantalla de información presentada desde ViewController.

/Assets  
Imágenes utilizadas por InfoView: linea, rectangle, curvaQ, curvaB, etc.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------

• Dibujo con Core Graphics:  
  Uso de CGContextRef para crear líneas, rectángulos y curvas mediante funciones MoveToPoint,
  AddLineToPoint, AddRect, AddQuadCurveToPoint y AddCurveToPoint.

• Parámetros dinámicos:  
  El usuario introduce coordenadas y grosor, y la vista se redibuja con setNeedsDisplay.

• Control mediante UISegmentedControl:  
  Permite elegir rápidamente qué figura dibujar.

• Lectura de UITextFields:  
  Cada valor es convertido a int o float antes del dibujo.

• Curvas Bézier:  
  Permite practicar tanto curvas cuadráticas como cúbicas con puntos de control configurados
  desde la interfaz.

• InfoView interactiva:  
  Muestra información textual y visual relacionada con cada tipo de figura.

• Manejo del teclado y UX:  
  - Oculta teclado con Return.  
  - Oculta teclado con tap en la pantalla gracias a UITapGestureRecognizer.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Storyboard configurado con:  
  – Conexiones de los IBOutlet para los TextFields y Labels en la clase Graficos  
  – Vista InfoViewController en Storyboard con identifier: "InfoViewController"  
  – Imágenes cargadas en Assets: linea, rectangle, curvaQ, curvaB, etc.

----------------------------------------------------
