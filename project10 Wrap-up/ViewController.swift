//
//  ViewController.swift
//  project10 Wrap-up
//
//  Created by Denys Denysenko on 03.11.2021.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var photos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Album"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                photos.append(item)
            }
        }
        
        photos.sort()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as? PhotoCell else {fatalError("Unable to load cell")}
        
        cell.photoName.text = photos[indexPath.item]
        cell.imageView.image = UIImage(named: photos[indexPath.item])
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController
        vc?.selectedPhoto = photos[indexPath.item]
        navigationController?.pushViewController(vc!, animated: true)
    }


}

