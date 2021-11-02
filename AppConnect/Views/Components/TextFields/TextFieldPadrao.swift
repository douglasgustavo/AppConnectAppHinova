//
//  TextFieldPadrao.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

struct TextFieldPadrao: View {
    @Binding var textoDigitado: String
    
    var label: String = "Texto"
    var placeholder: String = "Digite"
    var icone: String = "person.fill"
    var inputType: UITextContentType = .emailAddress
    var mascara: MascaraTextFieldEnum = .nenhum
    
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
                TextField(placeholder, text: $textoDigitado)
                    .foregroundColor(Color.txtPrincipal)
                    .textContentType(inputType)
                    .keyboardType(TextContentToKeyboardType.converter(inputType: inputType))
                
                Image(systemName: icone)
                    .foregroundColor(Color.principal)
            }
            
            Rectangle()
                .fill(Color.principal)
                .frame(width: width, height: 1)
        }
        .frame(width: width, height: height)
        .padding(.top)
    }
}

struct TextFieldPadrao_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPadrao(textoDigitado: .constant(""))
    }
}
