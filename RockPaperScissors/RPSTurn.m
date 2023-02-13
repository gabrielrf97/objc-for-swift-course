//
//  RPSTurn.m
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import "RPSTurn.h"

@implementation RPSTurn

- (instancetype) init {
    self = [super init];
    
    if (self != nil) {
        _move = [self generateMove];
    }
    
    return self;
}

- (instancetype)initWithMove:(Move)move {
    self = [super init];
    
    if (self != nil) {
        _move = move;
    }
    
    return self;
}

- (NSString*) description {
    switch (self.move) {
        case Rock:
            return @"Rock";
            break;
        case Paper:
            return @"Paper";
            break;
        case Scissors:
            return @"Scissors";
            break;
    }
}

-(Move) generateMove {
    
    NSInteger value = arc4random_uniform(3);
    
    switch (value) {
        case 0:
            return Rock;
            break;
        case 1:
            return Paper;
            break;
        default:
            return Scissors;
            break;
    }
}

-(bool) defeats:(RPSTurn*) opponentTurn {
    
    Move opponentsMove = opponentTurn.move;
    
    if ((self.move == Rock && opponentsMove == Scissors) ||
        (self.move == Scissors && opponentsMove == Paper) ||
        (self.move == Paper && opponentsMove == Rock)) {
        return true;
    } else {
        return false;
    }
}

-(bool) ties: (RPSTurn*) opponentTurn {
    Move opponentsMove = opponentTurn.move;
    return self.move == opponentsMove;
}

@end
