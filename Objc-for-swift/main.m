//
//  main.m
//  Objc-for-swift
//
//  Created by Gabriel Rodrigues on 12/02/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    Person* person = [[Person alloc] init];
    print(person.name);
    return 0;
}
