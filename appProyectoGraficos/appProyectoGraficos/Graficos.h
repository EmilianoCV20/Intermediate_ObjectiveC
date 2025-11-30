//
//  Graficos.h
//  appProyectoGraficos
//
//  Created by Emiliano Cepeda on 29/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Graficos : UIView
{
    int x1;
    int y1;
    int x2;
    int y2;
    int pc1;
    int pc2;
    int pc3;
    int pc4;
    int tipo;
    float grosor;
}

@property (weak, nonatomic) IBOutlet UITextField *textoX1;
@property (weak, nonatomic) IBOutlet UITextField *textoY1;
@property (weak, nonatomic) IBOutlet UITextField *textoX2;
@property (weak, nonatomic) IBOutlet UITextField *textoY2;

@property (weak, nonatomic) IBOutlet UITextField *textoPC1;
@property (weak, nonatomic) IBOutlet UITextField *textoPC2;
@property (weak, nonatomic) IBOutlet UITextField *textoPC3;
@property (weak, nonatomic) IBOutlet UITextField *textoPC4;

@property (weak, nonatomic) IBOutlet UITextField *textoGrosor;

@property (weak, nonatomic) IBOutlet UILabel *labelAncho;
@property (weak, nonatomic) IBOutlet UILabel *labelAlto;


- (IBAction)segControl:(UISegmentedControl *)sender;

-(void)dibujarLinea:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(float)grosor;

-(void)dibujarRectangulo:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(float)grosor;

-(void)dibujarCurva1:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(int)pc1 :(int)pc2 :(float)grosor;

-(void)dibujarCurva2:(int)x1 :(int)y1 :(int)x2 :(int)y2 :(int)pc1 :(int)pc2 :(int)pc3 :(int)pc4 :(float)grosor;


@end
NS_ASSUME_NONNULL_END
