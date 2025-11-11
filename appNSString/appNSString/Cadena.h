//
//  Cadena.h
//  appNSString
//
//  Created by Emiliano Cepeda on 18/09/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cadena : NSObject
{
    __weak IBOutlet NSTextField *texto1;
    
    __weak IBOutlet NSTextField *label1;
    
    __weak IBOutlet NSTextField *labelContar1;
    
    __weak IBOutlet NSTextField *labelMayus;
    
    __weak IBOutlet NSTextField *labelConvMayus;
    
    
}
@property (weak) IBOutlet NSButton *boton1Propiedad;

- (IBAction)boton1:(NSButton *)sender;

@property (weak) IBOutlet NSTextField *label1Propiedad;

@property (weak) IBOutlet NSButton *botonContar;

- (IBAction)botonContar:(id)sender;

@property (weak) IBOutlet NSButton *botonMayus;

- (IBAction)botonMayus:(id)sender;

@property (weak) IBOutlet NSButton *botonConvMayus;

- (IBAction)BotonConvMayus:(id)sender;

//Metodo Cadena a Mayusculas
-(NSMutableString *)aMayusculas: (NSMutableString *) cadena;

- (IBAction)ButtonMayus:(id)sender;

-(NSMutableString *)aMayusculas2: (NSMutableString *) cadena;

@end
NS_ASSUME_NONNULL_END
