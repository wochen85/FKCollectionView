//
//  FKTableViewRowModel.h
//  FKTableView
//
//  Created by CHAT on 2018/10/18.
//  Copyright © 2018 CHAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@class RACSubject;
@interface FKCellModel : FKViewModel
@property (nonatomic, strong, readonly) RACSubject<FKCellModel*>* selectedSignal;
@end

NS_ASSUME_NONNULL_END
