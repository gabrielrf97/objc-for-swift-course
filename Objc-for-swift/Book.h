//
//  Book.h
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import "Person.h"

@interface Book : NSObject
@property (nonatomic, copy) Person* author;
@property (nonatomic, copy) NSString* title;
@property (nonatomic) int yearOfPublication;
@end
