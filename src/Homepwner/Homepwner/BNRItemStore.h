//
//  BNRItemStore.h
//  HomePwner
//
//  Created by 李仕增 on 2023/9/20.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// 为了实现单例 我们暴露一个sharedStore方法 用来访问我自己self
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIdex:(NSUInteger)fromIdex toIndex:(NSUInteger)toIndex;


@end
