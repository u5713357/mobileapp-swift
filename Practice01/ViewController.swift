//
//  ViewController.swift
//  Practice01
//
//  Created by 6272 on 9/14/2560 BE.
//  Copyright © 2560 6272. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let foodType = ["Beef","Chicken","Fish","Pork"]
    let drinkType = ["Beer","Soda","Tea","Water"]

    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated:true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
            return foodType.count
        }
        else{
            return drinkType.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0{
            return foodType[row]
        }
        else{
            return drinkType[row]
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drinkSegue"{
            let vDrink = drinkType[pickerView.selectedRow(inComponent: 1)]
            (segue.destination as! ThirdViewController).pName = vDrink
        
    }
        else{
            let vFood = foodType[pickerView.selectedRow(inComponent: 0)]
            (segue.destination as! SecondViewController).pName = vFood
            
        }
    }


}

