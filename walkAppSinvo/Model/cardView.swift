//
//  cardView.swift
//  walkAppSinvo
//
//  Created by Rajeev on 04/09/23.
//

import Foundation
import UIKit

class cardView:UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup()
    {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.2
      //  layer.shadowRadius = 10
        
    }
}
