//
//  SprintDetailsPresenter.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

protocol SprintDetailsPresenterInput {
    var output: SprintDetailsPresenterOutput? { get set }
    var details: SprintListItemViewModel? { get }
    
    func viewWillAppear()
    func viewDidAppear()
    func nextButtonPressed()
    func previousButtonPressed()
    func handleSideButtons()
}

protocol SprintDetailsPresenterOutput: class {
    func updateUI()
    func presentLoading()
    func showNextButton()
    func fadeNextButton()
    func showPreviousButton()
    func fadePreviousButton()
}

class SprintDetailsPresenter: SprintDetailsPresenterInput {
    
    weak var output: SprintDetailsPresenterOutput?
    var interactor: SprintDetailsInteractorInput
    var router: SprintDetailsRouter
    
    var details: SprintListItemViewModel?{
        return viewModel
    }
    
    private var viewModel: SprintListItemViewModel? {
        didSet {
            output?.updateUI()
        }
    }
    
    init(interactor: SprintDetailsInteractorInput, router: SprintDetailsRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear(){
        output?.presentLoading()
    }
    
    func viewDidAppear(){
        interactor.fetchDetails(id: router.id)
    }
    
    func nextButtonPressed(){
        output?.presentLoading()
        
        let id = viewModel?.id ?? 1
        interactor.fetchDetails(id: id + 1)
    }
    
    func previousButtonPressed(){
        output?.presentLoading()
        
        let id = viewModel?.id ?? 1
        interactor.fetchDetails(id: id - 1)
    }
    
    func handleSideButtons(){
        guard let id = viewModel?.id, id > 1 else {
            output?.fadePreviousButton()
            return
        }
        
        output?.showPreviousButton()
        guard id < 150 else {
            output?.fadeNextButton()
            return
        }
        output?.showNextButton()
    }
}

extension SprintDetailsPresenter: SprintDetailsInteractorOutput {
    
    func fetchedDetails(_ details: Sprint) {
        viewModel = SprintMapper.parse(from: details)
    }
}
