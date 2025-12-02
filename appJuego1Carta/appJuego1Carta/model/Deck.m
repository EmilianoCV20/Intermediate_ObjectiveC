//
//  Deck.m
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 02/11/24.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards; //Almacena las cartas
@end

@implementation Deck

//Devuelve cartas, si es nulo se asigna un array
-(NSMutableArray *)cards {
    
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

//Agrega cartas
-(void)addCard:(Card *)card atTop:(BOOL)atTop {
    
    if(atTop) {
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }
    
}

-(void)addCard:(Card *)card {
    
    [self.cards addObject:card];
    
}

//Escoge una carta al azar
-(Card *)drawRandomCard {
    
    Card *randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
    
}

@end
