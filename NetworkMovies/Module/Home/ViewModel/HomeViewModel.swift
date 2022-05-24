//
//  HomeViewModel.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 5/9/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    func getMoviesFromNetwork()
    func getMoviesFromCoreData() -> Array<Item>
    func saveInCoreData(response: ResponseResult)
}

class HomeViewModel {
    //  network service protocol
    var networkDelegate : MovieService!
    var localModel : CoreDataProtocol!
    
    var bindResultToHomeView : (() -> ()) = {}
    var result : ResponseResult!{
        didSet{
            bindResultToHomeView()
        }
    }

    
    init(networkDelegate : MovieService, localModel: CoreDataProtocol) {
        self.networkDelegate = networkDelegate
        self.localModel = localModel
        print("we are home view model init")
        guard let NWdelegate = self.networkDelegate else{
            return
        }
        self.networkDelegate = NWdelegate
        guard let locModel = self.localModel else{
            return
        }
        self.localModel = locModel
    }
}


extension HomeViewModel : HomeViewModelProtocol{
    func getMoviesFromNetwork(){
        networkDelegate.fetchResult{[weak self](result) -> Void in
            self?.result = result
       }
    }
    
    func getMoviesFromCoreData() -> Array<Item> {
        return self.localModel.fetchUpdatedData()
    }
    
    func saveInCoreData(response: ResponseResult){
        self.localModel.saveData(response: response)
    }
}
