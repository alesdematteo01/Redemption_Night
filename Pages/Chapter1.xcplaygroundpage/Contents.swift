import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin
import AVFoundation
import CoreGraphics

let dimSimulazione = CGRect(x: 0, y: 0, width: 640, height: 360)
let dimDialogueBox = CGRect(x: 15, y: 160, width: 640, height: 220)
let WilliamImg = UIImage(named: "WilliamIdle.png")!
let WilliamImg2 = UIImage(named: "William2.png")
let fightingWilliam = UIImage(named: "William3.png")
let GeorgeImg = UIImage(named: "George.png")!
let ChestImg = UIImage(named: "ChestAlpha.png")!
let arrow = UIImage(named: "Button1.png")!
let nero = UIImage(named: "Black.jpg")
let ColoreBackTesto = UIColor(white: 0, alpha: 0)
let EldritchImg = UIImage(named: "EldritchCreature.png")!
let deadWilliam = UIImage(named: "DeadWilliam1.png")!
let deadFather = UIImage(named: "DeadFather1.png")!
let endingImg = UIImage(named: "Ending.png")!
//Importing monster sprite

var flag = 0
var player: AVAudioPlayer!
var player1: AVAudioPlayer!
var player2: AVAudioPlayer!

let speakerName1 = ["George","","","William","George","William","","George","William","William","George","","George","George",""]
let dialogueBoxArray1 = ["DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox2.png","DialogueBox.png"]
let narrazione = [
    "Would you look at that, if it isn't William! What are you doing in my humble shop on this fine morning?",
    "If it wasn’t for his hood, which covered his whole young face, the aversion in William expression would be clear as a sunny summer day, showing how much he despised the man who just spoke to him. ",
    "George was an underground dealer, who bought stolen good for a few coins and resold them with an unreasonable price. William would prefer to not meddle with the likes of him, but no one else is willing to buy the results of his poor pickpocket, so he has… well, to make do.",
    "Yo George, you can stop the chitchat, I am only here to sell something.",
    "Fine then, show me what you got this time.",
    "There you go.",
    "William quickly showed the luxurious chest, as it was a truly remarkable and valuable prize, but George didn’t seem impressed, not even for a bit. The petty thief was sure it was just an act to put his dirty hands on the treasure for half of its value.",
    "Well, it looks like junk to me, worth no more than a few pennies.",
    "Come on, man, it must be worth something more! Damn, I got through so much shit to get this thing. You think it’s easy to break in the London Crossroad Museum? I don’t even know how I managed to return unscathed after taking this valuable! ",
    "Man, it was so close! I had to stab a fat and stupid guard to get here safely!",
    "I don’t care what you had to do to get whatever junk you get here. If I say that’s worth just few pennies, then that’s his price. Take or leave.",
    "The young boy felt his blood boiling in his veins for the anger, but George, that old fox, smirked as he gave William a deal that he could not refuse.",
    "Well, luckily for you, I’m a true gentleman. How about we make an innocent bet? ",
    "You can sell this thing to me like it is, locked, and I’ll grace you with one or two shellings, or you can break it open and, if it’s actually something interesting, I’ll give you the double of its value, otherwise you get nothing. Seems fair, doesn’t it? I’ll even get the tools you need!",
    "[What will William do?]"
]

let speakerName2 = ["","William", "", "", "George", "", "", "","","",""]
let dialogueBoxArray2 = ["DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png"]
let goodTesto = [
    "A loud sigh got out from William’s lips. He didn’t want to play these useless games, but he really needed that money…",
    "… Fine, let’s open it. But, if there is something really valuable, you’ll have to give me more than the double!",
    "Using the fine tools George provided, William managed to broke easily the unusual and precious chest open. Inside, there was a tiny piece of glass, which actually was kinda heavy for its side.",
    " The thief was pretty sure that it was not mere glass, mostly because it looked like a strange ore he had never seen before. In his hand, it was warm and glowed dimly.",
    "As I said before, it’s just a useless piece of garbage. Take this junk and go away.",
    "With a vivid bitterness in the mouth, Williams had no choice but to leave the place with nothing on his hands.",
    "But something was about to happen, before the boy even had the chance to exit the room. Something that William would never have imagined.",
    " The slab began to heat up more and more, so much that his hand instantly burned.",
    "Aching, William instinctively dropped the tiny object, which shattered loudly on the floor. A blinding light arose from the broken pieces, flooding the shop and stunning the two men.",
    "When the bright light finally faded, William noticed that George completely vanished from the scene, leaving the now scared boy on his own. The shop was ransacked - only William and the absurd artifact remained at the center of the scene.",
    "Then, something started to appear from the broken shards, something that managed to tight William’s gut for the fear."
]

