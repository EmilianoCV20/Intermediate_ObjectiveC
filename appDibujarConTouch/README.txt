----------------------------------------------------
1. Overview
----------------------------------------------------
appDibujarConTouch es una aplicación para iOS desarrollada en Objective-C cuyo
objetivo es practicar el manejo de eventos táctiles, dibujo con UIBezierPath,
selección dinámica de color con UIColorPickerViewController y carga interactiva
de imágenes de referencia dentro de un UIImageView.

El usuario puede:
- Dibujar líneas sobre la pantalla usando un solo dedo.  
- Cambiar el color del trazo mediante un selector nativo de color.  
- Borrar completamente el dibujo.  
- Alternar entre diferentes imágenes guía (letras cursivas y una figura).  

La vista principal encargada del dibujo es una subclase personalizada de UIView que 
procesa los eventos táctiles y renderiza el trazo.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
Punto de entrada de la aplicación. Inicializa AppDelegate e inicia el ciclo estándar de ejecución.

/AppDelegate.h – /AppDelegate.m  
Estructura estándar del ciclo de vida global. No contiene lógica adicional personalizada.

/SceneDelegate.h – /SceneDelegate.m  
Gestionan la escena y ventana principal (iOS 13+). Mantienen la estructura estándar.

/DibujarConTouch.h  
Subclase personalizada de UIView. Contiene:  
- Propiedad UIColor *currentColor – Color actual del trazo.  
- UIImageView *imageView – Imagen guía seleccionada.  
- Métodos IBAction: cambiarColor:, botonBorrar:, cambiarImagen:.  

/DibujarConTouch.m  
Implementación completa de la vista de dibujo:  
- Manejo de un UIBezierPath para almacenar las líneas dibujadas.  
- Procesamiento de eventos táctiles:  
  • touchesBegan  
  • touchesMoved  
  • touchesEnded  
  • touchesCancelled  
- Redibujado dinámico con drawRect:.  
- Método borrar para reiniciar el trazado.  
- Implementación de UIColorPickerViewControllerDelegate para seleccionar colores.  
- Ciclo de imágenes mediante un contador (imagen 0–5).  
- Cambio de recurso visual dentro de imageView según selección.

/ViewController.h  
Controlador principal. Sin lógica adicional expuesta en el .h.

/ViewController.m  
Configuración visual inicial:  
- Aplicación de fondo mediante una imagen llamada “grid”.  
- No contiene interacción adicional, ya que la lógica principal reside en DibujarConTouch.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Dibujo con UIBezierPath:**  
  – Línea continua que sigue el movimiento del dedo.  
  – Renderizado en tiempo real.  

• **Eventos táctiles personalizados:**  
  – Soporte para inicio, movimiento y fin del trazo.  
  – Uso de locationInView para posicionamiento preciso.  

• **Control de color dinámico:**  
  – Uso del selector de color nativo (UIColorPickerViewController).  
  – Selección inmediata y actualización del trazo.  

• **Gestión de imágenes de referencia:**  
  – Alterna entre seis imágenes: cursiva_a, cursiva_e, cursiva_i, cursiva_o, cursiva_u y oso.  
  – Muestra cada una en un UIImageView sobre la vista.  

• **Función de borrado total:**  
  – Reinicia el UIBezierPath.  
  – Fuerza el redibujo para limpiar la pantalla.  

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (requerido para UIColorPickerViewController)  
• Xcode con soporte para Objective-C  
• Conexión correcta de Outlets y Actions en Interface Builder:  
  – IBAction cambiarColor:  
  – IBAction botonBorrar:  
  – IBAction cambiarImagen:  
  – IBOutlet UIImageView *imageView  

• Archivos gráficos incluidos en el Asset Catalog:  
  – cursiva_a  
  – cursiva_e  
  – cursiva_i  
  – cursiva_o  
  – cursiva_u  
  – oso  
  – grid (fondo)

----------------------------------------------------
