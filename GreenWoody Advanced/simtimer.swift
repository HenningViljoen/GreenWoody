//
//  simtimer.swift
//  GreenWoody Advanced
//
//  Created by Johannes Henning Viljoen on 11/21/15.
//  Copyright © 2015 StratLytic. All rights reserved.
//

import Foundation


class simtimer
{
    //Properties
    //var days : Double
    var hours : Int
    var minutes : Int
    var seconds : Int
    var totalsecondsfortheday : Int
    
    //Methods
    init(ahours : Int, aminutes : Int, aseconds : Int)
    {
        hours = ahours
        minutes = aminutes
        seconds = aseconds
        totalsecondsfortheday = 0
    }
    
    func reset()
    {
        hours = 0
        minutes = 0
        seconds = 0
        totalsecondsfortheday = 0
    }
    
    func tick()
    {
        //Assume SampleT is in seconds
        seconds += global.TimerInterval
        totalsecondsfortheday += global.TimerInterval
        if (seconds >= 60)
        {
            seconds = 0
            minutes += 1
        }
        if (minutes >= 60)
        {
            minutes = 0
            hours += 1
        }
        if (hours >= 24)
        {
            hours = 0
            totalsecondsfortheday = 0
        }
    }
    
    func timerstring() -> String
    {
        let str : String = "\(hours) : \(minutes) : \(seconds)"
        return str
    }
    
    /*
    public static bool operator ==(simtimer simtimer1, simtimer simtimer2)
    {
    return (simtimer1.hours == simtimer2.hours &&
    simtimer1.minutes == simtimer2.minutes && simtimer1.seconds == simtimer2.seconds);
    }
    
    public static bool operator !=(simtimer simtimer1, simtimer simtimer2)
    {
    return !(simtimer1.hours == simtimer2.hours &&
    simtimer1.minutes == simtimer2.minutes && simtimer1.seconds == simtimer2.seconds);
    }
    
    public static bool operator <(simtimer simtimer1, simtimer simtimer2)
    {
    return (3600 * simtimer1.hours + 60 * simtimer1.minutes + simtimer1.seconds <
    3600 * simtimer2.hours + 60 * simtimer2.minutes + simtimer2.seconds);
    }
    
    public static bool operator >(simtimer simtimer1, simtimer simtimer2)
    {
    return (3600 * simtimer1.hours + 60 * simtimer1.minutes + simtimer1.seconds >
    3600 * simtimer2.hours + 60 * simtimer2.minutes + simtimer2.seconds);
    }
    
    public static bool operator >=(simtimer simtimer1, simtimer simtimer2)
    {
    return (3600 * simtimer1.hours + 60 * simtimer1.minutes + simtimer1.seconds >=
    3600 * simtimer2.hours + 60 * simtimer2.minutes + simtimer2.seconds);
    }
    
    public static bool operator <=(simtimer simtimer1, simtimer simtimer2)
    {
    return (3600 * simtimer1.hours + 60 * simtimer1.minutes + simtimer1.seconds <=
    3600 * simtimer2.hours + 60 * simtimer2.minutes + simtimer2.seconds);
    }
    */
    
    
}



