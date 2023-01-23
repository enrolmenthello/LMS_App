//
//  MainViewController.swift
//  LMS_App
//
//  Created by 유상 on 2023/01/17.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "symbol.png")
        symbolImage.image = image
    }
    
    @IBAction func moveToSearchView(_ sender: Any) {
        guard let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {return}
        searchVC.modalTransitionStyle = .coverVertical
        searchVC.modalPresentationStyle = .fullScreen
        
        self.present(searchVC, animated: true)
    }
    
    @IBAction func moveToBackpackView(_ sender: Any) {
    }
    
    @IBAction func moveToMiridamgiView(_ sender: Any) {
    }
    
    @IBAction func moveToSincheongView(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
}
