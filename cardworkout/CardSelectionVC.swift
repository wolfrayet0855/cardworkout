//
//  CardSelectionVC.swift
//  cardworkout
//
//  Created by user on 5/13/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    //adding outlets for card view
    @IBOutlet var cardimageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Deck.allValues //contains all values in card.swift deck//
    // adding timer//
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
 //button corner radius configuration//
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    //need to invalidate so that timer is not consuming memory in the background//
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
        
    }
//timer function//
    
    func startTimer(){
        timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil ,repeats: true)
    }
    
    @objc func showRandomImage(){
        cardimageView.image = cards.randomElement() ?? UIImage(named:"AS") //if array empty then us AS//
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
