//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Anton Gribanow on 31/01/2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    @IBOutlet var placeImage: UIImageView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var placeName: UITextField!
    @IBOutlet var placeLocanion: UITextField!
    @IBOutlet var placeType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView() // удалене линеек для пустых строк
        saveButton.isEnabled = false //przycisk Save jest dostępny tylko wtedy, jak uest wypełnione pole Name
        
        placeName.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    // MARK: Table view delegate
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           if indexPath.row == 0 {
               
               let cameraIcon = #imageLiteral(resourceName: "camera")
               let photoIcon = #imageLiteral(resourceName: "photo")
               
               let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
               
               let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                
                   self.chooseImagePicker(source: .camera)
               }
               camera.setValue(cameraIcon, forKey: "image") //dodajumy ikonki do przycisków
               camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
               
               let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                   self.chooseImagePicker(source: .photoLibrary)
               }
               photo.setValue(photoIcon, forKey: "image") //dodajumy ikonki do przycisków
               photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
               
               let cancel = UIAlertAction(title: "Cancel", style: .cancel)
               
               actionSheet.addAction(camera)
               actionSheet.addAction(photo)
               actionSheet.addAction(cancel)
               
               present(actionSheet, animated: true)
               
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
    
    @objc private func textFieldChange() {
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
    
}

// MARK: Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { // metoda wstawia obrazek na mejsce
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill     //masztabujemy image
        placeImage.clipsToBounds = true               //tniemy image
        dismiss(animated: true)                         //zamykamy imagePickerController
    }
}
