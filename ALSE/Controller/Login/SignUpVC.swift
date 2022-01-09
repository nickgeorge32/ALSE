//
//  SignUpVC.swift
//  ALSE
//
//  Created by Nick George on 1/8/22.
//  Copyright © 2022 SimpleDev Studios. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    //MARK: VARIABLES
    var unit = [String]()
    var unitPicker = UIPickerView()
    
    //MARK: OUTLETS
    @IBOutlet weak var fullNameField: loginTextField!
    @IBOutlet weak var emailField: loginTextField!
    @IBOutlet weak var passwordField: loginTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var unitField: loginTextField!
    
    //MARK: LIFECYCLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unit.append("")

        activityIndicator.isHidden = true
        unitPicker.delegate = self
        unitPicker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 0.8)
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(dismissPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(dismissPicker))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        unitField.inputView = unitPicker
        unitField.inputAccessoryView = toolBar
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getUnits()
    }
    
    //MARK: ACTIONS
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUp(_ sender: Any) {
        
    }
    //MARK: FUNCTIONS
    func getUnits() {
        Firestore.firestore().collection("units").getDocuments { querySnapshot, error in
            if let error = error {
                
            } else {
                querySnapshot?.documents.forEach({ snap in
                    self.unit.append(snap.documentID)
                })
            }
            self.unitPicker.reloadAllComponents()
        }
    }
    
    @objc func dismissPicker() {
        unitField.resignFirstResponder()
    }
}

//MARK: EXTENSIONS
extension SignUpVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        unit.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unit[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        unitField.text = unit[row]
    }
    
}
