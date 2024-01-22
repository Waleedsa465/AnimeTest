import UIKit

class ResultsVC: UIViewController {
    
    lazy var shareArtVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShareArtWorkVC") as! ShareArtWorkVC
    
    lazy var editPromptVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditPromptVC") as! EditPromptVC
    
    var uploadedImage: UIImage?
    var txtLabel: String?

    @IBOutlet weak var imageViewFull: UIImageView!
    @IBOutlet weak var imageViewHalf: UIImageView!
    @IBOutlet weak var regenrateBTn: UIButton!
    @IBOutlet weak var lblTxtFromTextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCorner()
        if let image = uploadedImage {
            imageViewFull.image = image
            imageViewHalf.image = image
            
        }
        if let text = txtLabel{
            lblTxtFromTextView.text = (" # \(text)")
        }
    }
    
    func imageCorner() {
        imageViewFull.layer.cornerRadius = 10
        imageViewHalf.layer.cornerRadius = 10
        regenrateBTn.layer.cornerRadius = 10
    }
    
    @IBAction func regenrateImageBTn(_ sender: Any) {
        
        let uploadedImage = imageViewFull.image
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ShareArtWorkVC") as! ShareArtWorkVC
        
//        self.navigationController?.pushViewController(vc, animated: true)
        
        if let style = shareArtVC.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
            shareArtVC.uploadedImages = uploadedImage
        }
        self.present(shareArtVC, animated: true, completion: nil)
        print("UIView tapped")
        
    }
    
    @IBAction func downloadImageBtn(_ sender: Any) {
        if let imageToSave = imageViewFull.image {
            UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @IBAction func shareImageBtn(_ sender: Any) {
        if let imageToShare = imageViewFull.image {
            let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            showAlert(title: "Error", message: "Failed to save image. Error: \(error.localizedDescription)")
        } else {
            showAlert(title: "Success", message: "Image saved successfully.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func editPromptBtn(_ sender: Any) {
        
        if let style = editPromptVC.sheetPresentationController {
            style.detents = [.medium(), .large()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(editPromptVC, animated: true, completion: nil)
        print("UIView tapped chooseSettingVC")
    }
    
}

