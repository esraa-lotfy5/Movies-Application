//
//  CoreDataProtocol.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/24/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation
protocol CoreDataProtocol {
    func fetchUpdatedData() -> Array<Item>
    func saveData(response: ResponseResult)
}
