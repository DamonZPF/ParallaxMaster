//
//  ParallaxView.m
//  ParallaxMaster
//
//  Created by Duomai on 15/8/17.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "ParallaxView.h"
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0  blue:b/255.0  alpha:a]
@implementation ParallaxView

-(void)awakeFromNib{
    self.parallaxScrollView.backgroundColor = rgba(241, 241, 241, 1);
    self.parallaxScrollView.alwaysBounceHorizontal = YES;
}

-(void)layoutParallaxViewByOffset:(CGPoint)offset{
   
    if (offset.y > 0) {
        CGRect scrollViewFrame = self.parallaxScrollView.frame;
        scrollViewFrame.origin.y = MAX(offset.y * 0.7, 0);
        self.parallaxScrollView.frame = scrollViewFrame;
        self.clipsToBounds = YES;
    }else{
        CGFloat delta = .0f;
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        delta = fabs(MIN(0, offset.y));
        frame.origin.y -= delta;
        frame.size.height += delta;
        self.parallaxScrollView.frame = frame;
        self.clipsToBounds = NO;
    }
    
  
}


@end
