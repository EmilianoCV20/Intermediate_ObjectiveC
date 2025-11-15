//
//  main.m
//  appNSMutableString
//
//  Created by Emiliano Cepeda on 08/10/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *cad1;
        NSMutableString *cad2;
        
        cad1 = [NSMutableString stringWithString:@"Tec.Laguna"];
        
        cad2 = cad1;
        
        [cad2 appendString:@". Torreon, Coah."];
        
        NSLog(@"Contenido Cadena1: %@",cad1);
        NSLog(@"Contenido Cadena2: %@",cad2);

        [cad1 appendString:@" MEXICO."];
        //[cad2 insertString:@" Mexico." atIndex:[cad2 length]];
        NSLog(@"Contenido Cadena1: %@",cad1);
        NSLog(@"Contenido Cadena2: %@",cad2);
        
        //Encontrar subcadenas
        NSRange match;
        NSMutableString *cad3;
        cad3 = [NSMutableString stringWithString:[cad2 lowercaseString]];
        
        match = [cad3 rangeOfString:@"coah."];
        if (match.location == NSNotFound) {
            NSLog(@"Subcadena NO Encontrada");
        } else {
            NSLog(@"Subcadena Encontrada en la posicion: %lu", match.location);
            NSLog(@"Longitud Subcadena: %lu", match.length);
        }
        
        //Remplazar caracteres en un rango
        NSMutableString *cad4 = [NSMutableString stringWithString:@"INSTITUTO TECNOLOGICO DE LA LAGUNA"];
        [cad4 replaceCharactersInRange:NSMakeRange(10, 11) withString:@"tecnologico"];
        NSLog(@"Contenido Cadena4: %@",cad4);
        
        [cad4 replaceCharactersInRange:[cad4 rangeOfString:@"tecnologico"] withString:@"TECNOLOGICO"];
        NSLog(@"Contenido Cadena4: %@",cad4);
        
        //Subcadenas
        NSString *cadAux;
        cadAux = [cad4 substringWithRange:(NSMakeRange(10, 11))];
        NSLog(@"Contenido CadenaAUX: %@",cadAux);
        
        cadAux = [cad4 substringToIndex:21];
        NSLog(@"Contenido CadenaAUX: %@",cadAux);
        
        cadAux = [cad4 substringFromIndex:21];
        NSLog(@"Contenido CadenaAUX: %@",cadAux);
        
        //Eliminar o Borrar
        NSMutableString *cad5 = [[NSMutableString alloc] initWithFormat:@"%@%@",@"Torreon",@", Coahuila"];
        NSLog(@"Contenido Cadena5: %@",cad5);
        
        [cad5 deleteCharactersInRange:[cad5 rangeOfString:@"Torreon"]];
        NSLog(@"Contenido Cadena5: %@",cad5);
        
        //Evaluacion
        //INvertir la cadena 5
        NSMutableString *reversa = [NSMutableString stringWithCapacity:[cad5 length]];
        
        [cad5 enumerateSubstringsInRange:NSMakeRange(0,[cad5 length])
                              options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            [reversa appendString:substring];
        }];
        NSLog(@"Contenido Cadena: %@",reversa);
        
    }
    return 0;
}
