//
//  BaseViewModel.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class BaseViewModel: ViewModeling {
    
    private var counter = 0
    
    var dev_didUpdateLoading: ((Bool) -> Void)?
    
    required init() {
        initialSetup()
    }
    
    func initialSetup() {}
    func viewDidLoad() {}
    func viewDidBindUIWithViewModel() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}
    func viewDidDisappear(_ animated: Bool) {}
    
    func retainLoading() {
        DispatchQueue.main.async {
            if self.counter == 0 {
                self.dev_didUpdateLoading?(true)
            }
            
            self.counter += 1
        }
    }
    
    func releaseLoading() {
        DispatchQueue.main.async {
            self.counter -= 1
            
            if self.counter == 0 {
                self.dev_didUpdateLoading?(false)
            }
        }
    }
}

