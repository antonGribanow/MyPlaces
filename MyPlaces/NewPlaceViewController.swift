//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Anton Gribanow on 31/01/2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView() // удалене линеек для пустых строк
    }
    
    // MARK: Table view delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }

}

// MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {  //Hiding keyboard after Done button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
