//
//  IndicacaoView.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import SwiftUI

struct IndicacaoView: View {
    @StateObject var vm: IndicacaoViewModel = IndicacaoViewModel()
    @EnvironmentObject var usuario: UsuarioStateObject
    @EnvironmentObject var alerta: AlertaStateObject
    
    var body: some View {
        VStack{
            headerTelaIndicacao
            campoInput
        }
        .navigationBarHidden(true)
        .keyboardResponsive()
        .environmentObject(vm)
        .edgesIgnoringSafeArea(.top)
        .onTapGesture {
            UIApplication.shared.fechaTeclado()
        }
    }
}

struct IndicacaoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IndicacaoView()
        }
    }
}

extension IndicacaoView {
    
    func verificaCampos() -> Bool {
        if vm.nomeAmigo == "" {
            self.alerta.txtTitulo = "Atenção!"
            self.alerta.txtSubTitulo = "O nome deve ser preenchido, por favor verifique!"
            self.alerta.tipoAlerta = .error(.red)
            self.alerta.estaMostrando = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
                self.alerta.txtTitulo = ""
                self.alerta.txtSubTitulo = ""
            }
            return false
        }
        if vm.telefoneAmigo == "" {
            self.alerta.txtTitulo = "Atenção!"
            self.alerta.txtSubTitulo = "O telefone deve ser preenchido, por favor verifique!"
            self.alerta.tipoAlerta = .error(.red)
            self.alerta.estaMostrando = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
                self.alerta.txtTitulo = ""
                self.alerta.txtSubTitulo = ""
            }
            return false
        }
        if vm.emailAmigo == "" {
            self.alerta.txtTitulo = "Atenção!"
            self.alerta.txtSubTitulo = "O e-mail deve ser preenchido, por favor verifique!"
            self.alerta.tipoAlerta = .error(.red)
            self.alerta.estaMostrando = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.alerta.estaMostrando = false
                self.alerta.txtTitulo = ""
                self.alerta.txtSubTitulo = ""
            }
            return false
        }
        return true
    }
    
    func indicaAmigo() {
        self.alerta.tipoAlerta = .loading
        self.alerta.estaMostrando = true
        vm.indicarAmigo(cpf: self.usuario.usuarioLogado.cpf!) { status in
            switch status {
            case .sucesso:
                self.alerta.txtTitulo = "Indicação Registrada"
                self.alerta.tipoAlerta = .complete(Color.green)
                self.alerta.estaMostrando = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.alerta.estaMostrando = false
                    self.alerta.txtTitulo = ""
                    self.alerta.txtSubTitulo = ""
                }
            case .erro:
                self.alerta.txtTitulo = "Erro ao realizar indicação"
                self.alerta.txtSubTitulo = "Por favor, tente mais tarde!"
                self.alerta.tipoAlerta = .complete(Color.red)
                self.alerta.estaMostrando = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.alerta.estaMostrando = false
                    self.alerta.txtTitulo = ""
                    self.alerta.txtSubTitulo = ""
                }
            }
        }
    }
}

extension IndicacaoView {
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

extension IndicacaoView {
    var campos: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Indique já!")
                    .font(.title)
                    .foregroundColor(Color.txtPrincipal)
                
                Text("Indique agora seu amigo para um mundo de possibilidades!")
                    .font(.headline)
                    .foregroundColor(Color.txtSecundario)
            }
            .frame(width: UIScreen.main.bounds.width - 40,alignment: .leading)
            camposInput
            Spacer()
            botoes
            Spacer()
        }
        
    }
}

extension IndicacaoView {
    var headerTelaIndicacao: some View {
        ZStack{
            Image("indicacao")
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill(Color.principal.opacity(0.7))
                
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
    }
}

extension IndicacaoView {
    var camposInput: some View {
        VStack {
            Spacer()
            TextFieldPadrao(
                textoDigitado: $vm.nomeAmigo,
                label: "Nome",
                placeholder: "Digite o nome do seu amigo",
                icone: "person.fill",
                inputType: .name,
                mascara: .nenhum,
                width: UIScreen.main.bounds.width - 40
            )
            
            TextFieldPadrao(
                textoDigitado: $vm.telefoneAmigo,
                label: "Telefone",
                placeholder: "Digite o telefone do seu amigo",
                icone: "phone.fill",
                inputType: .telephoneNumber,
                mascara: .telefoneCelular,
                width: UIScreen.main.bounds.width - 40
            )
            
            TextFieldPadrao(
                textoDigitado: $vm.emailAmigo,
                label: "E-mail",
                placeholder: "Digite o e-mail do seu amigo",
                icone: "envelope.fill",
                inputType: .emailAddress,
                mascara: .nenhum,
                width: UIScreen.main.bounds.width - 40
            )
        }
    }
}

extension IndicacaoView {
    var botoes: some View {
        VStack (spacing: 20){
            Spacer()
            Button {
                UIApplication.shared.fechaTeclado()
                if verificaCampos() {
                    self.indicaAmigo()
                }
            } label: {
                Text("Indicar")
                    .font(.system(size: 25, weight: .semibold, design: .default))
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .background(Color.principal.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 3, y: 3)
            }
            Spacer()
        }
        .padding(.bottom)
    }
}
