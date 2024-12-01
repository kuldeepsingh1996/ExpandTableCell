//
//  ViewController.swift
//  ExpandTableCell
//
//  Created by Philophobic on 01/12/24.
//

import UIKit


struct Section {
    var mainCellTitle: String
    var expandableCellOptions: [String]
    var isExpandableCellsHidden: Bool
}

var demoSections: [Section] = [
    Section(
        mainCellTitle: "Profile",
        expandableCellOptions: ["Edit Profile", "Change Password", "Privacy Settings"],
        isExpandableCellsHidden: true
    ),
    Section(
        mainCellTitle: "Notifications",
        expandableCellOptions: ["Email Notifications", "Push Notifications", "SMS Alerts"],
        isExpandableCellsHidden: false
    ),
    Section(
        mainCellTitle: "Settings",
        expandableCellOptions: ["Language", "Theme", "App Version"],
        isExpandableCellsHidden: true
    ),
    Section(
        mainCellTitle: "Help & Support",
        expandableCellOptions: ["FAQs", "Contact Support", "Terms & Conditions"],
        isExpandableCellsHidden: false
    ),
    Section(
        mainCellTitle: "About",
        expandableCellOptions: ["Company Info", "Careers", "Privacy Policy"],
        isExpandableCellsHidden: true
    )
]

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        tableView.register(UINib(nibName: "ExpandleCell", bundle: nil), forCellReuseIdentifier: "ExpandleCell")
        tableView.estimatedRowHeight = 300
        
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return demoSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = demoSections[section]
        if !section.isExpandableCellsHidden {
            return section.expandableCellOptions.count + 1
        }else {
            return  1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
            cell.mainCellLbl.text = demoSections[indexPath.section].mainCellTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandleCell", for: indexPath) as! ExpandleCell
            cell.titleLbl.text = demoSections[indexPath.section].expandableCellOptions[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            demoSections[indexPath.section].isExpandableCellsHidden = !demoSections[indexPath.section].isExpandableCellsHidden
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        }else {
            return 70
        }
    }
    
    
    
}
