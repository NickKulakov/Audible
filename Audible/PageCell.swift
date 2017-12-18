//
//  PageCell.swift
//  Audible
//
//  Created by Peter on 12/18/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.yellow
        iv.image = UIImage.init(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    func setupView() {
       // backgroundColor = UIColor.blue
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
