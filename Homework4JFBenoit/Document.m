//
//  Document.m
//  Homework4JFBenoit
//
//  Created by Jacob Benoit on 2/5/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "Document.h"
#import "TodoList.h"
#import "ViewController.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        self.list = [[TodoList alloc] initWithPrepopMusicalInstruments];
//        self.list = [[TodoList alloc] init];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
    // Override to return the Storyboard file name of the document.
    NSStoryboard * sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController  *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    [self addWindowController:wc];
    
    ViewController *vc = (ViewController*)wc.contentViewController;
    
    // is this the right place to do this??
    NSLog(@"making a window controller");
    vc.list = self.list;
    [vc.table reloadData];
    
    
}

#pragma mark - Saving and loading

// saving
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[self list]];
    NSLog(@"saving list...");
    [self.list logItems];
    return data;
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

}

// loading
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    
    NSLog(@"starting read");
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if ([object isKindOfClass:[TodoList class]]) {
        self.list = (TodoList*)object;
        NSLog(@"reading list...");
        [self.list logItems];
        return YES;
    }
    NSLog(@"read failed!!");
    return NO;
    
    
    
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
}

@end
