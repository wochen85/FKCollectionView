//
//  UICollectionViewCell+FKExtension.m
//  FKCollectionView
//
//  Created by CHAT on 2019/5/15.
//

#import "UICollectionViewCell+FKExtension.h"
#import "FKCellModel.h"
#import <objc/runtime.h>
#import "UIView+FKExtension.h"

@implementation UICollectionViewCell (FKExtension)

#pragma mark - 存取器
- (FKCellModel *)fk_cellModel
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFk_cellModel:(FKCellModel *)cellModel
{
    objc_setAssociatedObject(self, @selector(fk_cellModel), cellModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self fk_bindModel:cellModel];
}

+ (instancetype) fk_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath cellModel:(FKCellModel*)cellModel
{
    NSString* idf = cellModel.nibOrClassName;
    NSString* nibPath = [[NSBundle mainBundle] pathForResource:idf ofType:@"nib"];
    if (nibPath)
    {
        [collectionView registerNib:[UINib nibWithNibName:idf bundle:nil] forCellWithReuseIdentifier:idf];
    }
    else
    {
        [collectionView registerClass:NSClassFromString(idf) forCellWithReuseIdentifier:idf];
    }
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:idf forIndexPath:indexPath];
    cell.fk_cellModel = cellModel;
    return cell;
}
@end
