//
//  SplashInteractor.swift
//  VIPER
//
//  Created by Keval Gajjar on 01/02/24.
//

import Foundation
import Alamofire


struct LoginData: Codable {
    let email: String
    let password: String
}


class SplashInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    func fetchSplashData() {
        do {
            let password = try WebService().shared.encrypt("abc", withPassword: "123456")
            WebService().shared.callingApi(inputParams: LoginData(email: "keval@brightforce.com", password: password), type: LoginData.self)
        }
        catch {
            debugPrint(error.localizedDescription)
        }
        
    }
}

extension SplashInteractor : WebServiceDelegate {
    func responseReceived(response: JSONDecoder, error: Error) {
        /*
        // Success
           self.presenter?.splashDataFetchedSuccess(splashModelArray: [SplashModel]())
        // Failure
           self.presenter?.splashDataFetchFailed()
        */
    }
    
    
}
