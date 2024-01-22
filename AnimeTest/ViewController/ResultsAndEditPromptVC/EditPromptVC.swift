//
//  EditPromptVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 20/01/2024.
//

import UIKit

class EditPromptVC: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UITextViewDelegate {
    
    lazy var chooseSettingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseArtStyleVC") as! ChooseArtStyleVC
    
    var characterLimit = 200
    
    @IBOutlet weak var generateBtnView: UIView!
    @IBOutlet weak var generateBtn: UIButton!
    @IBOutlet weak var advanceSettingView: UIView!
    @IBOutlet weak var removeAdsBtn: UIButton!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    let imges: [String] = ["img","img","insta","img","insta","insta","img","insta","insta","img","insta","insta","insta","insta","img","insta","img","insta","insta","insta","insta","insta","insta","insta","insta","insta","insta","img","insta","img"]
    let viewsForLbl: [String] = ["1cxzlk;las,casmxlkaxl","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = "Create anime art"
        
        borderForAll()
        
        textView.delegate = self
        textView.layer.borderWidth = 1.0
        textView.textColor = UIColor.lightGray
        textView.text = "Create anime arts"
        
        textView.layer.cornerRadius = 6
        
        updateCharacterCountLabel()
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentText = textView.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= characterLimit
    }

    func textViewDidChange(_ textView: UITextView) {
        updateCharacterCountLabel()
    }

    // Helper method to update character count label
    func updateCharacterCountLabel() {
        let currentCount = textView.text.count
        characterCountLabel.text = "(\(currentCount)/\(characterLimit))"
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Create anime arts"{
            textView.text = ""
            textView.textColor = UIColor.black
            
        }
    }

    
    @IBAction func clearBtn(_ sender: Any) {
        textView.text = ""
        updateCharacterCountLabel()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EditPromptCVC
        cell.imageView.image = UIImage(named: imges[indexPath.row])
        cell.imageView.layer.cornerRadius = 10
        cell.lblTxt.text = viewsForLbl[indexPath.row]
        return cell
        
    }

    
    @IBAction func seeAllBtn(_ sender: Any) {
        
        if let style = chooseSettingVC.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(chooseSettingVC, animated: true, completion: nil)
        print("UIView tapped chooseSettingVC")
        
    }
    
    func borderForAll(){
        let removeAds = UIColor(red: 122/255, green: 89/255, blue: 254/255, alpha: 1)
        let color = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
        let colorss = UIColor(red: 122/255.0, green: 89/255.0, blue: 254/255.0, alpha: 1)
        let colors = UIColor(red: 232/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
        let borderColor = UIColor(red: 122/255.0, green: 89/255.0, blue: 254/255.0, alpha: 1)
        advanceSettingView.backgroundColor = colorss
        advanceSettingView.backgroundColor = colors
        textView.layer.borderColor = colorss.cgColor
        advanceSettingView.layer.borderColor = borderColor.cgColor
        advanceSettingView.layer.borderWidth = 1
        advanceSettingView.layer.cornerRadius = 10
        generateBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.cornerRadius = 10
        removeAdsBtn.layer.borderWidth = 1
        removeAdsBtn.layer.borderColor  = removeAds.cgColor
        
    }
    
}
