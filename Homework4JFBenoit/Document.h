//
//  Document.h
//  Homework4JFBenoit
//
//  Created by Jacob Benoit on 2/5/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface Document : NSDocument

@property TodoList *list;

@end

