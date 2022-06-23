//
//  ViewController.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func buttonTapped(_ sender: Any) {
        Router().openEmployees()
    }
}

