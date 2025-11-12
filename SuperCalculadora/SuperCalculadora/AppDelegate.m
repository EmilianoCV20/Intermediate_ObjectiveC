//
//  AppDelegate.m
//  SuperCalculadora
//
//  Created by Emiliano Cepeda on 24/09/24.
//

#import "AppDelegate.h"
#import "Matematicas.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    //self->textoN1.stringValue = [NSString stringWithFormat:@"%d", (int)self->sliderN1.intValue];
    //self->textoN2.stringValue = [NSString stringWithFormat:@"%d", (int)self->sliderN2.intValue];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)botonSalir:(id)sender {
    NSBeep();
    NSAlert *alert = [[NSAlert alloc]init];
    [alert setMessageText:@"Adios! 👋🏼"];
    [alert setInformativeText:@"B Y E 🤖"];
    [alert addButtonWithTitle:@"CANCELAR"];
    [alert addButtonWithTitle:@"OK"];
    
    if ([alert runModal] == NSAlertSecondButtonReturn) {
        [NSApp terminate:self];
    }
    
}

//SLIDERS
- (IBAction)sliderN2:(id)sender {
    int nuevoValor = [self->sliderN2 intValue];

    self->textoN2.stringValue = [NSString stringWithFormat:@"%d", nuevoValor];
}

/*
- (IBAction)sliderN1:(id)sender {
    int nuevoValor = self->sliderN1.intValue;
        
    self->textoN1.stringValue = [NSString stringWithFormat:@"%d", nuevoValor];
} */
- (IBAction)sliderN1:(id)sender {
    // Capturar el valor actual del textbox (siendo textoN1)
    int valorAnt = [self->textoN1.stringValue intValue];
    
    // Obtener el valor actual del stepper (sliderN1)
    int nuevoValor = [self->sliderN1 intValue];
    
    // Sumar el valor del stepper al valor anterior del textbox
    int valorAcumulado = valorAnt + nuevoValor;
    
    // Actualizar el valor en el textbox con el valor acumulado
    self->textoN1.stringValue = [NSString stringWithFormat:@"%d", valorAcumulado];
    
    [self->sliderN1 setIntValue:0];
}


- (void)awakeFromNib {
    textoN1.intValue = sliderN1.intValue;
    sliderN2.intValue = 0;
    textoN2.intValue = sliderN2.intValue;
}

//MULTIPLICACION
- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b {
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 * number2;
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}
//Sumar
- (NSNumber *)sumar:(NSNumber *)a con:(NSNumber *)b {
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 + number2;
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}
//Restar
- (NSNumber *)restar:(NSNumber *)a con:(NSNumber *)b {
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 - number2;
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}
//Dividir
- (NSNumber *)dividir:(NSNumber *)a con:(NSNumber *)b {
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = number1 / number2;
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}
//Potencia
- (NSNumber *)potenciar:(NSNumber *)a con:(NSNumber *)b {
    float number1 = [a floatValue];
    float number2 = [b floatValue];
    float product = pow(number1, number2);
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}

- (NSNumber *)potenciar2:(NSNumber *)a con:(NSNumber *)b {
    float base = [a floatValue];
    int exponente = [b intValue]; // Solo trabajamos con enteros para el exponente
    float resultado = 1.0;

    // Si el exponente es 0, cualquier número elevado a 0 es 1
    if (exponente == 0) {
        return @1;
    }
    
    // Calcular la potencia para exponentes positivos
    for (int i = 0; i < abs(exponente); i++) {
        resultado *= base;
    }
    // Si el exponente es negativo, se calcula el inverso
    if (exponente < 0) {
        resultado = 1.0 / resultado;
    }

    return [NSNumber numberWithFloat:resultado];
}

//Raiz
- (NSNumber *)raiz:(NSNumber *)a {
    float number1 = [a floatValue];
    float product = sqrt(number1);;
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}

//FACTORIAL
- (NSNumber *)factorial:(NSNumber *)a {
    float number1 = [a floatValue];
    float product = number1;
    for (double i = number1-1; i > 0; i--) {
        product = product * i;
    }
    NSNumber *result = [NSNumber numberWithFloat:product];
    return result;
}

