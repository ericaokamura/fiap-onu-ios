//
//  ContentView.swift
//  fiap-app-ios
//
//  Created by Erica Okamura on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var anuncios: [Anuncio] = []
    
    var service = AnuncioService()
    
    @State private var images: [UIImage] = []

    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        Section() {
                            ForEach(images, id: \.self) { image in
                                HStack {
                                    Image(uiImage: image)
                                        .frame(width: 80)
                                        .lineLimit(nil)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                    Divider()
                                }
                            }
                        }
                    }
                    .background(Color.white)
                    .listStyle(InsetGroupedListStyle())
                    .task {
                        do {
                            self.anuncios = try await getAnuncios()
                            self.images = try await getImages(self.anuncios)
                        } catch {
                            print(String(describing: error))
                        }
                    }
                }
                .background(Color.white)
            }
        }
    
    func getAnuncios() async throws -> [Anuncio] {
        var dadosToken = DadosToken("")
        var dados = DadosAutenticacao("ericaokamura", "12345678")
        do {
            try await dadosToken = service.getLogin(dados)
            return try await service.retornarAnuncios(token: dadosToken.token)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func getImages(_ anuncios: [Anuncio]) async throws -> [UIImage] {
        var images: [UIImage] = []
        anuncios.forEach { anuncio in
            let data = NSData(bytes: anuncio.fotoAnuncio, length: anuncio.fotoAnuncio.count)
            images.append(UIImage(data: data as Data)!)
        }
        return images
    }

}

#Preview {
    ContentView()
}
