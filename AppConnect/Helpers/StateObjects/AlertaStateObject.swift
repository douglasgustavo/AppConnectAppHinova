//
//  MensagemStateObject.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation
import AlertToast

class AlertaStateObject: ObservableObject {
    @Published var estaMostrando: Bool = false
    @Published var txtTitulo: String = ""
    @Published var txtSubTitulo: String = ""
    @Published var tipoAlerta: AlertToast.AlertType = .error(.red)
    @Published var duracao: Double = 2
}
