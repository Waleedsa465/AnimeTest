import UIKit

class UploadVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var addVanceSettings = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdvanceSettingVC") as! AdvanceSettingVC
    lazy var chooseSettingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseArtStyleVC") as! ChooseArtStyleVC

    var characterLimit = 200
    var selectedCellText: String?
    
    @IBOutlet weak var uploadImageView: UIView!
    @IBOutlet weak var uploadImage: UIImageView!

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var characterCountLabel: UILabel!

    @IBOutlet weak var advanceView: UIView!
    @IBOutlet weak var generateView: UIView!
    @IBOutlet weak var generateImageView: UIImageView!
    @IBOutlet weak var generateBtn: UIButton!
    
    
    let imges: [String] = ["img","img","insta","img","insta","insta","img","insta","insta","img","insta","insta","insta","insta","img","insta","img","insta","insta","insta","insta","insta","insta","insta","insta","insta","insta","img","insta","img"]
    let viewsForLbl: [String] = ["1cxzlk;las,casmxlkaxl","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        borderFor()
        updateCharacterCountLabel()
        colorChangeForUploadImageView()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        advanceView.addGestureRecognizer(tapGesture)
        
    }
    
    func borderFor(){
        textView.delegate = self
        textView.layer.borderWidth = 1.0
        textView.textColor = UIColor.lightGray
        textView.text = "Create anime arts"
        uploadImage.layer.cornerRadius = 10
        generateView.layer.cornerRadius = 10
        generateImageView.layer.cornerRadius = 10
        uploadImage.layer.cornerRadius = 10
        textView.layer.cornerRadius = 6
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Create anime arts" {
            updateCharacterCountLabel()
            textView.text = ""
            textView.textColor = UIColor.black
        }
        if let selectedText = selectedCellText {
            updateCharacterCountLabel()
            textView.text = selectedText
            textView.textColor = UIColor.black
        }
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        if let style = addVanceSettings.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(addVanceSettings, animated: true, completion: nil)
        print("UIView tapped")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imges.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ArtStyleCollectionVC
        cell.imageView.image = UIImage(named: imges[indexPath.row])
        cell.imageView.layer.cornerRadius = 10
        cell.lblTxt.text = viewsForLbl[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCharacterCountLabel()
        selectedCellText = viewsForLbl[indexPath.row]
        textView.text = selectedCellText
    }
    @IBAction func clearBtn(_ sender: Any) {
        textView.text = ""
        selectedCellText = nil
        updateCharacterCountLabel()
    }
    
    func colorChangeForUploadImageView() {
        let color = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
        let colorss = UIColor(red: 122/255.0, green: 89/255.0, blue: 254/255.0, alpha: 1)
        let colors = UIColor(red: 232/255.0, green: 224/255.0, blue: 255/255.0, alpha: 1)
        let borderColor = UIColor(red: 122/255.0, green: 89/255.0, blue: 254/255.0, alpha: 1)
        advanceView.backgroundColor = colorss
        advanceView.backgroundColor = colors
        advanceView.layer.borderColor = borderColor.cgColor
        advanceView.layer.borderWidth = 1
        advanceView.layer.cornerRadius = 10
        textView.backgroundColor = color
        textView.layer.cornerRadius = 10
        textView.backgroundColor = colors
        textView.layer.borderColor = colorss.cgColor
        textView.layer.borderWidth = 1
        generateBtn.layer.cornerRadius = 10
    }

    @IBAction func selectImageBtn(_ sender: Any) {
        // Handle image selection
        showImagePicker()
    }

    // MARK: - UITextViewDelegate

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
    

    
    func showImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            uploadImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func generateBtn(_ sender: Any) {
        guard let uploadedImage = uploadImage.image else {
            let alert = UIAlertController(title: "No Image Selected", message: "Please select an image before generating results.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             self.present(alert, animated: true, completion: nil)
            return
        }
        guard let text = textView.text else { return  }
        let resultsVC = storyboard?.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsVC
        resultsVC.uploadedImage = uploadedImage
        resultsVC.txtLabel = text
        self.navigationController?.pushViewController(resultsVC, animated: true)
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
    
}
