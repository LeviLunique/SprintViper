//
//  SprintListViewController.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import UIKit

class SprintListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: SprintListPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        presenter?.viewDidLoad()
    }
}

extension SprintListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.sprintCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SprintTableViewCell.defaultReuseIdentifier, for: indexPath) as! SprintTableViewCell
        
        cell.display = presenter?.getSprint(at: indexPath.row)
        cell.setUp()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath.row)
    }
    
}

extension SprintListViewController: SprintListPresenterOutput {
    
    func updateUIList() {
        DispatchQueue.main.async {
            self.view.stopActivity()
            self.tableView.reloadData()
        }
    }
    func presentLoading() {
        DispatchQueue.main.async {
            self.view.presentActivity()
        }
    }
    
}

extension SprintListViewController {
    
    private func setUpTableView() {
        tableView.registerNib(nibName: SprintTableViewCell.defaultReuseIdentifier, bundle: nil)
        tableView.assignTo(delegate: self, dataSource: self)
    }
    
    private func setUpNavigation() {
        title = presenter?.title
        navigationController?.navigationBar.backgroundColor = .primary
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refresh))
    }
    
    @objc private func refresh() {
        presenter?.viewDidLoad()
    }
}
