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
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
