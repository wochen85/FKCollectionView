//
//  FKCollectionReusableCommonView.m
//  FKCollectionView
//
//  Created by 陈海涛 on 2019/5/16.
//

#import "FKCollectionReusableCommonView.h"
#import "FKHeaderFooterCommon.h"
#import "UIView+FKExtension.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "FKHeaderFooterCommonModel.h"

@interface FKCollectionReusableCommonView()
@property (nonatomic, strong) FKHeaderFooterCommon* childView;
@end

@implementation FKCollectionReusableCommonView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self configSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configSubViews];
    }
    return self;
}

- (FKHeaderFooterCommon *)childView
{
    if (!_childView)
    {
        _childView = [FKHeaderFooterCommon new];
    }
    return _childView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.childView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

-(void) configSubViews
{
    [self addSubview:self.childView];
}

- (void)fk_bindModel:(FKHeaderFooterCommonModel*)headerFooterModel
{
    [self.childView fk_bindModel:headerFooterModel];
    [[self.childView.tapGes.rac_gestureSignal takeUntil:self.rac_prepareForReuseSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        [headerFooterModel.clickSignal sendNext:x];
    }];
}

@end
