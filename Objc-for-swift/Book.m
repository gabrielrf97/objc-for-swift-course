//
//  Book.m
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@implementation Book

-(instancetype)init{
    self = [super init];
    if(self) {
        _title = @"defaultValue";
        _author = @"defaultValue";
        _yearOfPublication = 0;
    }
    return self;
}

@end
