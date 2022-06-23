//
//  ViewModeling.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

protocol ViewModeling {
    
    func initialSetup()
    func viewDidLoad()
    func viewDidBindUIWithViewModel()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    
    func retainLoading()
    func releaseLoading()
}

