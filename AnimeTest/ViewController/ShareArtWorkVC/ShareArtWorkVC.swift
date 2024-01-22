import UIKit

class ShareArtWorkVC: UIViewController {
    
    var uploadedImages: UIImage?
    
    lazy var addVanceSettings = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultRegenerateVC") as! ResultRegenerateVC
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewForHide: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var shareAndSaveBTn: UIButton!
    @IBOutlet weak var shareAndSaveImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        allBorder()
        if let image = uploadedImages {
            imageView.image = image
        }
    }

    @IBAction func segmentForWandO(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewForHide.isHidden = false
            shareAndSaveBTn.setTitle("Share", for: .normal)
            shareAndSaveImage.image = UIImage(named: "Image 9")
        case 1:
            viewForHide.isHidden = true
            shareAndSaveBTn.setTitle("Save", for: .normal)
            shareAndSaveImage.image = UIImage(named: "Image 10")
        default:
            break
        }
    }

    @IBAction func shareAndSaveBtnTapped(_ sender: UIButton) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            // Implement your share function here
            shareImage()
        case 1:
            // Implement your save function here
            saveImage()
        default:
            break
        }
    }

    func allBorder() {
        let color = UIColor(red: 122/250, green: 89/250, blue: 254/250, alpha: 1)
        shareAndSaveBTn.layer.cornerRadius = 10
        shareAndSaveImage.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        viewForHide.layer.cornerRadius = 10
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = color.cgColor
    }

    func shareImage() {
        guard let imageToShare = imageView.image else {
            showAlert(title: "Error", message: "No image to share.")
            return
        }

        let alertController = UIAlertController(title: "Success", message: "Image shared successfully.", preferredStyle: .alert)

        let regenerateAction = UIAlertAction(title: "Regenerate", style: .default) { _ in
            self.regeneratePhoto()
        }

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Implement your share function here
            let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)

            self.present(activityViewController, animated: true, completion: nil)

            activityViewController.completionWithItemsHandler = { (_, _, _, error) in
                if let error = error {
                    self.showAlert(title: "Error", message: "Failed to share image. Error: \(error.localizedDescription)")
                } else {
                    self.showAlert(title: "Success", message: "Image shared successfully.")
                }
            }
        }

        alertController.addAction(okAction)
        alertController.addAction(regenerateAction)

        present(alertController, animated: true, completion: nil)
    }

    func saveImage() {
        guard let imageToSave = imageView.image else {
            showAlert(title: "Error", message: "No image to save.")
            return
        }

        let alertController = UIAlertController(title: "Success", message: "Image saved successfully.", preferredStyle: .alert)

        let regenerateAction = UIAlertAction(title: "Regenerate", style: .default) { _ in
            self.regeneratePhoto()
        }

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alertController.addAction(okAction)
        alertController.addAction(regenerateAction)

        present(alertController, animated: true, completion: nil)

        UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
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

    func regeneratePhoto() {
        if let style = addVanceSettings.sheetPresentationController {
            style.detents = [.medium()]
            style.prefersScrollingExpandsWhenScrolledToEdge = false
            style.preferredCornerRadius = 20
            style.prefersGrabberVisible = true
        }
        self.present(addVanceSettings, animated: true, completion: nil)
        print("Regenerating photo...")
    }

}
