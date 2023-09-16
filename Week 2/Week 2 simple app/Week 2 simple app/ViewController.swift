//
//  ViewController.swift
//  Week 2 simple app
//
//  Created by Angela  Pan on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1.0)
        let randomText = text.randomElement() ?? ""
        middleLabel.text = randomText
        view.backgroundColor = randomColor
    }
}
