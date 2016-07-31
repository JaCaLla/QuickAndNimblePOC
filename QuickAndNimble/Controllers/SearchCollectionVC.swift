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
    
    
    
    var arrDataSource:[String]=["Barney","Brain","Daffy","Electric","George","Gizmo","Greta","Lenny","Secretary","Stripe","Tatto"]//[]
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
        
        self._refreshView()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let _arrDataSourceFiltered = self.arrDataSourceFiltered{
            return _arrDataSourceFiltered.count
        }else{
            return self.arrDataSource.count
        }
        
        
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:CellCVC = collectionView.dequeueReusableCellWithReuseIdentifier("CellCVCID", forIndexPath: indexPath) as! CellCVC
        
        
        if let _arrDataSourceFiltered = self.arrDataSourceFiltered{
            cell.lblName.text = _arrDataSourceFiltered[indexPath.row]
        }else{
            cell.lblName.text = self.arrDataSource[indexPath.row]
        }
        
        cell.imvPhoto.image = UIImage(named: cell.lblName.text!)
        
        cell.imvPhoto.layer.cornerRadius = 10
        cell.imvPhoto.clipsToBounds = true
        
        return cell
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    // MARK: - UICollectionViewDelegate
    
    // MARK: - UISearchBarDelegate
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.scbSearchBar.setShowsCancelButton(true, animated: true)
        self.clvCollection.allowsSelection=false
        self.clvCollection.scrollEnabled=false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
            self._doSearch(searchText)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
         if let _searchBarText = searchBar.text  {
            self.searchBar(searchBar, textDidChange: _searchBarText)
         }
       
        
        self.scbSearchBar.resignFirstResponder()
        let searchCancelButton = self.scbSearchBar.valueForKey("cancelButton") as! UIButton
        searchCancelButton.enabled = true // <-- THIS line is the trick


    }
    
    func _doSearch(searchText:String){
        
        if(searchText.characters.count==0){
            self.arrDataSourceFiltered = nil
            self.clvCollection.reloadData()
        }else{
            if let _predicate:NSPredicate = NSPredicate(format: "SELF CONTAINS[cd] %@", searchText) {
                self.arrDataSourceFiltered = (self.arrDataSource as NSArray).filteredArrayUsingPredicate(_predicate) as? [String]
                self.clvCollection.reloadData()
            }
        }
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        self.arrDataSourceFiltered = nil
        
        self.scbSearchBar.text = ""
        self.scbSearchBar.showsCancelButton=false
        self.scbSearchBar.endEditing(true)
        
        self.clvCollection.allowsSelection=true
        self.clvCollection.scrollEnabled=true
        self.clvCollection.reloadData()
        
    }
    
    // MARK: - Private / Internal
    func _refreshView(){
        self.scbSearchBar.hidden = (self.arrDataSource.count==0)
        
        self.clvCollection.reloadData()
    }
    
    func _setupUI() {
        self.title = "Gremlins searcher"
        
        self.layCollection.itemSize=CGSizeMake(100, 100)
        self.layCollection.minimumInteritemSpacing = 4
        self.layCollection.minimumLineSpacing = 0
        self.layCollection.scrollDirection = .Vertical
        
        self.clvCollection.delegate=self
        self.clvCollection.dataSource=self
        
        
      
        self.scbSearchBar.delegate=self
        
        self._refreshView()
        
    }
    
}
