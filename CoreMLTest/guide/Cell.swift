//
//  Cell.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/9.
//

import UIKit

class Cell: UICollectionViewCell {
    
    var text1 = ""
    var imagename : String?
    
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x:20, y: 80, width: 200, height: 70))
        label.text = text1
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    lazy var Photo : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 220, y: 0, width: 150, height: 150))
        image.image = UIImage(named: imagename!)
        return image
    }()
    
    lazy var back : UIImageView = {
        let back = UIImageView(frame: CGRect(x: 0, y: 0, width: 350, height: 150))
        back.image = UIImage(named: "框框")
        back.layer.cornerRadius = 15
        back.clipsToBounds = true
        return back
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
        self.addSubview(back)
        self.addSubview(label)
        self.addSubview(Photo)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
