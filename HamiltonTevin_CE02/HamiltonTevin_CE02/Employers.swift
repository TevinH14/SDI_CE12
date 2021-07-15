//
//  Employers.swift
//  HamiltonTevin_CE02
//
//  Created by Tevin Hamilton on 9/10/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import Foundation

class Employers
{
    var comapny:[String]
    let responsibilities:[[String]]
    
    //init
    init(company:[String],responsibilities:[[String]])
    {
        self.comapny = company
        self.responsibilities = responsibilities
    }
    
    //Computed Properties
    var DisplayPastEmployer:String
    {
        var pastEmployers:String = ""
        var companyCounter = 1
        var responsbilityCounter = 1
        if comapny.isEmpty
        {
            pastEmployers = "has not employment history"
        }
        else
        {
            for co in comapny
            {
                pastEmployers += "\(companyCounter). \(co)"
                for responsibility in responsibilities
                {
                    for items in responsibility
                    {
                        pastEmployers += " \(responsbilityCounter)) \(items) "
                        responsbilityCounter += 1
                    }
                }
                responsbilityCounter = 1
                companyCounter += 1
                pastEmployers += "\n"
            }
        }
        return pastEmployers
    }
}
