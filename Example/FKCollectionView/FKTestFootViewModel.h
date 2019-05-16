//
//  FKTestFootViewModel.h
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/16.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import <FKTableCollectionExtensionBase/FKTableCollectionExtensionBase.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKTestFootViewModel : FKViewModel
@property (nonatomic, copy) NSString* buttonText;
@property (nonatomic, strong) RACSubject* buttonClickedSignal;
@end

NS_ASSUME_NONNULL_END
