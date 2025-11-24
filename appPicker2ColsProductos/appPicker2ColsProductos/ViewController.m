//
//  ViewController.m
//  appPicker2ColsProductos
//
//  Created by Emiliano Cepeda on 22/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *productos;
    NSArray *colores;
    NSArray *ajustar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    productos = @[@"Pantalla LCD", @"iPad",@"Bicicleta",@"Motocicleta",@"Carro",@"Camioneta"];
    
    colores = @[@"Rojo🦞",@"Verde🦎",@"Azul🐟",@"Gris🐺",@"Naranja🦊",@"Aleatorio🌚"];
    
    ajustar = @[@"Original", @"TopLeft",@"TopRight",@"BottomLeft",@"BottomRight",@"Center"];
    
    _pickerView1.delegate = self;
    _pickerView1.dataSource = self;
    
    _label1.text = [NSString stringWithFormat:@"%@, %@",[productos objectAtIndex:0],[colores objectAtIndex:0]];
    
    _imageView1.image = [UIImage imageNamed:@"PantallaLCD"];
    
    UIColor *color = [UIColor colorWithRed:0 green:155 blue:100 alpha:1.0];
    
    self.view.backgroundColor = color;
    
    NSLog(@"%@",_label1.text);
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return productos.count;
    } else if (component == 1){
        return colores.count;
    } else {
        return ajustar.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [productos objectAtIndex:row];
    } else if (component == 1) {
        return colores[row];
    } else {
        return ajustar[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //_label1.text = [NSString stringWithFormat:@"%@, %@",[productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]],[colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
    
    //USAR INDEXADOR
    _label1.text = [NSString stringWithFormat:@"%@, %@", productos[[_pickerView1 selectedRowInComponent:0]], colores[[_pickerView1 selectedRowInComponent:1]]];
    
    unsigned long int color = [colores indexOfObject:[colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
    
    switch (color) {
        case 0:
            self.imageView1.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.imageView1.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            self.imageView1.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            self.imageView1.backgroundColor = [UIColor grayColor];
            break;
        case 4:
            self.imageView1.backgroundColor = [UIColor orangeColor];
            break;
        case 5: //Color random
        {
            CGFloat red = (arc4random() % 256) / 255.0;
            CGFloat green = (arc4random() % 256) / 255.0;
            CGFloat blue = (arc4random() % 256) / 255.0;
            self.imageView1.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
            break;
        }
        default:
            break;
    }
    
    unsigned long int producto = [productos indexOfObject:[productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]]];
    
    switch (producto) {
        case 0:
            self.imageView1.image = [UIImage imageNamed:@"PantallaLCD"];
            break;
        case 1:
            self.imageView1.image = [UIImage imageNamed:@"ipad"];
            break;
        case 2:
            self.imageView1.image = [UIImage imageNamed:@"bici1"];
            break;
        case 3:
            self.imageView1.image = [UIImage imageNamed:@"moto1"];
            break;
        case 4:
            self.imageView1.image = [UIImage imageNamed:@"ferrari1"];
            break;
        case 5:
            self.imageView1.image = [UIImage imageNamed:@"camioneta1"];
            break;
        default:
            break;
    }
    
    unsigned long int ajusta = [ajustar indexOfObject:[ajustar objectAtIndex:[_pickerView1 selectedRowInComponent:2]]];
    
    switch (ajusta) {
        case 0:
            [_imageView1 setContentMode:UIViewContentModeScaleAspectFit];
            break;
        case 1:
            [_imageView1 setContentMode:UIViewContentModeTopLeft];
            break;
        case 2:
            [_imageView1 setContentMode:UIViewContentModeTopRight];
            break;
        case 3:
            [_imageView1 setContentMode:UIViewContentModeBottomLeft];
            break;
        case 4:
            [_imageView1 setContentMode:UIViewContentModeBottomRight];
            break;
        case 5:
            [_imageView1 setContentMode:UIViewContentModeCenter];
            break;
        default:
            break;
    }
    
}

@end
