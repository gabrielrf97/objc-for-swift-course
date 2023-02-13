//
//  RPSController.m
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import "RPSController.h"
#import "RPSTurn.h"

@implementation RPSController

-(void) throwDown:(Move)move {
    RPSTurn* playerTurn = [[RPSTurn alloc] initWithMove:move];
    RPSTurn* computerTurn = [[RPSTurn alloc] init];
    self.game = [[RPSGame alloc] initWithFirstTurn:playerTurn
                                            secondTurn:computerTurn];
    NSLog([self messageForGame]);
}

- (NSString*) messageForGame {
    
    if ([self.game isTie]) {
        return @"It's a tie";
    }
    
    NSString* playerMove = [_game.playerTurn description];
    NSString* computerMove = [_game.computerTurn description];
    bool won = [self.game playerWins];
    
    if (won) {
        return [NSString stringWithFormat: @"%@ beats %@. %@", playerMove, computerMove, [_game result]];
    } else {
        return [NSString stringWithFormat: @"%@ beats %@. %@", computerMove, playerMove, [_game result]];
    }
}

@end
