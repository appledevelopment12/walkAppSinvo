//
//  HomeViewController.swift
//  walkAppSinvo
//
//  Created by Rajeev on 04/09/23.
//

import UIKit

class HomeViewController: UIViewController {


    
    
    @IBOutlet var CollectionView1:UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var ui: UIView!
    var currentcellIndex = 0
    var webSeriesImages = ["offer","offer","offer","offer","offer"]
    @IBOutlet weak var page: UIPageControl!
    var timer:Timer?
    
    
    var categories2 = [
        
        collect2(_Imgname: "saloon", _imagenamee: "Saloon"),
        collect2(_Imgname: "ic_retail", _imagenamee: "Retail"),
        collect2(_Imgname: "mall", _imagenamee: "Malls"),
        collect2(_Imgname: "vector_smart_object_1_2", _imagenamee: "GYM"),
        collect2(_Imgname: "vector_smart_object_4", _imagenamee: "Grocery"),
        collect2(_Imgname: "saloon", _imagenamee: "Saloon"),
        collect2(_Imgname: "ic_retail", _imagenamee: "Retail"),
        collect2(_Imgname: "vector_smart_object_4", _imagenamee: "Grocery"),
        collect2(_Imgname: "saloon", _imagenamee: "Saloon"),
      //  collect2(_Imgname: "ic_retail", _imagenamee: "Retail"),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //registerNib()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        page.numberOfPages = webSeriesImages.count
        ui.layer.cornerRadius = 10
    }
    
    
    
    @objc func slideToNext()
    {
        if currentcellIndex < webSeriesImages.count-1
        {
            currentcellIndex  = currentcellIndex + 1
        }
        
        else
        {
            currentcellIndex = 0
        }
        page.currentPage = currentcellIndex
        CollectionView1.scrollToItem(at:IndexPath(item:currentcellIndex,section: 0),at: .right , animated:true)
    }

//    private func registerNib()
//    {
//      //  CollectionView1.register(UINib(nibName: CollectionViewCell1.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell1.identifier)
//
//        collectionView2.register(UINib(nibName: CollectionViewCell2.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell2.identifier)
//
//    }
    
}

extension  HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CollectionView1
        {
            return webSeriesImages.count

        }
        if collectionView == self.collectionView2
        {
            return categories2.count
        }
        return categories2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CollectionView1
        {
            let cell = CollectionView1.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CollectionViewCell1
            
            cell.img1.image = UIImage(named: webSeriesImages[indexPath.row])

            //cell.setup(category: categories[indexPath.row])
            return cell
        }
        else if collectionView == collectionView2
        {
            let cell = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell2
            cell.setup2(category: categories2[indexPath.row])
            cell.layer.cornerRadius = 20
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowColor = UIColor.blue.cgColor
            cell.layer.shadowOffset = .zero
            cell.layer.shadowRadius = 10
           
            
            return cell
        }
       
       return CollectionViewCell1()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//
//         if (collectionView == self.collectionView2)
//        {
//            return 10
//        }
//        return 10
//
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//
//         if (collectionView == self.collectionView2)
//        {
//            return 10
//        }
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//         if (collectionView == self.collectionView2)
//        {
//             let width = collectionView2.frame.width
//             let height =  collectionView2.frame.height
//
//            return CGSize(width: width/4-10,height: height/3-10)
//        }
//       return   CGSize(width: 10, height: 10)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //   let selectedCell:UICollectionViewCell = collectionView2.cellForRow(at: indexPath)!
        //  selectedCell.contentView.backgroundColor = UIColor.green)
        let selectedCell:UICollectionViewCell = collectionView2.cellForItem(at: indexPath)!
        
        print(selectedCell)
    }
    
  
    
    

    
}
