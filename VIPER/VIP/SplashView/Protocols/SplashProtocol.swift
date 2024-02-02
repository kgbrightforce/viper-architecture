//
//  SplashProtocol.swift
//  VIPER
//
//  Created by Keval Gajjar on 01/02/24.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingSplashData()
    func showLoginViewController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol: AnyObject {
    func showSplashData(splashModelArray:Array<SplashModel>)
    func showError()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule()-> SplashViewController
    func showLoginViewController(navigationController:UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchSplashData()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func splashDataFetchedSuccess(splashModelArray:Array<SplashModel>)
    func splashDataFetchFailed()
}
