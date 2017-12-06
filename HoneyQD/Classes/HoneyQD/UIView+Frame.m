//
//  UIView+Frame.m
//  Expecta
//
//  Created by 陈林 on 2017/12/5.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark -
#pragma mark 高度
/**
 设置高度

 @param height 设置高度
 */
- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}


/**
 获取高度

 @return 获取高度
 */
- (CGFloat)height {
    return self.frame.size.height;
}


#pragma mark -
#pragma mark 宽度
/**
 设置宽度

 @param width 设置宽度
 */
-(void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

/**
 获取宽度

 @return 获取宽度
 */
- (CGFloat)width {
    return self.frame.size.width;
}


#pragma mark -
#pragma mark 起始点横坐标X
/**
设置起始点横坐标X

 @param  x 设置起始点横坐标X
 */
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}


/**
获取起始点X

 @return 获取起始点X
 */
- (CGFloat)x {
    return self.frame.origin.x;
}



#pragma mark -
#pragma mark 起始点Y
/**
 设置起始点Y

 @param y 设置起始点Y
 */
- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}


/**
 获取起始点Y

 @return 获取起始点纵坐标Y
 */
- (CGFloat)y {
    return self.frame.origin.y;
}

#pragma mark -
#pragma mark 中心点横坐标centerX


/**
 设置中心点X

 @param centerX 设置中心点X
 */
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}


/**
 获取中心点X

 @return   获取中心点X
 */
- (CGFloat)centerX {
    return self.center.x;
}

#pragma mark -
#pragma mark 中心点Y


/**
 设置中心点Y

 @param centerY  设置中心点Y
 */
- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


/**
获取中心点Y

 @return 获取中心点Y
 */
- (CGFloat)centerY {
    return self.center.y;
}


@end
