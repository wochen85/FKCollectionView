//
//  UICollectionViewCell+FKExtension.h
//  FKCollectionView
//
//  Created by CHAT on 2019/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FKCellModel;
@interface UICollectionViewCell (FKExtension)
+ (instancetype) fk_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath cellModel:(FKCellModel*)cellModel;

@property (nonatomic, strong, readonly) FKCellModel* fk_cellModel;
@end

NS_ASSUME_NONNULL_END
