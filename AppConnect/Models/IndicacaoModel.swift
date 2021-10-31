//
//  IndicacaoModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct IndicacaoModel: Codable {
    var indicacao: Indicacao?
    var remetente: String?
    
    enum CodingKeys: String, CodingKey {
        case indicacao = "Indicacao"
        case remetente = "Remetente"
    }
}

struct Indicacao: Codable {
    var codigoAssociacao, dataCriacao, cpfAssociado, emailAssociado: String?
    var nomeAssociado, telefoneAssociado, placaAssociado, nomeAmigo: String?
    var telefoneAmigo, emailAmigo: String?
    
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
