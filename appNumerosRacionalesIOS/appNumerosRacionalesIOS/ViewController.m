//
//  ViewController.m
//  appNumerosRacionalesIOS
//
//  Created by Emiliano Cepeda on 10/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    int tipoFecha;
    int tipoRomano;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tipoFecha = 0;
    tipoRomano = 0;
    
    UIView *viewVacia = [[UIView alloc] initWithFrame:CGRectZero];
    _textboxX1.inputView = viewVacia;
    _textboxY1.inputView = viewVacia;
    _textboxX2.inputView = viewVacia;
    _textboxY2.inputView = viewVacia;
    
    _textBoxDia.inputView = viewVacia;
    _textBoxMes.inputView = viewVacia;
    _textBoxAno.inputView = viewVacia;
}


- (IBAction)botonMenosY2:(UIButton *)sender {
    
    if ([_textboxY2.text isEqualToString:@""]) {
        int i = 0;
        i--;
        _textboxY2.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxY2.text intValue];
        i--;
        _textboxY2.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMasY2:(UIButton *)sender {
    
    if ([_textboxY2.text isEqualToString:@""]) {
        int i = 0;
        i++;
        _textboxY2.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxY2.text intValue];
        i++;
        _textboxY2.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMenosX2:(UIButton *)sender {
    
    if ([_textboxX2.text isEqualToString:@""]) {
        int i = 0;
        i--;
        _textboxX2.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxX2.text intValue];
        i--;
        _textboxX2.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMasX2:(UIButton *)sender {
    
    if ([_textboxX2.text isEqualToString:@""]) {
        int i = 0;
        i++;
        _textboxX2.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxX2.text intValue];
        i++;
        _textboxX2.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMenosY1:(UIButton *)sender {
    
    if ([_textboxY1.text isEqualToString:@""]) {
        int i = 0;
        i--;
        _textboxY1.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxY1.text intValue];
        i--;
        _textboxY1.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMasY1:(UIButton *)sender {
    
    if ([_textboxY1.text isEqualToString:@""]) {
        int i = 0;
        i++;
        _textboxY1.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxY1.text intValue];
        i++;
        _textboxY1.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMenosX1:(UIButton *)sender {
    
    if ([_textboxX1.text isEqualToString:@""]) {
        int i = 0;
        i--;
        _textboxX1.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxX1.text intValue];
        i--;
        _textboxX1.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonMasX1:(UIButton *)sender {
    
    if ([_textboxX1.text isEqualToString:@""]) {
        int i = 0;
        i++;
        _textboxX1.text = [NSString stringWithFormat:@"%d", i];
    } else {
        int i = [_textboxX1.text intValue];
        i++;
        _textboxX1.text = [NSString stringWithFormat:@"%d", i];
    }
    
}

- (IBAction)botonBorrar:(UIButton *)sender {
    
    NSArray<UITextField *> *textboxes = @[_textboxX1, _textboxY1, _textboxX2, _textboxY2, _textBoxDia, _textBoxMes, _textBoxAno];
    
    for (UITextField *textbox in textboxes) {
        if ([textbox isFirstResponder]) {
            [self borrar:textbox];
            break;
        }
    }
    
}

- (void)borrar:(UITextField *)textbox {
    
    NSString *textoActual = textbox.text;
    
    if (textoActual.length > 0) {
        NSString *nuevoTexto = [textoActual substringToIndex:textoActual.length - 1];
        textbox.text = nuevoTexto;
    }
    
}

- (IBAction)botonClear:(UIButton *)sender {
    
    _textboxX1.text = [NSString stringWithFormat:@""];
    _textboxY1.text = [NSString stringWithFormat:@""];
    _textboxX2.text = [NSString stringWithFormat:@""];
    _textboxY2.text = [NSString stringWithFormat:@""];
    _textBoxDia.text = [NSString stringWithFormat:@""];
    _textBoxMes.text = [NSString stringWithFormat:@""];
    _textBoxAno.text = [NSString stringWithFormat:@""];
    _textboxR.text = [NSString stringWithFormat:@"######"];
    
}

- (IBAction)botonRomano:(UIButton *)sender {
    
    int x1 = [_textboxX1.text intValue];
    int y1 = [_textboxY1.text intValue];
    int x2 = [_textboxX2.text intValue];
    int y2 = [_textboxY2.text intValue];

    
    NSString *num1 = [self conversorRomano:x1];
    NSString *den1 = [self conversorRomano:y1];
    NSString *num2 = [self conversorRomano:x2];
    NSString *den2 = [self conversorRomano:y2];
    
    if (tipoRomano == 0) {
        _textboxR.text = [NSString stringWithFormat:@"%@ / %@", num1, den1];
        tipoRomano=1;
    } else {
        _textboxR.text = [NSString stringWithFormat:@"%@ / %@", num2, den2];
        tipoRomano=0;
    }
    
}

- (IBAction)botonDiv:(UIButton *)sender {
    
    int x1 = [_textboxX1.text intValue];
    int y1 = [_textboxY1.text intValue];
    int x2 = [_textboxX2.text intValue];
    int y2 = [_textboxY2.text intValue];
    
    struct Racional r1, r2, r3;
    
    r1.num = x1;
    r1.den = y1;
    r2.num = x2;
    r2.den = y2;
    
    r3 = dividir(r1, r2);
    
    double resultado = escribir(r3);
    _textboxR.text = [NSString stringWithFormat:@"%.3f", resultado];
    
}

- (IBAction)botonMulti:(UIButton *)sender {
    
    int x1 = [_textboxX1.text intValue];
    int y1 = [_textboxY1.text intValue];
    int x2 = [_textboxX2.text intValue];
    int y2 = [_textboxY2.text intValue];
    
    struct Racional r1, r2, r3;
    
    r1.num = x1;
    r1.den = y1;
    r2.num = x2;
    r2.den = y2;
    
    r3 = multiplicar(r1, r2);
    
    double resultado = escribir(r3);
    _textboxR.text = [NSString stringWithFormat:@"%.3f", resultado];
    
}

- (IBAction)botonResta:(UIButton *)sender {
    
    int x1 = [_textboxX1.text intValue];
    int y1 = [_textboxY1.text intValue];
    int x2 = [_textboxX2.text intValue];
    int y2 = [_textboxY2.text intValue];
    
    struct Racional r1, r2, r3;
    
    r1.num = x1;
    r1.den = y1;
    r2.num = x2;
    r2.den = y2;
    
    r3 = resta(r1, r2);
    
    double resultado = escribir(r3);
    _textboxR.text = [NSString stringWithFormat:@"%.3f", resultado];
    
}

- (IBAction)botonSuma:(UIButton *)sender {
    
    int x1 = [_textboxX1.text intValue];
    int y1 = [_textboxY1.text intValue];
    int x2 = [_textboxX2.text intValue];
    int y2 = [_textboxY2.text intValue];
    
    struct Racional r1, r2, r3;
    
    r1.num = x1;
    r1.den = y1;
    r2.num = x2;
    r2.den = y2;
    
    r3 = suma(r1, r2);
    
    double resultado = escribir(r3);
    _textboxR.text = [NSString stringWithFormat:@"%.3f", resultado];
    
}

//NUMEROS RACIONALES
struct Racional suma(struct Racional x, struct Racional y)
{
    struct Racional c;
    
    if (y.den == y.num) {
        c.num = x.num + y.num;
        c.den = x.den;
    } else {
        c.num = (x.num * y.den) + (x.den * y.num);
        c.den = x.den * y.den;
    }
    
    return c;

}

struct Racional resta(struct Racional x, struct Racional y)
{
    struct Racional c;
    
    if (y.den == y.num) {
        c.num = x.num - y.num;
        c.den = x.den;
    } else {
        c.num = (x.num * y.den) - (x.den * y.num);
        c.den = x.den * y.den;
    }
    
    return c;

}

struct Racional multiplicar(struct Racional x, struct Racional y)
{
    struct Racional c;
    
    c.num = x.num * y.num;
    c.den = x.den * y.den;
    
    return c;

}

struct Racional dividir(struct Racional x, struct Racional y)
{
    struct Racional c;
    
    c.num = x.num * y.den;
    c.den = x.den * y.num;
    
    return c;

}

double escribir(struct Racional c) {
    double resul = (double)c.num / c.den;
    return resul;
}

//Numero Romano
- (NSString *)conversorRomano:(NSInteger)num {
    NSArray *millares = @[@"", @"M", @"MM", @"MMM"];
    NSArray *centenas = @[@"", @"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM"];
    NSArray *decenas = @[@"", @"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC"];
    NSArray *unidades = @[@"", @"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX"];

    NSInteger M = num / 1000;
    NSInteger C = (num % 1000) / 100;
    NSInteger D = (num % 100) / 10;
    NSInteger U = num % 10;

    NSMutableString *numRomano = [NSMutableString string];
    [numRomano appendString:millares[M]];
    [numRomano appendString:centenas[C]];
    [numRomano appendString:decenas[D]];
    [numRomano appendString:unidades[U]];

    return numRomano;
}

//Botones numericos
- (IBAction)botonNumero:(UIButton *)sender {
    
    NSString *numero = sender.titleLabel.text;
    
    NSArray<UITextField *> *textboxes = @[_textboxX1, _textboxY1, _textboxX2, _textboxY2, _textBoxDia, _textBoxMes, _textBoxAno];
    
    for (UITextField *textbox in textboxes) {
        if ([textbox isFirstResponder]) {
            textbox.text = [textbox.text stringByAppendingString:numero];
            break;
        }
    }
}

- (IBAction)botonConv:(UIButton *)sender {
    double res = [_textboxR.text floatValue];
    
    NSString *fraccion = [self decimalAFraccion:res];
    
    _textboxR.text = [NSString stringWithFormat:@"%@", fraccion];
}

- (NSString *)decimalAFraccion:(double)decimal {
    int sign = (decimal < 0) ? -1 : 1;
    decimal = fabs(decimal);
    double tolerance = 1.0E-6;
    
    double x1 = 1, x2 = 0;
    double y1 = 0, y2 = 1;
    double b = decimal;
    
    do {
        double a = floor(b);
        double aux = x1;
        x1 = a * x1 + x2;
        x2 = aux;
        aux = y1;
        y1 = a * y1 + y2;
        y2 = aux;
        b = 1 / (b - a);
    } while (fabs(decimal - x1 / y1) > decimal * tolerance);
    
    NSString *fraction = [NSString stringWithFormat:@"%d/%d", sign * (int)x1, (int)y1];
    return fraction;
}

- (IBAction)botonFecha:(UIButton *)sender {
    
    int dia = [_textBoxDia.text intValue];
    int mes = [_textBoxMes.text intValue];
    int ano = [_textBoxAno.text intValue];
    
    NSString *dia1 = [self conversorRomano:dia];
    NSString *mes1 = [self conversorRomano:mes];
    NSString *ano1 = [self conversorRomano:ano];
    
    if (tipoFecha == 0) {
        _textboxR.text = [NSString stringWithFormat:@"%@-%@-%@", dia1, mes1, ano1];
        tipoFecha = 1;
    } else {
        _textboxR.text = [NSString stringWithFormat:@"%@-%@-%@", mes1, dia1, ano1];
        tipoFecha = 0;
    }
    
    
}
@end
