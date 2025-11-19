//
//  ViewController.m
//  appNSStringIOS
//
//  Created by Emiliano Cepeda on 12/10/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *viewVacia = [[UIView alloc] initWithFrame:CGRectZero];
    _textPalabra.inputView = viewVacia;
    
    _palabrasYPistas = @{
        @"manzana": @"Es una fruta que suele ser roja, verde o amarilla",
        @"perro": @"Es un animal conocido como el mejor amigo del hombre",
        @"avion": @"Es un medio de transporte que vuela",
        @"computadora": @"Es la máquina que usas para programar",
        @"gato": @"Es un animal que maulla y araña",
        @"sandia": @"Es una fruta grande y verde, por dentro roja",
        @"reloj": @"Es un objeto que te dice la hora",
        @"araña": @"Es un insecto de 8 patas que teje",
        @"brocoli": @"Es una verdura verde que parece un arbol",
        @"libro": @"Es un objeto que pueder leer y aprender"
    };
    
    _puntuacion = 0;
    _intentos = 3;
    _ayuda = 0;

    
    [self actualizarUI];
    
    [self palabraAleatoria];
}

- (void)actualizarUI {
    _textPuntuacion.text = [NSString stringWithFormat:@"%ld", (long)_puntuacion];
    _textIntentos.text = [NSString stringWithFormat:@"%ld/3", (long)_intentos];
}

- (void)palabraAleatoria {
    
    NSArray *palabras = [_palabrasYPistas allKeys];
    NSUInteger randomIndex = arc4random_uniform((u_int32_t)[palabras count]);
    _palabraActual = palabras[randomIndex];
    
    _textPista.text = _palabrasYPistas[_palabraActual];
}

- (IBAction)botonAceptar:(UIButton *)sender {
    
    NSString *respuesta = _textPalabra.text;
    
    if ([respuesta isEqualToString:_palabraActual]) {
        _puntuacion++;
        _intentos = 3;
        [self palabraAleatoria];
    } else {
        _intentos--;
        if (_intentos == 0) {
            _intentos = 3;
            [self palabraAleatoria];
        }
    }
    
    [self actualizarUI];
    _textPalabra.text = @"";
    
}

- (IBAction)botonClean:(UIButton *)sender {
    
    _textPalabra.text = @"";
    
}

- (IBAction)botonBorrar:(UIButton *)sender {
    
    NSString *textoActual = _textPalabra.text;
    
    if (textoActual.length > 0) {
        NSString *nuevoTexto = [textoActual substringToIndex:textoActual.length - 1];
        _textPalabra.text = nuevoTexto;
    }
    
}

- (IBAction)botonLetra:(UIButton *)sender {
    
    NSString *letra = [sender.titleLabel.text lowercaseString];
    
    _textPalabra.text = [_textPalabra.text stringByAppendingString:letra];
    
}

//Boton de ayuda
- (IBAction)botonAyuda:(UIButton *)sender {
    // Primera pantalla: Confirmación de ayuda
    UIAlertController *alertConfirmacion = [UIAlertController alertControllerWithTitle:@"Ayuda"
                                                                               message:@"¿Quieres recibir una pista extra?. Te costara un intento"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Sí" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self->_intentos--;
        [self actualizarUI];
        
        if (self->_intentos == 0) {
            
            self->_intentos = 3;
            [self palabraAleatoria];
            [self actualizarUI];
            [self UltimoIntento];
            
        }
        else if (self->_ayuda == 1 && self->_intentos > 0) {
            
            [self mostrarConsonantes];
            
        }
        else {
            
            [self mostrarVocales];
            
        }
        
    }];
    
    [alertConfirmacion addAction:cancelAction];
    [alertConfirmacion addAction:okAction];
    
    [self presentViewController:alertConfirmacion animated:YES completion:nil];
}

//RegEx de Vocales
- (void)mostrarVocales {
    // Expresión regular para obtener las vocales
    NSString *pattern = @"[aeiou]";
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    if (error) {
        NSLog(@"Error creando la expresión regular: %@", error.localizedDescription);
        return;
    }
    
    // Palabra actual para adivinar
    NSString *palabra = _palabraActual;
    NSMutableString *vocalesEncontradas = [NSMutableString string];
    
    NSArray *matches = [regex matchesInString:palabra options:0 range:NSMakeRange(0, palabra.length)];
    
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        NSString *vocal = [palabra substringWithRange:matchRange];
        [vocalesEncontradas appendString:vocal];
    }
    
    // Segunda pantalla: Mostrar vocales
    NSString *mensaje = vocalesEncontradas.length > 0 ? [NSString stringWithFormat:@"Las vocales en la palabra son: %@", vocalesEncontradas] : @"No se enconraron vocales (Sinceramente nunca se vera esta pantalla..a menos de un error)";
    
    UIAlertController *alertVocales = [UIAlertController alertControllerWithTitle:@"Ayuda de Vocales"
                                                                          message:mensaje
                                                                   preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"¡Entendido!" style:UIAlertActionStyleDefault handler:nil];
    
    [alertVocales addAction:okAction];
    
    [self presentViewController:alertVocales animated:YES completion:nil];
    _ayuda++;
}

//RegEx de Consonántes
- (void)mostrarConsonantes {
    // Expresión regular para obtener las consonantes
    NSString *pattern = @"[bcdfghjklmnñpqrstvwxyz]";
    NSError *error = nil;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    if (error) {
        NSLog(@"Error creando la expresión regular: %@", error.localizedDescription);
        return;
    }
    
    // Palabra actual para adivinar
    NSString *palabra = _palabraActual;
    
    // Buscar coincidencias de consonantes
    NSArray *matches = [regex matchesInString:palabra options:0 range:NSMakeRange(0, palabra.length)];
    
    // Contar el número de consonantes
    NSUInteger numeroDeConsonantes = matches.count;
    
    // Mostrar el número de consonantes
    NSString *mensaje = [NSString stringWithFormat:@"El número de consonantes en la palabra es: %lu", (unsigned long)numeroDeConsonantes];
    
    UIAlertController *alertConsonantes = [UIAlertController alertControllerWithTitle:@"Ayuda de Consonantes"
                                                                              message:mensaje
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"¡Entendido!" style:UIAlertActionStyleDefault handler:nil];
    
    [alertConsonantes addAction:okAction];
    
    [self presentViewController:alertConsonantes animated:YES completion:nil];
    _ayuda--;
}


- (void)UltimoIntento {
    UIAlertController *alertIntento = [UIAlertController alertControllerWithTitle:@"Sin Intentos"
                                                                               message:@"Usaste tu ultimo intento! \nNo hay pista :("
                                                                        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"¡Oh No!" style:UIAlertActionStyleDefault handler:nil];
    
    [alertIntento addAction:okAction];
    
    [self presentViewController:alertIntento animated:YES completion:nil];
}

@end
