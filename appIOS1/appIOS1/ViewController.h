//
//  ViewController.h
//  appIOS1
//
//  Created by Emiliano Cepeda on 03/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *texto1;
@property (weak, nonatomic) IBOutlet UILabel *label1;

- (IBAction)botonSaludar:(UIButton *)sender;

- (IBAction)text1MostrarTeclado:(UITextField *)sender;

- (IBAction)botonAMayusculas:(UIButton *)sender;

-(NSMutableString *)aMayusculas2: (NSMutableString *) cadena;

- (IBAction)botonMayus2:(UIButton *)sender;

@end

