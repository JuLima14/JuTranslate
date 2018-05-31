//
//  SettingsViewController.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var settingsView: SettingsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView = SettingsView(frame: .zero)
        settingsView.optionsTableView.delegate = self
        settingsView.optionsTableView.dataSource = self
        view.addSubview(settingsView)
        
        settingsView.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalToSuperview()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5 && indexPath.item == 0{
            return 35
        }
        return 45
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 10
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell!
        
        if indexPath.section == 5{
            cell = settingsView.optionsTableView.dequeueReusableCell(withIdentifier: "clearid") as? ClearHistoryTableViewCell
        }else{
            cell = settingsView.optionsTableView.dequeueReusableCell(withIdentifier: "cellid") as? OptionTableViewCell
        }
        
        switch indexPath.section {
        case 0:
            switch indexPath.item{
            case 0:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Feedback"
            case 1:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Help"
            case 2:
                (cell as! OptionTableViewCell).descriptionLabel.text = "About"
                (cell as! OptionTableViewCell).isEndSection()
            default:
                break
            }
        case 1:
            switch indexPath.item{
            case 0:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Speech input"
                (cell as! OptionTableViewCell).isEndSection()
            default:
                break
            }
        case 2:
            switch indexPath.item{
            case 0:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Camera input"
            case 1:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Offline translation"
                (cell as! OptionTableViewCell).isEndSection()
            default:
                break
            }
        case 3:
            switch indexPath.item{
            case 0:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Google app settings"
                (cell as! OptionTableViewCell).isEndSection()
            default:
                break
            }
        case 4:
            switch indexPath.item{
            case 0:
                (cell as! OptionTableViewCell).descriptionLabel.text = "Send crash reports"
                (cell as! OptionTableViewCell).isEndSection()
            default:
                break
            }
        case 5:
            switch indexPath.item{
            case 0:
                (cell as! ClearHistoryTableViewCell).descriptionLabel.text = "CLEAR TRANSLATION HISTORY"
                (cell as! ClearHistoryTableViewCell).isEndSection()
            default:
                break
            }
        default:
            break
        }
        return cell
    }
}
