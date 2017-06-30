//
//  ViewController.swift
//  MaskDemo
//
//  Created by 陈旭 on 2017/5/5.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit




//public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
//public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height
class ViewController: UIViewController,UITextFieldDelegate {
    
    var tableView: UITableView!

    @IBOutlet weak var tvTest: UITextField!
    @IBOutlet weak var lbTextPrice: UILabel!
    var starIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.addSubview(commitBtn)
        
    }

    lazy var commitBtn: UIButton = {
        
        let btn = UIButton(frame:CGRect.init(x: 0, y: 300, width: MGScreenWidth, height: 50))
        btn.addTarget(self, action: #selector(commitClickAction), for: .touchUpInside)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("提交", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
        
    }()
    func commitClickAction()  {
        
        let vc = WOWBasePickerViewController()
        
        vc.showPicker(arr: ["a","b","c","d"], index: starIndex)
        vc.selectBlock = { [weak self](str,index) in
            if let strongSelf = self {
                strongSelf.starIndex = index
            }
            print(str,index)
        }
        self.presentToMaskViewController(viewControllerToPresent: vc)
    }

    
    lazy var testView:TestView = {[unowned self] in
        
        let v = Bundle.main.loadNibNamed(String(describing: TestView.self), owner: self, options: nil)?.last as! TestView
        v.frame = CGRect.init(x: 0, y: MGScreenHeight - 300, width: MGScreenWidth, height: 300)
        return v
        
        }()
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

