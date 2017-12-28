//
//  PageCell.swift
//  Audible
//
//  Created by Peter on 12/18/17.
//  Copyright © 2017 Nick. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet{
            guard let page = page else {
           return
            }
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            imageView.image = UIImage(named: imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)

            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .medium), kCTForegroundColorAttributeName as NSAttributedStringKey: color])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), kCTForegroundColorAttributeName as NSAttributedStringKey: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, length))
            
            textView.attributedText = attributedText
            
        }
    }
    
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
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return lineView
    }()
    
    func setupView() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeparatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
