//
//  Card.m
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 02/11/24.
//

#import "Card.h"

@implementation Card

- (int)match:(nonnull NSArray *)otherCards {
    
    int score = 0;
    
    for (Card *card in otherCards) {
        
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
        
    }
    
    return score;
    
}

@end
