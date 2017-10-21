//
//  ViewController.swift
//  dogInstagram
//
//  Created by 笹倉 一也 on 2017/10/17.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
 
    
    @IBOutlet weak var cameraView: UIImageView!
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Tap the [Start] to take a picture"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func startCamera(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType =
                    UIImagePickerControllerSourceType.camera
                // カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(
                    UIImagePickerControllerSourceType.camera){
                    // インスタンスの作成
                    let cameraPicker = UIImagePickerController()
                    cameraPicker.sourceType = sourceType
                    cameraPicker.delegate = self
                    self.present(cameraPicker, animated: true, completion: nil)
        
                    
                }
                else{
                    label.text = "error"
        
                }
    }
    
    
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage]
            as? UIImage {
            
            cameraView.contentMode = .scaleAspectFit
            cameraView.image = pickedImage
            
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
    }
    
    

    
    @IBAction func savePicture(_ sender: Any) {
        let image:UIImage! = cameraView.image
        
                if image != nil {
                    UIImageWriteToSavedPhotosAlbum(image, self,        #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)),
                    nil)
                }
        
                else{
                    label.text = "image Failed !"
                }
        
        
        
    }
    
    
    
    
    
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "Save Succeeded"
        }
    }
    

    
    @IBAction func showAlbum(_ sender: Any) {
     
        let sourceType:UIImagePickerControllerSourceType =
                    UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
        
                    label.text = "Tap the [Start] to save a picture"
                }
                else{
                    label.text = "error"
        
                }
    }
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    
    
    
    
    
    
}


    


