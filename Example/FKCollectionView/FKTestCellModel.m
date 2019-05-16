//
//  FKTestCellModel.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/15.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestCellModel.h"

@implementation FKTestCellModel
- (instancetype)initWithLabelText:(NSString*)labelText TextFieldText:(NSString*)textFieldText ButtonText:(NSString*)buttonText
{
    self = [super init];
    if (self) {
        _labelText = labelText;
        _textFieldText = textFieldText;
        _buttonText = buttonText;
    }
    return self;
}
@end
