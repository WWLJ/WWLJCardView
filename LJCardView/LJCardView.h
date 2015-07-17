//
//  LJCardView.h
//  LJCardView
//
//  Created by iShareme on 15/7/15.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJCardViewDelegate <NSObject>
#warning 这个代理里面是可以带model.,或者别的信息
- (void)selectScrollIndex:(NSInteger)index;
@end

@interface LJCardView : UIView

@property (nonatomic, assign)id<LJCardViewDelegate>delegate;

/// 接收图片名称的数组,自动滚动的速度
- (instancetype)initWithFrame:(CGRect)frame ImagesWith:(NSMutableArray *)names andAutoScroll:(CGFloat)autoScroll;


@end
