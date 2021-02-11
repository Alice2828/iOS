//
//  ViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit
var model = Contacts()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var deletedAcc: Int?
    var newName: String?
    var newPhone: String?
    var newImage: String?
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.getContacts().count == 0 {
            myTableView.setEmptyMessage("Empty contact list")
        } else {
            myTableView.restore()
        }
        
        return model.getContacts().count
    }
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if(deletedAcc != nil)
        {
            performDelete()
        }
        if(newName != nil)
        {
            performAdd()
        }
        
    }
    @IBAction func unwindBack(_ sender: UIStoryboardSegue){
      if  let source = sender.source as? AddViewController
      {
        newName = source.name_surname
        newPhone = source.phone
        newImage = source.imageString
        }
        if  let source = sender.source as? DetailViewController
        {
            deletedAcc = source.id
        }
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
        else if(segue.identifier == "addSeque"){
            let destination = segue.destination as! AddViewController
            destination.model = model
        }
        
    }
    func performDelete(){
        model.deleteContact(deletedAcc!)
        deletedAcc = nil
        myTableView.reloadData()
    }
    func performAdd(){
        let imageUI = UIImage.init(named: newImage!)
        model.addContact(Contact(newName!, newPhone!, imageUI!))
        newName = nil
        newPhone = nil
        newImage = nil
        myTableView.beginUpdates()
        myTableView.insertRows(at: [
            NSIndexPath(row: model.getContacts().count-1, section: 0) as IndexPath], with: .automatic)
        myTableView.endUpdates()
    }
}

