//
//  BuscarAssociado.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import Alamofire

class AssociadoService {
    
    func obterApiKey(completion: @escaping (String) -> Void) {
        
        AF.request("\(Constantes.URL_BASE_SGA)/usuario/autenticar",
                                 method: .post,
                                 parameters: Constantes.USUARIO_SGA,
                                 headers: HTTPHeaders([.authorization(bearerToken: Constantes.API_KEY_SGA),.accept("application/json")]))
            .responseData { response in
                
                if let data = response.data {
                do {
                    let dados = try JSONDecoder().decode(RetornoApiAssociadoModel.self, from: data)
                    if let apiToken = dados.tokenUsuario {
                        completion(apiToken)
                    }
                } catch let error {
                    print("Erro API Token: " + error.localizedDescription)
                }
            }
        }
        
    }
    
    func obterAssociado(cpfAssociado: String, completion: @escaping (AssociadoModel?, Error?) -> Void) {
        
        self.obterApiKey { apiKey in
            
            AF.request("\(Constantes.URL_BASE_SGA)/associado/buscar/\(cpfAssociado)",
                       method: .get,
                       headers: HTTPHeaders([.authorization(bearerToken: apiKey),.contentType("application/json")]))
                .responseData { response in
                    
                if let data = response.data {
                    do {
                        let dados = try JSONDecoder().decode(AssociadoModel.self, from: data)
                        completion(dados, nil)
                    } catch let error {
                        completion(nil, error)
                        print("Erro obter associado: " + error.localizedDescription)
                    }
                }
            }
            
        }
        
    }
    
}
