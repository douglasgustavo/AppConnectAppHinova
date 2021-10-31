//
//  IndicacaoService.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import Alamofire

class IndicacaoService {
    
    static func indicarAmigo(indicado: IndicacaoModel, completion: @escaping (RetornoIndicacaoModel) -> Void) {
        
        AF.request("\(Constantes.URL_BASE_APPCONNECT)/api/Indicacao",
                   method: .post,
                   parameters: indicado,
                   headers: HTTPHeaders(["Content-Type": "application/json"]))
            .responseData { response in
            
            if let data = response.data {
                do {
                    let dados = try JSONDecoder().decode(RetornoIndicacaoModel.self, from: data)
                    completion(dados)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
