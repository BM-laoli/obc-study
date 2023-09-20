//
//  BNRItemStore.m
//  HomePwner
//
//  Created by 李仕增 on 2023/9/20.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()
@property (nonatomic) NSMutableArray *privateItems;
@end


@implementation BNRItemStore

+ (instancetype)sharedStore
{
    // 静态变量
    static BNRItemStore *sharedStore;

    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }

    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems
{
    // 返回其不可变的副本 由于重写了allItems 的gettter 所以 不会再有 _allItems 的自动变量了
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    // 创建一个item 文案上随机的
    BNRItem *item = [BNRItem randomItem];

    [self.privateItems addObject:item];

    return item;
}

@end
