//
//  ViewController.swift
//  Guided Project - Light
//
//  Created by Dmitriy Stekvashov on 05.06.2020.
//  Copyright © 2020 Dmitriy Stekvashov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var isLightOn = true
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        isLightOn = !isLightOn
        updateView()
        
    }
    func updateView(){
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if let dev = device, dev.hasTorch{
            view.backgroundColor = .black
            do{
                try dev.lockForConfiguration()
                dev.torchMode = isLightOn ? .on : .off
                dev.unlockForConfiguration()
            }catch{
                print(error)
            }
            
            }else{
            view.backgroundColor = isLightOn ? .white : .black
        }

    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }


}

