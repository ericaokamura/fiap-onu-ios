//
//  AnuncioService.swift
//  fiap-app-ios
//
//  Created by Erica Okamura on 11/06/24.
//

import Foundation

class AnuncioService {
    
    var token: String = ""
    
    func getLogin(_ dadosAutenticacao: DadosAutenticacao) async throws -> DadosToken {
        
        guard let url = URL(string: "http://localhost:8091/login") else {
            return DadosToken("")
        }

        let object = try JSONEncoder().encode(dadosAutenticacao)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = object
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) =  try await URLSession.shared.data(for: request)

        let returnObject = try JSONDecoder().decode(DadosToken.self, from: data)

        return returnObject
           
    }
    
    
    func retornarAnuncios(token: String) async throws -> [Anuncio] {
        
        guard let url = URL(string: "http://localhost:8091/anuncio/") else {
            return []
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let (data, _) =  try await URLSession.shared.data(for: request)
        
        print(data);
        
        let returnObject = try JSONDecoder().decode([Anuncio].self, from: data)
        return returnObject
            
    }
}
