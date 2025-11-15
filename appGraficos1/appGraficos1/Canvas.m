//
//  Canvas.m
//  appGraficos1
//
//  Created by Emiliano Cepeda on 27/09/24.
//

#import "Canvas.h"

@implementation Canvas

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    NSRect rectangulo = [self bounds];
    //[[NSColor blueColor] set];
    
    [[NSColor colorWithDeviceRed:0.2f green:0.75f blue:0.75f alpha:1.0f]set];
    
    [NSBezierPath fillRect:rectangulo];
    
    /*
     [[NSColor orangeColor] set];
     srandom((unsigned)time(NULL));
     NSBezierPath *path = [[NSBezierPath alloc]init];
     [path setLineWidth:3.0];
     NSPoint p = [self randomPoint];
     [path moveToPoint:p];
     for (int i = 0; i < 15; i++) {
     p = [self randomPoint];
     [path lineToPoint:p];
     }
     
     [path stroke];
     [path fill];
     */
    
    //[self dibujarGradienteRadial1];
    [self star];
    //[self dibujaLinea];
    //[self dibujaPoligono];
    //[self dibujarGradienteRadial1];
    //[self dibujarGradienteRadial2];
    //[self dibujarCurvaBezier1];
    [self dibujarCurvaBezier2];
    [self dibujarCurvaBezierINV];
    [self dibujoPropio];
}

- (void)star {
    [[NSColor greenColor] set];
    
    NSRect r = [self bounds];
    CGFloat width = r.size.width;
    CGFloat height = r.size.height;
    
    NSPoint center = NSMakePoint(width / 2, height / 2);
    
    CGFloat radius = MIN(width, height) / 2;
    
    NSBezierPath *starPath = [NSBezierPath bezierPath];
    [starPath setLineWidth:5.0];
    
    CGFloat angle = M_PI_2;
    for (int i = 0; i < 5; i++) {
        CGFloat x = center.x + radius * cos(angle);
        CGFloat y = center.y + radius * sin(angle);
        
        if (i == 0) {
            [starPath moveToPoint:NSMakePoint(x, y)];
        } else {
            [starPath lineToPoint:NSMakePoint(x, y)];
        }
        
        angle += 4 * M_PI / 5;
    }
    
    [starPath closePath];
    [starPath stroke];
    [starPath fill];
}

- (NSPoint)randomPoint {
    NSPoint resultado;
    NSRect r = [self bounds];
    //Cambiar por arc4random
    resultado.x = r.origin.x + random() % (int)r.size.width;
    resultado.y = r.origin.y + random() % (int)r.size.height;
    return resultado;
}

- (void)dibujaPoligono {
    
    [[NSColor whiteColor]set];
    
    NSBezierPath *path = [[NSBezierPath alloc]init];
    [path setLineWidth:3.0];
    
    /*
     NSPoint punto;
     punto.x=5;
     punto.y=5;
     [path moveToPoint:punto];
     punto.x=100;
     punto.y=5;
     [path lineToPoint:punto];
     punto.x=5;
     punto.y=100;
     [path lineToPoint:punto];
     punto.x=5;
     punto.y=5;
     [path lineToPoint:punto];
     [path stroke];
     [path fill];
     */
    
    [[NSColor orangeColor]set];
    int fig[4][3] = {{5,5},{100,5},{5,100},{5,5}};
    
    NSPoint punto;
    punto.x=fig[0][0];
    punto.y=fig[0][1];
    
    [path moveToPoint:punto];
    for (int i =1; i < 4; i++) {
        punto.x = fig[i][0];
        punto.y = fig[i][1];
        [path lineToPoint:punto];
        
    }
    [path stroke];
    [path fill];
    
}

- (void)dibujaLinea {
    [[NSColor orangeColor]set];
    [NSBezierPath setDefaultLineCapStyle:NSLineCapStyleButt];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:5.0];
    [path moveToPoint:NSMakePoint(250.0, 0.0)];
    [path lineToPoint:NSMakePoint(250.0, 500.0)];
    [path setLineCapStyle:NSLineCapStyleButt];
    
    [path stroke];
}

