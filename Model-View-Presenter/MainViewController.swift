//
//  MainViewController.swift
//  Model-View-Presenter
//
//  Created by Nick Perkins on 4/19/18.

import UIKit

class MainViewController: UIViewController {
    let presenter: MainViewPresenter!
    var mainView: MainView { return self.view as! MainView }
    
    //MARK: Initializer
    init(with presenter: MainViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.likeAction = { [weak self] in self?.likeAction() }
    }
    
    //MARK: Methods
    private func likeAction() {
        presenter.updateLike()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.mainView.likeButton.setTitle(self.presenter.likeButtonTitle, for: .normal)
            self.mainView.contentView.backgroundColor = self.presenter.viewColor
        })
    }
    
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

