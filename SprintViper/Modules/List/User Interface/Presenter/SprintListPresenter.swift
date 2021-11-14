//
//  SprintListPresenter.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.

import Foundation

protocol SprintListPresenterInput {
    var sprintCount: Int { get }
    var title: String { get }
    
    func viewDidLoad()
    func didSelectCell(at index: Int)
    func getSprint(at index: Int) -> SprintListItemViewModel
    
}

protocol SprintListPresenterOutput: class {
    func updateUIList()
    func presentLoading()
}

class SprintListPresenter: SprintListPresenterInput {
    weak var output: SprintListPresenterOutput?
    var interactor: SprintListInteractorInput
    var router: SprintListRouter
    
    var sprintCount: Int {
        return viewModel.count
    }
    
    var title: String {
        return "Sprint List"
    }
    
    private var viewModel: [SprintListItemViewModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    
    init(interactor: SprintListInteractorInput, router: SprintListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        output?.presentLoading()
        DispatchQueue(label: "Fetch Sprint").async {
            self.interactor.fetch()
        }
    }
    
    func didSelectCell(at index: Int) {
        let sprint = viewModel[index]
        let id = sprint.id
        
        router.presentDetails(id)
    }
    
    func getSprint(at index: Int) -> SprintListItemViewModel {
        return viewModel[index]
    }
}

extension SprintListPresenter: SprintListInteractorOutput {
    
    func fetched(sprints: [Sprint]) {
        self.viewModel = SprintMapper.parse(from: sprints)
    }
    
}

