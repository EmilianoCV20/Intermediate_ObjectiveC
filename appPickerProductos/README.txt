----------------------------------------------------
1. Overview
----------------------------------------------------
appPickerProductos es una aplicación para iOS desarrollada en Objective-C cuyo
propósito es practicar el uso avanzado de **UIPickerView** con múltiples componentes,
manejo de varios arreglos simultáneos, actualización dinámica de imágenes y colores,
conversión de divisas, ajustes visuales y cálculo de precios con o sin IVA.

La aplicación permite:
- Seleccionar un producto entre múltiples opciones.
- Seleccionar un color que cambia dinámicamente el fondo del indicador.
- Ajustar el modo de visualización de la imagen (AspectFit, TopLeft, Center, etc.).
- Seleccionar una divisa para convertir el precio del producto.
- Aplicar IVA según elección del usuario.
- Actualizar la imagen del producto automáticamente según la selección.

El funcionamiento se basa en **dos UIPickerView independientes**:
1. **pickerView1** – Producto, color y modo de ajuste.  
2. **pickerView2** – Divisa y configuración de IVA.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
Punto de entrada de la aplicación. Inicializa AppDelegate e inicia el ciclo estándar de
ejecución de la aplicación.

/AppDelegate.h – /AppDelegate.m  
Implementación estándar del ciclo de vida global. Configura la aplicación, sesiones de escena y
manejo básico.

/SceneDelegate.h – /SceneDelegate.m  
Gestionan la ventana principal y los estados de la escena (iOS 13+). No contienen lógica
personalizada específica para esta app.

/ViewController.h  
Archivo de interfaz del controlador principal. Declaración de Outlets y DataSource/Delegates:
- UILabel *labelProd – Muestra el nombre del producto seleccionado.  
- UILabel *labelColor – Indicador visual del color seleccionado.  
- UILabel *labelPrecio – Muestra el precio final convertido.  
- UIImageView *imageView1 – Imagen dinámica del producto.  
- UIPickerView *pickerView1 – Selector de producto, color y ajuste.  
- UIPickerView *pickerView2 – Selector de divisa e IVA.  
- NSArray *tipoDeCambioPesos – Factores de conversión para cada divisa.

/ViewController.m  
Archivo central de la lógica de la aplicación. Contiene:
- Declaración de arreglos locales:  
  • productos  
  • colores  
  • ajustar  
  • divisas  
  • precios  
  • iva  
- Configuración inicial de fondos y transparencias.  
- Definición de los datos para cada UIPickerView.  
- Asignación de dataSource y delegate.  
- Lógica de selección dentro de:  
  • numberOfComponentsInPickerView  
  • pickerView:numberOfRowsInComponent  
  • pickerView:titleForRow  
  • pickerView:didSelectRow  
- Cambio dinámico del color del indicador según selección.  
- Cambio dinámico de la imagen del producto.  
- Conversión de precios según tipo de divisa.  
- Aplicación opcional de IVA al precio final.  
- Ajuste dinámico del modo de visualización (ContentMode) del UIImageView.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Selector múltiple (pickerView1 con 3 componentes):**  
  – Producto  
  – Color  
  – Ajuste visual de imagen  

• **Selector secundario (pickerView2 con 2 componentes):**  
  – Divisa  
  – IVA ("Incluido" o "Sin IVA")

• **Actualización automática:**  
  – Cambia la imagen según producto.  
  – Cambia el fondo del label según color elegido.  
  – Ajusta el modo de contenido según selección.  
  – Calcula precio en tiempo real dependiendo del tipo de cambio.  
  – Aplica IVA del 16% en caso de seleccionarlo.

• **Integración de múltiples arreglos coordinados** para generar cambios simultáneos en la interfaz.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Storyboard conectado correctamente a los siguientes IBOutlets:  
  – UILabels  
  – UIImageView  
  – UIPickerView (dos instancias)  
• Imágenes con nombres correspondientes a:  
  XboxSerieX, SwitchOLED, Playstation5, SillaGamer, PantallaOLED, Funkos, Teclados, Audifonos,
  MousePad, Posters  
• Asset Mario.jpg utilizado como fondo.

/** Nota **/  
Se requiere que ambos UIPickerView estén conectados como dataSource y delegate del ViewController.
