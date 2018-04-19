//
//  MainViewPresenter.swift
//  Model-View-Presenter
//
//  Created by Nick Perkins on 4/19/18.

import Foundation
import UIKit

class MainViewPresenter {
    private var model = MainModel(liked: false)
    var likeButtonTitle: String {
        return model.liked ? "Dislike" : "Like"
    }
    var viewColor: UIColor {
        return model.liked ? UIColor.red.withAlphaComponent(0.5) : .clear
    }
    
    func updateLike() {
        model.liked = !model.liked
    }
}

struct MainModel {
    var liked: Bool
}
