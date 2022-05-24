//
//  DependencyProvider.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 5/10/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation
import UIKit

class DependencyProvider{
    static var networkDelegate : MovieService{
        return NetworkDelegate.delegate
    }
    static var localModel : CoreDataProtocol{
        // for core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        return CoreDataHandling(context : managedContext)
    }
    static var homeViewModel : HomeViewModel{
        return HomeViewModel(networkDelegate: self.networkDelegate, localModel: self.localModel)
    }
    static var movieDetailsViewModel : MovieDetailsViewModel{
        return MovieDetailsViewModel()
    }
    
    static var rootViewController: UINavigationController{
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "mainViewController") as! HomeViewController
        vc.homeViewModel = homeViewModel
        vc.movieDetailsViewModel = movieDetailsViewModel

        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
}
