//
//  UICollectionView+FKExtension.m
//  FKCollectionView
//
//  Created by CHAT on 2019/5/15.
//

#import "UICollectionView+FKExtension.h"
#import <objc/runtime.h>
#import "FKCellModel.h"
#import "FKSectionModel.h"
#import "FKHeaderFooterCommonModel.h"
#import "UICollectionViewCell+FKExtension.h"
//#import "UIView+FKExtension.h"

@interface UICollectionView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray<FKSectionModel*>* fk_sectionModels;
@end

@implementation UICollectionView (FKExtension)

#pragma mark - 存取器

- (NSArray<FKSectionModel *> *)fk_sectionModels
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFk_sectionModels:(NSArray<FKSectionModel *> *)sectionModels
{
    objc_setAssociatedObject(self, @selector(fk_sectionModels), sectionModels, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void) fk_configRowModels:(NSArray<FKCellModel*>*) rowModels
{
    FKSectionModel* sectionModel = [[FKSectionModel alloc] initWithRowModels:rowModels headConfig:nil footConfig:nil];
    
    self.fk_sectionModels = @[sectionModel];
    self.dataSource = self;
    self.delegate = self;
    [self reloadData];
}

-(void) fk_configSectionModels:(NSArray<FKSectionModel*>*) sectionModels
{
    self.fk_sectionModels = sectionModels;
    self.dataSource = self;
    self.delegate = self;
    [self reloadData];
}

-(void) fk_configHeader:(nullable FKHeaderFooterModel*) headerModel height:(CGFloat) height
{
}

-(void) fk_configFooter:(FKHeaderFooterModel*) footerModel height:(CGFloat) height
{
}

-(void) fk_configItemSpace:(CGFloat) itemSpace countOneLine:(NSUInteger) countOneLine itemHeight:(CGFloat) itemHeight
{
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*) self.collectionViewLayout;
    layout.minimumLineSpacing = itemSpace;
    layout.minimumInteritemSpacing = itemSpace;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat width = (selfWidth-(countOneLine+1)*itemSpace)/countOneLine;
    layout.itemSize = CGSizeMake(width, itemHeight>0?itemHeight:width);
    layout.sectionInset = UIEdgeInsetsMake(itemSpace,itemSpace,itemSpace,itemSpace);
}

-(FKCellModel*) rowModel:(NSIndexPath*)indexPath
{
    return self.fk_sectionModels[indexPath.section].rowModels[indexPath.row];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.fk_sectionModels.count;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fk_sectionModels[section].rowModels.count;
}
#pragma clang diagnostic pop

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [UICollectionViewCell fk_collectionView:collectionView cellForItemAtIndexPath:indexPath cellModel:[self rowModel:indexPath]];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self rowModel:indexPath].selectedSignal sendNext:[self rowModel:indexPath]];
    });
}

@end
