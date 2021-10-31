//
//  RetornoApiAssociadoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct RetornoApiAssociadoModel: Codable {
    let mensagem: String?
    let tokenUsuario: String?
    let error: ErroRetornoApiAssociado?
    
    enum CodingKeys: String, CodingKey {
        case mensagem
        case tokenUsuario = "token_usuario"
        case error
    }
}

struct ErroRetornoApiAssociado: Codable {
    let mensagem: String?
    let codigoErro: String?
    
    enum CodingKeys: String, CodingKey {
        case mensagem
        case codigoErro = "codigo_erro"
    }
}
