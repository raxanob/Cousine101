//
//  Tutoriais.swift
//  Mulan
//
//  Created by Nathalia Melare on 09/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit


class TutorialViewController: UITableViewController {
    var tutorial: Tutorialz = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorial = Intern2.getAllTutoriall()
        tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorial.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tutorialCellCard") as? TutorialCellCards {
            cell.tutorialCellCard.image = UIImage(named: tutorial[indexPath.row].nomedaimagem)
            return cell
            
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tutorials = tutorial[indexPath.row]
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaginaTutorial") as? PaginaTutorial {
            viewController.dicas = tutorials
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
   
    
}
