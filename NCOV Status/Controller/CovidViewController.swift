//
//  ViewController.swift
//  NCOV Status
//
//  Created by LeHung on 4/3/20.
//  Copyright © 2020 LeHung. All rights reserved.
//

import UIKit

class CovidViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var apiManager = APIManager()
    var data: [CovidData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CovidCell", bundle: nil), forCellReuseIdentifier: "CovidCell")
        apiManager.fetchData()
    }

    func loadData(data: [CovidData]) {
        self.data = data
    }
}

extension CovidViewController: APIManagerDelegate {
    func didUpdateData(_ covidDatas: [CovidData]) {
        DispatchQueue.main.async {
            self.loadData(data: covidDatas)
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

extension CovidViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CovidCell", for: indexPath) as! CovidCell
        
        cell.setData(data: data[indexPath.row])
        
        return cell
    }
    
    
}

extension CovidViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
