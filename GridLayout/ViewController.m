//
//  ViewController.m
//  GridLayout
//
//  Created by Cheung Chun Wai on 13/6/15.
//  Copyright (c) 2015 Sakiwei. All rights reserved.
//

#import "ViewController.h"
#import "GridLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *kCellId = @"CellId";
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSLog(@"%s", __PRETTY_FUNCTION__);
  
  GridLayout *layout = (GridLayout *)self.collectionViewLayout;
  layout.column ++;
  
  [self.collectionView performBatchUpdates:^{
    [self.collectionView.collectionViewLayout invalidateLayout];
  } completion:^(BOOL finished) {
  }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 100;
}

@end
