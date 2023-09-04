//
//  TabBarViewController.swift
//  walkAppSinvo
//
//  Created by Rajeev on 04/09/23.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate{


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 2
        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("item tapped")
        if  let tabbar = tabBar as? TabBarView
        {
            tabbar.updateConstraints()
            tabbar.updateCurveForTappedIndex()
        }
    }
    

}
