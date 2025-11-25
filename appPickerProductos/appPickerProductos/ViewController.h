//
//  ViewController.h
//  appPickerProductos
//
//  Created by Emiliano Cepeda on 25/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *labelProd;
@property (weak, nonatomic) IBOutlet UILabel *labelColor;
@property (weak, nonatomic) IBOutlet UILabel *labelPrecio;

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView1;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView2;

@property (strong, nonatomic) NSArray *tipoDeCambioPesos;

@end

