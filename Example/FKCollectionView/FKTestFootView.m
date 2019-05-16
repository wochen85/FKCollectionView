//
//  FKTestFootView.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/16.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestFootView.h"
#import "FKCollectionView.h"
#import "FKTestFootViewModel.h"

@interface FKTestFootView()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation FKTestFootView

- (void)fk_bindModel:(FKTestFootViewModel*)model
{
    [self.button setTitle:model.buttonText forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)action:(id)sender
{
    FKTestFootViewModel* viewModel = (FKTestFootViewModel*)self.fk_viewModel;
    [viewModel.buttonClickedSignal sendNext:nil];
}

@end
