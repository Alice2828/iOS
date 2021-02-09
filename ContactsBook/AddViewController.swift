//
//  AddViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let options = ["female", "male"]
    var name_surname: String?
    var phone:String?
    var imageString: String?
    var image: UIImage?
    var model: Contacts?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageString = options[row]
        self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameSurname: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    
    @IBAction func saveContact(_ sender: UIButton) {
         name_surname = nameSurname.text
         phone = phoneNumber.text
         image = UIImage.init(named: imageString!)!
         model?.addContact(Contact(name_surname!, phone!, image!))
        performSegue(withIdentifier: "unwindToContactList", sender: self)
        
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
