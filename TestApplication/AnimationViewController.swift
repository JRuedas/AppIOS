//
//  AnimationViewController.swift
//  TestApplication
//
//  Created by Jonathan Ruedas Mora on 26/6/17.
//  Copyright © 2017 Jonathan Ruedas Mora. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    
    @IBOutlet weak var miImageView: UIImageView!
    
    @IBOutlet weak var animarButton: UIButton!
    
    @IBOutlet weak var barra: UIProgressView!
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.0, animations: {
            self.miImageView.center.x -= self.view.bounds.width
        })
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionAnimar(_ sender: Any) {
        UIView.animate(withDuration: 1.2, animations: {
            self.miImageView.center.x += self.view.bounds.width
        })
        
        for i in stride(from: 0.0, to: 1.5, by: 0.25){
            barra.setProgress(Float(i), animated: true)
        }
        
    }
}
