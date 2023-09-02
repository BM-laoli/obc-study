//
//  Document.h
//  TahDoodle
//
//  Created by administrator on 2023/9/1.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument<NSTableViewDataSource>

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable;

-(IBAction)addTask:(id)sender;

@end

