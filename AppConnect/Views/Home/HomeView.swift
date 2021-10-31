//
//  HomeView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    @EnvironmentObject var alerta: AlertaStateObject
    @EnvironmentObject var loginState: UsuarioStateObject
    
    let assService: AssociadoService = AssociadoService()
    
    var body: some View {
            VStack{
                Text("Home View")
                Button {
                    self.vm.deslogarUsuario()
                    self.loginState.usuarioEstaLogado = false
                } label: {
                    Text("Sair")
                }

            }
            .environmentObject(vm)
            .navigationTitle("Home")
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
