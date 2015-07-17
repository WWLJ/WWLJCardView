//
//  LJCardView.m
//  LJCardView
//
//  Created by iShareme on 15/7/15.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import "LJCardView.h"
#import "iCarousel.h"
#import "MyImageView.h"
@interface LJCardView ()<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carousel;
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation LJCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}



/// 接收图片名称的数组,自动滚动的速度
- (instancetype)initWithFrame:(CGRect)frame ImagesWith:(NSMutableArray *)names andAutoScroll:(CGFloat)autoScroll
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.items = [NSMutableArray array];
        self.items = names;
        
        
        self.carousel = [[iCarousel alloc] initWithFrame:self.bounds];
        self.carousel.backgroundColor = [UIColor blueColor];
        self.carousel.clipsToBounds = YES;
        self.carousel.type = iCarouselTypeRotary;
        self.carousel.pagingEnabled = YES;
        self.carousel.delegate = self;
        self.carousel.dataSource = self;
        self.carousel.autoscroll = autoScroll;
        
        [self addSubview:self.carousel];
    }
    return self;
}





#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [self.items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
#warning 这块改成网络请求图片就行了,传进来的数组是url, 或者是一个包含多个model的数组,然后地址单独处理一下,可以把这个字典也当做参数传递,  如果要实现这个方法就需要  自定义UIImageView,  给他添加一个字典或者model的属性  就可以带值了
    NSString * imgName = [self.items objectAtIndex:index];
    
    
#warning 改变imageView的类型,自定义   加一个覆盖层View
    MyImageView * imgV = [[MyImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgV setContentMode:UIViewContentModeScaleToFill];
    imgV.image = [UIImage imageNamed:imgName];
//#error 这块提前设置背后的比例小一点
    imgV.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
    if (index == 0) {
        //第一张图的view必须是亮色的,  调节颜色的亮暗  改变颜色就可以了
        imgV.overView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
//#error 第一张原始大小,当前视图
        imgV.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    }
    
    return imgV;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
#warning 点击的是哪一个
    if ([self.delegate respondsToSelector:@selector(selectScrollIndex:)]) {
        [self.delegate selectScrollIndex:index];
    }
}



#warning 加阴影的方法
- (void)carouselDidScroll:(iCarousel *)carousel
{
    for (MyImageView *view1 in carousel.visibleItemViews) {
            if (view1 == (UIImageView *)carousel.currentItemView) {
                view1.overView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
//#error 如果是当前视图,恢复原来大小
                view1.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
            }else{
                view1.overView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
//#error 不是,给成缩放大小
                view1.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
            }
        }
    
}






@end
