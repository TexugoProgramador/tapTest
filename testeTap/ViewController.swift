//
//  ViewController.swift
//  testeTap
//
//  Created by humberto Lima on 21/03/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var arrayTemp = [[CGPoint(), CGFloat(),CGFloat()]]
    
    @IBOutlet var touchPosition: UITapGestureRecognizer!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayTemp.append([button1.layer.position, button1.frame.height, button1.frame.width])
        arrayTemp.append([button2.layer.position, button2.frame.height, button2.frame.width])
        arrayTemp.append([button3.layer.position, button3.frame.height, button3.frame.width])
        arrayTemp.append([button4.layer.position, button4.frame.height, button4.frame.width])
        
        touchPosition.delegate = self
    }


    func playSound(indexPressed: Int) {
        print("Sound")
    }
    

    @IBAction func touchView(_ sender: UITapGestureRecognizer) {
        print("a")
        let touchLocation = sender.location(in: view)
        for (index, temp) in arrayTemp.enumerated().reversed() {
            let buttonPosition = temp[0] as! CGPoint
            let buttonHeigt = temp[1] as! CGFloat
            let buttonWidht = temp[2] as! CGFloat
        
            if touchLocation.x >= buttonPosition.x && touchLocation.y >= buttonPosition.y {
                if touchLocation.x <= (buttonPosition.x + buttonHeigt) && touchLocation.y <= (buttonPosition.y + buttonWidht) {
                    playSound(indexPressed: index)
                }
            }
        }
        
    }
}

