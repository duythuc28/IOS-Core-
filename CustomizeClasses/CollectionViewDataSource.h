//
//  CollectionViewDataSource.h
//  DVHPlay
//
//  Created by MacMini on 11/16/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CollectionViewCellConfigureBlock)(id cell, id item);

@interface CollectionViewDataSource : NSObject<UICollectionViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(CollectionViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
