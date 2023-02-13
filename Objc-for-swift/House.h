//
//  House.h
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

@interface House : NSObject
@property (nonatomic) NSString* address;
@property (nonatomic) int numberOfBedrooms;
@property (nonatomic) bool hasHotTub;
-(instancetype) initWithAddress:(NSString*)address;
@end
