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
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.contentMode = .scaleAspectFill
         imageView.image = image
        
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
