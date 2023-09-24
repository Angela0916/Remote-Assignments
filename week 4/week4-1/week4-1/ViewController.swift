//
//  ViewController.swift
//  week4-1
//
//  Created by Angela  Pan on 2023/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }

    //MARK: - UITableViewDataSource Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10 // section 1 有 10 行
        } else {
            return 5 // section 2 有 5 行
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)

        // 設定每行顯示要求的文字（相對應的 section 和 row）
        if indexPath.section == 0 {
            cell.textLabel?.text = "This is section 0, row \(indexPath.row)"
        } else {
            cell.textLabel?.text = "This is section 1, row \(indexPath.row)"
        }

        return cell
    }
    }
