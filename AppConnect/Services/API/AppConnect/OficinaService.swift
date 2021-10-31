//
//  OficinasService.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import Alamofire

class OficinaService {
    
    func obterOficinas(cpfAssociado: String, completion: @escaping (OficinaModel) -> Void) {
        
        AF.request("\(Constantes.URL_BASE_APPCONNECT)/Api/Oficina?codigoAssociacao=601&cpfAssociado=\(cpfAssociado)",
                   method: .get,
                   headers: HTTPHeaders(["Content-Type": "application/json"]))
            .responseData { response in
            
            if let data = response.data {
                do {
                    let dados = try JSONDecoder().decode(OficinaModel.self, from: data)
                    completion(dados)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    
    }
    
}
