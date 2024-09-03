//
//  firstVC.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/7.
//

import UIKit

class firstVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    lazy var backimage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        image.image = UIImage(named: "home")
        return image
    }()
    
    lazy var wood : UIButton = {
        let button = UIButton(frame: CGRect(x: 88, y: 475 , width: 210, height: 45))
        //button.setTitle("wood", for: .normal)
        button.addTarget(self, action: #selector(woodButton), for: .touchUpInside)
        return button
    }()
    
    lazy var glass : UIButton = {
        let button = UIButton(frame: CGRect(x: 90, y:305 , width: 200, height: 45))
        //button.setTitle("glass", for: .normal)
        button.addTarget(self, action: #selector(glassButton), for: .touchUpInside)
        return button
    }()
    
    lazy var purplesand: UIButton = {
        let button = UIButton(frame: CGRect(x: 88, y:395 , width: 210, height: 45))
        //button.setTitle("purplesand", for: .normal)
        button.addTarget(self, action: #selector(purplsandButton), for: .touchUpInside)
        return button
    }()
    
    lazy var ceramics : UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y:645 , width: 350, height: 85))
        //button.setTitle("ceramics", for: .normal)
        button.addTarget(self, action: #selector(ceramicsButton), for: .touchUpInside)
        return button
    }()
    
    lazy var metal : UIButton = {
        let button = UIButton(frame: CGRect(x: 88, y:550 , width: 210, height: 50))
        //button.setTitle("metal", for: .normal)
        button.addTarget(self, action: #selector(metalButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(backimage)
        self.view.addSubview(glass)
        self.view.addSubview(purplesand)
        self.view.addSubview(ceramics)
        self.view.addSubview(metal)
        self.view.addSubview(wood)
    }
    
    @objc func ceramicsButton(){
        let vc = CeramicsVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func woodButton(){
        let vc = WoodVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func purplsandButton(){
        let vc = PurplesandVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func metalButton(){
        let vc = MetalVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func glassButton(){
        let vc = glassVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
