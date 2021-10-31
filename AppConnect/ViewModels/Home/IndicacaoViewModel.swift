//
//  IndicacaoViewModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class IndicacaoViewModel: ObservableObject {
    @Published var nomeAmigo: String = "Douglas"
    @Published var telefoneAmigo: String = "3199999999"
    @Published var emailAmigo: String = "douglas@hinova.com.br"
    
    let service: IndicacaoService = IndicacaoService()
    let assocService: AssociadoService = AssociadoService()
    
    func indicarAmigo(cpf: String, completion: @escaping (SucessoIndicacao) -> Void) {
        
        obterDadosAssociado(cpf: cpf) { associado in
            let associadoRetornado = IndicacaoModel(indicacao: Indicacao(
                codigoAssociacao: "601",
                dataCriacao: GetData.getData(),
                cpfAssociado: associado.cpf,
                emailAssociado: associado.email,
                nomeAssociado: associado.nome,
                telefoneAssociado: associado.telefoneFixo ?? associado.telefoneCelular ?? "",
                placaAssociado: associado.veiculos?.count ?? 0 > 0 ? associado.veiculos?[0].placa : "",
                nomeAmigo: self.nomeAmigo,
                telefoneAmigo: self.telefoneAmigo,
                emailAmigo: self.emailAmigo
            ),
                remetente: associado.email
            )
            print(associadoRetornado)
            self.service.indicarAmigo(indicado: associadoRetornado) { indicacao in
                if indicacao.sucesso == nil {
                    print(indicacao)
                    completion(.erro)
                } else {
                    completion(.sucesso)
                }
            }
        }
        
        
    }
    
    func obterDadosAssociado(cpf: String, completion: @escaping (AssociadoModel) -> Void) {
        assocService.obterAssociado(cpfAssociado: cpf) { associado, error in
            if error == nil {
                if let resultado = associado {
                    completion(resultado)
                }
            }
        }
    }
    
    
}

enum SucessoIndicacao {
    case sucesso
    case erro
}
