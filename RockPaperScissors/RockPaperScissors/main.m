//
//  main.m
//  RockPaperScissors
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "RPSController.h"

int main(int argc, const char * argv[]) {
    RPSController* controller = [[RPSController alloc] init];
    [controller throwDown:Paper];
    return 0;
}
