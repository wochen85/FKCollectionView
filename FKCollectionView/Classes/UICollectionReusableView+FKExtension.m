//
//  UICollectionReusableView+FKExtension.m
//  FKCollectionView
//
//  Created by CHAT on 2019/5/16.
//

#import "UICollectionReusableView+FKExtension.h"
#import "FKCollectionView.h"
#import "FKCollectionReusableCommonView.h"

@implementation UICollectionReusableView (FKExtension)
+(instancetype) fk_viewForCollectionView:(UICollectionView*)collectionView supplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath headerFooterModel:(FKViewModel*)headerFooterModel
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader] || [kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        if ([headerFooterModel isKindOfClass:[FKHeaderFooterCommonModel class]])
        {
            static NSString* idf = @"commonHeadFoot";
            [collectionView registerClass:[FKCollectionReusableCommonView class] forSupplementaryViewOfKind:kind withReuseIdentifier:idf];
            FKCollectionReusableCommonView* headerFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:idf forIndexPath:indexPath];
            headerFooterView.fk_viewModel = headerFooterModel;
            return headerFooterView;
        }
        
        NSString* idf = headerFooterModel.nibName;
        [collectionView registerNib:[UINib nibWithNibName:idf bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:idf];
        UICollectionReusableView* headerFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:idf forIndexPath:indexPath];
        if (nil == headerFooterView)
        {
            [collectionView registerNib:[UINib nibWithNibName:idf bundle:nil] forSupplementaryViewOfKind:kind withReuseIdentifier:idf];
            headerFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:idf forIndexPath:indexPath];
        }
        headerFooterView.fk_viewModel = headerFooterModel;
        return headerFooterView;
    }
    
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView"];
    UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    return view;
}
@end
