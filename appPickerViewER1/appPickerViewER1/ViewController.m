//
//  ViewController.m
//  appPickerViewER1
//
//  Created by Emiliano Cepeda on 17/10/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *expRegulares;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    expRegulares = @[@"^[a-fA-F0-9]+$", @"^[0-1]+$", @"^[0-7]+$", @"[0-9]+$", @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"];
    
    
    self.pickerViewER1.dataSource = self;
    self.pickerViewER1.delegate = self;
    
    
}
//Columnas
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}
//Componentes
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return expRegulares.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return expRegulares[row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *palabra = _textoEntrada.text; //*expRegularValidar
    
    //NSString *ExpRegular = [NSString stringWithFormat:@"%@",[expRegulares objectAtIndex:[_pickerViewER1 selectedRowInComponent:0]]];
    
    NSError *error = NULL;
    
    //Patron o Exp.Reg
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: expRegulares[row] options: 0 error:&error];
    
    NSArray *matches = [regex matchesInString:palabra options:0 range:NSMakeRange(0, palabra.length)];
    
    //NSArray *match = [regex firstMatchInString:_textoEntrada.text options:0 range:NSMakeRange(0, [expRegularValidar])];
    
    /*
    if ([matches count] > 0)
    {
        _labelSalida.text = @"Valido";
    }
    else
    {
        _labelSalida.text = @"Invalido";
    }
     */
    
    
    
    
    if (matches)
    {
        _labelSalida.text = @"Numero Valido";
        NSLog(@"%@: NUMERO VALIDO", _textoEntrada.text);
    }
    else
    {
        _labelSalida.text = @"Numero Invalido";
     NSLog(@"%@: NUMERO INVALIDO", _textoEntrada.text);
    }
    
}


@end
