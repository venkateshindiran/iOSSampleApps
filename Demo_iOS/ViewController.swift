//
//  ViewController.swift
//  Demo_iOS
//
//  Created by Sarvesh on 10/08/18.
//  Copyright © 2018 venkatesh. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var customer  = User()
    //private var tableView: UITableView!
   // let contactsTableView = UITableView() // view

    @IBOutlet weak var tableView: UITableView!

    
    
    @IBOutlet  var userViewModel:UserViewModel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.addSubview(contactsTableView)
//        contactsTableView.backgroundColor = UIColor.lightGray
//        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
//        contactsTableView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
//        contactsTableView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
//        contactsTableView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
//        contactsTableView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
//
//        contactsTableView.register(Customcell.self, forCellReuseIdentifier: "mycell")
//        contactsTableView.dataSource = self
//        contactsTableView.delegate = self
//
//        contactsTableView.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor).isActive = true
//      contactsTableView.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        contactsTableView.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        contactsTableView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//

        
      //  contactsTableView.rowHeight = UITableViewAutomaticDimension
       // contactsTableView.estimatedRowHeight = 200
      
        self.userViewModel.loadJsonData {
            
          DispatchQueue.main.async {
            
            self.tableView.reloadData()
            
           }
        }
    
       
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.numberOfItemsInSection()
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.tiltleLabel.text = userViewModel.getTitle(indexPath)
        cell.descLabel.text = userViewModel.getDescription(indexPath)
        let imageString = userViewModel.getImageString(indexPath)
        

      
        if let imageURL = URL(string: imageString), let placeholder = UIImage(named: "thumnail.png") {
            cell.UserImage.af_setImage(withURL: imageURL, placeholderImage: placeholder) //set image automatically when download compelete.
        }
        //cell.imageView?.backgroundColor = UIColor.red
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

