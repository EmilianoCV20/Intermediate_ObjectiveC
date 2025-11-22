//
//  ViewController.h
//  appConversorDivisas
//
//  Created by Emiliano Cepeda on 21/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textoEntrada;
@property (weak, nonatomic) IBOutlet UILabel *labelResultado;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerDivisasPaises;

@property (strong, nonatomic) NSArray *tipoDeCambio;
@property (strong, nonatomic) NSArray *tipoDeCambioPesos;
@property (strong, nonatomic) NSArray *tipoDeCambioYen;

@end

