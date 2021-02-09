//
//  ViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var contacts = [Contact.init("Vasya Pup", "87773773283", UIImage.init(named: "male")!), Contact.init("Alice Leb", "87775362327", UIImage.init(named: "female")!)]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = contacts[indexPath.row].name_surname
        cell?.contactPhone.text = contacts[indexPath.row].phone_number
        cell?.contactImageView.image = contacts[indexPath.row].image
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="mySegue"){
        let destination = segue.destination as! DetailViewController
        let index = (myTableView.indexPathForSelectedRow?.row)!
        destination.name_surname = contacts[index].name_surname
        }
        else{
//          let destination = segue.destination as! AddViewController
        }
    }

}

