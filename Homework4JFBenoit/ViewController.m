//
//  ViewController.m
//  Homework4JFBenoit
//
//  Created by Jacob Benoit on 2/5/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ViewController.h"
#import "TodoItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    self.descriptionField.delegate = self;
    self.titleField.delegate = self;
    self.removeButton.enabled = NO;
    self.titleField.enabled = NO;
    self.descriptionField.enabled = NO;

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSLog(@"getting number of rows in table: %lu", [self.list count]);
    return [self.list count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cellid" owner:nil];
    cell.textField.stringValue = [self.list getTodoItemTitleAtIndex:(int)row];
    return cell;
}


-(IBAction)addButtonPushed:(id)sender {
    TodoItem *i = [TodoItem todoItemWithTitle:@"New Item" andDescription:@""];
    [self.list addItem:i];
    // NiceToHave: would be nice to set focus on the title field so the user can immediately update
    [self.table reloadData];
    
}

-(IBAction)removeButtonPushed:(id)sender {
    [self.list removeItemsAtIndexes:[self.table selectedRowIndexes]];
    [self.table reloadData];
    self.titleField.stringValue = @"";
    self.descriptionField.stringValue = @"";
    self.removeButton.enabled = NO;
    
}

- (void)controlTextDidChange:(NSNotification *)obj {
    // not going to care which control, though it would be nice to know how to do that.
    // just save both title and desc whenever we get this.
    NSLog(@"editing item");
    [self.list updateItemAtIndex:self.table.selectedRow withTitle: self.titleField.stringValue withDescription:self.descriptionField.stringValue];
    
    NSLog(@"selected row and column: %@ and %@",self.table.selectedRowIndexes, self.table.selectedColumnIndexes);
    // Why didn't this work??? I have to create the column index set with an index of 0.
//    [self.table reloadDataForRowIndexes:self.table.selectedRowIndexes columnIndexes:self.table.selectedColumnIndexes];
    NSMutableIndexSet * mis = [[NSMutableIndexSet alloc] init];
    [mis addIndex:0];
    [self.table reloadDataForRowIndexes:self.table.selectedRowIndexes columnIndexes:mis];
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification {
    if ([self.table numberOfSelectedRows] > 1) {
        self.removeButton.enabled = YES;
        self.titleField.stringValue = @"";
        self.descriptionField.stringValue = @"";
        self.titleField.enabled = NO;
        self.descriptionField.enabled = NO;
    } else if ([self.table numberOfSelectedRows] == 1) {
        // set up the edit fields
        NSInteger index = self.table.selectedRow;
        // why is selected column -1?
        NSLog(@"selected row and column: %ld %ld", (long)index, (long)self.table.selectedColumn);
        self.titleField.stringValue = [self.list getTodoItemTitleAtIndex:(int)index];
        self.descriptionField.stringValue = [self.list getTodoItemDescriptionAtIndex:(int)index];
        self.titleField.enabled = YES;
        self.descriptionField.enabled = YES;
        self.removeButton.enabled = YES;
    } else {
        self.removeButton.enabled = NO;
        self.titleField.stringValue = @"";
        self.descriptionField.stringValue = @"";
        self.titleField.enabled = NO;
        self.descriptionField.enabled = NO;
    }
    
}

@end
