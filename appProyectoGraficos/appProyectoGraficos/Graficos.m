//
//  Graficos.m
//  appProyectoGraficos
//
//  Created by Emiliano Cepeda on 29/10/24.
//

#import "Graficos.h"

@interface Graficos () <UITextFieldDelegate>
@end

@implementation Graficos

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Configura los text fields como delegados
    self.textoX1.delegate = self;
    self.textoY1.delegate = self;
    self.textoX2.delegate = self;
    self.textoY2.delegate = self;
    self.textoPC1.delegate = self;
    self.textoPC2.delegate = self;
    self.textoPC3.delegate = self;
    self.textoPC4.delegate = self;
    self.textoGrosor.delegate = self;
}

// Delegate para ocultar el teclado al hacer clic en Return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)drawRect:(CGRect)rect {
    
    _labelAncho.text = [NSString stringWithFormat:@"%@ = %0.2f",_labelAncho.text, rect.size.width];
    _labelAlto.text = [NSString stringWithFormat:@"%@ = %0.2f",_labelAlto.text, rect.size.height];
    
    //Vista
    CGRect vista = [self bounds];
    NSLog(@"Ancho: %f \nAncho: %f",(float)vista.size.width, vista.size.height);
    
    // Drawing code
    switch (tipo) {
        case 0:
            [self dibujarLinea:x1 :y1 :x2 :y2 :grosor];
            break;
        case 1:
            [self dibujarRectangulo:x1 :y1 :x2 :y2 :grosor];
            break;
        case 2:
            [self dibujarCurva1:x1 :y1 :x2 :y2 :pc1 :pc2 :grosor];
            break;
        case 3:
            [self dibujarCurva2:x1 :y1 :x2 :y2 :pc1 :pc2 :pc3 :pc4 :grosor];
            break;
            
        default:
            break;
    }
}

- (IBAction)segControl:(UISegmentedControl *)sender {
    x1 = _textoX1.text.intValue;
    y1 = _textoY1.text.intValue;
    x2 = _textoX2.text.intValue;
    y2 = _textoY2.text.intValue;
    
    pc1 = _textoPC1.text.intValue;
    pc2 = _textoPC2.text.intValue;
    pc3 = _textoPC3.text.intValue;
    pc4 = _textoPC4.text.intValue;
    
    grosor = _textoGrosor.text.floatValue;
    
    NSInteger indice = sender.selectedSegmentIndex;

        switch (indice) {
            case 0:
                //NSLog(@"Linea dibujada");
                tipo = 0;
                break;
            case 1:
                //NSLog(@"Rectangulo dibujado");
                tipo = 1;
                break;
            case 2:
                //NSLog(@"Curva dibujada");
                tipo = 2;
                break;
            case 3:
                //NSLog(@"Curva con 2 PC dibujada");
                tipo = 3;
                break;
            default:
                break;
        }
    
    [self setNeedsDisplay];
    
}

- (void)dibujarLinea:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(float)grosor {
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(canvas, [UIColor blueColor].CGColor);
    
    CGContextSetLineWidth(canvas, grosor);
    
    CGContextMoveToPoint(canvas, x1, y1);
    CGContextAddLineToPoint(canvas, x2, y2);
    
    CGContextStrokePath(canvas);
}

- (void)dibujarRectangulo:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(float)grosor {
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(canvas, [UIColor purpleColor].CGColor);
    
    CGContextSetLineWidth(canvas, grosor);
    
    CGRect rectangulo = CGRectMake(x1, y1, x2, y2);
    
    CGContextAddRect(canvas, rectangulo);
    
    CGContextStrokePath(canvas);
    
}

- (void)dibujarCurva1:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(int)pc1 :(int)pc2 :(float)grosor {
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(canvas, [UIColor orangeColor].CGColor);
    
    CGContextSetLineWidth(canvas, grosor);
    
    CGContextMoveToPoint(canvas, x1, y1);
    
    CGContextAddQuadCurveToPoint(canvas, pc1, pc2, x2, y2);
    CGContextStrokePath(canvas);
    
}

- (void)dibujarCurva2:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(int)pc1 :(int)pc2 :(int)pc3 :(int)pc4 :(float)grosor {
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(canvas, [UIColor redColor].CGColor);
    
    CGContextSetLineWidth(canvas, grosor);
    
    CGContextMoveToPoint(canvas, x1, y1);
    
    CGContextAddCurveToPoint(canvas, pc1, pc2, pc3, pc4, x2, y2);
    CGContextStrokePath(canvas);
    
}

@end
