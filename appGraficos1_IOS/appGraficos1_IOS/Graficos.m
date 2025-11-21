//
//  Graficos.m
//  appGraficos1_IOS
//
//  Created by Emiliano Cepeda on 25/10/24.
//

#import "Graficos.h"

@implementation Graficos
{
    CGFloat _grosor;
    CGFloat _x1, _y1, _x2, _y2;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    //Rombo
    float width = UIScreen.mainScreen.bounds.size.width;
    float height = UIScreen.mainScreen.bounds.size.height;
    
    CGContextRef canvas = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(canvas, [UIColor blueColor].CGColor);
    //CGContextSetLineWidth(canvas, 5.5);
    CGContextSetLineWidth(canvas, _grosor);
    
     //Rombo
     CGContextMoveToPoint(canvas, width / 2, 0);
     CGContextAddLineToPoint(canvas, width, height / 2);
     CGContextAddLineToPoint(canvas, width/2 , height);
     CGContextAddLineToPoint(canvas, 0 , height/2);
     CGContextAddLineToPoint(canvas, width/2 , 0);
     
     //CGContextStrokePath(canvas);
     
     CGContextSetFillColorWithColor(canvas, [UIColor systemOrangeColor].CGColor);
     CGContextFillPath(canvas);
     
     //Vista
     CGRect vista = [self bounds];
     NSLog(@"Ancho: %f \nAncho: %f",(float)vista.size.width, vista.size.height);
     
     
     //Rectangulo
     CGRect rectangulo = CGRectMake(100, 100, 200, 400);
     CGContextAddRect(canvas, rectangulo);
     CGContextStrokePath(canvas);
     CGContextSetFillColorWithColor(canvas, [UIColor systemPurpleColor].CGColor);
     CGContextFillRect(canvas, rectangulo);
     
     //Curva de Bezier cubica
     CGContextMoveToPoint(canvas, 50, 50);
     CGContextAddCurveToPoint(canvas, 0, 50, 300, 250, 300, 400);
     CGContextStrokePath(canvas);
     
     //Curba de Bezier Cuadratica
     //Propia
     CGContextMoveToPoint(canvas, 0, height);
     CGContextAddLineToPoint(canvas, 100 , height-100);
     CGContextAddCurveToPoint(canvas, 60, height-2 , 280, height-21, 210, height-180);
     CGContextStrokePath(canvas);
     
     //Clase
     CGContextMoveToPoint(canvas, 100, 100);
     CGContextAddQuadCurveToPoint(canvas, vista.size.width/2.0, vista.size.height/2.0, 300, 100);
     CGContextStrokePath(canvas);
    
    //Linea Usuario
    CGContextMoveToPoint(canvas, _x1, _y1);
    CGContextAddLineToPoint(canvas, _x2, _y2);
    
    CGContextStrokePath(canvas);
    
}

- (void)dibujarLineaDesdeX:(CGFloat)x1 y:(CGFloat)y1 hastaX:(CGFloat)x2 y:(CGFloat)y2 grosor:(CGFloat)grosor{
    _x1 = x1;
    _y1 = y1;
    _x2 = x2;
    _y2 = y2;
    _grosor = grosor;
    [self setNeedsDisplay];
}

@end
