//
//  ViewController2.swift
//  
//
//  Created by 笹倉 一也 on 2017/11/05.
//

import UIKit

class ViewController2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
   
    
    var dog_list = [ "大型犬", "中型犬", "小型犬" ]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dog_list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dog_list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dogLabel.text = dog_list[row]
    }
    


    @IBOutlet weak var dogPickerView: UIPickerView!
    
    @IBOutlet weak var dogLabel: UILabel!
    
    @IBAction func commentTextfield(_ sender: Any) {
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cameraView: UIImageView!

    var textVC2:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         dogPickerView.delegate = self
         dogPickerView.dataSource = self
        
         label.text = "カメラボタンを押すとカメラ起動！"
    
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
    
//    // キーボードを閉じる
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        commentTextfield.resignFirstResponder()
//        return true
//    }
    

    
    
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
        label.text = "保存ボタンで保存する"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "キャンセル"
    }
    
    
    
    @IBAction func savePictute(_ sender: Any) {
        
        let image:UIImage! = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self,
                                           #selector(ViewController2.image(_:didFinishSavingWithError:contextInfo:)),
                                           nil)
        }
        else{
            label.text = "失敗しました !"
        }
    }
    
    
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            label.text = "保存できませんでした !"
        }
        else{
            label.text = "保存しました！"
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
            
            label.text = "カメラボタンをタップ！"
        }
        else{
            label.text = "エラー"
            
        }
        
    }
    
    //改行ボタンが押された際に呼ばれる.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
