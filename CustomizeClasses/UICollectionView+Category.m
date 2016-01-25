//
//  UICollectionView+Category.m
//  DVHPlay
//
//  Created by MacMini on 11/16/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UICollectionView+Category.h"

@implementation UICollectionView (Category)

- (void)registerNibWithName:(NSString *)nibName
{
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
}


@end
