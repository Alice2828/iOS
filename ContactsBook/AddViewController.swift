//
//  AddViewController.swift
//  ContactsBook
//
//  Created by User on 09.02.2021.
//  Copyright © 2021 User. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    let options = ["female", "male"]
    var name_surname: String?
    var phone:String?
    var imageString: String? = "female"
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
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.nameSurname.delegate = self
        self.phoneNumber.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        imageString = options[0]
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == nameSurname){
            name_surname = nameSurname.text
        }
        else{
            phone = phoneNumber.text
        }
    }
}
