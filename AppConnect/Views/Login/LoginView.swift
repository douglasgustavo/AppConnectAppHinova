//
//  LoginView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm: LoginViewModel = LoginViewModel()
    @EnvironmentObject var loginState: UsuarioStateObject
    @EnvironmentObject var alerta: AlertaStateObject
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("azulHinova").opacity(0.1), Color("azulHinova").opacity(0.05)]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30){
                VStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    HStack (spacing: 0){
                        Text("APP")
                            .font(.system(size: 40, weight: .bold, design: .default))
                        Text("Connect")
                            .font(.system(size: 40, weight: .regular, design: .default))
                    }
                    .foregroundColor(Color("azulHinova"))
                    
                }
                Spacer()
                
                
                TextField("Digite seu CPF", text: $vm.cpfAssociado)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 55, alignment: .center)
                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
                    .keyboardType(.numberPad)
                
                Spacer()
                
                Button {
                    UIApplication.shared.fechaTeclado()
                    if verificaCampoCpf() {
                        logaUsuario()
                    }
                } label: {
                    Text("Entrar")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 55, alignment: .center)
                        .background(Color("azulHinova"))
                        .cornerRadius(15)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 5, y: 5)
                }
                Spacer()
                Spacer()
            }
        }
        .environmentObject(vm)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    
    func verificaCampoCpf() -> Bool {
        if self.vm.cpfAssociado == "" {
            self.alerta.estaMostrando.toggle()
            self.alerta.txtTitulo = "Erro"
            self.alerta.txtSubTitulo = "Você deve digitar um CPF!"
            self.alerta.tipoAlerta = .error(.red)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
            }
            return false
        } else if self.vm.cpfAssociado.count < 11 {
            self.alerta.estaMostrando.toggle()
            self.alerta.txtTitulo = "Erro"
            self.alerta.txtSubTitulo = "Você deve digitar um CPF válido!"
            self.alerta.tipoAlerta = .error(.red)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
            }
            return false
        } else {
            return true
        }
    }
    
    func logaUsuario() {
        self.alerta.tipoAlerta = .loading
        self.alerta.txtTitulo = ""
        self.alerta.txtSubTitulo = ""
        self.alerta.estaMostrando.toggle()
        
        vm.logarAssociado{ result in
            self.alerta.estaMostrando.toggle()
            self.loginState.usuarioLogado = self.vm.associadoLogado
            self.loginState.usuarioEstaLogado = result
            if !result {
                self.alerta.estaMostrando.toggle()
                self.alerta.txtTitulo = "Erro"
                self.alerta.txtSubTitulo = "CPF inválido ou não cadastrado!"
                self.alerta.tipoAlerta = .error(.red)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.alerta.estaMostrando = false
                }
            }
        }
    }
}
