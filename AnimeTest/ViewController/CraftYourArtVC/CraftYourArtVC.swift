//
//  CraftYourArtVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 20/01/2024.
//

import UIKit

class CraftYourArtVC: UIViewController {

    @IBOutlet weak var upscaleBtn: UIButton!
    @IBOutlet weak var imageViewBlur: UIImageView!
    @IBOutlet weak var imageViewClear: UIImageView!
    @IBOutlet weak var removeAdsBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderColor()
        // Do any additional setup after loading the view.
    }
    
    
    func borderColor(){
        let color = UIColor(red: 122/255, green: 89/255, blue: 254/255, alpha: 1)
        upscaleBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.borderWidth = 1
        removeAdsBtn.layer.borderColor  = color.cgColor
        
        
    }
    
    

}
