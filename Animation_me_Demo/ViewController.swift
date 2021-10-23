//
//  ViewController.swift
//  Animation_me_Demo
//
//  Created by 준수김 on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var UpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myView.center = view.center
    }
    

    @IBAction func Up(_ sender: Any) {
        myView.frame =  CGRect(x: 107, y: 1000, width: 200, height: 200)
        UIView.animate(withDuration: 3, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self.myView.center = self.view.center
        }, completion: { done in
            if done { //위의 애니메이션이 작동 되고 난후 - 즉, 다커지고 나면
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) { //0.5초후 크기 증가
                    self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                    self.myView.center = self.view.center
                }
                
            }
        })
    }
    
    @IBAction func beginFromCurrentState(_ sender: UIButton) { //튕기는 효과
        animate()
    }
    
   func animate() {
       myView.frame =  CGRect(x: 182, y: 50, width: 50, height: 50)
       UIView.animate(withDuration: 0.5, animations: {
            self.myView.frame = CGRect(x: 182, y: 200, width: 50, height: 50)
            
        }, completion: { done in
            if done { //위의 애니메이션이 작동 되고 난후 - 즉, 다커지고 나면
                self.reverse()
                print("작동1")
            }
        })
    }
    
    func reverse() {
        myView.frame =  CGRect(x: 182, y: 200, width: 50, height: 50)
        UIView.animate(withDuration: 0.5, animations: {
            self.myView.frame = CGRect(x: 182, y: 50, width: 50, height: 50)
            
        }, completion: { done in
            if done { //위의 애니메이션이 작동 되고 난후 - 즉, 다커지고 나면
                self.animate() //커지는 함수 작동
                print("작동2")
            }
        })
    }
    

    
    @IBAction func STOP(_ sender: UIButton) {
        myView.layer.removeAllAnimations()
    }
}

