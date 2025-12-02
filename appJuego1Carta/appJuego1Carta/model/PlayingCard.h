//
//  PlayingCard.h
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 02/11/24.
//

#import "Card.h"


@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit; //Caracter de la carta
@property (nonatomic) NSUInteger rank; //Numero de la carta

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

