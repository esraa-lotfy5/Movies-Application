//
//  CoreDataHandling.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 5/10/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import Foundation
import CoreData

class CoreDataHandling : CoreDataProtocol {
    
    var managedContext : NSManagedObjectContext!
    var viewModel : HomeViewModel!
    
    init(context: NSManagedObjectContext) {
        managedContext = context
    }
    
    func fetchUpdatedData() -> Array<Item>{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Result")
        do{
            let returnObject = (try managedContext.fetch(fetchRequest)) //NSManagedObject
            let result = returnObject[0].value(forKeyPath: "item")
            guard let newResult = result else{
                return []
            }
            let itemSet = newResult as! NSSet
            print("title: \(newResult)")
            let arr = itemSet.allObjects as NSArray
            let movies = arr as! Array<Item>
            print("message : \(movies)")
            return movies
        }catch let error{
            print("Error Ocurred while fetching data from core data \n")
            print("Error: \(error.localizedDescription)")
        }
        return []
    }
    
    func saveData(response: ResponseResult) {
        let entity = NSEntityDescription.entity(forEntityName: "Result", in: managedContext)
        // create managed object
        let copiedMovies = NSManagedObject(entity: entity!, insertInto: managedContext)
        copiedMovies.setValue(response.errorMessage, forKey: "errorMessage")
        //opiedMovies.setValue(NSSet(array: response.items), forKey: "item")
        var arr : [Item] = []
        for i in (0 ... response.items.count-1){
            print("index of saving: \(i)")
            let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedContext)
            item.setValue(response.items[i].itemID, forKey: "id")
            item.setValue(response.items[i].itemImage, forKey: "image")
            item.setValue(response.items[i].itemRank, forKey: "rank")
            item.setValue(response.items[i].header, forKey: "title")
            item.setValue(response.items[i].itemGross, forKey: "gross")
            item.setValue(response.items[i].weekend, forKey: "weekend")
            item.setValue(response.items[i].weeks, forKey: "weeks")
            arr.append(item as! Item)
        }
        copiedMovies.setValue(NSSet(array: arr), forKey: "item")
        do{
            try managedContext.save()
            print("Successfully inserted")
        }catch let error{
            print("Error Occured while saving new movie \n")
            print("Error: \(error.localizedDescription)")
        }
    }
}

