//
//  ParallaxView.h
//  ParallaxMaster
//
//  Created by Duomai on 15/8/17.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *parallaxScrollView;

-(void)layoutParallaxViewByOffset:(CGPoint)offset;

@end
