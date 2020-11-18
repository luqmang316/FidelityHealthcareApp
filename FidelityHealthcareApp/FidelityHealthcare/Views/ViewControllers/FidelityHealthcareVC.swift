//
//  FidelityHealthcareVC.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

class FidelityHealthcareVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    private var searchBarController: UISearchController!
    private var viewModel = FidelityHealthcareViewModel()
    
    private var isFirstTimeActive = true
    let identifierCell = "SearchResultCell"
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModelClosures()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    
        if isFirstTimeActive {
            searchBarController.isActive = true
            isFirstTimeActive = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showAlert(title: String = "Fidelity Healthcare", message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default) {(action) in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK:- Configure UI
extension FidelityHealthcareVC {
    
    fileprivate func configureUI() {
        // Do any additional setup after loading the view, typically from a nib.
        
        createSearchBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        // Set table row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        // Set table footer view
        tableView.tableFooterView = UIView()
        
    }
}

//MARK:- Clousers
extension FidelityHealthcareVC {
    
    fileprivate func viewModelClosures() {
        
        //Show alert view on error
        viewModel.showAlert = { [weak self] (message) in
            self?.searchBarController.isActive = false
            self?.showAlert(message: message)
        }
        
        viewModel.dataUpdated = { [weak self] in
            print("data source updated")
            self?.tableView.reloadData()
        }
    }
    
}

//MARK:- UISearchBarDelegate
extension FidelityHealthcareVC: UISearchControllerDelegate, UISearchBarDelegate {
    
    private func createSearchBar() {
        
        searchBarController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBarController
        searchBarController.delegate = self
        searchBarController.searchBar.delegate = self
        searchBarController.obscuresBackgroundDuringPresentation = false
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, text.count > 1 else {
            return
        }
        
        self.tableView.reloadData()
        
        viewModel.search(text: text) {
            print("search completed.")
        }
        
        searchBarController.searchBar.resignFirstResponder()
    }
}


//MARK:- UItableViewDataSource
extension FidelityHealthcareVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.dataSource.count
        
    }
    
    
    //Show cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as? SearchResultCell else {
            
            return UITableViewCell()
        }
        
        cell.viewModel = self.viewModel.dataSource[indexPath.row]
        
        return cell
        
    }
    
    //Set row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
}




