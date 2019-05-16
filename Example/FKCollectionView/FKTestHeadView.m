//
//  FKTestHeadView.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/16.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestHeadView.h"
#import "FKCollectionView.h"
#import "FKTestHeadViewModel.h"

@interface FKTestHeadView()
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation FKTestHeadView

- (void)fk_bindModel:(FKTestHeadViewModel*)model
{
    [self.button setTitle:model.buttonText forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)action:(id)sender {
}

@end
