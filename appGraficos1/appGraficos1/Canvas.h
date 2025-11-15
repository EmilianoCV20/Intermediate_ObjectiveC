//
//  Canvas.h
//  appGraficos1
//
//  Created by Emiliano Cepeda on 27/09/24.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Canvas : NSView

-(NSPoint) randomPoint;

-(void)star;

-(void) dibujaLinea;
-(void) dibujaPoligono;
-(void) dibujarGradienteRadial1;
-(void) dibujarGradienteRadial2;
-(void) dibujarCurvaBezier1;
-(void) dibujarCurvaBezier2;
-(void) dibujarCurvaBezierINV;
-(void) dibujoPropio;

@end

NS_ASSUME_NONNULL_END
