//
//  RPSGame.m
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import "RPSGame.h"
#import "RPSTurn.h"

@implementation RPSGame

-(instancetype)initWithFirstTurn:(RPSTurn*)playerTurn
                      secondTurn:(RPSTurn*)computerTurn {
    self = [super init];
    
    if (self != nil) {
        _playerTurn = playerTurn;
        _computerTurn = computerTurn;
    }
    
    return self;
}

- (bool) playerWins {
    return [_playerTurn defeats: _computerTurn];
}

- (RPSTurn*) winner {
    return [_playerTurn defeats: _computerTurn] ? _playerTurn : _computerTurn;
}

- (RPSTurn*) loser {
    return [_computerTurn defeats: _playerTurn] ? _computerTurn : _playerTurn;
}

- (bool) isTie {
    return  [_playerTurn ties: _computerTurn];
}

- (NSString*) result {
    return [self winner] == _playerTurn ? @"You win!" : @"You lose.";
}

@end
