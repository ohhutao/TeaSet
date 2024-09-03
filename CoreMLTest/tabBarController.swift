//
//  tabBarController.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/9.
//

import UIKit

class tabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: firstVC())
        vc1.tabBarItem = UITabBarItem(title: "阁楼", image: UIImage(named: "塔01"), tag: 1)

        let vc2 = UINavigationController(rootViewController: machine1())
        vc2.tabBarItem = UITabBarItem(title: "识别", image: UIImage(named: "物体识别"), tag: 2)
        
        let vc3 = UINavigationController(rootViewController:guide() )
        vc3.tabBarItem = UITabBarItem(title: "指南", image: UIImage(named: "指南"), tag: 3)
        self.viewControllers = [vc1,vc2,vc3]
    }

}
