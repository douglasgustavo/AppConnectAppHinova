//
//  IndicacaoService.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import Alamofire

class IndicacaoService {
    
    func indicarAmigo(indicado: IndicacaoModel, completion: @escaping (RetornoIndicacaoModel) -> Void) {
        
        AF.request("\(Constantes.URL_BASE_APPCONNECT)/api/Indicacao",
                   method: .post,
                   parameters: indicado,
                   encoder: URLEncodedFormParameterEncoder(destination: .httpBody))
            .responseData { response in
            
            if let data = response.data {
                do {
                    debugPrint(response.debugDescription)
                    let dados = try JSONDecoder().decode(RetornoIndicacaoModel.self, from: data)
                    completion(dados)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
