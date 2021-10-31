//
//  HomeViewModel.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    let assocSrv: AssociadoService = AssociadoService()
    let coreData: CoreDataService = CoreDataService()
    
    func deslogarUsuario() {
        coreData.deslogarAssociadoCoreData()
    }
}
