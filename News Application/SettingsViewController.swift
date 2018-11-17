//
//  SettingCollectionViewController.swift
//  News Application
//
//  Created by Michael Liu on 2018-11-17.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit



class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var articleSlider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
   
    
    
    @IBOutlet weak var sourcePicker: UIPickerView!
    
     let sourceArray = ["techcrunch", "cnn", "espn", "google-news", "time"]
    
    override func viewDidLoad() {
     //   super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(SettingsViewController.viewTapped))
        
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        sourcePicker.delegate = self
        sourcePicker.dataSource = self
        
        
    }

      
    
    override func viewWillAppear(_ animated: Bool)
    {
        if let username = UserDefaults.standard.string(forKey: "username")
        {
            usernameTextField.text = username
        }
        if let source = UserDefaults.standard.string(forKey: "news_source")
        {
            if let row = sourceArray.index(of: source)
            {
                sourcePicker.selectRow(row, inComponent: 0, animated: false)
            }
        }
        let numArticles = UserDefaults.standard.float(forKey: "num_articles")
        
        if numArticles >= 1
        {
            articleSlider.value = numArticles
            
            self.articlesChange(articleSlider)
        }
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        
        UserDefaults.standard.set(usernameTextField.text, forKey: "username")
    }
    
    @IBAction func returnKeyPressed(_ sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @objc func viewTapped()
    {
        self.usernameTextField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return sourceArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return sourceArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        UserDefaults.standard.set(sourceArray[row], forKey: "news_source")
    }


    @IBAction func articlesChange(_ sender: UISlider) {
        self.sliderLabel.text = "\(Int(articleSlider.value))"
        
        UserDefaults.standard.set(articleSlider.value, forKey: "num_articles")
    }
    
    
}
