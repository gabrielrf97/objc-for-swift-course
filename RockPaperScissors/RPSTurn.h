//
//  RPSTurn.h
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Move) {
    Rock,
    Paper,
    Scissors
};

NS_ASSUME_NONNULL_BEGIN

@interface RPSTurn : NSObject
@property (nonatomic) Move move;
- (instancetype)initWithMove:(Move)move;
- (NSString*) description;
-(Move) generateMove;
-(bool) defeats:(RPSTurn*) opponentTurn;
-(bool) ties:(RPSTurn*) opponentTurn;
@end

NS_ASSUME_NONNULL_END
