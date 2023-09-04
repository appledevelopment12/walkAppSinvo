//
//  CollectionViewCell2.swift
//  walkAppSinvo
//
//  Created by Rajeev on 04/09/23.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {

    
    static let identifier = String(describing: CollectionViewCell2.self)
    
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var imgName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup2(category:collect2)
    {
     
        img2.image = UIImage(named: category.imageName)
        imgName.text = category.imageNamee
       
        
        
    }
    
    
    
    
}

