//
//  IntroduceVC.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/7.
//

import UIKit
import Hero
class IntroduceVC: UIViewController {
    var imageName : String!
    var intruduce : String = ""
    var font = 80
    lazy var backImage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        image.image = UIImage(named: "introduce")
        return image
    }()
    
    lazy var image : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 50, width: 200, height: 200))
        image.image = UIImage(named: imageName)
        return image
    }()
    
    lazy var jianjieLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 250, width: width, height: 50))
        label.text = "简介："
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 50, width: 200, height: 200))
        label.text = imageName
        label.font = UIFont.systemFont(ofSize: CGFloat(font))
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var introduceLabel : PaddedLabel = {
        let label = PaddedLabel()
        let attributedString = NSMutableAttributedString(string: intruduce)
        
        // 设置行间距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10 // 调整行间距大小
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
//        let maxSize = CGSize(width: width - 30, height: CGFloat.infinity)
//        let textRect = attributedString.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        
        // 设置 label 的尺寸
        label.frame = CGRect(x: 0, y: 0, width: width, height: 100)
        label.textInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        //根本文本内容自动调整大小
        label.sizeToFit()
        return label
    }()
    
    lazy var scroll : UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 300, width: width, height: 580))
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        //scroll.contentSize = CGSize(width: width, height: introduceLabel.frame.maxY)
    }
    @objc func diss(){
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backImage)
        self.view.addSubview(image)
        self.view.addSubview(label)
        self.view.addSubview(jianjieLabel)
        scroll.addSubview(introduceLabel)
        scroll.contentSize = CGSize(width: width, height: introduceLabel.frame.maxY)
        self.view.addSubview(scroll)
        self.view.backgroundColor = .white
        let backbutton = UIButton(frame: CGRect(x: 20, y: 40, width: 40, height: 40))
        backbutton.setImage(UIImage(named: "last"), for: .normal)
        backbutton.addTarget(self, action: #selector(diss), for: .touchUpInside)
        self.view.addSubview(backbutton)
    }
}

class PaddedLabel: UILabel {
    
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += textInsets.left + textInsets.right
        contentSize.height += textInsets.top + textInsets.bottom
        return contentSize
    }
}

