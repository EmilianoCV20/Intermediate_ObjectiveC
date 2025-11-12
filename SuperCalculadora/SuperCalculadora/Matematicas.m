//
//  Matematicas.m
//  SuperCalculadora
//
//  Created by Emiliano Cepeda on 24/09/24.
//

#import "Matematicas.h"

@implementation Matematicas

+ (NSString *)conversorRomano:(NSInteger)num {
    NSMutableString *numRomano = [NSMutableString string];
    NSInteger M = num / 1000;
    NSInteger C = (num % 1000) / 100;
    NSInteger D = (num % 100) / 10;
    NSInteger U = num % 10;
    
    //CONVERTIR A CASE
    
    // Millares
    if (M == 1) {
        [numRomano appendString:@"M"];
    } else if (M == 2) {
        [numRomano appendString:@"MM"];
    } else if (M == 3) {
        [numRomano appendString:@"MMM"];
    }
    
    // Centenas
    if (C == 1) {
        [numRomano appendString:@"C"];
    } else if (C == 2) {
        [numRomano appendString:@"CC"];
    } else if (C == 3) {
        [numRomano appendString:@"CCC"];
    } else if (C == 4) {
        [numRomano appendString:@"CD"];
    } else if (C == 5) {
        [numRomano appendString:@"D"];
    } else if (C == 6) {
        [numRomano appendString:@"DC"];
    } else if (C == 7) {
        [numRomano appendString:@"DCC"];
    } else if (C == 8) {
        [numRomano appendString:@"DCCC"];
    } else if (C == 9) {
        [numRomano appendString:@"CM"];
    }
    
    // Decenas
    if (D == 1) {
        [numRomano appendString:@"X"];
    } else if (D == 2) {
        [numRomano appendString:@"XX"];
    } else if (D == 3) {
        [numRomano appendString:@"XXX"];
    } else if (D == 4) {
        [numRomano appendString:@"XL"];
    } else if (D == 5) {
        [numRomano appendString:@"L"];
    } else if (D == 6) {
        [numRomano appendString:@"LX"];
    } else if (D == 7) {
        [numRomano appendString:@"LXX"];
    } else if (D == 8) {
        [numRomano appendString:@"LXXX"];
    } else if (D == 9) {
        [numRomano appendString:@"XC"];
    }
    
    // Unidades
    if (U == 1) {
        [numRomano appendString:@"I"];
    } else if (U == 2) {
        [numRomano appendString:@"II"];
    } else if (U == 3) {
        [numRomano appendString:@"III"];
    } else if (U == 4) {
        [numRomano appendString:@"IV"];
    } else if (U == 5) {
        [numRomano appendString:@"V"];
    } else if (U == 6) {
        [numRomano appendString:@"VI"];
    } else if (U == 7) {
        [numRomano appendString:@"VII"];
    } else if (U == 8) {
        [numRomano appendString:@"VIII"];
    } else if (U == 9) {
        [numRomano appendString:@"IX"];
    }
    
    return numRomano;
}

@end
