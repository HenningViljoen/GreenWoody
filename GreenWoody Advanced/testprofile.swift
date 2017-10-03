//
//  testprofile.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/21/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import Foundation

class testprofile
{
    //equation properties
    var v1 : Int
    var v2 : Int
    var answer : Int
    var eqstring : String
    var possibleoperations : [operation]
    var currentoperation : operation
    var zvalueinhistorycube : Int //This value will be the value drawn from random statements in order to get the depth/height where
    //the equation numbers var1 and var2 will be sampled from in the history cube.
    

    
    //var table : Int
    var testcorrect : Int
    var testtotal : Int
    //var eq : equation
    var historycube = Array(repeating: Array(repeating: Array(repeating: Int(), count: global.var2max + 1),
        count: global.var1max + 1), count: global.NrOperators)
                                                //This will be a cube, with the first dimension the operation type, and then var 1 on 2d,
                                                // var 2 on 3d.  The amount of mistakes for that operaton and that combination of vars will 
                                                //be saved.
    var maxnrmistakes = Array(repeating: Int(0), count: global.NrOperators)
    
    init()
    {
        //Equation prop initiation first
        
        v1 = 0
        v2 = 0
        answer = 0
        eqstring = ""
        
        possibleoperations = [operation(operators.addition), operation(operators.subtraction), operation(operators.multiplication), operation(operators.division)]
        currentoperation = possibleoperations[0]
        
        zvalueinhistorycube = 0
        
        //table = global.table
        testcorrect = 0
        testtotal = 0
        //eq = equation()
        //maxnrmistakes
        
        //var zarray = [Int](count:global.var2max, repeatedValue: 0)
        
        //for operant in 0...global.NrOperators
        //{
        //    for y in 0...global.var1max
        //    {
        //        historycube[operant][y].append(Array(count:global.var2max, repeatedValue:0))
        //    }
        //}
    }
    
    func eqgetstring()
    {
        eqstring = String(v1) + " " + currentoperation.operchar + " " + String(v2) + " = "
    }
    
    func eqtostring() -> String
    {
        eqgetstring()
        return eqstring
    }
    
    func setequation()
    {
        let cnt = possibleoperations.count
        let opindex : Int = Int(arc4random_uniform(UInt32(cnt)))
        currentoperation = possibleoperations[opindex]
        
        switch currentoperation.oper
        {
        case .addition:
            zvalueinhistorycube = Int(arc4random_uniform(UInt32(maxnrmistakes[currentoperation.oper.rawValue] + 1)))
            repeat
            {
                answer = Int(arc4random_uniform(UInt32(global.additionmax - global.additionmin + 1))) + global.additionmin
                v1 = Int(arc4random_uniform(UInt32(answer + 1)))
                v2 = answer - v1
            } while historycube[currentoperation.oper.rawValue][v1][v2] < zvalueinhistorycube
        case .subtraction:
            zvalueinhistorycube = Int(arc4random_uniform(UInt32(maxnrmistakes[currentoperation.oper.rawValue] + 1)))
            repeat
            {
                v1 = Int(arc4random_uniform(UInt32(global.subtractionmax - global.subtractionmin + 1))) + global.subtractionmin
                v2 = Int(arc4random_uniform(UInt32(v1 + 1)))
                answer = v1 - v2
            } while historycube[currentoperation.oper.rawValue][v1][v2] < zvalueinhistorycube
        case .multiplication:
            zvalueinhistorycube = Int(arc4random_uniform(UInt32(maxnrmistakes[currentoperation.oper.rawValue] + 1)))
            repeat
            {
                let order : Int = Int(arc4random_uniform(2))
            
                v1 = Int(arc4random_uniform(UInt32(global.multiplicationtablemax - global.multiplicationtablemin + 1))) + global.multiplicationtablemin
                v2 = Int(arc4random_uniform(UInt32(global.multiplicationtablemaxv2 - global.multiplicationtableminv2 + 1))) + global.multiplicationtableminv2
                if order == 1
                {
                    let temp : Int = v1
                    v1 = v2
                    v2 = temp
                }
            answer = v1*v2
            } while historycube[currentoperation.oper.rawValue][v1][v2] < zvalueinhistorycube
        case .division:
            zvalueinhistorycube = Int(arc4random_uniform(UInt32(maxnrmistakes[currentoperation.oper.rawValue] + 1)))
            repeat
            {
                v2 = Int(arc4random_uniform(UInt32(global.divisiontablemaxv2 - global.divisiontableminv2 + 1))) + global.divisiontableminv2
                answer = Int(arc4random_uniform(UInt32(global.divisiontablemax - global.divisiontablemin + 1))) + global.divisiontablemin
                v1 = answer*v2
            } while historycube[currentoperation.oper.rawValue][v1][v2] < zvalueinhistorycube
        }
        
        
        //v1 = global.multiplicationtablemax
        //v2 = Int(arc4random_uniform(12 + 1))
        
        //answer = currentoperation.executeoperation(v1, v2: v2)
    }
    
    func updatehistorycubewithmistake()
    {
        historycube[currentoperation.oper.rawValue][v1][v2] += 1
        if historycube[currentoperation.oper.rawValue][v1][v2] > maxnrmistakes[currentoperation.oper.rawValue]
        {
            maxnrmistakes[currentoperation.oper.rawValue] = historycube[currentoperation.oper.rawValue][v1][v2]
        }
    }
    
    func maxinhistorycubeforcurrentoper()
    {
        maxnrmistakes[currentoperation.oper.rawValue] = 0
        for x1 in 0...global.var1max
        {
            for x2 in 0...global.var2max
            {
                if historycube[currentoperation.oper.rawValue][x1][x2] > maxnrmistakes[currentoperation.oper.rawValue]
                {
                    maxnrmistakes[currentoperation.oper.rawValue] = historycube[currentoperation.oper.rawValue][x1][x2]
                }
            
            }
        }
    
    }
    
    func updatehistorycubewithcorrect()
    {
        if historycube[currentoperation.oper.rawValue][v1][v2] > 0
        {
            historycube[currentoperation.oper.rawValue][v1][v2] -= 1
            maxinhistorycubeforcurrentoper()
        }
        
    }
    
}
