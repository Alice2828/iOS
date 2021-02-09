//
//  Contacts.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import Foundation
import UIKit

struct Contacts{
    
    var contacts = [Contact.init("Vasya Pup", "87773773283", UIImage.init(named: "male")!), Contact.init("Alice Leb", "87775362327", UIImage.init(named: "female")!)]
    
    func getContacts() -> Array<Contact>{
        return contacts
    }
    mutating func deleteContact(_ id: Int){
        contacts.remove(at: id)
    }
    mutating func addContact(_ contact: Contact){
        contacts.append(contact)
    }
}
