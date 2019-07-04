//
//  secVC.swift
//  Program
//
//  Created by Alivelu Ravula on 4/11/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit
protocol  toStoreCount {
    func storeItems(label:String, myIndex:IndexPath)
}
class secVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var delegate:toStoreCount?=nil   //related to protocol
    var toStoreIP:IndexPath?
    @IBOutlet weak var secondTVC: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text=vegetablesArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetablesArr.count
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
     
    self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alert)), animated: true)
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

    return title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var vegetablesArr = [String]()
    var TextField = UITextField()
    
    @objc func alert()
    {
 
            let alert = UIAlertController(title: "Vegetables", message: "Do You Want to Add New", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addTextField { (textField) -> Void in
                self.TextField = textField
                self.TextField.delegate = self as? UITextFieldDelegate //REQUIRED
                self.TextField.placeholder = "Enter your search terms"
            }
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: ({UIAlertAction in
                
                
                self.vegetablesArr.append(self.TextField.text!)
                self.secondTVC.reloadData()
                
            }))
        
    
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        delegate?.storeItems(label: String(self.vegetablesArr.count), myIndex: toStoreIP!)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
    



