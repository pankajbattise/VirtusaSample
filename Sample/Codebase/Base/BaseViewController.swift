//
//  BaseViewController.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class BaseViewController<ViewModelType: ViewModeling>: UIViewController {
    
    var viewModel: ViewModelType!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetup()
    }
        
    func initialSetup() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupUI()
        bindUIWithViewModel()
        viewModel.viewDidBindUIWithViewModel()
    }
    
    func setupUI() {}
    
    func bindUIWithViewModel() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear(animated)
        super.viewDidDisappear(animated)
    }
}