- (void)dibujarGradienteRadial1 {
    
    NSRect bounds = [self bounds];
    NSGradient *gradiente = [[NSGradient alloc]initWithStartingColor:[NSColor yellowColor] endingColor:[NSColor blueColor]];
    
    NSPoint centerPoint = NSMakePoint(NSMidX(bounds), NSMidY(bounds));
    
    NSPoint otherPoint = NSMakePoint(centerPoint.x + 60.0, centerPoint.y + 60.0);
    
    
    CGFloat firstRadius = MIN((bounds.size.width/2.0), (bounds.size.height/2.0)-2.0);
    
    [gradiente drawFromCenter:centerPoint radius:firstRadius toCenter:otherPoint radius:2 options:1];
    
    [self dibujaPoligono];
}

- (void)dibujarGradienteRadial2 {
    
    NSRect borde = [self bounds];
    NSGradient *gradiente = [[NSGradient alloc]initWithStartingColor:[NSColor yellowColor] endingColor:[NSColor redColor]];
    
    NSPoint puntoCentro = NSMakePoint(NSMidX(borde), NSMidY(borde));
    
    NSPoint punto2 = NSMakePoint(puntoCentro.x + 60.0, puntoCentro.y + 60.0);
    
    
    CGFloat radio = MIN((borde.size.width/10.0)-2.0, (borde.size.height/2.0)-2.0);
    
    [gradiente drawFromCenter:puntoCentro radius:radio toCenter:punto2 radius:20 options:0];
    
}

- (void)dibujarCurvaBezier1 {
    
    [[NSColor orangeColor]set];
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:5.0];
    [path moveToPoint:NSMakePoint(0.0, 0.0)];
    [path lineToPoint:NSMakePoint(100.0, 100.0)];
    [path curveToPoint:NSMakePoint(180.0, 220.0) controlPoint1:NSMakePoint(60.0, 20.0) controlPoint2:NSMakePoint(280.0, 100.0)];
    
    [path appendBezierPathWithRect:NSMakeRect(20.0, 160.0, 80.0, 50.0)];
    
    [path setLineCapStyle:NSLineCapStyleRound];
    
    [path stroke];
    
}

- (void)dibujarCurvaBezier2 {
    
    [[NSColor whiteColor]set];
    NSPoint p1 = NSMakePoint(100.0, 100.0);
    NSPoint p2 = NSMakePoint(200.0, 300.0);
    NSPoint p3 = NSMakePoint(300, 100);
    
    //Puntos de control
    NSPoint c1 = NSMakePoint(200, 200);
    NSPoint c2 = NSMakePoint(200, 0);
    
    NSBezierPath *curvabezier = [NSBezierPath bezierPath];
    
    [curvabezier moveToPoint:p1];
    [curvabezier lineToPoint:p2];
    [curvabezier lineToPoint:p3];
    [curvabezier curveToPoint:p1 controlPoint1:c1 controlPoint2:c2];
    [curvabezier closePath];
    [curvabezier fill];
    [curvabezier stroke];
}

- (void)dibujarCurvaBezierINV {
    
    [[NSColor blackColor] set];
    //Triangulo Invertido ENCIMA
    
    // Puntos del triángulo invertido
    NSPoint p1 = NSMakePoint(100.0, 500.0);
    NSPoint p2 = NSMakePoint(200.0, 300.0);
    NSPoint p3 = NSMakePoint(300.0, 500.0);
    
    // Puntos de control para la curva
    NSPoint c1 = NSMakePoint(200.0, 600.0);
    NSPoint c2 = NSMakePoint(200.0, 400.0);
    
    /*
     // Puntos del triángulo invertido
     NSPoint p1 = NSMakePoint(100.0, 300.0);
     NSPoint p2 = NSMakePoint(200.0, 100.0);
     NSPoint p3 = NSMakePoint(300.0, 300.0);
     
     // Puntos de control para la curva
     NSPoint c1 = NSMakePoint(200.0, 400.0);
     NSPoint c2 = NSMakePoint(200.0, 200.0);
     */
    NSBezierPath *curvabezier = [NSBezierPath bezierPath];
    
    [curvabezier moveToPoint:p1];
    [curvabezier lineToPoint:p2];
    [curvabezier lineToPoint:p3];
    [curvabezier curveToPoint:p1 controlPoint1:c1 controlPoint2:c2];
    [curvabezier closePath];
    [curvabezier fill];
    [curvabezier stroke];
    
}

