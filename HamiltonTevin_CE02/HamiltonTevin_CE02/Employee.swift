//
//  Employee.swift
//  HamiltonTevin_CE02
//
//  Created by Tevin Hamilton on 9/10/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import Foundation

class Employee
{
    // stored Properties
    let employeeName:String
    let userName:String
    let macAdress:String
    let currentTitle:String
    let skills:[String]
    let empolyersInfo: Employers
    
    //init
    init(employeeName: String, userName:String, macAdress:String, currentTitle:String, skills:[String] , empolyersInfo: Employers)
    {
        self.employeeName = employeeName
        self.userName = userName
        self.macAdress = macAdress
        self.currentTitle = currentTitle
        self.skills = skills
        self.empolyersInfo = empolyersInfo
    }
    
    // convenience init
    convenience init()
    {
        self.init()
    }
    
    //Computed Properties
    //get count of skills
    var totalSkills: Int
    {
        return skills.count
    }
    
    //get count of past employers
    var totalEmployers: Int
    {
        return empolyersInfo.comapny.count
    }
    
    //get list of strings
    var listOfSkills:String
    {
        var skillString = ""
        if skills.isEmpty
        {
            skillString = "have no skills"
        }
        else
        {
            for items in skills
            {
                if items == skills.last
                {
                    skillString += "\(items)"
                }
                else
                {
                    skillString += "\(items), "
                }
            }
        }
        return skillString
    }
}
