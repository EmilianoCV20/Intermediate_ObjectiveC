//
//  CardMatchingGame.h
//  appGameCarts
//
//  Created by Emiliano Cepeda on 11/11/24.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

-(instancetype)initWhitCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(void)setNcoincidencias:(NSInteger)ncoincidencias;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString *coincidencia;
@property (nonatomic,readonly) NSInteger ncoincidencias;


@end

NS_ASSUME_NONNULL_END
