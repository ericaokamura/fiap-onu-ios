//
//  DadosAutenticacao.swift
//  fiap-app-ios
//
//  Created by Erica Okamura on 11/06/24.
//

import Foundation

struct DadosAutenticacao: Codable {
    
    
    var nomeUsuario: String
    
    var senha: String
    
    init(_ nomeUsuario: String, _ senha: String) {
        self.nomeUsuario = nomeUsuario
        self.senha = senha
    }
    
}
