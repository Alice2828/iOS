//
//  DetailViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var name_surname: String?
    var phone: String?
    var image: UIImage?
    var id: Int?
    var model: Contacts?
    var deletedAccount: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        phoneLabel.text = phone
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
//        model?.deleteContact(id!)
         deletedAccount = true
        performSegue(withIdentifier: "unwindToContactList", sender: self)
//        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