- (void)dibujoPropio {
    
    NSBezierPath *cuello1 = [NSBezierPath bezierPath];
    [cuello1 appendBezierPathWithRect:NSMakeRect(180, 120, 40, 25)];
    
    [[NSColor lightGrayColor]setFill];
    [cuello1 fill];
    [[NSColor blackColor] setStroke];
    [cuello1 setLineWidth:1.0];
    [cuello1 stroke];
    
    
    NSBezierPath *cuello2 = [NSBezierPath bezierPath];
    [cuello2 appendBezierPathWithRect:NSMakeRect(165, 105, 70, 30)];
    
    //[[NSColor colorWithDeviceRed:0.2f green:0.75f blue:0.75f alpha:1.0f] setFill];
    [[NSColor cyanColor]setFill];
    [cuello2 fill];
    [[NSColor blackColor] setStroke];
    [cuello2 setLineWidth:2.0];
    [cuello2 stroke];
    
    //CARA
    NSBezierPath *headpath = [NSBezierPath bezierPath];
    NSPoint centerH = NSMakePoint(200, 200);
    CGFloat radiusH = 60;
    [headpath appendBezierPathWithArcWithCenter:centerH radius:radiusH startAngle:0 endAngle:360];
    
    //[headpath lineToPoint:NSMakePoint(centerH.x - radiusH, centerH.y)];
    [headpath closePath];
    
    [[NSColor lightGrayColor]setFill];
    [headpath fill];
    [[NSColor blackColor] setStroke];
    [headpath setLineWidth:2.0];
    [headpath stroke];
    
    //OJOS
    NSBezierPath *pathojos = [NSBezierPath bezierPath];
    
    [pathojos appendBezierPathWithRect:NSMakeRect(160, 195, 35, 20)];
    [pathojos appendBezierPathWithRect:NSMakeRect(205, 195, 35, 20)];
    
    [pathojos appendBezierPathWithRect:NSMakeRect(170, 195, 15, 20)];
    [pathojos appendBezierPathWithRect:NSMakeRect(215, 195, 15, 20)];
    
    [[NSColor yellowColor] setFill];
    [pathojos fill];
    [[NSColor blackColor] setStroke];
    [pathojos setLineWidth:2.0];
    [pathojos stroke];
    
    //Detalles cara
    NSPoint p1 = NSMakePoint(200, 190);
    NSPoint p2 = NSMakePoint(205, 182.5);
    NSPoint p3 = NSMakePoint(200, 175);
    
    NSPoint p4 = NSMakePoint(160, 195);
    NSPoint p5 = NSMakePoint(160, 154);
    
    NSPoint p6 = NSMakePoint(240, 195);
    NSPoint p7 = NSMakePoint(240, 154);
    
    NSPoint p8 = NSMakePoint(185, 144);
    NSPoint p9 = NSMakePoint(185, 160);
    NSPoint p10 = NSMakePoint(215, 160);
    NSPoint p11 = NSMakePoint(215, 144);
    
    NSBezierPath *detallecara = [NSBezierPath bezierPath];
    
    [detallecara moveToPoint:p1];
    [detallecara lineToPoint:p2];
    [detallecara lineToPoint:p3];
    
    [detallecara moveToPoint:p4];
    [detallecara lineToPoint:p5];
    
    [detallecara moveToPoint:p6];
    [detallecara lineToPoint:p7];
    
    [detallecara moveToPoint:p8];
    [detallecara lineToPoint:p9];
    [detallecara lineToPoint:p10];
    [detallecara lineToPoint:p11];
    
    [detallecara setLineCapStyle:NSLineCapStyleRound];
    [[NSColor blackColor] setStroke];
    [detallecara setLineWidth:1.0];
    [detallecara stroke];
    
    //CABELLO
    [[NSColor whiteColor]set];
    
    //Flequillo IZQ
    NSPoint FIp1 = NSMakePoint(150, 250);
    NSPoint FIp2 = NSMakePoint(150, 110);
    NSPoint FIc1 = NSMakePoint(120, 200);
    NSPoint FIc2 = NSMakePoint(120, 180);
    
    NSBezierPath *flecoizq = [NSBezierPath bezierPath];
    [flecoizq moveToPoint:FIp1];
    [flecoizq lineToPoint:FIp2];
    [flecoizq curveToPoint:FIp1 controlPoint1:FIc2 controlPoint2:FIc1];
    
    [flecoizq closePath];
    [flecoizq fill];
    
    [flecoizq setLineCapStyle:NSLineCapStyleRound];
    [[NSColor blackColor] setStroke];
    [flecoizq setLineWidth:3.0];
    [flecoizq stroke];
    
    //Flequillo DER
    // Flequillo DER (reflejado)
    NSPoint FDp1 = NSMakePoint(250, 250);
    NSPoint FDp2 = NSMakePoint(250, 110);
    NSPoint FDc1 = NSMakePoint(280, 200);
    NSPoint FDc2 = NSMakePoint(280, 180);
    
    NSBezierPath *flecoder = [NSBezierPath bezierPath];
    [flecoder moveToPoint:FDp1];
    [flecoder lineToPoint:FDp2];
    [flecoder curveToPoint:FDp1 controlPoint1:FDc2 controlPoint2:FDc1];
    
    [flecoder closePath];
    [flecoder fill];
    
    [flecoder setLineCapStyle:NSLineCapStyleRound];
    [[NSColor blackColor] setStroke];
    [flecoder setLineWidth:3.0];
    [flecoder stroke];
    
    //OREJAS
    // Definición de los puntos
    NSPoint P1 = NSMakePoint(140, 320);
    NSPoint P2 = NSMakePoint(180, 270);
    NSPoint P3 = NSMakePoint(140, 240);
    
    NSPoint P4 = NSMakePoint(145, 300);
    NSPoint P5 = NSMakePoint(170, 270);
    NSPoint P6 = NSMakePoint(145, 250);
    
    NSPoint P7 = NSMakePoint(255, 320);
    NSPoint P8 = NSMakePoint(215, 270);
    NSPoint P9 = NSMakePoint(255, 240);
    
    NSPoint P10 = NSMakePoint(250, 300);
    NSPoint P11 = NSMakePoint(225, 270);
    NSPoint P12 = NSMakePoint(250, 250);
    
    NSBezierPath *orejaIzq = [NSBezierPath bezierPath];
    
    //Oreja izq
    [orejaIzq moveToPoint:P1];
    [orejaIzq lineToPoint:P2];
    [orejaIzq lineToPoint:P3];
    [orejaIzq closePath];
    
    CGFloat red = 42.0 / 255.0;
    CGFloat green = 92.0 / 255.0;
    CGFloat blue = 101.0 / 255.0;
    CGFloat alpha = 255.0 / 255.0;
    NSColor *miColor = [NSColor colorWithRed:red green:green blue:blue alpha:alpha];
    [miColor setFill];
    [orejaIzq fill];
    
    [[NSColor blackColor] setStroke];
    [orejaIzq setLineWidth:3.0];
    [orejaIzq stroke];
    
    //Detalle
    NSBezierPath *orejaIzqD = [NSBezierPath bezierPath];
    
    [orejaIzqD moveToPoint:P4];
    [orejaIzqD lineToPoint:P5];
    [orejaIzqD lineToPoint:P6];
    [orejaIzqD closePath];
    
    
    [[NSColor yellowColor] setFill];
    [orejaIzqD fill];
    
    [[NSColor blackColor] setStroke];
    [orejaIzqD setLineWidth:2.0];
    [orejaIzqD stroke];
    
    //OREJA DER
    NSBezierPath *orejaDer = [NSBezierPath bezierPath];
    
    [orejaDer moveToPoint:P7];
    [orejaDer lineToPoint:P8];
    [orejaDer lineToPoint:P9];
    [orejaDer closePath];
    
    [miColor setFill];
    [orejaDer fill];
    
    [[NSColor blackColor] setStroke];
    [orejaDer setLineWidth:3.0];
    [orejaDer stroke];
    
    //Detalle
    NSBezierPath *orejaDerD = [NSBezierPath bezierPath];
    
    [orejaDerD moveToPoint:P10];
    [orejaDerD lineToPoint:P11];
    [orejaDerD lineToPoint:P12];
    [orejaDerD closePath];
    
    
    [[NSColor yellowColor] setFill];
    [orejaDerD fill];
    
    [[NSColor blackColor] setStroke];
    [orejaDerD setLineWidth:2.0];
    [orejaDerD stroke];
    
    //Fleco
    [[NSColor whiteColor] set];
    NSBezierPath *fleco = [NSBezierPath bezierPath];
    NSPoint center = NSMakePoint(200, 210);
    CGFloat radius = 70;
    [fleco appendBezierPathWithArcWithCenter:center radius:radius startAngle:0 endAngle:180];
    
    [fleco lineToPoint:NSMakePoint(center.x - radius, center.y)];
    [fleco closePath];
    
    [fleco fill];
    [[NSColor blackColor] setStroke];
    [fleco setLineWidth:3.0];
    [fleco stroke];
    
    //Detalles fleco
    NSBezierPath *detallefleco = [NSBezierPath bezierPath];
    [detallefleco appendBezierPathWithRect:NSMakeRect(190, 235, 5, 25)];
    [detallefleco appendBezierPathWithRect:NSMakeRect(190, 220, 5, 5)];
    
    [detallefleco appendBezierPathWithRect:NSMakeRect(175, 235, 5, 25)];
    [detallefleco appendBezierPathWithRect:NSMakeRect(175, 220, 5, 5)];
    
    [detallefleco appendBezierPathWithRect:NSMakeRect(205, 235, 5, 25)];
    [detallefleco appendBezierPathWithRect:NSMakeRect(205, 220, 5, 5)];
    
    [detallefleco appendBezierPathWithRect:NSMakeRect(220, 235, 5, 25)];
    [detallefleco appendBezierPathWithRect:NSMakeRect(220, 220, 5, 5)];
    
    [[NSColor blackColor] setFill];
    [detallefleco fill];
    [[NSColor blackColor] setStroke];
    [detallefleco setLineWidth:3.0];
    [detallefleco stroke];
    
    //Cuello2
    NSBezierPath *colgante = [NSBezierPath bezierPath];
    //180, 120, 40, 25
    NSPoint centerC = NSMakePoint(200, 120);
    CGFloat radiusC = 15;
    [colgante appendBezierPathWithArcWithCenter:centerC radius:radiusC startAngle:0 endAngle:360];
    
    [colgante lineToPoint:NSMakePoint(centerC.x - radiusC, centerC.y)];
    [colgante closePath];
    
    [[NSColor grayColor] setFill];
    [colgante fill];
    [[NSColor blackColor] setStroke];
    [colgante setLineWidth:3.0];
    [colgante stroke];
    
    NSBezierPath *colgante2 = [NSBezierPath bezierPath];
    //180, 120, 40, 25
    NSPoint centerC2 = NSMakePoint(200, 120);
    CGFloat radiusC2 = 7;
    [colgante2 appendBezierPathWithArcWithCenter:centerC2 radius:radiusC2 startAngle:0 endAngle:360];
    
    [colgante2 closePath];
    
    [[NSColor yellowColor] setFill];
    [colgante2 fill];
    [[NSColor blackColor] setStroke];
    [colgante2 setLineWidth:1.0];
    [colgante2 stroke];
}

@end
