//
//  DibujarConTouch.m
//  appDibujarConTouch
//
//  Created by Emiliano Cepeda on 30/10/24.
//

#import "DibujarConTouch.h"

@interface DibujarConTouch () <UIColorPickerViewControllerDelegate>
@end

@implementation DibujarConTouch
{
    UIBezierPath *path;
    int imagen;
}

-(id)initWithCoder:(NSCoder *)coder {
    imagen = 0;
    if (self = [super initWithCoder:coder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:4];
        _currentColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.8 alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.currentColor setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}

-(void)borrar{
    path = nil;
    path = [UIBezierPath bezierPath];
    [path setLineWidth:4];
    [self setNeedsDisplay];
}

- (IBAction)cambiarImagen:(UIButton *)sender {
    imagen++;
    
    if (imagen > 5) {
        imagen = 0;
    }
    
    switch (imagen) {
        case 0:
            self.imageView.image = [UIImage imageNamed:@"cursiva_a"];
            break;
        case 1:
            self.imageView.image = [UIImage imageNamed:@"cursiva_e"];
            break;
        case 2:
            self.imageView.image = [UIImage imageNamed:@"cursiva_i"];
            break;
        case 3:
            self.imageView.image = [UIImage imageNamed:@"cursiva_o"];
            break;
        case 4:
            self.imageView.image = [UIImage imageNamed:@"cursiva_u"];
            break;
        case 5:
            self.imageView.image = [UIImage imageNamed:@"oso"];
            break;
        default:
            break;
    }
}

- (IBAction)botonBorrar:(UIButton *)sender {
    [self borrar];
}

- (IBAction)cambiarColor:(UIButton *)sender {
    UIColorPickerViewController *colorPicker = [[UIColorPickerViewController alloc] init];
        colorPicker.delegate = self;
        colorPicker.selectedColor = self.currentColor;
        [self.window.rootViewController presentViewController:colorPicker animated:YES completion:nil];
}


-(void)colorPickerViewControllerDidSelectColor:(UIColorPickerViewController *)viewController {
    self.currentColor = viewController.selectedColor;
    [self setNeedsDisplay];
}

@end
