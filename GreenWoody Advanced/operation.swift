//
//  operation.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/17/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import Foundation



class operation
{
    var oper : operators
    var operchar : String
        {
        get
        {
            switch oper
            {
            case .addition:
                return "+"
            case .subtraction:
                return "-"
            case .multiplication:
                return "x"
            case .division:
                return "/"
            }
        }
    }
    
    init()
    {
        oper = global.DefaultOperation
    }
    
    init(_ anoper : operators)
    {
        oper = anoper
    }
    
    func executeoperation(_ v1 : Int, v2 : Int) -> Int
    {
        switch oper
        {
        case .addition:
            return v1 + v2
        case .subtraction:
            return v1 - v2
        case .multiplication:
            return v1 * v2
        case .division:
            return v1 / v2
        }
    }
    
}
