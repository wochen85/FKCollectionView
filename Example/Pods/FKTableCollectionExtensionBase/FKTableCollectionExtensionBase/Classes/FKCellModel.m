//
//  FKTableViewRowModel.m
//  FKTableView
//
//  Created by CHAT on 2018/10/18.
//  Copyright © 2018 CHAT. All rights reserved.
//

#import "FKCellModel.h"

@interface FKCellModel()
@property (nonatomic, strong) RACSubject<FKCellModel*>* selectedSignal;
@end

@implementation FKCellModel
- (RACSubject<FKCellModel *> *)selectedSignal
{
    if (!_selectedSignal)
    {
        _selectedSignal = [RACSubject subject];
    }
    return _selectedSignal;
}

@end
