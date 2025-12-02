//
//  ViewController.h
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 01/11/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelPuntos;

- (IBAction)carta1:(UIButton *)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *labelIgualdad;

- (void)setFlipCount:(int)flips;

- (IBAction)botonReiniciar:(UIButton *)sender;

- (IBAction)botonAcercaDe:(UIButton *)sender;


@end

