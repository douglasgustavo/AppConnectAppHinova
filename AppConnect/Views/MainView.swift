//
//  MainView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var usuario: UsuarioStateObject
    var body: some View {
        if usuario.usuarioEstaLogado {
            HomeView()
        } else {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
