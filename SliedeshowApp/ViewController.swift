//
//  ViewController.swift
//  SliedeshowApp
//
//  Created by 鈴木正義 on 2020/09/28.
//  Copyright © 2020 masayoshi.suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playpauseBotton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBotton: UIButton!
    @IBOutlet weak var backBotton: UIButton!
    
    @IBAction func onTapImage(_ sender: Any) {
        //segueを使って画像をタップした時に次のページに移動できるようにしている
        //segueとはページとページを繋ぐアイコン
        // 画像はボタンと違って押しただけでは動かないため、タップジェスチャーを画像と次のページの間にかませなきゃいけない
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    
    
    var timer: Timer!
    
    var timer_sec: Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "skater")!,
        UIImage(named: "photo-1535268593044-5d06201e382b")!,
        UIImage(named: "photo-1519255706606-d1ebf4d97480")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //prepareの中は、画像を移動させた時に作動するメソッドをかける
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController =
            segue.destination as! ResultViewController
        resultViewController.image = imageArray[timer_sec]
       
           if self.timer != nil {
               self.timer.invalidate()   // タイマーを停止する
               self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            
            playpauseBotton.setTitle("再生", for: .normal)
            nextBotton.isEnabled = true
            backBotton.isEnabled = true
            
           }
    }
        
      
    
    @IBAction func nextBotton(_ sender: Any) {
        if timer_sec == 0 {
            timer_sec = 1
        } else if timer_sec == 1 {
            timer_sec = 2
        } else if timer_sec == 2 {
            timer_sec = 0
        }
        // どのイメージをここでアクションさせるか
        imageView.image = imageArray[timer_sec]
        
        
    }
    @IBAction func backBotton(_ sender: Any) {
        if timer_sec == 0 {
            timer_sec = 2
        } else if timer_sec == 2 {
            timer_sec = 1
        } else if timer_sec == 1 {
            timer_sec = 0
        }
        
        imageView.image = imageArray[timer_sec]
        
    }
    
    @IBAction func playpauseBotton(_ sender: Any) {
        
        if(timer == nil){
            
            timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            playpauseBotton.setTitle("停止", for: .normal)
            nextBotton.isEnabled = false
            backBotton.isEnabled = false
            
        } else {
            timer.invalidate()
            timer = nil
            playpauseBotton.setTitle("再生", for: .normal)
            nextBotton.isEnabled = true
            backBotton.isEnabled = true
        }
        
    }
    
    @objc func changeImage() {
        timer_sec += 1
        if (timer_sec == imageArray.count) {
            timer_sec = 0
        }
        imageView.image = imageArray[timer_sec]
        
        
    }
    // 次のページから戻ってくる時に必要
    @IBAction func unwind(_ segue: UIStoryboardSegue){}
    
}

