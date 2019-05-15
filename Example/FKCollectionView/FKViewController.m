//
//  FKViewController.m
//  FKCollectionView
//
//  Created by chatv5 on 05/15/2019.
//  Copyright (c) 2019 chatv5. All rights reserved.
//

#import "FKViewController.h"
#import "FKTestCell.h"
#import "FKCollectionView.h"
#import "FKTestCellModel.h"

@interface FKViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<FKCellModel*>* cellModelArr;

@end

@implementation FKViewController

- (NSMutableArray<FKCellModel *> *)cellModelArr
{
    if (!_cellModelArr)
    {
        _cellModelArr = [NSMutableArray array];
    }
    return _cellModelArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<30; i++)
    {
        FKTestCellModel* cellModel = [FKTestCellModel new];
        [self.cellModelArr addObject:cellModel];
        [cellModel.selectedSignal subscribeNext:^(FKCellModel * _Nullable x) {
            NSLog(@"fuck");
        }];
    }
    [self.collectionView fk_configRowModels:self.cellModelArr];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.collectionView fk_configItemSpace:20 countOneLine:3 itemHeight:-1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView registerNib:[UINib nibWithNibName:@"FKTestCell" bundle:nil] forCellWithReuseIdentifier:@"FKTestCell"];
    FKTestCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FKTestCell" forIndexPath:indexPath];
    return cell;
}
    
#pragma mark - UICollectionViewDelegate
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (0==indexPath.row)
//    {
//        return CGSizeMake(100, 100);
//    }
//    return CGSizeMake(50, 50);
//}

@end
