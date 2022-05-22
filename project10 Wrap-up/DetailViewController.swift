//
//  DetailViewController.swift
//  project10 Wrap-up
//
//  Created by Denys Denysenko on 03.11.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var largeImageView: UIImageView!
    
    var selectedPhoto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedPhoto
        navigationItem.largeTitleDisplayMode = .never
        
        largeImageView.image = UIImage(named: selectedPhoto!)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
  

}
