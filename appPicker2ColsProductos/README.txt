----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación desarrollada en Objective-C que utiliza múltiples UIPickerViews para permitir 
al usuario seleccionar productos, colores y modos de ajuste visual. La aplicación actualiza 
dinámicamente una etiqueta descriptiva, el color de fondo de una imagen y la imagen mostrada, 
de acuerdo con las selecciones del usuario.

Las funciones principales incluyen:
- Selección de productos mediante UIPickerView.  
- Selección de colores que modifican dinámicamente el fondo del UIImageView.  
- Selección de modo de ajuste (contentMode) para manipular cómo se presenta la imagen.  
- Visualización de la combinación elegida en la etiqueta principal.  
- Cambio automático de imágenes según el producto seleccionado.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada estándar de la aplicación. Inicializa el ciclo de vida del programa.

AppDelegate.h / AppDelegate.m  
    Manejan el ciclo de vida global de la aplicación (no mostrado, implementación estándar).

SceneDelegate.h / SceneDelegate.m  
    Manejan escenas y ventanas en iOS 13+. Configuran la vista inicial.

ViewController.h  
    - IBOutlet UILabel *label1: Muestra el producto y el color seleccionados.  
    - IBOutlet UIImageView *imageView1: Muestra el producto con la configuración visual seleccionada.  
    - IBOutlet UIPickerView *pickerView1 / *pickerView2: Controlan la selección de productos, 
      colores y ajustes.

ViewController.m  
    Lógica principal de la interfaz:  
    - Inicialización de arrays (productos, colores, modos de ajuste).  
    - Configuración visual inicial de la vista y la imagen.  
    - Implementación de UIPickerViewDelegate y UIPickerViewDataSource.  
    - Cambio dinámico de imagen y color dependiendo de selections.  
    - Ajuste del modo de visualización con UIViewContentMode.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Picker de tres componentes:  
    1. Producto  
    2. Color  
    3. Ajuste de imagen (contentMode)

• Actualización dinámica del UILabel:  
    label1 muestra “{producto}, {color}”.

• Cambio automático de imagen según producto seleccionado.  
    Imágenes como: “PantallaLCD”, “ipad”, “bici1”, “moto1”, “ferrari1”, “camioneta1”.

• Cambio de color del UIImageView:  
    Incluye opciones predefinidas y color aleatorio con valores RGB generados aleatoriamente.

• Modos de ajuste (contentMode):  
    ScaleAspectFit, TopLeft, TopRight, BottomLeft, BottomRight, Center.

• Cambio dinámico de fondo de la vista principal con un color definido en viewDidLoad.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Imágenes incluidas en el asset catalog con los nombres especificados  
• Conexiones correctas de IBOutlets y UIPickerViews en el Storyboard
