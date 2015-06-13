//
//  GridLayout.m
//
//  Created by Wai Cheung on 12/6/15.
//
//

#import "GridLayout.h"

@implementation GridLayout

- (instancetype)init {
    if ((self = [super init])) {
        self.column = 2;
        self.padding = 2.f;
        self.aspectRatio = 1.0f;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

#pragma mark - UICollectionViewDelegateFlowLayout
////////////////////////////////////////////////////////////////////////////
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  
    CGFloat width = 0.0;
    if (self.column > 1) {
        width = (collectionView.frame.size.width-self.padding*(self.column-1))/self.column;
    } else {
        width = collectionView.frame.size.width;
    }
    return CGSizeMake(floorf(width), width*self.aspectRatio);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.padding;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.padding;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

// forward collection view delegate methods to this instance delegate
- (BOOL)respondsToSelector:(SEL)aSelector
{
  return [super respondsToSelector:aSelector] || [self.delegate respondsToSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
  if ([self.delegate respondsToSelector:[anInvocation selector]]) {
    [anInvocation invokeWithTarget:self.delegate];
  } else {
    [super forwardInvocation:anInvocation];
  }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
  NSMethodSignature *signature = [super methodSignatureForSelector:selector];
  if (!signature) {
    signature = [(NSObject*)self.delegate methodSignatureForSelector:selector];
  }
  return signature;
}

@end
