//
//  ViewController.m
//  appConversorDivisas
//
//  Created by Emiliano Cepeda on 21/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *pais;
    NSArray *divisasPaisesDolar;
    NSArray *divisasPaisesPeso;
    NSArray *divisasPaisesYen;
    BOOL esDolar;
    BOOL esYen;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pais = @[@"USA🇺🇸", @"Mexico🇲🇽", @"China🇨🇳"];
    
    divisasPaisesDolar = @[@"Australia🇦🇺", @"China🇨🇳",@"Francia🇫🇷",@"Inglaterra🏴󠁧󠁢󠁥󠁮󠁧󠁿",@"Japon🇯🇵",@"Mexico🇲🇽",@"Suiza🇨🇭"];
    
    divisasPaisesPeso = @[@"Australia🇦🇺", @"China🇨🇳",@"Francia🇫🇷",@"Inglaterra🏴󠁧󠁢󠁥󠁮󠁧󠁿",@"Japon🇯🇵",@"USA🇺🇸",@"Suiza🇨🇭"];
    
    divisasPaisesYen = @[@"Australia🇦🇺", @"Mexico🇲🇽",@"Francia🇫🇷",@"Inglaterra🏴󠁧󠁢󠁥󠁮󠁧󠁿",@"Japon🇯🇵",@"USA🇺🇸",@"Suiza🇨🇭"];
    
    _tipoDeCambio = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:1.50], [NSNumber numberWithFloat:7.11],[NSNumber numberWithFloat:0.92],[NSNumber numberWithFloat:0.77],[NSNumber numberWithFloat:150.48],[NSNumber numberWithFloat:20.05],[NSNumber numberWithFloat:0.87],nil];
    
    _tipoDeCambioPesos = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:0.075], [NSNumber numberWithFloat:0.36],[NSNumber numberWithFloat:0.046],[NSNumber numberWithFloat:0.039],[NSNumber numberWithFloat:7.64],[NSNumber numberWithFloat:0.05],[NSNumber numberWithFloat:0.044],nil];
    
    _tipoDeCambioYen = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:0.21], [NSNumber numberWithFloat:2.85],[NSNumber numberWithFloat:0.013],[NSNumber numberWithFloat:0.11],[NSNumber numberWithFloat:21.48],[NSNumber numberWithFloat:0.14],[NSNumber numberWithFloat:0.12],nil];
    
    self.pickerDivisasPaises.dataSource = self;
    self.pickerDivisasPaises.delegate = self;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return  [pais count];
    } else {
        if (esDolar) {
            return  [divisasPaisesDolar count];
        } else if(esYen) {
            return [divisasPaisesYen count];
        } else{
            return  [divisasPaisesPeso count];
        }
        //return  [divisasPaisesDolar count];
    }
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return pais[row];
    } else {
        if (esDolar) {
            return divisasPaisesDolar[row];
        } else if(esYen) {
            return divisasPaisesYen[row];
        } else{
            return divisasPaisesPeso[row];
        }
        
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        esDolar = (row == 0); // USA
        esYen = (row == 2);   // China
        [_pickerDivisasPaises reloadComponent:1];
    } else {
        if (esDolar) {
            float valorMonedaUSD = [[_tipoDeCambio objectAtIndex:row] floatValue];
            float dolares = [_textoEntrada.text floatValue];
            float resultado = dolares * valorMonedaUSD;
            NSString *resulString = [[NSString alloc] initWithFormat:@"%.2f USD = %.2f,  %@", dolares, resultado, [divisasPaisesDolar objectAtIndex:row]];
            _labelResultado.text = resulString;
        } else if (esYen) {
            float valorMonedaYen = [[_tipoDeCambioYen objectAtIndex:row] floatValue];
            float yenes = [_textoEntrada.text floatValue];
            float resultado = yenes * valorMonedaYen;
            NSString *resulString = [[NSString alloc] initWithFormat:@"%.2f Yen = %.2f, %@", yenes, resultado, [divisasPaisesYen objectAtIndex:row]];
            _labelResultado.text = resulString;
        } else {
            float valorMonedapeso = [[_tipoDeCambioPesos objectAtIndex:row] floatValue];
            float pesos = [_textoEntrada.text floatValue];
            float resultado = pesos * valorMonedapeso;
            NSString *resulString = [[NSString alloc] initWithFormat:@"%.2f Pesos = %.2f,  %@", pesos, resultado, [divisasPaisesPeso objectAtIndex:row]];
            _labelResultado.text = resulString;
        }
    }
}



@end