- (NSNumber *)factorialR:(NSNumber *)a {
    float number = [a floatValue];
    if (number <= 1) {
        return @1;
    } else {
        NSNumber *FactAnt = [self factorialR:[NSNumber numberWithFloat:number - 1]];
        NSNumber *result = [NSNumber numberWithFloat:number * [FactAnt floatValue]];
        return result;
    }
}

//PRIMO
- (BOOL)primo:(int)num {
    if (num <= 1) {
        //NSLog(@"El numero NO es primo");
        return NO;
    }
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            //NSLog(@"El numero NO es primo");
            return NO;
        }
    }
    //NSLog(@"El numero SI es primo");
    return YES;
}

//SENO
- (double)seno:(double) angulo
{
    //(angulo * M_PI) /180
    return sin([self radianesAgrados:angulo]);
}

//ANGULO
- (double) radianesAgrados:(double)radianes
{
    return (radianes * M_PI)/180.0;
}

//COSENO
- (double)coseno:(double)angulo {
    return cos([self radianesAgrados:angulo]);
}
//TANGENTE
- (double)tangente:(double)angulo {
    return tan([self radianesAgrados:angulo]);
}

//BOTONES-------------------------
- (IBAction)botonSumar:(id)sender {
        float numero1 = [textoN1 floatValue];
        float numero2 = [textoN2 floatValue];
        
        NSNumber *num1 = [NSNumber numberWithFloat:numero1];
        NSNumber *num2 = [NSNumber numberWithFloat:numero2];
        
        NSNumber *resultadoS = [self sumar:num1 con:num2];
        
        [resultado setFloatValue:[resultadoS floatValue]];
}

- (IBAction)botonRestar:(id)sender {
    float numero1 = [textoN1 floatValue];
    float numero2 = [textoN2 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    NSNumber *num2 = [NSNumber numberWithFloat:numero2];
    
    NSNumber *resultadoS = [self restar:num1 con:num2];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}
- (IBAction)botonMultiplicar:(id)sender {
    float numero1 = [textoN1 floatValue];
    float numero2 = [textoN2 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    NSNumber *num2 = [NSNumber numberWithFloat:numero2];
    
    NSNumber *resultadoS = [self multiplyA:num1 withB:num2];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}
- (IBAction)botonDivision:(id)sender {
    float numero1 = [textoN1 floatValue];
    float numero2 = [textoN2 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    NSNumber *num2 = [NSNumber numberWithFloat:numero2];
    
    NSNumber *resultadoS = [self dividir:num1 con:num2];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}
- (IBAction)botonRaiz:(id)sender {
    float numero1 = [textoN1 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    
    NSNumber *resultadoS = [self raiz:num1];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}
- (IBAction)botonPotencia:(id)sender {
    float numero1 = [textoN1 floatValue];
    float numero2 = [textoN2 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    NSNumber *num2 = [NSNumber numberWithFloat:numero2];
    
    NSNumber *resultadoS = [self potenciar:num1 con:num2];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}

- (IBAction)botonFactorial:(id)sender {
    float numero1 = [textoN1 floatValue];
    
    NSNumber *num1 = [NSNumber numberWithFloat:numero1];
    
    NSNumber *resultadoS = [self factorialR:num1];
    
    [resultado setFloatValue:[resultadoS floatValue]];
}

- (IBAction)botonSeno:(id)sender {
    float angulo = [self->textoN1 floatValue];
    
    double resultadoSeno = [self seno:angulo];
    [self->resultado setDoubleValue:resultadoSeno];
}

- (IBAction)botonCoseno:(id)sender {
    float angulo = [self->textoN1 floatValue];
        
        double resultadoCoseno = [self coseno:angulo];
    [self->resultado setDoubleValue:resultadoCoseno];
}

- (IBAction)botonTang:(id)sender {
    float angulo = [self->textoN1 floatValue];
        
        double resultadoTangente = [self tangente:angulo];
    [self->resultado setDoubleValue:resultadoTangente];
}

- (IBAction)botonPrimo:(id)sender {
    int numero1 = [textoN1 floatValue];
    
    if([self primo:numero1] == YES){
        [resultado setStringValue:(@"Primo")];
    } else {
        [resultado setStringValue:(@"NO Primo")];
    }
}

- (IBAction)botonRomano:(id)sender {
    int numero1 = [textoN1 floatValue];
    
    NSString *romano = [Matematicas conversorRomano:numero1];
    [resultado setStringValue:(romano)];
}

@end
