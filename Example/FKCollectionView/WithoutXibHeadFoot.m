//
//  WithoutXibHeadFoot.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/7/12.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "WithoutXibHeadFoot.h"
#import <Masonry.h>
#import <FKCollectionView.h>
#import "WithoutXibHeadFootModel.h"

@interface WithoutXibHeadFoot()
@property (nonatomic, strong) UILabel* label;
@end

@implementation WithoutXibHeadFoot

- (UILabel *)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor orangeColor];
    }
    return _label;
}

- (void)fk_bindModel:(WithoutXibHeadFootModel*)model
{
    self.label.text = model.text;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

-(void) configSubViews
{
    [self addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}
@end
