//
//  NewLoginView.swift
//  AppConnect
//
//  Created by Douglas Santos on 02/11/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm: LoginViewModel = LoginViewModel()
    @EnvironmentObject var loginState: UsuarioStateObject
    @EnvironmentObject var alerta: AlertaStateObject
    
    var body: some View {
        VStack{
            headerTelaLogin
            campoInput
        }
        .keyboardResponsive()
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .edgesIgnoringSafeArea(.top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

extension LoginView {
    var headerTelaLogin: some View {
        ZStack{
            Image("fundo")
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill(Color.principal.opacity(0.7))
                
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
    }
}

extension LoginView {
    var campoInput: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .padding(.top, -40)
            campos
        }
    }
}

extension LoginView {
    var campos: some View {
        VStack (alignment: .leading){
            VStack(alignment: .leading){
                Text("Login")
                    .font(.title)
                    .foregroundColor(Color.txtPrincipal)
                
                Text("Bem vindo à Hinova Mobile!")
                    .font(.headline)
                    .foregroundColor(Color.txtSecundario)
            }
            Spacer()
            VStack{
                TextFieldPadrao(
                    textoDigitado: self.$vm.cpfAssociado,
                    label: "CPF",
                    placeholder: "Digite seu CPF",
                    icone: "person.text.rectangle.fill",
                    inputType: .cpf,
                    width: UIScreen.main.bounds.width - 50
                )
            }
            Spacer()
            botaoEntrar
            Spacer()
        }
        
    }
}

extension LoginView {
    var botaoEntrar: some View {
        Button {
            if verificaCampoCpf() {
                UIApplication.shared.fechaTeclado()
                logaUsuario()
            }
        } label: {
            BotaoPadrao(width: UIScreen.main.bounds.width - 50, txtBotao: "Entrar")
        }
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
                self.alerta.txtTitulo = ""
                self.alerta.txtSubTitulo = ""
            }
            return false
        } else if self.vm.cpfAssociado.count < 11 {
            self.alerta.estaMostrando.toggle()
            self.alerta.txtTitulo = "Erro"
            self.alerta.txtSubTitulo = "Você deve digitar um CPF válido!"
            self.alerta.tipoAlerta = .error(.red)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
                self.alerta.txtTitulo = ""
                self.alerta.txtSubTitulo = ""
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
                    self.alerta.txtTitulo = ""
                    self.alerta.txtSubTitulo = ""
                }
            }
        }
    }
}
