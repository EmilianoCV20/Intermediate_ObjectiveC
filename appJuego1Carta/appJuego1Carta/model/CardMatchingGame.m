//
//  CardMatchingGame.m
//  appGameCarts
//
//  Created by Emiliano Cepeda on 11/11/24.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSInteger ncoincidencias;
@property (nonatomic,readwrite) NSString *coincidencia;
@property (nonatomic, strong) NSMutableArray *cards;
@end
@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
-(instancetype)initWhitCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(self){
        for(int i = 0; i< count; i++){
            Card *card =[deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index]:nil;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore *MATCH_BONUS;
                        self.coincidencia = @"¡IGUALES!";
                        self.ncoincidencias+=1;
                        otherCard.matched =YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        self.coincidencia = @"DIFERENTES...";
                    }
                    break;
                    
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

@end
