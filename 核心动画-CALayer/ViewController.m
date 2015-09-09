//
//  ViewController.m
//  核心动画-CALayer
//
//  Created by 张庆杰 on 15/7/14.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject]locationInView:self.view];
    
    // 创建一个圆形layer
    CALayer *roundLayer = [CALayer layer];
    
    // 设置layer的位置(点击位置)
    roundLayer.frame = CGRectMake(touchPoint.x, touchPoint.y, 10, 10);
    
    // 给边框一个随机颜色
    roundLayer.borderColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1].CGColor;
    roundLayer.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1].CGColor;
    
    // 边框宽度
    roundLayer.borderWidth = 0.5;
    
    // 裁剪边框为圆形
    roundLayer.cornerRadius = roundLayer.bounds.size.width * 0.5;
    
    [self.view.layer addSublayer:roundLayer];
    [self scaleBegin:roundLayer];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

-(void)scaleBegin:(CALayer *)aLayer
{
    // 放大倍数
    const float maxScale = 100.0;
    if (aLayer.transform.m11 < maxScale) {
        if (1.0 == aLayer.transform.m11) {
            // 将圆形layer放大
            [aLayer setTransform:CATransform3DMakeScale(1.1, 1.1, 1.0)];
        }else{
            [aLayer setTransform:CATransform3DScale(aLayer.transform, 1.1, 1.1, 1.0)];
        }
        
        [self performSelector:_cmd withObject:aLayer afterDelay:0.05];
    }else [aLayer removeFromSuperlayer];
}

// 小问题:如何显示实心的圆

@end
