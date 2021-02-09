//
//  ViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var model = Contacts()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getContacts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = model.getContacts()[indexPath.row].name_surname
        cell?.contactPhone.text = model.getContacts()[indexPath.row].phone_number
        cell?.contactImageView.image = model.getContacts()[indexPath.row].image
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            model.deleteContact(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
        
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        myTableView.reloadData()
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "mySegue"){
        let destination = segue.destination as! DetailViewController
        let index = (myTableView.indexPathForSelectedRow?.row)!
        destination.name_surname = model.getContacts()[index].name_surname
            destination.phone = model.getContacts()[index].phone_number
            destination.image = model.getContacts()[index].image
            destination.id = index
            destination.model = model
        }
        else{
            let destination = segue.destination as! AddViewController
            destination.model = model
        }
    }

}

