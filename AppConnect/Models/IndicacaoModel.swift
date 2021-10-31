//
//  IndicacaoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class IndicacaoModel: Codable {
    let indicacao: Indicacao
    let remetente: String?
    
    enum CodingKeys: String, CodingKey {
        case indicacao = "Indicacao"
        case remetente = "Remetente"
    }
}

struct Indicacao: Codable {
    let codigoAssociacao, dataCriacao, cpfAssociado, emailAssociado: String?
    let nomeAssociado, telefoneAssociado, placaAssociado, nomeAmigo: String?
    let telefoneAmigo, emailAmigo: String?
    
    enum CodingKeys: String, CodingKey {
        case codigoAssociacao = "CodigoAssociacao"
        case dataCriacao = "DataCriacao"
        case cpfAssociado = "CpfAssociado"
        case emailAssociado =  "EmailAssociado"
        case nomeAssociado = "NomeAssociado"
        case telefoneAssociado = "TelefoneAssociado"
        case placaAssociado = "PlacaVeiculoAssociado"
        case nomeAmigo = "NomeAmigo"
        case telefoneAmigo = "TelefoneAmigo"
        case emailAmigo = "EmailAmigo"
    }
}
