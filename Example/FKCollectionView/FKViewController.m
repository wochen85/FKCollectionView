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
#import "FKTestHeadViewModel.h"
#import "FKTestFootViewModel.h"

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
    for (int i=1; i<=10; i++)
    {
        NSString* labelText = [NSString stringWithFormat:@"label %@", @(i)];
        NSString* textFieldText = [NSString stringWithFormat:@"textField %@", @(i)];
        NSString* buttonText = [NSString stringWithFormat:@"button %@", @(i)];
        FKTestCellModel* cellModel = [[FKTestCellModel alloc] initWithLabelText:labelText TextFieldText:textFieldText ButtonText:buttonText];
        [self.cellModelArr addObject:cellModel];
        [cellModel.selectedSignal subscribeNext:^(FKCellModel * _Nullable x) {
            NSLog(@"点击了item");
        }];
    }
    
    FKTestHeadViewModel* headModel = [FKTestHeadViewModel new];
    headModel.buttonText = @"head button";
    
    FKTestFootViewModel* footModel = [FKTestFootViewModel new];
    footModel.buttonText = @"foot button";
    
    FKSectionHeaderFooterConfig* headConfig = [[FKSectionHeaderFooterConfig alloc] initWithHeight:50 headFooterModel:headModel];
    FKSectionHeaderFooterConfig* footConfig = [[FKSectionHeaderFooterConfig alloc] initWithHeight:50 headFooterModel:footModel];
    FKSectionModel* section1 = [[FKSectionModel alloc] initWithRowModels:self.cellModelArr headConfig:headConfig footConfig:footConfig];
    [self.collectionView fk_configSectionModels:@[section1, section1, section1]];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.collectionView fk_configItemSpace:10 countOneLine:3 itemHeight:-1];
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
