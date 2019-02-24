//
//  ViewController.swift
//  FoodTracker
//
//  Created by Parker Smart on 2/24/19.
//  Copyright © 2019 Spilled Milk. All rights reserved.
//

import UIKit

class ViewController: UIViewController
                    , UIImagePickerControllerDelegate
                    , UINavigationControllerDelegate
                    , UITextFieldDelegate {
    
    //MARK: Properties

    @IBOutlet weak var mealNameLabel: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text's user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController
        , didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple respresentations of the image. You want to use the original.
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else
        {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        
        nameTextField.resignFirstResponder()
        
        //UIImagePickerController is a view contrller that lets a user pick media from their photo library.
        
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken. (able to use shorter form of the enumeration)
        //imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewContrller is notified when the user picks an image.
        imagePickerController.delegate = self
        
        // User the ViewControllers method to present the image picker.
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}
