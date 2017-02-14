//
//  KeepFindViewController.m
//  KeepGuidePage
//
//  Created by Michael on 16/7/22.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "KeepFindViewController.h"
#import "MYCollectionViewStreamLineFlowLayout.h"
#import "MYGroupIssueLabelCell.h"
#import "NSString+Extension.h"
#import "Constant.h"

@interface KeepFindViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) CGFloat horizontalSpacing;
@property (nonatomic, assign) CGFloat verticalSpacing;

@end

@implementation KeepFindViewController

static NSString * const reusableGroupIssueLabelCellIdentifier = @"MYGroupIssueLabelCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.horizontalSpacing = 15.f;
    self.verticalSpacing = 10.f;
    self.items = @[@"asdfjkalsdf",@"asdfjkalsdf",@"asdfjkalsdf",@"asdfjkalsdf",@"asdfjkalsdf",@"asdfjkalsdf"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYGroupIssueLabelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusableGroupIssueLabelCellIdentifier forIndexPath:indexPath];
    cell.detailLabel.text = self.items[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *textString = self.items[indexPath.row];
    CGFloat width = [textString mySizeWithFont:[UIFont systemFontOfSize:13.f]].width + 24.f;
    return CGSizeMake(width, 33.f);
}

#pragma mark - Lazy Load
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        MYCollectionViewStreamLineFlowLayout *flowLayout = [[MYCollectionViewStreamLineFlowLayout alloc] init];
        flowLayout.minimumInteritemSpacing = self.horizontalSpacing;
        flowLayout.minimumLineSpacing = self.verticalSpacing;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, KeepScreenWidth, KeepScreenHeight) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[MYGroupIssueLabelCell class] forCellWithReuseIdentifier:reusableGroupIssueLabelCellIdentifier];
    }
    return _collectionView;
}

- (NSArray *)items {
    if (!_items) {
        _items = [NSArray array];
    }
    return _items;
}

@end
