//
//  ViewController.m
//  appGraficos1_IOS
//
//  Created by Emiliano Cepeda on 25/10/24.
//

#import "ViewController.h"
#import "Graficos.h"

@interface ViewController ()
@property (strong, nonatomic) Graficos *miGraficoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.miGraficoView = [[Graficos alloc] initWithFrame:self.view.bounds];
    self.miGraficoView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.miGraficoView];
    [self.view sendSubviewToBack:self.miGraficoView];
}

- (IBAction)botonLinea:(UIButton *)sender {
    
    CGFloat x1 = [self.labelX1.text floatValue];
    CGFloat y1 = [self.labelY1.text floatValue];
    CGFloat x2 = [self.labelX2.text floatValue];
    CGFloat y2 = [self.labelY2.text floatValue];
    CGFloat grosor =[self.labelGrosor.text floatValue];
    
    [self.miGraficoView dibujarLineaDesdeX:x1 y:y1 hastaX:x2 y:y2 grosor:grosor];
    
    NSLog(@"Botón presionado: X1:%f,Y1:%f,X2:%f,Y2:%f,G:%f",x1,y1,x2,y2,grosor);
}

@end

