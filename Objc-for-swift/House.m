//
//  House.m
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "House.h"

@implementation House
    
-(instancetype)initWithAddress:(NSString*)address{
    self = [super init];
    if (self) {
        _address = [address copy];
        _hasHotTub = false;
        _numberOfBedrooms = 2;
    }
    return self;
}
@end
