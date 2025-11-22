----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación para iOS desarrollada en Objective-C cuyo propósito es practicar el uso 
de UIPickerView, manejo de múltiples arreglos, condicionales y actualización dinámica 
de la interfaz según la selección del usuario.

La aplicación permite:
- Seleccionar un país de origen (USA, México o China).
- Seleccionar la divisa del país destino, dependiente del país de origen.
- Ingresar una cantidad numérica.
- Convertir dicha cantidad según el tipo de cambio correspondiente.
- Mostrar el resultado en tiempo real.

Utiliza dos componentes en el UIPickerView:
1. Columna izquierda: país base.  
2. Columna derecha: divisas disponibles según el país seleccionado.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
Punto de entrada de la aplicación. Registra AppDelegate e inicia el ciclo de vida estándar.

/AppDelegate.h – /AppDelegate.m  
(No incluidos, pero son estándar). Manejan el ciclo de vida global de la aplicación.

/SceneDelegate.h – /SceneDelegate.m  
Gestionan la escena principal (iOS 13+), configuración inicial de ventanas y estados.

/ViewController.h  
Controlador principal que gestiona entradas, salidas y los UIPickerView:  
- IBOutlet UITextField *textoEntrada – Cantidad a convertir.  
- IBOutlet UILabel *labelResultado – Muestra el resultado final.  
- IBOutlet UIPickerView *pickerDivisasPaises – Selector de país y divisa.  
- NSArray *tipoDeCambio – Tipos de cambio cuando el origen es USD.  
- NSArray *tipoDeCambioPesos – Tipos de cambio cuando el origen es MXN.  
- NSArray *tipoDeCambioYen – Tipos de cambio cuando el origen es CNY.

/ViewController.m  
Implementación de la lógica del conversor:  
- Declaración de arreglos locales: pais, divisasPaisesDolar, divisasPaisesPeso, divisasPaisesYen.  
- Flags esDolar y esYen para determinar el origen de conversión.  
- Configuración del UIPickerView (dataSource y delegate).  
- Implementación de los métodos del UIPickerView:  
  • numberOfComponentsInPickerView  
  • pickerView:numberOfRowsInComponent  
  • pickerView:titleForRow  
  • pickerView:didSelectRow  
- Conversión dinámica basada en la selección y en el valor ingresado.  
- Construcción de cadenas con formato para mostrar resultados.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Selector de dos columnas: país base + divisa destino.  
• Cambio dinámico de la lista de divisas al seleccionar un país.  
• Cálculo automático según tipo de cambio correspondiente:  
  – Dólares (USA)  
  – Pesos (México)  
  – Yen (China)  
• Actualización inmediata del resultado al seleccionar la divisa destino.  
• Manejo de múltiples arreglos para tipos de cambio y destinos.  
• Formateo de cadenas para mostrar resultados legibles.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Storyboard conectado correctamente a los IBOutlets e IBAction implícitos  
• UIPickerView configurado con dos componentes  

----------------------------------------------------
