//
//  ViewController.m
//  LJCardView
//
//  Created by iShareme on 15/7/15.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import "ViewController.h"
#import "LJCardView.h"
@interface ViewController ()<LJCardViewDelegate>

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //设置类型
   
    NSMutableArray *names = [NSMutableArray array];
    for (int i = 0 ; i < 6; i ++) {
        NSString *name = [NSString stringWithFormat:@"%d.jpg", i];
        [names addObject:name];
    }
        
    LJCardView *ljVIew = [[LJCardView alloc] initWithFrame:CGRectMake(35, 40, 305, 300) ImagesWith:names andAutoScroll:0];
    ljVIew.delegate = self;
    [self.view addSubview:ljVIew];
    
}


- (void)selectScrollIndex:(NSInteger)index
{
    NSLog(@"点击的是第%ld个", (long)index);
}


@end
