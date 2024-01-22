//
//  AnimeArtVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 17/01/2024.
//

import UIKit

class AnimeArtVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate {
    
    lazy var addVanceSettings = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvanceSettingVC") as! AdvanceSettingVC
    
    lazy var chooseSettingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseArtStyleVC") as! ChooseArtStyleVC

    var characterLimit = 200
    
    let imges: [String] = ["img","img","insta","img","insta","insta","img","insta","insta","img","insta","insta","insta","insta","img","insta","img","insta","insta","insta","insta","insta","insta","insta","insta","insta","insta","img","insta","img"]
    let viewsForLbl: [String] = ["1cxzlk;las,casmxlkaxl","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","5"]
    
    @IBOutlet weak var advanceSettingView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    @IBOutlet weak var chooseArtStyleBtn: UIButton!
    @IBOutlet weak var generateBtnView: UIView!
    @IBOutlet weak var generateBtn: UIButton!
    @IBOutlet weak var generateBtnImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.layer.borderWidth = 1.0
        textView.textColor = UIColor.lightGray
        textView.text = "Create anime arts"
        updateCharacterCountLabel()
        
        colorChangeForUploadImageView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        advanceSettingView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if let style = addVanceSettings.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(addVanceSettings, animated: true, completion: nil)
        print("UIView tapped advance vc")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FirsttababrArtCVC
        cell.imageView.image = UIImage(named: imges[indexPath.row])
        cell.imageView.layer.cornerRadius = 10
        cell.lblTxt.text = viewsForLbl[indexPath.row]
        return cell
    }
    
    
    @IBAction func clearBtn(_ sender: Any) {
        textView.text = ""
        updateCharacterCountLabel()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
        
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

    
    @IBAction func chooseArtStyleBtn(_ sender: Any) {
        
        if let style = chooseSettingVC.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(chooseSettingVC, animated: true, completion: nil)
        print("UIView tapped chooseSettingVC")
    }
    
    @IBAction func inspirationBTn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InspirationVC") as! InspirationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func colorChangeForUploadImageView() {
        let color = UIColor(red: 232/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
        let borderColor = UIColor(red: 122/255.0, green: 89/255.0, blue: 254/255.0, alpha: 1)
        textView.layer.borderColor = borderColor.cgColor
        textView.backgroundColor = color
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        advanceSettingView.layer.borderColor = borderColor.cgColor
        advanceSettingView.backgroundColor = color
        advanceSettingView.layer.borderWidth = 1
        advanceSettingView.layer.cornerRadius = 10
        generateBtnView.layer.cornerRadius = 10
        generateBtnImage.layer.cornerRadius = 10
        generateBtn.layer.cornerRadius = 10
        
    }
    
    @IBAction func generateBTn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
}

