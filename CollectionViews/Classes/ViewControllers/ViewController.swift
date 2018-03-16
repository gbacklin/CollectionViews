//
//  ViewController.swift
//  CollectionViews
//
//  Created by Backlin,Gene on 3/15/18.
//  Copyright © 2018 Backlin,Gene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var resultLabel: UILabel!
    
    var items: [UIImage] = [UIImage]()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Utility methods
    
    func setupUI() {
        questionLabel.text = "Select the blue colored square."
        loadImages()
    }
    
    func loadImages() {
        for index in 1...3 {
            items.append(UIImage(named: "\(index)")!)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Configure the cell
        cell.backgroundColor = UIColor(patternImage: items[indexPath.row])

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        resultLabel.text = "You selected image number \(indexPath.row + 1)"
    }
}
