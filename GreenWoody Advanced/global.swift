//
//  global.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/17/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import Foundation


enum operators: Int
{
    case addition = 0, subtraction, multiplication, division
    static let count: Int = {
        var max: Int = 0
        while let _ = operators(rawValue: max) { max += 1 }
        return max
    }()
}

struct global
{
    //Timing constants
    static var SampleT : Double = 1 //seconds
    static var TimerInterval : Int = 1 //seconds
    
    //equation class constants
    static var DefaultOperation : operators = operators.multiplication
    static var MaxV2 : Int = 12
    
    //operation class constants
    static let NrOperators: Int = operators.count
    //optionsscreen constants
    static var additionmin: Int = 0
    static var subtractionmin: Int = 0
    static var multiplicationtablemin: Int = 0
    static var multiplicationtableminv2: Int = 0
    static var divisiontablemin: Int = 1
    static var divisiontableminv2: Int = 1
    
    static var additionmax: Int = 20
    static var subtractionmax: Int = 20
    static var multiplicationtablemax: Int = 12
    static var multiplicationtablemaxv2: Int = 12
    static var divisiontablemax: Int = 12
    static var divisiontablemaxv2: Int = 12
    
    //testprofile class constants
    static var var1max : Int = 500 //The max figure that can be put in for var 1 for any operation in the options dialogue.
    static var var2max : Int = 500 //The max figure that can be put in for var 2 for any operation in the options dialogue.
}
