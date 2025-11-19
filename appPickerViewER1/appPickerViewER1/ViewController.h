//
//  ViewController.h
//  appPickerViewER1
//
//  Created by Emiliano Cepeda on 17/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textoEntrada;
@property (weak, nonatomic) IBOutlet UILabel *labelSalida;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewER1;

@end

