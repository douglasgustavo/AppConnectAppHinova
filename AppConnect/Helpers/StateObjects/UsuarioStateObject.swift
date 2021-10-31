//
//  UsuarioStateObject.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class UsuarioStateObject: ObservableObject {
    @Published var usuarioEstaLogado: Bool = false
    @Published var usuarioLogado: AssociadoModel = AssociadoModel(cpf: "", nome: "", email: "", telefoneCelular: "", telefoneFixo: "", veiculos: [])
}
