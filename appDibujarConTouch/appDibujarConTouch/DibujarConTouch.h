//
//  DibujarConTouch.h
//  appDibujarConTouch
//
//  Created by Emiliano Cepeda on 30/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DibujarConTouch : UIView

@property (nonatomic, strong) UIColor *currentColor;

- (IBAction)cambiarColor:(UIButton *)sender;
- (IBAction)botonBorrar:(UIButton *)sender;
- (IBAction)cambiarImagen:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
