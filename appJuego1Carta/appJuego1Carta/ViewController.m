//
//  ViewController.m
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 01/11/24.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
{
    int PUNTOS;
}

@property (strong,nonatomic)Deck *deck;
@property (strong,nonatomic)CardMatchingGame *game;

@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWhitCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)deck{
    if(! _deck)_deck=[self createDeck];
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PUNTOS = 0;
}

- (IBAction)botonAcercaDe:(UIButton *)sender {
    UIAlertController *alerta=[UIAlertController alertControllerWithTitle:@"ACERCA DE..." message:@"Juego de Cartas: \nEmiliano Cepeda Villarreal \n20130792" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    [alerta addAction: action];
    [self presentViewController:alerta animated:YES completion:nil];
}

- (IBAction)botonReiniciar:(UIButton *)sender {
    PUNTOS = 0;
    self.labelPuntos.text = [NSString stringWithFormat:@"PUNTOS: %d", PUNTOS];
    
    self.labelIgualdad.text = @"¿¿SON IGUALES??";
    
    self.game = [[CardMatchingGame alloc] initWhitCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    [self updateUI];
}

-(void)setFlipCount:(int)flips{
    
    flips = PUNTOS;
    _labelPuntos.text = [NSString stringWithFormat:@"PUNTOS: %d", PUNTOS];
    
}

- (IBAction)carta1:(UIButton *)sender {
    /*
     PUNTOS++;
     if ([sender.currentTitle length]) {
     [sender setBackgroundImage:[UIImage imageNamed:@"BackCard"] forState:UIControlStateNormal];
     [sender setTitle:@"" forState:UIControlStateNormal];
     [sender setNeedsDisplay];
     
     } else {
     //        [sender setBackgroundImage:[UIImage imageNamed:@"Blank-card"] forState:UIControlStateNormal];
     //        [sender setTitle:@"A❤︎" forState:UIControlStateNormal];
     //        [sender setNeedsDisplay];
     
     Card *randomCard=[self.deck drawRandomCard];
     if(randomCard){
     [sender setBackgroundImage:[UIImage imageNamed:@"FrontCard"] forState:UIControlStateNormal];
     [sender setTitle:randomCard.contents forState:UIControlStateNormal];
     }
     
     }
     
     [self setFlipCount:PUNTOS];
     */
    
    //int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
}

-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        //int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backGroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        
        self.labelPuntos.text = [NSString stringWithFormat:@"Score: %ld", self.game.score ];
        self.labelIgualdad.text=self.game.coincidencia;
        
        if(self.game.ncoincidencias == 5)
        {
            UIAlertController *alerta=[UIAlertController alertControllerWithTitle:@"¡FELICIDADES GANASTE!" message:@"Minimo 5 cartas eran Iguales" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action=[UIAlertAction actionWithTitle: @"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
            [alerta addAction: action];
            [self presentViewController:alerta animated:YES completion:nil];
            //[self.game setNcoincidencias:0];
            
        }
    }
}

-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backGroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"FrontCard" : @"BackCard"];
}

@end
