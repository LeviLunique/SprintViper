//
//  SprintDetailsViewController.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import UIKit

class SprintDetailsViewController: UIViewController {

    @IBOutlet weak var nomeSprint: UILabel!
    @IBOutlet weak var linkSprint: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var presenter: SprintDetailsPresenterInput?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        presenter?.previousButtonPressed()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        presenter?.nextButtonPressed()
    }
    
}

extension SprintDetailsViewController: SprintDetailsPresenterOutput {
    
    func updateUI() {
        let display = presenter?.details
        
        DispatchQueue.main.async {
            self.view.stopActivity()
        }
        
        title = display?.nome
        nomeSprint.text = display?.nome
        linkSprint.text = "Link: \(display?.link ?? "")"
        
        presenter?.handleSideButtons()
    }
    
    func presentLoading() {
        title = ""
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
    
    func showNextButton() {
        nextButton.alpha = 1.0
    }
    
    func fadeNextButton() {
        nextButton.alpha = 0.0
    }
    
    func showPreviousButton() {
        previousButton.alpha = 1.0
    }
    
    func fadePreviousButton() {
        previousButton.alpha = 0.0
    }
}
