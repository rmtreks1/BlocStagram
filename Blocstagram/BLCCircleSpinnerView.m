//
//  BLCCircleSpinnerView.m
//  Blocstagram
//
//  Created by Roshan Mahanama on 23/04/2015.
//  Copyright (c) 2015 RMTREKS. All rights reserved.
//

#import "BLCCircleSpinnerView.h"

@interface BLCCircleSpinnerView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end





@implementation BLCCircleSpinnerView


- (CAShapeLayer*)circleLayer {
    if (!_circleLayer) {
        CGPoint arcCenter = CGPointMake(self.radius+self.strokeThickness/2+5, self.radius+self.strokeThickness/2+5);
        CGRect rect = CGRectMake(0, 0, arcCenter.x*2, arcCenter.y*2);
        
        UIBezierPath* smoothedPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:self.radius startAngle:M_PI*3/2 endAngle:M_PI/2+M_PI*5 clockwise:YES];
        
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.contentsScale = [[UIScreen mainScreen] scale];
        _circleLayer.frame = rect;
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        _circleLayer.strokeColor = self.strokeColor.CGColor; // ???
        _circleLayer.lineWidth = self.strokeThickness;
        _circleLayer.lineCap = kCALineCapRound;
        _circleLayer.lineJoin = kCALineJoinBevel;
        _circleLayer.path = smoothedPath.CGPath;
        
        CALayer *maskLayer = [CALayer layer];
        maskLayer.contents = (id)[[UIImage imageNamed:@"angle-mask"] CGImage];
        maskLayer.frame = _circleLayer.bounds;
        _circleLayer.mask = maskLayer;
        
        CFTimeInterval animationDuration = 1;
        CAMediaTimingFunction *linearCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = @0; // why does this need an @ as a prefix?
        animation.toValue = @(M_PI*2);
        animation.duration = animationDuration;
        animation.timingFunction = linearCurve;
        animation.removedOnCompletion = NO;
        animation.repeatCount = INFINITY;
        animation.fillMode = kCAFillModeForwards;
        animation.autoreverses = NO;
        [_circleLayer.mask addAnimation:animation forKey:@"rotate"];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = INFINITY;
        animationGroup.removedOnCompletion = NO;
        animationGroup.timingFunction = linearCurve;
        
        CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
        strokeStartAnimation.fromValue = @0.015;
        strokeStartAnimation.toValue = @0.515;
        
        CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.fromValue = @0.485;
        strokeEndAnimation.toValue =@0.985;
        
        animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
        [_circleLayer addAnimation:animationGroup forKey:@"progress"];
        
    }
    
    return _circleLayer;
}






@end