let speakerName3 = ["William","George","","","","","","","","Abomination","","Abomination","","","","","","","","","","","William","","",""]
let dialogueBoxArray3 = ["DialogueBox2.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox.png","DialogueBox2.png","DialogueBox.png","DialogueBox.png","DialogueBox.png"]
let badTesto = [
    "What the fuck, George, are you insane? If we break it, you’ll surely devalue it! Take it as it is and give me my damned money.",
    "Fine, give me this piece of trash and take your stupid pennies. I’ll take care of it myself.",
    "With a vivid bitterness in the mouth, Williams had no choice but to leave the place with the few coins he managed to gain. While the thief was walking steadily through the door, George instantly started to handle the peculiar chest, breaking it open just a few minutes after. ",
    "The only thing George found in the woody box was a strange piece of glass, which actually was kinda heavy for its side. The dealer was pretty sure that it was not mere glass, mostly because it looked like a strange ore he had never seen before. In his hand, it was warm and glowed dimly.",
    "But something was about to happen, before the man even had the chance to do any other action. Something that George would never have imagined.",
    "The slab began to heat up more and more, so much that his hand instantly burned.",
    "Aching, George instinctively dropped the tiny object, which shattered loudly on the floor. A blinding light arose from the broken pieces, flooding the shop and stunning the merchant.",
    "Being just few step away from the shop, as soon as William saw the strong and bright light, he couldn’t help to turn around and instinctively go back into the store. The shop was completely ransacked and there was no trace of George silhouette - only a weird fog pervaded the whole location. ",
    "Then, something started to appear from the broken shards, something that managed to tight William’s gut for the fear.",
    "WhO arOuSeD thE wRatH oF ThE anCieNtS?!",
    "The creature’s dreadful voice quickly made the poor boy shiver, fueling his body with terror and adrenaline.",
    "“ YoU… yOu Do nOt beAR tHE mArK… YoU arE NoT tHe One WhO pOssESs ThE ArTIfAcT. yOU mUsT DiE.”",
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

var counter = 0;

let riempimento = narrazione.count
let riempGood = goodTesto.count
let riempBad = badTesto.count

let urlString = Bundle.main.path(forResource: "negozioNoDrop", ofType: "mp3")
let urlString1 = Bundle.main.path(forResource: "drop", ofType: "mp3")
let urlString2 = Bundle.main.path(forResource: "Ending", ofType: "mp3")

class Chapter1Controller: UIViewController{
    
    //Variabili Classe
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let texture = UITextView()
    let WilliamSprite = UIImageView()
    let testoBox = UIImageView(frame: dimDialogueBox)
    let GeorgeSprite = UIImageView()
    let ChestSprite = UIImageView()
    let nextButton = UIButton()
    let choice1 = UIButton()
    let speakerName = UITextView()
    let testo1 = UITextView()
    let choice2 = UIButton()
    let testo2 = UITextView()
    let goodText = UITextView()
    let goodButton = UIButton()
    let badText = UITextView()
    let badButton = UIButton()
    let sfondoNero = UIImageView()
    let EldritchSprite = UIImageView()
    let fatherSprite = UIImageView()
    let ending = UIImageView()
        
    override func loadView() {
        super.loadView()
        self.view = Vista
        creaVista()
    }
    
    func creaVista(){
        Vista.frame = dimSimulazione
        
        Vista.addSubview(sfondo)
        Vista.addSubview(fatherSprite)
        Vista.addSubview(testoBox)
        Vista.addSubview(WilliamSprite)
        Vista.addSubview(GeorgeSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(texture)
        Vista.addSubview(testo)
        Vista.addSubview(choice1)
        Vista.addSubview(testo1)
        Vista.addSubview(choice2)
        Vista.addSubview(testo2)
        Vista.addSubview(goodText)
        Vista.addSubview(goodButton)
        Vista.addSubview(badText)
        Vista.addSubview(badButton)
        Vista.addSubview(ChestSprite)
        Vista.addSubview(sfondoNero)
        Vista.addSubview(speakerName)
        Vista.addSubview(EldritchSprite)
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
        
        sfondo.image = UIImage(named: "Dealer'sShop.png")
        sfondo.layer.zPosition = 0
        
        texture.frame = dimSimulazione
        texture.isEditable = false
        texture.backgroundColor = .white
        texture.layer.zPosition = 10
                
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
            })
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 0
            })
        }
        
        testoBox.layer.zPosition = 4
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testoBox.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testoBox.alpha = 0.75
            })
        }
                
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testo.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testo.alpha = 1
            })
        }
        
        addNextButton()
    }
    
    func addNextButton(){
        nextButton.layer.zPosition = 9
        nextButton.frame = CGRect (x:525 , y:Vista.frame.maxY-60 ,width:60 ,height:40 )
        nextButton.setBackgroundImage(arrow, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel) ,for: .touchUpInside)
    }
    
    @objc func nextLabel(){
        
        if(flag == 0){
            //Assigning the dialoguebox image and layer position
            testoBox.image = UIImage(named: "DialogueBox2.png")
            testoBox.layer.zPosition = 7
            
            //Assigning William's Sprite image, layer position, canvas position and dimension
            WilliamSprite.image = WilliamImg
            WilliamSprite.frame = CGRect(x: -80, y: Vista.frame.midY - 125, width: WilliamImg.size.width/3, height: WilliamImg.size.height/3)
            WilliamSprite.layer.zPosition = 3
            
            //Assigning the Eldritch Abomination's Sprite image, layer position, canvas position and dimension
            GeorgeSprite.image = GeorgeImg
            GeorgeSprite.frame = CGRect(x: 320, y: 65, width: GeorgeImg.size.width/3, height: GeorgeImg.size.height/3)
            GeorgeSprite.layer.zPosition = 3
            
            //Assigning the string of who is speaking to the appropriate variable, setting the background color to transparent, setting the layer position, the position in the canvas and the dimension
            speakerName.text = speakerName1[flag]
            speakerName.backgroundColor = ColoreBackTesto
            speakerName.layer.zPosition = 7
            speakerName.frame = CGRect(x: 185, y: 208, width:100 , height:30 )
            
            //Same as before but for the actual text being spoken/narrated
            testo.text = narrazione[flag]
            testo.backgroundColor = ColoreBackTesto
            testo.isEditable = false
            testo.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
            testo.layer.zPosition = 8
            
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
            //Creating the fade in effect for George's being sprite
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 1
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
            flag += 1
            
        }
        else{
            speakerName.text = speakerName1[flag]
            testo.text = narrazione[flag]
            testoBox.image = UIImage(named: dialogueBoxArray1[flag])
            flag += 1
        }
        

        if(flag == 6){
            WilliamSprite.image = WilliamImg2
            ChestSprite.image = ChestImg
            ChestSprite.frame = CGRect(x:Vista.frame.midX - 70 , y:90, width:152 , height:128)
            ChestSprite.layer.zPosition = 6
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 1
                })
            }
            sfondoNero.image = nero
            sfondoNero.frame = dimSimulazione
            sfondoNero.layer.zPosition = 4
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0.5
                })
            }
        }
        if(flag == 8){
            WilliamSprite.image = WilliamImg
            ChestSprite.image = ChestImg
            ChestSprite.frame = CGRect(x:Vista.frame.midX - 70 , y:90, width:152 , height:128)
            ChestSprite.layer.zPosition = 5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 1
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.ChestSprite.alpha = 0
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0.5
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
            }
        }

        if(flag  == riempimento){
            nextButton.removeFromSuperview()
            
            testo1.text = ">Open."
            testo1.isEditable = false
            testo1.font = .italicSystemFont(ofSize: 14)
            testo1.backgroundColor = ColoreBackTesto
            testo1.frame = CGRect(x: 195, y: Vista.frame.maxY - 100, width: 100, height: 30)
            testo1.layer.zPosition = 7
            
            addChoice1()
            
            testo2.text = ">Don't open."
            testo2.isEditable = false
            testo2.font = .italicSystemFont(ofSize: 14)
            testo2.backgroundColor = ColoreBackTesto
            testo2.frame = CGRect(x: 195, y: Vista.frame.maxY - 75, width: 100, height: 30)
            testo2.layer.zPosition = 7
            
            addChoice2()
        }
    }
    
    func addChoice1(){
        choice1.layer.zPosition = 8
        choice1.frame = CGRect(x: 300, y: Vista.frame.maxY - 95, width: 30, height: 20)
        choice1.setBackgroundImage(arrow, for: .normal)
        choice1.tag = 0
        choice1.addTarget(self, action: #selector(nextLabel1), for: .touchUpInside)
    }
    
    func addChoice2(){
        choice2.layer.zPosition = 8
        choice2.frame = CGRect(x: 300, y: Vista.frame.maxY - 70, width: 30, height: 20)
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
        
        speakerName.text = speakerName2[0]
        testoBox.image = UIImage(named: dialogueBoxArray2[0])
        goodText.text = goodTesto[0]
        goodText.isEditable = false
        goodText.frame = CGRect(x: 195, y: Vista.frame.maxY - 125, width: 300, height: 100)
        goodText.backgroundColor = ColoreBackTesto
        goodText.layer.zPosition = 7
        
        flag = 0
        
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
        speakerName.text = speakerName2[flag+1]
        testoBox.image = UIImage(named: dialogueBoxArray2[flag+1])
        goodText.text = goodTesto[flag+1]
        flag += 1
        if (flag == 1){
            WilliamSprite.image = WilliamImg2
        }
        if (flag == 5){
            WilliamSprite.image = WilliamImg
        }
        if (flag == 8){
            WilliamSprite.image = WilliamImg2
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.texture.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
                })
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.texture.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 0
                })
            }

        }
        if (flag + 1 == riempGood) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.texture.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.texture.alpha = 1
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
        badText.backgroundColor = ColoreBackTesto
        badText.layer.zPosition = 7
        
        flag = 0
        
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
        speakerName.text = speakerName3[flag+1]
        testoBox.image = UIImage(named: dialogueBoxArray3[flag+1])
        badText.text = badTesto[flag+1]
        flag += 1
        //When I reach this dialogue i fade away George's Sprite
        if(flag == 6){
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.GeorgeSprite.alpha = 1
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.GeorgeSprite.alpha = 0
                })
            }
        }
        //When I reach this dialogue I remove George's sprite and bring in the eldritch's being sprite
        if(flag == 7){
            GeorgeSprite.removeFromSuperview()
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
            }

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                self.sfondo.image = UIImage(named: "SmokeyShop.png")
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondo.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondo.alpha = 1
                })
                self.EldritchSprite.image = EldritchImg
                self.EldritchSprite.frame = CGRect(x: 320, y: 65, width: EldritchImg.size.width/3, height: EldritchImg.size.height/3)
                self.EldritchSprite.layer.zPosition = 3
                //Creating the fade in effect for the Eldritch's being sprite
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0){
                    UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 0
                    })
                    UIView.animate(withDuration: 2.0, animations: {() -> Void in self.EldritchSprite.alpha = 1
                    })
                }
            }
        }
        if (flag == 13){
            WilliamSprite.image = fightingWilliam
        }
        
        if(flag == 14){
            player.stop()
            player1.stop()
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString2 = urlString2 else {
                    return
                }
                player2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString2))
                
                guard let player2 = player2 else{
                    return
                }
                player2.play()
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
                self.WilliamSprite.frame = CGRect(x: -30, y: 105, width: deadWilliam.size.width/3.5, height: deadWilliam.size.height/3.5)
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
        if(flag == (riempBad)-1){
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

PlaygroundPage.current.liveView = Chapter1Controller()
    
