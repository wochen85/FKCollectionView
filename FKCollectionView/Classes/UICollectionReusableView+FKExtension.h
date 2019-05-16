//
//  UICollectionReusableView+FKExtension.h
//  FKCollectionView
//
//  Created by CHAT on 2019/5/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FKViewModel;
@interface UICollectionReusableView (FKExtension)
+(instancetype) fk_viewForCollectionView:(UICollectionView*)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath headerFooterModel:(FKViewModel*)headerFooterModel;
@end

NS_ASSUME_NONNULL_END
