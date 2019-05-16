//
//  FKTestFootViewModel.m
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/16.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKTestFootViewModel.h"

@implementation FKTestFootViewModel

- (RACSubject *)buttonClickedSignal
{
    if (!_buttonClickedSignal)
    {
        _buttonClickedSignal = [RACSubject subject];
    }
    return _buttonClickedSignal;
}

@end
