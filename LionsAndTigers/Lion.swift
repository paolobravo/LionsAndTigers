//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Miguel Bravo on 12/15/14.
//  Copyright (c) 2014 Miguel Bravo. All rights reserved.
//

import Foundation
import UIkit


class Lion {
    
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subSpecies = ""
    
    func roar() {
        
        println("Lion: roar roar")
        
        
    }
    
    // can access property
    func changeToAlphaMale(){
        
        self.isAlphaMale = true
        
        
    }
    
    func randomFact() -> String{
        
        var randomFact: String
        
        if(self.isAlphaMale){
            randomFact = "Male lions are easy to recgnize thanks to their manes. Men with darker mane will be more attractive"
            
        }else{
            randomFact = "Femal lioness form social club and dont tolerate females"
            
        }
        
        return randomFact
        
        
    }
    
    
}





