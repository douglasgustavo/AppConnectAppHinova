//
//  OficinaModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

struct OficinaModel: Codable {
    var listaOficinas: [ListaOficina]?

    enum CodingKeys: String, CodingKey {
        case listaOficinas = "ListaOficinas"
    }
}

struct ListaOficina: Codable {
    var id: String? = UUID().uuidString
    var nome, descricao, descricaoCurta, endereco, foto: String?
    var latitude, longitude: String?
    var avaliacaoUsuario, codigoAssociacao: Int?
    var email, telefone1, telefone2: String?
    var ativo: Bool?

    enum CodingKeys: String, CodingKey {
        case nome = "Nome"
        case descricao = "Descricao"
        case descricaoCurta = "DescricaoCurta"
        case endereco = "Endereco"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case foto = "Foto"
        case avaliacaoUsuario = "AvaliacaoUsuario"
        case codigoAssociacao = "CodigoAssociacao"
        case email = "Email"
        case telefone1 = "Telefone1"
        case telefone2 = "Telefone2"
        case ativo = "Ativo"
    }
}

