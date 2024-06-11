//
//  Anuncio.swift
//  fiap-app-ios
//
//  Created by Erica Okamura on 11/06/24.
//

import Foundation

struct Anuncio: Codable, Identifiable {
    
    
    var id: Int
    
    var nomeUsuario: String
    
    var titulo: String

    var descricao: String

    var tipoAnuncio: String
    
    var disponibilidade: Bool

    var preco: Int32
    
    var dataHoraPublicacao: Date
    
    var fotoAnuncio: [UInt8]
    
    init(_ id: Int, _ nomeUsuario: String, _ titulo: String, _ descricao: String, _ tipoAnuncio: String,
         _ disponibilidade: Bool, _ preco: Int32, _ dataHoraPublicacao: Date,  _ fotoAnuncio: [UInt8]) {
        self.id = id
        self.nomeUsuario = nomeUsuario
        self.titulo = titulo
        self.descricao = descricao
        self.tipoAnuncio = tipoAnuncio
        self.disponibilidade = disponibilidade
        self.preco = preco;
        self.dataHoraPublicacao = dataHoraPublicacao
        self.fotoAnuncio = fotoAnuncio
    }
}
