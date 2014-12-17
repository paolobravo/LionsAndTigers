//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Miguel Bravo on 12/15/14.
//  Copyright (c) 2014 Miguel Bravo. All rights reserved.
//

import Foundation

class LionCub:Lion {
    
    var isMale = false
    
    
    func rubLionCubsBelly() {
        
        println("LionCub: snuggle and bite you")
        
    }
    
    override func roar(){
        
        super.roar()
        println("LionCub: growl growl")
        
    }
    
    override func randomFact() -> String {
        
        var randomFact:String
        
        if isMale {
            randomFact = "Cubs usually hidden something"
        } else{
            randomFact = "Cubs eats meat at age of 6 weeks"
        }
        
        return randomFact
    }
    
    
    
}



