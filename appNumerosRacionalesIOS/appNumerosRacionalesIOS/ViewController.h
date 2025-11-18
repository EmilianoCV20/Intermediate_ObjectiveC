//
//  ViewController.h
//  appNumerosRacionalesIOS
//
//  Created by Emiliano Cepeda on 10/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Textboxes
@property (weak, nonatomic) IBOutlet UITextField *textboxX1;
@property (weak, nonatomic) IBOutlet UITextField *textboxY1;

@property (weak, nonatomic) IBOutlet UITextField *textboxX2;
@property (weak, nonatomic) IBOutlet UITextField *textboxY2;

@property (weak, nonatomic) IBOutlet UILabel *textboxR;

//Botones Stepper
- (IBAction)botonMasX1:(UIButton *)sender;
- (IBAction)botonMenosX1:(UIButton *)sender;

- (IBAction)botonMasY1:(UIButton *)sender;
- (IBAction)botonMenosY1:(UIButton *)sender;

- (IBAction)botonMasX2:(UIButton *)sender;
- (IBAction)botonMenosX2:(UIButton *)sender;

- (IBAction)botonMasY2:(UIButton *)sender;
- (IBAction)botonMenosY2:(UIButton *)sender;

//Botones Funciones
- (IBAction)botonSuma:(UIButton *)sender;
- (IBAction)botonResta:(UIButton *)sender;
- (IBAction)botonMulti:(UIButton *)sender;
- (IBAction)botonDiv:(UIButton *)sender;
- (IBAction)botonRomano:(UIButton *)sender;

- (IBAction)botonClear:(UIButton *)sender;
- (IBAction)botonBorrar:(UIButton *)sender;

//Botones Numeros
- (IBAction)botonNumero:(UIButton *)sender;

//Clase Racional
struct Racional{
    int num, den;
};

//Numeros Romanos
- (NSString *)conversorRomano:(NSInteger)num;

//Convertir a fraccion
- (NSString *)decimalAFraccion:(double)decimal;
- (IBAction)botonConv:(UIButton *)sender;

//Fecha a Romanos
- (IBAction)botonFecha:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textBoxDia;
@property (weak, nonatomic) IBOutlet UITextField *textBoxMes;
@property (weak, nonatomic) IBOutlet UITextField *textBoxAno;



@end

