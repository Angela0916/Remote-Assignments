//
//  ViewController.swift
//  week4-3-Station
//
//  Created by Angela  Pan on 2023/9/24.
//

import UIKit

struct StationInfo: Codable {
    let stationID: String
    let stationName: String
    let stationAddress: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func fetchData() {
        if let url = URL(string: "https://remote-assignment.s3.ap-northeast-1.amazonaws.com/station") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let stationInfo = try decoder.decode(StationInfo.self, from: data)
                        
                        DispatchQueue.main.async {
                            self.stationIDLabel.text = "\(stationInfo.stationID)"
                            self.stationNameLabel.text = "\(stationInfo.stationName)"
                            self.addressLabel.text = "\(stationInfo.stationAddress)"
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
}

