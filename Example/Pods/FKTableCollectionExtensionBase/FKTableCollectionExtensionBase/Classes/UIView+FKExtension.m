//
//  UIView+FKExtension.m
//  Pods
//
//  Created by CHAT on 2018/12/5.
//

#import "UIView+FKExtension.h"
#import <objc/runtime.h>
#import "FKViewModel.h"

@implementation UIView (FKExtension)

#pragma mark - 存取器
- (FKViewModel *)fk_viewModel
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFk_viewModel:(FKViewModel *)viewModel
{
    objc_setAssociatedObject(self, @selector(fk_viewModel), viewModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self fk_bindModel:viewModel];
}

-(void) fk_bindModel:(id) model
{
    
}
@end
