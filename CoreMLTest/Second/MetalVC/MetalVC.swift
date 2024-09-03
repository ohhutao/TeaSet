//
//  CeramicsVC.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/7.
//

import UIKit
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height
class MetalVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    func setUI(){
        
        // 创建 UIImageView 来显示自定义图片
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "背景") // 替换为你自定义图片的名称
        self.view.addSubview(backgroundImage)
        
        let image = UIImageView(frame: CGRect(x: 40, y: 100, width: 80, height: 250))
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "阁楼牌2")
        self.view.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 62, y: 150, width: 60, height: 150))
        label.text = "冶金阁"
        label.numberOfLines = 0
        label.textColor = UIColor(cgColor: CGColor(red: 34 / 256, green: 47 / 256, blue: 42 / 256, alpha: 1))
        label.font = UIFont.systemFont(ofSize: 35)
        self.view.addSubview(label)
        
        // 创建可点击的按钮1
        let button1 = UIButton(frame: CGRect(x: 210, y: 130, width: 160, height: 160))
        button1.setBackgroundImage(UIImage(named: "金质"), for: .normal)
        button1.hero.id = "1"
        button1.addTarget(self, action: #selector(skip(sender:)), for: .touchUpInside)
        button1.tag = 1
        view.addSubview(button1)
        
        let button2 = UIButton(frame: CGRect(x: -20, y: 360, width: 150, height: 150))
        button2.setBackgroundImage(UIImage(named: "铜质"), for: .normal)
        button2.hero.id = "2"
        button2.addTarget(self, action: #selector(skip(sender:)), for: .touchUpInside)
        button2.tag = 2
        view.addSubview(button2)
        
        let button3 = UIButton(frame: CGRect(x: 70, y: 550, width: 180, height: 180))
        button3.setBackgroundImage(UIImage(named: "银质"), for: .normal)
        button3.hero.id = "3"
        button3.addTarget(self, action: #selector(skip(sender:)), for: .touchUpInside)
        button3.tag = 3
        view.addSubview(button3)
        
        let button4 = UIButton(frame: CGRect(x: 130, y: 320, width: 150, height: 150))
        button4.setBackgroundImage(UIImage(named: "锡质"), for: .normal)
        button4.hero.id = "4"
        button4.addTarget(self, action: #selector(skip(sender:)), for: .touchUpInside)
        button4.tag = 4
        view.addSubview(button4)
        
        let button5 = UIButton(frame: CGRect(x: 270, y: 380, width: 130, height: 130))
        button5.setBackgroundImage(UIImage(named: "铁质"), for: .normal)
        button5.hero.id = "5"
        button5.addTarget(self, action: #selector(skip(sender:)), for: .touchUpInside)
        button5.tag = 5
        view.addSubview(button5)

    }
    
    @objc func skip(sender:UIButton){
        let vc = IntroduceVC()
        vc.hero.isEnabled = true
        vc.modalPresentationStyle = .fullScreen
        switch sender.tag {
            case 1: 
                vc.imageName = "金质"
                vc.image.hero.id = "1"
                vc.intruduce = metalData["金质"]!
            case 2:
                vc.imageName = "铜质"
                vc.image.hero.id = "2"
                vc.intruduce = metalData["铜质"]!
            case 3:
                vc.imageName = "银质"
                vc.image.hero.id = "3"
                vc.intruduce = metalData["银质"]!
            case 4:
                vc.imageName = "锡质"
                vc.image.hero.id = "4"
                vc.intruduce = metalData["锡质"]!
            case 5:
                vc.imageName = "铁质"
                vc.image.hero.id = "5"
                vc.intruduce = metalData["铁质"]!
            default: break
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}