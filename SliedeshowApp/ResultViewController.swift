//
//  ResultViewController.swift
//  SliedeshowApp
//
//  Created by 鈴木正義 on 2020/09/29.
//  Copyright © 2020 masayoshi.suzuki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //prepareによって送られる画像データの箱
    var image:UIImage? = nil
    var playpauseBotton: UIButton!
    var nextBotton: UIButton!
    var backBotton: UIButton!
  
    
    
    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBAction func BackButton(_ sender: Any) {
        
    
        if self.playpauseBotton != nil {
        self.playpauseBotton.setTitle("再生", for: .normal)
            self.playpauseBotton = nil
        }
            
        if self.nextBotton != nil {
        self.nextBotton.isEnabled = true
            self.nextBotton = nil
        }
        
        if self.backBotton != nil {
        self.backBotton.isEnabled = true
            self.backBotton = nil
        }
        
           
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.contentMode = .scaleAspectFill
         imageView.image = image
        
        if self.playpauseBotton != nil {
               self.playpauseBotton.setTitle("再生", for: .normal)
                   self.playpauseBotton = nil
               }
                   
               if self.nextBotton != nil {
               self.nextBotton.isEnabled = true
                   self.nextBotton = nil
               }
               
               if self.backBotton != nil {
               self.backBotton.isEnabled = true
                   self.backBotton = nil
               }
               
        
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
