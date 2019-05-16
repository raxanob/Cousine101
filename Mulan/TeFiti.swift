//
//  TeFiti.swift
//  Mulan
//
//  Created by Nathalia Melare on 14/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

typealias Tutorialz = [Tutorial]

struct Tutorial: Codable {
    var dicas: String
    var nomedaimagem: String
    var nomeDaDica: String
}

class Intern2: NSObject {
    static func getAllTutoriall() -> Tutorialz {
        var tutoriall: Tutorialz = []
        do {
            if let path = Bundle.main.path(forResource: "teste2", ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let tutoriallData = try Data(contentsOf: url)
                tutoriall = try JSONDecoder().decode(Tutorialz.self, from: tutoriallData)
                return tutoriall
            }
        } catch {
            print("Erro")
        }
        return tutoriall
}
}
