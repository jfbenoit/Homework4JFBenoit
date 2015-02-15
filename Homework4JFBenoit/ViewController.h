//
//  ViewController.h
//  Homework4JFBenoit
//
//  Created by Jacob Benoit on 2/5/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate>

@property (strong) TodoList *list;

@property (weak) IBOutlet NSTableView *table;

@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSButton *removeButton;
@property (weak) IBOutlet NSTextField *titleField;
@property (weak) IBOutlet NSTextField *descriptionField;

@end

