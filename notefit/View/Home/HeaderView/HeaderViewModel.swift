//
//  HeaderViewModel.swift
//  notefit
//
//  Created by Pierluigi Di paolo on 26/10/22.
//

import UIKit
import Combine

final class HeaderViewModel: ObservableObject {
    @Published private(set) var result: Result<String, Error>?
    func fetch()  async throws{
        do {
            result = .success("Pierluigi")
        }catch {
            result = .failure(error)
        }
    }
}
