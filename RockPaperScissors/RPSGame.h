//
//  RPSGame.h
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "RPSTurn.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPSGame : NSObject
@property (nonatomic) RPSTurn* playerTurn;
@property (nonatomic) RPSTurn* computerTurn;
-(instancetype)initWithFirstTurn:(RPSTurn*)playerTurn
                      secondTurn:(RPSTurn*)computerTurn;
- (bool) playerWins;
- (RPSTurn*) winner;
- (RPSTurn*) loser;
- (bool) isTie;
- (NSString*) result;
@end

NS_ASSUME_NONNULL_END
