//
//  RetornoIndicacaoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct RetornoIndicacaoModel: Codable {
    let retornoErro: RetornoErro
    let sucesso: String?
    
    enum CodingKeys: String, CodingKey {
        case retornoErro = "RetornoErro"
        case sucesso = "Sucesso"
    }
}

struct RetornoErro: Codable {
    let retornoErro: String?
    
    enum CodingKeys: String, CodingKey {
        case retornoErro
    }
}
