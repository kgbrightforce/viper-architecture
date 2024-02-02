//
//  SplashViewController.swift
//  VIPER
//
//  Created by Keval Gajjar on 01/02/24.
//

import UIKit

class SplashViewController: UIViewController {

    var presentor: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension SplashViewController : PresenterToViewProtocol {
    
    func showSplashData(splashModelArray: Array<SplashModel>) {
    }
    
    func showError() {
    }
    
}
