//
//  Person.m
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import "Person.h"

@implementation Person

-(instancetype)init:(NSString*)name:(NSDate*)birthDate {
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _birthDate = birthDate;
    }
    
    return self;
}
@end
