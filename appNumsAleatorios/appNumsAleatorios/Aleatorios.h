//
//  Aleatorios.h
//  appNumsAleatorios
//
//  Created by Emiliano Cepeda on 23/09/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Aleatorios : NSObject

@property (weak) IBOutlet NSTextField *label1;

- (IBAction)botonIniciarSemilla:(id)sender;

- (IBAction)botonGenerarNumero:(id)sender;

- (IBAction)botoSalir:(id)sender;

-(void) awakeFromNib;

@end

NS_ASSUME_NONNULL_END
