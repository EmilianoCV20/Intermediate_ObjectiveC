//
//  ViewController.m
//  appPickerProductos
//
//  Created by Emiliano Cepeda on 25/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    float Total;
    NSArray *productos;
    NSArray *colores;
    NSArray *ajustar;
    NSArray *divisas;
    NSArray *precios;
    NSArray *iva;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView1.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    self.pickerView2.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Mario.jpg"]];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Mario.jpg"]];
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.frame = self.view.bounds;
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:backgroundImageView];
    [self.view sendSubviewToBack:backgroundImageView];

    
    //
    Total = 0;
    
    productos = @[@"XboxSerieX", @"SwitchOLED",@"Playstation5",@"SillaGamer",@"PantallaOLED",@"Funkos",@"Teclados",@"Audifonos",@"MousePad",@"Posters"];
    
    colores = @[@"Rojo",@"Verde",@"Azul",@"Naranja",@"Amarillo",@"Negro",@"Blanco",@"Gris",@"Azar"];
    
    ajustar = @[@"Original", @"TopIzq",@"TopDer",@"FondoIzq",@"FondoDer",@"Centro"];
    
    divisas = @[@"Pesos", @"Chileno",@"Euro",@"Libra",@"Dolar",@"Franco"];
    
    precios = @[@12499, @8999, @14999, @5999, @4999, @299, @1199, @859, @499, @99];
    
    iva = @[@"Sin Iva", @"Incluido"];
    
    _tipoDeCambioPesos = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:47.49],[NSNumber numberWithFloat:0.046],[NSNumber numberWithFloat:0.039],[NSNumber numberWithFloat:0.05],[NSNumber numberWithFloat:0.043],nil];
    
    _pickerView1.delegate = self;
    _pickerView1.dataSource = self;
    
    _pickerView2.delegate = self;
    _pickerView2.dataSource = self;
    
    _labelProd.text = [NSString stringWithFormat:@"%@",[productos objectAtIndex:0]];
    
    _labelColor.text = @" ";
    self.labelColor.backgroundColor = [UIColor redColor];
    
    _labelPrecio.text = [NSString stringWithFormat:@"%@",[precios objectAtIndex:0]];
    
    _imageView1.image = [UIImage imageNamed:@"PantallaLCD"];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (pickerView == _pickerView1) {
        return 3;
    } else {
        return 2;
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == _pickerView1) {
        if (component == 0) {
            return productos.count;
        } else if (component == 1) {
            return colores.count;
        } else {
            return ajustar.count;
        }
    } else if (pickerView == _pickerView2) {
        if (component == 0) {
            return divisas.count;
        } else {
            return iva.count;
        }
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == _pickerView1) {
        if (component == 0) {
            return productos[row];
        } else if (component == 1) {
            return colores[row];
        } else {
            return ajustar[row];
        }
    } else if (pickerView == _pickerView2) {
        if (component == 0) {
            return divisas[row];
        } else {
            return iva[row];
        }
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == _pickerView1) {
        
        //USAR INDEXADOR
        //_labelColor.text = [NSString stringWithFormat:@"%@", colores[[_pickerView1 selectedRowInComponent:1]]];
        
        unsigned long int color = [colores indexOfObject:[colores objectAtIndex:[_pickerView1 selectedRowInComponent:1]]];
        
        switch (color) {
            case 0:
                self.labelColor.backgroundColor = [UIColor redColor];
                break;
            case 1:
                self.labelColor.backgroundColor = [UIColor greenColor];
                break;
            case 2:
                self.labelColor.backgroundColor = [UIColor blueColor];
                break;
            case 3:
                self.labelColor.backgroundColor = [UIColor orangeColor];
                break;
            case 4:
                self.labelColor.backgroundColor = [UIColor yellowColor];
                break;
            case 5:
                self.labelColor.backgroundColor = [UIColor blackColor];
                break;
            case 6:
                self.labelColor.backgroundColor = [UIColor whiteColor];
                break;
            case 7:
                self.labelColor.backgroundColor = [UIColor grayColor];
                break;
            case 8: //Color random
            {
                CGFloat red = (arc4random() % 256) / 255.0;
                CGFloat green = (arc4random() % 256) / 255.0;
                CGFloat blue = (arc4random() % 256) / 255.0;
                self.labelColor.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
                break;
            }
            default:
                break;
        }
        
        _labelProd.text = [NSString stringWithFormat:@"%@", productos[[_pickerView1 selectedRowInComponent:0]]];
        
        unsigned long int producto = [productos indexOfObject:[productos objectAtIndex:[_pickerView1 selectedRowInComponent:0]]];
        
        switch (producto) {
            case 0:
                self.imageView1.image = [UIImage imageNamed:@"XboxSerieX"];
                break;
            case 1:
                self.imageView1.image = [UIImage imageNamed:@"SwitchOLED"];
                break;
            case 2:
                self.imageView1.image = [UIImage imageNamed:@"Playstation5"];
                break;
            case 3:
                self.imageView1.image = [UIImage imageNamed:@"SillaGamer"];
                break;
            case 4:
                self.imageView1.image = [UIImage imageNamed:@"PantallaOLED"];
                break;
            case 5:
                self.imageView1.image = [UIImage imageNamed:@"Funkos"];
                break;
            case 6:
                self.imageView1.image = [UIImage imageNamed:@"Teclados"];
                break;
            case 7:
                self.imageView1.image = [UIImage imageNamed:@"Audifonos"];
                break;
            case 8:
                self.imageView1.image = [UIImage imageNamed:@"MousePad"];
                break;
            case 9:
                self.imageView1.image = [UIImage imageNamed:@"Posters"];
                break;
            default:
                break;
        }
        
        // Obtener el precio del producto en pesos
        float precioProducto = [precios[producto] floatValue];
        
        // Obtener la divisa y el IVA seleccionados actualmente en pickerView2
        NSUInteger selectedCurrencyIndex = [_pickerView2 selectedRowInComponent:0];
        NSUInteger selectedIVAIndex = [_pickerView2 selectedRowInComponent:1];
        
        // Obtener tipo de cambio seleccionada
        float tipoDeCambio = [_tipoDeCambioPesos[selectedCurrencyIndex] floatValue];
        float precioConvertido = precioProducto * tipoDeCambio;
        
        // Verificar si se debe agregar IVA
        NSString *ivaSeleccionado = iva[selectedIVAIndex];
        if ([ivaSeleccionado isEqualToString:@"Incluido"]) {
            precioConvertido *= 1.16; // Suponiendo un IVA del 16%
        }
        
        // Actualizar el label con el precio convertido, divisa y IVA
        _labelPrecio.text = [NSString stringWithFormat:@"%.2f", precioConvertido];
        
        
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
    else if (pickerView == _pickerView2) {
        NSUInteger selectedProductIndex = [_pickerView1 selectedRowInComponent:0];
        float precioProducto = [precios[selectedProductIndex] floatValue];
        
        NSUInteger selectedCurrencyIndex = [_pickerView2 selectedRowInComponent:0];
        float tipoDeCambio = [_tipoDeCambioPesos[selectedCurrencyIndex] floatValue];
        
        float precioConvertido = precioProducto * tipoDeCambio;
        
        NSUInteger selectedIVAIndex = [_pickerView2 selectedRowInComponent:1];
        NSString *ivaSeleccionado = iva[selectedIVAIndex];
        
        if ([ivaSeleccionado isEqualToString:@"Incluido"]) {
            precioConvertido *= 1.16; // Suponiendo un IVA del 16%
        }
        
        _labelPrecio.text = [NSString stringWithFormat:@"%.2f", precioConvertido];
        [self pickerView:_pickerView1 didSelectRow:[_pickerView1 selectedRowInComponent:0] inComponent:0];
    }
}


@end
