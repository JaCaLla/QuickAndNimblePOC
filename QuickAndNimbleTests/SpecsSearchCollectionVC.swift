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
        
        describe ("Collectionview") {
            beforeEach() {
                _ = controller.view
                controller.beginAppearanceTransition(true, animated: false)
            };
            

            it ("Initial collection view initialization with no data"){
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 0
            }
            
            it ("Initial collection view initialization with some data"){
                _ = controller.view
                controller.beginAppearanceTransition(true, animated: false)
                
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 0
                controller.setDataSource(["one","two","three"])
                expect(controller.numberOfSectionsInCollectionView(controller.clvCollection)) == 1
                expect(controller.collectionView(controller.clvCollection, numberOfItemsInSection: 0)) == 3
            }

        }

        
    }
    
    
}
