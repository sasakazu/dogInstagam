//
//  ViewController.swift
//  dogInstagram
//
//  Created by 笹倉 一也 on 2017/10/17.
//  Copyright © 2017年 笹倉 一也. All rights reserved.
//

import UIKit
import Social



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    


    @IBAction func buttonTapped(_ sender: Any) {
        
          performSegue(withIdentifier: "toViewController2",sender: nil)
    }
    
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toViewController2") {
            let vc2: ViewController2 = (segue.destination as? ViewController2)!
            // ViewControllerのtextVC2にメッセージを設定
            vc2.textVC2 = "to VC2"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


    


