//
//  TextFieldSeguro.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

struct TextFieldSeguro: View {
    @Binding var textoDigitado: String
    
    var label: String = "Texto"
    var placeholder: String = "Digite o texto"
    var icone: String = "lock.fill"
    var inputType: UIKeyboardType = .default
    
    var width: CGFloat = 250
    var height: CGFloat = 45
    
    var body: some View {
        VStack{
            HStack {
                Text(label)
                    .foregroundColor(Color.txtSecundario)
                Spacer()
            }
            
            HStack{
                SecureField(placeholder, text: $textoDigitado)
                    .foregroundColor(Color.txtPrincipal)
                    .keyboardType(inputType)
                Image(systemName: icone)
                    .foregroundColor(Color.principal)
            }
            
            Rectangle()
                .fill(Color.principal)
                .frame(width: width, height: 1)
        }
        .frame(width: width, height: height)
    }
}

struct TextFieldSeguro_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldSeguro(textoDigitado: .constant(""))
    }
}
