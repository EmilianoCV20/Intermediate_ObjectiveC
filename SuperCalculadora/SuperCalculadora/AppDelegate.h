//
//  AppDelegate.h
//  SuperCalculadora
//
//  Created by Emiliano Cepeda on 24/09/24.
//

#import <Cocoa/Cocoa.h>
#import "Matematicas.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    
    __weak IBOutlet NSStepper *sliderN1;
    
    __weak IBOutlet NSSlider *sliderN2;
    
    __weak IBOutlet NSTextField *textoN1;
    
    __weak IBOutlet NSTextField *textoN2;
    
    __weak IBOutlet NSTextField *resultado;
    
}
//SLIDERS
- (IBAction)sliderN1:(id)sender;
- (IBAction)sliderN2:(id)sender;

-(void)awakeFromNib;

//SALIR
- (IBAction)botonSalir:(id)sender;


//BOTONES
//Sumar
@property (weak) IBOutlet NSButton *botonSumar;
- (IBAction)botonSumar:(id)sender;

//Restar
@property (weak) IBOutlet NSButton *botonRestar;
- (IBAction)botonRestar:(id)sender;

//Multiplicar
@property (weak) IBOutlet NSButton *botonMultiplicar;
- (IBAction)botonMultiplicar:(id)sender;

//Dividir
@property (weak) IBOutlet NSButton *botonDivision;
- (IBAction)botonDivision:(id)sender;

//Raiz
@property (weak) IBOutlet NSButton *botonRaiz;
- (IBAction)botonRaiz:(id)sender;

//Potencia
@property (weak) IBOutlet NSButton *botonPotencia;
- (IBAction)botonPotencia:(id)sender;

//Factorial
@property (weak) IBOutlet NSButton *botonFactorial;
- (IBAction)botonFactorial:(id)sender;

//Seno
@property (weak) IBOutlet NSButton *botonSeno;
- (IBAction)botonSeno:(id)sender;

//Coseno
@property (weak) IBOutlet NSButton *botonCoseno;
- (IBAction)botonCoseno:(id)sender;

//Tangente
@property (weak) IBOutlet NSButton *botonTang;
- (IBAction)botonTang:(id)sender;

//Primo
@property (weak) IBOutlet NSButton *botonPrimo;
- (IBAction)botonPrimo:(id)sender;

//Romano
@property (weak) IBOutlet NSButton *botonRomano;
- (IBAction)botonRomano:(id)sender;


//CLASES DE CALCULADORA
//Multiplicar
- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b;
//Sumar
- (NSNumber *)sumar:(NSNumber *)a con:(NSNumber *)b;
//Restar
- (NSNumber *)restar:(NSNumber *)a con:(NSNumber *)b;
//Dividir
- (NSNumber *)dividir:(NSNumber *)a con:(NSNumber *)b;
//Potencia
- (NSNumber *)potenciar:(NSNumber *)a con:(NSNumber *)b;
//Raiz
- (NSNumber *)raiz:(NSNumber *)a;
//Implementar un metodo para calcular factorial
// + Modo iterativo
- (NSNumber *)factorial:(NSNumber *)a;
// + Modo recursivo
- (NSNumber *)factorialR:(NSNumber *)a;

- (BOOL)primo:(int)num;

//Usando la funcion SENO calcular el valor angular de un numero en grados
- (double)seno:(double) angulo;

- (double)coseno:(double) angulo;

- (double)tangente:(double) angulo;

- (double) radianesAgrados:(double)radianes;


@end

