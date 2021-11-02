//
//  LoginViewModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var erro: Bool = false
    @Published var cpfAssociado: String = ""
    @Published var associadoLogado: AssociadoModel = AssociadoModel(cpf: "", nome: "", email: "", telefoneCelular: "", telefoneFixo: "", veiculos: [])
    
    let assocSrv: AssociadoService = AssociadoService()
    let coreData: CoreDataService = CoreDataService()
    
    func logarAssociado(completion: @escaping (Bool) -> Void) {
        
        assocSrv.obterAssociado(cpfAssociado: cpfAssociado) { associado, error in
            
            if let associadoLogado = associado {
                if associadoLogado.nome != nil {
                    self.coreData.cadastrarAssociadoCoreData(associado: associadoLogado) { retorno, error in
                        if let associadoRetorno = retorno {
                            self.associadoLogado.nome = associadoRetorno.nome
                            self.associadoLogado.cpf = associadoRetorno.cpf
                            self.associadoLogado.email = associadoRetorno.email
                            self.associadoLogado.telefoneFixo = associadoRetorno.telefone
                            self.associadoLogado.telefoneCelular = associadoRetorno.telefone
                            completion(true)
                        } else {
                            self.erro = true
                        }
                    }
                } else {
                    self.erro = true
                    completion(false)
                }
                
            } else {
                self.erro = true
                completion(false)
                print(error?.localizedDescription)
            }
            
        }
        
    }
    
    
    
}
