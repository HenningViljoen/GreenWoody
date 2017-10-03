//
//  optionsscreen.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/12/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import UIKit

class optionsscreen: UIViewController {
    
    
    @IBOutlet weak var additionmin: UITextField!
    @IBOutlet weak var subtractionmin: UITextField!
    @IBOutlet weak var multiplicationtablemin: UITextField!
    @IBOutlet weak var multiplicationtableminv2: UITextField!
    @IBOutlet weak var divisiontablemin: UITextField!
    @IBOutlet weak var divisiontableminv2: UITextField!
    
    @IBOutlet weak var additionmax: UITextField!
    @IBOutlet weak var subtractionmax: UITextField!
    @IBOutlet weak var multiplicationtablemax: UITextField!
    @IBOutlet weak var multiplicationtablemaxv2: UITextField!
    @IBOutlet weak var divisiontablemax: UITextField!
    @IBOutlet weak var divisiontablemaxv2: UITextField!
    
    @IBOutlet weak var additionswitch: UISwitch!
    @IBOutlet weak var subtractionswitch: UISwitch!
    @IBOutlet weak var multiplicationswitch: UISwitch!
    @IBOutlet weak var divisionswitch: UISwitch!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        additionmin.text = String(global.additionmin)
        subtractionmin.text = String(global.subtractionmin)
        multiplicationtablemin.text = String(global.multiplicationtablemin)
        multiplicationtableminv2.text = String(global.multiplicationtableminv2)
        divisiontablemin.text = String(global.divisiontablemin)
        divisiontableminv2.text = String(global.divisiontableminv2)
        
        additionmax.text = String(global.additionmax)
        subtractionmax.text = String(global.subtractionmax)
        multiplicationtablemax.text = String(global.multiplicationtablemax)
        multiplicationtablemaxv2.text = String(global.multiplicationtablemaxv2)
        divisiontablemax.text = String(global.divisiontablemax)
        divisiontablemaxv2.text = String(global.divisiontablemaxv2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        var v : Int?
        
        v = Int(additionmin.text!)
        if v != nil
        {
            if v! <= global.additionmax && v! >= 0 {global.additionmin = v!}
        }
        
        v = Int(subtractionmin.text!)
        if v != nil
        {
            if v! <= global.subtractionmax && v! >= 0 {global.subtractionmin = v!}
        }
        
        v = Int(multiplicationtablemin.text!)
        if v != nil
        {
            if v! <= global.multiplicationtablemax && v! >= 0 {global.multiplicationtablemin = v!}
        }
        
        v = Int(multiplicationtableminv2.text!)
        if v != nil
        {
            if v! <= global.multiplicationtablemaxv2 && v! >= 0 {global.multiplicationtableminv2 = v!}
        }
        
        v = Int(divisiontablemin.text!)
        if v != nil
        {
            if v! <= global.divisiontablemax && v! >= 1 {global.divisiontablemin = v!}
        }
        
        v = Int(divisiontableminv2.text!)
        if v != nil
        {
            if v! <= global.divisiontablemaxv2 && v! >= 1 {global.divisiontableminv2 = v!}
        }
        
        
        v = Int(additionmax.text!)
        if v != nil
        {
            if v! >= global.additionmin {global.additionmax = v!}
        }
        
        v = Int(subtractionmax.text!)
        if v != nil
        {
            if v! >= global.subtractionmin {global.subtractionmax = v!}
        }
        
        v = Int(multiplicationtablemax.text!)
        if v != nil
        {
            if v! >= global.multiplicationtablemin {global.multiplicationtablemax = v!}
        }
        
        v = Int(multiplicationtablemaxv2.text!)
        if v != nil
        {
            if v! >= global.multiplicationtableminv2 {global.multiplicationtablemaxv2 = v!}
        }
        
        v = Int(divisiontablemax.text!)
        if v != nil
        {
            if v! >= global.divisiontablemin {global.divisiontablemax = v!}
        }
        
        v = Int(divisiontablemaxv2.text!)
        if v != nil
        {
            if v! >= global.divisiontableminv2 {global.divisiontablemaxv2 = v!}
        }
        
        
        
        maintestprofile.possibleoperations.removeAll(keepingCapacity: false)
        if additionswitch.isOn
        {
            maintestprofile.possibleoperations.append(operation(operators.addition))
        }
        if subtractionswitch.isOn
        {
            maintestprofile.possibleoperations.append(operation(operators.subtraction))
        }
        if multiplicationswitch.isOn
        {
            maintestprofile.possibleoperations.append(operation(operators.multiplication))
        }
        if divisionswitch.isOn
        {
            maintestprofile.possibleoperations.append(operation(operators.division))
        }
        
        if !additionswitch.isOn && !subtractionswitch.isOn && !multiplicationswitch.isOn && !divisionswitch.isOn
        {
            additionswitch.isOn = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
