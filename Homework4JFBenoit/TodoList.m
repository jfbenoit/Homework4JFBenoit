//
//  TodoList.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ToDoList.h"


@implementation TodoList

+(instancetype)todoList
{
    TodoList *tdl = [[self alloc] init];
    tdl.list = [[NSMutableArray alloc] init];
    tdl.allowDups = true;
    return tdl;
}

-(void)addItem:(TodoItem*)item {
    [self.list addObject:item];
}

-(void)removeItem:(TodoItem*)item {
    [self.list removeObject:item];
}

-(void)removeItemAtIndex:(NSInteger*)index {
    [self.list removeObjectAtIndex:(NSUInteger)index];
}

-(void)removeItemsAtIndexes:(NSIndexSet*)indexes {
    [self.list removeObjectsAtIndexes:indexes];
}

-(void)updateItemAtIndex:(NSInteger)index withTitle:(NSString*)title withDescription:(NSString*)description {
    NSLog(@"updating at index %lu",index);
    TodoItem* i = [self.list objectAtIndex:(NSUInteger)index];
    i.title = title;
    i.desc = description;
}

-(NSInteger)count {
    NSLog(@"list count: %lu",(unsigned long)[self.list count]);
    return [self.list count];
}

-(NSString*) getTodoItemTitleAtIndex:(int)index {
    return ((TodoItem *)self.list[index]).title;
}

-(NSString*) getTodoItemDescriptionAtIndex:(int)index {
    return ((TodoItem *)self.list[index]).desc;
}

-(void)setDups:(BOOL)flag {
    self.allowDups = flag;
}

-(bool) canAddTodo:(NSString*)title {
    NSLog(@"checking to see if we can add");
    TodoItem *i = [TodoItem todoItemWithTitle:title andDescription:@""];
    if ([self.list containsObject:i] && !self.allowDups) {
        return false;
    } else {
        return true;
    }
}

-(bool) canRemoveTodo:(NSString*)title {
    NSLog(@"checking to see if we can remove");
    TodoItem *i = [TodoItem todoItemWithTitle:title andDescription:@""];
    if ([self.list containsObject:i]) {
        return true;
    } else {
        return false;
    }
}

-(instancetype) init {
    self = [super init];
    self.list = [[NSMutableArray alloc] init];
    self.allowDups = true;
    return self;
}

-(instancetype) initWithPrepopMusicalInstruments {
    self = [self init];
    NSArray * array = @[@"Drums", @"Guitar", @"Cello", @"Piano", @"Banjo"];
    for (NSString *current in array) {
        TodoItem *i = [TodoItem todoItemWithTitle:current andDescription:[current lowercaseString]];
        [self.list addObject:i];
    }
    self.allowDups = true;
    return self;
}

-(instancetype) initWithPrepopNames {
    self = [self init];
    NSArray * array = @[
        @"Brandoch Daha",
        @"Spitfire",
        @"Goldry Bluszco",
        @"Gro"
        ];
    for (NSString *current in array) {
        TodoItem *i = [TodoItem todoItemWithTitle:current andDescription:@""];
        [self.list addObject:i];
    }
    self.allowDups = true;
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.list forKey:@"todoList"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _list = [coder decodeObjectForKey:@"todoList"];
    }
    return self;
}

-(void) logItems {
    for (int i = self.list.count; i > 0; i--) {
        NSLog(@"item: %@ at index %d",((TodoItem *)self.list[i-1]).title, i);
    }
}

@end