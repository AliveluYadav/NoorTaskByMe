//
//  FruitsVC.swift
//  Program
//
//  Created by Alivelu Ravula on 4/11/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class FruitsVC: UIViewController,UITableViewDelegate,UITableViewDataSource   {
    
    @IBOutlet weak var frtTV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        cell.textLabel?.text=fruitsArry[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alert)), animated: true)
//
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target:self, action:#selector(FruitAlert)), animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var friufTF:UITextField!
   var fruitsArry = [String]()
    
    @objc func FruitAlert()
    {
        let alert = UIAlertController(title: "Add Fruits", message: "", preferredStyle: .alert)
//        alert.addTextField { (textField) -> Void in
        alert.addTextField { (textField) in
            self.friufTF=textField
//           self.friufTF.delegate=self
        }
        
        
//        let okAction=UIAlertAction(title: "OK", style: .default, handler: nil)
        let okAction=UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            
            self.fruitsArry.append(self.friufTF.text!)
            self.friufTF.delegate = self as? UITextFieldDelegate //REQUIRED
            self.frtTV.reloadData()
        }
        
        let cancelActn=UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
       alert.addAction(okAction)
        alert.addAction(cancelActn)
        
        self.present(alert, animated: true, completion: nil)
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
