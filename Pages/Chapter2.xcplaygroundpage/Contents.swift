import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin
import AVFoundation

let dimSimulazione = CGRect (x: 0, y: 0, width: 640, height: 360)
//Simulation dimension
let dimDialogueBox = CGRect(x: 15, y: 160, width: 640, height: 220)
//Dialogue Box dimension and position
let WilliamImg = UIImage(named: "William1.png")!
//Importing William Sprite
let EldritchImg = UIImage(named: "E1.png")!
//Importing monster sprite
let ButtonImg = UIImage(named: "Button1.png")!
//Importing Button sprite
let deadWilliam = UIImage(named: "DeadWilliam1.png")!
//Importing dad William's sprite
let deadFather = UIImage(named: "DeadFather1.png")!
//Importing dead Father's sprite
let fightingWilliam = UIImage (named: "fightingWilliam.png")!
//Importing William's sprite holding a knife

//Background trasparente per il testo
let coloreBackTesto = UIColor(white: 0, alpha: 0)

let endingImg = UIImage(named: "Ending.png")!

var player: AVAudioPlayer!
var player1: AVAudioPlayer!

let speakerName1 = ["William","William","William","Abonmination", "Abonmination",""]
let testoArray = [
    "George!! Where the hell are you?!",
    "Bloody hell! My hand burns like a motherfucker! What this damned mark on my palm?! And what the heck is going on…",
    "A dreadful voice quickly roared in the whole space, making the poor boy shiver and fueling his body with terror and adrenaline. ",
    "yOu AwAkEnEd SoMeThInG tRuLy DaNgErOuS, hUmAn. YoUr eNd iS nEaR aNd YoUr SoUl Is ImPuRe. ReDeEm YoUrSeLf AnD fIgHt, Or FlEe AnD YoU wIlL PeRiSh...",
    "yOu Can’T EsCaPE yOUr FaTe. ThE mArK On yOuR hANd wILl lEaD mE tO yOU.",
    "[What will William do?]"]
let dialogueBoxArray = ["DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png"]

let speakerName2 = [
    "",
    "",
    "",
    ""
]
let dialogueBoxArray2 = [
    "DialogueBox.png", "DialogueBox.png", "DialogueBox.png", "DialogueBox.png"
]
let goodTesto = [
    "Gathering all the courage he had, William took his trusted knife and jumped on the Eldritch creature, stabbing it rushedly in his pinch black stomach. ",
    "The ugly monster, after taking the debilitating blow, tried with all his might to violently shrug off the scared boy, blasting an unknown and instinctive blow against his enemy. Both fell on the floor with a plain sound.",
    "William never felt this much pain in his whole life, a pain so lumbering that even thinking became difficult and cumbersome. The source of all his suffering was a distinct and bloody hole in his chest, a clear sign that his life was going to end very soon.",
    "After that, a strange dark fog rose from the Eldritch silhouette, slowly and steadily showing the man in the museum, the same one William stabbed before all this surreal experience."
]

