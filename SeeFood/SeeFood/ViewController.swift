//
//  ViewController.swift
//  SeeFood
//
//  Created by Suruchi Singh on 1/22/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        //imagePicker.sourceType = .camera //-for camera
        imagePicker.sourceType = .photoLibrary //-for user's photo library
        imagePicker.allowsEditing = false
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //this data should be of type Image
        if  let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = userPickedImage
            guard let ciimage = CIImage(image:userPickedImage) else {fatalError("Could not convert UI Image to CI Image")}
            
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)

    }
    
    
    func detect(image : CIImage){
        
        guard let model = try? VNCoreMLModel(for : Inceptionv3().model) else {fatalError("Loading Core ML Model failed")}
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
        guard let results = request.results as? [VNClassificationObservation] else {fatalError("Model failed to process image")}
        print(results)
            if let firstResult = results.first{
                if firstResult.identifier.contains("hotdog"){
                    self.navigationItem.title = "Hotdog!"
                }
                else{
                    self.navigationItem.title = "Not Hotdog!"
                }
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage:image)
        do{
            try handler.perform([request])
        }
        catch{
            print(error)
        }
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

