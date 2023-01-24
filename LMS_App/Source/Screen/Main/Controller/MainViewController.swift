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
        
        mainVCInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func mainVCInit() {
        let image = UIImage(named: "symbol.png")
        symbolImage.image = image
    }
    
    @IBAction func moveToSearchView(_ sender: Any) {
        guard let searchVC = UIStoryboard(name: "SearchViewController", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else {return}
        
        searchVC.modalTransitionStyle = .coverVertical
        searchVC.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @IBAction func moveToBackpackView(_ sender: Any) {
    }
    
    @IBAction func moveToMiridamgiView(_ sender: Any) {
    }
    
    @IBAction func moveToSincheongView(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
