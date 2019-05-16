//
//  UICollectionView+FKExtension.h
//  FKCollectionView
//
//  Created by CHAT on 2019/5/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FKCellModel;
@class FKSectionModel;
@class FKViewModel;
@interface UICollectionView (FKExtension)
-(void) fk_configRowModels:(NSArray<FKCellModel*>*) rowModels;
-(void) fk_configSectionModels:(NSArray<FKSectionModel*>*) sectionModels;
-(void) fk_configHeader:(nullable FKViewModel*) headerModel height:(CGFloat) height;
-(void) fk_configFooter:(FKViewModel*) footerModel height:(CGFloat) height;
-(void) fk_configItemSpace:(CGFloat) itemSpace countOneLine:(NSUInteger) countOneLine itemHeight:(CGFloat) itemHeight;
@end

NS_ASSUME_NONNULL_END
