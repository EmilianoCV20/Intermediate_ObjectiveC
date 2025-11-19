----------------------------------------------------
1. Overview
----------------------------------------------------
appPickerViewER1 es una aplicación iOS desarrollada en Objective-C cuyo propósito es 
validar texto mediante distintas expresiones regulares seleccionadas por el usuario 
desde un UIPickerView.

El usuario escribe una cadena en un UITextField y selecciona, desde el Picker, un patrón 
de validación. La aplicación compara la cadena con la expresión regular y muestra si es 
válida o inválida.

Las expresiones regulares incluidas permiten validar:
- Números hexadecimales
- Números binarios
- Números octales
- Números decimales
- Direcciones de correo electrónico

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada de la aplicación. Inicializa UIApplication y configura AppDelegate.

AppDelegate.h / AppDelegate.m  
    Maneja el ciclo de vida de la aplicación. Código estándar generado por Xcode.

SceneDelegate.h / SceneDelegate.m  
    Administra las escenas y la ventana de la app. Gestiona estados como foreground, background y activación.

ViewController.h  
    - IBOutlet UITextField *textoEntrada:  
        Cadena ingresada por el usuario para validar.  
    - IBOutlet UILabel *labelSalida:  
        Muestra el resultado de la validación.  
    - IBOutlet UIPickerView *pickerViewER1:  
        Lista de expresiones regulares disponibles.  
    - Conforma a UIPickerViewDelegate y UIPickerViewDataSource.

ViewController.m  
    Implementa la lógica principal de validación:  
    - Carga de un arreglo de expresiones regulares.  
    - Configuración del UIPickerView (componentes, filas, títulos).  
    - Implementación del método didSelectRow para validar la entrada.  
    - Uso de NSRegularExpression para realizar la comparación.  
    - Actualización del label según si la cadena coincide con el patrón.  

----------------------------------------------------
3. Expresiones Regulares Utilizadas
----------------------------------------------------
Las expresiones cargadas en el arreglo son:

1) `^[a-fA-F0-9]+$` → Número hexadecimal  
2) `^[0-1]+$` → Número binario  
3) `^[0-7]+$` → Número octal  
4) `[0-9]+$` → Número decimal  
5) `[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}` → Email válido

----------------------------------------------------
4. Funcionalidad Clave
----------------------------------------------------
• Selección de patrón vía UIPickerView  
    La app muestra un único componente con 5 expresiones regulares.

• Validación dinámica  
    Cada vez que el usuario selecciona una expresión distinta, se valida el contenido actual del texto.

• Uso de NSRegularExpression  
    Se generan coincidencias con el método matchesInString.  
    Si se encuentra al menos una coincidencia → “Número Válido”.  
    Si no hay coincidencias → “Número Inválido”.

• Salida en consola  
    Se imprime el resultado de validación junto al texto evaluado.

----------------------------------------------------
5. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte para Objective-C  
• Storyboard configurado con los IBOutlets y el UIPickerView

