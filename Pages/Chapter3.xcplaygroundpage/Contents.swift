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
let WilliamImg = UIImage(named: "DeadWilliam1.png")!
//Importing William Sprite
let FatherImg = UIImage(named: "DeadFather1.png")!
//Importing father sprite
let ButtonImg = UIImage(named: "Button1.png")!
//Importing Button sprite

//Background trasparente per il testo
let coloreBackTesto = UIColor(white: 0, alpha: 0)

let endingImg = UIImage(named: "Ending.png")!

var player1: AVAudioPlayer!


//Arrays that contain: the names of the one speaking at the moment, the actualy text spoken/narrated and the type of dialogue box that is being used (nwith a name box or without it)
let nameArray = [
    "",
    "",
    "",
    "",
    "William",
    "",
    "",
    "Father",
    "",
    "William",
    "",
    "William",
    "Father",
    "William",
    "",
    "William",
    "Father",
    "William",
    "",
    ""
                ]
let dialogueArray = [
    "Only when the black veil completely vanished, the thief had the chance to see with horror the true behind all this absurd vision: he never left the museum, he never met George, he never managed to escape with the spoils of his thievery. This was just a pre-mortem hallucination.",
    "He was shot by the same guard he attacked as a last anguished act, before William’s hopeless run. ",
    "Even if William’s vision was extremely blurry, due to the agony felt in his last moment, he manages to get a glimpse on the guard’s face, who just let that ending blow, and what he realized made his almost dead body shiver in shock.",
    "The man he just stabbed was not just a faceless guard. He was someone really close to the thief.",
    "F-Father… Is that really you? It’s not another hallucination, right?",
    "The man was still breathing faintly, when William tried to speak to him. When he manages to hears the voice of his lost son, the one he searched for so tirelessly during the last years, he failed to hide the shock and the emotion to finally see him again, even in such tragic event. ",
    "In that moment, the dying guard cursed himself to have hurt one of the most precious things in his whole life, just because he couldn’t recognize Williams in the darkness of the common room.",
    "Will… my son… it’s this the way you’re living your life? Stealing goods like a filthy criminal?",
    "Sadness was clear in his father voice. William couldn’t help to feel a deep regret in the bottom of his heart. ",
    "Father…",
    "A rough cough interrupted the boy. Red was coming out from his mouth, another symbol of his imminent end.",
    "I… I just stole to not starve myself… I didn’t have a choice…",
    "Why….? Why you went away, son? If you stayed… Things would have gone so much differently….",
    "I-I’m so sorry, father, I really am… I always respected you, I always cared for you, even if you was never home… But mother… She was so far to be a good parent… Everytime you were not home, she…",
    "A sob got out from William’s lips, a sign that the trauma was so eradicated that he had hard time to even try to explain it.",
    "I… I couldn’t bare it… I had to run…",
    "I’m… I’m so sorry, Will…. I wasn’t there for you when you needed…. Please, forgive me, Will… Forgive…. me….",
    "That’s, not true, father… You… You did nothing wrong… I’m the one at fault… Please, please… Give me another chance… I don’t want to live like this anymore… Let… Let’s go home… together…",
    "But this time, there was no answer: it was too late. His father body was getting colder and colder as the time passed by. ",
    "It was William’s hour too, but the boy wanted to do just one thing, before exhale his last breath. Gathering his remaining forces, he slowly crawled toward the other man figure, giving him a hug for the very last time…"]
let dialogueBoxArray = [
    "DialogueBox.png",
    "DialogueBox.png",
    "DialogueBox.png",
    "DialogueBox.png",
    "DialogueBox2.png",
    "DialogueBox.png",
    "DialogueBox.png",
    "DialogueBox2.png",
    "DialogueBox.png",
    "DialogueBox2.png",
    "DialogueBox.png",
    "DialogueBox2.png",
    "DialogueBox2.png",
    "DialogueBox2.png",
    "DialogueBox.png",
    "DialogueBox2.png",
    "DialogueBox2.png",
    "DialogueBox2.png",
    "DialogueBox.png",
    "DialogueBox.png"]

//Index variable that keeps track of my position in the arrays
var counter = 0
let riempimento = dialogueArray.count
let urlString1 = Bundle.main.path(forResource: "Ending", ofType: "mp3")

class Chapter3Controller: UIViewController{
    
    //Class variables
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testo = UITextView()
    let WilliamSprite = UIImageView()
    let testoBox = UIImageView(frame: dimDialogueBox)
    let FatherSprite = UIImageView()
    let nextButton = UIButton()
    let sfondoNero = UITextView()
    let speakerName = UITextView()
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
        Vista.addSubview(FatherSprite)
        Vista.addSubview(nextButton)
        Vista.addSubview(testo)
        Vista.addSubview(sfondoNero)
        Vista.addSubview(speakerName)
        Vista.addSubview(ending)
        
        //Handling black background for fade in
        sfondoNero.frame = dimSimulazione
        sfondoNero.isEditable = false
        sfondoNero.backgroundColor = .black
        sfondoNero.layer.zPosition = 10
        
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
        
        
        //Bringing the background onto the scene
        sfondo.image = UIImage(named: "Museum.png")
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
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
            testoBox.layer.zPosition = 5
            
            //Assigning William's Sprite image, layer position, canvas position and dimension
            WilliamSprite.image = WilliamImg
            WilliamSprite.frame = CGRect(x: -30 ,y: 105,width: WilliamImg.size.width/3.5, height: WilliamImg.size.height/3.5)
            WilliamSprite.layer.zPosition = 3
            
            //Assigning the Eldritch Abomination's Sprite image, layer position, canvas position and dimension
            FatherSprite.image = FatherImg
            FatherSprite.frame = CGRect(x: 400, y: 120, width: FatherImg.size.width/3.5, height: FatherImg.size.height/3.5)
            FatherSprite.layer.zPosition = 3
            
            //Assigning the string of who is speaking to the appropriate variable, setting the background color to transparent, setting the layer position, the position in the canvas and the dimension
            speakerName.text = nameArray[counter]
            speakerName.backgroundColor = coloreBackTesto
            speakerName.layer.zPosition = 7
            speakerName.frame = CGRect(x: 185, y: 208, width:100 , height:30 )
            
            //Same as before but for the actual text being spoken/narrated
            testo.text = dialogueArray[counter]
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
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.FatherSprite.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.FatherSprite.alpha = 1
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
        } else if(counter + 1 == riempimento){
            nextButton.removeFromSuperview()
            testo.text = dialogueArray[counter]
            speakerName.text = nameArray[counter]
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
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
            
            
        }else{
            //Assigning the various elements of the various array to their respective variables
            testo.text = dialogueArray[counter]
            speakerName.text = nameArray[counter]
            testoBox.image = UIImage(named: dialogueBoxArray[counter])
            
            counter += 1
        }
    }
}

PlaygroundPage.current.liveView = Chapter3Controller()

