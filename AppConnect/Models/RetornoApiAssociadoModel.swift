//
//  RetornoApiAssociadoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct RetornoApiAssociadoModel: Codable {
    var mensagem: String?
    var tokenUsuario: String?
    var error: ErroRetornoApiAssociado?
    
    enum CodingKeys: String, CodingKey {
        case mensagem
        case tokenUsuario = "token_usuario"
        case error
    }
}

struct ErroRetornoApiAssociado: Codable {
    var mensagem: String?
    var codigoErro: String?
    
    enum CodingKeys: String, CodingKey {
        case mensagem
        case codigoErro = "codigo_erro"
    }
}
