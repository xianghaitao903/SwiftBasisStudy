//
//  ViewController.swift
//  UsingSwiftWithCocoaAndOC
//
//  Created by 向海涛 on 15/11/26.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func initTableView() {
        let myTableView: UITableView = UITableView(frame: CGRectZero, style: .Grouped)
        self.view.addSubview(myTableView)
        let backGroundColor: UIColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        myTableView.backgroundColor = backGroundColor
    }

}

