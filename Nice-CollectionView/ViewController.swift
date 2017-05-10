//
//  ViewController.swift
//  Nice-CollectionView
//
//  Created by ginppian on 09/05/17.
//  Copyright © 2017 Nut Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let array = ["img1", "img2", "img3", "img4", "img5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NiceCollectionViewCell.identifier,
                                                      for: indexPath) as! NiceCollectionViewCell
        
        cell.imagen.image = UIImage(named: array[indexPath.item])
        
        return cell
    }
}
