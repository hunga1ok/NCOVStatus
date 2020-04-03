//
//  APIManager.swift
//  NCOV Status
//
//  Created by LeHung on 4/3/20.
//  Copyright © 2020 LeHung. All rights reserved.
//

import Foundation

protocol APIManagerDelegate {
    func didUpdateData(_ covidDatas: [CovidData])
    func didFailWithError(error: Error)
}

struct APIManager {
    let baseURL = "https://ncovi.huynhhieu.com/api.php?code=external"
    
    var delegate: APIManagerDelegate?
    
    func fetchData() {
        performRequest(with: baseURL)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let baseData = self.parseJSON(data: safeData) {
                        self.delegate?.didUpdateData(baseData.data)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(data: Data) -> BaseData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BaseData.self, from: data)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
