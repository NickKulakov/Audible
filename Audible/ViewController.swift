//
//  ViewController.swift
//  Audible
//
//  Created by Peter on 12/15/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.black
        
        return cv
    } ()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        // cvToView()
        // collectionView.frame = view.frame
        //use autolayout instead
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        
    }
    
    //    func cvToView() {
    //        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    //        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    //        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
 //       cell.backgroundColor = UIColor.white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

extension UIView {
    
    func anchorToTop (top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor?, left:NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: rightConstant).isActive = true
        }
    }
    
}



