//
//  BNRPerson.m
//  CusObject
//
//  Created by administrator on 2023/8/29.
//

#import "BNRPerson.h"

@implementation BNRPerson
- (float)h
{
    return  _h;
}

- (void)setH: (float)h
{
    _h = h;
}

- (int)w
{
    return _w;
}

- (void)setW:(int)w
{
    _w =w;
}

- (float)bodyMassIndex
{
    return [self w] / [self h] * [self h];
}
@end
