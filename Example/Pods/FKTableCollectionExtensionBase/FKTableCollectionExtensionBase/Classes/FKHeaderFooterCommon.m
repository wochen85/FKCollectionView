//
//  FKTableViewHeaderFooterCommon.m
//  Pods
//
//  Created by chat on 2018/11/29.
//

#import "FKHeaderFooterCommon.h"
#import "FKHeaderFooterCommonModel.h"

@interface FKHeaderFooterCommon()
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UITapGestureRecognizer* tapGes;
@end

@implementation FKHeaderFooterCommon

- (UILabel *)label
{
    if (nil == _label)
    {
        _label = [UILabel new];
    }
    return _label;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (UITapGestureRecognizer *)tapGes
{
    if (nil==_tapGes)
    {
        _tapGes = [UITapGestureRecognizer new];
    }
    return _tapGes;
}

-(void) configSubViews
{
    [self addSubview:self.label];
    self.label.userInteractionEnabled = YES;
    [self.label addGestureRecognizer:self.tapGes];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

- (void)fk_bindModel:(FKHeaderFooterCommonModel *)headerFooterModel
{
    self.label.backgroundColor = headerFooterModel.bgColor;
    self.label.attributedText = headerFooterModel.text;
    self.label.textAlignment = headerFooterModel.textAlignment;
}

@end
