//
//  navitaionViewController.swift
//  walkAppSinvo
//
//  Created by Rajeev on 02/10/23.
//


import UIKit

class navigationViewController: UIViewController {
    
    
    @IBOutlet var mytable:UITableView!
    
    var navigation = [String]()
    
    var countryData = ["india","south africa ","america","china ","itli","hongkong","iran","teharan","london","kuwait","united kingdom","saudi arab"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mytable.dataSource = self
        mytable.delegate = self
    }
    
    
}
extension navigationViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = navigation[indexPath.row]
        return cell
    }
  
    
}

