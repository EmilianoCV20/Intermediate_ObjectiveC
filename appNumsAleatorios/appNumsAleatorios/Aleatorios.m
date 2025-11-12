//
//  Aleatorios.m
//  appNumsAleatorios
//
//  Created by Emiliano Cepeda on 23/09/24.
//

#import "Aleatorios.h"

@implementation Aleatorios

- (IBAction)botoSalir:(id)sender {
    
    [NSApp terminate:self];
    
}

- (IBAction)botonGenerarNumero:(id)sender {
    /*
    srand((unsigned int) time(NULL));
    [_label1 setStringValue:@"Generador Iniciado"];
    */
    
    //int n = arc4random();
    int n = arc4random_uniform(90)+10;
    
    NSLog(@"Num: %d", n);
    [_label1 setIntValue:n];
}

- (IBAction)botonIniciarSemilla:(id)sender {
    int n = random()%100 + 1;
    NSLog(@"Num. Generado = % d", n);
    [_label1 setIntValue:n];
}

- (void)awakeFromNib {
    NSDate *now = [NSDate date];
    [_label1 setObjectValue:now];
    [_label1 sizeToFit];
}

@end
