//
//  ViewController.swift
//  Program
//
//  Created by Alivelu Ravula on 4/11/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,toStoreCount {
    
    @IBOutlet weak var firstVC: UITableView!
    
    func storeItems(label: String, myIndex: IndexPath) {
        
        lblTxt=label
        labelIndex=myIndex
        self.firstVC.reloadData()
        
    }
    
   
   // var mainArray:NSArray = []
    var mainArray=["Vegetables","Fruits","Leafy Vegtables"]
//var num=["1","2","3"]
    
    var labelIndex=IndexPath()
    var lblTxt = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // mainArray = ["Vegetables","Fruits","Leafy Vegtables"]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//return self.mainArray.count
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
 cell.mainLbl!.text=mainArray[indexPath.row]
        
        if(indexPath==labelIndex)
        {
            
            cell.getTotalItems.text=lblTxt
        }
//        cell.getTotalItems.text=
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row==0
//        {
        let storyboard=UIStoryboard(name:"Main" , bundle: nil)
        let SVC=storyboard.instantiateViewController(withIdentifier: "secVC") as! secVC
        self.navigationController?.pushViewController(SVC, animated: true)
        
       SVC.title=mainArray[indexPath.row]
        
        SVC.delegate=self
        SVC.toStoreIP=indexPath
        
        
        
//    }
//        else if indexPath.row==1
//        {
//            let storyboard=UIStoryboard(name:"Main",bundle:nil)
//            let FVC=storyboard.instantiateViewController(withIdentifier: "FruitsVC") as! FruitsVC
//            self.navigationController?.pushViewController(FVC, animated: true)
//            FVC.title=mainArray[indexPath.row]
//        }
//        else if indexPath.row==2
//        {
//            let storyboard=UIStoryboard(name:"Main",bundle:nil)
//            let LVC=storyboard.instantiateViewController(withIdentifier: "LeafyVC") as! LeafyVC
//            self.navigationController?.pushViewController(LVC, animated: true)
//            LVC.title=mainArray[indexPath.row]
//
//        }
//
//
//
//    }
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
}
