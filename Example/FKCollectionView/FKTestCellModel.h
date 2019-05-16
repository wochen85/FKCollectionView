//
//  FKTestCellModel.h
//  FKCollectionView_Example
//
//  Created by CHAT on 2019/5/15.
//  Copyright © 2019 chatv5. All rights reserved.
//

#import "FKCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FKTestCellModel : FKCellModel
@property (nonatomic, copy) NSString* labelText;
@property (nonatomic, copy) NSString* textFieldText;
@property (nonatomic, copy) NSString* buttonText;

- (instancetype)initWithLabelText:(NSString*)labelText TextFieldText:(NSString*)textFieldText ButtonText:(NSString*)buttonText;
@end

NS_ASSUME_NONNULL_END
