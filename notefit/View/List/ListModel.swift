//
//  ListModel.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit

struct Exercise: Codable {
    let bodyPart: String
    let equipment: String
    let gifUrl: URL
    let id: String
    let name: String
    let target: String
}

