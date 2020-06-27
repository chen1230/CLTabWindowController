//
//  CLCustomClass.m
//  CLTabWindowController
//
//  Created by chen on 2020/6/26.
//  Copyright © 2020 chen1230. All rights reserved.
//

#import "CLCustomClass.h"

@interface CLCustomClass()
@property (unsafe_unretained) NSUInteger myHash;

@end
 
@implementation CLCustomClass
 
- (id)copyWithZone:(NSZone *)zone
{
    id aCopy = [[[self class] alloc]init];
    if (aCopy) {
        [aCopy setName:[self.name copyWithZone:zone]];
        [aCopy setMyHash:self.myHash];
    }
    return aCopy;
}
- (id)init
{
    if (self = [super init]) {
        _myHash = (NSUInteger)self;
    }
    return self;
}
- (NSUInteger)hash
{
    return _myHash;
}
- (BOOL)isEqual:(id)object
{
    return self.myHash == ((CLCustomClass *)object).myHash;
}

@end
