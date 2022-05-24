//
//  MockNetworkDelegate.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 5/12/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation

class MockNetworkDelegate{
    var shouldReturnError : Bool
    init(shouldReturnError : Bool){
        self.shouldReturnError = shouldReturnError
    }
    let mockItemsJSONResponse = """
    {"items":[{"id":"tt9419884","rank":"1","title":"Doctor Strange in the Multiverse of Madness","image":"https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$187.4M","gross":"$187.4M","weeks":"1"},{"id":"tt8115900","rank":"2","title":"The Bad Guys","image":"https://m.media-amazon.com/images/M/MV5BMDhkYmU0MzctMWEzNy00ODg1LWI3ZjAtMGZlZjkzNWVmMzVjXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$9.6M","gross":"$57.4M","weeks":"3"},{"id":"tt12412888","rank":"3","title":"Sonic the Hedgehog 2","image":"https://m.media-amazon.com/images/M/MV5BYzA0NGY2NGItNTg2ZS00ZWRlLTg4ZDctYzQ5Zjg3NGE2ZDNlXkEyXkFqcGdeQXVyMTQyMTMwOTk0._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$6.0M","gross":"$169.7M","weeks":"5"},{"id":"tt4123432","rank":"4","title":"Fantastic Beasts: The Secrets of Dumbledore","image":"https://m.media-amazon.com/images/M/MV5BZGQ1NjQyNDMtNzFlZS00ZGIzLTliMWUtNGJkMGMzNTBjNDg0XkEyXkFqcGdeQXVyMTE1NDI5MDQx._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$4.3M","gross":"$86.3M","weeks":"4"},{"id":"tt6710474","rank":"5","title":"Everything Everywhere All at Once","image":"https://m.media-amazon.com/images/M/MV5BYTdiOTIyZTQtNmQ1OS00NjZlLWIyMTgtYzk5Y2M3ZDVmMDk1XkEyXkFqcGdeQXVyMTAzMDg4NzU0._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$3.5M","gross":"$41.8M","weeks":"7"},{"id":"tt11138512","rank":"6","title":"The Northman","image":"https://m.media-amazon.com/images/M/MV5BMzVlMmY2NTctODgwOC00NDMzLWEzMWYtM2RiYmIyNTNhMTI0XkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$2.9M","gross":"$28.1M","weeks":"3"},{"id":"tt13320622","rank":"7","title":"The Lost City","image":"https://m.media-amazon.com/images/M/MV5BMmIwYzFhODAtY2I1YS00ZDdmLTkyYWQtZjI5NDIwMDc2MjEyXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$2.8M","gross":"$94.7M","weeks":"7"},{"id":"tt11291274","rank":"8","title":"The Unbearable Weight of Massive Talent","image":"https://m.media-amazon.com/images/M/MV5BNDM2ODNiMWItOWRkNS00ODE3LWE2OGYtNTZkMDJkOWI1ODMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$1.6M","gross":"$16.4M","weeks":"3"},{"id":"tt11827628","rank":"9","title":"Memory","image":"https://m.media-amazon.com/images/M/MV5BOGI5N2FhNzktZjZlNi00MmRjLWE1MmUtNjRlNzQyOGMzYjNhXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UX128_CR0,3,128,176_AL_.jpg","weekend":"$1.4M","gross":"$5.7M","weeks":"2"},{"id":"tt14439896","rank":"10","title":"Father Stu","image":"https://m.media-amazon.com/images/M/MV5BNGYwOTI1MTUtYmY0Mi00OTAxLTkwNDEtOTI5YTkyZTVhN2JiXkEyXkFqcGdeQXVyMTAxNDE3MTE5._V1_UY176_CR6,0,128,176_AL_.jpg","weekend":"$875K","gross":"$19.3M","weeks":"4"}],"errorMessage":""}
"""
    enum ResponseWithError{
        case responseError
    }
       
}

extension MockNetworkDelegate : MovieService{
    func fetchResult(complitionHandler: @escaping (ResponseResult?) -> Void) {
        do{
            //let json = try JSONSerialization.data(withJSONObject: mockItemsJSONResponse)
            let json = Data(mockItemsJSONResponse.utf8)
            let result = try JSONDecoder().decode(ResponseResult.self, from: json)
            if(shouldReturnError){
                complitionHandler(nil)
            }else{
                complitionHandler(result)
            }
        }catch{
            print("error occured")
        }
    }
    
    
}
