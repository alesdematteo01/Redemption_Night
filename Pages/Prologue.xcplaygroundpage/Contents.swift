import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import Darwin
import AVFoundation

//Variabili varie ed eventuali
let dimSimulazione = CGRect(x: 0, y: 0, width: 640, height: 360)
let dimBarra = CGRect(x: 60, y: 160, width: 640, height: 220)
let coloreBackTesto = UIColor(white: 0, alpha: 0)
var flag = 0
var player: AVAudioPlayer!


//Testo del Capitolo
let narrazione = [
    "London, 1850. The streets of the city were dimly lit by the light of the oil lamps. In the darkest alleys someone was lurking. Its silhouette slowly appearing under the street lights.",
    "",
    "William Rigor Zeppeli, a petty thief who lived in the slums, ran away from home when he was only 12. He made his living by selling what he managed to rob and pickpocket.",
    "But this time William didn't take mere junk, like he usually stole from the stalls. Today he got his hands on something much better, something very valuable."
]
let countN = narrazione.count

//Sprite && Immagini
let williamImg = UIImage(named: "WilliamIdle.png")!
let arrow = UIImage(named: "Button2.png")!

//Musica di sottofondo
let urlString = Bundle.main.path(forResource: "Prologo", ofType: "mp3")

class PrologueController: UIViewController{
    
    //Variabili Classe
    let Vista = UIView()
    let sfondo = UIImageView(frame: dimSimulazione)
    let testoBox = UIImageView(frame: dimBarra)
    let williamIdle = UIImageView()
    let nextButton = UIButton()
    let testo = UITextView()
    let sfondoNero = UITextView()
    
    //Definizione loadView
    override func loadView() {
        super.loadView()
        self.view = Vista
        creaVista()
    }
    
    //Definizione funzione creaVista
    func creaVista(){
        
        //Aggiunta delle view iniziali che mi servono
        Vista.frame = dimSimulazione
        Vista.addSubview(sfondo)
        Vista.addSubview(testoBox)
        Vista.addSubview(williamIdle)
        Vista.addSubview(testo)
        Vista.addSubview(sfondoNero)
        Vista.addSubview(nextButton)
        
        //Parte la musica
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
        
        //Gestione Sfondo Nero per l'animazione
        sfondoNero.frame = dimSimulazione
        sfondoNero.isEditable = false
        sfondoNero.backgroundColor = .white
        sfondoNero.layer.zPosition = 10
        
        //Animazione Dissolvenza
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
            })
            UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 0
            })
        }
        
        //Sfondo prologo setting
        sfondo.image = UIImage(named: "PrologueBackground.jpeg")                //Ho imposto l'immagine di sfondo
        sfondo.layer.zPosition = 0                                              //La posiziono sul layer giusto
        
        //Casella Testo setting
        testoBox.layer.zPosition = 3
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testoBox.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testoBox.alpha = 0.75
            })
        }
                
        //William sprite setting
        williamIdle.frame = CGRect(x: -80, y: Vista.frame.midY - 125, width: williamImg.size.width/3, height: williamImg.size.height/3)
        williamIdle.layer.zPosition = 2
        
        //Testo Setting
        testo.backgroundColor = coloreBackTesto
        testo.font = .italicSystemFont(ofSize: 14)
        testo.frame = CGRect(x: 240, y: Vista.frame.maxY - 125, width: 300, height: 100)
        testo.layer.zPosition = 4
        testo.isEditable = false
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
            UIView.animate(withDuration: 20.0, animations: {() -> Void in self.testo.alpha = 0
            })
            UIView.animate(withDuration: 4.0, animations: {() -> Void in self.testo.alpha = 1
            })
        }
        
        addNextButton()
        
    }
    
    func addNextButton(){
        nextButton.layer.zPosition = 6
        nextButton.frame = CGRect(x: 570, y: Vista.frame.maxY - 60, width: 60, height: 40)
        nextButton.setBackgroundImage(arrow, for: .normal)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(nextLabel), for: .touchUpInside)
    }
    
    @objc func nextLabel(){
        testo.text = narrazione[flag+1]
        flag += 1
        if (flag == 1){
            testoBox.image = UIImage(named: "DialogueBox.png")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testoBox.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testoBox.alpha = 1
                })
            }
            testo.text = narrazione[0]
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testo.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.testo.alpha = 1
                })
            }

        }
        if (flag == 2){
            williamIdle.image = williamImg
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()){
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.williamIdle.alpha = 0
                })
                UIView.animate(withDuration: 1.0, animations: {() -> Void in self.williamIdle.alpha = 1
                })
            }
        }
        if (flag + 1 == countN) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5){
                UIView.animate(withDuration: 3.0, animations: {() -> Void in self.sfondoNero.alpha = 0
                })
                UIView.animate(withDuration: 2.0, animations: {() -> Void in self.sfondoNero.alpha = 1
                })
            }
            nextButton.removeFromSuperview()
        }
    }
}

PlaygroundPage.current.liveView = PrologueController()

