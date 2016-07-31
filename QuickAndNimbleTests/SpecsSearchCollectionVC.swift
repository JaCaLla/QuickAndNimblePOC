//
//  SpecsBasicFormVC.swift
//  QuickAndNimble
//
//  Created by JAVIER CALATRAVA LLAVERIA on 23/07/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import Quick
import Nimble

@testable import QuickAndNimble

class SpecsSearchCollectionVC: QuickSpec {
    
    override func spec() {
        var controller : SearchCollectionVC!
        
        beforeEach() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            controller =  storyboard.instantiateViewControllerWithIdentifier("SpecsSearchCollectionVCID") as? SearchCollectionVC
            
        };
        
        it("should not be nil") {
            expect(controller).notTo(beNil())
        }
        

        
        describe ("Collectionview validation") {
            beforeEach() {
                _ = controller.view
                controller.beginAppearanceTransition(true, animated: false)
            };
            
            it("view controlller tilte"){
                expect(controller.title) == "Gremlins searcher"
            }
            

            it ("Initial collection view initialization with no data"){
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 11
                expect(controller.scbSearchBar.hidden) == false
            }
            
            it ("Initial collection view initialization with some data"){
                
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 11
                expect(controller.scbSearchBar.hidden) == false
                
                
                controller.setDataSource(["one","two","three"])
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
                expect(controller.scbSearchBar.hidden) == false
            }

        }
        
        describe ("Searchbar validation validation") {
            beforeEach() {
                _ = controller.view
                controller.beginAppearanceTransition(true, animated: false)
            };
    
            it ("Do a basic search"){
                
                controller.setDataSource(["one","two","three"])
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
                expect(controller.scbSearchBar.hidden) == false
                
                controller.searchBar(controller.scbSearchBar, textDidChange: "one")
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 1
                expect(controller.scbSearchBar.hidden) == false
        
                controller.searchBarCancelButtonClicked(controller.scbSearchBar)
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
                expect(controller.scbSearchBar.hidden) == false
                
            }
            
            it ("Do a basic search with empty text"){
                
                controller.setDataSource(["one","two","three"])
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
                expect(controller.scbSearchBar.hidden) == false
                
                controller.searchBar(controller.scbSearchBar, textDidChange: "")
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
                expect(controller.scbSearchBar.hidden) == false
                
                controller.searchBarCancelButtonClicked(controller.scbSearchBar)
            }
            
        }
        
        

        
    }
    
    
}