let speakerName3 = ["","","","","","","","","","","William","","",""]
let dialogueBoxArray3 = ["DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png"]
let badTesto = [
    "The Eldritch creature jumped on the thief, who rushedly tried to run for his life, but the horrendous monster was way faster than him and it quickly reached his frightened prey.",
    "William instinctively drew his trusted knife and stabbed the beast as a desperate measure to save himself.",
    "And yet, even if the Eldritch creature felt the unexpected blow, it managed to shoot something towards William’s chest, making him fall on the ground with a distinct sound. ",
    "The pain instantly grasped his whole body and his breath couldn’t help but become shorter and shorter. Even if this mysterious object just hit him, William was still not able to understand what the hell did that damned being blast.",
    "While the injured boy wriggled for the unbearable pain, the creature let out a cry quavered with rage and shock, before crumbling on himself.",
    "After that, the dark fog enveloping the shop and the monster's silhoutte faded away, slowly and steadily showing the man in the museum, the same one William stabbed before all this surreal experience.",
    "Only when the black veil completely vanished, the thief had the chance to see with horror the true behind all this absurd vision: he never left the museum, he never met George, he never managed to escape with the spoils of his thievery. This was just a pre-mortem hallucination.",
    "He was shot by the same guard he attacked as a last anguished act, before William’s hopeless run. ",
    "Even if William’s vision was extremely blurry, due to the agony felt in his last moment, he manages to get a glimpse on the guard’s face, who just let that ending blow, and what he realized made his almost dead body shiver in shock and despair.",
    "It was in that moment that William knew… he fucked up.",
    "F-FATHER… OH, GOD, NO, PLEASE…",
    "Yes, the lawman who layed on the floor lifeless with a dagger stuck in his chest, the guard William killed in his last moments, was his father, the same father he respected so much, even when the young boy was forced to leave home due to his mother madness.",
    "Just like William, his dad couldn’t recognize his son in the dark, during that improvised theft, and shot briskly against the same boy he searched aimlessly after his run-away from home.. ",
    "William tried to reach the dead body of father, to say sorry for the very last time, to say that he still cared for him. But it was too late: while he crawled to his father silhouette, he passed a way with a faint rattle."
]

//Index variable that keeps track of my position in the arrays
var counter = 0
var dialriemp = testoArray.count
let riempGood = goodTesto.count
let riempBad = badTesto.count

//Importing the button sprite
let arrow = UIImage(named: "Button1.png")

let urlString = Bundle.main.path(forResource: "drop", ofType: "mp3")
let urlString1 = Bundle.main.path(forResource: "Ending", ofType: "mp3")

class Chapter2Controller: UIViewController{
    
    //Class variables
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let WilliamSprite = UIImageView()
    let testoBox = UIImageView(frame: dimDialogueBox)
    let EldritchSprite = UIImageView()
    let nextButton = UIButton()
    let sfondoNero = UITextView()
    let speakerName = UITextView()
    let choice1 = UIButton()
    let testo1 = UITextView()
    let choice2 = UIButton()
    let testo2 = UITextView()
    let goodText = UITextView()
    let goodButton = UIButton()
    let badText = UITextView()
    let badButton = UIButton()
    let fatherSprite = UIImageView()
    let ending = UIImageView()

    override func loadView() {
        super.loadView()                                                        //Riprendo la loadView della classe View originale
        self.view = Vista                                                       //view è la variabile della classe originale e ci chiavo la mia
        creaVista()                                                             //Quando carica la vista, deve richiamare la funzione che ho creato io
    }
    
