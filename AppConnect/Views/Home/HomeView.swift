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
            TabView {
                NavigationView {
                    OficinasView()
                }
                .tabItem {
                    Label("Oficinas", systemImage: "car")
                }
                .tag(0)
                
                NavigationView {
                    IndicacaoView()
                }
                .tabItem {
                    Label("Indique um Amigo", systemImage: "person.2.wave.2")
                }
                .tag(1)
                    
            }
            .accentColor(.principal)
            .environmentObject(vm)
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
