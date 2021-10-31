//
//  MainView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI
import AlertToast

struct MainView: View {    
    @StateObject var usuario: UsuarioStateObject = UsuarioStateObject()
    @StateObject var alerta: AlertaStateObject = AlertaStateObject()
    @StateObject var vm: MainViewModel = MainViewModel()
    
    let cd: CoreDataService = CoreDataService()
    
    var body: some View {
        ZStack {
            NavigationView {
                if usuario.usuarioEstaLogado {
                    HomeView()
                } else {
                    LoginView()
                }
            }
            alertaView
        }
        .environmentObject(usuario)
        .environmentObject(alerta)
        .environmentObject(vm)
        .toast(isPresenting: $alerta.estaMostrando, duration: 2, tapToDismiss: true) {
            verificaAlerta()
        }
        .onAppear(perform: obterUsuarioLogado)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    var alertaView: some View {
        ZStack{
            if self.alerta.estaMostrando {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .animation(.easeInOut)
    }
}

extension MainView {
    func obterUsuarioLogado(){
        cd.obterAssociadoLogadoCoreData { associado, error in
            if let error = error {
                print(error.localizedDescription)
                self.usuario.usuarioEstaLogado = false
            } else {
                if let associado = associado {
                    print("Usuário logado: " + associado.nome!)
                    self.usuario.usuarioEstaLogado = true
                    
                    self.usuario.usuarioLogado.nome = associado.nome
                    self.usuario.usuarioLogado.cpf = associado.cpf
                    self.usuario.usuarioLogado.email = associado.email
                    self.usuario.usuarioLogado.telefoneFixo = associado.telefone
                    self.usuario.usuarioLogado.telefoneCelular = associado.telefone
                } else {
                    self.usuario.usuarioEstaLogado = false
                }
            }
        }
    }
    
    func verificaAlerta() -> AlertToast {
        if self.alerta.txtTitulo == "" {
            return AlertToast(type: alerta.tipoAlerta)
        } else if self.alerta.txtSubTitulo == "" {
            return AlertToast(type: alerta.tipoAlerta, title: alerta.txtTitulo)
        } else {
            return AlertToast(type: alerta.tipoAlerta, title: alerta.txtTitulo, subTitle: alerta.txtSubTitulo)
        }
    }
}
