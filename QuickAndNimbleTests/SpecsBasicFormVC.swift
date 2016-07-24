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

class SpecsBasicFormVC: QuickSpec {
    
    override func spec() {
        var controller : BasicFormVC!
        
        beforeEach() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            controller =  storyboard.instantiateViewControllerWithIdentifier("BasicFormVCID") as? BasicFormVC
            
        };
        it("should not be nil") {
            expect(controller).notTo(beNil())
        }
        
        it ("Simple form validation") {
            _ = controller.view
            controller.txtAge.text = "34"
            controller.btnAgeTouchUpInside(controller.btnAge)
            expect(controller.lblAge.text).to(contain("34"))
        }

        
    }
    
    
}
