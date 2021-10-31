//
//  MensagemStateObject.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class MensagemStateObject: ObservableObject {
    @Published var estaMostrando: Bool = false
    @Published var txtTituloMensagem: String = ""
    
}
