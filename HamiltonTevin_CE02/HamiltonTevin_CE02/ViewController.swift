//
//  ViewController.swift
//  HamiltonTevin_CE02
//
//  Created by Tevin Hamilton on 9/9/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var labelEmployeeName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelMacAddress: UILabel!
    @IBOutlet weak var labelJobTitle: UILabel!
    @IBOutlet weak var labelSkill: UILabel!
    @IBOutlet weak var labelPastEmployers: UILabel!
    @IBOutlet weak var labelNumPastEmployers: UILabel!
    @IBOutlet weak var labelNumSkills: UILabel!
    //employee array
    var employees = [Employee]()
    //counter used to keep track of the current array
    var currentCustomerIndex = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Get the path to employeeData.json file
        if let path = Bundle.main.path(forResource: "EmployeeData", ofType: ".json") {
            
            //Create the URL using path
            let url = URL(fileURLWithPath: path)
            
            do{
                let data = try Data.init(contentsOf: url)
                
                //create josn object
                let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any]
                
                //call parse method
                Parse(jsonObject: jsonObj)
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
    }
    //MARK: Parse method
    //used to parse json data
    func Parse(jsonObject:[Any]?)
    {
        //use guard statment to parse json object
        guard let json = jsonObject
            else {print("something went wrong with the json object");return}
        //reach first level json data.
        for firstLevel in json
        {
            guard let object = firstLevel as? [String: Any],
                let employeeName = object ["employeename"] as? String,
                let userName = object ["username"] as? String,
                let macAddress = object ["macaddress"] as? String,
                let currentTitle = object ["current_title"] as? String,
                let skills = object ["skills"] as? [String],
                let pastEmployers = object ["past_employers"] as? [[String: Any]]
            else {continue}
            //array created to pass data through Employee init
            var companyArray = [String]()
            //nested array created to pass data through Employee init
            var responsibilityArray = [[String]]()
            //reach second level data.
            for secLevel in pastEmployers
            {
                guard let company = secLevel ["company"] as? String,
                let responsibilities = secLevel ["responsibilities"] as? [String]
                    else{continue}
                //add to json data to array
                companyArray.append(company)
                //add json array to nested array
               responsibilityArray.append(responsibilities)
            }
            // pass all json data
           employees.append(Employee(employeeName: employeeName, userName: userName, macAdress: macAddress, currentTitle: currentTitle, skills: skills, empolyersInfo: Employers(company: companyArray, responsibilities: responsibilityArray)))
        }
        //display data to UI
        Display()
    }
    //MARK: Cycle through Employees
    @IBAction func CycleThroughEmployees(_ sender: UIButton)
    {
        //add one to current index
        currentCustomerIndex += sender.tag
        
        if currentCustomerIndex < 0 {
            currentCustomerIndex = employees.count - 1
        }
        else if currentCustomerIndex >= employees.count {
            currentCustomerIndex = 0
        }
        Display()
    }
    func Display()
    {
        labelEmployeeName.text = employees[currentCustomerIndex].employeeName
        labelUserName.text = employees[currentCustomerIndex].userName
        labelMacAddress.text = employees[currentCustomerIndex].macAdress
        labelJobTitle.text = employees[currentCustomerIndex].currentTitle
        labelSkill.text = employees[currentCustomerIndex].listOfSkills.description
        labelPastEmployers.text = employees[currentCustomerIndex].empolyersInfo.DisplayPastEmployer
        labelNumPastEmployers.text = employees[currentCustomerIndex].totalEmployers.description
        labelNumSkills.text = employees[currentCustomerIndex].totalSkills.description
    }
}

