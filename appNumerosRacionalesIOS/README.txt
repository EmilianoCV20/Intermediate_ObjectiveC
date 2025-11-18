----------------------------------------------------
1. Overview
----------------------------------------------------
Aplicación para iOS que permite realizar operaciones con números racionales, 
convertir resultados, manipular fracciones, traducir valores a números romanos 
y transformar fechas a formato romano.
El usuario interactúa mediante textboxes, botones numéricos, steppers y
funciones matemáticas implementadas manualmente.

La app es un ejemplo de:
- Manipulación de UI en iOS (UITextField, UILabel, UIButtons).
- Operaciones aritméticas con estructuras tipo “Racional”.
- Conversión de números enteros a numeración romana.
- Conversión de decimales a fracciones mediante aproximación continua.
- Manejo de fechas personalizadas en formato romano.
- Control de entrada numérica sin teclado (se deshabilita inputView).

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/main.m  
    Punto de entrada de la aplicación. Configura la ejecución y registra AppDelegate.

AppDelegate.h / AppDelegate.m  
    Maneja el ciclo de vida global de la app y la configuración de escenas.

SceneDelegate.h / SceneDelegate.m  
    Gestiona ventanas y escenas en iOS 13+. Controla estados como foreground,
    background, active e inactive.

ViewController.h  
    Componentes principales:
    - Textboxes:
        textboxX1, textboxY1 → Primer número racional (num/den)
        textboxX2, textboxY2 → Segundo número racional
        textboxR → Resultado
        textBoxDia, textBoxMes, textBoxAno → Fecha a convertir a romano

    - Botones Stepper:
        Incrementan/decrementan los valores numéricos de cada textbox.

    - Botones Operaciones:
        botonSuma, botonResta, botonMulti, botonDiv → Operaciones con racionales  
        botonRomano → Muestra numeración romana alternando entre r1 y r2  
        botonConv → Convierte decimal a fracción  
        botonFecha → Convierte la fecha ingresada a números romanos (dos formatos)

    - Botones Utilidad:
        botonClear → Limpia todo  
        botonBorrar → Elimina último dígito del textbox activo  
        botonNumero → Inserta dígitos dependiendo del textbox seleccionado

    - Métodos auxiliares:
        conversorRomano:num → Convierte enteros a números romanos  
        decimalAFraccion → Convierte decimales a fracciones usando aproximación  
        struct Racional y funciones suma/resta/multiplicar/dividir/escribir → lógica aritmética

ViewController.m  
    Contiene la lógica completa del proyecto:
    - Inicializa valores y deshabilita teclado físico usando inputView vacío.
    - Implementa stepper manual con botones (+ / −).
    - Realiza todas las operaciones matemáticas con racionales.
    - Implementa algoritmos:
        • conversión a números romanos  
        • conversión decimal → fracción  
        • procesamiento de fechas → romano  
    - Controla borrado, concatenación de números y limpieza global.
    - Maneja alternancia entre resultados (tipoRomano, tipoFecha).

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Operaciones con números racionales**
    - Implementación manual de suma, resta, multiplicación y división.
    - Manejo mediante estructura `struct Racional`.

• **Conversión a número romano**
    - Descomposición del entero en unidades, decenas, centenas y millares.
    - Permite alternar entre dos racionales diferentes.

• **Conversión de decimal a fracción**
    - Utiliza aproximaçión continua tipo "convergentes" con tolerancia.

• **Conversión de fechas**
    - Cambia entre formatos:
        dd-mm-aaaa (romano)  
        mm-dd-aaaa (romano)

• **Botones numéricos**
    - La app no usa teclado, sino ingreso controlado con botones.

• **Funciones de utilidad**
    - Borrar último dígito del textbox activo.
    - Limpiar todo el contenido.
    - Control del resultado en screen.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior  
• Xcode con soporte Objective-C  
• Storyboard con:
    - Conexiones a todos los IBOutlets/IBActions especificados
    - Botones numéricos del 0 al 9  
    - Contenedores UI para textboxes y label de resultado
