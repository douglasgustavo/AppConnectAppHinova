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
        ScrollView(.vertical, showsIndicators: false) {
            VStack (spacing: 50) {
                txtInputView
                    .padding(.horizontal)
                
                HStack (spacing: 20){
                    
                    Button {
                        UIApplication.shared.fechaTeclado()
                        if verificaCampos() {
                            self.indicaAmigo()
                        }
                    } label: {
                        Text("Indicar")
                            .font(.system(size: 25, weight: .semibold, design: .default))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.8))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 3, y: 3)
                            
                    }
                    
                    Button {
                        UIApplication.shared.fechaTeclado()
                        vm.nomeAmigo = ""
                        vm.telefoneAmigo = ""
                        vm.emailAmigo = ""
                    } label: {
                        Text("Limpar")
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 3, y: 3)
                    }
                }
                .padding(.horizontal)

            }
        }
        .environmentObject(vm)
        .navigationTitle("Indique um Amigo!")
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
    var txtInputView: some View {
        VStack(spacing: 30){
            InputLabelView(input: $vm.nomeAmigo, placeholder: "Digite o nome do seu amigo", txtLabel: "Nome: ")
            InputLabelView(input: $vm.telefoneAmigo, placeholder: "Digite o telfone do seu amigo", txtLabel: "Telefone: ")
                .keyboardType(.numberPad)
            InputLabelView(input: $vm.emailAmigo, placeholder: "Digite o e-mail do seu amigo", txtLabel: "E-mail: ")
                .keyboardType(.emailAddress)
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
                }
            case .erro:
                self.alerta.txtTitulo = "Erro ao realizar indicação"
                self.alerta.txtSubTitulo = "Por favor, tente mais tarde!"
                self.alerta.tipoAlerta = .complete(Color.red)
                self.alerta.estaMostrando = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.alerta.estaMostrando = false
                }
            }
        }
    }
}
