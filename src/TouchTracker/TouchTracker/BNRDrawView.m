//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by 李仕增 on 2023/10/10.
//

#import "BNRDrawView.h"
#import <UIKit/UIKit.h>
#import "BNRLine.h"

@interface BNRDrawView ()
//@property (nonatomic,strong) BNRLine *currentLine;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;
@property (nonatomic,strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if(self) {
        self.linesInProgress = [[NSMutableDictionary alloc]init];
        self.finishedLines = [[NSMutableArray alloc]init];
        self.backgroundColor = [UIColor grayColor];
        
        // 多点触摸
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void) strokeLine: (BNRLine *) line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void) drawRect:(CGRect)rect
{
    // 黑色表示绘制完成的line
    [[UIColor blackColor]set];
    for ( BNRLine *line in self.finishedLines ) {
        [self strokeLine:line];
//        [self strokeLine:line];
//        if ( self.currentLine ) {
//            // 红色表示正在绘制的 line
//            [[UIColor redColor]set];
//            [self strokeLine:self.currentLine];
//        }
    }
    
    for ( NSValue *key in self.linesInProgress ) {
        [self strokeLine:self.linesInProgress[key]];
    }
}

# pragma mark - 具体的touch实现
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for ( UITouch *t in touches ) {
        CGPoint location = [t locationInView:self];
        BNRLine *line = [[BNRLine alloc]init];
        
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProgress[key]=line;
    }
//    UITouch *t = [touches anyObject];
//    // 依据触摸的位置 创建BNRLine对象
//    CGPoint location = [t locationInView:self];
//    self.currentLine = [[BNRLine alloc]init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for ( UITouch *t in touches ) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        line.end = [t locationInView:self];
    }
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    self.currentLine.end=location;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for ( UITouch *t in touches ) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    for ( UITouch *t in touches ) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}
@end