    func creaVista(){
        Vista.frame = dimSimulazione
        
        Vista.addSubview(sfondo)
        Vista.addSubview(testoBox)
        Vista.addSubview(WilliamSprite)
        Vista.addSubview(EldritchSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(testo)
        Vista.addSubview(sfondoNero)
        Vista.addSubview(speakerName)
        Vista.addSubview(choice1)
        Vista.addSubview(testo1)
        Vista.addSubview(choice2)
        Vista.addSubview(testo2)
        Vista.addSubview(goodText)
        Vista.addSubview(goodButton)
        Vista.addSubview(badText)
        Vista.addSubview(badButton)
        Vista.addSubview(fatherSprite)
        Vista.addSubview(ending)
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else{
                return
            }
            player.play()
        }
        catch{
            print("Something went wrong")
        }
        
        //Handling black background for fade in
        sfondoNero.frame = dimSimulazione
        sfondoNero.isEditable = false
        sfondoNero.backgroundColor = .black
        sfondoNero.layer.zPosition = 10
        
        //Bringing the background onto the scene
        sfondo.image = UIImage(named: "SmokeyShop.png")
        sfondo.layer.zPosition = 1
        
        //Fading animation for the background
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
            })
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 0
            })
        }

        
        addNextButton()
    }

    func addNextButton(){
        nextButton.layer.zPosition = 6
        nextButton.frame = CGRect(x: 570, y: Vista.frame.maxY - 60, width: 60, height: 40)
        nextButton.setBackgroundImage(ButtonImg, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel), for: .touchUpInside)
    }
    
    @objc func nextLabel(){
        if(counter == 0){
            //I enter this if statement only the first time the button is pressed, meaning when the counter is equal to 0 at the beginning of the scene
            
            //The first time the button is pressed we bring forward all the assets on the image
            
            //Assigning the dialoguebox image and layer position
            testoBox.image = UIImage(named: "DialogueBox2.png")
            testoBox.layer.zPosition = 5
            
            //Assigning William's Sprite image, layer position, canvas position and dimension
            WilliamSprite.image = WilliamImg
            WilliamSprite.frame = CGRect(x: -80, y: Vista.frame.midY - 125, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
            WilliamSprite.layer.zPosition = 3
            
            //Assigning the Eldritch Abomination's Sprite image, layer position, canvas position and dimension
            EldritchSprite.image = EldritchImg
            EldritchSprite.frame = CGRect(x: 320, y: 65, width: EldritchImg.size.width/3, height: EldritchImg.size.height/3)
            EldritchSprite.layer.zPosition = 3
            
            //Assigning the string of who is speaking to the appropriate variable, setting the background color to transparent, setting the layer position, the position in the canvas and the dimension
            speakerName.text = speakerName1[counter]
            speakerName.backgroundColor = coloreBackTesto
            speakerName.layer.zPosition = 7
            speakerName.frame = CGRect(x: 175, y: 208, width:100 , height:30 )
            
            //Same as before but for the actual text being spoken/narrated
            testo.text = testoArray[counter]
            testo.backgroundColor = coloreBackTesto
            testo.layer.zPosition = 7
            testo.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
            
            //Creating the fade in effect for the DialogueBox image
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testoBox.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testoBox.alpha = 0.75
                })
            }
            //Creating the fade in effect for William's Sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                })
            }
            //Creating the fade in effect for the Eldritch's being sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                })
            }
            //Creating the fade in effect for the name of who is speaking in the dialogue box
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.speakerName.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.speakerName.alpha = 1
                })
            }
            //Creating the fade in effeect for the actual text
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.testo.alpha = 1
                })
            }
            //Increasing the counter of the array
            counter += 1
        } else if (counter + 1 == dialriemp){
            nextButton.removeFromSuperview()
            
            testo.text = testoArray[counter]
            speakerName.text = speakerName1[counter]
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
            testo1.text = ">Fight."
            testo1.isEditable = false
            testo1.font = .italicSystemFont(ofSize: 14)
            testo1.backgroundColor = coloreBackTesto
            testo1.frame = CGRect(x: 195, y: Vista.frame.maxY - 85, width: 100, height: 30)
            testo1.layer.zPosition = 5
            
            addChoice1()
            
            testo2.text = ">Run."
            testo2.isEditable = false
            testo2.font = .italicSystemFont(ofSize: 14)
            testo2.backgroundColor = coloreBackTesto
            testo2.frame = CGRect(x: 195, y: Vista.frame.maxY - 60, width: 100, height: 30)
            testo2.layer.zPosition = 5
            
            addChoice2()
            
        }else{
            //Assigning the various elements of the various array to their respective variables
            testo.text = testoArray[counter]
            speakerName.text = speakerName1[counter]
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
            
            counter += 1
        }
    }
    
    func addChoice1(){
        choice1.layer.zPosition = 6
        choice1.frame = CGRect(x: 300, y: Vista.frame.maxY - 80, width: 30, height: 20)
        choice1.setBackgroundImage(arrow, for: .normal)
        choice1.tag = 0
        choice1.addTarget(self, action: #selector(nextLabel1), for: .touchUpInside)
    }
    
    func addChoice2(){
        choice2.layer.zPosition = 6
        choice2.frame = CGRect(x: 300, y: Vista.frame.maxY - 55, width: 30, height: 20)
        choice2.setBackgroundImage(arrow, for: .normal)
        choice2.tag = 0
        choice2.addTarget(self, action: #selector(nextLabel2), for: .touchUpInside)
    }
    
    @objc func nextLabel1(){
        testo.removeFromSuperview()
        testo1.removeFromSuperview()
        testo2.removeFromSuperview()
        choice1.removeFromSuperview()
        choice2.removeFromSuperview()
        
        WilliamSprite.image = fightingWilliam
        WilliamSprite.frame = CGRect(x: -40, y: Vista.frame.midY - 125, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
        speakerName.text = speakerName2[0]
        testoBox.image = UIImage(named: dialogueBoxArray2[0])
        goodText.text = goodTesto[0]
        goodText.isEditable = false
        goodText.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        goodText.backgroundColor = coloreBackTesto
        goodText.layer.zPosition = 5
        
        counter = 0
        
        addGoodButton()
    }
    
    func addGoodButton(){
        goodButton.layer.zPosition = 9
        goodButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        goodButton.setBackgroundImage(arrow, for: .normal)
        goodButton.tag = 0
        goodButton.addTarget(self, action: #selector(nextGoodLabel) ,for: .touchUpInside)
    }
    
    @objc func nextGoodLabel(){
        speakerName.text = speakerName2[counter+1]
        testoBox.image = UIImage(named: dialogueBoxArray2[counter+1])
        goodText.text = goodTesto[counter+1]
        counter += 1
        if (counter + 1 == riempGood) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
                })
            }
            goodButton.removeFromSuperview()
        }
    }
    
    @objc func nextLabel2(){
        testo.removeFromSuperview()
        testo1.removeFromSuperview()
        testo2.removeFromSuperview()
        choice1.removeFromSuperview()
        choice2.removeFromSuperview()
        
        speakerName.text = speakerName3[0]
        testoBox.image = UIImage(named: dialogueBoxArray3[0])
        badText.text = badTesto[0]
        badText.isEditable = false
        badText.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        badText.backgroundColor = coloreBackTesto
        badText.layer.zPosition = 5
        
        counter = 0
        
        addBadButton()
    }
    
    func addBadButton(){
        badButton.layer.zPosition = 9
        badButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        badButton.setBackgroundImage(arrow, for: .normal)
        badButton.tag = 0
        badButton.addTarget(self, action: #selector(nextBadLabel) ,for: .touchUpInside)
    }
    
    @objc func nextBadLabel(){
        speakerName.text = speakerName3[counter+1]
        testoBox.image = UIImage(named: dialogueBoxArray3[counter+1])
        badText.text = badTesto[counter+1]
        counter += 1
        if(counter == 1){
            WilliamSprite.image = fightingWilliam
        }
        if(counter == 6){
            player.stop()
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString1 = urlString1 else {
                    return
                }
                player1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString1))
                
                guard let player1 = player1 else{
                    return
                }
                player1.play()
            }
            catch{
                print("Something went wrong")
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                })
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                self.sfondo.image = UIImage(named: "Museum.png")
                self.EldritchSprite.removeFromSuperview()
                self.WilliamSprite.image = deadWilliam
                self.WilliamSprite.frame = CGRect(x: -30 ,y: 105,width: deadWilliam.size.width/3.5, height: deadWilliam.size.height/3.5)
                self.fatherSprite.image = deadFather
                self.fatherSprite.frame = CGRect(x: 400, y: 120, width: deadFather.size.width/3.5, height: deadFather.size.height/3.5)
                self.fatherSprite.layer.zPosition = 3
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                //Creating the fade in effect for the Eldritch's being sprite
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 0
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.WilliamSprite.alpha = 1
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.fatherSprite.alpha = 0
                    })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.fatherSprite.alpha = 1
                    })
                
            }
        }
        if (counter + 1 == riempBad) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10){
                self.ending.image = endingImg
                self.ending.frame = CGRect(x: 0, y: -360, width: 640, height: 360)
                self.ending.layer.zPosition = 50
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.ending.center.y = 180
                })
                
            }
            badButton.removeFromSuperview()
        }
    }
}

PlaygroundPage.current.liveView = Chapter2Controller()


