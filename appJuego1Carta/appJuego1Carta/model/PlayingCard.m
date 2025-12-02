//
//  PlayingCard.m
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 02/11/24.
//

//CARTA DE JUEGO
#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    if([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;// 4 puntos por igualar el rango.
        } else if([otherCard.suit isEqualToString:self.suit]){
            score = 1;// 1 punto por combinar el traje.
        }
    }
    return score;
}

//Crea el numero de la carta
-(NSString *)contents {
    
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit;

+(NSArray *)validSuits {
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
    
}

//Junta un valor al numero de la carta
-(void)setSuit:(NSString *)suit {
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}
-(NSString *)suit {
    return _suit ? _suit : @"?";
}

//Valores de las Cartas
+(NSArray *)rankStrings {
    return  @[@"?",@"A",@"2",@"3",@"4",@"5",@"6"
              ,@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

@end
