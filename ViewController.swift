//
//  ViewController.swift
//  DiceGame
//
//  Created by Mehmet Yusuf Koca on 5.06.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    @IBOutlet weak var diceImage3: UIImageView!
    @IBOutlet weak var diceImage4: UIImageView!
    @IBOutlet weak var diceImage5: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        zarGorselleriniGuncelle([1, 1, 1, 1, 1])
    }
    
    @IBAction func rollDiceTapped(_ sender: Any) {
        let zarlar = (1...5).map { _ in Int.random(in: 1...6) }
        zarGorselleriniGuncelle(zarlar)
        
        let puan = puanHesapla(zarlar: zarlar)
        scoreLabel.text = "Puan: \(puan)"
        
    }
    func zarGorselleriniGuncelle(_ zarlar: [Int]) {
        let imageViews = [diceImage1, diceImage2, diceImage3, diceImage4, diceImage5]
        for (index, zar) in zarlar.enumerated() {
            imageViews[index]?.image = UIImage(named: "dice\(zar)")
        }
    }
    func puanHesapla(zarlar: [Int]) -> Int {
        var sayac: [Int: Int] = [:]
        for zar in zarlar {
            sayac[zar, default: 0] += 1
        }
        
        var toplam = 0
        
        for (sayi, adet) in sayac {
            if adet >= 3 {
                toplam += sayi == 1 ? 1000 : sayi * 100
                let kalan = adet - 3
                if sayi == 1 {
                    toplam += kalan * 100
                } else if sayi == 5 {
                    toplam += kalan * 50
                }
            } else {
                if sayi == 1 {
                    toplam += adet * 100
                } else if sayi == 5 {
                    toplam += adet * 50
                }
            }
        }
    return toplam
        
    }
}

