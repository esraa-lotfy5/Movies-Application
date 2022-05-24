//
//  MovieDetais.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/23/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//

import UIKit

class MovieDetais: UIViewController {
    var viewModel : MovieDetailsViewModel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var idField: UILabel!
    @IBOutlet weak var rankField: UILabel!
    @IBOutlet weak var weekendField: UILabel!
    @IBOutlet weak var grossField: UILabel!
    @IBOutlet weak var weeksField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let movie = viewModel.movie
        // Do any additional setup after loading the view.
        let url = URL(string: movie.itemImage ?? "")
        movieImage.kf.setImage(with: url , placeholder: UIImage(systemName: "film"))
        titleField.text = movie.header
        idField.text = movie.itemID
        rankField.text = movie.itemRank
        weekendField.text = movie.weekend
        grossField.text = movie.itemGross
        weeksField.text = movie.weeks
    }
}
