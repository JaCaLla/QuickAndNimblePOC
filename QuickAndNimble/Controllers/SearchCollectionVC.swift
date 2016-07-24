//
//  SearchCollectionVC.swift
//  QuickAndNimble
//
//  Created by JAVIER CALATRAVA LLAVERIA on 24/07/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class SearchCollectionVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var clvCollection: UICollectionView!
    @IBOutlet weak var layCollection: UICollectionViewFlowLayout!
    @IBOutlet weak var scbSearchBar: UISearchBar!
    
    
    
    var arrDataSource:[String]=[]
    var arrDataSourceFiltered:[String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self._setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Helpers
    func setDataSource(dataSource:NSArray){
        self.arrDataSource = dataSource as! [String]
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrDataSource.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:CellCVC = collectionView.dequeueReusableCellWithReuseIdentifier("CellCVCID", forIndexPath: indexPath) as! CellCVC
        
        cell.lblName.text = self.arrDataSource[indexPath.row]
        
        return cell
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    
    // MARK: - UICollectionViewDelegate

    // MARK: - UISearchBarDelegate
    
    
    // MARK: - Private / Internal
    func _setupUI() {
        
        self.layCollection.itemSize=CGSizeMake(100, 100);
        self.layCollection.minimumInteritemSpacing = 4;
        self.layCollection.minimumLineSpacing = 0;
        self.layCollection.scrollDirection = .Vertical;
        
        self.clvCollection.delegate=self
        self.clvCollection.dataSource=self;
        
    }
    
}
