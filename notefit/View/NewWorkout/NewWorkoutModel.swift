//
//  NewWorkoutModel.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import Foundation
// todo da cancellare con merge List
struct Exercise: Codable {
    let bodyPart: String
    let equipment: String
    let gifUrl: URL
    let id: String
    let name: String
    let target: String
}

struct NewExercise: Codable {
    let exercise: Exercise
    let serie:  Int
    let ripetizioni: Int
    let recupero: TimeInterval

}

