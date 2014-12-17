//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Miguel Bravo on 12/14/14.
//  Copyright (c) 2014 Miguel Bravo. All rights reserved.
//

import UIKit

// tuples 3:25

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var lions: [Lion] = []
    var lionCubs: [LionCub] = []
   
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    
    
    
    // auto calls
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigre"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffNumberOfTimes(5, isLoud: true)
        
        myTigers.append(myTiger)
        
        println("My tiger's name is: \(myTiger.name), it's age is \(myTiger.age), it's breed is \(myTiger.breed) and it's image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        var secondTiger = Tiger();
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indo Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        secondTiger.age = myTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        secondTiger.chuff()
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Siberian"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        thirdTiger.age = myTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "JRT"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "JRT.jpg")
        
        fourthTiger.age = myTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
//        myTiger.chuffANumberOfTimes(3)
//        secondTiger.chuffANumberOfTimes(2)
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "lion.jpg")
        lion.name = "Mufasa"
        lion.subSpecies = "West African"
        
        println("Lion's age is \(lion.age) and the lion's name is \(lion.name) and the lions sub species is \(lion.subSpecies)")
        
        lion.roar()
        lion.changeToAlphaMale()
        
        if lion.isAlphaMale == true {
            
            println("The lion is now an alpha ")
        }
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "lioness.jpg")
        lioness.name = "Serabi"
        lioness.subSpecies = "Barbary"
        
        // self not required
        self.lions += [lion, lioness]
        
        lioness.roar()
        
        
        
        var lionCub = LionCub()
        
        lionCub.age = 1
        lionCub.name = "Zoomba"
        lionCub.image = UIImage(named: "lionCub.png")
        lionCub.subSpecies = "Masai"
        lionCub.isMale = true
        
        println("Lion cub shoild roar after this statement")
        lionCub.roar()
        
        lionCub.rubLionCubsBelly()
        
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "femaleCub.jpg")
        femaleLionCub.subSpecies = "Tronsvala"
        femaleLionCub.isMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
        
        
        
    }

    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateAnimal() {
        
        switch currentAnimal {
            
        case("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    func updateView(){
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if(self.currentAnimal.species == "Tiger") {
                
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
                // self.randomFactLabel.hidden = false
                
            }else if self.currentAnimal.species == "Lion" {
                
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subSpecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                // self.randomFactLabel.hidden = true
                self.randomFactLabel.text = lion.randomFact()
                
            }else if self.currentAnimal.species == "LionCub" {
                
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subSpecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                // self.randomFactLabel.hidden = true
                self.randomFactLabel.text = lionCub.randomFact()
                
                
                
            }
            
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }
    
    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        
        updateAnimal()
        updateView()
        
        
    }
    
    
    
    
    
    func updateTiger() {
        
        var randomIndex:Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while self.currentIndex == randomIndex
        
        self.currentIndex == randomIndex
        
        
        let tiger = self.myTigers[randomIndex]
        
        //        myImageView.image = tiger.image
        //        nameLabel.text = tiger.name
        //        ageLabel.text = "\(tiger.age)"
        //        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {
                (finished: Bool) -> () in
        })
        
        
    }
    
    
    
    
    
    
    
    

}









