//
//  WithoutXibCell.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/7/12.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "WithoutXibCell.h"
#import <Masonry.h>
#import <FKCollectionView.h>
#import "WithoutXibCellModel.h"

@interface WithoutXibCell()
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIButton* button;
@end

@implementation WithoutXibCell

- (UILabel *)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"点我" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor blueColor];
        [_button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

-(void) clicked
{
    WithoutXibCellModel* model = (WithoutXibCellModel*)self.fk_cellModel;
    [model.btnClickedSignal sendNext:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (void)fk_bindModel:(WithoutXibCellModel*)model
{
    self.label.text = model.labelText;
    [self.button setTitle:model.buttonText forState:UIControlStateNormal];
}

-(void) configSubViews
{
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.button];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.equalTo(self.contentView).multipliedBy(0.5);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.equalTo(self.label.mas_bottom);
        make.bottom.equalTo(self.contentView);
    }];
}

@end
