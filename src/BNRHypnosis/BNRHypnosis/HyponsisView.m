//
//  HyponsisView.m
//  BNRHypnosis
//
//  Created by administrator on 2023/9/6.
//

#import "HyponsisView.h"

@interface HyponsisView ()

@property(strong, nonatomic) UIColor *circleColor;

@end

@implementation HyponsisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // 计算中心坐标
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // 搞一个半径
    //float reudis = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    // 让最外层的圆编变成Rect 外接圆
    float maxRaduis = hypotf(bounds.size.width, bounds.size.height)/2.0;
    
    // 生产一个path 对象
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
//    // 由于我们绘制一个圆形不需要管方向
//    [path addArcWithCenter:center
//                    radius:reudis
//                    startAngle:0.0
//                    endAngle:M_PI * 2.0
//                    clockwise:YES];
    
    // 同心圆 直接给不同的半径连续绘制就好了
    for (float currentRadius = maxRaduis; currentRadius >0; currentRadius -= 20) {
        // 由于单个path 对象会把多个路径链接起来，所以会有一条之间，最好的解决方法是（绘制一次之后 抬笔)
        [path moveToPoint:CGPointMake(center.x+currentRadius,center.y)];
        [path addArcWithCenter:center
                            radius:currentRadius
                            startAngle:0.0
                            endAngle:M_PI * 2.0
                            clockwise:YES];
    }
    
    
    // 改变线条粗细
    path.lineWidth = 10;
    [self.circleColor setStroke];
    
    
    // 绘制上去
    [path stroke];
}

- (void)  touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    float red = (arc4random() %100 ) / 100.0;
    float green = (arc4random() %100 ) / 100.0;
    float blue = (arc4random() %100 ) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    // 在自定义属性内 属性都是 加_ 做前缀
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return  self;
}
@end
