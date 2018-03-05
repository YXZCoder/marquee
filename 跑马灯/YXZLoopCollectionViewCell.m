//
//  YXZLoopCollectionViewCell.m
//  跑马灯
//
//  Created by 杨晓周 on 2018/2/9.
//  Copyright © 2018年 杨晓周. All rights reserved.
//

#import "YXZLoopCollectionViewCell.h"

@implementation YXZLoopCollectionViewCell
{
    UILabel *_label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setView];
    }
    return self;
}

- (void)setView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    label.textColor = [UIColor redColor];
    [self.contentView addSubview:label];
    _label = label;
}

- (void)configureLabel:(NSString *)string
{
    _label.text = string;
}

@end
