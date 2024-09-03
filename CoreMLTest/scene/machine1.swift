//
//  machine1.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/9.
//

import UIKit

class machine1: UIViewController {
    
    lazy var background : UIImageView = {
        let back = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        back.image = UIImage(named: "双向背景")
        return back
    }()
    
    lazy var example : UIImageView = {
        let back = UIImageView(frame: CGRect(x: 20, y: 150, width: width, height: 450))
        back.contentMode = .scaleAspectFit
        back.image = UIImage(named: "示例")
        return back
    }()
    
    lazy var button : UIButton = {
        let button = UIButton(frame:CGRect(x: width / 2 - 40, y: 650, width: 80, height: 80))
        button.layer.cornerRadius = 40
        button.setTitle("开始识别", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 66 / 256, green: 185 / 256, blue:  131 / 256, alpha: 1)
        return button
    }()
    
    lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 60, width: width, height: 40))
        label.text = "雅器寻踪"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        self.view.addSubview(label)
        self.view.addSubview(example)
        self.view.addSubview(button)
    }
    
    @objc func tap(){
        let vc = machine()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
