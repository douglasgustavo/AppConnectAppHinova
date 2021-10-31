//
//  InputLabelView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct InputLabelView: View {
    @Binding var input: String
    var placeholder: String = "Digite seu nome"
    var txtLabel: String = "Nome: "
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text(txtLabel)
                .font(.system(size: 25, weight: .bold, design: .default))
            
            TextField(placeholder, text: $input)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 3, x: 3, y: 3)
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
    }
}

struct InputLabelView_Previews: PreviewProvider {
    static var previews: some View {
        InputLabelView(input: .constant(""))
    }
}
