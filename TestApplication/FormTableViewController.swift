//
//  FormTableViewController.swift
//  TestApplication
//
//  Created by Jonathan Ruedas Mora on 22/6/17.
//  Copyright © 2017 Jonathan Ruedas Mora. All rights reserved.
//
import UIKit

class FormTableViewController: UITableViewController {

    @IBOutlet var fechaIncid: UITextField!
    
    @IBOutlet weak var nombreTextF: UITextField!
    
    @IBOutlet weak var apellidosTextF: UITextField!
    
    @IBOutlet weak var emailTextF: UITextField!
    
    @IBOutlet weak var edadTextF: UITextField!
    
    @IBOutlet weak var sexoSegmentedC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editaFechaIncidencia(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        fechaIncid.text = formatter.string(from: sender.date)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
        datePicker.addTarget(self, action: (Selector(("datePickerChanged:"))), for: .valueChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fechaIncid.resignFirstResponder()
        return true
    }
    
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
}
