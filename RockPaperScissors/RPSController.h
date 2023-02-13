//
//  RPSController.h
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "RPSTurn.h"
#import "RPSGame.h"

NS_ASSUME_NONNULL_BEGIN

@interface RPSController : NSObject
@property (nonatomic) RPSGame* game;
-(void) throwDown:(Move) move;
-(NSString*) messageForGame;
@end

NS_ASSUME_NONNULL_END
