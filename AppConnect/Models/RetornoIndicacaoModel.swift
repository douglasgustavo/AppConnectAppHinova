//
//  RetornoIndicacaoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct RetornoIndicacaoModel: Codable {
    var retornoErro: RetornoErro
    var sucesso: String?
    
    enum CodingKeys: String, CodingKey {
        case retornoErro = "RetornoErro"
        case sucesso = "Sucesso"
    }
}

struct RetornoErro: Codable {
    var retornoErro: String?
    
    enum CodingKeys: String, CodingKey {
        case retornoErro
    }
}
