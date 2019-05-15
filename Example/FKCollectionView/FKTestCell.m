//
//  FKTestCell.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/15.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestCell.h"
#import "Masonry.h"

@implementation FKTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor lightGrayColor];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.mas_equalTo(0);
//        make.width.height.mas_equalTo(200);
//    }];
}

//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
//{
//    layoutAttributes.size = CGSizeMake(200, 200);
//    return layoutAttributes;
//}

@end
