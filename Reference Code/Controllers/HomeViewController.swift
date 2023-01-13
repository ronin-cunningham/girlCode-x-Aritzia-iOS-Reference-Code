//
//  HomeViewController.swift
//  Reference Code
//
//  Created by Ronin Cunningham on 2023-01-09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // 11!!!
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // 17!!!
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 5!!!
        view.backgroundColor = .systemBackground
        
        // 12!!!
        view.addSubview(homeFeedTable)
        
        // 14!!!
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // 23!!!
//        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        // 24!!!
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    
    // 13!!! Table view empty at this point. Need to populate so it can dequeue/render the cells
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}


// 15!!! Tack on functionality
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // !!!19
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // num rows
    }
    
    // Tells which cell we are dequeing for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello world"
//        cell.backgroundColor = .red
//        return cell
        
        // !!!18
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
