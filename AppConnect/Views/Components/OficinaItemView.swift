//
//  OficinaItemView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct OficinaItemView: View {
    var imagem: String = ""
    var nome: String = "Nome"
    var descricao: String = "Descrição"
    var avaliacao: String = "0.0"
    var telefone: String = "31 3333 3333"
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray.opacity(0.15))
            
            HStack{
                Image(base64String: imagem)!
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 100)
                    .padding(.trailing, 5)
                
                VStack (alignment: .leading, spacing: 5){
                    ItemOficinaItemView(texto: nome)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    ItemOficinaItemView(icone: "text.aligncenter", texto: descricao)
                        .lineLimit(2)
                    ItemOficinaItemView(icone: "star", texto: avaliacao)
                    ItemOficinaItemView(icone: "phone.fill", texto: telefone)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .frame(height: 170)
        .cornerRadius(15)
    }
}

struct OficinaItemView_Previews: PreviewProvider {
    static var previews: some View {
        OficinaItemView()
    }
}

struct ItemOficinaItemView: View {
    var icone: String = ""
    var texto: String = ""
    
    var body: some View {
        HStack{
            if icone != "" {
                Image(systemName: icone)
            }
            Text(texto)
        }
    }
}
