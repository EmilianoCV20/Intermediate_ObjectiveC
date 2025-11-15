//
//  ViewController.m
//  appIOS1
//
//  Created by Emiliano Cepeda on 03/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Mostrar u ocultar el teclado
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [_texto1 resignFirstResponder];
}

- (IBAction)botonAMayusculas:(UIButton *)sender {
    _texto1.text = [_texto1.text uppercaseString];
}

- (IBAction)text1MostrarTeclado:(UITextField *)sender {
    [self becomeFirstResponder];
}

NSString *saludo = @"HOLA ";
- (IBAction)botonSaludar:(UIButton *)sender {
    _label1.text = [saludo stringByAppendingString:_texto1.text];
    
    //_label1.textColor = [UIColor orangeColor];
    
    _label1.textColor = [UIColor colorWithRed:(177/255) green:(255/255) blue:(180.0/255) alpha:1.0];
}

- (IBAction)botonMayus2:(UIButton *)sender {
    NSMutableString *cad = [_texto1.text mutableCopy];
    //NSMutableString *cadAux = [self aMayusculas2:cad];
    NSMutableString *cadAux = [self aMayusYMinus:cad];
    _label1.text = cadAux;
}

-(NSMutableString *)aMayusculas2: (NSMutableString *) cadena{
    //No usar metodo uppercaseString
    NSUInteger len = [cadena length];
    for (NSUInteger i = 0; i < len; i++) {
        unichar c = [cadena characterAtIndex:i];
        
        if (c >= 'a' && c <= 'z') {
            c = c - ('a' - 'A');
            [cadena replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%C", c]];
        }
    }
    return cadena;
}

-(NSMutableString *)aMayusYMinus: (NSMutableString *) cadena{
    //No usar metodo uppercaseString
    NSUInteger len = [cadena length];
    for (NSUInteger i = 0; i < len; i++) {
        unichar c = [cadena characterAtIndex:i];
        
        if (c >= 'a' && c <= 'z') {
            c = c - ('a' - 'A');
            [cadena replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSMutableString stringWithFormat:@"%C", c]];
        }
        else if (c >= 'A' && c <= 'Z') {
            c = c + ('a' - 'A');
            //c += 32;
            [cadena replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSMutableString stringWithFormat:@"%C", c]];
        }
    }
    return cadena;
}

@end
