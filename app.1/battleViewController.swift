//
//  battleViewController.swift
//  app.1
//
//  Created by 中根健介 on 2018/07/07.
//  Copyright © 2018年 中根健介. All rights reserved.
//

import UIKit

class battleViewController: UIViewController {
    
    var number: Int!
    var number1: Int!
    var judge: Int!
    var lose = UIImage(named:"半透明")!
    var win = UIImage(named:"半透明1")!
    
    @IBOutlet var score: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var enemylabel1: UILabel!
    @IBOutlet var enemylabel2: UILabel!
    @IBOutlet var enemylabel3: UILabel!
    @IBOutlet var enemylabel4: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var image1: UIImageView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var enemybutton1: UIButton!
    @IBOutlet var enemybutton2: UIButton!
    @IBOutlet var enemybutton3: UIButton!
    @IBOutlet var enemybutton4: UIButton!
    
    let cardArray: [String] = ["+1","-2","+3","-4","×2","×(-3)"]
    let enemycardArray: [String] = ["+1","-2","+3","-4","×2","×(-3)"]
    
    let index = Int(arc4random_uniform(6))
    let index1 = Int(arc4random_uniform(6))
    let index2 = Int(arc4random_uniform(6))
    let index3 = Int(arc4random_uniform(6))
    let enemyindex = Int(arc4random_uniform(6))
    let enemyindex1 = Int(arc4random_uniform(6))
    let enemyindex2 = Int(arc4random_uniform(6))
    let enemyindex3 = Int(arc4random_uniform(6))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number = 0
        number1 = Int(self.view.bounds.width) / 2
        score.text = String(number)

        label1.text = cardArray[index]
        label2.text = cardArray[index1]
        label3.text = cardArray[index2]
        label4.text = cardArray[index3]
        enemylabel1.text = enemycardArray[enemyindex]
        enemylabel2.text = enemycardArray[enemyindex1]
        enemylabel3.text = enemycardArray[enemyindex2]
        enemylabel4.text = enemycardArray[enemyindex3]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Botton1 () {
        changeNumber(index: index)
    }
    
    @IBAction func Botton2 () {
        changeNumber(index: index1)
    }
    
    @IBAction func Botton3 () {
        changeNumber(index: index2)
    }
    
    @IBAction func Botton4 () {
        changeNumber(index: index3)
    }
    
    @IBAction func enemyBotton1 () {
        changeNumber(index: enemyindex)
    }
    
    @IBAction func enemyBotton2 () {
        changeNumber(index: enemyindex1)
    }
    
    @IBAction func enemyBotton3 () {
        changeNumber(index: enemyindex2)
    }
    
    @IBAction func enemyBotton4 () {
        changeNumber(index: enemyindex3)
    }
    
    func changeNumber (index: Int) {
        if index == 0 {
            number += 1
            
        }
        if index == 1 {
            number -= 2
        }
        if index == 2 {
            number += 3
        }
        if index == 3 {
            number -= 4
        }
        if index == 4 {
            number *= 2
        }
        if index == 5 {
            number *= -3
        }
        score.text = String(number)
        
        self.image.center.x =
            CGFloat(number1) + CGFloat(number)
        
        if number <= -100 {
            judge = 0
            fin()
        }
        if number >= 100 {
            judge = 1
            fin()
        }
        
        print(number + number1)
        
    }
    
    func fin (){
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        enemybutton1.isEnabled = false
        enemybutton2.isEnabled = false
        enemybutton3.isEnabled = false
        enemybutton4.isEnabled = false
        
        if judge == 0 {
            image1.image = lose
            
            
        }
        if judge == 1 {
            image1.image = win
        }
        // ボタンのインスタンス生成
        let button : UIButton = UIButton(type: UIButtonType.system)
        
        // ボタンの位置とサイズを設定
        button.frame = CGRect(x:number1 - 75, y:400,
                              width:150, height:30)
        
        // ボタンのタイトルを設定
        button.setTitle("ホームに戻る", for:UIControlState.normal)
        
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 20)
        
        button.backgroundColor = UIColor.red // 背景色
        
        button.layer.cornerRadius = 10.0 // 角丸のサイズ
        
        self.view.addSubview(button)
        
        button.addTarget(self,
                         action: #selector(toHome),
                         for: .touchUpInside)
        
        //self.view.bringSubview(toFront: button)
    }
    @objc func toHome(){
        performSegue(withIdentifier:"home",sender: nil)
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
