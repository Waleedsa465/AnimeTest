//
//  AdvanceSettingVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 17/01/2024.
//

import UIKit

class AdvanceSettingVC: UIViewController {
    @IBOutlet weak var highResoltionView: UIView!
    @IBOutlet weak var wideAngleSV: UIStackView!
    @IBOutlet weak var enhancePromptSV: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cornerRadiusForStackViewAndUIview()
        // Do any additional setup after loading the view.
    }
    
    
    func cornerRadiusForStackViewAndUIview(){
        let color = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
        highResoltionView.backgroundColor = color
        highResoltionView.layer.cornerRadius = 10
    }
    
    
}

//highResoltionView color below
//rgba(234, 234, 234, 1)
