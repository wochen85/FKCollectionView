//
//  WithoutXibCellModel.h
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/7/12.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WithoutXibCellModel : FKCellModel
@property (nonatomic, copy) NSString* labelText;
@property (nonatomic, copy) NSString* buttonText;
@property (nonatomic, strong) RACSubject* btnClickedSignal;

- (instancetype)initWithLabelText:(NSString*)labelText buttonText:(NSString*)buttonText;
@end

NS_ASSUME_NONNULL_END
