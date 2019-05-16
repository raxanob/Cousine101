//
//  PaginaReceitas.swift
//  Mulan
//
//  Created by Nathalia Melare on 09/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import UIKit

class Receitas: UITableViewController {
    
    var recepies: Receitasz = []
    
    override func viewDidLoad() {
//        tableView.estimatedRowHeight = 150
        
        super.viewDidLoad()
        recepies = Intern.getAllRecepies()
        

        tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "imagemCard") as? ReceitaCellCards {
            cell.imagemView.image = UIImage(named: recepies[indexPath.row].nomeDaImagem)
            return cell
 
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recepie = recepies[indexPath.row]
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaginaReceita") as? PaginaReceita {
            viewController.comidinha = recepie
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
}
