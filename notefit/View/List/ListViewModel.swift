//
//  ListViewModel.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 21/10/22.
//

import UIKit
import Combine

final class ListViewModel: ObservableObject {
    @Published private(set) var list: Result<[Exercise], Error>?
    
    func readLocalList() async throws {
        do {
            if let bundlePath = Bundle.main.path(forResource: "exercises",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                list = .success(try JSONDecoder().decode([Exercise].self, from: jsonData))
            }
        } catch {
            list = .failure(error)
        }
    }
}
