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
#import <SVProgressHUD/SVProgressHUD.h>

@interface FKViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray<FKSectionModel*>* sectionModelArr = @[].mutableCopy;
    for (int j=0; j<3; j++)
    {
        NSMutableArray<FKCellModel*>* cellModelArr = @[].mutableCopy;

        for (int i=0; i<10; i++)
        {
            NSString* labelText = [NSString stringWithFormat:@"label %@-%@", @(j), @(i)];
            NSString* textFieldText = [NSString stringWithFormat:@"textField %@-%@", @(j), @(i)];
            NSString* buttonText = [NSString stringWithFormat:@"button %@-%@", @(j), @(i)];
            FKTestCellModel* cellModel = [[FKTestCellModel alloc] initWithLabelText:labelText TextFieldText:textFieldText ButtonText:buttonText];
            [cellModelArr addObject:cellModel];
            [cellModel.selectedSignal subscribeNext:^(FKCellModel * _Nullable x) {
                [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了item %@-%@", @(j), @(i)]];
            }];
        }

        NSAttributedString* attStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"通用头部 %@", @(j)] attributes:nil];
        FKHeaderFooterCommonModel* hModel = [[FKHeaderFooterCommonModel alloc] initWithText:attStr bgColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter];
        [hModel.clickSignal subscribeNext:^(id  _Nullable x) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了头部 %@", @(j)]];
        }];

        FKTestFootViewModel* footModel = [FKTestFootViewModel new];
        footModel.buttonText = [NSString stringWithFormat:@"自定义尾部 %@", @(j)];
        [footModel.buttonClickedSignal subscribeNext:^(id  _Nullable x) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了尾部 %@", @(j)]];
        }];

        FKSectionHeaderFooterConfig* headConfig = [[FKSectionHeaderFooterConfig alloc] initWithHeight:50 headFooterModel:hModel];
        FKSectionHeaderFooterConfig* footConfig = [[FKSectionHeaderFooterConfig alloc] initWithHeight:50 headFooterModel:footModel];
        FKSectionModel* sectionModel = [[FKSectionModel alloc] initWithRowModels:cellModelArr headConfig:headConfig footConfig:footConfig];
        [sectionModelArr addObject:sectionModel];
    }
    [self.collectionView fk_configSectionModels:sectionModelArr];
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

@end
