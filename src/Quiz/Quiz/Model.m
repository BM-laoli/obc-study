//
//  Model.m
//  Quiz
//
//  Created by administrator on 2023/9/5.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithData:(NSArray *)questions quertion:(NSArray *)answers
{
    self.answers = answers;
    self.questions = questions;
    return self;
}

- (NSArray *)getAAndQ:(int)idx
{
    NSMutableArray *res = [NSMutableArray array];
    [res addObject:self.questions[idx]];
    [res addObject:self.answers[idx]];
    
    return res;
}

@end
