//
//  Student.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation
import UIKit
class Contact{
    var name_surname: String?
    var phone_number: String?
    var image: UIImage?
    init(_ name_surname: String, _ phone_number: String, _ image: UIImage){
        self.name_surname = name_surname
        self.phone_number = phone_number
        self.image = image
        
    }
}
