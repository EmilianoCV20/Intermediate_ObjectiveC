//
//  ViewController.h
//  appNSStringIOS
//
//  Created by Emiliano Cepeda on 12/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//Labels
@property (weak, nonatomic) IBOutlet UILabel *textPuntuacion;
@property (weak, nonatomic) IBOutlet UILabel *textPista;
@property (weak, nonatomic) IBOutlet UILabel *textIntentos;

//Caja de texto
@property (weak, nonatomic) IBOutlet UITextField *textPalabra;

//Boton de checar palabra
- (IBAction)botonAceptar:(UIButton *)sender;

//Diccionario de palabras
@property (nonatomic, strong) NSDictionary *palabrasYPistas;
@property (weak, nonatomic) NSString *palabraActual;

//Conteo de puntuacion e intentos
@property (nonatomic) NSInteger puntuacion;
@property (nonatomic) NSInteger intentos;

//Botones de teclado
- (IBAction)botonLetra:(UIButton *)sender;
- (IBAction)botonBorrar:(UIButton *)sender;
- (IBAction)botonClean:(UIButton *)sender;

//Boton Ayuda
- (IBAction)botonAyuda:(UIButton *)sender;
- (void)mostrarVocales;

@property (nonatomic) NSInteger ayuda;

@end

