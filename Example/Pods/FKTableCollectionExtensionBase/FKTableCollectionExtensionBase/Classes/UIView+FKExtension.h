//
//  UIView+FKExtension.h
//  Pods
//
//  Created by CHAT on 2018/12/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FKViewModel;
@interface UIView (FKExtension)
@property (nonatomic, strong) FKViewModel* fk_viewModel;
-(void) fk_bindModel:(id) model;
@end

NS_ASSUME_NONNULL_END
