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
    var deleteToPerform: ((Double) -> Void)?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        phoneLabel.text = phone
        imageView.image = image
    }
}
