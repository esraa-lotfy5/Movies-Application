//
//  ViewController.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/21/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import UIKit
import Kingfisher
import CoreData

protocol HomeViewProtocol {
    func stopAnimating()
    func renderTableViewFromNetwork()
    func renderTableViewFromCoreData()
}

class HomeViewController: UIViewController{
    
    @IBOutlet weak var homeCollection: UICollectionView!
    //  view model reference
    var homeViewModel : HomeViewModel!
    var movieDetailsViewModel : MovieDetailsViewModel!
    var movies : Array<Item> = []
    var castedMovies : Array<MoviesItem> = []
    let indicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeCollection.delegate = self
        homeCollection.dataSource = self
        
        //  loading indicator
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        //  fetch data from network
        if(homeViewModel == nil){
            print("home view model == nil")
        }
        homeViewModel.bindResultToHomeView = {[weak self] in
            print("we are now going to fetch data from network")
            DispatchQueue.main.async{
                self?.stopAnimating()
                self?.renderTableViewFromNetwork()
            }
        }
        homeViewModel.getMoviesFromNetwork()
    }
    
}

extension HomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print("length: \(castedMovies.count), \(movies.count)")
         if(castedMovies.count == 0){
             return movies.count
         }
         return castedMovies.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        //  cell style
        //  cell corner radius
        cell.layer.cornerRadius = 25.0
        
        if(!castedMovies.isEmpty){
            cell.imageName.text = castedMovies[indexPath.row].header ?? ""
            let url = URL(string: castedMovies[indexPath.row].itemImage ?? "")
            cell.movieImage.kf.setImage(with: url , placeholder: UIImage(systemName: "film"))
        }else{
            cell.imageName.text = movies[indexPath.row].title ?? ""
            let url = URL(string: movies[indexPath.row].image ?? "")
            cell.movieImage.kf.setImage(with: url , placeholder: UIImage(systemName: "film"))
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailScreen : MovieDetais = self.storyboard?.instantiateViewController(identifier: "details") as! MovieDetais
            
            if(movies.count == 0){
                movieDetailsViewModel.movie = castedMovies[indexPath.row]
            }else{
                movieDetailsViewModel.movie.header = movies[indexPath.row].title
                movieDetailsViewModel.movie.itemID = movies[indexPath.row].id
                movieDetailsViewModel.movie.itemGross = movies[indexPath.row].gross
                movieDetailsViewModel.movie.itemImage = movies[indexPath.row].image
                movieDetailsViewModel.movie.weekend = movies[indexPath.row].weekend
                movieDetailsViewModel.movie.weeks = movies[indexPath.row].weeks
                movieDetailsViewModel.movie.itemRank = movies[indexPath.row].rank
            }
            detailScreen.modalPresentationStyle = UIModalPresentationStyle.fullScreen
             detailScreen.viewModel = movieDetailsViewModel
            self.navigationController?.pushViewController(detailScreen, animated: true)
    
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
         let padding: CGFloat =  25
         let collectionViewSize = collectionView.frame.size.width - padding
         return CGSize(width: collectionViewSize/1, height: 70)

    }
}


extension HomeViewController : HomeViewProtocol{
    func stopAnimating() {
        indicator.stopAnimating()
    }
    
    func renderTableViewFromNetwork() {
        guard let newResult = homeViewModel.result else{
            self.renderTableViewFromCoreData()
            print("result = nil")
            return
        }
        print("After wrapping response: NewResult: \(newResult)\n")
        self.castedMovies = newResult.items
        homeViewModel.saveInCoreData(response: newResult)
        self.homeCollection.reloadData()
    }
    
    func renderTableViewFromCoreData(){
        movies = homeViewModel.getMoviesFromCoreData()
        self.homeCollection.reloadData()
    }
}
