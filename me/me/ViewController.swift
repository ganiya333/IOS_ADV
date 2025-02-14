//
//  ViewController.swift
//  me
//
//  Created by Ganiya Nursalieva on 13.02.2025.
//

import UIKit

struct Hobbie {
    let title: String
    let description: String
   let coverIM: UIImage
}

class ViewController: UIViewController {
    
    let My_hobbies: [Hobbie] = [
        Hobbie(title: "Piano", description: "Playing piano about 5-6 years", coverIM: UIImage(named: "piano") ?? UIImage()),
        Hobbie(title: "Volleyball", description: "Player of Almaty Beach Voleyball team", coverIM: UIImage(named: "Volleyball") ?? UIImage()),
        Hobbie(title: "Dancing", description: "Dancing whole of my life", coverIM: UIImage(named: "dance") ?? UIImage()),
        
        
    ]
   
    @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
       
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return My_hobbies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! TableViewCell
        let hobbie = My_hobbies[indexPath.row]

        cell.configure(with: hobbie)

        return cell
    }
}
