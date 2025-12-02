//
//  Deck.h
//  appJuego1Carta
//
//  Created by Emiliano Cepeda on 02/11/24.
//

//ESTA CLASE REPRESENTA UNA BARAJA DE CARTAS
#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

//AGREGA UNA CARTA
-(void)addCard:(Card *)card atTop:(BOOL)atTop;

//DEVUELVE UNA CARTA
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end

NS_ASSUME_NONNULL_END
