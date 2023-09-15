//
//  ViewController.swift
//  Week3_AppworksSchool
//
//  Created by Angela  Pan on 2023/9/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appWorksLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var checkTextField: UITextField!
    
    var isLoginSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AppWorks School Label
        appWorksLabel.text = "AppWorks School"
        appWorksLabel.font = UIFont.systemFont(ofSize: 40.0)
        
        // 選擇頁面＿segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        segmentedControlValueChanged(segmentedControl)
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        isLoginSelected = sender.selectedSegmentIndex == 0
        
        checkLabel.isEnabled = !isLoginSelected
        checkTextField.isEnabled = !isLoginSelected
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if isLoginSelected {
           
            // Login流程
            let username = "appworks_school"
            let password = "1234"
            
            if accountTextField.text == username && passwordTextField.text == password {
                showAlert(title: "Welcome", message: "Log in!")
            }
            else {
                showAlert(title: "Error", message: "Login fail")
            }
        }
        else {
            // Signup流程
            let username = accountTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            let check = checkTextField.text ?? ""
            
            if username.isEmpty  {
                showAlert(title: "Error", message: "Account should not be empty.")
            }
            if password.isEmpty {
                showAlert(title: "Error", message: "Password should not be empty")
            }
            if check.isEmpty {
                showAlert(title: "Error", message: "Check Password should not be empty")
            }
            else if password == check {
                    showAlert(title: "Success", message: "Try login now")
            }
            else {
                    showAlert(title: "Error", message: "Signup fail")
                }
            }
        }
        
    //設定showAlert
        func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }

