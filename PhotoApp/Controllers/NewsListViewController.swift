//
//  AddTaskViewController.swift
//  PhotoApp
//
//  Created by Hernandez, Ronald on 2/16/20.
//  Copyright © 2020 Ronaldoh1. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class NewsListViewController: UITableViewController {
    
    private let bag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UITableViewCell
        
        let article = articles[indexPath.row]
        
        cell?.textLabel?.text = article.title
        cell?.detailTextLabel?.text = article.description
        
        return cell!
    }
    private func populateNews() {
        let url = URL(string: "http://newsapi.org/v2/top-headlines?country=us&apiKey=b4ce277bb54a404989ae46330ebbb917")
        
        let resource = Resource<ArticlesList>(url: url!)
        URLRequest.load(resource: resource)
            .subscribe(onNext: { [weak self] result in
                self?.articles = result!.articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            }).disposed(by: bag)
    }
    

    
}


//b4ce277bb54a404989ae46330ebbb917
