//
//  TodoItem.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

+(instancetype)todoItemWithTitle:(NSString*)title
                  andDescription:(NSString *)description {
    TodoItem *item = [[self alloc] init];
    item.title = title;
    item.desc = description;
    return item;
}

// todo items are equal only if their titles are equal!
- (BOOL) isEqual:(id) other {
    NSLog(@"comparing todoitems");
    if (self == other) {
        return YES;
    }
    if (![other isKindOfClass:[self class]]) {
        return NO;
    }
    if ([self.title isEqualToString: ((TodoItem *)other).title]) {
        return YES;
    }
    return NO;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"todoTitle"];
    [aCoder encodeObject:self.desc forKey:@"todoDesc"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _title = [coder decodeObjectForKey:@"todoTitle"];
        _desc = [coder decodeObjectForKey:@"todoDesc"];
    }
    return self;
}

@end