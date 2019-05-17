//
//  FKTestCell.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/15.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestCell.h"
#import "FKCollectionView.h"
#import "FKTestCellModel.h"

@interface FKTestCell()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation FKTestCell

- (void)fk_bindModel:(FKTestCellModel*)model
{
    self.label.text = model.labelText;
    self.textField.text = model.textFieldText;
    [self.button setTitle:model.buttonText forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
}

//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
//{
//    layoutAttributes.size = CGSizeMake(200, 200);
//    return layoutAttributes;
//}

@end
