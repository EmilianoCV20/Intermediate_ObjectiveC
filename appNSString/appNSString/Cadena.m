//
//  Cadena.m
//  appNSString
//
//  Created by Emiliano Cepeda on 18/09/24.
//

#import "Cadena.h"

@implementation Cadena
//Boton HOLA
- (IBAction)boton1:(NSButton *)sender {
    NSString *saludo = @"Hola ";
    
    NSString *cad1 = [saludo stringByAppendingString:texto1.stringValue];
    
    //[label1 stringValue: cad1];
    [_label1Propiedad setStringValue:cad1];
    //label1.stringValue = cad1;
    
}
- (IBAction)botonContar:(id)sender {
    _botonContar.font = [NSFont fontWithName:@"Arial" size:30];
    _botonContar.title = @"contar";
    
    unsigned long leng = texto1.stringValue.length;
    labelContar1.intValue = (int)leng;
}
- (IBAction)botonMayus:(id)sender {
    NSString *cad = texto1.stringValue;
    NSInteger len = texto1.stringValue.length;
    
    int i, cont;
    i = cont = 0;
    
    while (i < len) {
        unichar letra = [cad characterAtIndex:i];
        if (letra >= 'A' && letra <= 'Z') {
            cont++;
        }
        i++;
    }
    labelMayus.intValue = cont;
}

-(NSMutableString *)aMayusculas: (NSMutableString *) cadena{
    //No usar metodo uppercaseString
    NSUInteger len = [cadena length];
    for (NSUInteger i = 0; i < len; i++) {
        unichar c = [cadena characterAtIndex:i];
        
        // Si el carácter es una letra minúscula (a-z), convertirla a mayúscula
        if (c >= 'a' && c <= 'z') {
            c = c - ('a' - 'A');
            [cadena replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%C", c]];
        }
    }
    return cadena;
}

-(NSMutableString *)aMayusculas2: (NSMutableString *) cadena{
    //No usar metodo uppercaseString
    NSUInteger len = [cadena length];
    NSMutableString *string1;
    int i=0;
    while (i<len) {
        unichar letra = [cadena characterAtIndex:i];
        if (letra >= 'a' && letra <='z') {
            letra -= 32;
            string1 = [NSMutableString stringWithCharacters:&letra length:1];
            [cadena replaceCharactersInRange:NSMakeRange(i, 1) withString:string1];
        }
        i++;
    }
    return cadena;
}

- (IBAction)ButtonMayus:(id)sender {
    NSMutableString *cad = [texto1.stringValue mutableCopy];
    NSMutableString *cadAux = [self aMayusculas2:cad];
    labelConvMayus.stringValue = cadAux;
    texto1.stringValue= cadAux;
}

- (IBAction)BotonConvMayus:(id)sender {
        NSMutableString *textoOriginal = [NSMutableString stringWithString:texto1.stringValue];
        
        NSMutableString *textoMayusculas = [self aMayusculas:textoOriginal];
        
        [labelConvMayus setStringValue:textoMayusculas];
}
@end
