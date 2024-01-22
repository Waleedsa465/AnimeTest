//
//  ResultRegenerateVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 19/01/2024.
//

import UIKit

class ResultRegenerateVC: UIViewController {

    @IBOutlet weak var generateBTn: UIButton!
    @IBOutlet weak var removeAdsBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderColor()

        // Do any additional setup after loading the view.
    }
    

    func borderColor(){
        let color = UIColor(red: 122/255, green: 89/255, blue: 254/255, alpha: 1)
        generateBTn.layer.cornerRadius = 10
        removeAdsBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.borderWidth = 1
        removeAdsBtn.layer.borderColor  = color.cgColor
        
    }
}
