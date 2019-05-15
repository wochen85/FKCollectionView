#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FKCollectionView.h"
#import "UICollectionView+FKExtension.h"
#import "UICollectionViewCell+FKExtension.h"

FOUNDATION_EXPORT double FKCollectionViewVersionNumber;
FOUNDATION_EXPORT const unsigned char FKCollectionViewVersionString[];

