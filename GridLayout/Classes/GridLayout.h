//
//  GridLayout.h
//
//  Created by Wai Cheung on 12/6/15.
//
//

#import <UIKit/UIKit.h>

@interface GridLayout : UICollectionViewFlowLayout<UICollectionViewDelegateFlowLayout>
@property (nonatomic) IBInspectable NSInteger column;
@property (nonatomic) IBInspectable CGFloat padding;
@property (nonatomic) IBInspectable CGFloat aspectRatio;
@property (weak, nonatomic) IBOutlet id<UICollectionViewDelegateFlowLayout> delegate;
@end
