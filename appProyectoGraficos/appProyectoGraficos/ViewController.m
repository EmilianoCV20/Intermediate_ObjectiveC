//
//  ViewController.m
//  appProyectoGraficos
//
//  Created by Emiliano Cepeda on 29/10/24.
//

#import "ViewController.h"
#import "InfoViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Agregar un gesto de tap para ocultar el teclado
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

// Método para ocultar el teclado
- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)botonAyuda:(UIButton *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    InfoViewController *infoVC = [storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    [self presentViewController:infoVC animated:YES completion:nil];
    
}
@end
