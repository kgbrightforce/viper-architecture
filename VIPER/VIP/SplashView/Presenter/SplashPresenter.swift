//
//  SplashPresenter.swift
//  VIPER
//
//  Created by Keval Gajjar on 01/02/24.
//

import Foundation
import UIKit


class SplashPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingSplashData() {
        interactor?.fetchSplashData()
    }
    func showLoginViewController(navigationController: UINavigationController) {
        router?.showLoginViewController(navigationController: navigationController)
    }

}

extension SplashPresenter: InteractorToPresenterProtocol{
    func splashDataFetchedSuccess(splashModelArray: Array<SplashModel>) {
        view?.showSplashData(splashModelArray: splashModelArray)
    }
    
    func splashDataFetchFailed() {
        view?.showError()
    }
}
