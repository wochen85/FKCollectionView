//
//  WithoutXibViewController.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/7/12.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "WithoutXibViewController.h"
#import "WithoutXibCellModel.h"
#import <SVProgressHUD.h>
#import <FKCollectionView.h>
#import "WithoutXibHeadFootModel.h"

@interface WithoutXibViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation WithoutXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray<FKSectionModel*>* sectionModelArr = @[].mutableCopy;
    for (int j=0; j<3; j++)
    {
        NSMutableArray<FKCellModel*>* cellModelArr = @[].mutableCopy;
        
        for (int i=0; i<10; i++)
        {
            NSString* labelText = [NSString stringWithFormat:@"label %@-%@", @(j), @(i)];
            NSString* buttonText = [NSString stringWithFormat:@"button %@-%@", @(j), @(i)];
            WithoutXibCellModel* cellModel = [[WithoutXibCellModel alloc] initWithLabelText:labelText buttonText:buttonText];
            [cellModelArr addObject:cellModel];
            [cellModel.selectedSignal subscribeNext:^(FKCellModel * _Nullable x) {
                [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了item %@-%@", @(j), @(i)]];
            }];
            [cellModel.btnClickedSignal subscribeNext:^(id  _Nullable x) {
                [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了button %@-%@", @(j), @(i)]];
            }];
        }
        
        NSAttributedString* attStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"通用头部 %@", @(j)] attributes:nil];
        FKHeaderFooterCommonModel* hModel = [[FKHeaderFooterCommonModel alloc] initWithText:attStr bgColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter];
        [hModel.clickSignal subscribeNext:^(id  _Nullable x) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了头部 %@", @(j)]];
        }];
        
        WithoutXibHeadFootModel* footModel = [WithoutXibHeadFootModel new];
        footModel.text = [NSString stringWithFormat:@"自定义尾部 %@", @(j)];
//        [footModel.buttonClickedSignal subscribeNext:^(id  _Nullable x) {
//            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"点击了尾部 %@", @(j)]];
//        }];
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
