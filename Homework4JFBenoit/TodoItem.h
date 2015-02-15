//
//  TodoItem.h
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject <NSCoding>

@property NSString* title;
@property NSString* desc;

+(instancetype)todoItemWithTitle:(NSString*)title
                  andDescription:(NSString*)description;

@end