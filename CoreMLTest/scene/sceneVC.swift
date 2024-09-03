//
//  sceneVC.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/8.
//

import UIKit
import SceneKit
var ceramicsScene = SCNScene(named: "陶瓷.usdz")
var woodScene = SCNScene(named: "木质.usdz")
var glassScene = SCNScene(named: "玻璃.usdz")
var metalScene = SCNScene(named: "金属.usdz")
var purplesandScene = SCNScene(named: "紫砂.usdz")

class sceneVC: UIViewController {
    
    var text = ""
    var text2 = ""
    let modelNode = SCNNode()
    let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: width, height: 300))
    var scene : SCNScene!
    lazy var backView : UIImageView = {
        let back = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        back.image = UIImage(named: "introduce")
        return back
    }()
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 300, width: width, height: 40))
        label.text = text2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    lazy var introduceLabel : PaddedLabel = {
        
        let label = PaddedLabel()
        let attributedString = NSMutableAttributedString(string: text)
        
        // 设置行间距
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10 // 调整行间距大小
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
        let maxSize = CGSize(width: width - 30, height: CGFloat.infinity)
        let textRect = attributedString.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        
        // 设置 label 的尺寸
        label.frame = CGRect(x: 0, y: 0, width: width, height: textRect.height)
        label.textInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()//根本文本内容自动调整大小
        return label
    }()
    lazy var scroll : UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 340, width: width, height: 540))
        return view
    }()
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        for child in scene!.rootNode.childNodes{
            modelNode.addChildNode(child)
        }
        modelNode.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene?.rootNode.addChildNode(modelNode)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backView)
        self.view.addSubview(sceneView)
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .clear
        sceneView.autoenablesDefaultLighting = true
        scroll.addSubview(introduceLabel)
        scroll.contentSize = CGSize(width: width, height: introduceLabel.frame.maxY)
        self.view.addSubview(label)
        self.view.addSubview(scroll)
        self.view.backgroundColor = .white
        let backbutton = UIButton(frame: CGRect(x: 20, y: 40, width: 40, height: 40))
        backbutton.setImage(UIImage(named: "last"), for: .normal)
        backbutton.addTarget(self, action: #selector(diss), for: .touchUpInside)
        self.view.addSubview(backbutton)
    }
    
    @objc func diss(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}
