//
//  NetworkDelegate.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/23/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation

protocol MovieService {
    func fetchResult(complitionHandler: @escaping (ResponseResult?) -> Void)
}

class NetworkDelegate : MovieService{
    private init(){}
    static let delegate = NetworkDelegate()

func fetchResult(complitionHandler: @escaping (ResponseResult?) -> Void) {
    // 1 . URL
    let url = URL(string:"https://imdb-api.com/en/API/BoxOffice/k_otyit8b3")
    // 2 . Request
    guard let newURL = url  else{
        return
    }
    let request = URLRequest(url: newURL)
    // 3 . create session
    let session = URLSession(configuration: URLSessionConfiguration.default)
    // 4 . create task and specify its type
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data else{
            print("Something wrong happened while recieving movies")
            complitionHandler(nil)
            return
        }
        do{
            //  if data not equal nil, then we will recieve it as json object
            print(" \n \n DATTTTAAAAAA : \n \(data) \n \n")
            let result = try JSONDecoder().decode(ResponseResult.self, from: data)
            print("From Network Delegate: result : \(result)")
            complitionHandler(result)
        }catch let error {
            print("Error in formatting json result : Error -> \(error.localizedDescription)")
            complitionHandler(nil)
        }
    }
    // 5 . to start task .. start before clausre
    task.resume()
}
}
