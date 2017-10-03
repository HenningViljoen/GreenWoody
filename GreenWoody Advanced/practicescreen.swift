//
//  practicescreen.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/12/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class practicescreen: UIViewController {

    @IBOutlet weak var equationoutlet: UILabel!
    @IBOutlet weak var feedbackoutlet: UILabel!
    @IBOutlet weak var timeroutlet: UILabel!
    @IBOutlet weak var scoreoutlet: UILabel!
    @IBOutlet weak var answertextoutlet: UITextField!
    
    @IBAction func enteranswer(_ sender: AnyObject)
    {
        let answer : Int? = Int(answertextoutlet.text!)
        
        if answer != nil
        {
            maintestprofile.testtotal += 1
            if answer! == maintestprofile.answer
            {
                maintestprofile.testcorrect += 1
                feedbackoutlet.text = "Well done!"
                feedbackoutlet.textColor = UIColor.green
                maintestprofile.updatehistorycubewithcorrect()
            }
            else
            {
                feedbackoutlet.text = "Almost! Correct answer was " + maintestprofile.eqstring + String(maintestprofile.answer)
                feedbackoutlet.textColor = UIColor.red
                maintestprofile.updatehistorycubewithmistake();
                
            }
            updatescore()
            updateeq();
            answertextoutlet.text = ""
        }
    }
    
    @IBAction func resetbuttonpressed(_ sender: AnyObject)
    {
        invalidatetimer()
        resetscreen()
    }
    
    @IBAction func timerstartstop(_ sender: AnyObject)
    {
        if timer.isValid
        {
            timer.invalidate()
        }
        else
        {
            timer = Timer.scheduledTimer(timeInterval: Double(global.TimerInterval), target: self, selector: Selector("ticktimer"), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func resettimerpressed(_ sender: AnyObject)
    {
        invalidatetimer()
        practicetimer?.reset()
        updatetimeroutlet()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetscreen()
        
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        feedbackoutlet.text = ""
    }
    
    func resetscreen()
    {
        updateeq()
        maintestprofile.testcorrect = 0;
        maintestprofile.testtotal = 0;
        updatescore()
        if practicetimer != nil
        {
            practicetimer!.reset()
        }
        else
        {
            practicetimer = simtimer(ahours: 0,aminutes: 0,aseconds: 0)
        }
        updatetimeroutlet()
    }
    
    func updateeq()
    {
        maintestprofile.setequation()
        equationoutlet.text = maintestprofile.eqtostring()
    }
    
    func updatescore()
    {
        scoreoutlet.text = "Score : " + String(maintestprofile.testcorrect) + " out of " + String(maintestprofile.testtotal)
    }
    
    func ticktimer()
    {
        practicetimer?.tick()
        updatetimeroutlet()
    }
    
    func updatetimeroutlet()
    {
        timeroutlet.text = practicetimer?.timerstring()
    }
    
    func invalidatetimer()
    {
        if timer.isValid
        {
            timer.invalidate()
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
