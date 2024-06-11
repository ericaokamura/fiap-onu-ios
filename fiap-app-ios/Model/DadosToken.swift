//
//  DadosToken.swift
//  fiap-app-ios
//
//  Created by Erica Okamura on 11/06/24.
//

import Foundation

struct DadosToken: Codable {
    
    var token: String
    
    init(_ token: String) {
        self.token = token
    }
    
}
