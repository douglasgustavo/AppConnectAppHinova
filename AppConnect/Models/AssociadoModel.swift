//
//  AssociadoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct AssociadoModel: Codable {
    var cpf: String?
    var nome: String?
    var email: String?
    var telefoneCelular: String?
    var telefoneFixo: String?
    var veiculos: [Veiculos]?
    
    enum CodingKeys: String, CodingKey {
        case cpf, nome, email
        case telefoneCelular = "telefone_celular"
        case telefoneFixo = "telefone_fixo"
        case veiculos
    }
}

struct Veiculos: Codable {
    var placa: String?
    var situacao: String?
    var modelo: String?
    
    enum CodingKeys: String, CodingKey {
        case placa, situacao
        case modelo = "descricao_modelo"
    }
}


