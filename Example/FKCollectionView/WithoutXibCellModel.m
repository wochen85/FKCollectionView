//
//  WithoutXibCellModel.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/7/12.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "WithoutXibCellModel.h"

@implementation WithoutXibCellModel

- (RACSubject *)btnClickedSignal
{
    if (!_btnClickedSignal)
    {
        _btnClickedSignal = [RACSubject subject];
    }
    return _btnClickedSignal;
}

- (instancetype)initWithLabelText:(NSString*)labelText buttonText:(NSString*)buttonText
{
    self = [super init];
    if (self) {
        _labelText = labelText;
        _buttonText = buttonText;
    }
    return self;
}
@end
