//
//  FKViewModel.m
//  Pods
//
//  Created by CHAT on 2019/5/16.
//

#import "FKViewModel.h"

@implementation FKViewModel
- (NSString *)nibName
{
    if (!_nibName)
    {
        NSString* selfString = NSStringFromClass([self class]);
        NSArray<NSString*>* arr = [selfString componentsSeparatedByString:@"Model"];
        if (arr.count)
        {
            _nibName = arr[0];
        }
        else
        {
            _nibName = @"";
        }
    }
    return _nibName;
}
@end
