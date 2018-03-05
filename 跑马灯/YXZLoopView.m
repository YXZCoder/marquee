//
//  YXZLoopView.m
//  跑马灯
//
//  Created by 杨晓周 on 2018/2/9.
//  Copyright © 2018年 杨晓周. All rights reserved.
//

#import "YXZLoopView.h"
#import "YXZLoopCollectionViewCell.h"


NSString *const WZZLoopCellID = @"LoopCell";


@interface YXZLoopView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *cellData;     // 模型数组

@end

@implementation YXZLoopView
{
    NSArray *_strings;
    NSInteger _count;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setCollectionView];
    }
    
    return self;
}

- (void)setCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.collectionView.bounces = NO;
    layout.collectionView.showsVerticalScrollIndicator = NO;
    layout.collectionView.showsHorizontalScrollIndicator = NO;
    layout.collectionView.pagingEnabled = YES;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor grayColor];
    [_collectionView registerClass:[YXZLoopCollectionViewCell class] forCellWithReuseIdentifier:WZZLoopCellID];
    [self addSubview:_collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXZLoopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WZZLoopCellID forIndexPath:indexPath];
    NSInteger index = [_cellData[indexPath.row] integerValue];
    NSString *string = _strings[index];
    [cell configureLabel:string];
    return cell;
}

    
- (void)configureString:(NSArray *)strings
{
    _strings = strings;
    
    self.cellData = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        for (int j=0; j<strings.count; j++) {
            [self.cellData addObject:@(j)];
        }
    }
    
    [_collectionView reloadData];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:5 * _strings.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    [self performSelector:@selector(beginScrollview) withObject:nil afterDelay:3];
}
    
- (void)beginScrollview
{
    
    if (self.cellData.count > 0) {
        NSArray *array = [self.collectionView indexPathsForVisibleItems];
        if (array.count == 0) return ;
        
        NSIndexPath *indexPath = array[0];
        NSInteger row = indexPath.row;
        NSLog(@"***%ld",(long)row);
        if (row % _strings.count == 0) {
            row = 5 * _strings.count;
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
        }
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        
        [self performSelector:@selector(beginScrollview) withObject:nil afterDelay:2];
    }
    
}


@end
