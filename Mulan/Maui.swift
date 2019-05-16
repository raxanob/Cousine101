//
//  Maui.swift
//  Mulan
//
//  Created by Nathalia Melare on 13/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation


typealias Receitasz = [Receitaz]

struct Receitaz: Codable {
    var ingredientes: [String]
    var modoDePreparo: [String]
    var nomeDaImagem: String
    var nomeDaReceita: String
}

class Intern: NSObject {
    static func getAllRecepies() -> Receitasz {
        var recepies: Receitasz = []
        do {
            if let path = Bundle.main.path(forResource: "teste", ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let recepiesData = try Data(contentsOf: url)
                recepies = try JSONDecoder().decode(Receitasz.self, from: recepiesData)
                return recepies
            }
        } catch {
            print("Erro")
        }
        return recepies
    }
    }
