//
//  ZeroCodeTableView.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/30/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

//docs: https://gist.github.com/lostincode/38e6b0a612a3b33f6f7b
//https://www.codefellows.org/blog/tech-tip-clean-up-your-code-with-lighter-view-controllers-in-swift

typealias CollectionViewCellConfigureBlock = (cell:UICollectionViewCell, item:AnyObject?) -> ()

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var items:NSArray = []
    var itemIdentifier:String?
    var configureCellBlock:CollectionViewCellConfigureBlock?
    
    init(items: NSArray, cellIdentifier: String, configureBlock: CollectionViewCellConfigureBlock) {
        self.items = items
        self.itemIdentifier = cellIdentifier
        self.configureCellBlock = configureBlock
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.itemIdentifier!, forIndexPath: indexPath) as UICollectionViewCell
        let item: AnyObject = self.itemAtIndexPath(indexPath)
        
        if (self.configureCellBlock != nil) {
            self.configureCellBlock!(cell: cell, item: item)
        }
        
        return cell
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.items[indexPath.row]
    }
}