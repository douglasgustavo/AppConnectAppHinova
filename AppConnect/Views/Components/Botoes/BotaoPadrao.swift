//
//  Botao.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

struct BotaoPadrao: View {
    var width: CGFloat = 200
    var height: CGFloat = 45
    
    var txtBotao: String = "Texto"
    
    var body: some View {
        ZStack{
            Color("principal")
            Text(txtBotao)
                .font(.title2)
                .foregroundColor(.white)
        }
        .frame(width: width, height: height)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.2), radius: 5, x: 3, y: 3)
    }
}

struct BotaoPadrao_Previews: PreviewProvider {
    static var previews: some View {
        BotaoPadrao()
    }
}
