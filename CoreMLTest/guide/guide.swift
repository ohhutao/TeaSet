//
//  guide.swift
//  CoreMLTest
//
//  Created by hutao on 2024/4/9.
//

import UIKit

class guide: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    let id = "id"
    
    lazy var background : UIImageView = {
        let back = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        back.image = UIImage(named: "双向背景")
        return back
    }()
    
    lazy var label : UILabel = {
       let label = UILabel(frame: CGRect(x: 20, y: 40, width:width , height: 50))
       label.text = "使用指南"
       label.font = UIFont.systemFont(ofSize: 30)
       return label
    }()
    
    lazy var collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 90, width: width, height: 660),collectionViewLayout: layout)
         collectionView.register(Cell.classForCoder(), forCellWithReuseIdentifier: id)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(background)
        self.view.addSubview(label)
        collectionview.delegate = self
        collectionview.dataSource = self
        self.view.addSubview(collectionview)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        switch index{
            case 0:
                let vc = guide2VC()
                vc.hidesBottomBarWhenPushed = true
                vc.text = guideData["金属"]!
                vc.scene = metalScene
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = guide2VC()
                vc.hidesBottomBarWhenPushed = true
                vc.text = guideData["紫砂"]!
                vc.scene = purplesandScene
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = guide2VC()
                vc.hidesBottomBarWhenPushed = true
                vc.text = guideData["陶瓷"]!
                vc.scene = ceramicsScene
                self.navigationController?.pushViewController(vc, animated: true)
            case 3:
                let vc = guide2VC()
                vc.hidesBottomBarWhenPushed = true
                vc.text = guideData["玻璃"]!
                vc.scene = glassScene
                self.navigationController?.pushViewController(vc, animated: true)
            case 4:
                let vc = guide2VC()
                vc.hidesBottomBarWhenPushed = true
                vc.text = guideData["木质"]!
                vc.scene = woodScene
                self.navigationController?.pushViewController(vc, animated: true)
            default:break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! Cell
        let index = indexPath.item
        switch index{
            case 0:
                cell.text1 = "金属茶具"
                cell.imagename = "铁质"
            case 1:
                cell.text1 = "紫砂茶具"
                cell.imagename = "黑泥"
            case 2:
                cell.text1 = "陶瓷茶具"
                cell.imagename = "彩瓷"
            case 3:
                cell.text1 = "玻璃茶具"
                cell.imagename = "手工吹制"
            case 4:
                cell.text1 = "木质茶具"
                cell.imagename = "槐木"
            default:break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    //cell的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 20)
    }

}
