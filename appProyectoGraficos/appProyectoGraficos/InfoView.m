//
//  InfoView.m
//  appProyectoGraficos
//
//  Created by Emiliano Cepeda on 31/10/24.
//

#import "InfoView.h"

@implementation InfoView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (IBAction)segControlDesc:(UISegmentedControl *)sender {
    
    NSInteger indice = sender.selectedSegmentIndex;
    
    NSDictionary *descripciones = @{
        @0: @{@"titulo": @"LINEA",
              @"descripcion": @"Una línea es una figura recta que conecta dos puntos. Puede ser corta o larga, pero siempre es recta como una cuerda tensa."},
        @1: @{@"titulo": @"RECTANGULO",
              @"descripcion": @"Un rectángulo es una figura con cuatro lados. Tiene dos lados largos y dos cortos, y todos forman esquinas en ángulo recto, como una puerta o una ventana."},
        @2: @{@"titulo": @"CURVA QUAD",
              @"descripcion": @"La Curva Quad es una línea curva que se dobla suavemente usando un solo punto de control. Es como una colina que sube y baja sin esquinas."},
        @3: @{@"titulo": @"CURVA BEZIER",
              @"descripcion": @"La Curva Bezier es una línea que se dobla más de una vez usando dos puntos de control, lo que le permite cambiar de dirección varias veces, como una carretera sinuosa."}
    };
    
    NSDictionary *seleccion = descripciones[@(indice)];
    
    if (seleccion) {
        _textoTitulo.text = seleccion[@"titulo"];
        _textoDescripcion.text = seleccion[@"descripcion"];
    }
    
    switch (indice) {
        case 0:
            self.imagen.image = [UIImage imageNamed:@"linea"];
            break;
        case 1:
            self.imagen.image = [UIImage imageNamed:@"rectangle"];
            break;
        case 2:
            self.imagen.image = [UIImage imageNamed:@"curvaQ"];
            break;
        case 3:
            self.imagen.image = [UIImage imageNamed:@"curvaB"];
            break;
        default:
            break;
    }
    
    [self setNeedsDisplay];
    
}
@end
