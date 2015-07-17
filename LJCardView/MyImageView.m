//
//  MyImageView.m
//  LJCardView
//
//  Created by iShareme on 15/7/15.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.overView = [[UIView alloc] initWithFrame:self.bounds];
        self.overView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addSubview:self.overView];
        
    }
    return self;
}

@end
