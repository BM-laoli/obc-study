//
//  Document.m
//  TahDoodle
//
//  Created by administrator on 2023/9/1.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document


#pragma NSDocument Overrides
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // 读取数据 进行转换
    self.tasks = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListMutableContainers format:NULL error:outError];

    return YES;
}


- (NSData *)dataOfType:(NSString *)typeName error:(NSError *__autoreleasing  _Nullable *)outError
{
    if(!self.tasks){
        self.tasks = [NSMutableArray array];
    }

    // 把task 转 data
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks format:NSPropertyListXMLFormat_v1_0 options:0 error:outError];

    return  data;
}



- (void)addTask:(id)sender
{

    if(!self.tasks){
        self.tasks = [NSMutableArray array];
    }
    
    [self.tasks addObject:@"New Item"];
     
    [self.taskTable reloadData];
    // 通知document 有尚未保存的修改
    [self updateChangeCount:NSChangeDone];
}

#pragma Makr 数据处理
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    // 表格对象显示task 数 所有直接coutn
    return [self.tasks count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // NSLog(@" ---> %@", [self.task objectAtIndex:row]);
    //依据索引饭绘 task 对象
    return [self.tasks objectAtIndex:row];
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    // 当用户修改taskView 数据的时候 更新task数组
    [self.tasks replaceObjectAtIndex:row withObject:object];
    // 把稳定标记为 未保存的 更改
    [self updateChangeCount:NSChangeDone];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

+ (BOOL)autosavesInPlace {
    return YES;
}


- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}


@end
