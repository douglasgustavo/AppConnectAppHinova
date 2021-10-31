//
//  OficinasViewModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class OficinasViewModel: ObservableObject {
    let service: OficinaService = OficinaService()
    let coreData: CoreDataService = CoreDataService()
    
    @Published var listaOficinas: OficinaModel = OficinaModel(listaOficinas: [])
    
    func listarOficinas(cpf: String) {
        service.obterOficinas(cpfAssociado: cpf) { oficina in
            if let oficinasRetorno = oficina.listaOficinas {
                self.listaOficinas.listaOficinas = oficinasRetorno
            }
        }
    }
    
    func deslogarUsuario() {
        coreData.deslogarAssociadoCoreData()
    }
}
