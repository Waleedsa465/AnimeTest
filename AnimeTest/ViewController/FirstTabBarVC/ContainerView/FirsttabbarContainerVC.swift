//
//  FirsttabbarContainerVC.swift
//  AnimeTest
//
//  Created by MacBook Pro on 19/01/2024.
//

import UIKit

class FirsttabbarContainerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let imges: [String] = ["img","img","insta","img","insta","insta","img","insta","insta","img","insta","insta","insta","insta","img","insta","img","insta","insta","insta","insta","insta","insta","insta","insta","insta","insta","img","insta","img"]
    let viewsForLbl: [String] = ["1cxzlk;las,casmxlkaxl","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","8","9","10","11","2","3","4","5","6","7","5"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FirstContainerCVC
        cell.imageView.image = UIImage(named: imges[indexPath.row])
        cell.imageView.layer.cornerRadius = 10
        cell.lblTxt.text = viewsForLbl[indexPath.row]
        return cell
    }

}
