//
//  ViewController.swift
//  week4-3-Station
//
//  Created by Angela  Pan on 2023/9/24.
//

import UIKit

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
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let dict = json as? [String: Any] {
                            if let stationID = dict["stationID"] as? String,
                               let stationName = dict["stationName"] as? String,
                               let stationAddress = dict["stationAddress"] as? String {
                                DispatchQueue.main.async {
                                    self.stationIDLabel.text = "\(stationID)"
                                    self.stationNameLabel.text = "\(stationName)"
                                    self.addressLabel.text = "\(stationAddress)"
                                }
                            }
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

