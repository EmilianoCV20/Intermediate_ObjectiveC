//
//  ViewController.h
//  appGraficos1_IOS
//
//  Created by Emiliano Cepeda on 25/10/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *labelX1;
@property (weak, nonatomic) IBOutlet UITextField *labelY1;
@property (weak, nonatomic) IBOutlet UITextField *labelX2;
@property (weak, nonatomic) IBOutlet UITextField *labelY2;

@property (weak, nonatomic) IBOutlet UITextField *labelGrosor;


- (IBAction)botonLinea:(UIButton *)sender;

@end

