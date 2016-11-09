//
//  ZHZCustomFollowLayout.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/11/1.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHZCustomFollowLayoutDelegate <NSObject>

@required
/**
 *  cell的布局高度
 */
- (CGFloat)waterLayout:(UICollectionViewLayout *)waterLayout itemWidth:(CGFloat)itemWidth indexPath:(NSIndexPath *)indexPath;
@optional
/**
 *  行间距
 */
- (CGFloat)rowMarginInWaterflowLayout:(UICollectionViewLayout*)layout;
/**
 *  列间距
 */
- (CGFloat)columnMarginInWaterflowLayout:(UICollectionViewLayout*)layout;
/**
 *  列数
 */
- (NSInteger)columnCountInWaterflowLayout:(UICollectionViewLayout*)layout;
/**
 *  collectionView内边距
 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(UICollectionViewLayout*)layout;

@end
@interface ZHZCustomFollowLayout : UICollectionViewLayout

@property (nonatomic,weak) id<ZHZCustomFollowLayoutDelegate> delegate;

@end
